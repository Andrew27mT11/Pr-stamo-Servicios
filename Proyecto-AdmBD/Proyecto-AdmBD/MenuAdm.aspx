<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdm.aspx.cs" Inherits="Proyecto_AdmBD.MenuAdm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="Estilos/Estilo-main.css" />
</head>
<body>

    <form id="form2" runat="server">

        <!-- Note -->

        <!-- Header -->
        <div class="header">
            <h1>“Sistema de Servicios Varios"</h1>
            <h2>"Administradores"</h2>
        </div>

        <!-- Navigation Bar -->
        <div class="navbar">
            <a href="ManteAdmins.aspx">Mantenimineto Administardores</a>
            <a href="ManteOferentes.aspx">Mantenimineto Oferentes</a>
            <a href="ManteClientes.aspx">Mantenimineto Clientes</a>
            <a href="Registro_Admins.aspx">Registrar Administrador</a>
            <a href="ReporteUsuarios.aspx">Reportes por Usuario</a>
        </div>

        <!-- The flexible grid (content) -->
        <div class="row">
            <div class="side">
                <h2>Acerca de </h2>
                <p>Es una plataforma donde personas independientes puedan ofrecer sus servicios a quienes lo necesiten.</p>
                <h3>Más...</h3>
                <p>
                    En nuestra palataforma puede conseguir personas
para realizar diferentes trabajos como: Fontaneros, Pintores, Empleadas Domésticas así como tambien Niñeras.
                </p>

            </div>
            <div class="main">
         

            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <h2>“Sistema de Servicios Varios"</h2>
        </div>

    </form>

</body>
</html>
