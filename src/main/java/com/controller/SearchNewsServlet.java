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

@WebServlet("/SearchNewsServlet")
public class SearchNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchQuery = req.getParameter("searchQuery");
        List<News> newsList = new ArrayList<>();
        if (searchQuery != null && !searchQuery.isEmpty()) {
            String sql = "SELECT * FROM news WHERE title LIKE ?";
            try (Connection conn = DataSourceUtils.getConnection();
                 PreparedStatement st = conn.prepareStatement(sql)) {
                st.setString(1, "%" + searchQuery + "%");
                try (ResultSet rs = st.executeQuery()) {
                    while (rs.next()) {
                        News news = new News(
                                rs.getInt("news_id"),
                                rs.getString("title"),
                                rs.getString("author"),
                                rs.getString("content"),
                                rs.getTimestamp("publish_time"),
                                rs.getTimestamp("update_time"),
                                rs.getString("image_path")
                        );
                        newsList.add(news);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        req.setAttribute("newsList", newsList);
        req.setAttribute("searchQuery", searchQuery);
        req.getRequestDispatcher("/WEB-INF/adminNews.jsp").forward(req, resp);
    }
}
