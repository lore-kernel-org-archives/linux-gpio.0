From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: add DT bindings for existing consumer flags
Date: Thu, 24 Sep 2015 15:09:15 -0700
Message-ID: <1443132555-8244-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:33090 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753301AbbIXWJe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 18:09:34 -0400
Received: by pacex6 with SMTP id ex6so84558245pac.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2015 15:09:34 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "H. Nikolaus Schaller" <hns@goldelico.com>

It is customary for GPIO controllers to support open drain/collector
and open source/emitter configurations. Add standard GPIO line flags
to account for this and augment the documentation to say that these
are the most generic bindings.

Several people approached me to add new flags to the lines, and this
makes sense, but let's first bind up the most common cases before we
start to add exotic stuff.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 15 +++++++++++++--
 include/dt-bindings/gpio/gpio.h                 |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 5788d5cf1252..7b1c8bc24e2d 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -52,9 +52,13 @@ only uses one.
 
 gpio-specifier may encode: bank, pin position inside the bank,
 whether pin is open-drain and whether pin is logically inverted.
+
 Exact meaning of each specifier cell is controller specific, and must
-be documented in the device tree binding for the device. Use the macros
-defined in include/dt-bindings/gpio/gpio.h whenever possible:
+be documented in the device tree binding for the device.
+
+Most controllers are however specifying a generic flag bitfield
+in the last cell, so for these, use the macros defined in
+include/dt-bindings/gpio/gpio.h whenever possible:
 
 Example of a node using GPIOs:
 
@@ -65,6 +69,13 @@ Example of a node using GPIOs:
 GPIO_ACTIVE_HIGH is 0, so in this example gpio-specifier is "18 0" and encodes
 GPIO pin number, and GPIO flags as accepted by the "qe_pio_e" gpio-controller.
 
+Optional standard bitfield specifiers for the last cell:
+
+- Bit 0: 0 means active high, 1 means active low
+- Bit 1: 1 means open drain/open collector, see:
+           https://en.wikipedia.org/wiki/Open_collector
+- Bit 2: 1 means open source/open emitter
+
 1.1) GPIO specifier best practices
 ----------------------------------
 
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index e6b1e0a808ae..f5ed02e81bf7 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -11,5 +11,7 @@
 
 #define GPIO_ACTIVE_HIGH 0
 #define GPIO_ACTIVE_LOW 1
+#define GPIO_OPEN_DRAIN 2
+#define GPIO_OPEN_SOURCE 4
 
 #endif
-- 
2.4.3

