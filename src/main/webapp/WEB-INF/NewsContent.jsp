<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻详情</title>
    <style>
        /* 通用样式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .news-detail {
            margin-bottom: 20px;
        }

        .news-detail h2 {
            font-size: 2em;
            color: #333;
            margin-bottom: 10px;
            border-bottom: 2px solid #20b2aa;
            padding-bottom: 5px;
            text-align: center; /* 标题居中对齐 */
        }

        .news-detail .info {
            display: flex;
            justify-content: space-between; /* 左右对齐 */
            font-size: 1em;
            color: #555;
            margin-bottom: 10px;
        }

        .news-detail .info span {
            flex: 1;
        }

        .news-detail .info .author {
            text-align: right; /* 右侧对齐 */
        }

        .news-detail .content {
            font-size: 1em;
            color: #333;
            line-height: 1.6;
        }

        .news-detail img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin: 20px 0;
            display: block;
        }

        .news-detail a {
            color: #20b2aa;
            text-decoration: none;
            font-weight: bold;
            margin-right: 15px;
            transition: color 0.3s, text-decoration 0.3s;
        }

        .news-detail a:hover {
            color: #333;
            text-decoration: underline;
        }

        .news-detail .navigation {
            margin-top: 20px;
            text-align: center; /* 导航链接居中对齐 */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="news-detail">
        <h2>${newsItem.title}</h2>
        <div class="info">
            <span><strong>更新时间:</strong> ${newsItem.updateTime}</span>
            <span class="author"><strong>作者：</strong> ${newsItem.author}</span>
        </div>
        <c:if test="${not empty newsItem.imagePath}">
            <img src="${newsItem.imagePath}" alt="${newsItem.title}" onload="this.style.display='block';" onerror="this.style.display='none';">
        </c:if>
        <p class="content">${newsItem.content}</p>
        <div class="navigation">
            <a href="${pageContext.request.contextPath}/index">返回首页</a>
            <a href="${pageContext.request.contextPath}/admin">管理员界面</a>
        </div>
    </div>
</div>
</body>
</html>
