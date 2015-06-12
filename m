From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 1/2] dt/bindings: gpio: Document ZTE zx296702 GPIO
Date: Fri, 12 Jun 2015 16:35:14 +0800
Message-ID: <1434098115-17292-1-git-send-email-jun.nie@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:35755 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbbFLIfd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2015 04:35:33 -0400
Received: by pacyx8 with SMTP id yx8so18932171pac.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2015 01:35:33 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: shawn.guo@linaro.org, wan.zhijun@zte.com.cn, jason.liu@linaro.org, Jun Nie <jun.nie@linaro.org>

Add document of ZTE zx296702 GPIO binding

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/gpio/zx296702-gpio.txt     | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/zx296702-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/zx296702-gpio.txt b/Documentation/devicetree/bindings/gpio/zx296702-gpio.txt
new file mode 100644
index 0000000..0dab156
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/zx296702-gpio.txt
@@ -0,0 +1,24 @@
+ZTE ZX296702 GPIO controller
+
+Required properties:
+- compatible : "zte,zx296702-gpio"
+- #gpio-cells : Should be two. The first cell is the pin number and the
+  second cell is used to specify optional parameters:
+  - bit 0 specifies polarity (0 for normal, 1 for inverted)
+- gpio-controller : Marks the device node as a GPIO controller.
+- interrupts : Interrupt mapping for GPIO IRQ.
+- gpio-ranges : Interaction with the PINCTRL subsystem.
+
+gpio1: gpio@b008040 {
+	compatible = "zte,zx296702-gpio";
+	reg = <0xb008040 0x40>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	gpio-ranges = < &pmx0 0 54 2 &pmx0 2 59 14>;
+	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-parent = <&intc>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	clock-names = "gpio_pclk";
+	clocks = <&lsp0clk ZX296702_GPIO_CLK>;
+};
-- 
1.9.1

