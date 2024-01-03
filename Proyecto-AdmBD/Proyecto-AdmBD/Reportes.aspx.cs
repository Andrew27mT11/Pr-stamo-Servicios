using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;

namespace Proyecto_AdmBD
{
    public partial class Reportes : System.Web.UI.Page
    {
        ClaseSolicitudes objReportes = new ClaseSolicitudes();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string cedulaCliente = Request.Form["CedulaCli"]; 
            if (!string.IsNullOrWhiteSpace(cedulaCliente))
            {
                DataTable reporteTable = objReportes.ObtenerReporteServiciosPorCliente(cedulaCliente);
                gvReportes.DataSource = reporteTable;
                gvReportes.DataBind();
                lblMensaje.Text = "Reportes de Servicios Utilizados Anteriormente";
            }
        }
    }
}