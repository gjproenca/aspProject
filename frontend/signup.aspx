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
                                <asp:TextBox class="form-control" ID="textBoxName" runat="server" placeholder="Enter your name here"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Username</label>
                                <%--<input type="text" class="form-control" placeholder="Enter your username here">--%>
                                <asp:TextBox class="form-control" ID="textBoxUsername" runat="server" placeholder="Enter your username here" TextMode="SingleLine"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <%--<input type="password" class="form-control" placeholder="Enter your password here">--%>
                                <asp:TextBox class="form-control" ID="textBoxPassword" runat="server" placeholder="Enter your password here" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Email address</label>
                                <%--<input type="email" class="form-control" placeholder="Enter your email here">--%>
                                <asp:TextBox class="form-control" ID="textBoxEmail" runat="server" placeholder="Enter your email here" TextMode="Email"></asp:TextBox>
                            </div>
                            <%--<button type="submit" class="btn btn-secondary">Login</button>--%>
                            <asp:LinkButton class="btn btn-secondary" ID="submitSignup" runat="server" OnClick="submitSignup_Click">Submit</asp:LinkButton>
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

