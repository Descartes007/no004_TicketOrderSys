package com.tos.util;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.*;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Random;

public class PDFOutput {


    /**
     * 生成pdf文件并返回pdf文件路径
     * @param request
     * @param str
     * @param type
     * @return
     */
    public static String generatePDF(HttpServletRequest request, String[] str, int type) {
        //随机文件名
        String randomName = generateRandomFilename();
        try {
            // 输出流
            FileOutputStream out = new FileOutputStream(request.getServletContext().getRealPath("/download/") + randomName);
            //读取pdf模板
            //账单模板
            PdfReader reader = null;
            if (type == 1) {
                reader = new PdfReader(request.getServletContext().getRealPath("/static")+"/billModel.pdf");
            }else {
                reader = new PdfReader(request.getServletContext().getRealPath("/static")+"/noteModel.pdf");
            }

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            PdfStamper stamper = new PdfStamper(reader, bos);
            AcroFields form = stamper.getAcroFields();
            //设置中文
            BaseFont bf = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
            ArrayList<BaseFont> fontList = new ArrayList<>();
            //添加字体
            fontList.add(bf);
            //设置替换字体
            form.setSubstitutionFonts(fontList);
            //得到字段迭代器
            Iterator<String> it = form.getFields().keySet().iterator();
            //遍历输出表单域名与值
            int i = 0;
            while (it.hasNext()) {
                String name = it.next().toString();
                form.setField(name, str[i]);
                System.out.println("name=" + name + ";str=" + str[i++]);

            }
            // 设置为fasle，生成PDF将不能编辑
            stamper.setFormFlattening(true);
            //关闭PdfStamper
            stamper.close();
            //实例化Document对象
            Document doc = new Document();
            PdfCopy copy = new PdfCopy(doc, out);
            //打开文档
            doc.open();
            PdfImportedPage importPage = copy.getImportedPage(new PdfReader(bos.toByteArray()), 1);
            copy.addPage(importPage);
            doc.close();
        } catch (Exception e) {
            e.printStackTrace();

        }
        return randomName;

    }

    /**
     * 删除单个文件
     * @param   sPath    被删除文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static boolean deleteFile(String sPath) {
        boolean flag = false;
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
            flag = true;
        }
        return flag;
    }



    //生成随机文件名，防止上传文件后文件名重复
    public static String generateRandomFilename(){
        String RandomFilename = "";
        //生成随机数
        Random rand = new Random();
        int random = rand.nextInt();

        Calendar calCurrent = Calendar.getInstance();
        int intDay = calCurrent.get(Calendar.DATE);
        int intMonth = calCurrent.get(Calendar.MONTH) + 1;
        int intYear = calCurrent.get(Calendar.YEAR);
        String now = String.valueOf(intYear) + "_" + String.valueOf(intMonth) + "_" +
                String.valueOf(intDay) + "_";

        RandomFilename = now + String.valueOf(random > 0 ? random : ( -1) * random);

        return new StringBuilder().append(RandomFilename).append(".pdf").toString();
    }

}
