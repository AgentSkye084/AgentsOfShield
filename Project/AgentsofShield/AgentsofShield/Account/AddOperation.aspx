<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddOperation.aspx.vb" Inherits="AgentsofShield.AddOperation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
          <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Create a new Operation Page</h1>
            </hgroup>
            <p>
                Here you can add a Operation to the S.H.I.E.L.D Database</p>
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
      <asp:Label runat="server" AssociatedControlID="Objective">Objective</asp:Label>
      <asp:TextBox runat="server" ID="Objective" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Objective" CssClass="field-validation-error" ErrorMessage="The Objective field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Status">Status</asp:Label>
      <asp:TextBox runat="server" ID="Status" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Status" CssClass="field-validation-error" ErrorMessage="The Status field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Difficulty">Difficulty</asp:Label>
      <asp:TextBox runat="server" ID="Difficulty" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Difficulty" CssClass="field-validation-error" ErrorMessage="The Difficulty field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Priority"> Priority</asp:Label>
      <asp:TextBox runat="server" ID="Priority" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Priority" CssClass="field-validation-error" ErrorMessage="The Priority is required." />
    </li>
    </ol>
    <asp:Button ID="Submit" runat="server" onClick="InsertOperation" Text="Submit" />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="SELECT * FROM [Operation] WHERE ([Name] = @Name)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Name" Name="Name" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Name" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="Objective" HeaderText="Objective" SortExpression="Objective" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
        </Columns>
    </asp:GridView>
    </asp:Content>