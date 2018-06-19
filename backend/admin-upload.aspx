<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-upload.aspx.cs" Inherits="backend_admin_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-5">
        <div class="row justify-content-center mb-3">
            <div class="col-md-12 text-center">
                <asp:linkbutton class="btn btn-dark text-white" id="LinkButton1" runat="server"><i class="fa fa-search"></i> Procurar</asp:linkbutton>
                <asp:textbox id="textBoxSearchPath" runat="server" placeholder="Path"></asp:textbox>
                <asp:radiobuttonlist id="rblSearchActive" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="true">Ativo</asp:ListItem>
                    <asp:ListItem Value="false">Não ativo</asp:ListItem>
                </asp:radiobuttonlist>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div style="width: 100%; height: 750px; overflow: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDUpload" DataSourceID="SqlDataSource1" EmptyDataText="Não existem dados." CssClass="table table-striped table-hover" AllowSorting="True" GridLines="None">
                        <Columns>
                            <asp:CommandField CancelText="Cancelar" EditText="Editar" ShowEditButton="True" UpdateText="Atualizar" />
                            <asp:BoundField DataField="IDUpload" HeaderText="IDUpload" ReadOnly="True" SortExpression="IDUpload" InsertVisible="False" />
                            <asp:BoundField DataField="IDUser" HeaderText="IDUser" SortExpression="IDUser" ReadOnly="True" />
                            <asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" ReadOnly="True" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" ReadOnly="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Upload] WHERE [IDUpload] = @IDUpload" InsertCommand="INSERT INTO [Upload] ([IDUser], [Path], [Active], [Timestamp]) VALUES (@IDUser, @Path, @Active, @Timestamp)" SelectCommand="SELECT [IDUpload], [IDUser], [Path], [Active], [Timestamp] FROM [Upload] WHERE (([Active] = @Active) AND ([Path] LIKE '%' + @Path + '%')) ORDER BY [IDUpload]" UpdateCommand="UPDATE [Upload] SET [Active] = @Active, [Timestamp] = GETDATE() WHERE [IDUpload] = @IDUpload">
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
                            <asp:ControlParameter ControlID="rblSearchActive" DefaultValue="true" Name="Active" PropertyName="SelectedValue" Type="Boolean" />
                            <asp:ControlParameter ControlID="textBoxSearchPath" DefaultValue="%" Name="Path" PropertyName="Text" Type="String" />
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
    </div>
</asp:Content>

