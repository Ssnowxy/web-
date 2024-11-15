package com.controller;

import com.util.DataSourceUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/deleteNews")
public class deleteNews extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newsIdParam = request.getParameter("newsId");

        if (newsIdParam != null && !newsIdParam.isEmpty()) {
            try {
                int newsId = Integer.parseInt(newsIdParam);

                // Database connection and deletion
                try (Connection conn = DataSourceUtils.getConnection();
                     PreparedStatement ps = conn.prepareStatement("DELETE FROM news WHERE news_id = ?")) {

                    ps.setInt(1, newsId);
                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        response.setStatus(HttpServletResponse.SC_OK);
                    } else {
                        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        response.sendRedirect(request.getContextPath()+"/AdminNewsServlet");
    }

}
