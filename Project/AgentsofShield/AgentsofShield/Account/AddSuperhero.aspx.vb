Imports System.Data.SqlClient
Public Class AddSuperhero
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub InsertSuperhero(sender As Object, e As EventArgs)
        Dim return1 As Integer = 0
        Dim constr As String = ConfigurationManager.ConnectionStrings("AgentsOfShieldConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("createSuperhero")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AgentID", CAgent_ID.Text)
                cmd.Parameters.AddWithValue("@Password", CPassword.Text)
                cmd.Parameters.AddWithValue("@Name", Name.Text)
                cmd.Parameters.AddWithValue("@HandlerID", HandlerID.Text)
                cmd.Parameters.AddWithValue("@TeamID", Team_ID.Text)
                cmd.Parameters.AddWithValue("@Abilities", Abilities.Text)
                cmd.Parameters.AddWithValue("@TrustLevel", TrustLevel.Text)
                cmd.Parameters.AddWithValue("@AccessLevel", AccessLevel.Text)
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
                    Label1.Text = "Agent doesnt have the AccessLevel to create this Superhero"
                    Exit Select
                Case -3
                    Label1.Text = "Handler doesnt Exist"
                    Exit Select
                Case -4
                    Label1.Text = "Team doesnt Exist"
                    Exit Select
                Case -5
                    Label1.Text = "Superhero already exists with that Name"
                    Exit Select
                Case Else
                    Label1.Text = "Superhero Added"

                    Exit Select
            End Select
        End Using
    End Sub
End Class