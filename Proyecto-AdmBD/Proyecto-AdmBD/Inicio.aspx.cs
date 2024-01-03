using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using System.Data.SqlClient;

namespace Proyecto_AdmBD
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CargarDatosInicio(string servicio)
        {
            string connectionString = "Data Source=(local);Initial Catalog=ProyectoADM_BD;Integrated Security=True;";
            // Reemplaza con tu cadena de conexión real
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("SP_CargarDatosInicio", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Servicio", servicio);

                    connection.Open();

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        gvServicios.DataSource = dataTable;
                        gvServicios.DataBind();
                    }
                }
            }
        }
        protected void ddlServicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlServicio.SelectedValue == "")
            {
                CargarDatosInicio(null); // Sin filtro, muestra todos los datos
            }
            else
            {
                CargarDatosInicio(ddlServicio.SelectedValue); // Aplica el filtro seleccionado
            }

        }
    }
}
