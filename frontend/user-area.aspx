<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-user.master" AutoEventWireup="true" CodeFile="user-area.aspx.cs" Inherits="frontend_user_area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="container py-5">
        <div class="row justify-content-center mb-3">
            <asp:linkbutton class="btn btn-dark text-white" id="lnkbtnUpload" runat="server" onclick="lnkbtnUpload_Click">Carregar</asp:linkbutton>
            <asp:fileupload id="fileUpload" runat="server" allowmultiple="True" cssclass="btn border-dark" />
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:gridview id="gridViewFiles" runat="server" allowsorting="True" autogeneratecolumns="False" datakeynames="IDUpload" datasourceid="SqlDataSource1" emptydatatext="There are no data records to display." cssclass="table table-striped table-hover" gridlines="None" onrowcommand="gridViewFiles_RowCommand">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Ação" />
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
                        <asp:BoundField DataField="Timestamp" HeaderText="Data de criação" SortExpression="Timestamp" />
                    </Columns>
                </asp:gridview>
                <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString %>" deletecommand="UPDATE [Upload] SET [Active] = 0 WHERE [IDUpload] = @IDUpload" insertcommand="INSERT INTO [Upload] ([IDUser], [Path], [Timestamp]) VALUES (@IDUser, @Path, @Timestamp)" providername="<%$ ConnectionStrings:ConnectionString.ProviderName %>" selectcommand="SELECT [IDUpload], [IDUser], [Path], [Timestamp] FROM [Upload] WHERE [Active] = 1" updatecommand="UPDATE [Upload] SET [IDUser] = @IDUser, [Path] = @Path, [Timestamp] = @Timestamp WHERE [IDUpload] = @IDUpload">
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
                </asp:sqldatasource>
            </div>
        </div>
    </div>
</asp:Content>

