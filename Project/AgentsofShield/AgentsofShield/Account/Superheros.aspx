<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Superheros.aspx.vb" Inherits="AgentsofShield.Superheros" %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Superheros Page</h1>
            </hgroup>
            <p>
                This page lists all current Superheros working with S.H.I.E.L.D.</p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <strong><span class="auto-style1">Current Superhero of S.H.I.E.L.D</span></strong><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="SELECT * FROM [SuperHeroView]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Name" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="Handler" HeaderText="Handler" SortExpression="Handler" />
            <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team" />
            <asp:BoundField DataField="Abilities" HeaderText="Abilities" SortExpression="Abilities" />
            <asp:BoundField DataField="TrustLevel" HeaderText="TrustLevel" SortExpression="TrustLevel" />
            <asp:BoundField DataField="AccessLevel" HeaderText="AccessLevel" SortExpression="AccessLevel" />
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
    </style>
</asp:Content>
