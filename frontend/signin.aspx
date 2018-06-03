<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="frontend_signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="card text-white p-5 bg-primary">
                        <div class="card-body">
                            <h1 class="mb-4">Sign In</h1>
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
                            <asp:LinkButton class="btn btn-dark text-white" ID="signin" runat="server" OnClick="signin_Click">Sign In</asp:LinkButton> 
                            &nbsp;&nbsp;&nbsp;
                            <input class="btn btn-dark text-white" id="resetSignin" type="reset" value="Reset" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

