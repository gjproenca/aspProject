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
                        <asp:TextBox class="form-control" ID="textBoxMessage" Rows="3" runat="server" placeholder="Introduza a sua mensagem" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxMessage"></asp:RequiredFieldValidator>
                    </div>
                    <asp:LinkButton class="btn btn-dark text-white" ID="submitContacts" runat="server" OnClick="submit_Click">Submeter</asp:LinkButton>
                    <input class="btn btn-dark text-white float-sm-right" id="resetContacts" type="reset" value="Limpar" />
                    <div class="col-md-3">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

