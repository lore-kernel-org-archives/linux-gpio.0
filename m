From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC 3/5] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Wed, 25 Jan 2017 19:09:45 +0100
Message-ID: <1485367787-8109-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:52930 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751685AbdAYSJ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2017 13:09:59 -0500
In-Reply-To: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Add dt-bindings header for Renesas RZ pincontroller.
The header defines macros for pin description and alternate function
numbers.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/dt-bindings/pinctrl/pinctrl-renesas-rz.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-renesas-rz.h

diff --git a/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h b/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h
new file mode 100644
index 0000000..92816d4
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h
@@ -0,0 +1,19 @@
+/*
+ * Defines macros and constants for Renesas RZ pin controller and muxer
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZ_H
+#define __DT_BINDINGS_PINCTRL_RENESAS_RZ_H
+
+#define RZ_PIN(b, p) b p
+
+#define ALTERNATE_FUNC_1	0
+#define ALTERNATE_FUNC_2	1
+#define ALTERNATE_FUNC_3	2
+#define ALTERNATE_FUNC_4	3
+#define ALTERNATE_FUNC_5	4
+#define ALTERNATE_FUNC_6	5
+#define ALTERNATE_FUNC_7	6
+#define ALTERNATE_FUNC_8	7
+
+#endif
-- 
2.7.4

