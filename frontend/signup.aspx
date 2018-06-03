<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="frontend_signup" %>

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
                            <h1 class="mb-4">Sign Up</h1>
                            <div class="form-group">
                                <label>Name</label>
                                <%--<input type="text" class="form-control" placeholder="Enter your name here">--%>
                                <asp:TextBox class="form-control" ID="textBoxName" runat="server" placeholder="Minimum 3 letters"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required field!" ControlToValidate="textBoxName"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Invalid name!" ControlToValidate="textBoxName" ValidationExpression="^[A-Za-z]{2,}[A-Za-z\s]*[A-Za-z]$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Username</label>
                                <asp:TextBox class="form-control" ID="textBoxUsername" runat="server" placeholder="Minimum 8 chars" TextMode="SingleLine"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required field!" ControlToValidate="textBoxUsername"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Invalid username!" ValidationExpression="^\w{8,}$" ControlToValidate="textBoxUsername"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <asp:TextBox class="form-control" ID="textBoxPassword" runat="server" placeholder="Minimum 8 chars" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required field!" ControlToValidate="textBoxPassword"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Invalid password!" ControlToValidate="textBoxPassword" ValidationExpression="^[^\s].{6,}[^\s]$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Confirm password</label>
                                <asp:TextBox class="form-control" ID="textBoxConfirmPassword" runat="server" placeholder="Minimum 8 chars" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required field!" ControlToValidate="textBoxConfirmPassword"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords don't match!" ControlToCompare="textBoxPassword" ControlToValidate="textBoxConfirmPassword"></asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <label>Email address</label>
                                <asp:TextBox class="form-control" ID="textBoxEmail" runat="server" placeholder="Enter your email here" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required field!" ControlToValidate="textBoxEmail"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Invalid email!" ControlToValidate="textBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <asp:LinkButton class="btn btn-secondary" ID="submitSignup" runat="server" OnClick="submitSignup_Click">Submit</asp:LinkButton>
                             &nbsp;&nbsp;&nbsp;
                            <input class="btn btn-secondary" id="resetSignup" type="reset" value="Reset" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

