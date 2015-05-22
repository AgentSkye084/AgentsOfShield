<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Targets.aspx.vb" Inherits="AgentsofShield.Targets" %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Target Page</h1>
            </hgroup>
            <p>
                This page lists all current targets of S.H.I.E.L.D.</p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <strong><span class="auto-style1">Current Targets of S.H.I.E.L.D</span></strong><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="SELECT [Name], [Description], [ThreatLevel] FROM [Known_Target] ORDER BY [ThreatLevel] DESC, [Name]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="ThreatLevel" HeaderText="ThreatLevel" SortExpression="ThreatLevel" />
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
