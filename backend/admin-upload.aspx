<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-upload.aspx.cs" Inherits="backend_admin_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container py-5">
        <div class="row justify-content-center mb-3">
        </div>
        <div class="row">
            <div class="col-md-12">
                <div style="width: 100%; height: 750px; overflow: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDUpload" DataSourceID="SqlDataSource1" EmptyDataText="Não existem dados." CssClass="table table-striped table-hover" AllowSorting="True" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" CancelText="Cancelar" DeleteText="Eliminar Permanentemente" EditText="Editar" />
                            <asp:BoundField DataField="IDUpload" HeaderText="IDUpload" ReadOnly="True" SortExpression="IDUpload" />
                            <asp:BoundField DataField="IDUser" HeaderText="IDUser" SortExpression="IDUser" />
                            <asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Upload] WHERE [IDUpload] = @IDUpload" InsertCommand="INSERT INTO [Upload] ([IDUser], [Path], [Active], [Timestamp]) VALUES (@IDUser, @Path, @Active, @Timestamp)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [IDUpload], [IDUser], [Path], [Active], [Rowversion], [Timestamp] FROM [Upload]" UpdateCommand="UPDATE [Upload] SET [IDUser] = @IDUser, [Path] = @Path, [Active] = @Active, [Timestamp] = @Timestamp WHERE [IDUpload] = @IDUpload">
                        <DeleteParameters>
                            <asp:Parameter Name="IDUpload" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IDUser" Type="Int32" />
                            <asp:Parameter Name="Path" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="IDUser" Type="Int32" />
                            <asp:Parameter Name="Path" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                            <asp:Parameter Name="IDUpload" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <%--TODO: enable bapging and center--%>
</asp:Content>

