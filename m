From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC fixes 2/2] pinctrl: rz-pfc: Fix RZ/A1 pin function configuration
Date: Fri, 27 Jan 2017 17:47:08 +0100
Message-ID: <1485535628-17097-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51902 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755237AbdA0QsS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2017 11:48:18 -0500
In-Reply-To: <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, Chris.Brandt@renesas.com, wsa@the-dreams.de
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Fix alternate function configuration sequence for RZ/A1 SoC.
The pin is first configured as simple input port, then alternate
function is configured.
Always enable input buffer for now as long as we don't have
configuration paramters coming from device tree.

Tested accessing embedded EEPROM chip through RIIC2 interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/rz-pfc/pinctrl-rza1.c | 55 +++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/rz-pfc/pinctrl-rza1.c b/drivers/pinctrl/rz-pfc/pinctrl-rza1.c
index 221f048..53b71c8 100644
--- a/drivers/pinctrl/rz-pfc/pinctrl-rza1.c
+++ b/drivers/pinctrl/rz-pfc/pinctrl-rza1.c
@@ -27,6 +27,7 @@
 #define MEM_RES_HIGH	1 /* PORTn_base + 0x4000 */
 
 /* displacements from PORTn_base */
+#define PM_REG		0x300
 #define PMC_REG		0x400
 #define PFC_REG		0x500
 #define PFCE_REG	0x600
@@ -235,8 +236,8 @@ static inline void rza1_set_bit(struct rz_pinctrl_res *res, int reg,
 #ifdef RZA1_REG_DBG
 	u16 temp = ioread16(mem);
 
-	pr_err("%p %p %p - %4x %4x\n",
-	       (void *)res->start, res->base, mem, temp, val);
+	pr_err("%p %p %p - %d:%d - %4x %4x\n",
+	       (void *)res->start, res->base, mem, bank, pin, temp, val);
 #endif
 	iowrite16(val, mem);
 }
@@ -253,25 +254,35 @@ static inline void rza1_set_bit(struct rz_pinctrl_res *res, int reg,
 static int rza1_set_mux(struct rz_pinctrl_dev *pinctrl,
 			struct rz_pin_desc *pin_desc, unsigned int mux_mode)
 {
-	struct rz_pinctrl_res *res;
+	struct rz_pinctrl_res *res_low, *res_high;
 	unsigned int bank = pin_desc->bank,
 		     pin = pin_desc->pin;
 
+	res_high = &pinctrl->res[MEM_RES_HIGH];
+	res_low = &pinctrl->res[MEM_RES_LOW];
+
 	/*
-	 * disable input buffer and bi-control direction before entering
-	 * alternate mode and let alternate function drive the IO mode by
-	 * setting PIPCn to 1
+	 * reset pin state disabling input buffer and bi-directional control
+	 * and configure it as input port before configuring alternate
+	 * function later
 	 */
-	res = &pinctrl->res[MEM_RES_HIGH];
-	rza1_set_bit(res, PIBC_REG, bank, pin, 0);
-	rza1_set_bit(res, PBDC_REG, bank, pin, 0);
-	rza1_set_bit(res, PIPC_REG, bank, pin, 1);
+	rza1_set_bit(res_high, PIBC_REG, bank, pin, 0);
+	rza1_set_bit(res_high, PBDC_REG, bank, pin, 0);
 
-	/* TODO:
-	 * all alternate functions except a few (3) need PIPCn = 1;
-	 * find a way to identify those 3 functions, do not set PIPCn to 1
-	 * and set PMn according to some flag passed as parameter from DTS
+	rza1_set_bit(res_low, PM_REG, bank, pin, 1);
+	rza1_set_bit(res_low, PMC_REG, bank, pin, 0);
+	rza1_set_bit(res_high, PIPC_REG, bank, pin, 0);
+
+	/*
+	 * pins that has to be used as input, even in alternate function mode,
+	 * needs input buffer enabled.
+	 * Set PBDCn to enable bi-control which enables input buffer
+	 * consequentialy.
+	 *
+	 * TODO: Add a flag to dts pin configuration to specify when a pin
+	 * requires input buffer enabled and set PBDCn conditionally.
 	 */
+	rza1_set_bit(res_high, PBDC_REG, bank, pin, 1);
 
 	/*
 	 * enable alternate function mode and select it.
@@ -290,11 +301,17 @@ static int rza1_set_mux(struct rz_pinctrl_dev *pinctrl,
 	 * 1	1	1	1	8		7
 	 * ----------------------------------------------------
 	 */
-	res = &pinctrl->res[MEM_RES_LOW];
-	rza1_set_bit(res, PMC_REG, bank, pin, 1);
-	rza1_set_bit(res, PFC_REG, bank, pin, mux_mode & 0x1);
-	rza1_set_bit(res, PFCE_REG, bank, pin, mux_mode & 0x2);
-	rza1_set_bit(res, PFCEA_REG, bank, pin, mux_mode & 0x4);
+	rza1_set_bit(res_low, PFC_REG, bank, pin, mux_mode & 0x1);
+	rza1_set_bit(res_low, PFCE_REG, bank, pin, mux_mode & 0x2);
+	rza1_set_bit(res_low, PFCEA_REG, bank, pin, mux_mode & 0x4);
+
+	/* TODO:
+	 * all alternate functions except a few (4) need PIPCn = 1;
+	 * find a way to identify those 3 functions, do not set PIPCn to 1
+	 * and set PMn according to some flag passed as parameter from DTS
+	 */
+	rza1_set_bit(res_high, PIPC_REG, bank, pin, 1);
+	rza1_set_bit(res_low, PMC_REG, bank, pin, 1);
 
 	return 0;
 }
-- 
2.7.4

