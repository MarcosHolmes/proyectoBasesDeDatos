
CREATE TABLE Producto
(
	IdProducto           INTEGER  NOT NULL ,
	Nombre               VARCHAR2(244)  NULL ,
	Precio               FLOAT  NULL ,
	Stock                INTEGER  NULL ,
	Estado               VARCHAR2(1)  NULL ,
CONSTRAINT  XPKProducto PRIMARY KEY (IdProducto)
);

CREATE TABLE Vendedor
(
	IdVendedor           INTEGER  NOT NULL ,
	Dni                  CHAR(8)  NULL ,
	Nombres              VARCHAR2(255)  NULL ,
	Telefono             VARCHAR2(9)  NULL ,
	User_2               VARCHAR2(8)  NULL ,
	Estado               VARCHAR2(1)  NULL ,
CONSTRAINT  XPKVendedor PRIMARY KEY (IdVendedor)
);

CREATE TABLE Cliente
(
	IdCliente            INTEGER  NOT NULL ,
	Dni                  VARCHAR2(8)  NULL ,
	Nombre               VARCHAR2(244)  NULL ,
	Direccion            VARCHAR2(244)  NULL ,
	Estado               VARCHAR2(1)  NULL ,
CONSTRAINT  XPKCliente PRIMARY KEY (IdCliente)
);

CREATE TABLE Ventas
(
	NumeroVentas         VARCHAR2(244)  NULL ,
	FechaVentas          DATE  NULL ,
	Monto                FLOAT  NULL ,
	Estado               VARCHAR2(1)  NULL ,
	IdVentas             INTEGER  NOT NULL ,
	IdVendedor           INTEGER  NULL ,
	IdCliente            INTEGER  NULL ,
CONSTRAINT  XPKVentas PRIMARY KEY (IdVentas),

CONSTRAINT R_1 FOREIGN KEY (IdVendedor) REFERENCES Vendedor (IdVendedor) ON DELETE SET NULL,

CONSTRAINT R_2 FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente) ON DELETE SET NULL
);

CREATE TABLE Detalle_Ventas
(
	IdProducto           INTEGER  NOT NULL ,
	IdVentas             INTEGER  NOT NULL ,
	IdDetalleVentas      INTEGER(11)  NOT NULL ,
	Cantidad             INTEGER(11)  NULL ,
	PrecioVenta          FLOAT  NULL ,
CONSTRAINT  XPKProducto_Ventas PRIMARY KEY (IdDetalleVentas),

CONSTRAINT R_4 FOREIGN KEY (IdProducto) REFERENCES Producto (IdProducto),

CONSTRAINT R_5 FOREIGN KEY (IdVentas) REFERENCES Ventas (IdVentas)
);
