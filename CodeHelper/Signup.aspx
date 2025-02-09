<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Codehelper.Signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
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
           font-family:monospace;
            font-optical-sizing: auto;
            font-weight: 20;
            font-style: normal;
        }
        body {
            background: linear-gradient(135deg, #1a202c, #2d3748);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family:monospace;
        }
        .glassmorphism {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }
        .input-field {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            transition: all 0.3s ease;
        }
        .input-field:focus {
            background: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.4);
            outline: none;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s ease;
        }
        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="absolute top-16 w-full text-center">
        <h1 class="typewriter-text text-white">
            Welcome to CodeHelper
        </h1>
    </div>


    <div class="glassmorphism w-full max-w-2xl p-8 rounded-lg shadow-md flex flex-col items-center mt-32">
        <h1 style="font-size: 36px; color: white; font-family:monospace">SignUp</h1>

        <div class="flex items-center w-full mt-8">
            <form id="form1" runat="server" class="w-1/2 p-4">
                <div class="mb-8">
                    <asp:Label ID="lblname" runat="server" CssClass="block text-white text-sm font-bold mb-2">Username</asp:Label>
                    <asp:TextBox ID="nametextbox" runat="server" CssClass="input-field shadow appearance-none border rounded w-full py-3 px-4 text-white leading-tight focus:outline-none"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nametextbox" 
                        ErrorMessage="Username is required." CssClass="text-red-500 text-sm" Display="Dynamic" />
                </div>

                <div class="mb-8">
                    <asp:Label ID="lblemail" runat="server" CssClass="block text-white text-sm font-bold mb-2">Email</asp:Label>
                    <asp:TextBox ID="emailtextbox" TextMode="Email" runat="server" CssClass="input-field shadow appearance-none border rounded w-full py-3 px-4 text-white leading-tight focus:outline-none"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="emailtextbox" 
                        ErrorMessage="Email is required." CssClass="text-red-500 text-sm" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="emailtextbox" 
                        ErrorMessage="Invalid email format." CssClass="text-red-500 text-sm" 
                        ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" />
                </div>

                <div class="mb-8">
                    <asp:Label ID="lblpassword" runat="server" CssClass="block text-white text-sm font-bold mb-2">Password</asp:Label>
                    <asp:TextBox ID="passtextbox" TextMode="Password" runat="server" CssClass="input-field shadow appearance-none border rounded w-full py-3 px-4 text-white mb-3 leading-tight focus:outline-none"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="passtextbox" 
                        ErrorMessage="Password is required." CssClass="text-red-500 text-sm" Display="Dynamic" />
                </div>

                <div class="flex items-center justify-between">
                    <asp:Button OnClick="signup_submit" Text="Sign Up" runat="server" CssClass="btn-primary font-bold py-3 px-5 rounded focus:outline-none"/>
                    <asp:Button CausesValidation="false" Text="Login" PostBackUrl="~/Login.aspx" runat="server" CssClass="btn-secondary font-bold py-3 px-5 rounded focus:outline-none"/>
                </div>
            </form>

            <div class="w-1/2 flex justify-center items-center p-4">
                <div class="glassmorphism p-6 rounded-lg">
                    <img src="https://th.bing.com/th/id/OIP.SizVjypk092Ai8ULWeugvQHaEr?rs=1&pid=ImgDetMain" alt="Card Image" class="rounded-lg w-full h-auto object-cover" />
                </div>
            </div>
        </div>
    </div>
</body>
</html>