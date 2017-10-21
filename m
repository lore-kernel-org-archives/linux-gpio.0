From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] pinctrl: rockchip: Add iomux-route switching support for rk3288
Date: Sat, 21 Oct 2017 10:53:10 +0200
Message-ID: <20171021085310.16246-1-heiko@sntech.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:36752 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753132AbdJUIxZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 21 Oct 2017 04:53:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com, Heiko Stuebner <heiko@sntech.de>

The rk3288 also has one function that can be routed to one of two pins,
the hdmi cec functionality can use either gpio7c0 or gpio7c7.
So add the route switching support for it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index b5cb7858ffdc..8dd49e2e144b 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -884,6 +884,24 @@ static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
 	},
 };
 
+static struct rockchip_mux_route_data rk3288_mux_route_data[] = {
+	{
+		/* edphdmi_cecinoutt1 */
+		.bank_num = 7,
+		.pin = 16,
+		.func = 2,
+		.route_offset = 0x264,
+		.route_val = BIT(16 + 12) | BIT(12),
+	}, {
+		/* edphdmi_cecinout */
+		.bank_num = 7,
+		.pin = 23,
+		.func = 4,
+		.route_offset = 0x264,
+		.route_val = BIT(16 + 12),
+	},
+};
+
 static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
 	{
 		/* uart2dbg_rxm0 */
@@ -3391,6 +3409,8 @@ static struct rockchip_pin_ctrl rk3288_pin_ctrl = {
 		.type			= RK3288,
 		.grf_mux_offset		= 0x0,
 		.pmu_mux_offset		= 0x84,
+		.iomux_routes		= rk3288_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3288_mux_route_data),
 		.pull_calc_reg		= rk3288_calc_pull_reg_and_bit,
 		.drv_calc_reg		= rk3288_calc_drv_reg_and_bit,
 };
-- 
2.14.2

