using Negocios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_AdmBD
{
    public partial class ReporteUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarReporte();
            } 
        }
        private void CargarReporte()
        {
            ClaseSolicitudes claseSolicitudes = new ClaseSolicitudes();
            DataTable dtReporte = claseSolicitudes.ObtenerReporteInscripciones();
            // Agregar la fila de "Total Clientes" al final de los datos.
            DataRow totalRow = dtReporte.NewRow();
            totalRow["Periodo"] = dtReporte.Rows[0]["Periodo"];
            totalRow["Tipo"] = "Total Clientes";
            totalRow["Cantidad"] = dtReporte.Compute("SUM(Cantidad)", "");
            dtReporte.Rows.Add(totalRow);
            gvReporte.DataSource = dtReporte;
            gvReporte.DataBind();
        }
    }
}