<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AssignTeam.aspx.vb" Inherits="AgentsofShield.AssignTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
          <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Team Assignment Page</h1>
            </hgroup>
            <p>
                Here you can assign a team to an Operation in the S.H.I.E.L.D Database</p>
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
    <p>The New Operations's Information</p>
    <ol>
    <li>
      <asp:Label runat="server" AssociatedControlID="Name">Operation Name</asp:Label>
      <asp:TextBox runat="server" ID="Name" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" CssClass="field-validation-error" ErrorMessage="The Name field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Team_ID">Team_ID</asp:Label>
      <asp:TextBox runat="server" ID="Team_ID" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Team_ID" CssClass="field-validation-error" ErrorMessage="The Team_ID field is required." />
    </li>
    </ol>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="SELECT * FROM [Team_On_Mission] WHERE (([OpName] = @OpName) AND ([TeamID] = @TeamID))">
        <SelectParameters>
            <asp:ControlParameter ControlID="Name" Name="OpName" Type="String" />
            <asp:ControlParameter ControlID="Team_ID" Name="TeamID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Submit" runat="server" onClick="AssignTeam" Text="Submit" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OpName,TeamID" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:BoundField DataField="OpName" HeaderText="OpName" ReadOnly="True" SortExpression="OpName" />
            <asp:BoundField DataField="TeamID" HeaderText="TeamID" SortExpression="TeamID" ReadOnly="True" />
        </Columns>
    </asp:GridView>
    </asp:Content>
