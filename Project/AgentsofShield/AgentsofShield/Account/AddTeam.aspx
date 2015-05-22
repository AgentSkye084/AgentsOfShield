<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddTeam.aspx.vb" Inherits="AgentsofShield.AddTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
          <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Create a new Team Page</h1>
            </hgroup>
            <p>
                Here you can add Team to the S.H.I.E.L.D Database</p>
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
    <p>The New Team's Information</p>
    <ol>
    <li>
      <asp:Label runat="server" AssociatedControlID="Team_ID">Team_ID</asp:Label>
      <asp:TextBox runat="server" ID="Team_ID" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Team_ID" CssClass="field-validation-error" ErrorMessage="The TeamID field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="TeamName">TeamName</asp:Label>
      <asp:TextBox runat="server" ID="TeamName" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="TeamName" CssClass="field-validation-error" ErrorMessage="The TeamName field is required." />
    </li>
    </ol>
    <asp:Button ID="Submit" runat="server" onClick="InsertTeam" Text="Submit" />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="SELECT * FROM [Team] WHERE ([TeamID] = @TeamID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Team_ID" Name="TeamID" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TeamID" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:BoundField DataField="TeamID" HeaderText="TeamID" ReadOnly="True" SortExpression="TeamID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    </asp:Content>