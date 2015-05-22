<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="OperationView.aspx.vb" Inherits="AgentsofShield.MembersOnly" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
      <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Overall Operation View Page</h1>
            </hgroup>
            <p>
                Here you can view all the operations for a given Status (For Administration only)</p>
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
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Stand by</asp:ListItem>
                <asp:ListItem>In Progress</asp:ListItem>
                <asp:ListItem>Preparing</asp:ListItem>
                <asp:ListItem>Aborted</asp:ListItem>
                <asp:ListItem>Completed</asp:ListItem>
                <asp:ListItem>Not started</asp:ListItem>
                <asp:ListItem>All</asp:ListItem> 
            </asp:DropDownList>
    </li>
    </ol>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AgentsOfShieldConnectionString %>" SelectCommand="operationStatus_Search" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Status" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="Agent_ID2" Name="AgentID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Password2" Name="Password" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Button ID="Submit2" runat="server" Text="Submit" />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Name">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="Objective" HeaderText="Objective" SortExpression="Objective" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
        </Columns>
    </asp:GridView>
</asp:Content>
