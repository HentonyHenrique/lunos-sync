unit unit_funcoes;

interface

implementation

function Criptografia(Senha, Chave: string): string;
var
  x, y: Integer;
  NovaSenha: String;
begin
  for x := 1 to Length(Chave) do
  begin
    NovaSenha := '';
    for y := 1 to Length(Senha) do
    begin
      NovaSenha := NovaSenha + chr((Ord(Chave[x])) xor Ord(Senha[y]));
    end;
    Senha := NovaSenha;
  end;
  result := Senha;
end;

end.
