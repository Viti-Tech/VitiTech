const int ValorAr = 550; 
const int ValorAgua = 230;

int valorUmidadeSolo = 0;
float porcentagemUmidade = 0; // variaveis leitura atual do sensor e valor final calculado em porcentagem 

void setup() {
  Serial.begin(9600); // Ativa a comunicação serial na velocidade de 9600 bps.
  // Isso permite que o Arduino envie dados para o computador para que você possa ver os resultados na tela (no Monitor Serial).

}

void loop() { //O código dentro do void loop() roda repetidamente:
  valorUmidadeSolo = analogRead(A5); //O Arduino lê o valor atual do sensor que está conectado no pino analógico A5 


  int faixa = ValorAr - ValorAgua;  // PARAMETRO DE CORREÇÃO E NIVILAMENTO

  int distancia = ValorAr - valorUmidadeSolo;

  porcentagemUmidade = (float)distancia / faixa * 100.0; // CALCULAR A UMIDADE EM PORCENTAGEM

  if (porcentagemUmidade < 0) porcentagemUmidade = 0;  //TRATAMENTO DE VALORES MANTENDO ENTRE 0 E 100
  if (porcentagemUmidade > 100) porcentagemUmidade = 100;

  //Serial.print("Leitura bruta: ");
  //Serial.print(valorUmidadeSolo);
  //Serial.print(" | Umidade:");
  //Serial.print(porcentagemUmidade);
  //Serial.println("%");

   Serial.print("UmidadeMaxima:");
  Serial.print(55);
  Serial.print(" ");
  Serial.print("Umidade:");
  Serial.print(porcentagemUmidade);
  Serial.print(" ");
  Serial.print("UmidadeMinima:");
  Serial.println(40);

  delay(1000);
}
