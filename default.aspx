<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="py-5 text-center" style="background-image: url(./images/warehouse.jpg); background-size: cover; background-repeat: no-repeat; background-position: center center;">
        <div class="container py-5">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="display-3 mb-4 text-white">Bem-vindo</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-7">
                    <h2 class="text-primary">Mais rápidos que uma bala</h2>
                    <p class="">
                        Aceda aos seus ficheiros em qualquer lugar e a qualquer hora
                        <br />
                        Os nossos serviços de hospedagem são os mais rápidos do mercado, com velocidades de envio/descarga a chegar a 1GB/s.
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
                    <h2 class="text-primary pt-3">Segurança</h2>
                    <p class="">
                        Os seus ficheiros estão seguros conosco, toda a nossa informação é encriptada com DES (Data Encryption Standard) triplo.
                        <br />
                        DES (Data Encryption Standard) triplo uses três chaves individuais de 56 bits cada. O comprimento total da chave é de 168 bits, o que significa que apenas você terá acesso aos seus ficheiros.
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

