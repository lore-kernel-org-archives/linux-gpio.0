From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH 1/2] pinctrl: rockchip: Fix the rk3399 gpio0 and gpio1 banks' drv_offset at pmu grf
Date: Sat, 30 Sep 2017 20:13:20 +0800
Message-ID: <1506773601-27315-2-git-send-email-david.wu@rock-chips.com>
References: <1506773601-27315-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:46907 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751677AbdI3MNG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Sep 2017 08:13:06 -0400
In-Reply-To: <1506773601-27315-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>

The offset of gpio0 and gpio1 bank drive strength is 0x8, not 0x4.
But the mux is 0x4, we couldn't use the IOMUX_WIDTH_4BIT flag, so
we give them actual offset.

Signed-off-by: David Wu <david.wu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index b5cb785..c7c9beb 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3456,8 +3456,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 							 DRV_TYPE_IO_1V8_ONLY,
 							 DRV_TYPE_IO_DEFAULT,
 							 DRV_TYPE_IO_DEFAULT,
-							 0x0,
-							 0x8,
+							 0x80,
+							 0x88,
 							 -1,
 							 -1,
 							 PULL_TYPE_IO_1V8_ONLY,
@@ -3473,10 +3473,10 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 					DRV_TYPE_IO_1V8_OR_3V0,
 					DRV_TYPE_IO_1V8_OR_3V0,
 					DRV_TYPE_IO_1V8_OR_3V0,
-					0x20,
-					0x28,
-					0x30,
-					0x38
+					0xa0,
+					0xa8,
+					0xb0,
+					0xb8
 					),
 	PIN_BANK_DRV_FLAGS_PULL_FLAGS(2, 32, "gpio2", DRV_TYPE_IO_1V8_OR_3V0,
 				      DRV_TYPE_IO_1V8_OR_3V0,
-- 
1.9.1


