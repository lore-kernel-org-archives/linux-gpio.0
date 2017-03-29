From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 2/2] dt-bindings: gpio: Document Cadence GPIO controller bindings
Date: Wed, 29 Mar 2017 18:04:19 +0200
Message-ID: <1490803459-29697-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42504 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752283AbdC2QEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2017 12:04:24 -0400
In-Reply-To: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Simon Hatliff <hatliff@cadence.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

Document Cadence GPIO bindings.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 .../devicetree/bindings/gpio/cdns,gpio.txt         | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
new file mode 100644
index 000000000000..09fb2c8e5c9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
@@ -0,0 +1,41 @@
+Cadence GPIO controller bindings
+
+Required properties:
+- compatible: should be "cdns,gpio-r1p02".
+- reg: the register base address and size.
+- #gpio-cells: should be 2.
+  * first cell is the GPIO number.
+  * second cell specifies the GPIO flags, as defined in
+    <dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW
+    flags are supported.
+- gpio-controller: marks the device as a GPIO controller.
+- clocks: should contain one entry referencing the peripheral clock driving the
+  GPIO controller.
+
+Optional properties:
+- interrupt-parent: phandle of the parent interrupt controller.
+- interrupts: interrupt specifier for the controllers interrupt.
+- interrupt-controller: marks the device as an interrupt controller. When
+  defined, interrupts, interrupt-parent and #interrupt-cells are required.
+- interrupt-cells: should be 2.
+  * first cell is the GPIO number you want to use as an IRQ source.
+  * second cell specifies the IRQ type, as defined in
+    <dt-bindings/interrupt-controller/irq.h>.
+
+Example:
+
+	gpio-controller@d050000 {
+		compatible = "cdns,gpio";
+		reg = <0xd050000 0x10000>;
+
+		clocks = <&gpio_pclk>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
-- 
2.7.4

