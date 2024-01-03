using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class ClaseSolicitudes
    {
        private string cadenaConexion = "Data Source=(local);Initial Catalog=ProyectoADM_BD;Integrated Security=True;";

        public void InsertarMensajeOf(string cedulaCli, string cedulaOf, string mensaje)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("SP_InsertarMensajeOf", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Cedula_Cli", cedulaCli);
                    command.Parameters.AddWithValue("@Cedula_Of", cedulaOf);
                    command.Parameters.AddWithValue("@Mensaje", mensaje);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
        public void InsertarMensajeCli(string cedulaOf, string cedulaCli, string mensaje)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("SP_InsertarMensajeCli", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Cedula_Of", cedulaOf);
                    command.Parameters.AddWithValue("@Cedula_Cli", cedulaCli);
                    command.Parameters.AddWithValue("@Mensaje", mensaje);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public DataTable ObtenerMensajes(string CedulaOf)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("SP_AdministrarMensaje", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CedulaOf", CedulaOf);

                    connection.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }

        public void ActualizarEstadoMensaje(int idMensaje, bool estado)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("SP_ActualizarEstadoMensaje", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@IdMensaje_Of", idMensaje);
                    command.Parameters.AddWithValue("@Estado", estado);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public void InsertarCalificacionOf(string cedulaOf, int idMensajeOf, int calificaciones)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("InsertarCalificacionOf", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Cedula_Of", cedulaOf);
                    command.Parameters.AddWithValue("@FK_IDMensaje_Of", idMensajeOf);
                    command.Parameters.AddWithValue("@Calificaciones", calificaciones);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public DataTable ObtenerMensajesPorCedulaCli(string cedulaCli)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("ObtenerMensajesPorCedulaCli", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Cedula_Cli", cedulaCli);

                    connection.Open();

                    DataTable dataTable = new DataTable();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        dataTable.Load(reader);
                    }

                    return dataTable;
                }
            }
        }
        public DataTable ObtenerMensajesPorCedulaOf(string cedulaof)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("ObtenerMensajesPorCedulaOf", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Cedula_Of", cedulaof);

                    connection.Open();

                    DataTable dataTable = new DataTable();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        dataTable.Load(reader);
                    }

                    return dataTable;
                }
            }
        }
        public void InsertarCalificacionCli(string cedulaCli, int idMensajeCli, int calificacionesC)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("InsertarCalificacionCli", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Cedula_Cli", cedulaCli);
                    command.Parameters.AddWithValue("@FK_IDMensaje_Cli", idMensajeCli);
                    command.Parameters.AddWithValue("@Calificaciones", calificacionesC);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public DataTable ObtenerReporteServiciosPorCliente(string cedulaCliente)
        {
            DataTable reporteTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SP_ObtenerReporteServiciosPorCliente", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Parámetro de entrada
                    command.Parameters.Add("@CedulaCliente", SqlDbType.Char, 13).Value = cedulaCliente;
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(reporteTable);
                    }
                }
            } 
            return reporteTable;
        }

        public DataTable ObtenerReporteInscripciones()
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("GenerarReporteInscripciones", connection))
                {
                    command.CommandType = CommandType.StoredProcedure; 
                    connection.Open(); 
                    DataTable dataTable = new DataTable();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        dataTable.Load(reader);
                    } 
                    return dataTable;
                }
            }
        }
    }
}
