<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-user.master" AutoEventWireup="true" CodeFile="user-error.aspx.cs" Inherits="frontend_user_error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container-fluid">
        <div class="row vertical-center">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div class="card border-danger">
                    <div class="card-body text-danger">
                        <h3 class="card-title">Erro!</h3>
                        <p class="card-text">Será redirecionado automaticamente dentro de 5 segundos</p>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
</asp:Content>

