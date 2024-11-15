<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑公告</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
        }
        .news-form {
            display: flex;
            flex-direction: column;
        }
        .news-form label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #495057;
        }
        .news-form input, .news-form textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            background-color: #fdfdfe;
        }
        .news-form input:focus, .news-form textarea:focus {
            border-color: #007bff;
            outline: none;
        }
        .news-form textarea {
            resize: vertical;
        }
        .news-form button {
            padding: 15px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .news-form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>编辑公告</h1>
    <form class="news-form" action="UpdateAnnouncementServlet" method="post">
        <input type="hidden" name="newsId" value="${newsItem.newsId}">

        <label for="title">标题</label>
        <input type="text" id="title" name="title" value="${newsItem.title}" required placeholder="请输入公告标题">

        <label for="author">作者</label>
        <input type="text" id="author" name="author" value="${newsItem.author}" required placeholder="请输入作者姓名">

        <label for="content">内容</label>
        <textarea id="content" name="content" rows="10" required placeholder="请输入公告内容">${newsItem.content}</textarea>

        <label for="imagePath">图片路径</label>
        <input type="text" id="imagePath" name="imagePath" value="${newsItem.imagePath}" placeholder="请输入图片路径 (可选)">

        <button type="submit">更新公告</button>
    </form>
</div>
</body>
</html>
