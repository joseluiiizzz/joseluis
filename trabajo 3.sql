-- CREAR UNA STORE PROCEDURE PARA SUMAR 
-- Ejemplo: Como crear un procedimiento alamacenado.
CREATE PROC SumarNumeros
(
  @numero1 int
  @numero2 int
)
AS 
   print ´´+@numero1 + @numero2 + ´´;

--Ejemplo: Ejecutar el procedimiento almacenado creado.
EXEC SumarNumeros 100, 200:

--CREAR 4 PROCEDIMIENTOS ALAMACENADOS: RESTAR, MULTIPLICAR, DIVIDIR, POTENCIAR

-- Restar
CREATE PROC RestarNumeros
(
    @numero1 int,
    @numero2 int
)
AS
BEGIN
    PRINT CAST(@numero1 - @numero2 AS varchar);
END
GO

-- Multiplicar
CREATE PROC MultiplicarNumeros
(
    @numero1 int,
    @numero2 int
)
AS
BEGIN
    PRINT CAST(@numero1 * @numero2 AS varchar);
END
GO

-- Dividir
CREATE PROC DividirNumeros
(
    @numero1 int,
    @numero2 int
)
AS
BEGIN
    IF @numero2 = 0
        PRINT 'Error: División por cero no permitida';
    ELSE
        PRINT CAST(@numero1 / @numero2 AS varchar);
END
GO

-- Potenciar (elevar @numero1 a la potencia de @numero2)
CREATE PROC PotenciarNumeros
(
    @numero1 int,
    @numero2 int
)
AS
BEGIN
    DECLARE @resultado float;
    SET @resultado = POWER(CAST(@numero1 AS float), @numero2);
    PRINT CAST(@resultado AS varchar);
END
GO

--PARA EJECUTAR 
EXEC RestarNumeros 20, 5;
EXEC MultiplicarNumeros 7, 5;
EXEC DividirNumeros 60, 5;
EXEC PotenciarNumeros 64, 3;
