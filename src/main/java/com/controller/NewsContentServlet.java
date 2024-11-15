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

@WebServlet("/NewsContentServlet")
public class NewsContentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newsIdParam = req.getParameter("newsId");
        if (newsIdParam == null || newsIdParam.isEmpty()) {
            resp.sendRedirect("admin");
            return;
        }

        int newsId;
        try {
            newsId = Integer.parseInt(newsIdParam);
        } catch (NumberFormatException e) {
            resp.sendRedirect("admin");
            return;
        }

        String sql = "SELECT * FROM news WHERE news_id = ?";
        News newsItem = null;

        try (Connection conn = DataSourceUtils.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, newsId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    newsItem = new News(
                            rs.getInt("news_id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getString("content"),
                            rs.getTimestamp("publish_time"),
                            rs.getTimestamp("update_time"),
                            rs.getString("image_path")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (newsItem != null) {
            req.setAttribute("newsItem", newsItem);
            req.getRequestDispatcher("/WEB-INF/NewsContent.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("admin");
        }
    }
}
