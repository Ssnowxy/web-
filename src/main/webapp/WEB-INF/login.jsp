<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>管理员登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://www.nefu.edu.cn/__local/1/B9/A9/7BDBC7327FC9FF4C6F25BD375B4_FCBBECFC_24A41.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-size: 1.5em;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .form-group label {
            margin-right: 10px;
            font-weight: bold;
            flex-basis: 30%;
            text-align: left;
        }

        .form-group input {
            width: 65%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input::placeholder {
            color: #ccc;
        }

        .login-container button, .back-link {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .login-container button:hover, .back-link:hover {
            background-color: #0056b3;
        }

        .notice {
            margin-top: 20px;
            font-size: 0.9em;
            color: darkred;
        }
    </style>
    <script>
        /*改null弹窗bug*/
        window.onload = function() {
            var errorMessage = "<%= request.getAttribute("errorMessage") %>";
            if (errorMessage && errorMessage !== "null") {
                alert("用户名或密码错误！");
            }
        }
    </script>
</head>
<body>
<div class="login-container">
    <h2>管理员登录</h2>
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" placeholder="请输入admin" required>
        </div>
        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" placeholder="请输入admin" required>
        </div>
        <button type="submit">登录</button>
        <p class="notice">如果无法登录，可能是被人修改，请联系作者。</p>
    </form>

</div>
<a href="${pageContext.request.contextPath}/index" class="back-link">返回首页</a>
</body>
</html>
