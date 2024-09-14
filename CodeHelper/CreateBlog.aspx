<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="CreateBlog.aspx.cs" Inherits="Codehelper.CreateBlog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .navbar {
            background-color: #1a202c; 
        }
        .navbar a {
            color: #e2e8f0; 
        }
    </style>
</head>
<body style="background-color:darkslategrey">
    <form id="form1" runat="server">
       
        <nav class="navbar p-4">
            <div class="container mx-auto flex items-center justify-between">
                <div class="flex space-x-4">
                    <a href="/CreateBlog.aspx" class="text-white font-bold hover:text-gray-300">Create Blog</a>
                    <a href="/ViewBlog.aspx" class="text-white font-bold hover:text-gray-300">View Blog</a>
                    <a href="/Home.aspx" class="text-white font-bold hover:text-gray-300">Problem-Solving</a>
                </div>
                <a href="/Logout.aspx" class="text-white font-bold hover:text-gray-300">Logout</a>
            </div>
        </nav>

        <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 mt-4 mx-auto max-w-4xl">
            <h1 class="text-2xl font-bold mb-4">Create Blog</h1>

            <asp:TextBox ID="titletextbox" runat="server" CssClass="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-4" placeholder="Title" />
            <asp:TextBox ID="desctextbox" runat="server" TextMode="MultiLine" CssClass="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-4" placeholder="Description" />

            <asp:Button ID="createbtn" runat="server" Text="Create Blog" OnClick="createbtn_Click" CssClass="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" />
        </div>
    </form>
</body>
</html>
