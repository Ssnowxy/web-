<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加新闻</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .news-form {
            display: flex;
            flex-direction: column;
        }
        .news-form label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }
        .news-form input, .news-form textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        .news-form textarea {
            resize: vertical; /* 允许垂直调整大小 */
        }
        .news-form input::placeholder {
            color: #888;
        }
        .news-form button {
            padding: 15px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .news-form button:hover {
            background-color: #0056b3;
        }
        .note {
            font-size: 0.9em;
            color: #777;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>添加公告</h1>
    <form class="news-form" action="Addannouncement" method="post">
        <label for="title">标题</label>
        <input type="text" id="title" name="title" required placeholder="请输入公告标题">

        <label for="author">作者</label>
        <input type="text" id="author" name="author" required placeholder="请输入作者姓名">

        <label for="content">内容</label>
        <textarea id="content" name="content" rows="10" required placeholder="请输入公告内容"></textarea>

        <label for="imagePath">图片路径 (可选)</label>
        <input type="text" id="imagePath" name="imagePath" placeholder="若无图片，留空即可">

        <button type="submit">添加公告</button>
    </form>
</div>
</body>
</html>
