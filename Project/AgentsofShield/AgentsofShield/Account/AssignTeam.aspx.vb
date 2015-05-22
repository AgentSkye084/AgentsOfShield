Imports System.Data.SqlClient
Public Class AssignTeam
    Inherits System.Web.UI.Page

    Protected Sub AssignTeam(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub InsertSuperhero(sender As Object, e As EventArgs)
        Dim return1 As Integer = 0
        Dim constr As String = ConfigurationManager.ConnectionStrings("AgentsOfShieldConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("assignTeam")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AgentID", CAgent_ID.Text)
                cmd.Parameters.AddWithValue("@Password", CPassword.Text)
                cmd.Parameters.AddWithValue("@TeamID", Team_ID.Text)
                cmd.Parameters.AddWithValue("@Name", Name.Text)
                cmd.Connection = con
                con.Open()
                return1 = cmd.ExecuteScalar()
                con.Close()
            End Using
            Select Case return1
                Case -1
                    Label1.Text = "Agent Doesnt Exist"
                    Exit Select
                Case -2
                    Label1.Text = "Team Doesnt Exist"
                    Exit Select
                Case -3
                    Label1.Text = "Need an Access Level of at least 8 to assign a team to an Operation"
                    Exit Select
                Case -4
                    Label1.Text = "Operation doesnt Exist with that name"
                    Exit Select
                Case Else
                    Label1.Text = "Team Assigned"

                    Exit Select
            End Select
        End Using
    End Sub
End Class