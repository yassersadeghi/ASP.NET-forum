<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mng.aspx.cs" Inherits="WebApplication7.topic.mng" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%; align-self:center; align-items:center;" dir="rtl" >
    <form id="form1" runat="server" >


        

    
    <br />
        
        &nbsp &nbsp

        
        
            
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT [index1], [id], [topic], [creater], [difinition], [date], [type],text,project FROM [topics]"
               UpdateCommand="update topics set 
                id=@id,
                topic=@topic,
                difinition=@difinition,
                text=@text  
                where index1=@index1 "
                DeleteCommand="DELETE FROM topics WHERE index1 = @index1"
                  >
              

            </asp:SqlDataSource>
            <table style="align-self:center; align-items:center; position:center; width:100%;">
        <tr>
            <th style="width:10%"></th>
            <th style="width:80%; height:90%">
        
        <div  dir="rtl" style="width:100%;">

            <asp:Image ID="Image1" runat="server" ImageUrl="~/im/toplogo.png" />


            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h3 dir="rtl" >مدیریت موضاعات</h3>
            <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="back" PostBackUrl="~/Topics.aspx">بازگشت</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t1" runat="server" CssClass="auto-style1" Font-Names="B Nazanin" ></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="b1" runat="server" Text="جستجو" Height="26px" OnClick="b1_Click"  CssClass="auto-style1" Font-Names="B Nazanin" />

        &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="d1" runat="server" Width="80px" CssClass="auto-style1" Font-Names="B Nazanin">
            <asp:ListItem Text="عنوان" Value="topic" Selected="True"></asp:ListItem>
            <asp:ListItem Text="شناسه" Value="id"></asp:ListItem>
            
            <asp:ListItem Text="پدید آورنده" Value="creater"></asp:ListItem>
        </asp:DropDownList>

        <br />
        <br />


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Right" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="index1" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Width="100%" OnRowEditing="GridView1_RowEditing" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ButtonField ButtonType="Link" DataTextField="index1" HeaderText="ردیف" InsertVisible="False" CommandName="select" SortExpression="index1" />
                    <asp:BoundField    DataField="topic" HeaderText="عنوان"  SortExpression="topic" ItemStyle-Width="35%" />
                    <asp:BoundField DataField="id" HeaderText="شناسه" SortExpression="id" />
                    
                  
                    <asp:BoundField DataField="difinition" HeaderText="شرح" SortExpression="difinition" ItemStyle-Width="15%" />
                 
                    
                    <asp:BoundField DataField="text" HeaderText="توضیحات" ItemStyle-Width="35%"   />
                  
                    <asp:CommandField  ShowEditButton ="true"  />
                    <asp:TemplateField ShowHeader="False" >
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle Width="100%" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>


            <br />
            <br />


        </div>
    
            </th>
        <th style="width:10%"></th>

            </tr>
            </table>
    </form>
</body>
</html>
