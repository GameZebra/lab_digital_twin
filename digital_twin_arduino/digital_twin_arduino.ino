const int slider = A3;
const int button1 = 7;
const int button2 = 8;

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print(analogRead(slider));
  Serial.print(",");
  Serial.print(digitalRead(button1));
  Serial.print(",");
  Serial.println(digitalRead(button2));
}
