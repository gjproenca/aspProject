<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-user-contact.aspx.cs" Inherits="backend_admin_user_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container py-5">
        <div class="row justify-content-center mb-3">
        </div>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxSubject"></asp:RequiredFieldValidator>
                <br />
                <label for="textBoxResponse">Corpo da mensagem</label>
                <asp:TextBox ID="textBoxResponse" runat="server" ReadOnly="False" Width="100%" Height="150px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxResponse"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:LinkButton ID="submitResponse" runat="server" OnClick="submitResponse_Click" CssClass="btn navbar-btn btn-dark ml-2 text-white">Submeter</asp:LinkButton>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div style="width: 100%; height: 750px; overflow: scroll;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDUserContact" DataSourceID="SqlDataSource2" EmptyDataText="Não existem dados." CssClass="table table-striped table-hover" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="IDUserContact" HeaderText="IDUserContact" ReadOnly="True" SortExpression="IDUserContact" InsertVisible="False" />
                            <asp:BoundField DataField="IDUser" HeaderText="IDUser" SortExpression="IDUser" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IDUserContact], [IDUser], [Name], [Username], [Email], [Message], [Active], [Timestamp] FROM [UserContact]">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

