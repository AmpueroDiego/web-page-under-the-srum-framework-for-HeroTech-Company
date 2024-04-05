from tkinter import *
from tkinter import messagebox

principal = Tk()

principal.title("Formulario de sistema de HeroTech")

principal.iconbitmap("hero.ico")

principal.config(background="#013567")

#------------------------Título Principal----------------------

zonaTitulo=Frame(principal)
zonaTitulo.config(background="#e1e3e5", relief="ridge", bd=5, padx=77)
zonaTitulo.pack()

tituloTitulo=Label(zonaTitulo, text="Formulario del sistema de HeroTech", font=("Verdana", 20), bg="#e1e3e5")
tituloTitulo.pack()

#------------------------Función Global-----------------------

def informacionHeroTech():

    informacion_dni = StringVar(dni_dato.get())
    informacion_recojo = StringVar(driver_recojo.get())
    informacion_envio = StringVar(driver_envio.get())
    informacion_tecnico = StringVar(tecnico_dato.get())
    informacion_cajero = StringVar(cajero_dato.get())
    informacion_proforma = StringVar(proforma_dato.get())
    informacion_pedido = StringVar(pedido_dato.get())

#------------------------Primer Espacio----------------------

espacio1=Frame(principal)
espacio1.config(background="#013567", height=10)
espacio1.pack()

#------------------------Datos del Cliente----------------------


datosClientes=Frame(principal)
datosClientes.config(background="#e1e3e5", padx=205, relief="ridge", bd=5)
datosClientes.pack()

tituloClientes=Label(datosClientes, text="Datos del Cliente", font=("Verdana", 20), bg="#e1e3e5", pady=5)
tituloClientes.grid(column=0, row=0, columnspan=4)

textoCliente = Label(datosClientes, text="DNI: ", font=("Verdana", 10), bg="#e1e3e5", pady=5)
textoCliente.grid(column=1, row=1)

dni = StringVar()
dni_dato = Entry(datosClientes, textvariable=dni)
dni_dato.grid(column=2, row=1)

#------------------------Segundo Espacio----------------------

espacio2=Frame(principal)
espacio2.config(background="#013567", height=10)
espacio2.pack()

#------------------------Datos del Driver----------------------

datosDriver=Frame(principal)
datosDriver.config(background="#e1e3e5", padx=198, relief="ridge", bd=5)
datosDriver.pack()

tituloDriver=Label(datosDriver, text="Datos del Driver", font=("Verdana", 20), bg="#e1e3e5", pady=5)
tituloDriver.grid(column=0,row=0,columnspan=4)

textoRecojo = Label(datosDriver, text="Código de recojo: ", font=("Verdana", 10), bg="#e1e3e5", pady=5)
textoRecojo.grid(column=1, row=1)

codigoRecojo = StringVar()
driver_recojo = Entry(datosDriver, textvariable=codigoRecojo)
driver_recojo.grid(column=2, row=1)

textoEnvio = Label(datosDriver, text="Código de envío: ", font=("Verdana", 10), bg="#e1e3e5", pady=5)
textoEnvio.grid(column=1, row=2)

codigoEnvio = StringVar()
driver_envio = Entry(datosDriver, textvariable=codigoEnvio)
driver_envio.grid(column=2, row=2)

#------------------------Tercer Espacio----------------------

espacio3=Frame(principal)
espacio3.config(background="#013567", height=10)
espacio3.pack()

#------------------------Datos del Técnico----------------------

datosTecnico=Frame(principal)
datosTecnico.config(background="#e1e3e5", padx=193, relief="ridge", bd=5)
datosTecnico.pack()

tituloTecnico = Label(datosTecnico, text="Datos del Técnico", font=("Verdana", 20), bg="#e1e3e5", pady=5)
tituloTecnico.grid(column=0, row=0,columnspan=4)

textoTecnico = Label(datosTecnico, text="Código del técnico: ", font=("Verdana", 10), bg="#e1e3e5", pady=5)
textoTecnico.grid(column=1, row=1)

codigoTecnico = StringVar()
tecnico_dato = Entry(datosTecnico, textvariable=codigoTecnico)
tecnico_dato.grid(column=2, row=1)

#------------------------Cuarto Espacio----------------------

espacio4=Frame(principal)
espacio4.config(background="#013567", height=10)
espacio4.pack()

#------------------------Datos del Cajero----------------------

datosCajero=Frame(principal)
datosCajero.config(background="#e1e3e5", padx=190, relief="ridge", bd=5)
datosCajero.pack()

tituloCajero = Label(datosCajero, text="Datos del Cajero", font=("Verdana", 20), bg="#e1e3e5", pady=5)
tituloCajero.grid(column=0,row=0,columnspan=4)

textoCajero = Label(datosCajero, text="Código del cajero: ", font=("Verdana", 10), bg="#e1e3e5", pady=5)
textoCajero.grid(column=1, row=1)

codigoCajero = StringVar()
cajero_dato = Entry(datosCajero, textvariable=codigoCajero)
cajero_dato.grid(column=2, row=1)

textoProforma = Label(datosCajero, text="Código de proforma: ", font=("Verdana", 10), bg="#e1e3e5", pady=5)
textoProforma.grid(column=1, row=2)

codigoProforma = StringVar()
proforma_dato = Entry(datosCajero, textvariable=codigoProforma)
proforma_dato.grid(column=2, row=2)

#------------------------Quinto Espacio----------------------

espacio5=Frame(principal)
espacio5.config(background="#013567", height=10)
espacio5.pack()

#------------------------Datos del Pedido----------------------

datosPedido=Frame(principal)
datosPedido.config(background="#e1e3e5", padx=196, relief="ridge", bd=5)
datosPedido.pack()

tituloPedido = Label(datosPedido, text="Datos del Pedido", font=("Verdana", 20), bg="#e1e3e5", pady=5)
tituloPedido.grid(column=0,row=0,columnspan=4)

textoPedido = Label(datosPedido, text="Código del pedido: ", font=("Verdana", 10), bg="#e1e3e5", pady=5)
textoPedido.grid(column=1, row=1)

codigoPedido = StringVar()
pedido_dato = Entry(datosPedido, textvariable=codigoPedido)
pedido_dato.grid(column=2, row=1)

#------------------------Función Limpiar-----------------------------

def funcionLimpiar():
    dni_dato.delete(0, 'end')
    driver_recojo.delete(0, 'end')
    driver_envio.delete(0, 'end')
    tecnico_dato.delete(0, 'end')
    cajero_dato.delete(0, 'end')
    proforma_dato.delete(0, 'end')
    pedido_dato.delete(0, 'end')

def funcionSalir():
    valor = messagebox.askokcancel("Salir", "¿Deseas salir de la aplicación?")

    if valor==True:
        principal.destroy()

#------------------------Botones del Formulario----------------------

formularioBotones=Frame(principal)
formularioBotones.config(background="#013567", pady=20)
formularioBotones.pack()

botonLimpiar=Button(formularioBotones, text="Limpiar", font=("Verdana", 10), bg="#cfb093", padx=3, command=funcionLimpiar)
botonLimpiar.grid(column=0, row=0)

espacioBoton1 = Label(formularioBotones, text="", bg="#013567", padx=45)
espacioBoton1.grid(column=1, row=0)

botonEnviar=Button(formularioBotones, text="Enviar", font=("Verdana", 10), bg="#cfb093", padx=3)
botonEnviar.grid(column=2, row=0)

espacioBoton2 = Label(formularioBotones, text="", bg="#013567", padx=45)
espacioBoton2.grid(column=3, row=0)

botonSalir=Button(formularioBotones, text="Salir", font=("Verdana", 10), bg="#cfb093", padx=3, command=funcionSalir)
botonSalir.grid(column=4, row=0)


#--------------------------------------------------------------

principal.mainloop()