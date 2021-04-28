<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication7.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faradis Technical Forum</title>
    <style type="text/css">
        .newStyle1 {
            position: absolute;
            top: 200px;
            right: 400px;
            left: 400px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
    <div style="height: 100px ; width:auto; position:center;">
    <h2 style="color:darkblue; text-align:center; margin-top:50px">Faradis Technical Forum</h2>
        
    
    </div>
         <asp:Login ID="Login1" runat="server" style="z-index: 1; margin-top:50px; left:195px; right:451px ; height: 159px; width: 289px; top: 418px; position: absolute; float: none;" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Inset" BorderWidth="3px" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt">
             <CheckBoxStyle Font-Bold="True" Font-Italic="True" />
             <LoginButtonStyle BorderStyle="Inset" />
             <TextBoxStyle Font-Bold="True" />
             <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:Login>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/im/logo.jpg" />
    </form>
</body>
</html>
