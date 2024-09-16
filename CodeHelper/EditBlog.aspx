<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBlog.aspx.cs" Inherits="Codehelper.EditBlog" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Blog</title>
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
<body class="bg-gray-100" style="background-color:darkslategrey">
       <nav class="navbar p-4">
    <div class="container mx-auto flex items-center justify-between">
        <div class="flex items-center space-x-4">
           


            
            <a href="/CreateBlog.aspx" class="text-white font-bold hover:text-gray-300">Create Blog</a>
            <a href="/ViewBlog.aspx" class="text-white font-bold hover:text-gray-300">View Blog</a>
            <a href="/Home.aspx" class="text-white font-bold hover:text-gray-300">Problem-Solving</a>
        </div>

       
        <a href="/Logout.aspx" class="text-white font-bold hover:text-gray-300">Logout</a>
    </div>
</nav>
    <form id="form1" runat="server" class="container mx-auto p-4 mt-8 max-w-lg">
         
        <div class="bg-white p-6 rounded shadow-md">
            <h2 class="text-2xl font-bold mb-4">Edit Blog</h2>

            <label class="block text-gray-700">Title</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="border border-gray-300 p-2 w-full mb-4"></asp:TextBox>

            <label class="block text-gray-700">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="border border-gray-300 p-2 w-full mb-4 h-32"></asp:TextBox>

            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded" OnClick="btnUpdate_Click" />
        </div>
    </form>
</body>
</html>
