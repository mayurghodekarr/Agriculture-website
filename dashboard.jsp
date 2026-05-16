<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if(session.getAttribute("admin") == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #d8f3dc, #95d5b2);
            font-family: Arial, sans-serif;
        }

        .dashboard-card {
            text-align: center;
            padding: 30px;
            border-radius: 15px;
            background: #ffffff;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            color: #1b4332;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .btn {
            width: 100%;
            margin-bottom: 10px;
            border-radius: 25px;
        }

        .btn-success {
            background-color: #2d6a4f;
            border: none;
        }

        .btn-success:hover {
            background-color: #1b4332;
        }

        .btn-primary {
            background-color: #40916c;
            border: none;
        }

        .btn-primary:hover {
            background-color: #2d6a4f;
        }

        .btn-danger {
            background-color: #d00000;
            border: none;
        }

        .btn-danger:hover {
            background-color: #9d0208;
        }
    </style>
</head>

<body>

<div class="dashboard-card">
    <h2>Admin Dashboard</h2>

    <a href="addProduct.jsp" class="btn btn-success">Add Product</a>
    <a href="manageProducts.jsp" class="btn btn-primary">Manage Products</a>
    <a href="logout.jsp" class="btn btn-danger">Logout</a>
</div>

</body>
</html>