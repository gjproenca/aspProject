<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-user.master" AutoEventWireup="true" CodeFile="user-contact.aspx.cs" Inherits="frontend_user_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="py-5 bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <h1>Contacte-nos</h1>
                    <p>Obrigado por nos contactar</p>
                    <div class="form-group">
                        <label for="Textarea">Mensagem</label>
                        <asp:textbox class="form-control" id="textBoxMessage" rows="3" runat="server" placeholder="Introduza a sua mensagem, mínimo 20 carateres, máximo 250" textmode="MultiLine"></asp:textbox>
                        <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" errormessage="Campo obrigatório!" controltovalidate="textBoxMessage"></asp:requiredfieldvalidator>
                        &nbsp;&nbsp;&nbsp;
                        <asp:regularexpressionvalidator id="RegularExpressionValidator2" runat="server" controltovalidate="textBoxMessage" errormessage="A mensagem não preenche os requesitos pedidos!" validationexpression="\w{20,250}"></asp:regularexpressionvalidator>
                    </div>
                    <asp:linkbutton class="btn btn-dark text-white" id="submitContacts" runat="server" onclick="submit_Click">Submeter</asp:linkbutton>
                    <input class="btn btn-dark text-white" id="resetContacts" type="reset" value="Limpar" />
                    <div class="col-md-3">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

