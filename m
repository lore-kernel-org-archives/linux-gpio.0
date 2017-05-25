From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH 4/4] pinctrl: rockchip: Add iomux-route switching support for rk3399
Date: Thu, 25 May 2017 21:12:32 +0800
Message-ID: <1495717952-9762-5-git-send-email-david.wu@rock-chips.com>
References: <1495717952-9762-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:52122 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934230AbdEYNJe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 09:09:34 -0400
In-Reply-To: <1495717952-9762-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>

There are 2 IP blocks pin routes need to be switched, that are
uart2dbg, pcie_clkreq.

Signed-off-by: David Wu <david.wu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 140 +++++++++++++++++++++++++++++++++----
 1 file changed, 126 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 6eab4581..44c5aff3 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -248,6 +248,27 @@ struct rockchip_pin_bank {
 		},							\
 	}
 
+#define PIN_BANK_DRV_FLAGS_ROUTE(id, pins, label, route, type0, type1,  \
+				 type2, type3)				\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.route_mask	= route,				\
+		.iomux		= {					\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+		},							\
+		.drv		= {					\
+			{ .drv_type = type0, .offset = -1 },		\
+			{ .drv_type = type1, .offset = -1 },		\
+			{ .drv_type = type2, .offset = -1 },		\
+			{ .drv_type = type3, .offset = -1 },		\
+		},							\
+	}
+
 #define PIN_BANK_DRV_FLAGS_PULL_FLAGS(id, pins, label, drv0, drv1,	\
 				      drv2, drv3, pull0, pull1,		\
 				      pull2, pull3)			\
@@ -273,6 +294,32 @@ struct rockchip_pin_bank {
 		.pull_type[3] = pull3,					\
 	}
 
+#define PIN_BANK_DRV_FLAGS_PULL_FLAGS_ROUTE(id, pins, label, route,	\
+					    drv0, drv1, drv2, drv3,	\
+					    pull0, pull1, pull2, pull3) \
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.route_mask	= route,				\
+		.iomux		= {					\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+		},							\
+		.drv		= {					\
+			{ .drv_type = drv0, .offset = -1 },		\
+			{ .drv_type = drv1, .offset = -1 },		\
+			{ .drv_type = drv2, .offset = -1 },		\
+			{ .drv_type = drv3, .offset = -1 },		\
+		},							\
+		.pull_type[0] = pull0,					\
+		.pull_type[1] = pull1,					\
+		.pull_type[2] = pull2,					\
+		.pull_type[3] = pull3,					\
+	}
+
 #define PIN_BANK_IOMUX_DRV_FLAGS_OFFSET(id, pins, label, iom0, iom1,	\
 					iom2, iom3, drv0, drv1, drv2,	\
 					drv3, offset0, offset1,		\
@@ -891,6 +938,68 @@ static bool rk3328_set_mux_route(u8 bank_num, int pin, int mux,
 	return true;
 }
 
+static const struct rockchip_mux_route_data  rk3399_mux_route_data[] = {
+	{
+		/* uart2dbga_rx */
+		.bank = 4,
+		.pin = 8,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11),
+	}, {
+		/* uart2dbgb_rx */
+		.bank = 4,
+		.pin = 16,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
+	}, {
+		/* uart2dbgc_rx */
+		.bank = 4,
+		.pin = 19,
+		.func = 1,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
+	}, {
+		/* pcie_clkreqn */
+		.bank = 2,
+		.pin = 26,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 14),
+	}, {
+		/* pcie_clkreqnb */
+		.bank = 4,
+		.pin = 24,
+		.func = 1,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 14) | BIT(14),
+	},
+};
+
+static bool rk3399_set_mux_route(u8 bank_num, int pin, int mux,
+				 u32 *reg, u32 *value)
+{
+	const struct rockchip_mux_route_data *data = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rk3399_mux_route_data); i++)
+		if ((rk3399_mux_route_data[i].bank == bank_num) &&
+		    (rk3399_mux_route_data[i].pin == pin) &&
+		    (rk3399_mux_route_data[i].func == mux)) {
+			data = &rk3399_mux_route_data[i];
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
@@ -3279,25 +3388,27 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 					0x30,
 					0x38
 					),
-	PIN_BANK_DRV_FLAGS_PULL_FLAGS(2, 32, "gpio2", DRV_TYPE_IO_1V8_OR_3V0,
-				      DRV_TYPE_IO_1V8_OR_3V0,
-				      DRV_TYPE_IO_1V8_ONLY,
-				      DRV_TYPE_IO_1V8_ONLY,
-				      PULL_TYPE_IO_DEFAULT,
-				      PULL_TYPE_IO_DEFAULT,
-				      PULL_TYPE_IO_1V8_ONLY,
-				      PULL_TYPE_IO_1V8_ONLY
-				      ),
+	PIN_BANK_DRV_FLAGS_PULL_FLAGS_ROUTE(2, 32, "gpio2", 0x04000000,
+					    DRV_TYPE_IO_1V8_OR_3V0,
+					    DRV_TYPE_IO_1V8_OR_3V0,
+					    DRV_TYPE_IO_1V8_ONLY,
+					    DRV_TYPE_IO_1V8_ONLY,
+					    PULL_TYPE_IO_DEFAULT,
+					    PULL_TYPE_IO_DEFAULT,
+					    PULL_TYPE_IO_1V8_ONLY,
+					    PULL_TYPE_IO_1V8_ONLY
+					    ),
 	PIN_BANK_DRV_FLAGS(3, 32, "gpio3", DRV_TYPE_IO_3V3_ONLY,
 			   DRV_TYPE_IO_3V3_ONLY,
 			   DRV_TYPE_IO_3V3_ONLY,
 			   DRV_TYPE_IO_1V8_OR_3V0
 			   ),
-	PIN_BANK_DRV_FLAGS(4, 32, "gpio4", DRV_TYPE_IO_1V8_OR_3V0,
-			   DRV_TYPE_IO_1V8_3V0_AUTO,
-			   DRV_TYPE_IO_1V8_OR_3V0,
-			   DRV_TYPE_IO_1V8_OR_3V0
-			   ),
+	PIN_BANK_DRV_FLAGS_ROUTE(4, 32, "gpio4", 0x01090100,
+				 DRV_TYPE_IO_1V8_OR_3V0,
+				 DRV_TYPE_IO_1V8_3V0_AUTO,
+				 DRV_TYPE_IO_1V8_OR_3V0,
+				 DRV_TYPE_IO_1V8_OR_3V0
+				 ),
 };
 
 static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
@@ -3311,6 +3422,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.pmu_drv_offset		= 0x80,
 		.pull_calc_reg		= rk3399_calc_pull_reg_and_bit,
 		.drv_calc_reg		= rk3399_calc_drv_reg_and_bit,
+		.iomux_route		= rk3399_set_mux_route,
 };
 
 static const struct of_device_id rockchip_pinctrl_dt_match[] = {
-- 
1.9.1


