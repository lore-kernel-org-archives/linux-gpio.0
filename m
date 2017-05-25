From: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 3/4] pinctrl: rockchip: Add iomux-route switching support for
 rk3328
Date: Thu, 25 May 2017 21:12:31 +0800
Message-ID: <1495717952-9762-4-git-send-email-david.wu@rock-chips.com>
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

There are 8 IP blocks pin routes need to be switched, that are
uart2dbg, gmac-m1-optimized, pdm, spi, i2s2, card, tsp, cif.

Signed-off-by: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 140 ++++++++++++++++++++++++++++++++++---
 1 file changed, 130 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index be4c16e..6eab4581 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -214,6 +214,21 @@ struct rockchip_pin_bank {
 		},							\
 	}
 
+#define PIN_BANK_IOMUX_FLAGS_ROUTE(id, pins, label, route, iom0, iom1,	\
+				   iom2, iom3)				\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.route_mask	= route,				\
+		.iomux		= {					\
+			{ .type = iom0, .offset = -1 },			\
+			{ .type = iom1, .offset = -1 },			\
+			{ .type = iom2, .offset = -1 },			\
+			{ .type = iom3, .offset = -1 },			\
+		},							\
+	}
+
 #define PIN_BANK_DRV_FLAGS(id, pins, label, type0, type1, type2, type3) \
 	{								\
 		.bank_num	= id,					\
@@ -772,6 +787,110 @@ static bool rk3228_set_mux_route(u8 bank_num, int pin,
 	return true;
 }
 
+static const struct rockchip_mux_route_data  rk3328_mux_route_data[] = {
+	{
+		/* uart2dbg_rxm0 */
+		.bank = 1,
+		.pin = 1,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(16 + 1),
+	}, {
+		/* uart2dbg_rxm1 */
+		.bank = 2,
+		.pin = 1,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(16 + 1) | BIT(0),
+	}, {
+		/* gmac-m1-optimized_rxd0 */
+		.bank = 1,
+		.pin = 11,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2) | BIT(16 + 10) | BIT(2) | BIT(10),
+	}, {
+		/* pdm_sdi0m0 */
+		.bank = 2,
+		.pin = 19,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* pdm_sdi0m1 */
+		.bank = 1,
+		.pin = 23,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 3) | BIT(3),
+	}, {
+		/* spi_rxdm2 */
+		.bank = 3,
+		.pin = 2,
+		.func = 4,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 4) | BIT(16 + 5) | BIT(5),
+	}, {
+		/* i2s2_sdim0 */
+		.bank = 1,
+		.pin = 24,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 6),
+	}, {
+		/* i2s2_sdim1 */
+		.bank = 3,
+		.pin = 2,
+		.func = 6,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 6) | BIT(6),
+	}, {
+		/* card_iom1 */
+		.bank = 2,
+		.pin = 22,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 7) | BIT(7),
+	}, {
+		/* tsp_d5m1 */
+		.bank = 2,
+		.pin = 16,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 8) | BIT(8),
+	}, {
+		/* cif_data5m1 */
+		.bank = 2,
+		.pin = 16,
+		.func = 4,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 9) | BIT(9),
+	},
+};
+
+static bool rk3328_set_mux_route(u8 bank_num, int pin, int mux,
+				 u32 *reg, u32 *value)
+{
+	const struct rockchip_mux_route_data *data = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rk3328_mux_route_data); i++)
+		if ((rk3328_mux_route_data[i].bank == bank_num) &&
+		    (rk3328_mux_route_data[i].pin == pin) &&
+		    (rk3328_mux_route_data[i].func == mux)) {
+			data = &rk3328_mux_route_data[i];
+			break;
+		}
+
+	if (!data)
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
@@ -3081,16 +3200,16 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 
 static struct rockchip_pin_bank rk3328_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
-	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
-	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
-			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
-			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
-			     0),
-	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
-			     IOMUX_WIDTH_3BIT,
-			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
-			     0,
-			     0),
+	PIN_BANK_IOMUX_FLAGS_ROUTE(1, 32, "gpio1", 0x01800802, 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS_ROUTE(2, 32, "gpio2", 0x00490002, 0,
+				   IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
+				   IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
+				   0),
+	PIN_BANK_IOMUX_FLAGS_ROUTE(3, 32, "gpio3", 0x00000004,
+				   IOMUX_WIDTH_3BIT,
+				   IOMUX_WIDTH_3BIT | IOMUX_RECALCED,
+				   0,
+				   0),
 };
 
 static struct rockchip_pin_ctrl rk3328_pin_ctrl = {
@@ -3103,6 +3222,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
 		.iomux_recalc		= rk3328_recalc_mux,
 		.schmitt_calc_reg	= rk3328_calc_schmitt_reg_and_bit,
+		.iomux_route		= rk3328_set_mux_route,
 };
 
 static struct rockchip_pin_bank rk3368_pin_banks[] = {
-- 
1.9.1
