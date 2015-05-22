<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddAgent.aspx.vb" Inherits="AgentsofShield.AddAgent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
          <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Create a new Agent Page</h1>
            </hgroup>
            <p>
                Here you can add an agent to the S.H.I.E.L.D Database</p>
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
    <p>The New Agent's Information</p>
    <ol>
    <li>
      <asp:Label runat="server" AssociatedControlID="Agent_ID1">Agent_ID</asp:Label>
      <asp:TextBox runat="server" ID="Agent_ID1" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Agent_ID1" CssClass="field-validation-error" ErrorMessage="The AgentID field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Password1">Password</asp:Label>
      <asp:TextBox runat="server" ID="Password1" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Password1" CssClass="field-validation-error" ErrorMessage="The Password field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Base_ID">Base_ID</asp:Label>
      <asp:TextBox runat="server" ID="Base_ID" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Base_ID" CssClass="field-validation-error" ErrorMessage="The BaseID field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Team_ID">Team_ID</asp:Label>
      <asp:TextBox runat="server" ID="Team_ID" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Team_ID" CssClass="field-validation-error" ErrorMessage="The TeamID field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="FName">First Name</asp:Label>
      <asp:TextBox runat="server" ID="FName" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="FName" CssClass="field-validation-error" ErrorMessage="The First Name field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="LName">Last Name</asp:Label>
      <asp:TextBox runat="server" ID="LName" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="LName" CssClass="field-validation-error" ErrorMessage="The Last Name field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="CodeName">Code Name</asp:Label>
      <asp:TextBox runat="server" ID="CodeName" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="CodeName" CssClass="field-validation-error" ErrorMessage="The Code Name field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="AccessLevel">AccessLevel</asp:Label>
      <asp:TextBox runat="server" ID="AccessLevel" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="AccessLevel" CssClass="field-validation-error" ErrorMessage="The AccessLevel field is required." />
    </li>
    </ol>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="createAgent" SelectCommandType="StoredProcedure" InsertCommand="createAgent" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="CreatorAgentID" Type="String" />
            <asp:Parameter Name="CreatorPassword" Type="String" />
            <asp:Parameter Name="AgentID" Type="String" />
            <asp:Parameter Name="HomeBaseID" Type="String" />
            <asp:Parameter Name="TeamID" Type="String" />
            <asp:Parameter Name="Fname" Type="String" />
            <asp:Parameter Name="LName" Type="String" />
            <asp:Parameter Name="CodeName" Type="String" />
            <asp:Parameter Name="AccessLevel2" Type="Int32" />
            <asp:Parameter Name="Password2" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CAgent_ID" Name="CreatorAgentID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CPassword" Name="CreatorPassword" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Agent_ID1" Name="AgentID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Base_ID" Name="HomeBaseID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Team_ID" Name="TeamID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="FName" Name="Fname" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LName" Name="LName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CodeName" Name="CodeName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="AccessLevel" Name="AccessLevel2" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="Password1" Name="Password2" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Submit" runat="server" onClick="InsertAgent" Text="Submit" />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="SELECT [AgentID], [TeamID], [HomeBaseID], [Fname], [LName], [CodeName], [Status], [AccessLevel] FROM [Agent] WHERE ([AgentID] = @AgentID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Agent_ID1" Name="AgentID" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AgentID" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:BoundField DataField="AgentID" HeaderText="AgentID" ReadOnly="True" SortExpression="AgentID" />
            <asp:BoundField DataField="TeamID" HeaderText="TeamID" SortExpression="TeamID" />
            <asp:BoundField DataField="HomeBaseID" HeaderText="HomeBaseID" SortExpression="HomeBaseID" />
            <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
            <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
            <asp:BoundField DataField="CodeName" HeaderText="CodeName" SortExpression="CodeName" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="AccessLevel" HeaderText="AccessLevel" SortExpression="AccessLevel" />
        </Columns>
    </asp:GridView>
    </asp:Content>