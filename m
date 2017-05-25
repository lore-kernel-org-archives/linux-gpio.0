From: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/4] pinctrl: rockchip: Add iomux-route switching support
Date: Thu, 25 May 2017 21:12:29 +0800
Message-ID: <1495717952-9762-2-git-send-email-david.wu@rock-chips.com>
References: <1495717952-9762-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1495717952-9762-1-git-send-email-david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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

On the some rockchip soc, some things like one specific uart can use
multiple pins, but control of that seems to be split. Somewhere between
the pin io-cells and the uart it seems to have some sort of switch to
decide to which pin to actually route the data.

+-------+    +--------+  /- GPIO4_B0 (pinmux 2)

| uart2 | -- | switch | --- GPIO4_C0 (pinmux 2)

+-------+    +--------+  \- GPIO4_C3 (pinmux 2)
(switch selects one of the 3 pins base on the GRF_SOC_CON7[BIT0, BIT1])

The routing switch is determined by one pin of a specific group to be set
to its special pinmux function. If the pinmux setting is wrong for that
pin the ip block won't work correctly anyway.

Signed-off-by: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index f141aa0..f5dd1c3 100644
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
@@ -316,6 +318,8 @@ struct rockchip_pin_ctrl {
 	int	(*schmitt_calc_reg)(struct rockchip_pin_bank *bank,
 				    int pin_num, struct regmap **regmap,
 				    int *reg, u8 *bit);
+	bool	(*iomux_route)(u8 bank_num, int pin, int mux,
+			       u32 *reg, u32 *value);
 };
 
 struct rockchip_pin_config {
@@ -383,6 +387,22 @@ struct rockchip_mux_recalced_data {
 	u8 mask;
 };
 
+/**
+ * struct rockchip_mux_recalced_data: represent a pin iomux data.
+ * @bank: bank number.
+ * @pin: index at register or used to calc index.
+ * @func: the min pin.
+ * @route_offset: the max pin.
+ * @route_val: the register offset.
+ */
+struct rockchip_mux_route_data {
+	u8 bank;
+	u8 pin;
+	u8 func;
+	u32 route_offset;
+	u32 route_val;
+};
+
 static struct regmap_config rockchip_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -683,7 +703,7 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	struct regmap *regmap;
 	int reg, ret, mask, mux_type;
 	u8 bit;
-	u32 data, rmask;
+	u32 data, rmask, route_reg, route_val;
 
 	ret = rockchip_verify_mux(bank, pin, mux);
 	if (ret < 0)
@@ -719,6 +739,15 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (ctrl->iomux_recalc && (mux_type & IOMUX_RECALCED))
 		ctrl->iomux_recalc(bank->bank_num, pin, &reg, &bit, &mask);
 
+	if (ctrl->iomux_route && (bank->route_mask & BIT(pin))) {
+		if (ctrl->iomux_route(bank->bank_num, pin, mux,
+				      &route_reg, &route_val)) {
+			ret = regmap_write(regmap, route_reg, route_val);
+			if (ret)
+				return ret;
+		}
+	}
+
 	data = (mask << (bit + 16));
 	rmask = data | (data >> 16);
 	data |= (mux & mask) << bit;
-- 
1.9.1
