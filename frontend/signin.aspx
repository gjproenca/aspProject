<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="frontend_signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="card text-white p-5 bg-primary">
                        <div class="card-body">
                            <h1 class="mb-4">Entrar</h1>
                            <div class="form-group">
                                <label>Nome de utilizador</label>
                                <asp:TextBox class="form-control" ID="textBoxUsername" runat="server" placeholder="Mínimo 8 carateres" TextMode="SingleLine"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxUsername"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Nome de utilizazdor inválido!" ValidationExpression="^\w{8,}$" ControlToValidate="textBoxUsername"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <asp:TextBox class="form-control" ID="textBoxPassword" runat="server" placeholder="Mínimo 8 carateres" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxPassword"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Senha inválida!" ControlToValidate="textBoxPassword" ValidationExpression="^[^\s].{6,}[^\s]$"></asp:RegularExpressionValidator>
                            </div>
                            <asp:LinkButton class="btn btn-dark text-white" ID="signin" runat="server" OnClick="signin_Click">Entrar</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;
                            <input class="btn btn-dark text-white" id="resetSignin" type="reset" value="Limpar" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:HyperLink class="btn btn-dark text-white float-sm-right" ID="forgotPassword" runat="server" NavigateUrl="~/frontend/forgot-password.aspx">Recuperar senha</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

