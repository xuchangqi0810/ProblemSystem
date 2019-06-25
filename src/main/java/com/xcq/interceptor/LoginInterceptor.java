package com.xcq.interceptor;

import com.xcq.entity.Pt_User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String uri = request.getRequestURI();
        if(uri.indexOf("login") >= 0){//除去login请求外拦截所有请求
            return true;
        }
        HttpSession session = request.getSession();
        Pt_User user = (Pt_User) session.getAttribute("pt_user");
        if(user != null){//已经登录
            return true;
        }
        request.setAttribute("msg","请先登录！");
        request.getRequestDispatcher("/login.jsp").forward(request,response);//未登陆
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
