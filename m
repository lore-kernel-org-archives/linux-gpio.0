From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: document open drain/source behaviour
Date: Sat,  9 Apr 2016 20:17:54 +0200
Message-ID: <1460225874-6677-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34592 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751771AbcDISR7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Apr 2016 14:17:59 -0400
Received: by mail-lf0-f47.google.com with SMTP id j11so111690433lfb.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2016 11:17:58 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michael Hennerich <michael.hennerich@analog.com>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>

This has been a totally undocumented feature for years so add some
generic concepts and documentation about open drain/source, include
some facts on how we now support for hardware.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Stop calling the totem-pole configuration the "modern" way of doing
  I/O. That's weasel terms.
- Describe both hardwired and soft-configured open drain/source
- Describe two usecases: levelshifters and wire-OR
- Reference the I2C bus as exampe
- Add another illustration
- Fix some spelling (and probably add new spelling mistakes)
---
 Documentation/gpio/driver.txt | 89 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index bbeec415f406..ae6e0299b16c 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -68,6 +68,95 @@ control callbacks) if it is expected to call GPIO APIs from atomic context
 on -RT (inside hard IRQ handlers and similar contexts). Normally this should
 not be required.
 
+
+GPIOs with open drain/source support
+------------------------------------
+
+Open drain (CMOS) or open collector (TTL) means the line is not actively driven
+high: instead you provide the drain/collector as output, so when the transistor
+is not open, it will present a high-impedance (tristate) to the external rail.
+
+
+   CMOS CONFIGURATION      TTL CONFIGURATION
+
+            ||--- out              +--- out
+     in ----||                   |/
+            ||--+         in ----|
+                |                |\
+               GND	           GND
+
+This configuration is normally used as a way to achieve one of two things:
+
+- Level-shifting: to reach a logical level higher than that of the silicon
+  where the output resides.
+
+- inverse wire-OR on an I/O line, for example a GPIO line, making it possible
+  for any driving stage on the line to drive it low even if any other output
+  to the same line is simultaneously driving it high. A special case of this
+  is driving the SCL and SCA lines of an I2C bus, which is by definition a
+  wire-OR bus.
+
+Both usecases require that the line be equipped with a pull-up resistor. This
+resistor will make the line tend to high level unless one of the transistors on
+the rail actively pulls it down.
+
+Integrated electronics often have an output driver stage in the form of a CMOS
+"totem-pole" with one N-MOS and one P-MOS transistor where one of them drives
+the line high and one of them drives the line low. This is called a push-pull
+output. The "totem-pole" looks like so:
+
+                 VDD
+                  |
+        OD    ||--+
+     +--/ ---o||     P-MOS-FET
+     |        ||--+
+in --+            +----- out
+     |        ||--+
+     +--/ ----||     N-MOS-FET
+        OS    ||--+
+                  |
+                 GND
+
+You see the little "switches" named "OD" and "OS" that enable/disable the
+P-MOS or N-MOS transistor right after the split of the input. As you can see,
+either transistor will go totally numb if this switch is open. The totem-pole
+is then halved and give high impedance instead of actively driving the line
+high or low respectively. That is usually how software-controlled open
+drain/source works.
+
+Some GPIO hardware come in open drain / open source configuration. Some are
+hard-wired lines that will only support open drain or open source no matter
+what: there is only one transistor there. Some are software-configurable:
+by flipping a bit in a register the output can be configured as open drain
+or open source, by flicking open the switches labeled "OD" and "OS" in the
+drawing above.
+
+By disabling the P-MOS transistor, the output can be driven between GND and
+high impedance (open drain), and by disabling the N-MOS transistor, the output
+can be driven between VDD and high impedance (open source). In the first case,
+a pull-up resistor is needed on the outgoing rail to complete the circuit, and
+in the second case, a pull-down resistor is needed on the rail.
+
+Hardware that supports open drain or open source or both, can implement a
+special callback in the gpio_chip: .set_single_ended() that takes an enum flag
+telling whether to configure the line as open drain, open source or push-pull.
+This will happen in response to the GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE flag
+set in the machine file, or coming from other hardware descriptions.
+
+If this state can not be configured in hardware, i.e. if the GPIO hardware does
+not support open drain/open source in hardware, the GPIO library will instead
+use a trick: when a line is set as output, if the line is flagged as open
+drain, and the output value is negative, it will be driven low as usual. But
+if the output value is set to positive, it will instead *NOT* be driven high,
+instead it will be switched to input, as input mode is high impedance, thus
+achieveing an "open drain emulation" of sorts: electrically the behaviour will
+be identical, with the exception of possible hardware glitches when switching
+the mode of the line.
+
+For open source configuration the same principle is used, just that instead
+of actively driving the line low, it is set to input.
+
+
 GPIO drivers providing IRQs
 ---------------------------
 It is custom that GPIO drivers (GPIO chips) are also providing interrupts,
-- 
2.4.3

