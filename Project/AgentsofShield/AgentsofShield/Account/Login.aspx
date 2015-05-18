<%@ Page Title="Login" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.vb" Inherits="AgentsofShield.Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p>
          <asp:Login ID="myLogin" runat="server">
              <LayoutTemplate>
                  <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                      <tr>
                          <td>
                              <table cellpadding="0">
                                  <tr>
                                      <td align="center" colspan="2">Log In</td>
                                  </tr>
                                  <tr>
                                      <td align="right">
                                          <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                      </td>
                                      <td>
                                          <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="myLogin">*</asp:RequiredFieldValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="right">
                                          <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                      </td>
                                      <td>
                                          <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="myLogin">*</asp:RequiredFieldValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td colspan="2">
                                          <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="center" colspan="2" style="color:Red;">
                                          <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="right" colspan="2">
                                          <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="myLogin" />
                                      </td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                  </table>
              </LayoutTemplate>
          </asp:Login>
    </p>
    <%-- </hgroup>
    
    <section id="loginForm">
        <h2>Use your AgentID and Password to login.</h2>
        <asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Log in Form</legend>
                    <ol>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="UserName">AgentID</asp:Label>
                            <asp:TextBox runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                        </li>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Save your AgentID? (not suggested)</asp:Label>
                        </li>
                    </ol>
                    <asp:Button runat="server" CommandName="Login" Text="Sign In" />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>
        <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
            if you don't have an account.
        </p>
    </section>

    <section id="socialLoginForm">
        <h2>Use another service to log in.</h2>
        <h2>(This feature is not allowed under current Protocol)</h2>
        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
    </section> --%>
</asp:Content>