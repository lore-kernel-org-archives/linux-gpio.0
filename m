From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] Documentation: gpio: Explain that <function>-gpio is also supported
Date: Tue,  1 Sep 2015 10:46:15 +0200
Message-ID: <1441097175-10341-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33263 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754659AbbIAIrO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 1 Sep 2015 04:47:14 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

The GPIO documentation mentions that GPIOs are mapped by defining a
<function>-gpios property in the consumer device's node but a -gpio
sufix is also supported after commit:

dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")

Update the documentation to match the implementation.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 Documentation/gpio/board.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index b80606de545a..cdb87b665235 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -21,8 +21,8 @@ exact way to do it depends on the GPIO controller providing the GPIOs, see the
 device tree bindings for your controller.
 
 GPIOs mappings are defined in the consumer device's node, in a property named
-<function>-gpios, where <function> is the function the driver will request
-through gpiod_get(). For example:
+either <function>-gpios or <function>-gpio, where <function> is the function
+the driver will request through gpiod_get(). For example:
 
 	foo_device {
 		compatible = "acme,foo";
@@ -31,7 +31,7 @@ through gpiod_get(). For example:
 			    <&gpio 16 GPIO_ACTIVE_HIGH>, /* green */
 			    <&gpio 17 GPIO_ACTIVE_HIGH>; /* blue */
 
-		power-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+		power-gpio = <&gpio 1 GPIO_ACTIVE_LOW>;
 	};
 
 This property will make GPIOs 15, 16 and 17 available to the driver under the
-- 
2.4.3

