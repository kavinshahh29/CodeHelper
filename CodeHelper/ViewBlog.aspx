<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBlog.aspx.cs" Inherits="Codehelper.ViewBlog" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Blogs</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this blog?");
        }
    </script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #1a202c;
            color: #e2e8f0;
        }
        .twitter-card {
            background: linear-gradient(to right, #2a4365, #1e293b);
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .twitter-card:hover {
            transform: scale(1.02);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body class="min-h-screen flex flex-col">
    <form id="form1" runat="server" class="flex-grow">
        <nav class="navbar p-4 bg-gray-800">
            <div class="container mx-auto flex items-center justify-between">
                <div class="flex space-x-4">
                    <a href="/CreateBlog.aspx" class="text-white font-bold hover:text-gray-300">Create Blog</a>
                    <a href="/ViewBlog.aspx" class="text-white font-bold hover:text-gray-300">View Blog</a>
                    <a href="/Home.aspx" class="text-white font-bold hover:text-gray-300">Problem-Solving</a>
                </div>
                <a href="/Logout.aspx" class="text-white font-bold hover:text-gray-300">Logout</a>
            </div>
        </nav>

        <h1 class="text-center text-4xl font-bold mt-6 text-white-200">Latest Blogs</h1>

        <div id="blogContainer" runat="server" class="container mx-auto mt-6 p-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Dynamic Blog Cards will be rendered here -->
        </div>
    </form>

    <footer class="mt-auto py-4 text-center bg-gray-800 text-white text-lg font-semibold">
        Made By Kavin & Kris with ❤️
    </footer>
</body>

</html>

