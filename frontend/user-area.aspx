<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-user.master" AutoEventWireup="true" CodeFile="user-area.aspx.cs" Inherits="frontend_user_area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FileUpload ID="fileUpload" runat="server" AllowMultiple="True" />
    <asp:LinkButton class="btn btn-dark text-white" ID="lnkbtnUpload" runat="server" OnClick="lnkbtnUpload_Click">Carregar</asp:LinkButton>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDUpload" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="IDUpload" HeaderText="IDUpload" ReadOnly="True" SortExpression="IDUpload" />
            <asp:BoundField DataField="IDUser" HeaderText="IDUser" SortExpression="IDUser" />
            <asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" />
            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Upload] WHERE [IDUpload] = @IDUpload" InsertCommand="INSERT INTO [Upload] ([IDUser], [Path], [Timestamp]) VALUES (@IDUser, @Path, @Timestamp)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [IDUpload], [IDUser], [Path], [Timestamp] FROM [Upload]" UpdateCommand="UPDATE [Upload] SET [IDUser] = @IDUser, [Path] = @Path, [Timestamp] = @Timestamp WHERE [IDUpload] = @IDUpload">
        <DeleteParameters>
            <asp:Parameter Name="IDUpload" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IDUser" Type="Int32" />
            <asp:Parameter Name="Path" Type="String" />
            <asp:Parameter DbType="DateTime2" Name="Timestamp" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IDUser" Type="Int32" />
            <asp:Parameter Name="Path" Type="String" />
            <asp:Parameter DbType="DateTime2" Name="Timestamp" />
            <asp:Parameter Name="IDUpload" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </asp:Content>

