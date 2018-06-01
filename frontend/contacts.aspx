<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="contacts.aspx.cs" Inherits="frontend_contacts" %>

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
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d99579.84795945784!2d-9.230243840186857!3d38.74373959637139!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd19331a61e4f33b%3A0x400ebbde49036d0!2sLisbon!5e0!3m2!1sen!2spt!4v1527333460488" width="100%" height="100%" frameborder="0" style="border: 0" allowfullscreen></iframe>
                </div>
                <div class="col-md-6">
                    <h1>Contact us</h1>
                    <p>We would love to hear from you</p>
                    <%--<form>--%>
                    <div class="form-group">
                        <label for="InputName">Your name</label>
                        <asp:TextBox class="form-control" ID="textBoxName" runat="server" TextMode="SingleLine" placeholder="Enter your name here" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="InputEmail1">Email address</label>
                        <asp:TextBox type="email" class="form-control" ID="textBoxEmail" runat="server" placeholder="Enter your email here" MaxLength="70"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxEmail" CssClass="auto-style1"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email inválido!" ControlToValidate="textBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="Textarea">Write here</label>
                        <asp:TextBox class="form-control" ID="textBoxMessage" Rows="3" runat="server" placeholder="Enter your message here" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obrigatório!" ControlToValidate="textBoxMessage"></asp:RequiredFieldValidator>
                    </div>
                    <asp:LinkButton class="btn btn-dark text-white" ID="submitContacts" runat="server" OnClick="submit_Click">Submit</asp:LinkButton>
                    <input class="btn btn-dark text-white" id="resetContacts" type="reset" value="Reset" />
                    <%--</form>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

