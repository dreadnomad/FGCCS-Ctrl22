// blink led: fixed 2sec period
const int led_sec_pin = 21;
const int led_blink_pin = 20;
int led_state = 0;
int led_sec_state = 0;  // red LED on (parameter led_red)
long led_blink = 1;     // number of timed to flash at 1 Hz  (parameter “blink”)


// adjust time: offset to millies() to sync time with host ESP
unsigned long toff = 0; // affected by paramter “time"


void setup() {
  pinMode(led_blink_pin, OUTPUT);
  pinMode(led_sec_pin, OUTPUT);
  Serial.pins(0, 1);
  Serial.begin(115200);
}

void loop() {

  // systime with 1h roll-over
  long unsigned int systime = millis() + toff;
  if (systime > 3600000) {
    long unsigned int systime_mod1h = systime % 3600000;
    toff -= systime - systime_mod1h;
    systime = systime_mod1h;
  }

  // blink my led, fixed 2sec period with “led_blink” the  number of 1Hz flashes
  int led_time = systime % 2000;      // 2sec period: led_time counts from 0ms to 1999ms
  int led_cycle = led_time / 100 + 1; // devide in 20 slots to blink: led_cycle counts from 1 to 20
  if ((led_cycle <= led_blink) && (led_time % 100 < 50)) {
    if (led_state == 0)
      digitalWrite(led_blink_pin, 1);
    led_state = 1;
  } else {
    if (led_state == 1)
      digitalWrite(led_blink_pin, 0);
    led_state = 0;
  }
  if (led_sec_state == 0) {
    digitalWrite(led_sec_pin, 0);
  }
  if (led_sec_state == 1) {
    digitalWrite(led_sec_pin, 1);
  }


  // if there is serial input, read line and pares
  if (Serial.available()) {
    String mesg = Serial.readStringUntil('\n');
    String reply;
    // is it a status req?
    int lpos = mesg.indexOf("??");
    if (lpos >= 0) {
      reply = "Status report: \r\n time=" + String(systime) + "\r\n" + "blink=" + String(led_blink) + "\r\n" + "led_sec=" + String(led_sec_state) + "\r\n";
    }
    // is it a get?
    int qpos = mesg.indexOf("?");
    if (qpos >= 0) {
      // “*?*\n"
      if (mesg.substring(0, qpos) == "blink") {
        // “blink?*\n"
        reply = "blink=" + String(led_blink);
      }
      if (mesg.substring(0, qpos) == "time") {
        // “time?*\n"
        reply = "time=" + String(systime);
      }
      if (mesg.substring(0, qpos) == "led_sec") {
        // “time?*\n"
        reply = "led_sec=" + String(led_sec_state);
      }
    }
    // is it a set?
    int epos = mesg.indexOf("=");
    if (epos >= 0) {
      // *=*\n"
      unsigned long val = mesg.substring(epos + 1).toInt();
      //*=<VAL>*\n  (should check conversion errors)
      if (mesg.substring(0, epos) == "blink") {
        //blink=<VAL>*\n
        reply = "led=" + String(val);
        led_blink = val;
      }
      if (mesg.substring(0, epos) == "time") {
        //time=<VAL>*\n
        reply = "time=" + String(val);
        toff = val - millis();
      }
      if (mesg.substring(0, epos) == "led_sec") {
        //blink=<VAL>*\n
        reply = "led_sec=" + String(val);
        led_sec_state = val;
      }
    }
    
    Serial.println(reply);
  }
}
