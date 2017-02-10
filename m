From: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 3/3] pinctrl: rockchip: Add rk3328 pinctrl support
Date: Fri, 10 Feb 2017 18:23:49 +0800
Message-ID: <1486722229-5451-4-git-send-email-david.wu@rock-chips.com>
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

Note, the iomux of following pins are special, need to
be recalculated specially.
 - gpio2_b4
 - gpio2_b7
 - gpio2_c7

Signed-off-by: david.wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
change in v2:
 - only 3 pins need to be recalculated 

 .../bindings/pinctrl/rockchip,pinctrl.txt          |  4 +-
 drivers/pinctrl/pinctrl-rockchip.c                 | 70 ++++++++++++++++++++++
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index 4722bc6..403b5a2 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -22,8 +22,8 @@ Required properties for iomux controller:
   - compatible: one of "rockchip,rk1108-pinctrl", "rockchip,rk2928-pinctrl"
 		       "rockchip,rk3066a-pinctrl", "rockchip,rk3066b-pinctrl"
 		       "rockchip,rk3188-pinctrl", "rockchip,rk3228-pinctrl"
-		       "rockchip,rk3288-pinctrl", "rockchip,rk3368-pinctrl"
-		       "rockchip,rk3399-pinctrl"
+		       "rockchip,rk3288-pinctrl", "rockchip,rk3328-pinctrl"
+		       "rockchip,rk3368-pinctrl", "rockchip,rk3399-pinctrl"
   - rockchip,grf: phandle referencing a syscon providing the
 	 "general register files"
 
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 191a2f9..a20ce9f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -534,6 +534,49 @@ static void rockchip_dt_free_map(struct pinctrl_dev *pctldev,
  * Hardware access
  */
 
+static const struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
+	{
+		.num = 2,
+		.pin = 12,
+		.reg = 0x24,
+		.bit = 8,
+		.mask = 0x3
+	}, {
+		.num = 2,
+		.pin = 15,
+		.reg = 0x28,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 23,
+		.reg = 0x30,
+		.bit = 14,
+		.mask = 0x3
+	},
+};
+
+static void rk3328_recalc_mux(u8 bank_num, int pin, int *reg,
+			      u8 *bit, int *mask)
+{
+	const struct rockchip_mux_recalced_data *data = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rk3328_mux_recalced_data); i++)
+		if (rk3328_mux_recalced_data[i].num == bank_num &&
+		    rk3328_mux_recalced_data[i].pin == pin) {
+			data = &rk3328_mux_recalced_data[i];
+			break;
+		}
+
+	if (!data)
+		return;
+
+	*reg = data->reg;
+	*mask = data->mask;
+	*bit = data->bit;
+}
+
 static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
@@ -2722,6 +2765,31 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.drv_calc_reg		= rk3288_calc_drv_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3328_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
+			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
+			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
+			     0),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
+			     IOMUX_WIDTH_3BIT,
+			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
+			     0,
+			     0),
+};
+
+static struct rockchip_pin_ctrl rk3328_pin_ctrl = {
+		.pin_banks		= rk3328_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3328_pin_banks),
+		.label			= "RK3328-GPIO",
+		.type			= RK3288,
+		.grf_mux_offset		= 0x0,
+		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
+		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
+		.iomux_recalc		= rk3328_recalc_mux,
+};
+
 static struct rockchip_pin_bank rk3368_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -2827,6 +2895,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.data = (void *)&rk3228_pin_ctrl },
 	{ .compatible = "rockchip,rk3288-pinctrl",
 		.data = (void *)&rk3288_pin_ctrl },
+	{ .compatible = "rockchip,rk3328-pinctrl",
+		.data = (void *)&rk3328_pin_ctrl },
 	{ .compatible = "rockchip,rk3368-pinctrl",
 		.data = (void *)&rk3368_pin_ctrl },
 	{ .compatible = "rockchip,rk3399-pinctrl",
-- 
1.9.1
