<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-contact.aspx.cs" Inherits="backend_admin_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-5">
        <div class="row mb-5">
            <div class="form-group col-md-6">
                <h1>Mensagem</h1>
                <label for="textBoxId">Id</label>
                <asp:TextBox ID="textBoxId" runat="server" ReadOnly="True" Width="100%" CssClass="form-control"></asp:TextBox>
                <br />
                <label for="textBoxName">Nome</label>
                <asp:TextBox ID="textBoxName" runat="server" ReadOnly="True" Width="100%" CssClass="form-control"></asp:TextBox>
                <br />
                <label for="textBoxEmail">Email</label>
                <asp:TextBox ID="textBoxEmail" runat="server" ReadOnly="True" Width="100%" CssClass="form-control"></asp:TextBox>
                <br />
                <label for="textBoxMessage">Mensagem</label>
                <asp:TextBox ID="textBoxMessage" runat="server" ReadOnly="True" Width="100%" Height="150" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                <br />
                <label for="textBoxTimestamp">Data de envio</label>
                <asp:TextBox ID="textBoxTimestamp" runat="server" ReadOnly="True" Width="100%" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <h1>Resposta</h1>
                <label for="textBoxSubject">Assunto</label>
                <asp:TextBox ID="textBoxSubject" runat="server" ReadOnly="False" Width="100%" CssClass="form-control"></asp:TextBox>
                <br />
                <label for="textBoxResponse">Corpo da mensagem</label>
                <asp:TextBox ID="textBoxResponse" runat="server" ReadOnly="False" Width="100%" Height="150px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                <br />
                <br />
                <asp:LinkButton ID="submitResponse" runat="server" OnClick="submitResponse_Click" CssClass="btn navbar-btn btn-dark ml-2 text-white">Submeter</asp:LinkButton>
            </div>
        </div>
        <div class="row justify-content-center mb-3">
            <div class="col-md-12 text-center">
                <asp:LinkButton class="btn btn-dark text-white" ID="LinkButton1" runat="server"><i class="fa fa-search"></i> Procurar</asp:LinkButton>
                <asp:TextBox ID="textBoxSearchName" runat="server" placeholder="Name"></asp:TextBox>
                <asp:TextBox ID="textBoxSearchEmail" runat="server" placeholder="Email"></asp:TextBox>
                <asp:RadioButtonList ID="rblSearchActive" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="true">Ativo</asp:ListItem>
                    <asp:ListItem Value="false">Não ativo</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div style="width: 100%; height: 750px; overflow: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDContact" DataSourceID="SqlDataSource1" EmptyDataText="Não existem dados." CssClass="table table-striped table-hover" AllowSorting="True" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                            <asp:BoundField DataField="IDContact" HeaderText="IDContact" ReadOnly="True" SortExpression="IDContact" InsertVisible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IDContact], [Name], [Email], [Message], [Timestamp] FROM [Contact] WHERE (([Name] LIKE '%' + @Name + '%') AND ([Email] LIKE '%' + @Email + '%') AND ([Active] = @Active)) ORDER BY [IDContact]" DeleteCommand="DELETE FROM [Contact] WHERE [IDContact] = @IDContact" InsertCommand="INSERT INTO [Contact] ([Name], [Email], [Message], [Timestamp]) VALUES (@Name, @Email, @Message, @Timestamp)" UpdateCommand="UPDATE [Contact] SET [Name] = @Name, [Email] = @Email, [Message] = @Message, [Timestamp] = @Timestamp WHERE [IDContact] = @IDContact">
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
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

