<%@ Page Title="Topics" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Topics.aspx.cs" Inherits="WebApplication7.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />

    <asp:ScriptManagerProxy ID="p1" runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="updatePannel1" runat="server">
        <ContentTemplate>
    <div dir="rtl" style="width:100%;" >
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        </div>
    <div dir="rtl" >
    <asp:GridView ID="grid1" runat="server" DataSourceID="source1" AutoGenerateColumns="False" DataKeyNames="index1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None"  OnSelectedindex1Changed="grid1_Selectedindex1Changed"  OnSelectedIndexChanged="grid1_SelectedIndexChanged1" CssClass="grid">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="index1" HeaderText="ردیف" ReadOnly="True" SortExpression="index1" ItemStyle-Width="5%">
            
            
            </asp:BoundField>
            
            <asp:ButtonField ButtonType="Link"  DataTextField="topic" HeaderText="عنوان" CommandName="select" SortExpression="topic" ItemStyle-Width="35%" >
            <ItemStyle Width="100px" />
            </asp:ButtonField>
            <asp:BoundField DataField="id" HeaderText="شناسه" SortExpression="id" ItemStyle-Width="12%" />
            <asp:BoundField DataField="difinition" HeaderText="شرح" SortExpression="difinition" ItemStyle-Width="30%" >
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="creater" HeaderText="پدید آورنده" SortExpression="creater" ItemStyle-Width="8%" />
            <asp:BoundField DataField="date" HeaderText="تاریخ و ساعت" SortExpression="date" ItemStyle-Width="10%" />
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

    <asp:SqlDataSource ID="source1" runat="server" EnableCaching="true" CacheDuration="1200" SelectCommand="SELECT [index1], [topic], [id], [difinition], [creater], [date] FROM [topics] ORDER BY index1 DESC" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>"></asp:SqlDataSource>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .g1 {
            font-family: "B Nazanin";
        }
        .newStyle1 {
            font-family: "B Arash";
            font-size: 14px;
        }
        .auto-style1 {
            font-weight: bold;
            background-color: #FFFFCC;
        }
        </style>
</asp:Content>

