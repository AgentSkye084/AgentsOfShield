<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddSuperhero.aspx.vb" Inherits="AgentsofShield.AddSuperhero" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
          <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Create a new Superhero Page</h1>
            </hgroup>
            <p>
                Here you can add a Superhero to the S.H.I.E.L.D Database</p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <p>Your Information</p>
    <ol>
    <li>
      <asp:Label runat="server" AssociatedControlID="CAgent_ID">Current Agent_ID</asp:Label>
      <asp:TextBox runat="server" ID="CAgent_ID" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="CAgent_ID" CssClass="field-validation-error" ErrorMessage="The AgentID field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="CPassword">Current Agent's Password</asp:Label>
      <asp:TextBox runat="server" ID="CPassword" TextMode="Password"/>
      <asp:RequiredFieldValidator runat="server" ControlToValidate="CPassword" CssClass="field-validation-error" ErrorMessage="The Password field is required." />
    </li>
    </ol>
    <p>The New Superhero's Information</p>
    <ol>
    <li>
      <asp:Label runat="server" AssociatedControlID="Name">Superhero Name</asp:Label>
      <asp:TextBox runat="server" ID="Name" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" CssClass="field-validation-error" ErrorMessage="The Name field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="HandlerID">HandlerID</asp:Label>
      <asp:TextBox runat="server" ID="HandlerID" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="HandlerID" CssClass="field-validation-error" ErrorMessage="The Handler field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Team_ID">Team_ID</asp:Label>
      <asp:TextBox runat="server" ID="Team_ID" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Team_ID" CssClass="field-validation-error" ErrorMessage="The Team_ID field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Abilities">Abilities</asp:Label>
      <asp:TextBox runat="server" ID="Abilities" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Abilities" CssClass="field-validation-error" ErrorMessage="The Abilities field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="TrustLevel">Trust Level</asp:Label>
      <asp:TextBox runat="server" ID="TrustLevel" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="TrustLevel" CssClass="field-validation-error" ErrorMessage="The Trust field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="AccessLevel">Access Level</asp:Label>
      <asp:TextBox runat="server" ID="AccessLevel" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="AccessLevel" CssClass="field-validation-error" ErrorMessage="The Access field is required." />
    </li>
    </ol>
    <asp:Button ID="Submit" runat="server" onClick="InsertSuperhero" Text="Submit" />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="SELECT * FROM [Superhero] WHERE ([Name] = @Name)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Name" Name="Name" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Name" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="HandlerID" HeaderText="HandlerID" SortExpression="HandlerID" />
            <asp:BoundField DataField="TeamID" HeaderText="TeamID" SortExpression="TeamID" />
            <asp:BoundField DataField="Abilities" HeaderText="Abilities" SortExpression="Abilities" />
            <asp:BoundField DataField="TrustLevel" HeaderText="TrustLevel" SortExpression="TrustLevel" />
            <asp:BoundField DataField="AccessLevel" HeaderText="AccessLevel" SortExpression="AccessLevel" />
        </Columns>
    </asp:GridView>
    </asp:Content>