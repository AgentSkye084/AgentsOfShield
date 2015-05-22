Imports System.Data.SqlClient
Public Class AddTeam
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub InsertTeam(sender As Object, e As EventArgs)
        Dim return1 As Integer = 0
        Dim constr As String = ConfigurationManager.ConnectionStrings("AgentsOfShieldConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("createTeam")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AgentID", CAgent_ID.Text)
                cmd.Parameters.AddWithValue("@Password", CPassword.Text)
                cmd.Parameters.AddWithValue("@TeamID", Team_ID.Text)
                cmd.Parameters.AddWithValue("@Name", TeamName.Text)
                cmd.Connection = con
                con.Open()
                return1 = cmd.ExecuteScalar()
                con.Close()
            End Using
            Select Case return1
                Case -1
                    Label1.Text = "Agent Doesnt Exist or Mismatch"
                    Exit Select
                Case -2
                    Label1.Text = "Team already Exist with that TeamID"
                    Exit Select
                Case Else
                    Label1.Text = "Team Added"
                    Exit Select
            End Select
        End Using
    End Sub
End Class