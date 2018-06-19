<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-area.aspx.cs" Inherits="backend_admin_area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-5">
        <div class="row justify-content-center mb-3">
            <div class="col-md-12 text-center">
                <asp:LinkButton class="btn btn-dark text-white" ID="lnkbtnSearch" runat="server"><i class="fa fa-search"></i> Procurar</asp:LinkButton>
                <asp:TextBox ID="textBoxSearchName" runat="server" placeholder="Name" AutoPostBack="True"></asp:TextBox>
                <asp:TextBox ID="textBoxSearchUsername" runat="server" placeholder="Username" AutoPostBack="True"></asp:TextBox>
                <asp:TextBox ID="textBoxSearchEmail" runat="server" placeholder="Email" AutoPostBack="True"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div style="width: 100%; height: 750px; overflow: auto;">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDUser" DataSourceID="SqlDataSource1" EmptyDataText="Não existem dados." CssClass="table table-striped table-hover" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" InsertText="Inserir" SelectText="Selecionar" UpdateText="Atualizar" />
                            <asp:BoundField DataField="IDUser" HeaderText="IDUser" ReadOnly="True" SortExpression="IDUser" InsertVisible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" ReadOnly="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [IDUser] = @IDUser" InsertCommand="INSERT INTO [User] ([Name], [Username], [Email], [Timestamp]) VALUES (@Name, @Username, @Email, @Timestamp)" SelectCommand="SELECT [IDUser], [Name], [Username], [Email], [Timestamp] FROM [User] WHERE (([Name] LIKE '%' + @Name + '%') AND ([Username] LIKE '%' + @Username + '%') AND ([Email] LIKE '%' + @Email + '%')) ORDER BY [IDUser]" UpdateCommand="UPDATE [User] SET [Name] = @Name, [Username] = @Username, [Email] = @Email, [Timestamp] = GETDATE() WHERE [IDUser] = @IDUser">
                        <DeleteParameters>
                            <asp:Parameter Name="IDUser" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="textBoxSearchName" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="textBoxSearchUsername" DefaultValue="%" Name="Username" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="textBoxSearchEmail" DefaultValue="%" Name="Email" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                            <asp:Parameter Name="IDUser" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

