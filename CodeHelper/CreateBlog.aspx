<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="CreateBlog.aspx.cs" Inherits="Codehelper.CreateBlog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #1a202c;
            color: #e2e8f0;
        }
        body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

form#form1 {
    flex: 1;
}

        .footer {
    background-color: #2d3748;
    color: #e2e8f0;
    border-radius: 0.5rem;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}
        .navbar {
            background-color: #2d3748;
        }
        .navbar a {
            color: #e2e8f0;
            transition: color 0.3s ease;
        }
        .navbar a:hover {
            color: #63b3ed;
        }
        .card {
            background-color: #2d3748;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            padding: 2rem;
        }
        .input-field {
            background-color: #4a5568;
            color: #e2e8f0;
            border: none;
        }
        .input-field::placeholder {
            color: #cbd5e0;
        }
        .input-field:focus {
            outline: none;
            border: 2px solid #63b3ed;
        }
        .btn {
            transition: all 0.3s ease;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
    </style>
</head>
<body>
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

        <div class="card max-w-4xl mx-auto mt-6">
            <h1 class="text-2xl font-bold text-white mb-4">Create a New Blog</h1>

            <label class="block text-gray-300 text-sm font-bold mb-2">Title</label>
            <asp:TextBox ID="titletextbox" runat="server" CssClass="input-field shadow appearance-none border rounded w-full py-2 px-3 leading-tight focus:shadow-outline mb-4" placeholder="Enter blog title..." />

            <label class="block text-gray-300 text-sm font-bold mb-2">Description</label>
            <asp:TextBox ID="desctextbox" runat="server" TextMode="MultiLine" CssClass="input-field shadow appearance-none border rounded w-full py-2 px-3 leading-tight focus:shadow-outline mb-4 h-32" placeholder="Write your blog content..." />

            <asp:Button ID="createbtn" runat="server" Text="Create Blog" OnClick="createbtn_Click" CssClass="btn bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" />
        </div>
    </form>
    <footer class="mt-auto py-4 text-center bg-gray-800 text-white text-lg font-semibold">
    Made By Kavin & Kris with ❤️
</footer>
</body>
</html>
