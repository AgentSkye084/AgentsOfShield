<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="AgentsofShield.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Information about this Site</h2>
    </hgroup>

    <article>
        <p>        
            Content Makers: </p>
        <p style="margin-left: 40px">        
            Donald Sisco</p>
        <p style="margin-left: 40px">        
            Casey Dant</p>
        <p style="margin-left: 40px">        
            Runzhi Yang</p>
    </article>
    <aside>
        <h3>Navigation</h3>
        <ul>
            <li><a runat="server" href="~/">Home</a></li>
            <li><a runat="server" href="~/About">About</a></li>
            <li><a runat="server" href="~/Contact">Contact</a></li>
        </ul>
    </aside>
</asp:Content>