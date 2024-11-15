package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.util.DataSourceUtils;

@WebServlet("/Addannouncement")
public class Addannouncement extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/manage/Addannouncement.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String content = req.getParameter("content");
        String imagePath = req.getParameter("imagePath");
        String sql;
        if (imagePath == null || imagePath.isEmpty()) {
            sql = "INSERT INTO gonggao (title, author, content) VALUES (?, ?, ?)";
        } else {
            sql = "INSERT INTO gonggao (title, author, content, image_path) VALUES (?, ?, ?, ?)";
        }

        try (Connection conn = DataSourceUtils.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, title);
            st.setString(2, author);
            st.setString(3, content);
            if (imagePath != null && !imagePath.isEmpty()) {
                st.setString(4, imagePath);
            }
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect(req.getContextPath()+"/AdminAnnouncementsServlet");
    }
}
