From: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/4] pinctrl: rockchip: Add iomux-route switching support
 for rk3228
Date: Fri, 26 May 2017 15:20:21 +0800
Message-ID: <1495783223-28857-3-git-send-email-david.wu@rock-chips.com>
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

There are 9 IP blocks pin routes need to be switched, that are
pwm-0, pwm-1, pwm-2, pwm-3, sdio, spi, emmc, uart2, uart1.

Signed-off-by: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Change in v2:
 - calculate the per-bank value dynamically (Heiko)
 
 drivers/pinctrl/pinctrl-rockchip.c | 132 +++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index a5d7177..605e24e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -605,6 +605,136 @@ static void rk3328_recalc_mux(u8 bank_num, int pin, int *reg,
 	*bit = data->bit;
 }
 
+static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
+	{
+		/* pwm0-0 */
+		.bank_num = 0,
+		.pin = 26,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16),
+	}, {
+		/* pwm0-1 */
+		.bank_num = 3,
+		.pin = 21,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(0),
+	}, {
+		/* pwm1-0 */
+		.bank_num = 0,
+		.pin = 27,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 1),
+	}, {
+		/* pwm1-1 */
+		.bank_num = 0,
+		.pin = 30,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 1) | BIT(1),
+	}, {
+		/* pwm2-0 */
+		.bank_num = 0,
+		.pin = 28,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2),
+	}, {
+		/* pwm2-1 */
+		.bank_num = 1,
+		.pin = 12,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2) | BIT(2),
+	}, {
+		/* pwm3-0 */
+		.bank_num = 3,
+		.pin = 26,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* pwm3-1 */
+		.bank_num = 1,
+		.pin = 11,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3) | BIT(3),
+	}, {
+		/* sdio-0_d0 */
+		.bank_num = 1,
+		.pin = 1,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 4),
+	}, {
+		/* sdio-1_d0 */
+		.bank_num = 3,
+		.pin = 2,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 4) | BIT(4),
+	}, {
+		/* spi-0_rx */
+		.bank_num = 0,
+		.pin = 13,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 5),
+	}, {
+		/* spi-1_rx */
+		.bank_num = 2,
+		.pin = 0,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 5) | BIT(5),
+	}, {
+		/* emmc-0_cmd */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 7),
+	}, {
+		/* emmc-1_cmd */
+		.bank_num = 2,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 7) | BIT(7),
+	}, {
+		/* uart2-0_rx */
+		.bank_num = 1,
+		.pin = 19,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 8),
+	}, {
+		/* uart2-1_rx */
+		.bank_num = 1,
+		.pin = 10,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 8) | BIT(8),
+	}, {
+		/* uart1-0_rx */
+		.bank_num = 1,
+		.pin = 10,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 11),
+	}, {
+		/* uart1-1_rx */
+		.bank_num = 3,
+		.pin = 13,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 11) | BIT(11),
+	},
+};
+
 static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 				   int mux, u32 *reg, u32 *value)
 {
@@ -2898,6 +3028,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.label			= "RK3228-GPIO",
 		.type			= RK3288,
 		.grf_mux_offset		= 0x0,
+		.iomux_routes		= rk3228_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3228_mux_route_data),
 		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
 		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
 };
-- 
1.9.1
