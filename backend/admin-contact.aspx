<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-contact.aspx.cs" Inherits="backend_admin_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-5">
        <div class="row mb-5">
            <div class="form-group col-md-6">
                <h1>Mensagem</h1>
                <label for="textBoxId">Id</label>
                <asp:textbox id="textBoxId" runat="server" readonly="True" width="100%" cssclass="form-control"></asp:textbox>
                <br />
                <label for="textBoxName">Nome</label>
                <asp:textbox id="textBoxName" runat="server" readonly="True" width="100%" cssclass="form-control"></asp:textbox>
                <br />
                <label for="textBoxEmail">Email</label>
                <asp:textbox id="textBoxEmail" runat="server" readonly="True" width="100%" cssclass="form-control"></asp:textbox>
                <br />
                <label for="textBoxMessage">Mensagem</label>
                <asp:textbox id="textBoxMessage" runat="server" readonly="True" width="100%" height="150" textmode="MultiLine" cssclass="form-control"></asp:textbox>
                <br />
                <label for="textBoxTimestamp">Data de envio</label>
                <asp:textbox id="textBoxTimestamp" runat="server" readonly="True" width="100%" cssclass="form-control"></asp:textbox>
            </div>
            <div class="form-group col-md-6">
                <h1>Resposta</h1>
                <label for="textBoxSubject">Assunto</label>
                <asp:textbox id="textBoxSubject" runat="server" readonly="False" width="100%" cssclass="form-control"></asp:textbox>
                <br />
                <label for="textBoxResponse">Corpo da mensagem</label>
                <asp:textbox id="textBoxResponse" runat="server" readonly="False" width="100%" height="150px" textmode="MultiLine" cssclass="form-control"></asp:textbox>
                <br />
                <br />
                <asp:linkbutton id="submitResponse" runat="server" onclick="submitResponse_Click" cssclass="btn navbar-btn btn-dark ml-2 text-white">Submeter</asp:linkbutton>
            </div>
        </div>
        <div class="row justify-content-center mb-3">
            <div class="col-md-12 text-center">
                <asp:linkbutton class="btn btn-dark text-white" id="LinkButton1" runat="server"><i class="fa fa-search"></i> Procurar</asp:linkbutton>
                <asp:textbox id="textBoxSearchName" runat="server" placeholder="Name" autopostback="True"></asp:textbox>
                <asp:textbox id="textBoxSearchEmail" runat="server" placeholder="Email" autopostback="True"></asp:textbox>
                <asp:radiobuttonlist id="rblSearchActive" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="true">Ativo</asp:ListItem>
                    <asp:ListItem Value="false">Não ativo</asp:ListItem>
                </asp:radiobuttonlist>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div style="width: 100%; height: 750px; overflow: auto;">
                    <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" datakeynames="IDContact" datasourceid="SqlDataSource1" emptydatatext="Não existem dados." cssclass="table table-striped table-hover" allowsorting="True" gridlines="None" onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                            <asp:BoundField DataField="IDContact" HeaderText="IDContact" ReadOnly="True" SortExpression="IDContact" InsertVisible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" />
                        </Columns>
                    </asp:gridview>
                    <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString %>" selectcommand="SELECT [IDContact], [Name], [Email], [Message], [Timestamp] FROM [Contact] WHERE (([Name] LIKE '%' + @Name + '%') AND ([Email] LIKE '%' + @Email + '%') AND ([Active] = @Active)) ORDER BY [IDContact]" DeleteCommand="DELETE FROM [Contact] WHERE [IDContact] = @IDContact" InsertCommand="INSERT INTO [Contact] ([Name], [Email], [Message], [Timestamp]) VALUES (@Name, @Email, @Message, @Timestamp)" UpdateCommand="UPDATE [Contact] SET [Name] = @Name, [Email] = @Email, [Message] = @Message, [Timestamp] = @Timestamp WHERE [IDContact] = @IDContact">
                        <DeleteParameters>
                            <asp:Parameter Name="IDContact" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Message" Type="String" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="textBoxSearchName" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="textBoxSearchEmail" DefaultValue="%" Name="Email" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="rblSearchActive" DefaultValue="true" Name="Active" PropertyName="SelectedValue" Type="Boolean" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Message" Type="String" />
                            <asp:Parameter Name="Timestamp" Type="DateTime" />
                            <asp:Parameter Name="IDContact" Type="Int32" />
                        </UpdateParameters>
                    </asp:sqldatasource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

