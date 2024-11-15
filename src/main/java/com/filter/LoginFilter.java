package com.filter;

import com.entity.User;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebFilter("/*")
public class LoginFilter extends HttpFilter {
    private final List<String> excludes = List.of("/login","/index","/NewsContentServlet","/JSP/index.jsp","/JSP/FuProfessor.jsp"
            ,"/JSP/graduate.jsp","/JSP/introduction-directions.jsp","/JSP/introduction-summary.jsp","/JSP/lab-923.jsp","/JSP/lab-925.jsp"
            ,"/JSP/lab-927.jsp","/JSP/Lecturer.jsp","/JSP/Professor.jsp","/JSP/undergraduate.jsp","/JSP/xiaoke.jsp","/JSP/xiaoying.jsp"
            ,"/JSP/zhishi.jsp","/announcementContentServlet","/allNewsservlet","/allAnnouncementsServlet","/JSP/allAnnouncements.jsp"
            ,"/JSP/allNews.jsp");

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        for (String e : excludes) {
            if (e.equals(req.getServletPath())) {
                chain.doFilter(req, res);
                return;
            }
        }
        User user = (User) req.getSession().getAttribute("user");
        if (user != null) {
            chain.doFilter(req, res);
            return;
        }
        res.sendRedirect(req.getContextPath() + "/login");

    }
}