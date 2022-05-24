<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Login_prueba.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="Content/css/stylelogin.css" rel="stylesheet" />  
    <link href="Content/css/styles.css" rel="stylesheet" />




    <title>Login</title>
</head>
<body>
    <div class="wrapper fadeInDown">
  <div id="formContent">


    <!-- formulario login -->
    <form runat="server">

            <!-- formulario login -->
      <h1 class="mt-4">Registro</h1>
            <!-- Nombre -->
      <asp:TextBox runat="server" class="fadeIn second" placeholder="Nombre" MaxLength="30" ID="txtNombre"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingresa tu nombre" ControlToValidate="txtNombre" ForeColor="#FF5050">*</asp:RequiredFieldValidator>
            <!-- Apellido -->      
        <asp:TextBox runat="server" class="form-control" placeholder="Apellido" MaxLength="30" ID="txtApellido"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingresa tu apellido" ControlToValidate="txtApellido" ForeColor="#FF5050">*</asp:RequiredFieldValidator>
            <!-- Email -->    
        <asp:TextBox runat="server" class="fadeIn second" placeholder="Email" MaxLength="50" ID="txtEmail"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingresa un correo electronico" ControlToValidate="txtEmail" ForeColor="#FF5050">*</asp:RequiredFieldValidator>      
        <br><asp:RegularExpressionValidator id="RegularExpressionValidator4" class="alert-danger" runat="server"  ErrorMessage="Ingresa un correo valido" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <!-- Contraseña -->
      <asp:TextBox runat="server" class="form-control" placeholder="Contraseña" MaxLength="30" ID="txtPass"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingresa tu contraseña" ControlToValidate="txtPass" ForeColor="#FF5050">*</asp:RequiredFieldValidator>
       <br> <asp:RegularExpressionValidator id="RegularExpressionValidator3" class="alert-danger" runat="server"  ErrorMessage="Tu contraseña debe contener almenos una mayuscula, minuscula, caracter especial y minimo 8 caracteres" ControlToValidate="txtPass" ValidationExpression="(?=^.{8,}$)(?=.*\W+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
           
        <!-- Confirmar contraseña -->
 <asp:TextBox runat="server" class="form-control" placeholder="Confirmar contraseña" MaxLength="30" ID="txtCPass"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirma tu contraseña" ControlToValidate="txtCPass" ForeColor="#FF5050">*</asp:RequiredFieldValidator>
        <br><asp:CompareValidator ID="CompareValidator1" class="alert-danger" runat="server" ControlToCompare="txtPass" ControlToValidate="txtCPass" ErrorMessage="Las contraseñas no coiciden"></asp:CompareValidator>

         <!-- El summary muestra los errores en la validacion de los datos ingresados -->
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <asp:ValidationSummary class="alert-danger" ID="ValidationSummary1" runat="server" BorderStyle="Solid" BorderWidth="2px" />
            <asp:Label ID="lblError" class="alert-danger" runat="server" Text=""></asp:Label>
        </div>    
    </div>

        <!-- Volver al login principal -->
        <a href="Login.aspx">⬅Volver</a>    
        <asp:Button runat="server" Text="Registrar" ID="btnRegistrar" OnClick="btnRegistrar_Click" />

      </form>
  </div>
</div>
</body>
</html>