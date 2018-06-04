<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-user.master" AutoEventWireup="true" CodeFile="user-area.aspx.cs" Inherits="frontend_user_area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FileUpload ID="fileUpload" runat="server" AllowMultiple="True" />
    <br />
    <asp:LinkButton class="btn btn-dark text-white" ID="lnkbtnUpload" runat="server" OnClick="lnkbtnUpload_Click">LinkButton</asp:LinkButton>
</asp:Content>

