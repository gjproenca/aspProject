<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="frontend_contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-family: "Segoe UI";
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="contactsForm" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="py-5 bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3112.1051384428206!2d-9.149991018320703!3d38.73834949593829!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa6833f2027bb59d4!2sCiteforma+-+Centro+de+Forma%C3%A7%C3%A3o+Profissional+dos+Trabalhadores+de+Escrit%C3%B3rio%2C+Com%C3%A9rcio%2C+Servi%C3%A7os+e+Novas+Tecnologias!5e0!3m2!1sen!2spt!4v1528056320966" width="100%" height="100%" frameborder="0" style="border: 0" allowfullscreen></iframe>
                </div>
                <div class="col-md-6">
                    <h1>Contacte-nos</h1>
                    <p>Obrigado pelo seu interesse, responderemos assim que pudermos</p>
                    <div class="form-group">
                        <label for="InputName">Nome</label>
                        <asp:textbox class="form-control" id="textBoxName" runat="server" textmode="SingleLine" placeholder="Introduza o seu nome" maxlength="100"></asp:textbox>
                        <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" errormessage="Campo obrigatório!" controltovalidate="textBoxName"></asp:requiredfieldvalidator>
                    </div>
                    <div class="form-group">
                        <label for="InputEmail1">Endereço de email</label>
                        <asp:textbox type="email" class="form-control" id="textBoxEmail" runat="server" placeholder="Introduza o seu endereço de email" maxlength="70"></asp:textbox>
                        <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" errormessage="Campo obrigatório!" controltovalidate="textBoxEmail" cssclass="auto-style1"></asp:requiredfieldvalidator>
                        &nbsp;&nbsp;&nbsp;
                       <asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" errormessage="Endereço de email inválido!" controltovalidate="textBoxEmail" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator>
                    </div>
                    <div class="form-group">
                        <label for="Textarea">Mensagem</label>
                        <asp:textbox class="form-control" id="textBoxMessage" rows="3" runat="server" placeholder="Introduza a sua mensagem, mínimo 20 carateres, máximo 250" textmode="MultiLine"></asp:textbox>
                        <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" errormessage="Campo obrigatório!" controltovalidate="textBoxMessage"></asp:requiredfieldvalidator>
                        &nbsp;&nbsp;&nbsp;
                        <asp:regularexpressionvalidator id="RegularExpressionValidator2" runat="server" controltovalidate="textBoxMessage" errormessage="Mensagem demasiado longa!" validationexpression="\w{20,250}"></asp:regularexpressionvalidator>
                    </div>
                    <asp:linkbutton class="btn btn-dark text-white" id="submitContacts" runat="server" onclick="submit_Click">Submeter</asp:linkbutton>
                    <input class="btn btn-dark text-white" id="resetContacts" type="reset" value="Limpar" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

