package com.tos.controller;

import com.alibaba.fastjson.JSONArray;
import com.tos.pojo.Bill;
import com.tos.pojo.Passenger;
import com.tos.service.BillService;
import com.tos.util.Constants;
import com.tos.util.PDFOutput;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/bill")
public class BillController {

    @Autowired
    private BillService billService;

    @RequestMapping("/toBillPage")
    public String toBillPage(HttpServletRequest request) {
        List<Bill> billList = getBills(request);
        request.setAttribute("billList",billList);
        return "billPage";
    }

    @RequestMapping("/getBills")
    public List<Bill> getBills(HttpServletRequest request) {
        Passenger passenger = (Passenger)request.getSession().getAttribute(Constants.Passenger_SESSION);
        return billService.getBills(passenger.getPhone());
    }

/*    @RequestMapping("/getBills")
    public void getBills(HttpServletRequest request) {
        String pageIndex = request.getParameter("pageIndex");
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        currentPageNo = Integer.parseInt(pageIndex);
        //总数量（表）
        Passenger passenger = (Passenger)request.getSession().getAttribute(Constants.Passenger_SESSION);
        List<Bill> billList = billService.getBills(passenger.getPhone());
        int totalCount = billList.size();

        //总页数
        PageSupport pages=new PageSupport();
        pages.setCurrentPageNo(currentPageNo);
        pages.setPageSize(pageSize);
        pages.setTotalCount(totalCount);
        int totalPageCount = pages.getTotalPageCount();

        //控制首页和尾页
        if(currentPageNo < 1){
            currentPageNo = 1;
        }else if(currentPageNo > totalPageCount){
            currentPageNo = totalPageCount;
        }

        request.setAttribute("billList",billList);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("currentPageNo", currentPageNo);
    }*/

    @RequestMapping("/deleteBill")
    public void deleteBill(HttpServletResponse response, String billId) throws IOException {
        boolean success = billService.deleteBill(billId);
        //System.out.println(billId);
        HashMap<String, String> resultMap = new HashMap<>();
        if (success) {
            resultMap.put("delResult","true");
        }else {
            resultMap.put("delResult","false");
        }
        //把resultMap转换成json对象输出
        response.setContentType("application/json");
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write(JSONArray.toJSONString(resultMap));
        outPrintWriter.flush();
        outPrintWriter.close();
    }

/*    @RequestMapping("/downloadBill")
    public String download(HttpServletResponse response , HttpServletRequest request, String bill) throws Exception{
        //生成账单文件
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date newDate = new Date();
        String createDate = sdf.format(newDate);
        String[] dateArr = createDate.split("-");
        System.out.println(bill);
        String[] billArr = bill.split(";");

        System.out.println(billArr.length);
        //bill的pdf的表单域个数
        String[] pdfArgsArr = new String[11];
        System.arraycopy(dateArr,0,pdfArgsArr,0,3);
        System.arraycopy(billArr,0,pdfArgsArr,3,8);
        //得到pdf的文件名
        String  fileName = PDFOutput.generatePDF(request,pdfArgsArr,1) + ".pdf";
        System.out.println(fileName);
        //得到pdf所在的路径
        String path = request.getServletContext().getRealPath("/download");

        //1、设置response 响应头
        //设置页面不缓存,清空buffer
        response.reset();
        //字符编码
        response.setCharacterEncoding("UTF-8");
        //二进制传输数据
        response.setContentType("multipart/form-data");
        //设置响应头
        response.setHeader("Content-Disposition",
                "attachment;fileName="+ URLEncoder.encode(fileName, "UTF-8"));

        File file = new File(path,fileName);
        //2、 读取文件--输入流
        InputStream input=new FileInputStream(file);
        //3、 写出文件--输出流
        OutputStream out = response.getOutputStream();

        byte[] buff =new byte[1024];
        int index=0;
        //4、执行 写出操作
        while((index= input.read(buff))!= -1){
            out.write(buff, 0, index);
            out.flush();
        }
        out.close();
        input.close();
        //前端得到文件后，删除服务器的pdf，以免占用资源
        //PDFOutput.deleteFile(path + "/" + fileName);
        return "billPage";
    }*/

    @RequestMapping("downloadBill")
    public ResponseEntity<byte[]> download(HttpServletRequest request, String bill)throws Exception {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date newDate = new Date();
        String createDate = sdf.format(newDate);
        String[] dateArr = createDate.split("-");
        System.out.println(bill);
        String[] billArr = bill.split(";");
        //设置座位类型
        billArr[6] = "1".equals(billArr[6]) ? "头等舱" : "经济舱";

        //bill的pdf的表单域个数
        String[] pdfArgsArr = new String[11];
        System.arraycopy(dateArr, 0, pdfArgsArr, 0, 3);
        System.arraycopy(billArr, 0, pdfArgsArr, 3, 8);
        //得到pdf的文件名
        String path = request.getServletContext().getRealPath("/download");
        String fileName = PDFOutput.generatePDF(request, pdfArgsArr, 1);

        //设置响应头
        //创建http头信息的对象
        HttpHeaders header=new HttpHeaders();
        //标记以流的方式做出响应
        header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //设置以弹窗的方式提示用户下载
        //attachment 表示以附件的形式响应给客户端
        header.setContentDispositionFormData("attachment", URLEncoder.encode(fileName,"utf-8"));
        File f=new File(path + "/" + fileName);
        ResponseEntity<byte[]> resp=
                new ResponseEntity<byte[]>
                        (FileUtils.readFileToByteArray(f), header, HttpStatus.CREATED);
        //前端得到文件后，删除服务器的pdf，以免占用资源
        PDFOutput.deleteFile(path + "/" + fileName);
        return resp;

    }

}
