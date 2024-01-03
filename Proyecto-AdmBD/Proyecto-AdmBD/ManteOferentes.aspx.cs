using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocios;
using System.Data.SqlClient;

namespace Proyecto_AdmBD
{
    public partial class ManteOferentes : System.Web.UI.Page
    {
        ClaseManteni objMantenimiento = new ClaseManteni();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaOf"];
            string nombre = Request.Form["NombreOf"];
            string apellido1 = Request.Form["1ApellidoOf"];
            string apellido2 = Request.Form["2ApellidoOf"];
            string correo = Request.Form["CorreoOf"];
            // int telefono = int.Parse(Request.Form["TelefonoOf"]);
            string Provincia = Request.Form["Provincia"];
            string Estado = Request.Form["EstadoOf"];
            //int servicio = int.Parse(Request.Form["Servicio"]);


            DataTable dataTable = objMantenimiento.MantenimientoOferentes(cedula, nombre, apellido1, apellido2, correo, 0, Provincia, false, 0, 2);

            // Agregar la columna de Cedula_Cli al control GridView
            dataTable.Columns.Add("CedulaOf");

            foreach (DataRow row in dataTable.Rows)
            {
                row["CedulaOf"] = cedula;
            }

            gvOferentes.DataSource = dataTable;
            gvOferentes.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaOf"];
            string nombre = Request.Form["NombreOf"];
            string apellido1 = Request.Form["1ApellidoOf"];
            string apellido2 = Request.Form["2ApellidoOf"];
            string correo = Request.Form["CorreoOf"];
            // int telefono = int.Parse(Request.Form["TelefonoOf"]);
            string Provincia = Request.Form["Provincia"];
            string Estado = Request.Form["EstadoOf"];
            //int servicio = int.Parse(Request.Form["Servicio"]);


            DataTable dataTable = objMantenimiento.MantenimientoOferentes(cedula, nombre, apellido1, apellido2, correo, 0, Provincia, false, 0, 3);

            // Agregar la columna de Cedula_Cli al control GridView
            dataTable.Columns.Add("CedulaOf");

            foreach (DataRow row in dataTable.Rows)
            {
                row["CedulaOf"] = cedula;
            }

            gvOferentes.DataSource = dataTable;
            gvOferentes.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaOf"];


            object resultado = objMantenimiento.BuscarDatos(cedula, 3);



            if (resultado is string mensajeRespuesta)
            {
                // Mostrar mensaje de respuesta en caso de error u otra información
                lblRespu.Text = mensajeRespuesta;
                gvOferentes.DataSource = null; // Limpia el GridView si no hay datos válidos
                gvOferentes.DataBind();
            }
            else if (resultado is DataTable dataTable)
            {
                // Mostrar el resultado en el control GridView
                gvOferentes.DataSource = dataTable;
                gvOferentes.DataBind();
            }
        }

            protected void btnCalcularP_Click(object sender, EventArgs e)
        {
            objMantenimiento.CalcularPromedioCalificacionesOferente();
        }
    }
}