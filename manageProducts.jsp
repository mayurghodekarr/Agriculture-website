<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.grocery.DBConnection" %>
<%
    if(session.getAttribute("admin") == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #d9fdd3, #b7e4c7, #95d5b2);
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            margin-top: 30px;
        }

        h2 {
            color: #2d6a4f;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-secondary {
            background-color: #40916c;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #2d6a4f;
        }

        .table {
            background-color: white;
        }

        .table th {
            background-color: #52b788;
            color: white;
            text-align: center;
            vertical-align: middle;
        }

        .table td {
            vertical-align: middle;
        }

        .form-control {
            border: 1px solid #95d5b2;
        }

        .form-control:focus {
            border-color: #40916c;
            box-shadow: 0 0 5px rgba(64, 145, 108, 0.5);
        }

        .btn-primary {
            background-color: #2d6a4f;
            border: none;
        }

        .btn-primary:hover {
            background-color: #1b4332;
        }

        .btn-danger {
            background-color: #d62828;
            border: none;
        }

        .btn-danger:hover {
            background-color: #a4161a;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2>Manage Products</h2>
    <a href="dashboard.jsp" class="btn btn-secondary mb-3">Back</a>

    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Image</th>
            <th>Description</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Connection con = DBConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM products");

                while(rs.next()) {
        %>
        <tr>
            <form action="../UpdateProductServlet" method="post">
                <td>
                    <%= rs.getInt("id") %>
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                </td>
                <td><input type="text" name="name" value="<%= rs.getString("name") %>" class="form-control"></td>
                <td><input type="text" name="category" value="<%= rs.getString("category") %>" class="form-control"></td>
                <td><input type="number" step="0.01" name="price" value="<%= rs.getDouble("price") %>" class="form-control"></td>
                <td><input type="text" name="image" value="<%= rs.getString("image") %>" class="form-control"></td>
                <td><input type="text" name="description" value="<%= rs.getString("description") %>" class="form-control"></td>
                <td>
                    <button class="btn btn-primary btn-sm mb-1">Update</button>
                    <a href="../DeleteProductServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </form>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.print("Error: " + e.getMessage());
            }
        %>
    </table>
</div>
</body>
</html>