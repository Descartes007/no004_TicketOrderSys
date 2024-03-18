package com.tos.controller;

import com.alibaba.fastjson.JSONArray;
import com.tos.pojo.Notification;
import com.tos.pojo.Passenger;
import com.tos.service.FlightService;
import com.tos.service.NotificationService;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
@RequestMapping("/note")
public class NotificationController {
    @Autowired
    private NotificationService notificationService;

    @Autowired
    private FlightService flightService;

    @RequestMapping("/toNotePage")
    public String toNotePage(Model model,HttpServletRequest request) {
        //Passenger passenger = (Passenger)request.getSession().getAttribute(Constants.USER_SESSION);
        //List<Notification> list = notificationService.getNotes(passenger.getPhone());
        List<Notification> list = getNotes(request);
        request.setAttribute("noteList",list);
        return "notePage";
    }

    @RequestMapping("/getNotes")
    @ResponseBody
    public List<Notification> getNotes(HttpServletRequest request) {
        Passenger passenger = (Passenger)request.getSession().getAttribute(Constants.Passenger_SESSION);
        return notificationService.getNotes(passenger.getPhone());
    }

    @RequestMapping("/deleteNote")
    public void deleteNote(HttpServletResponse response, String noteId) throws IOException {
        boolean success = notificationService.deleteNote(noteId);
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

    @RequestMapping("downloadNote")
    public ResponseEntity<byte[]> download(HttpServletRequest request, String note)throws Exception {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date newDate = new Date();
        String createDate = sdf.format(newDate);
        String[] dateArr = createDate.split("-");
        //System.out.println(note);
        String[] noteArr = note.split(";");

        //System.out.println(noteArr.length);
        //bill的pdf的表单域个数
        String[] pdfArgsArr = new String[9];
        System.arraycopy(dateArr, 0, pdfArgsArr, 0, 3);
        System.arraycopy(noteArr, 0, pdfArgsArr, 3, 6);
        pdfArgsArr[3] = flightService.getFlight(Integer.parseInt(pdfArgsArr[3])).getAirline();

        //得到pdf的文件名
        String path = request.getServletContext().getRealPath("/download");
        String fileName = PDFOutput.generatePDF(request, pdfArgsArr, 2);

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
