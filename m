From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: document interaction with other subsystems
Date: Tue, 21 Jul 2015 11:39:57 +0200
Message-ID: <1437471597-5920-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:33164 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753879AbbGUJkG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2015 05:40:06 -0400
Received: by lbbyj8 with SMTP id yj8so111985446lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2015 02:40:04 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Now I am very fed up with people reinventing kernel wheels in
userspace "just because they can" (read, sysfs). Put in a angry
blurb in sysfs doc and put in a new file with pointers to other
subsystem drivers utilizing GPIOs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/00-INDEX            |  3 ++
 Documentation/gpio/drivers-on-gpio.txt | 95 ++++++++++++++++++++++++++++++++++
 Documentation/gpio/sysfs.txt           |  9 ++--
 3 files changed, 102 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/gpio/drivers-on-gpio.txt

diff --git a/Documentation/gpio/00-INDEX b/Documentation/gpio/00-INDEX
index 1de43ae46ae6..179beb234f98 100644
--- a/Documentation/gpio/00-INDEX
+++ b/Documentation/gpio/00-INDEX
@@ -6,6 +6,9 @@ consumer.txt
 	- How to obtain and use GPIOs in a driver
 driver.txt
 	- How to write a GPIO driver
+drivers-on-gpio.txt:
+	- Drivers in other subsystems that can use GPIO to provide more
+	  complex functionality.
 board.txt
 	- How to assign GPIOs to a consumer device and a function
 sysfs.txt
diff --git a/Documentation/gpio/drivers-on-gpio.txt b/Documentation/gpio/drivers-on-gpio.txt
new file mode 100644
index 000000000000..f6121328630f
--- /dev/null
+++ b/Documentation/gpio/drivers-on-gpio.txt
@@ -0,0 +1,95 @@
+Subsystem drivers using GPIO
+============================
+
+Note that standard kernel drivers exist for common GPIO tasks and will provide
+the right in-kernel and userspace APIs/ABIs for the job, and that these
+drivers can quite easily interconnect with other kernel subsystems using
+hardware descriptions such as device tree or ACPI:
+
+- leds-gpio: drivers/leds/leds-gpio.c will handle LEDs connected to  GPIO
+  lines, giving you the LED sysfs interface
+
+- ledtrig-gpio: drivers/leds/trigger/ledtrig-gpio.c will provide a LED trigger,
+  i.e. a LED will turn on/off in response to a GPIO line going high or low
+  (and that LED may in turn use the leds-gpio as per above).
+
+- gpio-keys: drivers/input/keyboard/gpio_keys.c is used when your GPIO line
+  can generate interrupts in response to a key press. Also supports debounce.
+
+- gpio-keys-polled: drivers/input/keyboard/gpio_keys_polled.c is used when your
+  GPIO line cannot generate interrupts, so it needs to be periodically polled
+  by a timer.
+
+- gpio_mouse: drivers/input/mouse/gpio_mouse.c is used to provide a mouse with
+  up to three buttons by simply using GPIOs and no mouse port. You can cut the
+  mouse cable and connect the wires to GPIO lines or solder a mouse connector
+  to the lines for a more permanent solution of this type.
+
+- gpio-beeper: drivers/input/misc/gpio-beeper.c is used to provide a beep from
+  an external speaker connected to a GPIO line.
+
+- gpio-tilt-polled: drivers/input/misc/gpio_tilt_polled.c provides tilt
+  detection switches using GPIO, which is useful for your homebrewn pinball
+  machine if for nothing else. It can detect different tilt angles of the
+  monitored object.
+
+- extcon-gpio: drivers/extcon/extcon-gpio.c is used when you need to read an
+  external connector status, such as a headset line for an audio driver or an
+  HDMI connector. It will provide a better userspace sysfs interface than GPIO.
+
+- restart-gpio: drivers/power/gpio-restart.c is used to restart/reboot the
+  system by pulling a GPIO line and will register a restart handler so
+  userspace can issue the right system call to restart the system.
+
+- poweroff-gpio: drivers/power/gpio-poweroff.c is used to power the system down
+  by pulling a GPIO line and will register a pm_power_off() callback so that
+  userspace can issue the right system call to power down the system.
+
+- gpio-gate-clock: drivers/clk/clk-gpio-gate.c is used to control a gated clock
+  (off/on) that uses a GPIO, and integrated with the clock subsystem.
+
+- i2c-gpio: drivers/i2c/busses/i2c-gpio.c is used to drive an I2C bus
+  (two wires, SDA and SCL lines) by hammering (bitbang) two GPIO lines. It will
+  appear as any other I2C bus to the system and makes it possible to connect
+  drivers for the I2C devices on the bus like any other I2C bus driver.
+
+- spi_gpio: drivers/spi/spi-gpio.c is used to drive an SPI bus (variable number
+  of wires, atleast SCK and optionally MISO, MOSI and chip select lines) using
+  GPIO hammering (bitbang). It will appear as any other SPI bus on the system
+  and makes it possible to connect drivers for SPI devices on the bus like
+  any other SPI bus driver. For example any MMC/SD card can then be connected
+  to this SPI by using the mmc_spi host from the MMC/SD card subsystem.
+
+- w1-gpio: drivers/w1/masters/w1-gpio.c is used to drive a one-wire bus using
+  a GPIO line, integrating with the W1 subsystem and handling devices on
+  the bus like any other W1 device.
+
+- gpio-fan: drivers/hwmon/gpio-fan.c is used to control a fan for cooling the
+  system, connected to a GPIO line (and optionally a GPIO alarm line),
+  presenting all the right in-kernel and sysfs interfaces to make your system
+  not overheat.
+
+- gpio-regulator: drivers/regulator/gpio-regulator.c is used to control a
+  regulator providing a certain voltage by pulling a GPIO line, integrating
+  with the regulator subsystem and giving you all the right interfaces.
+
+- gpio-wdt: drivers/watchdog/gpio_wdt.c is used to provide a watchdog timer
+  that will periodically "ping" a hardware connected to a GPIO line by toggling
+  it from 1-to-0-to-1. If that hardware does not recieve its "ping"
+  periodically, it will reset the system.
+
+- gpio-nand: drivers/mtd/nand/gpio.c is used to connect a NAND flash chip to
+  a set of simple GPIO lines: RDY, NCE, ALE, CLE, NWP. It interacts with the
+  NAND flash MTD subsystem and provides chip access and partition parsing like
+  any other NAND driving hardware.
+
+Apart from this there are special GPIO drivers in subsystems like MMC/SD to
+read card detect and write protect GPIO lines, and in the TTY serial subsystem
+to emulate MCTRL (modem control) signals CTS/RTS by using two GPIO lines. The
+MTD NOR flash has add-ons for extra GPIO lines too, though the address bus is
+usually connected directly to the flash.
+
+Use those instead of talking directly to the GPIOs using sysfs; they integrate
+with kernel frameworks better than your userspace code could. Needless to say,
+just using the apropriate kernel drivers will simplify and speed up your
+embedded hacking in particular by providing ready-made components.
diff --git a/Documentation/gpio/sysfs.txt b/Documentation/gpio/sysfs.txt
index 535b6a8a7a7c..0700b55637f5 100644
--- a/Documentation/gpio/sysfs.txt
+++ b/Documentation/gpio/sysfs.txt
@@ -20,11 +20,10 @@ userspace GPIO can be used to determine system configuration data that
 standard kernels won't know about. And for some tasks, simple userspace
 GPIO drivers could be all that the system really needs.
 
-Note that standard kernel drivers exist for common "LEDs and Buttons"
-GPIO tasks:  "leds-gpio" and "gpio_keys", respectively. Use those
-instead of talking directly to the GPIOs; they integrate with kernel
-frameworks better than your userspace code could.
-
+DO NOT ABUSE SYFS TO CONTROL HARDWARE THAT HAS PROPER KERNEL DRIVERS.
+PLEASE READ THE DOCUMENT NAMED "drivers-on-gpio.txt" IN THIS DOCUMENTATION
+DIRECTORY TO AVOID REINVENTING KERNEL WHEELS IN USERSPACE. I MEAN IT.
+REALLY.
 
 Paths in Sysfs
 --------------
-- 
2.4.3

