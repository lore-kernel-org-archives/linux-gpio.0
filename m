From: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 1/4] pinctrl: rockchip: Add iomux-route switching support
Date: Fri, 26 May 2017 15:20:20 +0800
Message-ID: <1495783223-28857-2-git-send-email-david.wu@rock-chips.com>
References: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1495783223-28857-1-git-send-email-david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On the some rockchip SOCS, some things like rk3399 specific uart2 can use
multiple pins. Somewhere between the pin io-cells and the uart it seems
to have some sort of switch to decide to which pin to actually route the
data.

+-------+    +--------+  /- GPIO4_B0 (pinmux 2)

| uart2 | -- | switch | --- GPIO4_C0 (pinmux 2)

+-------+    +--------+  \- GPIO4_C3 (pinmux 2)
(switch selects one of the 3 pins base on the GRF_SOC_CON7[BIT0, BIT1])

The routing switch is determined by one pin of a specific group to be set
to its special pinmux function. If the pinmux setting is wrong for that
pin the ip block won't work correctly anyway.

Signed-off-by: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 65 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index f141aa0..a5d7177 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -146,6 +146,7 @@ struct rockchip_drv {
  * @irq_lock: bus lock for irq chip
  * @new_irqs: newly configured irqs which must be muxed as GPIOs in
  *	irq_bus_sync_unlock()
+ * @route_mask: bits describing the routing pins of per bank
  */
 struct rockchip_pin_bank {
 	void __iomem			*reg_base;
@@ -170,6 +171,7 @@ struct rockchip_pin_bank {
 	u32				toggle_edge_mode;
 	struct mutex			irq_lock;
 	u32				new_irqs;
+	u32				route_mask;
 };
 
 #define PIN_BANK(id, pins, label)			\
@@ -293,6 +295,22 @@ struct rockchip_pin_bank {
 	}
 
 /**
+ * struct rockchip_mux_recalced_data: represent a pin iomux data.
+ * @bank_num: bank number.
+ * @pin: index at register or used to calc index.
+ * @func: the min pin.
+ * @route_offset: the max pin.
+ * @route_val: the register offset.
+ */
+struct rockchip_mux_route_data {
+	u8 bank_num;
+	u8 pin;
+	u8 func;
+	u32 route_offset;
+	u32 route_val;
+};
+
+/**
  */
 struct rockchip_pin_ctrl {
 	struct rockchip_pin_bank	*pin_banks;
@@ -304,6 +322,8 @@ struct rockchip_pin_ctrl {
 	int				pmu_mux_offset;
 	int				grf_drv_offset;
 	int				pmu_drv_offset;
+	struct rockchip_mux_route_data *iomux_routes;
+	u32				niomux_routes;
 
 	void	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
 				    int pin_num, struct regmap **regmap,
@@ -585,6 +605,30 @@ static void rk3328_recalc_mux(u8 bank_num, int pin, int *reg,
 	*bit = data->bit;
 }
 
+static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
+				   int mux, u32 *reg, u32 *value)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct rockchip_mux_route_data *data;
+	int i;
+
+	for (i = 0; i < ctrl->niomux_routes; i++) {
+		data = &ctrl->iomux_routes[i];
+		if ((data->bank_num == bank->bank_num) &&
+		    (data->pin == pin) && (data->func == mux))
+			break;
+	}
+
+	if (i >= ctrl->niomux_routes)
+		return false;
+
+	*reg = data->route_offset;
+	*value = data->route_val;
+
+	return true;
+}
+
 static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
@@ -683,7 +727,7 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	struct regmap *regmap;
 	int reg, ret, mask, mux_type;
 	u8 bit;
-	u32 data, rmask;
+	u32 data, rmask, route_reg, route_val;
 
 	ret = rockchip_verify_mux(bank, pin, mux);
 	if (ret < 0)
@@ -719,6 +763,15 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (ctrl->iomux_recalc && (mux_type & IOMUX_RECALCED))
 		ctrl->iomux_recalc(bank->bank_num, pin, &reg, &bit, &mask);
 
+	if (bank->route_mask & BIT(pin)) {
+		if (rockchip_get_mux_route(bank, pin, mux, &route_reg,
+					   &route_val)) {
+			ret = regmap_write(regmap, route_reg, route_val);
+			if (ret)
+				return ret;
+		}
+	}
+
 	data = (mask << (bit + 16));
 	rmask = data | (data >> 16);
 	data |= (mux & mask) << bit;
@@ -2585,6 +2638,16 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 
 			bank_pins += 8;
 		}
+
+		/* calculate the per-bank route_mask */
+		for (j = 0; j < ctrl->niomux_routes; j++) {
+			int pin = 0;
+
+			if (ctrl->iomux_routes[j].bank_num == bank->bank_num) {
+				pin = ctrl->iomux_routes[j].pin;
+				bank->route_mask |= BIT(pin);
+			}
+		}
 	}
 
 	return ctrl;
-- 
1.9.1
