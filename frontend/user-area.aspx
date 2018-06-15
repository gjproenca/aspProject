<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-user.master" AutoEventWireup="true" CodeFile="user-area.aspx.cs" Inherits="frontend_user_area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-5">
        <div class="row justify-content-center mb-3">
            <div class="col-md-6 text-center">
                <asp:LinkButton class="btn btn-dark text-white" ID="lnkbtnSearch" runat="server">Procurar</asp:LinkButton>
                <asp:TextBox ID="textBoxSearch" runat="server" placeholder="Nome"></asp:TextBox>
            </div>
            <div class="col-md-6 text-center">
                <asp:LinkButton class="btn btn-dark text-white" ID="lnkbtnUpload" runat="server" OnClick="lnkbtnUpload_Click">Carregar</asp:LinkButton>
                <asp:FileUpload ID="fileUpload" runat="server" AllowMultiple="True" CssClass="btn border-dark" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gridViewFiles" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDUpload" DataSourceID="SqlDataSource2" EmptyDataText="Não existem dados." CssClass="table table-striped table-hover" OnRowCommand="gridViewFiles_RowCommand" GridLines="None" ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:CommandField DeleteText="Apagar" HeaderText="Operação" ShowDeleteButton="True" />
                        <asp:BoundField DataField="IDUpload" HeaderText="IDUpload" ReadOnly="True" SortExpression="IDUpload" Visible="False" />
                        <asp:BoundField DataField="IDUser" HeaderText="IDUser" SortExpression="IDUser" Visible="False" />
                        <asp:TemplateField HeaderText="Nome" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    CausesValidation="False"
                                    CommandArgument='<%# Eval("Path") %>'
                                    CommandName="download" Text='<%# Eval("Path") %>'>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" Visible="False" />
                        <asp:BoundField DataField="Timestamp" HeaderText="Data de criação" SortExpression="Timestamp" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="UPDATE [Upload] SET [Active] = 0 WHERE [IDUpload] = @IDUpload" InsertCommand="INSERT INTO [Upload] ([IDUser], [Path], [Active], [Timestamp]) VALUES (@IDUser, @Path, @Active, @Timestamp)" SelectCommand="SELECT [IDUpload], [IDUser], [Path], [Active], [Timestamp] FROM [Upload] WHERE (([IDUser] = @IDUser) AND ([Active] = @Active) AND ([Path] LIKE '%' + @Path + '%')) ORDER BY [Timestamp]" UpdateCommand="UPDATE [Upload] SET [IDUser] = @IDUser, [Path] = @Path, [Active] = @Active, [Timestamp] = @Timestamp WHERE [IDUpload] = @IDUpload">
                    <DeleteParameters>
                        <asp:Parameter Name="IDUpload" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IDUser" Type="Int32" />
                        <asp:Parameter Name="Path" Type="String" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="Timestamp" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="IDUser" SessionField="sessionIDUser" Type="Int32" />
                        <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
                        <asp:ControlParameter ControlID="textBoxSearch" DefaultValue="%" Name="Path" PropertyName="Text" Type="String" />
                    </SelectParameters>
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
</asp:Content>

