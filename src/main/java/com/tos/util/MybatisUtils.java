package com.tos.util;//package com.tos.util;
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//
//import java.io.IOException;
//import java.io.InputStream;
//
///*sqlSessionFactory
// * 获取sqlSession对象实例*/
//public class MybatisUtils {
//    private static SqlSessionFactory sqlSessionFactory=null;
//    static {
//        /*获取sqlSession对象实例*/
//        String resource = "mybatis-config.xml";
//        InputStream inputStream = null;
//        try {
//            inputStream = Resources.getResourceAsStream(resource);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//    }
//
//    public static SqlSession getSqlSession(){
//
//        return sqlSessionFactory.openSession();
//    }
//}
