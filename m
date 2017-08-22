From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH] pinctrl: rockchip: Add rv1108 recalced iomux support
Date: Tue, 22 Aug 2017 16:54:55 +0800
Message-ID: <1503392095-27842-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:49432 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932205AbdHVIuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2017 04:50:05 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>

The pins from GPIO1A0 to GPIO1B1 are special, need to recalculate
iomux. And the register offset is larger than the u8 range, so changed
to u32.

Signed-off-by: David Wu <david.wu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 68 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c6f472e..9f411b5 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -301,7 +301,7 @@ struct rockchip_pin_bank {
 struct rockchip_mux_recalced_data {
 	u8 num;
 	u8 pin;
-	u8 reg;
+	u32 reg;
 	u8 bit;
 	u8 mask;
 };
@@ -614,6 +614,70 @@ static void rockchip_dt_free_map(struct pinctrl_dev *pctldev,
 	},
 };
 
+static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
+	{
+		.num = 1,
+		.pin = 0,
+		.reg = 0x418,
+		.bit = 0,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 1,
+		.reg = 0x418,
+		.bit = 2,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 2,
+		.reg = 0x418,
+		.bit = 4,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 3,
+		.reg = 0x418,
+		.bit = 6,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 4,
+		.reg = 0x418,
+		.bit = 8,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 5,
+		.reg = 0x418,
+		.bit = 10,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 6,
+		.reg = 0x418,
+		.bit = 12,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 7,
+		.reg = 0x418,
+		.bit = 14,
+		.mask = 0x3
+	},  {
+		.num = 1,
+		.pin = 8,
+		.reg = 0x41c,
+		.bit = 0,
+		.mask = 0x3
+	},  {
+		.num = 1,
+		.pin = 9,
+		.reg = 0x41c,
+		.bit = 2,
+		.mask = 0x3
+	},
+};
+
 static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 				      int *reg, u8 *bit, int *mask)
 {
@@ -3162,6 +3226,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	.type			= RV1108,
 	.grf_mux_offset		= 0x10,
 	.pmu_mux_offset		= 0x0,
+	.iomux_recalced		= rv1108_mux_recalced_data,
+	.niomux_recalced	= ARRAY_SIZE(rv1108_mux_recalced_data),
 	.pull_calc_reg		= rv1108_calc_pull_reg_and_bit,
 	.drv_calc_reg		= rv1108_calc_drv_reg_and_bit,
 	.schmitt_calc_reg	= rv1108_calc_schmitt_reg_and_bit,
-- 
1.9.1


