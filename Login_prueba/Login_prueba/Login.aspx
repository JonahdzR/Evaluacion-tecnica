<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login_prueba.Login" %>

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

    <!-- Logo o icon -->
    <div class="fadeIn first">
      <img src="https://icon-library.com/images/google-user-icon/google-user-icon-16.jpg" height="200" width="200" />
    </div>

    <!-- Login Form -->
    <form runat="server">

    <!-- Correo Electronico -->
      <asp:TextBox runat="server" class="fadeIn second" placeholder="Correo electronico" MaxLength="50" ID="txtEmail"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingresa tu correo electronico" ControlToValidate="txtEmail" ForeColor="#FF5050">*</asp:RequiredFieldValidator>
    <!-- Contraseña -->     
        <asp:TextBox runat="server" class="form-control" placeholder="Contraseña" MaxLength="50" ID="txtContraseña"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingresa tu contraseña" ControlToValidate="txtContraseña" ForeColor="#FF5050">*</asp:RequiredFieldValidator>

    <!-- El summary muestra los errores en la validacion de los datos ingresados -->
    <div class="row justify-content-md-center">
         <div class="col-md-auto">
             <asp:ValidationSummary class="alert-danger" ID="ValidationSummary1" runat="server" />
             <asp:Label ID="lblError" class="alert-danger" runat="server" Text=""></asp:Label>
        </div>    
    </div>

        <asp:Button runat="server" Text="Ingresar" ID="btnIngresar" OnClick="btnIngresar_Click" />
        <a href="Registro.aspx">Registrarse</a>    
    
    </form>

  </div>
</div>
</body>
</html>
