using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
namespace Proyecto_AdmBD
{
    public partial class SolicitarServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosInicio();
            }
        }

        protected void ddlServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDatosInicio();
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDatosInicio();
        }
        protected void CargarDatosInicio()
        {
            string servicio = ddlServicios.SelectedValue;
            string provincia = ddlProvincias.SelectedValue;

            string connectionString = "Data Source=(local);Initial Catalog=ProyectoADM_BD;Integrated Security=True;"; 
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("SP_filtrarDatos", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Servicio", servicio);

                    if (!string.IsNullOrEmpty(provincia))
                    {
                        command.Parameters.AddWithValue("@Provincia", provincia);
                    }

                    connection.Open();

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        gvOferentes.DataSource = dataTable;
                        gvOferentes.DataBind();
                    }
                }
            }
        }
        
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            ClaseSolicitudes objSoli = new ClaseSolicitudes();
            string cedulaCli = txtCedulaCli.Text;
            string cedulaOf = txtCedulaOf.Text;
            string mensaje = txtMensaje.Text;

            string respuesta = "";

            try
            {
                objSoli.InsertarMensajeOf(cedulaCli, cedulaOf, mensaje);

                lblRespu.Text = "El mensaje fue enviado con éxito";
                txtCedulaCli.Text = "";
                txtCedulaOf.Text = "";
                txtMensaje.Text = "";
            }
            catch (SqlException ex)
            {
                // Capturar el mensaje de error generado por el procedimiento almacenado
                respuesta = "Error en el registro: " + ex.Message;
            }
            catch (Exception ex)
            {
                // Capturar cualquier otra excepción no relacionada con SQL
                respuesta = "Error en el registro: " + ex.Message;
            }
            lblRespu.Text = respuesta;
        }
    }
}