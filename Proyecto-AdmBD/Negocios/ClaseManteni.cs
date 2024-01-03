using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.NetworkInformation;

namespace Negocios
{
    public class ClaseManteni
    {
        private string cadenaConexion = "Data Source=(local);Initial Catalog=ProyectoADM_BD;Integrated Security=True;";

        public DataTable ManteUsuariosCli(string nombre, string contra, string cedula, string Cedulacli, int operacion)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand("SP_MantenimientoUsuario", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@NombreUsuario", nombre);
                    comando.Parameters.AddWithValue("@Clave", contra);
                    comando.Parameters.AddWithValue("@Oferente", cedula);
                    comando.Parameters.AddWithValue("@Cliente", Cedulacli);
                    comando.Parameters.AddWithValue("@Administrador", cedula);
                    comando.Parameters.AddWithValue("@operacionCli", operacion);

                    SqlDataAdapter adapter = new SqlDataAdapter(comando);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }

        public DataTable ManteUsuariosOf(string nombre, string contra, string cedula, int operacion)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand("SP_MantenimientoUsuario", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@NombreUsuario", nombre);
                    comando.Parameters.AddWithValue("@Clave", contra);
                    comando.Parameters.AddWithValue("@Oferente", cedula);
                    comando.Parameters.AddWithValue("@Cliente", null);
                    comando.Parameters.AddWithValue("@Administrador", null);
                    comando.Parameters.AddWithValue("@operacionCli", operacion);

                    SqlDataAdapter adapter = new SqlDataAdapter(comando);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }

        public DataTable ManteUsuariosAdmin(string nombre, string contra, string cedulaAd, int operacion)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand("SP_MantenimientoUsuario", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@NombreUsuario", nombre);
                    comando.Parameters.AddWithValue("@Clave", contra);
                    comando.Parameters.AddWithValue("@Oferente", null);
                    comando.Parameters.AddWithValue("@Cliente", null);
                    comando.Parameters.AddWithValue("@Administrador", cedulaAd);
                    comando.Parameters.AddWithValue("@operacionUs", operacion);


                    SqlDataAdapter adapter = new SqlDataAdapter(comando);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }

        public DataTable ManteUsAdmin(string nombre, string contra, string cedulaAd)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand comando = new SqlCommand("SP_MateniminetoUSAdm", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@NUsuario", nombre);
                    comando.Parameters.AddWithValue("@Clave", contra);
                    comando.Parameters.AddWithValue("@Administrador", cedulaAd);

                    conexion.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(comando);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }

        public object MantenimientoClientes2(string cedulaCli, string nombreCli, string primerApellidoCli, string segundoApellidoCli, string correoCli, int telefonoCli, bool estadoCli, DateTime fechaNac, int operacionCli)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand comando = new SqlCommand("SP_MantenimientoClientes", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@CedulaCli", cedulaCli);
                    comando.Parameters.AddWithValue("@NombreCli", nombreCli);
                    comando.Parameters.AddWithValue("@1ApellidoCli", primerApellidoCli);
                    comando.Parameters.AddWithValue("@2ApellidoCli", segundoApellidoCli);
                    comando.Parameters.AddWithValue("@CorreoCli", correoCli);
                    comando.Parameters.AddWithValue("@TelefonoCli", telefonoCli);
                    comando.Parameters.AddWithValue("@EstadoCli", estadoCli);
                    comando.Parameters.AddWithValue("@FechaNac", fechaNac);
                    comando.Parameters.AddWithValue("@operacionCli", operacionCli);

                    conexion.Open();

                    object resultado = comando.ExecuteScalar();
                    if (resultado != null && resultado != DBNull.Value)
                    {
                        return resultado.ToString();
                    }
                    else
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(comando))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);
                            return dataTable;
                        }
                    }
                }
            }
        }

        public DataTable MantenimientoOferentes(string cedula, string nombre, string apellido1, string apellido2, string correo, int telefono, string Provincia, bool estado, int servicio, int operacion)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand comando = new SqlCommand("SP_MantenimientoOferentes", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;

                    comando.Parameters.AddWithValue("@CedulaOf", cedula);
                    comando.Parameters.AddWithValue("@NombreOf", nombre);
                    comando.Parameters.AddWithValue("@1ApellidoOf", apellido1);
                    comando.Parameters.AddWithValue("@2ApellidoOf", apellido2);
                    comando.Parameters.AddWithValue("@CorreoOf", correo);
                    comando.Parameters.AddWithValue("@TelefonoOf", telefono);
                    comando.Parameters.AddWithValue("@Provincia", Provincia);
                    comando.Parameters.AddWithValue("@EstadoOf", estado);
                    comando.Parameters.AddWithValue("@Servicio", servicio);
                    comando.Parameters.AddWithValue("@operacionOf", operacion);

                    conexion.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(comando);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }

        public object MantenimientoAdmin2(string cedulaAdm, string nombreAdm, string primerApellidoAdm, string segundoApellidoAdm,
        string correoAdm, int telefonoAdm, DateTime fechaNacAdm, int operacionAdm)
        {
            using (SqlConnection connection = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand command = new SqlCommand("SP_MantenimientoAdmin", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CedulaAdm", cedulaAdm);
                    command.Parameters.AddWithValue("@NombreAdm", nombreAdm);
                    command.Parameters.AddWithValue("@1ApellidoAdm", primerApellidoAdm);
                    command.Parameters.AddWithValue("@2ApellidoAdm", segundoApellidoAdm);
                    command.Parameters.AddWithValue("@CorreoAdm", correoAdm);
                    command.Parameters.AddWithValue("@TelefonoAdm", telefonoAdm);
                    command.Parameters.AddWithValue("@FechaNacAdm", fechaNacAdm);
                    command.Parameters.AddWithValue("@OperacionAdm", operacionAdm);

                    connection.Open();

                    object resultado = command.ExecuteScalar();
                    if (resultado != null && resultado != DBNull.Value)
                    {
                        return resultado.ToString();
                    }
                    else
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);
                            return dataTable;
                        }
                    }
                }
            }
        }

        public string Login(string nombreUsuario, string contrasena, out string cedOf, out string cedCli, out string cedAdm)
        {
            cedOf = "";
            cedCli = "";
            cedAdm = "";

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand comando = new SqlCommand("SP_Login", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@nomUser", nombreUsuario);
                    comando.Parameters.AddWithValue("@contrasena", contrasena);

                    conexion.Open();

                    // Ejecutar el comando
                    using (SqlDataReader reader = comando.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string resultado = reader["Result"].ToString();

                            if (resultado == "Login successful")
                            {
                                cedOf = reader["CedOf"].ToString();
                                cedCli = reader["CedCli"].ToString();
                                cedAdm = reader["CedAdm"].ToString();
                            }

                            return resultado;
                        }
                    }
                }
            }

            return "Login failed";
        }


        public string ObtenerCedula(string nombreUsuario)
        {
            string cedula = "";

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand comando = new SqlCommand("SP_ObtenerCedula", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
                    comando.Parameters.Add("@Cedula", SqlDbType.VarChar, 13);
                    comando.Parameters["@Cedula"].Direction = ParameterDirection.Output;

                    conexion.Open();
                    comando.ExecuteNonQuery();

                    cedula = comando.Parameters["@Cedula"].Value.ToString();
                }
            }

            return cedula;
        }

        public DataTable ObtenerDatosPorCedula(string cedula)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand comando = new SqlCommand("ObtenerDatosPorCedula", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@Cedula", cedula);

                    conexion.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(comando);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }

        public void CalcularPromedioClientes() 
        { 
            using (SqlConnection connection = new SqlConnection(cadenaConexion)) 
            {
                SqlCommand command = new SqlCommand("SP_CalculaPromedioCalificacionesClientes", connection); 
                command.CommandType = CommandType.StoredProcedure; connection.Open(); command.ExecuteNonQuery(); 
            } 
        }
        public void CalcularPromedioCalificacionesOferente() 
        { 
            using (SqlConnection connection = new SqlConnection(cadenaConexion)) 
            { 
                SqlCommand command = new SqlCommand("SP_CalculaPromedioCalificacionesOferente", connection); 
                command.CommandType = CommandType.StoredProcedure; connection.Open(); command.ExecuteNonQuery(); 
            } 
        }
        public DataTable BuscarDatos(string Cedula, int Op)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand("SP_BuscarAdm", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@Cedula", Cedula);
                    comando.Parameters.AddWithValue("@OP", Op);
                    SqlDataAdapter adapter = new SqlDataAdapter(comando);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }
        public byte[] ObtenerMarcaTiempo(string cedula, int operacion)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand("SP_AsignarTs", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@Cedula", cedula);
                    comando.Parameters.AddWithValue("@Op", operacion);

                    object result = comando.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        return (byte[])result;
                    }
                    else
                    {
                        return null; // Marca de tiempo no encontrada o valor nulo
                    }
                }
            }
        }

    } // Fin de la clase Manteni
}
