<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Professor</title>
    <c:url var="base" value="/"/>
    <base href="${base}">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/nav.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
        .responsive-img {
            max-width: 100%;
            height: auto;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            padding: 0;
            margin: 0;
            display: flex;
            width: 100%;
        }
        .nav {
            width: 20%; /* 调整左侧边栏宽度 */
            background-color: #f4f4f4;
            padding: 20px;
            height: 74.3vh;
        }
        .nav h2 {
            text-align: center;
        }
        .nav ul {
            list-style-type: none;
            padding: 0;
        }
        .nav ul li {
            margin: 10px 0;
        }
        .nav ul li a {
            text-decoration: none;
            color: #333;
            display: block;
            padding: 10px;
            background-color: #e4e4e4;
            border-radius: 5px;
        }
        .nav ul li a:hover {
            background-color: #ddd;
        }
        .content {
            margin: 0;
            width: 100%; /* 调整右侧内容容器宽度 */
            padding: 20px;
            background-color: #e7f3fe; /* 添加背景颜色 */
        }
        .content pre{
            font-size: 1.3em;
        }
        .content h1 {
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        pre {
            white-space: pre-wrap; /* 保持空格和换行 */
        }
        .content img{
            width: 30%;
            height: 30%;
        }
    </style>
</head>
<body>
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
<div class="container">
    <div class="nav">
        <h2>教师队伍</h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/JSP/Professor.jsp">教授</a></li>
            <li><a href="${pageContext.request.contextPath}/JSP/FuProfessor.jsp">副教授</a></li>
            <li><a href="${pageContext.request.contextPath}/JSP/Lecturer.jsp">讲师</a></li>
            <li><a href="${pageContext.request.contextPath}/index">返回首页</a></li>
        </ul>
    </div>
    <div class="content">
        <h1>教授列表</h1>
        <ul>
            <li style="float:left;width:23%;padding:10px 1%">
                <a href="${pageContext.request.contextPath}/JSP/zhishi.jsp"title="知世">
                    <img src="https://img1.baidu.com/it/u=2639272063,4199826528&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500" style="width:100%; height:230px;border: 1px solid #ccc;">
                    <p style="text-align: center;line-height: 35px;font-size: 16px;"> 知世 </p>
                </a>
        </ul>
    </div>
</div>
</body>
</html>
