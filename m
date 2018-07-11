From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] pinctrl: ocelot: fix gpio4 twi function
Date: Wed, 11 Jul 2018 15:01:26 +0200
Message-ID: <20180711130126.4090-1-alexandre.belloni@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

the TWI function on GPIO4 is actually a multiplexed SCL, not an original
TWI SDA or SCL. Fix it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 15bb1cb8729b..e93669f4d1c8 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -132,7 +132,7 @@ OCELOT_P(0,  SG0,       NONE,      NONE);
 OCELOT_P(1,  SG0,       NONE,      NONE);
 OCELOT_P(2,  SG0,       NONE,      NONE);
 OCELOT_P(3,  SG0,       NONE,      NONE);
-OCELOT_P(4,  IRQ0_IN,   IRQ0_OUT,  TWI);
+OCELOT_P(4,  IRQ0_IN,   IRQ0_OUT,  TWI_SCL_M);
 OCELOT_P(5,  IRQ1_IN,   IRQ1_OUT,  PCI_WAKE);
 OCELOT_P(6,  UART,      TWI_SCL_M, NONE);
 OCELOT_P(7,  UART,      TWI_SCL_M, NONE);
-- 
2.18.0
