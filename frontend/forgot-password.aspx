<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="forgot-password.aspx.cs" Inherits="frontend_forgot_password" %>

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
                            <h1 class="mb-4">Recuperar senha</h1>
                            <div class="form-group">
                                <label>Email</label>
                                <asp:TextBox class="form-control" ID="textBoxEmail" runat="server" placeholder="Introduza o seu endereço de email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxEmail"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Endereço de email inválido!" ControlToValidate="textBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <asp:LinkButton class="btn btn-dark text-white" ID="submitForgotPassword" runat="server" OnClick="submitForgotPassword_Click" OnClientClick ="return confirm('Tem a certeza?')">Submeter</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;
                            <input class="btn btn-dark text-white" id="resetSignup" type="reset" value="Limpar" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

