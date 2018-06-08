<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-user.master" AutoEventWireup="true" CodeFile="user-account.aspx.cs" Inherits="frontend_user_account" %>

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
                            <h1 class="mb-4">Alterar dados</h1>
                            <div class="form-group">
                                <label>Nome</label>
                                <asp:TextBox class="form-control" ID="textBoxName" runat="server" placeholder="Mínimo 3 carateres"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxName"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Nome inválido!" ControlToValidate="textBoxName" ValidationExpression="^[A-Za-z]{2,}[A-Za-z\s]*[A-Za-z]$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Nome de utilizador</label>
                                <asp:TextBox class="form-control" ID="textBoxUsername" runat="server" placeholder="Mínimo 8 carateres" TextMode="SingleLine"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxUsername"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Nome de utilizador inválido!" ValidationExpression="^\w{8,}$" ControlToValidate="textBoxUsername"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <asp:TextBox class="form-control" ID="textBoxPassword" runat="server" placeholder="Mínimo 8 carateres" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxPassword"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Senha inválida!" ControlToValidate="textBoxPassword" ValidationExpression="^[^\s].{6,}[^\s]$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Confirmar senha</label>
                                <asp:TextBox class="form-control" ID="textBoxConfirmPassword" runat="server" placeholder="Mínimo 8 carateres" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxConfirmPassword"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Senhas não coincidem!" ControlToCompare="textBoxPassword" ControlToValidate="textBoxConfirmPassword"></asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <label>Endereço de email</label>
                                <asp:TextBox class="form-control" ID="textBoxEmail" runat="server" placeholder="Introduza o seu endereço de email" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxEmail"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Endereço de email inválido!" ControlToValidate="textBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <asp:LinkButton class="btn btn-dark text-white" ID="submitSignup" runat="server" OnClick="submitSignup_Click">Submeter</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;
                            <input class="btn btn-dark text-white" id="resetSignup" type="reset" value="Limpar" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

