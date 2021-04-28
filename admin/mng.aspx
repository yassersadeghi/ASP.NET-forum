<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mng.aspx.cs" Inherits="WebApplication7.admin.mng" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User management</title>
    <link href="../StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width:100%">
        <tr>
            <th style="width:30%"></th>
            <th style="width:50%">
                <br /><br /><br />

   
            
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" MembershipProvider="myprovider" Font-Size="0.8em" OnCreatedUser="CreateUserWizard1_CreatedUser" ContinueDestinationPageUrl="~/admin/mng.aspx" LoginCreatedUser="False">
                <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server" />
                    <asp:CompleteWizardStep runat="server" />
                </WizardSteps>
                <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
                <StepStyle BorderWidth="0px" />
            </asp:CreateUserWizard>
            
             
                       
                         <br /> <br />
                         <asp:TextBox ID ="dp" runat="server" style="width:30%;" Rows="1"></asp:TextBox>
                         <br />
                         <br />
                         <asp:Button ID="rest" runat="server" Text="reset password" style="width:30%;" OnClick="rest_Click" />
                         <br />
                         <br />
                         <asp:Button ID="delette" runat="server" Text="delette user" style="width:30%;" OnClick="delette_Click" />
                         <br />
                         <br />
                         <asp:Button ID="Button1" runat="server" Text="Add user to" OnClick="Button1_Click" Width="110px" />
&nbsp;
                         <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 8px" Width="76px"></asp:TextBox>
                         <br />
                         <br />
                         <asp:Button ID="Unlock" runat="server" Text="Unlock user" style="width:30%;" OnClick="Unlock_Click" />
                         <br />

                  

            <br />

                &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t1" runat="server" ></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="b1" runat="server" Text="Search" OnClick="b1_Click" />
                
                 <br />
                
                <asp:GridView ID="griduser" runat="server" AutoGenerateColumns="False" SelectedIndex="0" DataKeyNames="UserName" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="griduser_SelectedIndexChanged" AllowPaging="True">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                    <asp:CommandField ShowSelectButton="true" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
                
                <br />

            <asp:DetailsView ID="detailsuser" Width="90%" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>
        
            
      

      </th>
            <th style="width:20%"></th>
        </tr>
    </table>
    </form>
</body>
</html>
