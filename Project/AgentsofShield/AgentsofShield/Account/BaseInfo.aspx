<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="BaseInfo.aspx.vb" Inherits="AgentsofShield.BaseInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
     <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Detailed Base Info Page</h1>
            </hgroup>
            <p>
                Here you can view all the Teams, Operations, and Supplies for a given Base</p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <ol>
    <li>
      <asp:Label runat="server" AssociatedControlID="Agent_ID2">Agent_ID</asp:Label>
      <asp:TextBox runat="server" ID="Agent_ID2" />
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Agent_ID2" CssClass="field-validation-error" ErrorMessage="The AgentID field is required." />
    </li>
    <li>
      <asp:Label runat="server" AssociatedControlID="Password2">Password</asp:Label>
      <asp:TextBox runat="server" ID="Password2" TextMode="Password"/>
      <asp:RequiredFieldValidator runat="server" ControlToValidate="Password2" CssClass="field-validation-error" ErrorMessage="The Password field is required." />
    </li>
        <li>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceBases" DataTextField="BaseID" DataValueField="BaseID">
                <asp:ListItem>Stand by</asp:ListItem>
                <asp:ListItem>In Progress</asp:ListItem>
                <asp:ListItem>Preparing</asp:ListItem>
                <asp:ListItem>Aborted</asp:ListItem>
                <asp:ListItem>Completed</asp:ListItem>
                <asp:ListItem>Not started</asp:ListItem> 
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceBases" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="SELECT DISTINCT [BaseID] FROM [Mission_Base]"></asp:SqlDataSource>
    </li>
    </ol>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="BaseInfoAgentAccess" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Agent_ID2" Name="AgentID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Password2" Name="Password" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="BaseID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Button ID="Submit2" runat="server" Text="Submit" />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="Team Name" HeaderText="Team Name" SortExpression="Team Name" />
            <asp:BoundField DataField="Operation" HeaderText="Operation" SortExpression="Operation" />
            <asp:BoundField DataField="Medical" HeaderText="Medical" SortExpression="Medical" />
            <asp:BoundField DataField="Weapon" HeaderText="Weapon" SortExpression="Weapon" />
            <asp:BoundField DataField="Vehicle" HeaderText="Vehicle" SortExpression="Vehicle" />
            <asp:BoundField DataField="Technology" HeaderText="Technology" SortExpression="Technology" />
        </Columns>
    </asp:GridView>
</asp:Content>
