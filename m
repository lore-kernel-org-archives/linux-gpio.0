From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: document open drain/source behaviour
Date: Tue,  5 Apr 2016 16:56:02 +0200
Message-ID: <1459868162-9736-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:36049 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751899AbcDEO4I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 10:56:08 -0400
Received: by mail-lb0-f170.google.com with SMTP id qe11so11032514lbc.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 07:56:07 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Hennerich <michael.hennerich@analog.com>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>

This has been a totally undocumented feature for years so add some
generic concepts and documentation about open drain/source, include
some facts on how we now support for hardware.

Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/driver.txt | 68 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index bbeec415f406..4cfcf889efcb 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -68,6 +68,74 @@ control callbacks) if it is expected to call GPIO APIs from atomic context
 on -RT (inside hard IRQ handlers and similar contexts). Normally this should
 not be required.
 
+
+GPIOs with open drain/source support
+------------------------------------
+
+Open drain (CMOS) or open collector (TTL) is traditionally a way to achieve
+wire-OR on an I/O line, for example a GPIO line, using a single transistor.
+This means the line is not actively driven high, instead you provide the
+drain/collector as output, so when the transistor is not open, it will present
+a high-impedance (tristate) to the external rail. This means it will not
+conflict with other similarly wired I/O lines on the rail, and when accompanied
+with a pull-up resistor, this will tend to high level unless one of the
+transistors on the rail actively pull it down.
+
+Modern electronics very seldom has this kind of single-transistor output
+stage. Instead they usually have a CMOS "totempole" with one N-MOS and one
+P-MOS transistor where one of them drive the line high and one of them drive
+the line low. This is called a push-pull-output. The "totempole" looks like so,
+and shold be familiar to anyone working with electronics:
+
+                 VDD
+                  |
+              ||--+
+     +--/ ---o||     P-MOS-FET
+     |        ||--+
+in --+            +----- out
+     |        ||--+
+     +--/ ----||     N-MOS-FET
+              ||--+
+                  |
+                 GND
+
+You see the little "switches" that enable/disable the P-MOS or N-MOS transistor
+right after the split of the input. As you can see, either transistor will go
+totally numb if this switch is open. That is usually how software-controlled
+open drain/source works.
+
+Some GPIO hardware support open drain / open source configuration. What this
+means in practice is usually that the driver has a push-pull output driver
+stage with one N-MOS and one P-MOS transistor like above, and using software,
+one of the transistors can be disabled, yielding an open drain or open source
+output.
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
+This will happen i response to the GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE flag
+set in the machine file, or coming from other hardware descriptions.
+
+If this state can not be configured in hardware, i.e. if the GPIO hardware does
+not support open drain/open source in hardware, the GPIO library will instead
+use a trick: when a line is set as output, if the line is flagged as open
+drain, and the output value is negative, it will be driven low as usual. But
+if the output value is set to positive, it will instead *NOT* be driven high,
+instead it will be switched to input, as input mode is high impedance, thus
+achieveing a "open drain emulation" of sorts: electrically the behaviour will
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

