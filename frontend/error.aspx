<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="frontend_success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row vertical-center">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div class="card border-danger">
                    <div class="card-body text-danger">
                        <h3 class="card-title">Error!</h3>
                        <p class="card-text">You will be automatically redirected in 5 seconds.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
</asp:Content>

