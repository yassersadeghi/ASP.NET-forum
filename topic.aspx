<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="topic.aspx.cs" Inherits="WebApplication7.WebForm4" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

    <p>
        <br />
        <div>
            <table style="width:100%">
                <tr>
                    <th class="auto-style1" >
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

            </th>
             <th class="auto-style1">
                 <asp:Chart ID="Chart1" runat="server">
                     <Series>
                         <asp:Series ChartType="Doughnut" Name="Series1">
                         </asp:Series>
                     </Series>
                     <ChartAreas>
                         <asp:ChartArea Name="ChartArea1">
                         </asp:ChartArea>
                     </ChartAreas>
                 </asp:Chart>
                    </th>
                    </tr>
                </table>

            </div>
    </p>
    <p>
        <div  >     
               <asp:GridView ID="GridView1"   runat="server" AllowPaging="True"   AutoGenerateColumns="False" DataKeyNames="index1" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" style="text-align: justify" Width="100%" CssClass="grid2" PageSize="3" >
            <Columns>
                <asp:TemplateField ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"  >
                    <ItemTemplate >
                        <%# Eval("creater") %> <br />
                        
                        <%# Eval("propose") %> <br />
                    <div dir="ltr">     <%# Eval("jobno") %>  </div>
                    <div dir="ltr">    <%# Eval("date") %> <br /> </div>
                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                </asp:TemplateField>
                
                <asp:BoundField DataField="text" HeaderText="نظرات" SortExpression="text" >
                <ItemStyle Font-Names="arial black" Width="310px" ForeColor="Black" Font-Size="Medium" />
                </asp:BoundField>
                
            </Columns>
                   <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                   <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                   <PagerSettings Mode="NumericFirstLast" />
                   <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Center" />
                   <RowStyle BackColor="White" ForeColor="#003399" />
                   <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                   <SortedAscendingCellStyle BackColor="#EDF6F6" />
                   <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                   <SortedDescendingCellStyle BackColor="#D6DFDF" />
                   <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>

            <div>
            <br />
            <br />
            <br />

                
            <h4 >&nbsp;&nbsp;&nbsp;&nbsp; تجربه شما   </h4>
            <br />
            <asp:TextBox ID="text3" runat="server"  Width="98%" Height="170" OnTextChanged="text3_TextChanged" TextMode="MultiLine" Font-Names="Arial Black" Font-Bold="True" BackColor="#ECEEFB" BorderColor="#000066" BorderStyle="Groove" BorderWidth="2px" ForeColor="Black"></asp:TextBox>
        </div>
            <br />


            <table style="width:98%">
    <tr style="width:100%">
        <th style="width:10%"></th>
        <th style="width:80%">

    <asp:Label runat="server" ID="message" Visible="False" ForeColor="#CC0000"><p style="align-content:center">  تجربه شما با موفقیت ثبت شد و ظرف بیست دقیقه آینده قابل نمایش خواهد بود</p></asp:Label>
            </th>
        <th style="width:10%"></th>
        </tr>
        </table>

            <table style="width:100%;">
                <tr style="width:100%;">
                    <th style="width:20%;">
                        <asp:Button runat="server" ID="cancel" Text="انصراف" style="width:50%;" OnClick="cancel_Click" />
                    </th>
                    
                    <th style="width:30%;"> شماره کار 
                        <asp:TextBox runat="server" ID="jobno" style="width:50%;" ViewStateMode="Disabled" />

                    </th>
                    <th style="width:30%;"> راه کار 
                        <asp:DropDownList runat="server" ID="plist" style="width:70%;" BackColor="#CCFFCC" >
                        </asp:DropDownList>
                    </th>
                    <th style="width:20%;">
        <asp:Button runat="server" ID="send" Text="ارسال"  OnClick="send_Click"  style="width:50%;" />
                    </th>
                    
                    </tr>
                </table>
            <br />
            <br />
            <br />
            </div>

        
    </p>
    <p>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" EnableCaching="true" CacheDuration="1200" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [topics] where index1 = @ind">

            <SelectParameters>
                <asp:QueryStringParameter Name="ind" QueryStringField="ind"  /> 
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [comment] where topicIndex=@ind">
            <SelectParameters>
                <asp:QueryStringParameter Name="ind" QueryStringField="ind"  /> 
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 230px;
            height: 408px;
        }
    </style>
</asp:Content>

