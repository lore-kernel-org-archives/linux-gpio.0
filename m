From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v1 2/2] pinctrl: rockchip: Add input schmitt support for rk3328
Date: Tue, 14 Feb 2017 18:35:41 +0800
Message-ID: <1487068541-14120-3-git-send-email-david.wu@rock-chips.com>
References: <1487068541-14120-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487068541-14120-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "david.wu" <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

From: "david.wu" <david.wu@rock-chips.com>

Signed-off-by: david.wu <david.wu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 6a071b1..6206e1e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1358,6 +1358,26 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	return ret;
 }
 
+#define RK3328_SCHMITT_BITS_PER_PIN		1
+#define RK3328_SCHMITT_PINS_PER_REG		16
+#define RK3328_SCHMITT_BANK_STRIDE		8
+#define RK3328_SCHMITT_GRF_OFFSET		0x380
+
+static void rk3328_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					    int pin_num,
+					    struct regmap **regmap,
+					    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3328_SCHMITT_GRF_OFFSET;
+
+	*reg += bank->bank_num * RK3328_SCHMITT_BANK_STRIDE;
+	*reg += ((pin_num / RK3328_SCHMITT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3328_SCHMITT_PINS_PER_REG;
+}
+
 static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
@@ -2857,6 +2877,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
 		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
 		.iomux_recalc		= rk3328_recalc_mux,
+		.schmitt_calc_reg	= rk3328_calc_schmitt_reg_and_bit,
 };
 
 static struct rockchip_pin_bank rk3368_pin_banks[] = {
-- 
1.9.1
