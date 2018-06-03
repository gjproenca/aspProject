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
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d99579.84795945784!2d-9.230243840186857!3d38.74373959637139!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd19331a61e4f33b%3A0x400ebbde49036d0!2sLisbon!5e0!3m2!1sen!2spt!4v1527333460488" width="100%" height="100%" frameborder="0" style="border: 0" allowfullscreen></iframe>
                </div>
                <div class="col-md-6">
                    <h1>Contact us</h1>
                    <p>We would love to hear from you</p>
                    <div class="form-group">
                        <label for="InputName">Your name</label>
                        <asp:textbox class="form-control" id="textBoxName" runat="server" textmode="SingleLine" placeholder="Enter your name here" maxlength="100"></asp:textbox>
                        <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" errormessage="Required field!" controltovalidate="textBoxName"></asp:requiredfieldvalidator>
                    </div>
                    <div class="form-group">
                        <label for="InputEmail1">Email address</label>
                        <asp:textbox type="email" class="form-control" id="textBoxEmail" runat="server" placeholder="Enter your email here" maxlength="70"></asp:textbox>
                        <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" errormessage="Required field!" controltovalidate="textBoxEmail" cssclass="auto-style1"></asp:requiredfieldvalidator>
                        &nbsp;&nbsp;&nbsp;
                       
                        <asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" errormessage="Invalid email!" controltovalidate="textBoxEmail" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator>
                    </div>
                    <div class="form-group">
                        <label for="Textarea">Write here</label>
                        <asp:textbox class="form-control" id="textBoxMessage" rows="3" runat="server" placeholder="Enter your message here, minimum 20 characters maximum 250" textmode="MultiLine"></asp:textbox>
                        <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" errormessage="Required field!" controltovalidate="textBoxMessage"></asp:requiredfieldvalidator>
                    &nbsp;&nbsp;&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="textBoxMessage" ErrorMessage="Message too long!" ValidationExpression="\w{20,250}"></asp:RegularExpressionValidator>
                    </div>
                    <asp:linkbutton class="btn btn-dark text-white" id="submitContacts" runat="server" onclick="submit_Click">Submit</asp:linkbutton>
                    <input class="btn btn-dark text-white" id="resetContacts" type="reset" value="Reset" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

