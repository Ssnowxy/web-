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

@WebServlet("/AdminNewsServlet")
public class AdminNewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news";
        try (Connection conn = DataSourceUtils.getConnection();
             PreparedStatement st = conn.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                News news = new News(rs.getInt("news_id"), rs.getString("title"), rs.getString("author"), rs.getString("content"),
                        rs.getTimestamp("publish_time"), rs.getTimestamp("update_time"), rs.getString("image_path"));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("/WEB-INF/adminNews.jsp").forward(request, response);
    }
}
