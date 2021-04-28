<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateTopic.aspx.cs" Inherits="WebApplication7.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <br />
        <br />
    <br />
    <p  style="align-self:center; align-content:center; text-align:center">طرح موضوع جدید</p>
    <table style="width:98%">
        
        <tr style="width:100%">
            <th  style="width:20%"><p style="font:100"> عنوان </p> </th>
            <th style="width:80%">
                <asp:TextBox runat="server" ID="topic" Width="100%"></asp:TextBox>
            </th>
            
        </tr>
        </table>
    <table style="width:98%">
        <tr style="width:100%">
            <th style="width:20%" > <p>نوع</p></th>
            <th style="width:30%">
            <asp:DropDownList runat="server" ID="type" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="type_SelectedIndexChanged" OnTextChanged="type_TextChanged">
                <asp:ListItem Value="ATMsoftware">نرم افزار خودپرداز</asp:ListItem>
                <asp:ListItem Value="ATMhardware">سخت افزار خودپرداز</asp:ListItem>
                <asp:ListItem Value="NETWORKvnb">وی ان بی</asp:ListItem>
                <asp:ListItem Value="NETWORKvsat">وی ست</asp:ListItem>
                <asp:ListItem Value="NETWORKaryasat">آریاست</asp:ListItem>
                <asp:ListItem Value="NETWORKaryagate">آریاگیت</asp:ListItem>
                <asp:ListItem Value="ONLINElinux">لینوکس</asp:ListItem>
                <asp:ListItem Value="ONLINEprinter">پرینتر بانک ایران</asp:ListItem>
                <asp:ListItem Value="ONLINEbankIran">بانک ایران</asp:ListItem>
                </asp:DropDownList>
            </th>
            <th style="width:20%"><p>شناسه</p></th>
            <th style="width:30%">
                <asp:TextBox runat="server" ID="id" Width="100%"></asp:TextBox>
            </th>
        </tr>

        <tr>
            <th style="width:20%"> <p>مشخصات</p>

            </th>

            <th style="width:30%">

                <asp:DropDownList ID="pname" runat="server" Width="100%" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="pname_SelectedIndexChanged"></asp:DropDownList>

            </th>
            <th style="width:20%"></th>
            <th style="width:30%">
                <asp:DropDownList ID="ptype" runat="server" Width="100%" Enabled="False"></asp:DropDownList>

            </th>

        </tr>


        </table>

    <table style="width:98%">
        <tr style="width:100%">
            <th  style="width:20%"><p style="font:100"> شرح </p> </th>
            <th style="width:80%">
                <asp:TextBox runat="server" ID="TextBox2" Width="100%"></asp:TextBox>
            </th>
            
        </tr>
        
    </table>
    <table style="width:98%; height:15%">
        <tr style="width:100%; height:100%" >
            <th style="width:20%; height:100%"> <p>توضیحات</p> </th>
            <th style="width:80%; height:100%"> 
                <asp:TextBox runat="server" ID="text" Width="100%" Height="100%" TextMode="MultiLine"></asp:TextBox>
            </th>
        </tr>
        
    </table>
    <br />

    <table style="width:98%">
    <tr style="width:100%">
        <th style="width:10%"></th>
        <th style="width:80%">

    <asp:Label runat="server" ID="message" Visible="False" ForeColor="#CC0000"><p style="align-content:center">موضوع جدید با موفقیت ثبت شد و ظرف ده دقیقه آینده قابل نمایش خواهد بود</p></asp:Label>
            </th>
        <th style="width:10%"></th>
        </tr>
        </table>

    <table style="width:98%">
    <tr style="width:100%">
        <th style="width:50%">
            <asp:Button runat="server" ID="cancel"  text="انصراف" OnClick="cancel_Click"  />
        </th>
        <th style="width:50%">
            <asp:Button runat="server" ID="send"  text="ثبت موضوع" OnClick="send_Click" />
            </th></tr>
        </table>
    


    
</asp:Content>
