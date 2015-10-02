From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: add DT bindings for existing consumer flags
Date: Fri,  2 Oct 2015 04:27:47 -0700
Message-ID: <1443785267-14689-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:35628 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751342AbbJBL1x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 07:27:53 -0400
Received: by laer8 with SMTP id r8so90609995lae.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 04:27:51 -0700 (PDT)
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

Thanks to H. Nikolaus Schaller for ideas on how to encode single-ended
wiring such as open drain/source and open collector/emitter.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 17 +++++++++++++++--
 include/dt-bindings/gpio/gpio.h                 | 12 ++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 5788d5cf1252..63b1b9039ce8 100644
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
 
@@ -65,6 +69,15 @@ Example of a node using GPIOs:
 GPIO_ACTIVE_HIGH is 0, so in this example gpio-specifier is "18 0" and encodes
 GPIO pin number, and GPIO flags as accepted by the "qe_pio_e" gpio-controller.
 
+Optional standard bitfield specifiers for the last cell:
+
+- Bit 0: 0 means active high, 1 means active low
+- Bit 1: 1 means single-ended wiring, see:
+           https://en.wikipedia.org/wiki/Single-ended_triode
+	   When used with active-low, this means open drain/collector, see:
+           https://en.wikipedia.org/wiki/Open_collector
+	   When used with active-high, this means open source/emitter
+
 1.1) GPIO specifier best practices
 ----------------------------------
 
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index e6b1e0a808ae..c673d2c87c60 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -9,7 +9,19 @@
 #ifndef _DT_BINDINGS_GPIO_GPIO_H
 #define _DT_BINDINGS_GPIO_GPIO_H
 
+/* Bit 0 express polarity */
 #define GPIO_ACTIVE_HIGH 0
 #define GPIO_ACTIVE_LOW 1
 
+/* Bit 1 express single-endedness */
+#define GPIO_PUSH_PULL 0
+#define GPIO_SINGLE_ENDED 2
+
+/*
+ * Open Drain/Collector is the combination of single-ended active low,
+ * Open Source/Emitter is the combination of single-ended active high.
+ */
+#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_ACTIVE_LOW)
+#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_ACTIVE_HIGH)
+
 #endif
-- 
2.4.3

