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
                            <%-- TODO: add validations to from --%>
                            <h1 class="mb-4">Sign Up</h1>
                            <%--<form action="https://formspree.io/YOUREMAILHERE">--%>
                            <div class="form-group">
                                <label>Name</label>
                                <%--<input type="text" class="form-control" placeholder="Enter your name here">--%>
                                <asp:textbox class="form-control" id="textBoxName" runat="server" placeholder="Minimum 3 letters"></asp:textbox>
                                <asp:regularexpressionvalidator runat="server" errormessage="Invalid name!" controltovalidate="textBoxName" validationexpression="^[A-Za-z]{3,}\s[A-Za-z\s]*[A-Za-z]$"></asp:regularexpressionvalidator>
                            </div>
                            <div class="form-group">
                                <label>Username</label>
                                <%--<input type="text" class="form-control" placeholder="Enter your username here">--%>
                                <asp:textbox class="form-control" id="textBoxUsername" runat="server" placeholder="Minimum 8 chars" textmode="SingleLine"></asp:textbox>
                                <asp:requiredfieldvalidator runat="server" errormessage="Required field!" controltovalidate="textBoxUsername"></asp:requiredfieldvalidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:regularexpressionvalidator runat="server" errormessage="Invalid username!" validationexpression="^\w{8,}$" ControlToValidate="textBoxUsername"></asp:regularexpressionvalidator>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <%--<input type="password" class="form-control" placeholder="Enter your password here">--%>
                                <asp:textbox class="form-control" id="textBoxPassword" runat="server" placeholder="Minimum 8 chars" textmode="Password"></asp:textbox>
                                <asp:requiredfieldvalidator runat="server" errormessage="Required field!" ControlToValidate="textBoxPassword"></asp:requiredfieldvalidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:regularexpressionvalidator runat="server" errormessage="Invalid password!" ControlToValidate="textBoxPassword" ValidationExpression="^[^\s].*[^\s]$"></asp:regularexpressionvalidator>
                            </div>
                            <div class="form-group">
                                <label>Email address</label>
                                <%--<input type="email" class="form-control" placeholder="Enter your email here">--%>
                                <asp:textbox class="form-control" id="textBoxEmail" runat="server" placeholder="Enter your email here" textmode="Email"></asp:textbox>
                                <asp:requiredfieldvalidator runat="server" errormessage="Required field!" ControlToValidate="textBoxEmail"></asp:requiredfieldvalidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:regularexpressionvalidator runat="server" errormessage="Invalid email!" ControlToValidate="textBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator>
                            </div>
                            <%--<button type="submit" class="btn btn-secondary">Login</button>--%>
                            <asp:linkbutton class="btn btn-secondary" id="submitSignup" runat="server" onclick="submitSignup_Click">Submit</asp:linkbutton>
                            <%--</form>--%>
                             &nbsp;&nbsp;&nbsp;
                            <input class="btn btn-secondary" id="resetSignup" type="reset" value="Reset" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

