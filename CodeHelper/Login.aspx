<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Codehelper.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.10.0" defer></script>
        <style>
        @keyframes typewriter {
            from { width: 0; }
            to { width: 100%; }
        }
        @keyframes blink {
            50% { border-color: transparent; }
        }
        .typewriter-text {
            display: inline-block;
            white-space: nowrap;
            overflow: hidden;
            border-right: 3px solid;
            width: 100%; /* Full width typing */
            max-width: 20ch; /* Stops at a certain width */
            animation: typewriter 3s steps(20) 0.5s 1 normal both, blink 0.75s step-end infinite;
            text-align: center;
        }
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
      <div class="absolute top-0 left-0 right-0 text-center mt-8">    
        <h1 class="text-3xl font-bold text-gray-800 typewriter-text">
            Welcome to CodeHelper
        </h1>
    </div>
    <form id="form1" runat="server" class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
        <div class="mb-8">
            <asp:Label ID="lblemail" runat="server" CssClass="block text-gray-700 text-sm font-bold mb-2">Email</asp:Label>
            <asp:TextBox ID="emailtextbox" TextMode="Email" runat="server" CssClass="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="emailtextbox" 
                ErrorMessage="Email is required." CssClass="text-red-500 text-sm" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="emailtextbox" 
                ErrorMessage="Invalid email format." CssClass="text-red-500 text-sm" 
                ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" />
        </div>

        <div class="mb-8">
            <asp:Label ID="lblpassword" runat="server" CssClass="block text-gray-700 text-sm font-bold mb-2">Password</asp:Label>
            <asp:TextBox ID="passtextbox" TextMode="Password" runat="server" CssClass="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="passtextbox" 
                ErrorMessage="Password is required." CssClass="text-red-500 text-sm" Display="Dynamic" />
        </div>

        <div class="flex items-center justify-between">
            <asp:Button OnClick="login_submit" Text="Login" runat="server" CssClass="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"/>
            <asp:Button CausesValidation="false" Text="Sign Up" PostBackUrl="~/Signup.aspx" runat="server" CssClass="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"/>
        </div>
    </form>
</body>
</html>
