From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 1/2] pinctrl: sh-pfc: Introduce VIN_DATA_PIN_GROUP_VER
Date: Mon, 29 Oct 2018 19:13:43 +0100
Message-ID: <1540836824-4636-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1540836824-4636-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540836824-4636-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

VIN data groups may appear on different sets of pins, usually named
"vinX_data_[a|b]". The existing VIN_DATA_PIN_GROUP() does not support appending
the 'a' or 'b' suffix, leading to the definition of groups names not consistent
with the ones defined using SH_PFC_PIN_GROUP() macro.

Fix this by adding a macro that supports appending suffixes when required.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 458ae0a..2930e9a 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -54,17 +54,27 @@ struct sh_pfc_pin_group {
 
 /*
  * Using union vin_data saves memory occupied by the VIN data pins.
- * VIN_DATA_PIN_GROUP() is  a macro  used  to describe the VIN pin groups
- * in this case.
+ *
+ * VIN_DATA_PIN_GROUP() is  a macro  used  to describe the VIN pin groups,
+ * while VIN_DATA_PIN_GROUP_VER() is used when the same pin group can appear
+ * on different sets of pins.
  */
-#define VIN_DATA_PIN_GROUP(n, s)				\
-	{							\
-		.name = #n#s,					\
+#define __VIN_DATA_PIN_GROUP(n, s)				\
 		.pins = n##_pins.data##s,			\
 		.mux = n##_mux.data##s,				\
 		.nr_pins = ARRAY_SIZE(n##_pins.data##s),	\
 	}
 
+#define VIN_DATA_PIN_GROUP(n, s)				\
+	{							\
+		.name = #n#s,					\
+		__VIN_DATA_PIN_GROUP(n, s)
+
+#define VIN_DATA_PIN_GROUP_VER(n, v, s)				\
+	{							\
+		.name = #n#s"_"#v,				\
+		__VIN_DATA_PIN_GROUP(n##_##v, s)
+
 union vin_data {
 	unsigned int data24[24];
 	unsigned int data20[20];
-- 
2.7.4
