From: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 2/4] pinctrl: rockchip: Add iomux-route switching support for
 rk3228
Date: Thu, 25 May 2017 21:12:30 +0800
Message-ID: <1495717952-9762-3-git-send-email-david.wu@rock-chips.com>
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

There are 9 IP blocks pin routes need to be switched, that are
pwm-0, pwm-1, pwm-2, pwm-3, sdio, spi, emmc, uart2, uart1.

Signed-off-by: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 176 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index f5dd1c3..be4c16e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -187,6 +187,20 @@ struct rockchip_pin_bank {
 		},					\
 	}
 
+#define PIN_BANK_ROUTE(id, pins, label, route)		\
+	{						\
+		.bank_num	= id,			\
+		.nr_pins	= pins,			\
+		.name		= label,		\
+		.route_mask	= route,		\
+		.iomux		= {			\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+		},					\
+	}
+
 #define PIN_BANK_IOMUX_FLAGS(id, pins, label, iom0, iom1, iom2, iom3)	\
 	{								\
 		.bank_num	= id,					\
@@ -605,6 +619,159 @@ static void rk3328_recalc_mux(u8 bank_num, int pin, int *reg,
 	*bit = data->bit;
 }
 
+static const struct rockchip_mux_route_data  rk3228_mux_route_data[] = {
+	{
+		/* pwm0-0 */
+		.bank = 0,
+		.pin = 26,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16),
+	}, {
+		/* pwm0-1 */
+		.bank = 3,
+		.pin = 21,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(0),
+	}, {
+		/* pwm1-0 */
+		.bank = 0,
+		.pin = 27,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 1),
+	}, {
+		/* pwm1-1 */
+		.bank = 0,
+		.pin = 30,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 1) | BIT(1),
+	}, {
+		/* pwm2-0 */
+		.bank = 0,
+		.pin = 28,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2),
+	}, {
+		/* pwm2-1 */
+		.bank = 1,
+		.pin = 12,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2) | BIT(2),
+	}, {
+		/* pwm3-0 */
+		.bank = 3,
+		.pin = 26,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* pwm3-1 */
+		.bank = 1,
+		.pin = 11,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3) | BIT(3),
+	}, {
+		/* sdio-0_d0 */
+		.bank = 1,
+		.pin = 1,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 4),
+	}, {
+		/* sdio-1_d0 */
+		.bank = 3,
+		.pin = 2,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 4) | BIT(4),
+	}, {
+		/* spi-0_rx */
+		.bank = 0,
+		.pin = 13,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 5),
+	}, {
+		/* spi-1_rx */
+		.bank = 2,
+		.pin = 0,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 5) | BIT(5),
+	}, {
+		/* emmc-0_cmd */
+		.bank = 1,
+		.pin = 22,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 7),
+	}, {
+		/* emmc-1_cmd */
+		.bank = 2,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 7) | BIT(7),
+	}, {
+		/* uart2-0_rx */
+		.bank = 1,
+		.pin = 19,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 8),
+	}, {
+		/* uart2-1_rx */
+		.bank = 1,
+		.pin = 10,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 8) | BIT(8),
+	}, {
+		/* uart1-0_rx */
+		.bank = 1,
+		.pin = 10,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 11),
+	}, {
+		/* uart1-1_rx */
+		.bank = 3,
+		.pin = 13,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 11) | BIT(11),
+	},
+};
+
+static bool rk3228_set_mux_route(u8 bank_num, int pin,
+				 int mux, u32 *reg, u32 *value)
+{
+	const struct rockchip_mux_route_data *data = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rk3228_mux_route_data); i++)
+		if ((rk3228_mux_route_data[i].bank == bank_num) &&
+		    (rk3228_mux_route_data[i].pin == pin) &&
+		    (rk3228_mux_route_data[i].func == mux)) {
+			data = &rk3228_mux_route_data[i];
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
@@ -2852,10 +3019,10 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 };
 
 static struct rockchip_pin_bank rk3228_pin_banks[] = {
-	PIN_BANK(0, 32, "gpio0"),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-	PIN_BANK(3, 32, "gpio3"),
+	PIN_BANK_ROUTE(0, 32, "gpio0", 0x5c002000),
+	PIN_BANK_ROUTE(1, 32, "gpio1", 0x00483c02),
+	PIN_BANK_ROUTE(2, 32, "gpio2", 0x00000011),
+	PIN_BANK_ROUTE(3, 32, "gpio3", 0x04202004),
 };
 
 static struct rockchip_pin_ctrl rk3228_pin_ctrl = {
@@ -2866,6 +3033,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.grf_mux_offset		= 0x0,
 		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
 		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
+		.iomux_route		= rk3228_set_mux_route,
 };
 
 static struct rockchip_pin_bank rk3288_pin_banks[] = {
-- 
1.9.1
