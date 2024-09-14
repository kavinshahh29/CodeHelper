<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBlog.aspx.cs" Inherits="Codehelper.ViewBlog" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Blogs</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .twitter-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .header img {
            border-radius: 50%;
        }
        .username {
            font-weight: bold;
            font-size: 16px;
        }
        .date {
            color: gray;
            font-size: 14px;
        }
    </style>
</head>
<body class="bg-gray-100" style="background-color:darkslategrey">
    <form id="form1" runat="server">
    
        <nav class="navbar p-4 bg-gray-900">
            <div class="container mx-auto flex items-center justify-between">
                <div class="flex space-x-4">
                    <a href="/CreateBlog.aspx" class="text-white font-bold hover:text-gray-300">Create Blog</a>
                    <a href="/ViewBlog.aspx" class="text-white font-bold hover:text-gray-300">View Blog</a>
                    <a href="/Home.aspx" class="text-white font-bold hover:text-gray-300">Problem-Solving</a>
                </div>
                <a href="/Logout.aspx" class="text-white font-bold hover:text-gray-300">Logout</a>
            </div>
        </nav>

      
        <div id="blogContainer" runat="server" class="container mx-auto mt-8 p-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          
        </div>
    </form>
</body>
</html>
