<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #d8f3dc, #95d5b2); /* greenish */
            font-family: Arial, sans-serif;
        }

        .admin-card {
            width: 100%;
            max-width: 400px;
            border-radius: 15px;
        }

        .admin-card h3 {
            color: #1b4332;
            font-weight: bold;
        }

        .btn-dark {
            background-color: #1b4332;
            border: none;
        }

        .btn-dark:hover {
            background-color: #081c15;
        }
    </style>
</head>

<body>

<div class="card p-4 shadow admin-card">
    <h3 class="text-center mb-3">Admin Login</h3>

    <%
        String msg = request.getParameter("msg");
        if("invalid".equals(msg)) {
    %>
        <div class="alert alert-danger">Invalid admin credentials</div>
    <%
        }
    %>

    <form action="../AdminLoginServlet" method="post">
        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <button class="btn btn-dark w-100">Login</button>
    </form>
</div>

</body>
</html>