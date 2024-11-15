<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有公告</title>
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
        }
        .news-container {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }
        .news-item {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .news-item h2 {
            font-size: 1.5em;
            margin: 0;
        }
        .news-item p {
            color: #666;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
<div class="news-container">
    <h1>所有公告</h1>
    <c:forEach var="newsItem" items="${announcementsList}">
        <div class="news-item">
            <h2><a href="${pageContext.request.contextPath}/announcementContentServlet?newsId=${newsItem.newsId}">${newsItem.title}</a></h2>
            <p>作者: ${newsItem.author}</p>
            <p>发布时间: ${newsItem.publishTime}</p>
            <p>${fn:substring(newsItem.content, 0, 100)}...</p> <!-- 显示前100个字符 -->
        </div>
    </c:forEach>
</div>
</body>
</html>
