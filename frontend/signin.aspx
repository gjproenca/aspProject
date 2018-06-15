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
                                <asp:textbox class="form-control" id="textBoxUsername" runat="server" placeholder="Mínimo 8 carateres" textmode="SingleLine"></asp:textbox>
                                <asp:requiredfieldvalidator runat="server" errormessage="Campo obrigatório!" controltovalidate="textBoxUsername"></asp:requiredfieldvalidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:regularexpressionvalidator runat="server" errormessage="Nome de utilizazdor inválido!" validationexpression="^\w{8,}$" controltovalidate="textBoxUsername"></asp:regularexpressionvalidator>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <asp:textbox class="form-control" id="textBoxPassword" runat="server" placeholder="Mínimo 8 carateres" textmode="Password"></asp:textbox>
                                <asp:requiredfieldvalidator runat="server" errormessage="Campo obrigatório!" controltovalidate="textBoxPassword"></asp:requiredfieldvalidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:regularexpressionvalidator runat="server" errormessage="Senha inválida!" controltovalidate="textBoxPassword" validationexpression="^[^\s].{6,}[^\s]$"></asp:regularexpressionvalidator>
                            </div>
                            <asp:linkbutton class="btn btn-dark text-white" id="signin" runat="server" onclick="signin_Click">Entrar</asp:linkbutton>
                            <input class="btn btn-dark text-white float-sm-right" id="resetSignin" type="reset" value="Limpar" />
                            <br />
                            <br />
                            <asp:hyperlink class="btn btn-dark text-white float-sm-right" id="forgotPassword" runat="server" navigateurl="~/frontend/forgot-password.aspx">Recuperar senha</asp:hyperlink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

