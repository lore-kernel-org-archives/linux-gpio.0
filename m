From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 2/3] pinctrl: zx: Add ZTE pinctrl dts document
Date: Fri, 26 Aug 2016 20:19:24 +0800
Message-ID: <1472213965-4899-1-git-send-email-jun.nie@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:33063 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751168AbcHZMTs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2016 08:19:48 -0400
Received: by mail-pf0-f179.google.com with SMTP id y134so28334481pfg.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2016 05:19:48 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: shawn.guo@linaro.org, jason.liu@linaro.org, Jun Nie <jun.nie@linaro.org>

Add initial ZTE pinctrl dts document for ZX296718 SoC.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/pinctrl/pinctrl-zx.txt     | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
new file mode 100644
index 0000000..4061f51
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
@@ -0,0 +1,54 @@
+* ZTE ZX Pin Controller
+
+The pins controlled by ZX pin controller are organized in banks,
+number of pins in each bank may vary.  Each pin has different multiplexing
+functions. There are two type of pins, normal ones and AON ones. AON
+pins control high level multiplex and normal pins may require multiplex
+configuration of parent AON pins. As the AON pins number is not as much as
+normal pins, some normal pins are not routed through AON pin side and are
+under direct control by itself.
+
+Required properties:
+- compatible:
+  "zte,zx296718-pinctrl"
+  "zte,zx296718-aonpmx"
+
+- reg: Should contain the register physical address and length for the
+  pin controller.
+
+IO pull up/down etc configuration is supported with unified management of
+normal pins and AON pins. The configuration registers area is just after
+AON pinmux reg area, while normal pins regs in different area. So two dts
+nodes are needed to provides the two reg regions.
+
+Below configuration are supported. Please refer to pinctrl-bindings.txt
+in this directory for more details of the common pinctrl bindings used
+by client devices.
+
+bias-pull-up            - pull up the pin
+bias-pull-down          - pull down the pin
+drive-strength          - sink or source at most 7 mA
+input-enable            - enable input on pin (no effect on output)
+power-source            - select power supplies. 1: 1.8V, 0: 3.3V
+slew-rate               - set the slew rate
+
+Pin names are defined by bank sequence and pins number in the bank. For
+example, B2 is the 3rd pin in the second bank. The AON pin has prefix
+AON, like AONC2.
+
+Example dts nodes:
+
+pinctop: pinctrl@01462000 {
+	compatible = "zte,zx296718-pinctrl";
+	reg = <0x01462000 0x1000>;
+
+	i2c5_pins: i2c5pins {
+		pins = "G6", "G7";
+		function = "I2C5";
+	}
+};
+
+pmx_aon: pinctrl@00119000 {
+	compatible = "zte,zx296718-aonpmx";
+	reg = <0x00119000 0x1000>;
+};
-- 
1.9.1

