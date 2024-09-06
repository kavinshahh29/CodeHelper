<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Codehelper.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <form id="form1" runat="server" class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
        <div class="mb-4">
            <asp:Label ID="lblname" runat="server" CssClass="block text-gray-700 text-sm font-bold mb-2">Username</asp:Label>
            <asp:TextBox ID="nametextbox" runat="server" CssClass="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nametextbox" ErrorMessage="Username is required." CssClass="text-red-500 text-xs italic"></asp:RequiredFieldValidator>
        </div>

        <div class="mb-4">
            <asp:Label ID="lblemail" runat="server" CssClass="block text-gray-700 text-sm font-bold mb-2">Email</asp:Label>
            <asp:TextBox ID="emailtextbox" TextMode="Email" runat="server" CssClass="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="emailtextbox" ErrorMessage="Email is required." CssClass="text-red-500 text-xs italic"></asp:RequiredFieldValidator>
        </div>

        <div class="mb-6">
            <asp:Label ID="lblpassword" runat="server" CssClass="block text-gray-700 text-sm font-bold mb-2">Password</asp:Label>
            <asp:TextBox ID="passtextbox" TextMode="Password" runat="server" CssClass="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="passtextbox" ErrorMessage="Password is required." CssClass="text-red-500 text-xs italic"></asp:RequiredFieldValidator>
        </div>

        <div class="flex items-center justify-between">
            <asp:Button OnClick="signup_submit" Text="Sign Up" runat="server" CssClass="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"/>
            <asp:Button  CausesValidation="false" Text="Login" runat="server" PostBackUrl="~/Login.aspx" CssClass="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"/>
        </div>
    </form>
</body>
</html>
