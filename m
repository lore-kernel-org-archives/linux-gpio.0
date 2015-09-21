From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] Documentation: gpio: mention that <function>-gpio has been deprecated
Date: Mon, 21 Sep 2015 15:14:46 +0200
Message-ID: <1442841286-8586-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:38334 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756716AbbIUNOz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 21 Sep 2015 09:14:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

The gpiolib supports parsing DT properties of the form <function>-gpio
but it was only added for compatibility with older DT bindings that got
it wrong and should not be used in newer bindings.

The commit that added support for this was:

dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")

but didn't update the documentation to explain this so it's been a source
of confusion. So let's make clear this in the GPIO documentation.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 Documentation/gpio/board.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index f59c43b6411b..3092178628c4 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -21,8 +21,8 @@ exact way to do it depends on the GPIO controller providing the GPIOs, see the
 device tree bindings for your controller.
 
 GPIOs mappings are defined in the consumer device's node, in a property named
-either <function>-gpios or <function>-gpio, where <function> is the function
-the driver will request through gpiod_get(). For example:
+<function>-gpios, where <function> is the function the driver will request
+through gpiod_get(). For example:
 
 	foo_device {
 		compatible = "acme,foo";
@@ -31,9 +31,13 @@ the driver will request through gpiod_get(). For example:
 			    <&gpio 16 GPIO_ACTIVE_HIGH>, /* green */
 			    <&gpio 17 GPIO_ACTIVE_HIGH>; /* blue */
 
-		power-gpio = <&gpio 1 GPIO_ACTIVE_LOW>;
+		power-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 	};
 
+Properties named <function>-gpio are also considered valid and old bindings use
+it but are only supported for compatibility reasons and should not be used for
+newer bindings since it has been deprecated.
+
 This property will make GPIOs 15, 16 and 17 available to the driver under the
 "led" function, and GPIO 1 as the "power" GPIO:
 
-- 
2.4.3

