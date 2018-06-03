<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="py-5 text-center" style="background-image: url(./images/warehouse.jpg); background-size: cover; background-repeat: no-repeat; background-position: center center;">
        <div class="container py-5">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="display-3 mb-4 text-white">Welcome</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-7">
                    <h2 class="text-primary">Faster than a bullet</h2>
                    <p class="">
                        Access your files anywhere, everyhwere at anytime.
                        <br />
                        Our cloud services are the fastest on the market, wiht up to 1GP/s download and upload.
                    </p>
                </div>
                <div class="col-md-5 align-self-center">
                    <img class="img-fluid d-block w-100 img-thumbnail" src="./images/bullet.jpg">
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <img class="img-fluid d-block mb-4 w-100 img-thumbnail" src="./images/security.jpg">
                </div>
                <div class="col-md-7">
                    <h2 class="text-primary pt-3">Security</h2>
                    <p class="">
                        Your files are secure with us, we encrypt all of your data with Triple DES.
                        <br />
                        Triple DES uses three individual keys with 56 bits each. The total key length adds up to 168 bits, meaning that nobody will get access to your files but you.
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

