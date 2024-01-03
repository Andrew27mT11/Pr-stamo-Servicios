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
    public class ClaseRegistro
    {
        private string cadenaConexion = "Data Source=(local);Initial Catalog = ProyectoADM_BD; Integrated Security = True;";

        public void MantenimientoUsuarios(string cedula, string nombreUsuario, string clave, int operacionUS, int operacion)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand comando = new SqlCommand("SP_MantenimientoUsuario", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;

                    comando.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
                    comando.Parameters.AddWithValue("@Clave", clave);
                    comando.Parameters.AddWithValue("@operacionUs", operacionUS);

                    if (operacion == 1)
                    {
                        comando.Parameters.AddWithValue("@Oferente", cedula);
                        comando.Parameters.AddWithValue("@Cliente", DBNull.Value);
                        comando.Parameters.AddWithValue("@Administrador", DBNull.Value);
                    }
                    else if (operacion == 2)
                    {
                        comando.Parameters.AddWithValue("@Oferente", DBNull.Value);
                        comando.Parameters.AddWithValue("@Cliente", cedula);
                        comando.Parameters.AddWithValue("@Administrador", DBNull.Value);
                    }

                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
        }

        public void MantenimientoClientes(string cedula, string nombre, string apellido1, string apellido2,DateTime FechaNac ,string correo, int telefono, bool estado, int operacion)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                using (SqlCommand comando = new SqlCommand("SP_MantenimientoClientes", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;

                    comando.Parameters.AddWithValue("@CedulaCli", cedula);
                    comando.Parameters.AddWithValue("@NombreCli", nombre);
                    comando.Parameters.AddWithValue("@1ApellidoCli", apellido1);
                    comando.Parameters.AddWithValue("@2ApellidoCli", apellido2);
                    comando.Parameters.AddWithValue("@CorreoCli", correo);
                    comando.Parameters.AddWithValue("@TelefonoCli", telefono);
                    comando.Parameters.AddWithValue("@EstadoCli", estado);
                    comando.Parameters.AddWithValue("@FechaNac", FechaNac);
                    comando.Parameters.AddWithValue("@operacionCli", operacion);

                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
        }

        public void MantenimientoOferentes(string cedula, string nombre, string apellido1, string apellido2, DateTime FechaNac, string correo, int telefono, string provincia, bool estado, int servicio, int operacion)
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
                    comando.Parameters.AddWithValue("@Provincia", provincia);
                    comando.Parameters.AddWithValue("@EstadoOf", estado);
                    comando.Parameters.AddWithValue("@Servicio", servicio);
                    comando.Parameters.AddWithValue("@FechaNacOf", FechaNac);
                    comando.Parameters.AddWithValue("@operacionOf", operacion);

                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
        }

    }
}
