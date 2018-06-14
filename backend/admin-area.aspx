<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-area.aspx.cs" Inherits="backend_admin_area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-5">
        <div class="row justify-content-center mb-3">
        </div>
        <div class="row">
            <div class="col-md-12">
                <div style="width: 100%; height: 750px; overflow: auto;">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDUser" DataSourceID="SqlDataSource1" EmptyDataText="Não existem dados." CssClass="table table-striped table-hover" GridLines="None">
                        <Columns>
                            <asp:CommandField CancelText="Cancelar" DeleteText="Apagar permanentemente" EditText="Editar |" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Atualizar" />
                            <asp:BoundField DataField="IDUser" HeaderText="ID utilizador" ReadOnly="True" SortExpression="IDUser" />
                            <asp:BoundField DataField="Name" HeaderText="Nome" SortExpression="Name" />
                            <asp:BoundField DataField="Username" HeaderText="Nome de utilizador" SortExpression="Username" />
                            <asp:BoundField DataField="Password" HeaderText="Senha" SortExpression="Password" Visible="False" />
                            <asp:BoundField DataField="Email" HeaderText="Endereço de email" SortExpression="Email" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Ativo" SortExpression="Active" Visible="False" />
                            <asp:CheckBoxField DataField="Admin" HeaderText="Admin" SortExpression="Admin" Visible="False" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Data de modificação" SortExpression="Timestamp" ReadOnly="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [IDUser] = @IDUser" InsertCommand="INSERT INTO [User] ([Name], [Username], [Password], [Email], [Active], [Admin], [Timestamp]) VALUES (@Name, @Username, @Password, @Email, @Active, @Admin, @Timestamp)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [IDUser], [Name], [Username], [Password], [Email], [Active], [Admin], [Rowversion], [Timestamp] FROM [User]" UpdateCommand="UPDATE [User] SET [Name] = @Name, [Username] = @Username, [Email] = @Email, [Timestamp] = GETDATE() WHERE [IDUser] = @IDUser">
                        <DeleteParameters>
                            <asp:Parameter Name="IDUser" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Admin" Type="Boolean" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Admin" Type="Boolean" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                            <asp:Parameter Name="IDUser" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

