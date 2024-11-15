package com.controller;

import com.entity.News;
import com.util.DataSourceUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/allNewsservlet")
public class allNewsservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<News> newsList = new ArrayList<>();
        String sqlNews = "SELECT * FROM news";

        try (Connection conn = DataSourceUtils.getConnection();
             PreparedStatement psNews = conn.prepareStatement(sqlNews);
             ResultSet rsNews = psNews.executeQuery()) {

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

        req.setAttribute("newsList", newsList);
        req.getRequestDispatcher("/JSP/allNews.jsp").forward(req, resp);
    }
}
