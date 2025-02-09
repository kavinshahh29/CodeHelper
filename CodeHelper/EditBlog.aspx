<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBlog.aspx.cs" Inherits="Codehelper.EditBlog" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
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

        <div class="container mx-auto p-4 mt-8 max-w-lg">
            <div class="twitter-card">
                <h2 class="text-2xl font-bold mb-4 text-white">Edit Blog</h2>

                <label class="block text-gray-300">Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="border border-gray-600 p-2 w-full mb-4 bg-gray-700 text-white rounded"></asp:TextBox>

                <label class="block text-gray-300">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="border border-gray-600 p-2 w-full mb-4 h-32 bg-gray-700 text-white rounded"></asp:TextBox>

                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </form>

    <footer class="mt-auto py-4 text-center bg-gray-800 text-white text-lg font-semibold">
        Made By Kavin & Kris with ❤️
    </footer>
</body>
</html>