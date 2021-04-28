<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="logs.aspx.cs" Inherits="WebApplication7.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="p1" runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="updatePannel1" runat="server">
        <ContentTemplate>

        <div dir="rtl" style="width:100%;" >
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t1" runat="server" ></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="b1" runat="server" Text="جستجو" OnClick="b1_Click" />

        &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="d1" runat="server" Width="80px">
            <asp:ListItem Text="عنوان" Value="topic"></asp:ListItem>
         
            <asp:ListItem Text="شناسه" Value="id"></asp:ListItem>
            <asp:ListItem Text="پدید آورنده" Value="creater"></asp:ListItem>
        </asp:DropDownList>

        <br />
        <br />
        </div>
    <div dir="rtl" style="width:100%;">
    <asp:GridView ID="grid1" runat="server" DataSourceID="source1" CssClass="grid" class="grid" AutoGenerateColumns="False" DataKeyNames="index1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="grid1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="index1" HeaderText="ردیف" ReadOnly="True" SortExpression="index1" ItemStyle-Width="5%" />
            <asp:ButtonField ButtonType="Link"  DataTextField="topic" HeaderText="عنوان" CommandName="select" SortExpression="topic" ItemStyle-Width="35%" />
            <asp:BoundField DataField="id" HeaderText="شناسه" SortExpression="id" ItemStyle-Width="12%" />
            <asp:BoundField DataField="difinition" HeaderText="شرح" SortExpression="difinition" ItemStyle-Width="30%" />
            <asp:BoundField DataField="creater" HeaderText="پدید آورنده" SortExpression="creater" ItemStyle-Width="8%" />
            <asp:BoundField DataField="date" HeaderText="تاریخ و ساعت" ItemStyle-Width="10%"  SortExpression="date"  />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        </div>

    <asp:SqlDataSource ID="source1" EnableCaching="true" CacheDuration="1200" runat="server" SelectCommand="SELECT [index1], [topic], [id], [difinition], [creater], [date] FROM [topics] where project='LOG' and type=@type ORDER BY index1 DESC" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>">
        <SelectParameters>
            <asp:QueryStringParameter Name="type" QueryStringField="type" />
        </SelectParameters>
    </asp:SqlDataSource>
            
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</asp:Content>

