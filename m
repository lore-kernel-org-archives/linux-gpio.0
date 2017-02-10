From: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/3] pinctrl: rockchip: Add mux recalculation support
Date: Fri, 10 Feb 2017 18:23:48 +0800
Message-ID: <1486722229-5451-3-git-send-email-david.wu@rock-chips.com>
References: <1486722229-5451-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1486722229-5451-1-git-send-email-david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "david.wu" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

From: "david.wu" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Some pins are special at a bank so that add
IOMUX_RECALCED type to indicate which iomux source
of the bank need to be recalculated. If the mux
recalculateed callback and IOMUX_RECALCED type
were set, recalculate the pins' iomux by using
mux recalculated data struct.

Signed-off-by: david.wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
change in v2:
 - reorder the entries of the recalced data struct

 drivers/pinctrl/pinctrl-rockchip.c | 41 ++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 96fdb86..191a2f9 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -76,6 +76,7 @@ enum rockchip_pinctrl_type {
 #define IOMUX_SOURCE_PMU	BIT(2)
 #define IOMUX_UNROUTED		BIT(3)
 #define IOMUX_WIDTH_3BIT	BIT(4)
+#define IOMUX_RECALCED		BIT(5)
 
 /**
  * @type: iomux variant using IOMUX_* constants
@@ -305,6 +306,8 @@ struct rockchip_pin_ctrl {
 	void	(*drv_calc_reg)(struct rockchip_pin_bank *bank,
 				    int pin_num, struct regmap **regmap,
 				    int *reg, u8 *bit);
+	void	(*iomux_recalc)(u8 bank_num, int pin, int *reg,
+				u8 *bit, int *mask);
 };
 
 struct rockchip_pin_config {
@@ -356,6 +359,22 @@ struct rockchip_pinctrl {
 	unsigned int			nfunctions;
 };
 
+/**
+ * struct rockchip_mux_recalced_data: represent a pin iomux data.
+ * @num: bank number.
+ * @pin: pin number.
+ * @bit: index at register.
+ * @reg: register offset.
+ * @mask: mask bit
+ */
+struct rockchip_mux_recalced_data {
+	u8 num;
+	u8 pin;
+	u8 reg;
+	u8 bit;
+	u8 mask;
+};
+
 static struct regmap_config rockchip_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -518,10 +537,11 @@ static void rockchip_dt_free_map(struct pinctrl_dev *pctldev,
 static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	int iomux_num = (pin / 8);
 	struct regmap *regmap;
 	unsigned int val;
-	int reg, ret, mask;
+	int reg, ret, mask, mux_type;
 	u8 bit;
 
 	if (iomux_num > 3)
@@ -539,13 +559,14 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 				? info->regmap_pmu : info->regmap_base;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
+	mux_type = bank->iomux[iomux_num].type;
 	reg = bank->iomux[iomux_num].offset;
-	if (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) {
+	if (mux_type & IOMUX_WIDTH_4BIT) {
 		if ((pin % 8) >= 4)
 			reg += 0x4;
 		bit = (pin % 4) * 4;
 		mask = 0xf;
-	} else if (bank->iomux[iomux_num].type & IOMUX_WIDTH_3BIT) {
+	} else if (mux_type & IOMUX_WIDTH_3BIT) {
 		if ((pin % 8) >= 5)
 			reg += 0x4;
 		bit = (pin % 8 % 5) * 3;
@@ -555,6 +576,9 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 		mask = 0x3;
 	}
 
+	if (ctrl->iomux_recalc && (mux_type & IOMUX_RECALCED))
+		ctrl->iomux_recalc(bank->bank_num, pin, &reg, &bit, &mask);
+
 	ret = regmap_read(regmap, reg, &val);
 	if (ret)
 		return ret;
@@ -578,9 +602,10 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	int iomux_num = (pin / 8);
 	struct regmap *regmap;
-	int reg, ret, mask;
+	int reg, ret, mask, mux_type;
 	unsigned long flags;
 	u8 bit;
 	u32 data, rmask;
@@ -610,13 +635,14 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 				? info->regmap_pmu : info->regmap_base;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
+	mux_type = bank->iomux[iomux_num].type;
 	reg = bank->iomux[iomux_num].offset;
-	if (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) {
+	if (mux_type & IOMUX_WIDTH_4BIT) {
 		if ((pin % 8) >= 4)
 			reg += 0x4;
 		bit = (pin % 4) * 4;
 		mask = 0xf;
-	} else if (bank->iomux[iomux_num].type & IOMUX_WIDTH_3BIT) {
+	} else if (mux_type & IOMUX_WIDTH_3BIT) {
 		if ((pin % 8) >= 5)
 			reg += 0x4;
 		bit = (pin % 8 % 5) * 3;
@@ -626,6 +652,9 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 		mask = 0x3;
 	}
 
+	if (ctrl->iomux_recalc && (mux_type & IOMUX_RECALCED))
+		ctrl->iomux_recalc(bank->bank_num, pin, &reg, &bit, &mask);
+
 	spin_lock_irqsave(&bank->slock, flags);
 
 	data = (mask << (bit + 16));
-- 
1.9.1
