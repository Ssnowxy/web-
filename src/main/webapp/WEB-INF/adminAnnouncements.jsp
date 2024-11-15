<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公告管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .form-container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-bottom: 20px;
        }
        .news-form {
            display: flex;
            align-items: center;
            margin-right: auto;
        }
        .news-form input[type="text"] {
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 14px;
            width: 200px;
            box-sizing: border-box;
            background-color: #fdfdfe;
        }
        .news-form button, .news-form a {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .news-form button {
            background-color: #007bff;
            color: white;
            margin-left: 10px;
        }
        .news-form button:hover {
            background-color: #0056b3;
        }
        .add-button {
            background-color: #28a745;
            color: white;
            text-align: center;
            margin-left: 10px;
        }
        .add-button:hover {
            background-color: #218838;
        }
        .btn-announcements, .btn-logout {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            color: white;
            text-align: center;
            margin-left: 10px;
            cursor: pointer;
            text-decoration: none;
            position: relative; /* To position the tooltip */
            transition: background-color 0.3s ease;
        }
        .btn-announcements {
            background-color: #17a2b8; /* Primary color for announcements */
        }
        .btn-announcements:hover {
            background-color: #138496;
        }
        .btn-logout {
            background-color: #dc3545;
        }
        .btn-logout:hover {
            background-color: #c82333;
        }
        /* Tooltip styles */
        .btn-logout:hover .tooltip {
            display: block;
        }
        .tooltip {
            display: none;
            position: absolute;
            top: 100%; /* Position below the button */
            left: 50%;
            transform: translateX(-50%);
            background-color: #333;
            color: #fff;
            padding: 5px;
            border-radius: 5px;
            white-space: nowrap;
            font-size: 12px;
            z-index: 1000;
            opacity: 0.8;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #dee2e6;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f8f9fa;
            color: #333;
        }
        .actions button {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .actions .delete-btn {
            background-color: #dc3545;
        }
        .actions .delete-btn:hover {
            background-color: #c82333;
        }
        .actions .update-btn {
            background-color: #28a745;
        }
        .actions .update-btn:hover {
            background-color: #218838;
        }
        .no-news {
            text-align: center;
            font-size: 18px;
            color: #888;
            margin-bottom: 20px;
        }
        .return-button {
            text-align: center;
            margin: 20px auto;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .return-button:hover {
            background-color: #0056b3;
        }
        .actions .delete-btn {
            position: relative;
        }

        .actions .delete-btn::after {
            content: "删除后请刷新";
            display: none;
            position: absolute;
            top: 100%; /* 在按钮下方显示 */
            left: 50%;
            transform: translateX(-50%);
            background-color: #333;
            color: #fff;
            padding: 5px;
            border-radius: 5px;
            white-space: nowrap;
            font-size: 12px;
            z-index: 1000;
            opacity: 0.8;
            margin-top: 5px;
        }

        .actions .delete-btn:hover::after {
            display: block;
        }
    </style>
    <script>
        function validateSearchForm(event) {
            var searchInput = document.querySelector('input[name="searchQuery"]');
            if (!searchInput.value.trim()) {
                alert('请输入搜索内容');
                event.preventDefault(); // Prevent form submission
            }
        }

        function deleteNews(newsId) {
            if (confirm('确定要删除这条公告吗？')) {
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'deleteAnnouncement', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var row = document.getElementById('news-' + newsId);
                            row.parentNode.removeChild(row);
                        } else {
                            alert('删除失败，请重试。');
                        }
                    }
                };
                xhr.send('newsId=' + newsId);
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>东林软件工程公告管理</h1>
    <div class="form-container">
        <form class="news-form" action="SearchAnnouncementsServlet" method="get" onsubmit="validateSearchForm(event)">
            <input type="text" name="searchQuery" placeholder="搜索新闻标题" value="${param.searchQuery}">
            <button type="submit">搜索</button>
            <a href="Addannouncement" class="add-button">增加公告</a>
        </form>
        <a href="${pageContext.request.contextPath}/AdminNewsServlet" class="btn-announcements">新闻管理</a>
        <a href="${pageContext.request.contextPath}/logout" class="btn-logout">
            退出登录
            <span class="tooltip">点击“退出登录”将清除会话对象，浏览器返回箭头不会清除会话对象。</span>
        </a>
    </div>
    <c:choose>
        <c:when test="${empty newsList && not empty param.searchQuery}">
            <p class="no-news">没有找到 “${param.searchQuery}” 的搜索结果。</p>
            <a href="AdminAnnouncementsServlet" class="return-button">返回原页</a>
        </c:when>
        <c:otherwise>
            <c:if test="${not empty newsList}">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>标题</th>
                        <th>作者</th>
                        <th>发布时间</th>
                        <th>更新时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="announcementItem" items="${newsList}">
                        <tr id="announcementItem-${announcementItem.newsId}">
                            <td>${announcementItem.newsId}</td>
                            <td><a href="${pageContext.request.contextPath}/announcementContentServlet?newsId=${announcementItem.newsId}">${announcementItem.title}</a></td>
                            <td>${announcementItem.author}</td>
                            <td>${announcementItem.publishTime}</td>
                            <td>${announcementItem.updateTime}</td>
                            <td class="actions">
                                <button type="button" class="delete-btn" onclick="deleteNews(${announcementItem.newsId})">删除</button>
                                <form action="UpdateAnnouncementServlet" method="get" style="display:inline;">
                                    <input type="hidden" name="newsId" value="${announcementItem.newsId}">
                                    <button type="submit" class="update-btn">修改</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${not empty param.searchQuery}">
                    <a href="AdminAnnouncementsServlet" class="return-button">返回原页</a>
                </c:if>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
