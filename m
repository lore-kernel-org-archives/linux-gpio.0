From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v2 4/4] pinctrl: rockchip: Add iomux-route switching support for rk3399
Date: Fri, 26 May 2017 15:20:23 +0800
Message-ID: <1495783223-28857-5-git-send-email-david.wu@rock-chips.com>
References: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:50590 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967296AbdEZHR0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2017 03:17:26 -0400
In-Reply-To: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>

There are 2 IP blocks pin routes need to be switched, that are
uart2dbg, pcie_clkreq.

Signed-off-by: David Wu <david.wu@rock-chips.com>
---
Change in v2:
 - calculate the per-bank value dynamically (Heiko)

 drivers/pinctrl/pinctrl-rockchip.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 2563959..6690883 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -816,6 +816,45 @@ static void rk3328_recalc_mux(u8 bank_num, int pin, int *reg,
 	},
 };
 
+static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
+	{
+		/* uart2dbga_rx */
+		.bank_num = 4,
+		.pin = 8,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11),
+	}, {
+		/* uart2dbgb_rx */
+		.bank_num = 4,
+		.pin = 16,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
+	}, {
+		/* uart2dbgc_rx */
+		.bank_num = 4,
+		.pin = 19,
+		.func = 1,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
+	}, {
+		/* pcie_clkreqn */
+		.bank_num = 2,
+		.pin = 26,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 14),
+	}, {
+		/* pcie_clkreqnb */
+		.bank_num = 4,
+		.pin = 24,
+		.func = 1,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 14) | BIT(14),
+	},
+};
+
 static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 				   int mux, u32 *reg, u32 *value)
 {
@@ -3270,6 +3309,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.pmu_mux_offset		= 0x0,
 		.grf_drv_offset		= 0xe100,
 		.pmu_drv_offset		= 0x80,
+		.iomux_routes		= rk3399_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3399_mux_route_data),
 		.pull_calc_reg		= rk3399_calc_pull_reg_and_bit,
 		.drv_calc_reg		= rk3399_calc_drv_reg_and_bit,
 };
-- 
1.9.1


