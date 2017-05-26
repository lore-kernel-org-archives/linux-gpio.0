From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v2 3/4] pinctrl: rockchip: Add iomux-route switching support for rk3328
Date: Fri, 26 May 2017 15:20:22 +0800
Message-ID: <1495783223-28857-4-git-send-email-david.wu@rock-chips.com>
References: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

There are 8 IP blocks pin routes need to be switched, that are
uart2dbg, gmac-m1-optimized, pdm, spi, i2s2, card, tsp, cif.

Signed-off-by: David Wu <david.wu@rock-chips.com>
---
Change in v2:
 - calculate the per-bank value dynamically (Heiko)

 drivers/pinctrl/pinctrl-rockchip.c | 83 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 605e24e..2563959 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -735,6 +735,87 @@ static void rk3328_recalc_mux(u8 bank_num, int pin, int *reg,
 	},
 };
 
+static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
+	{
+		/* uart2dbg_rxm0 */
+		.bank_num = 1,
+		.pin = 1,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(16 + 1),
+	}, {
+		/* uart2dbg_rxm1 */
+		.bank_num = 2,
+		.pin = 1,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(16 + 1) | BIT(0),
+	}, {
+		/* gmac-m1-optimized_rxd0 */
+		.bank_num = 1,
+		.pin = 11,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2) | BIT(16 + 10) | BIT(2) | BIT(10),
+	}, {
+		/* pdm_sdi0m0 */
+		.bank_num = 2,
+		.pin = 19,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* pdm_sdi0m1 */
+		.bank_num = 1,
+		.pin = 23,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 3) | BIT(3),
+	}, {
+		/* spi_rxdm2 */
+		.bank_num = 3,
+		.pin = 2,
+		.func = 4,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 4) | BIT(16 + 5) | BIT(5),
+	}, {
+		/* i2s2_sdim0 */
+		.bank_num = 1,
+		.pin = 24,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 6),
+	}, {
+		/* i2s2_sdim1 */
+		.bank_num = 3,
+		.pin = 2,
+		.func = 6,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 6) | BIT(6),
+	}, {
+		/* card_iom1 */
+		.bank_num = 2,
+		.pin = 22,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 7) | BIT(7),
+	}, {
+		/* tsp_d5m1 */
+		.bank_num = 2,
+		.pin = 16,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 8) | BIT(8),
+	}, {
+		/* cif_data5m1 */
+		.bank_num = 2,
+		.pin = 16,
+		.func = 4,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 9) | BIT(9),
+	},
+};
+
 static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 				   int mux, u32 *reg, u32 *value)
 {
@@ -3097,6 +3178,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.label			= "RK3328-GPIO",
 		.type			= RK3288,
 		.grf_mux_offset		= 0x0,
+		.iomux_routes		= rk3328_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3328_mux_route_data),
 		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
 		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
 		.iomux_recalc		= rk3328_recalc_mux,
-- 
1.9.1
