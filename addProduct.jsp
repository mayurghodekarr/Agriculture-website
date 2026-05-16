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
    <title>Add Product</title>
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

        .product-card {
            width: 100%;
            max-width: 500px;
            border-radius: 15px;
        }

        h3 {
            text-align: center;
            color: #1b4332;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .btn-success {
            background-color: #2d6a4f;
            border: none;
        }

        .btn-success:hover {
            background-color: #1b4332;
        }
    </style>
</head>

<body>

<div class="card p-4 shadow product-card">
    <h3>Add Product</h3>

    <%
        String msg = request.getParameter("msg");
        if("success".equals(msg)) {
    %>
        <div class="alert alert-success">Product added successfully</div>
    <%
        }
    %>

    <form action="../AddProductServlet" method="post">
        <div class="mb-3">
            <label>Product Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Category</label>
            <input type="text" name="category" class="form-control">
        </div>

        <div class="mb-3">
            <label>Price</label>
            <input type="number" step="0.01" name="price" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Image Path</label>
            <input type="text" name="image" class="form-control" placeholder="images/tomato.jpg">
        </div>

        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control"></textarea>
        </div>

        <button class="btn btn-success w-100">Add Product</button>
    </form>
</div>

</body>
</html>