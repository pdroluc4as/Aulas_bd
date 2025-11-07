drop trigger if exists veiculo_validar 
go

create trigger veiculo_validar on Veiculo
for insert, update
as

	declare @fabricante varchar(60)
	declare @modelo varchar(60)
	declare @ano_fabricacao int
	declare @placa varchar(8)
	declare @uf varchar(2)

	select @fabricante = fabricante, @modelo = modelo, @ano_fabricacao = ano_fabricacao, @placa = placa, @uf = uf
	from inserted

	-- VALIDAR FABRICANTE 
	if (ltrim(@fabricante) = '')
	begin
		rollback transaction
		raiserror('Campo FABRICANTE não pode estar vazio', 0, 0)
	end

	-- VALIDAR MODELO
	if (ltrim(@modelo) = '')
	begin
		rollback transaction
		raiserror('Campo MODELO não pode estar vazio', 0, 0)
	end

	-- VALIDAR ANO DE FABRICAÇÃO
	if (len(@ano_fabricacao) != 4)
	begin
		rollback transaction
		raiserror('Campo ANO DE FABRICAÇÃO deve ter 4 dígitos', 0, 0)
	end

	-- VALIDAR PLACA
	if (ltrim(@placa) not like '[Aa-Zz][Aa-Zz][Aa-Zz][\-][0-9][0-9][0-9][0-9]')
	begin
		rollback transaction
		raiserror('Campo PLACA deve seguir formato AAA-9999', 0, 0)
	end

	-- VALIDAR UF
	if (@UF  not in ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO', 'AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE', 'GO', 'MT', 'MS', 'DF', 'ES', 'MG', 'RJ', 'SP', 'PR', 'RS', 'SC'))
	begin
		rollback transaction
		raiserror('mora no brasil meu truta', 0, 0)
	end

	