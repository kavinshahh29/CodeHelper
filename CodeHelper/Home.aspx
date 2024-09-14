<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Codehelper.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Codeforces Problem Fetcher</title>
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
                <div class="flex items-center space-x-4">
                   
      

                    
                    <a href="/CreateBlog.aspx" class="text-white font-bold hover:text-gray-300">Create Blog</a>
                    <a href="/ViewBlog.aspx" class="text-white font-bold hover:text-gray-300">View Blog</a>
                    <a href="/Home.aspx" class="text-white font-bold hover:text-gray-300">Problem-Solving</a>
                </div>

               
                <a href="/Logout.aspx" class="text-white font-bold hover:text-gray-300">Logout</a>
            </div>
        </nav>

        <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 mt-4 mx-auto max-w-4xl">
            <h1 class="text-2xl font-bold mb-4">Codeforces Problem Fetcher</h1>

            <label class="block text-gray-700 text-sm font-bold mb-2" for="Usernamefield">Please Enter Your Codeforces Username</label>
            <input id="Usernamefield" type="text" runat="server" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-4" />

            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="btn_click" CssClass="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mb-4" />

            <asp:Literal ID="Literal1" runat="server" />

            <div class="grid grid-cols-2 gap-4 mb-4">
                <asp:Button onClick="ratedproblem" ID="Button800" runat="server" Text="800" CssClass="bg-gray-200 hover:bg-gray-300 text-black font-bold py-2 px-4 rounded" CommandArgument="800-999" CausesValidation="false" />
                <asp:Button onClick="ratedproblem" ID="Button1000" runat="server" Text="1000" CssClass="bg-gray-200 hover:bg-gray-300 text-black font-bold py-2 px-4 rounded" CommandArgument="1000-1199" CausesValidation="false" />
                <asp:Button onClick="ratedproblem" ID="Button1200" runat="server" Text="1200" CssClass="bg-gray-200 hover:bg-gray-300 text-black font-bold py-2 px-4 rounded" CommandArgument="1200-1399" CausesValidation="false" />
                <asp:Button onClick="ratedproblem" ID="Button1400" runat="server" Text="1400" CssClass="bg-gray-200 hover:bg-gray-300 text-black font-bold py-2 px-4 rounded" CommandArgument="1400-1599" CausesValidation="false" />
                <asp:Button onClick="ratedproblem" ID="Button1600" runat="server" Text="1600" CssClass="bg-gray-200 hover:bg-gray-300 text-black font-bold py-2 px-4 rounded" CommandArgument="1600-1799" CausesValidation="false" />
                <asp:Button onClick="ratedproblem" ID="Button1800" runat="server" Text="1800" CssClass="bg-gray-200 hover:bg-gray-300 text-black font-bold py-2 px-4 rounded" CommandArgument="1800-1999" CausesValidation="false" />
                <asp:Button onClick="ratedproblem" ID="Button2000" runat="server" Text="2000" CssClass="bg-gray-200 hover:bg-gray-300 text-black font-bold py-2 px-4 rounded" CommandArgument="2000-2199" CausesValidation="false" />
                <asp:Button onClick="ratedproblem" ID="Button2200" runat="server" Text="2200+" CssClass="bg-gray-200 hover:bg-gray-300 text-black font-bold py-2 px-4 rounded" CommandArgument="2200-3000" CausesValidation="false" />
            </div>
        </div>
    </form>
</body>
</html>
