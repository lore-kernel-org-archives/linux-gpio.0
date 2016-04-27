From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: clarify open drain/source docs
Date: Wed, 27 Apr 2016 10:24:55 +0200
Message-ID: <1461745495-3854-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35555 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752385AbcD0IZB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Apr 2016 04:25:01 -0400
Received: by mail-lf0-f47.google.com with SMTP id c126so47596413lfb.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Apr 2016 01:25:00 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Make the text clearer, remove reference to confusing "positive"
and "negative" and elaborate a bit.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/driver.txt | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index ae6e0299b16c..6cb35a78eff4 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -100,6 +100,10 @@ Both usecases require that the line be equipped with a pull-up resistor. This
 resistor will make the line tend to high level unless one of the transistors on
 the rail actively pulls it down.
 
+The level on the line will go as high as the VDD on the pull-up resistor, which
+may be higher than the level supported by the transistor, achieveing a
+level-shift to the higher VDD.
+
 Integrated electronics often have an output driver stage in the form of a CMOS
 "totem-pole" with one N-MOS and one P-MOS transistor where one of them drives
 the line high and one of them drives the line low. This is called a push-pull
@@ -110,14 +114,18 @@ output. The "totem-pole" looks like so:
         OD    ||--+
      +--/ ---o||     P-MOS-FET
      |        ||--+
-in --+            +----- out
+IN --+            +----- out
      |        ||--+
      +--/ ----||     N-MOS-FET
         OS    ||--+
                   |
                  GND
 
-You see the little "switches" named "OD" and "OS" that enable/disable the
+The desired output signal (e.g. coming directly from some GPIO output register)
+arrives at IN. The switches named "OD" and "OS" are normally closed, creating
+a push-pull circuit.
+
+Consider the little "switches" named "OD" and "OS" that enable/disable the
 P-MOS or N-MOS transistor right after the split of the input. As you can see,
 either transistor will go totally numb if this switch is open. The totem-pole
 is then halved and give high impedance instead of actively driving the line
@@ -128,8 +136,8 @@ Some GPIO hardware come in open drain / open source configuration. Some are
 hard-wired lines that will only support open drain or open source no matter
 what: there is only one transistor there. Some are software-configurable:
 by flipping a bit in a register the output can be configured as open drain
-or open source, by flicking open the switches labeled "OD" and "OS" in the
-drawing above.
+or open source, in practice by flicking open the switches labeled "OD" and "OS"
+in the drawing above.
 
 By disabling the P-MOS transistor, the output can be driven between GND and
 high impedance (open drain), and by disabling the N-MOS transistor, the output
@@ -146,8 +154,8 @@ set in the machine file, or coming from other hardware descriptions.
 If this state can not be configured in hardware, i.e. if the GPIO hardware does
 not support open drain/open source in hardware, the GPIO library will instead
 use a trick: when a line is set as output, if the line is flagged as open
-drain, and the output value is negative, it will be driven low as usual. But
-if the output value is set to positive, it will instead *NOT* be driven high,
+drain, and the IN output value is low, it will be driven low as usual. But
+if the IN output value is set to high, it will instead *NOT* be driven high,
 instead it will be switched to input, as input mode is high impedance, thus
 achieveing an "open drain emulation" of sorts: electrically the behaviour will
 be identical, with the exception of possible hardware glitches when switching
-- 
2.4.11

