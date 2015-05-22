<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TeamView.aspx.vb" Inherits="AgentsofShield.MembersOnly" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
      <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Team View Page</h1>
            </hgroup>
            <p>
                Here you can view all the members of your team</p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <ol>
    <li>
      <asp:Label runat="server" AssociatedControlID="Agent_ID">Agent_ID</asp:Label>
      <asp:TextBox runat="server" ID="Agent_ID" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Agent_ID" CssClass="field-validation-error" ErrorMessage="The AgentID field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
      <asp:TextBox runat="server" ID="Password" TextMode="Password"/>
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The Password field is required." />
    </li>
    </ol>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="getMyTeamPassworded" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Agent_ID" Name="AgentID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Button ID="Submit" runat="server" Text="Submit" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Team Name" HeaderText="Team Name" SortExpression="Team Name" ReadOnly="True" />
            <asp:BoundField DataField="AgentID" HeaderText="AgentID" SortExpression="AgentID" ReadOnly="True" />
            <asp:BoundField DataField="CodeName" HeaderText="CodeName" SortExpression="CodeName" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
        </Columns>
    </asp:GridView>
</asp:Content>
