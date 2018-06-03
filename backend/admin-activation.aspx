<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-admin.master" AutoEventWireup="true" CodeFile="admin-activation.aspx.cs" Inherits="backend_admin_activation" %>

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
                            <h1 class="mb-4">Activate account</h1>
                            <div class="form-group">
                                <label>Activation code</label>
                                <asp:TextBox class="form-control" ID="textBoxCode" runat="server" placeholder="Paste the activation code here"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required field!" ControlToValidate="textBoxCode"></asp:RequiredFieldValidator>
                            </div>
                            <asp:LinkButton  class="btn btn-dark text-white" ID="submitCode" runat="server" OnClick="submitCode_Click">Submit</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;
                            <input class="btn btn-dark text-white" id="resetSignup" type="reset" value="Reset" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

