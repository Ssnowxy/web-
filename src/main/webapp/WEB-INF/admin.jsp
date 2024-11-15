<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>东林软件工程新闻公告后台管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            gap: 10px; /* 更好的按钮间距 */
            margin-top: 20px;
        }
        .btn-container form {
            margin: 0; /* 去掉 form 的默认 margin */
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s; /* 增加过渡效果 */
        }
        .btn-news {
            background-color: #007bff;
        }
        .btn-news:hover {
            background-color: #0056b3;
            transform: scale(1.05); /* 增加按钮悬停放大效果 */
        }
        .btn-announcements {
            background-color: #28a745;
        }
        .btn-announcements:hover {
            background-color: #218838;
            transform: scale(1.05); /* 增加按钮悬停放大效果 */
        }
        .btn-logout {
            background-color: #dc3545;
        }
        .btn-logout:hover {
            background-color: #c82333;
            transform: scale(1.05); /* 增加按钮悬停放大效果 */
        }
        .note {
            text-align: center;
            font-size: 14px;
            color: #666;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>东林软件工程新闻公告后台管理</h1>
    <div class="btn-container">
        <form action="AdminNewsServlet" method="get">
            <button type="submit" class="btn btn-news">新闻管理</button>
        </form>
        <form action="AdminAnnouncementsServlet" method="get">
            <button type="submit" class="btn btn-announcements">公告管理</button>
        </form>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-logout">退出登录</a>
    </div>
    <div class="note">
        点击“退出登录”将清除会话对象，浏览器返回箭头不会清除会话对象。即不会被过滤。
    </div>
</div>
</body>
</html>
