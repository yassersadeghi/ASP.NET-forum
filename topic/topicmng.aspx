<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="topicmng.aspx.cs" Inherits="WebApplication7.topic.topicmng" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" style="width:100%;" runat="server">
    <div style="width:100%; height:100%;" dir="rtl" >

        <br />
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <br />
        
        <table style="width:100%; height:90%;" >
            <tr>
                <th style="width:10%; height:90%;"></th>
                <th style="width:80%; height:90%;">

                    <asp:Image ID="Image1" runat="server" ImageUrl="~/im/toplogo.png" />
                    <br /><br />
                    <h3>مدیریت نظرات</h3>
                    <br />
                    <br />
                    <asp:LinkButton runat="server" ID="back" PostBackUrl="~/Topics.aspx">بازگشت</asp:LinkButton>
                    <br />
                    <br />

                     <asp:DetailsView ID="DetailsView1" runat="server"  AutoGenerateRows="False" CellPadding="3" DataKeyNames="index1" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="50px" Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" >
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                <asp:BoundField DataField="index1" HeaderText="ردیف" InsertVisible="False" ReadOnly="True" SortExpression="index1" />
                <asp:BoundField DataField="id" HeaderText="شناسه" SortExpression="id" />
                <asp:BoundField DataField="topic" HeaderText="عنوان" SortExpression="topic" />
                <asp:BoundField DataField="creater" HeaderText="پدید آورنده" SortExpression="creater" />
                <asp:BoundField DataField="difinition" HeaderText="شرح" SortExpression="difinition" />
                <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                <asp:BoundField DataField="type" HeaderText="نوع" SortExpression="type" />
                <asp:TemplateField HeaderText="مشخصات" > 
                    <ItemTemplate>
                         <%# Eval("pname") %> <br />
                        <%# Eval("ptype") %> 
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="text" HeaderText="توضیحات" SortExpression="text" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>


                    <asp:GridView ID="GridView1"   runat="server" AllowPaging="True"   AutoGenerateColumns="False" DataKeyNames="index1" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" style="text-align: justify" Width="100%" CssClass="grid2" >
            <Columns>
                <asp:TemplateField ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"  >
                    <ItemTemplate >
                        <%# Eval("creater") %> <br />
                        
                        <%# Eval("propose") %> <br />
                    <div dir="ltr">     <%# Eval("jobno") %>  </div>
                    <div dir="ltr">    <%# Eval("date") %> <br /> </div>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="text" HeaderText="نظرات" SortExpression="text" >
                <ItemStyle Font-Names="arial black" Width="310px" ForeColor="Black" Font-Size="Medium" />
                </asp:BoundField>

                <asp:CommandField  ShowEditButton ="true"  ItemStyle-Width="10%" />
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                
            </Columns>
                   <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                   <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                   <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                   <RowStyle BackColor="White" ForeColor="#003399" />
                   <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                   <SortedAscendingCellStyle BackColor="#EDF6F6" />
                   <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                   <SortedDescendingCellStyle BackColor="#D6DFDF" />
                   <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" EnableCaching="true" CacheDuration="1200" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [topics] where index1 = @ind">

            <SelectParameters>
                <asp:QueryStringParameter Name="ind" QueryStringField="ind"  /> 
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [comment] where topicIndex=@ind"
            UpdateCommand="update comment set 
                text = @text
                where index1 = @index1"
                DeleteCommand="DELETE FROM comment WHERE index1 = @index1"
            >
            <SelectParameters>
                <asp:QueryStringParameter Name="ind" QueryStringField="ind"  /> 
            </SelectParameters>
        </asp:SqlDataSource>


                </th>
                <th style="width:10%; height:90%;"></th>
            </tr>
        </table>

    
    </div>
    </form>
</body>
</html>
