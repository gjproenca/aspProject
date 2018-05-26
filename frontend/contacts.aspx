﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master-page-front-end.master" AutoEventWireup="true" CodeFile="contacts.aspx.cs" Inherits="frontend_contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="py-5 bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d99579.84795945784!2d-9.230243840186857!3d38.74373959637139!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd19331a61e4f33b%3A0x400ebbde49036d0!2sLisbon!5e0!3m2!1sen!2spt!4v1527333460488" width="100%" height="100%" frameborder="0" style="border: 0" allowfullscreen></iframe>
                </div>
                <div class="col-md-6">
                    <h1>Contact us</h1>
                    <p>We would love to hear from you</p>
                    <form>
                        <div class="form-group">
                            <label for="InputName">Your name</label>
                            <input type="text" class="form-control" id="InputName" placeholder="Your name" maxlength="100">
                        </div>
                        <div class="form-group">
                            <label for="InputEmail1">Email address</label>
                            <input type="email" class="form-control" id="InputEmail1" placeholder="Enter email" maxlength="70">
                        </div>
                        <div class="form-group">
                            <label for="Textarea">Write here</label>
                            <textarea class="form-control" id="Textarea" rows="3" placeholder="Type here" maxlength="250"></textarea>
                        </div>
                        <asp:Button class="btn btn-secondary" ID="submit" runat="server" Text="Submit" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

