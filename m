From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH 2/2] pinctrl: rockchip: Fix the correct routing config for the gmac-m1 pins of rmii and rgmii
Date: Sat, 30 Sep 2017 20:13:21 +0800
Message-ID: <1506773601-27315-3-git-send-email-david.wu@rock-chips.com>
References: <1506773601-27315-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506773601-27315-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

If the gmac-m1 optimization(bit10) is selected, the gpio function
of gmac pins is not valid. We may use the rmii mode for gmac interface,
the pins such as rx_d2, rx_d3, which the rgmii mode used, but rmii not
used could be taken as gpio function. So gmac_rxd0m1 selects the bit2,
and gmac_rxd0m3 select bit10 is more correct.

Signed-off-by: David Wu <david.wu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c7c9beb..9e0cabf 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -900,12 +900,19 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 		.route_offset = 0x50,
 		.route_val = BIT(16) | BIT(16 + 1) | BIT(0),
 	}, {
-		/* gmac-m1-optimized_rxd0 */
+		/* gmac-m1_rxd0 */
 		.bank_num = 1,
 		.pin = 11,
 		.func = 2,
 		.route_offset = 0x50,
-		.route_val = BIT(16 + 2) | BIT(16 + 10) | BIT(2) | BIT(10),
+		.route_val = BIT(16 + 2) | BIT(2),
+	}, {
+		/* gmac-m1-optimized_rxd3 */
+		.bank_num = 1,
+		.pin = 14,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 10) | BIT(10),
 	}, {
 		/* pdm_sdi0m0 */
 		.bank_num = 2,
-- 
1.9.1
