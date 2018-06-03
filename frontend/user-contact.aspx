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
                    <h1>Contact us</h1>
                    <p>We would love to hear from you</p>
                    <div class="form-group">
                        <label for="InputName">Your name</label>
                        <asp:TextBox class="form-control" ID="textBoxName" runat="server" TextMode="SingleLine" placeholder="Enter your name here" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required field!" ControlToValidate="textBoxName"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="Textarea">Write here</label>
                        <asp:TextBox class="form-control" ID="textBoxMessage" Rows="3" runat="server" placeholder="Enter your message here, minimum 20 characters maximum 250" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required field!" ControlToValidate="textBoxMessage"></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="textBoxMessage" ErrorMessage="Message too long!" ValidationExpression="\w{20,250}"></asp:RegularExpressionValidator>
                    </div>
                    <asp:LinkButton class="btn btn-dark text-white" ID="submitContacts" runat="server" OnClick="submit_Click">Submit</asp:LinkButton>
                    <input class="btn btn-dark text-white" id="resetContacts" type="reset" value="Reset" />
                    <div class="col-md-3">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

