Imports System.Data.SqlClient
Public Class AddOperation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub InsertOperation(sender As Object, e As EventArgs)
        Dim return1 As Integer = 0
        Dim constr As String = ConfigurationManager.ConnectionStrings("AgentsOfShieldConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("createOperation")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AgentID", CAgent_ID.Text)
                cmd.Parameters.AddWithValue("@Password", CPassword.Text)
                cmd.Parameters.AddWithValue("@Name", Name.Text)
                cmd.Parameters.AddWithValue("@Objective", Objective.Text)
                cmd.Parameters.AddWithValue("@Status", Status.Text)
                cmd.Parameters.AddWithValue("@Difficulty", Difficulty.Text)
                cmd.Parameters.AddWithValue("@Priority", Priority.Text)
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
                    Label1.Text = "Need an Access Level of at least 8 to Create an Operation"
                    Exit Select
                Case -3
                    Label1.Text = "Operation already Exists with that name"
                    Exit Select
                Case Else
                    Label1.Text = "Operation Added"
                    Exit Select
            End Select
        End Using
    End Sub
End Class