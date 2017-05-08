From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] gpio: fix description for gpio-ranges example
Date: Mon,  8 May 2017 10:41:48 +0200
Message-ID: <20170508084148.30286-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:35155 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751433AbdEHImA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2017 04:42:00 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de

The length of the second entry is 20, so it affects GPIOs 10..29.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 84ede036f73d..2209c163f2a5 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -280,12 +280,12 @@ Example 1:
 		gpio-controller;
 		gpio-ranges = <&pinctrl1 0 20 10>, <&pinctrl2 10 50 20>;
 	};
 
 Here, a single GPIO controller has GPIOs 0..9 routed to pin controller
-pinctrl1's pins 20..29, and GPIOs 10..19 routed to pin controller pinctrl2's
-pins 50..59.
+pinctrl1's pins 20..29, and GPIOs 10..29 routed to pin controller pinctrl2's
+pins 50..69.
 
 Example 2:
 
 	gpio_pio_i: gpio-controller@14B0 {
 		#gpio-cells = <2>;
-- 
2.11.0

