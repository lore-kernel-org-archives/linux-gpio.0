From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: fix overly long lines
Date: Thu, 30 Jun 2016 00:20:18 +0300
Message-ID: <6941131.ZKfJHhvm82@wasted.cogentembedded.com>
References: <1748403.xeiuK39ynx@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1748403.xeiuK39ynx@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be
List-Id: linux-gpio@vger.kernel.org

The PORT_GP_CFG_<n>() macros take up more than 80 columns -- and not for
a good reason. Make the header file checkpatch.pl-proof at least in this
respect...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/pinctrl/sh-pfc/sh_pfc.h |   95 +++++++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 40 deletions(-)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/sh_pfc.h
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -354,72 +354,87 @@ extern const struct sh_pfc_soc_info shx3
  * GP port style (32 ports banks)
  */
 
-#define PORT_GP_CFG_1(bank, pin, fn, sfx, cfg) fn(bank, pin, GP_##bank##_##pin, sfx, cfg)
+#define PORT_GP_CFG_1(bank, pin, fn, sfx, cfg)				\
+	fn(bank, pin, GP_##bank##_##pin, sfx, cfg)
 #define PORT_GP_1(bank, pin, fn, sfx)	PORT_GP_CFG_1(bank, pin, fn, sfx, 0)
 
-#define PORT_GP_CFG_4(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg), PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg),	\
-	PORT_GP_CFG_1(bank, 2,  fn, sfx, cfg), PORT_GP_CFG_1(bank, 3,  fn, sfx, cfg)
+#define PORT_GP_CFG_4(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 2,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 3,  fn, sfx, cfg)
 #define PORT_GP_4(bank, fn, sfx)	PORT_GP_CFG_4(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_8(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_4(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 4,  fn, sfx, cfg), PORT_GP_CFG_1(bank, 5,  fn, sfx, cfg),	\
-	PORT_GP_CFG_1(bank, 6,  fn, sfx, cfg), PORT_GP_CFG_1(bank, 7,  fn, sfx, cfg)
+#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_4(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 4,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 5,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 6,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 7,  fn, sfx, cfg)
 #define PORT_GP_8(bank, fn, sfx)	PORT_GP_CFG_8(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_9(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_8(bank, fn, sfx, cfg),						\
+#define PORT_GP_CFG_9(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_8(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 8,  fn, sfx, cfg)
 #define PORT_GP_9(bank, fn, sfx)	PORT_GP_CFG_9(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_12(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_8(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 8,  fn, sfx, cfg), PORT_GP_CFG_1(bank, 9,  fn, sfx, cfg),	\
-	PORT_GP_CFG_1(bank, 10, fn, sfx, cfg), PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
+#define PORT_GP_CFG_12(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_9(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 9,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 10, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
 #define PORT_GP_12(bank, fn, sfx)	PORT_GP_CFG_12(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_14(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_12(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg), PORT_GP_CFG_1(bank, 13, fn, sfx, cfg)
+#define PORT_GP_CFG_14(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_12(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 13, fn, sfx, cfg)
 #define PORT_GP_14(bank, fn, sfx)	PORT_GP_CFG_14(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_15(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_14(bank, fn, sfx, cfg),						\
+#define PORT_GP_CFG_15(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_14(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 14, fn, sfx, cfg)
 #define PORT_GP_15(bank, fn, sfx)	PORT_GP_CFG_15(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_16(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_14(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 14, fn, sfx, cfg), PORT_GP_CFG_1(bank, 15, fn, sfx, cfg)
+#define PORT_GP_CFG_16(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_15(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 15, fn, sfx, cfg)
 #define PORT_GP_16(bank, fn, sfx)	PORT_GP_CFG_16(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_18(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_16(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 16, fn, sfx, cfg), PORT_GP_CFG_1(bank, 17, fn, sfx, cfg)
+#define PORT_GP_CFG_18(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_16(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 16, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 17, fn, sfx, cfg)
 #define PORT_GP_18(bank, fn, sfx)	PORT_GP_CFG_18(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_26(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_18(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 18, fn, sfx, cfg), PORT_GP_CFG_1(bank, 19, fn, sfx, cfg),	\
-	PORT_GP_CFG_1(bank, 20, fn, sfx, cfg), PORT_GP_CFG_1(bank, 21, fn, sfx, cfg),	\
-	PORT_GP_CFG_1(bank, 22, fn, sfx, cfg), PORT_GP_CFG_1(bank, 23, fn, sfx, cfg),	\
-	PORT_GP_CFG_1(bank, 24, fn, sfx, cfg), PORT_GP_CFG_1(bank, 25, fn, sfx, cfg)
+#define PORT_GP_CFG_26(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_18(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 18, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 19, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 20, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 21, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 22, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 23, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 24, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 25, fn, sfx, cfg)
 #define PORT_GP_26(bank, fn, sfx)	PORT_GP_CFG_26(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_28(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_26(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 26, fn, sfx, cfg), PORT_GP_CFG_1(bank, 27, fn, sfx, cfg)
+#define PORT_GP_CFG_28(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_26(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 26, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 27, fn, sfx, cfg)
 #define PORT_GP_28(bank, fn, sfx)	PORT_GP_CFG_28(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_30(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_28(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 28, fn, sfx, cfg), PORT_GP_CFG_1(bank, 29, fn, sfx, cfg)
+#define PORT_GP_CFG_30(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_28(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 28, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 29, fn, sfx, cfg)
 #define PORT_GP_30(bank, fn, sfx)	PORT_GP_CFG_30(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_32(bank, fn, sfx, cfg)						\
-	PORT_GP_CFG_30(bank, fn, sfx, cfg),						\
-	PORT_GP_CFG_1(bank, 30, fn, sfx, cfg), PORT_GP_CFG_1(bank, 31, fn, sfx, cfg)
+#define PORT_GP_CFG_32(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_30(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 30, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 31, fn, sfx, cfg)
 #define PORT_GP_32(bank, fn, sfx)	PORT_GP_CFG_32(bank, fn, sfx, 0)
 
 #define PORT_GP_32_REV(bank, fn, sfx)					\
