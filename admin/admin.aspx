<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WebApplication7.admin.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
       

                
    <div class="haeder">
    
    </div>
         <table style="position:center; width:100%;"  >
            <tr>
                <th class="tablecel">
    <div >
    
        
    
    </div>
                    </th>
                    <th class="tablecel" >
     <div >
    <div>
         <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
             <ContinueButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
             <CreateUserButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
             <TitleTextStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
             <WizardSteps>
                 <asp:CreateUserWizardStep runat="server" />
                 <asp:CompleteWizardStep runat="server" />
             </WizardSteps>
             <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" HorizontalAlign="Center" />
             <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
             <SideBarButtonStyle ForeColor="White" />
             <SideBarStyle BackColor="#990000" Font-Size="0.9em" VerticalAlign="Top" />
         </asp:CreateUserWizard>
    
        </div>
         <br />
         <br />
         <br />
         <div>
             <table style="width:100%;">
                 <tr>
                     <th style="width:50%;">
             <asp:ListBox ID="userlist" runat="server" Height="147px" width="100%" OnSelectedIndexChanged="userlist_SelectedIndexChanged"></asp:ListBox>
                         </th>
                     <th style="width:50%;">
                         <br /> <br />
                         <asp:TextBox ID ="dp" runat="server" style="width:70%;" Rows="1"></asp:TextBox>
                         <br />
                         <br />
                         <asp:Button ID="rest" runat="server" Text="reset password" style="width:70%;" OnClick="rest_Click" />
                         <br />
                         <br />
                         <asp:Button ID="delette" runat="server" Text="delette user" style="width:70%;" OnClick="delette_Click" />
                         <br />

                     </th>

                     </tr>
                 </table>
         </div>

    </div>
                    </th>
                    <th class="tablecel" >
     <div  class="tablecel">


    
    </div>
                    </th>
            </tr>
        </table>
    </form>
</body>
</html>
