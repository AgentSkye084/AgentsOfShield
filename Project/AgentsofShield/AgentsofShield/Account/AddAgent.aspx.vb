Imports System.Data.SqlClient
Public Class AddAgent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub InsertAgent(sender As Object, e As EventArgs)
        Dim return1 As Integer = 0
        Dim constr As String = ConfigurationManager.ConnectionStrings("AgentsOfShieldConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("createAgent")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CreatorAgentID", CAgent_ID.Text)
                cmd.Parameters.AddWithValue("@CreatorPassword", CPassword.Text)
                cmd.Parameters.AddWithValue("@AgentID", Agent_ID1.Text)
                cmd.Parameters.AddWithValue("@HomeBaseID", Base_ID.Text)
                cmd.Parameters.AddWithValue("@TeamID", Team_ID.Text)
                cmd.Parameters.AddWithValue("@FName", FName.Text)
                cmd.Parameters.AddWithValue("@LName", LName.Text)
                cmd.Parameters.AddWithValue("@CodeName", CodeName.Text)
                cmd.Parameters.AddWithValue("@AccessLevel2", AccessLevel.Text)
                cmd.Parameters.AddWithValue("@Password2", Password1.Text)
                cmd.Connection = con
                con.Open()
                return1 = cmd.ExecuteScalar()
                con.Close()
            End Using
            Select Case return1
                Case -1
                    Label1.Text = "You don't have the Access level required to add this Agent"
                    Exit Select
                Case -2
                    Label1.Text = "That AgentID is already Used"
                    Exit Select
                Case -3
                    Label1.Text = "That BaseID is not Valid"
                    Exit Select
                Case -4
                    Label1.Text = "That Base requires a higher Access level to be positioned there."
                    Exit Select
                Case -5
                    Label1.Text = "That TeamID is not Valid"
                    Exit Select
                Case -6
                    Label1.Text = "Your Id And Password dont match"
                    Exit Select
                Case Else
                    Label1.Text = "Agent Added!"

                    Exit Select
            End Select
        End Using
    End Sub
    Private Sub InsertAgent1(sender As System.Object, e As System.EventArgs)
        Label1.Text = GetCustomerName()
    End Sub

    Private Function GetCustomerName() As String
        Try
            Dim ret As Integer
            Dim conn As SqlClient.SqlConnection = New SqlClient.SqlConnection("User ID = siscodr" &
                                                                                          "; Password = DannyTrice12" &
                                                                                          "; Data Source = titan.csse.rose-hulman.edu" &
                                                                                          "; Initial Catalog = AgentsOfShield")
            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("createAgent", conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@CreatorAgentID", SqlDbType.VarChar).Value = CAgent_ID.Text
                cmd.Parameters.AddWithValue("@CreatorPassword", SqlDbType.VarChar).Value = CPassword.Text
                cmd.Parameters.AddWithValue("@AgentID", SqlDbType.VarChar).Value = Agent_ID1.Text
                cmd.Parameters.AddWithValue("@HomeBaseID", SqlDbType.VarChar).Value = Base_ID.Text
                cmd.Parameters.AddWithValue("@TeamID", SqlDbType.VarChar).Value = Team_ID.Text
                cmd.Parameters.AddWithValue("@FName", SqlDbType.VarChar).Value = FName.Text
                cmd.Parameters.AddWithValue("@LName", SqlDbType.VarChar).Value = LName.Text
                cmd.Parameters.AddWithValue("@CodeName", SqlDbType.VarChar).Value = CodeName.Text
                cmd.Parameters.AddWithValue("@AccessLevel2", SqlDbType.Int).Value = AccessLevel.Text
                cmd.Parameters.AddWithValue("@Password2", SqlDbType.VarChar).Value = Password1.Text
                cmd.Connection.Open()
                ret = cmd.ExecuteScalar()
                cmd.Connection.Close()
            End Using

            GetCustomerName = ret
        Catch ex As SqlClient.SqlException
            GetCustomerName = "<SQL Exception>"
        End Try
    End Function


End Class