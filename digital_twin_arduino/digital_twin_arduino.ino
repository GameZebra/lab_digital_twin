const int slider = 7;
const int button1 = 8;
const int button2 = 9;
const int button3 = 10;
const int button4 = 11;
const int button5 = 12;

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print(analogRead(slider));
  Serial.print(",");
  Serial.print(digitalRead(button1));
  Serial.print(",");
  Serial.print(digitalRead(button2));
  Serial.print(",");
  Serial.print(digitalRead(button3));
  Serial.print(",");
  Serial.print(digitalRead(button4));
  Serial.print(",");
  Serial.println(digitalRead(button5));
}
