package com.controller;

import com.entity.News;
import com.util.DataSourceUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/index")
public class indexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<News> announcementsList = new ArrayList<>();
        List<News> newsList = new ArrayList<>();

        // 获取 ID 最大的五条公告
        String sqlAnnouncements = "SELECT * FROM gonggao ORDER BY gonggao.news_id DESC LIMIT 5";

                   // 获取 ID 最大的五条新闻
        String sqlNews = "SELECT * FROM news ORDER BY news.news_id DESC LIMIT 5";

        try (Connection connAnnouncements = DataSourceUtils.getConnection();
             Connection connNews = DataSourceUtils.getConnection();
             PreparedStatement psAnnouncements = connAnnouncements.prepareStatement(sqlAnnouncements);
             PreparedStatement psNews = connNews.prepareStatement(sqlNews);
             ResultSet rsAnnouncements = psAnnouncements.executeQuery();
             ResultSet rsNews = psNews.executeQuery()) {

            while (rsAnnouncements.next()) {
                News announcement = new News(
                        rsAnnouncements.getInt("news_id"),
                        rsAnnouncements.getString("title"),
                        rsAnnouncements.getString("author"),
                        rsAnnouncements.getString("content"),
                        rsAnnouncements.getTimestamp("publish_time"),
                        rsAnnouncements.getTimestamp("update_time"),
                        rsAnnouncements.getString("image_path")
                );
                announcementsList.add(announcement);
            }

            // Process news
            while (rsNews.next()) {
                News news = new News(
                        rsNews.getInt("news_id"),
                        rsNews.getString("title"),
                        rsNews.getString("author"),
                        rsNews.getString("content"),
                        rsNews.getTimestamp("publish_time"),
                        rsNews.getTimestamp("update_time"),
                        rsNews.getString("image_path")
                );
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        req.setAttribute("announcementsList", announcementsList);
        req.setAttribute("newsList", newsList);
        req.getRequestDispatcher("/JSP/index.jsp").forward(req, resp);
    }
}
