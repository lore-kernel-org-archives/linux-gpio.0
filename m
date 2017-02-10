From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v2 1/3] pinctrl: rockchip: Add 3bit width mux support
Date: Fri, 10 Feb 2017 18:23:47 +0800
Message-ID: <1486722229-5451-2-git-send-email-david.wu@rock-chips.com>
References: <1486722229-5451-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486722229-5451-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "david.wu" <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

From: "david.wu" <david.wu@rock-chips.com>

This patch supports 3bit width iomux type.

Signed-off-by: david.wu <david.wu@rock-chips.com>
---
change in v2:
 - add the "% 8" in the 3bit width iomux calculating

 drivers/pinctrl/pinctrl-rockchip.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 08765f5..96fdb86 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -75,6 +75,7 @@ enum rockchip_pinctrl_type {
 #define IOMUX_WIDTH_4BIT	BIT(1)
 #define IOMUX_SOURCE_PMU	BIT(2)
 #define IOMUX_UNROUTED		BIT(3)
+#define IOMUX_WIDTH_3BIT	BIT(4)
 
 /**
  * @type: iomux variant using IOMUX_* constants
@@ -538,14 +539,20 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 				? info->regmap_pmu : info->regmap_base;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
-	mask = (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) ? 0xf : 0x3;
 	reg = bank->iomux[iomux_num].offset;
 	if (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) {
 		if ((pin % 8) >= 4)
 			reg += 0x4;
 		bit = (pin % 4) * 4;
+		mask = 0xf;
+	} else if (bank->iomux[iomux_num].type & IOMUX_WIDTH_3BIT) {
+		if ((pin % 8) >= 5)
+			reg += 0x4;
+		bit = (pin % 8 % 5) * 3;
+		mask = 0x7;
 	} else {
 		bit = (pin % 8) * 2;
+		mask = 0x3;
 	}
 
 	ret = regmap_read(regmap, reg, &val);
@@ -603,14 +610,20 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 				? info->regmap_pmu : info->regmap_base;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
-	mask = (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) ? 0xf : 0x3;
 	reg = bank->iomux[iomux_num].offset;
 	if (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) {
 		if ((pin % 8) >= 4)
 			reg += 0x4;
 		bit = (pin % 4) * 4;
+		mask = 0xf;
+	} else if (bank->iomux[iomux_num].type & IOMUX_WIDTH_3BIT) {
+		if ((pin % 8) >= 5)
+			reg += 0x4;
+		bit = (pin % 8 % 5) * 3;
+		mask = 0x7;
 	} else {
 		bit = (pin % 8) * 2;
+		mask = 0x3;
 	}
 
 	spin_lock_irqsave(&bank->slock, flags);
@@ -2359,7 +2372,8 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 			 * Increase offset according to iomux width.
 			 * 4bit iomux'es are spread over two registers.
 			 */
-			inc = (iom->type & IOMUX_WIDTH_4BIT) ? 8 : 4;
+			inc = (iom->type & (IOMUX_WIDTH_4BIT |
+					    IOMUX_WIDTH_3BIT)) ? 8 : 4;
 			if (iom->type & IOMUX_SOURCE_PMU)
 				pmu_offs += inc;
 			else
-- 
1.9.1
