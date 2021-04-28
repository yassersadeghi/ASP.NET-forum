<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="WebApplication7.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManagerProxy ID="p1" runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="updatePannel1" runat="server">
        <ContentTemplate>

        <div dir="rtl" style="width:50%;" >
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
            <asp:ListItem Text="ردیف" Value="index1"></asp:ListItem>
            <asp:ListItem Text="پدید آورنده" Value="creater"></asp:ListItem>
        </asp:DropDownList>

        <br />
        <br />
        </div>
    <div dir="rtl">
    <asp:GridView ID="grid1" CssClass="grid" runat="server" DataSourceID="source1" AutoGenerateColumns="False" DataKeyNames="index1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedindex1Changed="grid1_Selectedindex1Changed" OnSelectedIndexChanged="grid1_SelectedIndexChanged1">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="index1" HeaderText="ردیف" ReadOnly="True" SortExpression="index1" />
            <asp:ButtonField ButtonType="Link"  DataTextField="topic" HeaderText="عنوان" CommandName="select" SortExpression="topic" />
            <asp:BoundField DataField="id" HeaderText="شناسه" SortExpression="id" />
            <asp:BoundField DataField="difinition" HeaderText="شرح" SortExpression="difinition" />
            <asp:BoundField DataField="creater" HeaderText="پدید آورنده" SortExpression="creater" />
            <asp:BoundField DataField="date" HeaderText="تاریخ و ساعت" SortExpression="date" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        </div>

    <asp:SqlDataSource ID="source1" runat="server" EnableCaching="true" CacheDuration="1200" SelectCommand="SELECT [index1], [topic], [id], [difinition], [creater], [date] FROM [topics] where project='PROJECT' and type=@type" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>">
        <SelectParameters>
            <asp:QueryStringParameter Name="type" QueryStringField="type" />
        </SelectParameters>
    </asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
