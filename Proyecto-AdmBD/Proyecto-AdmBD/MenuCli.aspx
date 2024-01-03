<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuCli.aspx.cs" Inherits="Proyecto_AdmBD.MenuCli" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="Estilos/Estilo-main.css" />
</head>
<body>

    <form id="form2" runat="server">

        <!-- Note -->

        <!-- Header -->
        <div class="header">
            <h1>“Sistema de Servicios Varios"</h1>
            <h2>"Clientes"</h2>
        </div>

        <!-- Navigation Bar -->
        <div class="navbar">
            <a href="MiPerfilC.aspx">Perfil Cliente</a>
            <a href="SolicitarServicio.aspx">Solicitar Servicio</a>
            <a href="CalificarOferente.aspx">Calificar Oferentes</a>
            <a href="MensajeClientes_Oferentes.aspx">Mensaje a oferente</a>
            <a href="Reportes.aspx">Reportes</a>
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
                <h2>Servicios Disponibles en nuestra plataforma.</h2>
                <p>Filtrar por el servicio que necesita:</p>
                <asp:DropDownList ID="ddlServicio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlServicio_SelectedIndexChanged">
                    <asp:ListItem Text="Seleccionar opción" Value=""></asp:ListItem>
                    <asp:ListItem Text="Fontanero" Value="Fontanero"></asp:ListItem>
                    <asp:ListItem Text="Pintor" Value="Pintor"></asp:ListItem>
                    <asp:ListItem Text="Empleada Doméstica" Value="Empleada Domestica"></asp:ListItem>
                    <asp:ListItem Text="Niñeras" Value="Niñera"></asp:ListItem>
                </asp:DropDownList>

                <br />
                <br />
                <asp:GridView ID="gvServicios" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />

            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <h2>“Sistema de Servicios Varios"</h2>
        </div> 
    </form> 
</body>
</html>
