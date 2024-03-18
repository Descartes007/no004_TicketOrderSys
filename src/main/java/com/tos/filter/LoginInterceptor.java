package com.tos.filter;

import com.tos.pojo.Manager;
import com.tos.pojo.Passenger;
import com.tos.util.Constants;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

public abstract class LoginInterceptor implements HandlerInterceptor {
    protected Set<String> whiteList = new HashSet<>();

    protected abstract Object getLoginObject(HttpSession session);

    protected abstract String getRedirectPath(HttpServletRequest request);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        // 第1步：得到出去应用名的uri
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        if(uri.startsWith( contextPath )) {
            uri = uri.replaceFirst(contextPath,"");
        }
        // 第2步：拦截不在白名单中，且未登录的请求
        if(!whiteList.contains(uri)) {
            // 第3步：钩子方法，利用多态特效，调用具体实现的方法
            Object targetObject= getLoginObject(session);
            if(targetObject == null) {
                session.setAttribute("message", "登录超时,重新登录");
                // 第4步：钩子方法，利用多态特性，调用具体的方法实现
                response.sendRedirect(getRedirectPath(request));
                return false;
            }
        }

        // 已经登录
        return true;
    }

}
