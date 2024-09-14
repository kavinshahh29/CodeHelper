<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Codehelper.Login" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.10.0" defer></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=SUSE:wght@100..800&display=swap" rel="stylesheet">
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
            width: 100%; 
            max-width: 30ch; 
            animation: typewriter 3s steps(30) 0.5s 1 normal both, blink 0.75s step-end infinite;
            text-align: center;
            font-size: 4rem; 
            font-family: "SUSE", sans-serif;
            font-optical-sizing: auto;
            font-weight: 20;
            font-style: normal;
        }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen" style="background-color:darkslategrey">
  
  
    <div class="absolute top-16 w-full text-center">
        <h1 class="typewriter-text text-white">
            Welcome to CodeHelper
        </h1>
    </div>

   
    <div class="relative w-full max-w-2xl bg-white p-8 rounded-lg shadow-md flex flex-col items-center mt-32"> <!-- Added margin-top to push it below the typewriter text -->
        
     
        <div class="flex items-center w-full mt-8">
            
        
            <form id="form1" runat="server" class="w-1/2 p-4">
                <div class="mb-8">
                    <asp:Label ID="lblemail" runat="server" CssClass="block text-gray-700 text-sm font-bold mb-2">Email</asp:Label>
                    <asp:TextBox ID="emailtextbox" TextMode="Email" runat="server" CssClass="shadow appearance-none border rounded w-full py-3 px-4 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="emailtextbox" 
                        ErrorMessage="Email is required." CssClass="text-red-500 text-sm" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="emailtextbox" 
                        ErrorMessage="Invalid email format." CssClass="text-red-500 text-sm" 
                        ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" />
                </div>

                <div class="mb-8">
                    <asp:Label ID="lblpassword" runat="server" CssClass="block text-gray-700 text-sm font-bold mb-2">Password</asp:Label>
                    <asp:TextBox ID="passtextbox" TextMode="Password" runat="server" CssClass="shadow appearance-none border rounded w-full py-3 px-4 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="passtextbox" 
                        ErrorMessage="Password is required." CssClass="text-red-500 text-sm" Display="Dynamic" />
                </div>

                <div class="flex items-center justify-between">
                    <asp:Button OnClick="login_submit" Text="Login" runat="server" CssClass="bg-blue-500 hover:bg-blue-700 text-white font-bold py-3 px-5 rounded focus:outline-none focus:shadow-outline"/>
                    <asp:Button CausesValidation="false" Text="Sign Up" PostBackUrl="~/Signup.aspx" runat="server" CssClass="bg-gray-500 hover:bg-gray-700 text-white font-bold py-3 px-5 rounded focus:outline-none focus:shadow-outline"/>
                </div>
            </form>

         
            <div class="w-1/2 flex justify-center items-center p-4">
                <div class="bg-gray-100 p-6 rounded-lg shadow">
                    <img src="https://th.bing.com/th/id/OIP.SizVjypk092Ai8ULWeugvQHaEr?rs=1&pid=ImgDetMain" alt="Card Image" class="rounded-lg w-full h-auto object-cover" />
                </div>
            </div>
        </div>
    </div>
</body>
</html>
