<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:url var="base" value="/"/>
    <base href="${base}">
    <meta charset="UTF-8">
    <title>首页</title>
    <!--图片轮播-->
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        img {
            border: 0;
            vertical-align: top;
            z-index: 1; /* 确保图片的z-index较低 */
            position: relative;
        }
        ul, li {
            list-style-type: none;
            padding: 0;
            margin: 0;
            border: 0;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff; /* 全局背景色 */
        }
        header {
            margin: 0;
            padding: 10px;
            top: 0;
            z-index: 1000;
            background-color: steelblue;
            font-style: italic;
        }
        nav {
            background-color: cornflowerblue; /* 清新的浅蓝色背景 */
            margin: 0;
            padding: 0;
            z-index: 1100;
            position: relative; /* 确保导航栏在页面的前端 */
            border: none;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center; /* 导航栏内容居中 */
            align-items: center;
            position: relative;
        }
        nav ul li {
            position: relative;
            transition: transform 0.3s ease; /* 添加过渡效果 */
            z-index: 1100; /* 确保下拉菜单在前端 */
        }
        nav ul li a {
            color: white;
            padding: 20px 40px;
            text-decoration: none;
            display: block;
        }
        nav ul li ul {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: rgba(128, 128, 128, 0.5); /* 透明灰色背景 */
            padding: 0;
            margin: 0;
            list-style-type: none;
            z-index: 1200; /* 确保下拉菜单在前端 */
        }
        nav ul li:hover ul {
            display: block;
        }
        nav ul li ul li {
            width: 200px;
        }
        nav ul li ul li a {
            padding: 10px;
            color: white;
        }
        nav ul li ul li a:hover {
            background-color: cornflowerblue; /* 与导航栏相同的颜色 */
        }
        nav ul > li:hover > a { /* 仅在主菜单项悬停时放大 */
            transform: scale(1.1); /* 悬浮时放大 */
            background-color: #b0e0e6; /* 浅蓝色背景 */
        }
        nav ul .login-button {
            margin-left: auto;
        }
        nav ul .login-button a {
            background-color: #20b2aa; /* 清新的绿色按钮背景 */
            border-radius: 5px;
            color: white;
        }
        nav ul .login-button a:hover {
            background-color: #3cb371; /* 深绿色背景 */
        }
        main {
            padding: 0px;
        }
        section {
            margin-bottom: 20px;
        }
        section h2 {
            background-color: #98fb98; /* 清新的浅绿色背景 */
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin: 0; /* 设置外边距为0，消除缝隙 */
        }
        article {
            margin: 0px;
            padding: 0px;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .tech-text {
            font-family: 'Orbitron', sans-serif; /* 科技感字体 */
            font-size: 1.5em; /* 字体大小 */
            color: lightskyblue; /* 字体颜色 */
            text-transform: uppercase; /* 全部大写 */
            letter-spacing: 2px; /* 字母间距 */
            background: linear-gradient(90deg, rgba(0,230,255,1) 0%, rgba(255,255,255,1) 50%, rgba(0,230,255,1) 100%); /* 蓝白色渐变 */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: glowing 1.5s infinite; /* 动画效果 */
        }
        /* 通知公告和新闻中心整体样式 */
        .announcement-news {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background-color: #e0f7fa; /* 背景色 */
            gap: 20px; /* 分隔两个部分的间距 */
        }

        /* 各部分宽度 */
        .announcement-news .announcements,
        .announcement-news .news {
            width: 48%;
        }

        /* 标题样式 */
        .announcement-news h3 {
            color: #333333;
            padding: 15px; /* 增加内边距 */
            border-radius: 5px;
            margin: 0 0 15px 0; /* 增加底部间距 */
            border-bottom: 2px solid cornflowerblue; /* 下划线 */
            background-color: #f8f9fa; /* 轻微背景色以区分标题 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 阴影效果 */
            font-size: 1.75em; /* 增加字体大小 */
        }

        /* 列表样式 */
        .announcement-news ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        /* 每个列表项的样式 */
        .announcement-news li {
            border: 1px solid #ddd; /* 边框 */
            border-radius: 5px; /* 圆角 */
            background-color: #ffffff; /* 背景色 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 阴影 */
            padding: 15px;
            margin-bottom: 15px; /* 底部间距 */
            transition: background-color 0.3s ease, box-shadow 0.3s ease; /* 动画效果 */
        }

        /* 鼠标悬浮时的样式 */
        .announcement-news li:hover {
            background-color: #f1f8ff; /* 鼠标悬浮时背景色 */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* 鼠标悬浮时阴影 */
        }

        /* 链接样式 */
        .announcement-news a {
            text-decoration: none;
            color: #333;
            display: block; /* 使整个列表项都可点击 */
            font-weight: bold; /* 加粗标题 */
            transition: color 0.3s ease; /* 动画效果 */
        }

        /* 链接悬浮时样式 */
        .announcement-news a:hover {
            color: #007bff; /* 悬浮时文字颜色 */
            text-decoration: underline;
        }

        /* 时间样式 */
        .announcement-news p {
            font-size: 0.9em; /* 较小字体 */
            color: #666; /* 较浅颜色 */
            margin: 5px 0 0 0; /* 顶部间距 */
        }
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .section-header h3 {
            margin: 0;
            font-size: 1.8em; /* 你可以调整标题的字体大小 */
        }

        .section-header .view-more {
            text-decoration: none;
            color: cornflowerblue;
            font-size: 1.2em;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }

        .section-header .view-more:hover {
            color: #333;
            text-decoration: underline;
        }
        /* 视频和相关链接容器样式 */
        .video-and-links {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background-color: #e0f7fa;
        }

        /* 视频容器样式 */
        .video-container {
            width: 48%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .video-container video {
            width: 100%;
            height: auto;
        }
        .video-container h3{
            color: #333333;
            padding: 10px;
            border-radius: 5px;
            margin: 0 0 10px 0;
            border-bottom: 2px solid cornflowerblue; /* 添加下划线 */
        }
        /* 相关链接容器样式 */
        .related-links {
            width: 48%;
            margin-top: 20px;
            padding: 20px;
            opacity: 0.9;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
        }
        .related-links h3  {
            color: #333333;
            padding: 10px;
            border-radius: 5px;
            margin: 0 0 10px 0;
            border-bottom: 2px solid cornflowerblue; /* 添加下划线 */
        }
        .related-links ul {
            padding: 0;
            margin: 0;
        }

        .related-links li {
            list-style: none;
            margin-bottom: 10px;
        }

        .related-links a {
            text-decoration: none;
            color: #333333;
            padding: 10px;
            opacity: 0.9;
            border: 1px solid #20b2aa;
            border-radius: 5px;
            display: block;
            text-align: center;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .related-links a:hover {
            background-color: #20b2aa;
            color: #fff;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .bottom {
            padding: 20px;
            background-color: steelblue;
            text-align: center;
        }
        .page-header h2 {
            text-decoration: none;
        }

        .announcement-news ul {
            list-style: none;
            padding: 0;
        }
        .announcement-news li {
            margin-bottom: 10px;
        }
        .announcement-news img {
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>
<!-- 首页标题 -->
<header>
    <div class="page-header">
        <h2>
            <img src="https://ccec.nefu.edu.cn/images/logodouble.png"/>
            <span class="tech-text">软件工程专业</span>
        </h2>
    </div>
</header>
<!-- 上导航 -->
<nav>
    <ul>
        <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
        <li><a href="#">专业介绍</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/JSP/introduction-summary.jsp">专业简介</a></li>
                <li><a href="${pageContext.request.contextPath}/JSP/introduction-directions.jsp">方向简介</a></li>
            </ul>
        </li>
        <li><a href="#labs">实验室</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/JSP/lab-923.jsp">923创新实验室</a></li>
                <li><a href="${pageContext.request.contextPath}/JSP/lab-925.jsp">925移动开发实验室</a></li>
                <li><a href="${pageContext.request.contextPath}/JSP/lab-927.jsp">927开发实验室</a></li>
            </ul>
        </li>
        <li><a href="#faculty">教师队伍</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/JSP/Professor.jsp">教授</a></li>
                <li><a href="${pageContext.request.contextPath}/JSP/FuProfessor.jsp">副教授</a></li>
                <li><a href="${pageContext.request.contextPath}/JSP/Lecturer.jsp">讲师</a></li>
            </ul>
        </li>
        <li><a href="#career">就业指南</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/JSP/undergraduate.jsp">本科生就业</a></li>
                <li><a href="${pageContext.request.contextPath}/JSP/graduate.jsp">研究生就业</a></li>
            </ul>
        </li>
        <li class="login-button"><a href="${pageContext.request.contextPath}/login">管理员登录</a></li>
    </ul>
</nav>
<!--图片轮播-->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="https://ccec.nefu.edu.cn/images/qgbgyx.jpg" alt="First slide">
            <div class="carousel-caption">
                <!-- Caption for first slide -->
            </div>
        </div>
        <div class="item">
            <img src="https://ccec.nefu.edu.cn/images/sdsf.jpg" alt="Second slide">
            <div class="carousel-caption">
                <!-- Caption for second slide -->
            </div>
        </div>
        <div class="item">
            <img src="https://ccec.nefu.edu.cn/images/1rxqn.png" alt="Third slide">
            <div class="carousel-caption">
                <!-- Caption for third slide -->
            </div>
        </div>
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- 通知公告和新闻中心 -->
<div class="announcement-news">
    <div class="announcements">
        <div class="section-header">
            <h3>通知公告</h3>
            <a class="view-more" href="${pageContext.request.contextPath}/allAnnouncementsServlet">查看更多</a>
        </div>
        <ul>
            <c:forEach var="announcement" items="${announcementsList}">
                <li>
                    <a href="${pageContext.request.contextPath}/announcementContentServlet?newsId=${announcement.newsId}" class="news-item-link">
                        <div class="news-item-content">
                            <h4>${announcement.title}</h4>
                            <p>${announcement.updateTime}</p>
                            <p>${fn:substring(announcement.content, 0, 80)}...</p> <!-- 显示前80个字符 -->
                        </div>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="news">
        <div class="section-header">
            <h3>新闻中心</h3>
            <a class="view-more" href="${pageContext.request.contextPath}/allNewsservlet">查看更多</a>
        </div>
        <ul>
            <c:forEach var="newsItem" items="${newsList}">
                <li>
                    <a href="${pageContext.request.contextPath}/NewsContentServlet?newsId=${newsItem.newsId}" class="news-item-link">
                        <div class="news-item-content">
                            <h4>${newsItem.title}</h4>
                            <p>${newsItem.updateTime}</p>
                            <p>${fn:substring(newsItem.content, 0, 80)}...</p> <!-- 显示前80个字符 -->
                        </div>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<!-- 视频介绍和相关链接 -->
<div class="video-and-links">
    <div class="video-container">
        <h3>视频介绍</h3>
        <video controls>
            <source src="https://ccec.nefu.edu.cn/__local/1/A0/CB/A4AD4D6B7955DFECFA7572BA427_CB7694FF_123151B1.mp4?e=.mp4" type="video/mp4">
        </video>
    </div>
    <div class="related-links">
        <h3>相关链接</h3>
        <ul>
            <li><a href="https://www.nefu.edu.cn/">东北林业大学</a></li>
            <li><a href="https://ccec.nefu.edu.cn/">计算机与控制工程学院</a></li>
            <li><a href="http://jwc.nefu.edu.cn/">教务处</a></li>
            <li><a href="http://222.27.167.238:8080/syzx/Login">实验室预约系统</a></li>
            <li><a href="https://dgvnwz.aliwork.com/s/ccecnews">在线投稿</a></li>
        </ul>
    </div>
</div>

<!-- 页尾 -->
<div class="section">
    <div class="bottom">
        <p>校址：黑龙江省哈尔滨市香坊区和兴路26号 邮编：150040</p>
        <p>版权所有2024 © 邵雪莹</p>
    </div>
</div>
</body>
</html>
