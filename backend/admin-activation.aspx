<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-activation.aspx.cs" Inherits="backend_admin_activation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-5">
        <div class="row">
            <div class="col-md-12">
                <div style="width: 100%; height: 750px; overflow: auto;">
                    <div class="row justify-content-center mb-3">
                        <div class="col-md-12 text-center">
                            <asp:LinkButton ID="lnkbtnSearch" runat="server" class="btn btn-dark text-white"><i class="fa fa-search"></i> Procurar</asp:LinkButton>
                            <asp:TextBox ID="textBoxSearchUsername" runat="server" placeholder="Username"></asp:TextBox>
                            <asp:TextBox ID="textBoxSearchEmail" runat="server" placeholder="Email"></asp:TextBox>
                            <asp:RadioButtonList ID="rblSearchActive" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="true">Ativo</asp:ListItem>
                                <asp:ListItem Value="false">Não ativo</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RadioButtonList ID="rblSearchAdmin" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="true">Admin</asp:ListItem>
                                <asp:ListItem Value="false">Não admin</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDUser" DataSourceID="SqlDataSource1" EmptyDataText="Não existem dados." CssClass="table table-striped table-hover" GridLines="None">
                        <Columns>
                            <asp:CommandField CancelText="Cancelar" EditText="Editar" ShowEditButton="True" UpdateText="Atualizar" />
                            <asp:BoundField DataField="IDUser" HeaderText="IDUser" ReadOnly="True" SortExpression="IDUser" InsertVisible="False" />
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" ReadOnly="True" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                            <asp:CheckBoxField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" ReadOnly="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [IDUser] = @IDUser" InsertCommand="INSERT INTO [User] ([Username], [Email], [Active], [Admin], [Timestamp]) VALUES (@Username, @Email, @Active, @Admin, @Timestamp)" SelectCommand="SELECT [IDUser], [Username], [Email], [Active], [Admin], [Timestamp] FROM [User] WHERE (([Username] LIKE '%' + @Username + '%') AND ([Active] = @Active) AND ([Admin] = @Admin) AND ([Email] LIKE '%' + @Email + '%')) ORDER BY [IDUser]" UpdateCommand="UPDATE [User] SET [Active] = @Active, [Admin] = @Admin, [Timestamp] = GETDATE() WHERE [IDUser] = @IDUser">
                        <DeleteParameters>
                            <asp:Parameter Name="IDUser" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Admin" Type="Boolean" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="textBoxSearchUsername" DefaultValue="%" Name="Username" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="rblSearchActive" DefaultValue="true" Name="Active" PropertyName="SelectedValue" Type="Boolean" />
                            <asp:ControlParameter ControlID="rblSearchAdmin" DefaultValue="false" Name="Admin" PropertyName="SelectedValue" Type="Boolean" />
                            <asp:ControlParameter ControlID="textBoxSearchEmail" DefaultValue="%" Name="Email" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Username" Type="String" />
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

