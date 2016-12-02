From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/3] pinctrl: sx150x: access the correct bits in the 4-bit regs of sx150[147]
Date: Fri,  2 Dec 2016 11:51:14 +0100
Message-ID: <1480675876-19540-2-git-send-email-peda@axentia.se>
References: <1480675876-19540-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480675876-19540-1-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peter Rosin <peda@axentia.se>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The code assumes 8-bit or 16-bit width registers, but three of the
chips (sx1501/sx1504/sx1507) are 4-bit. So, try to handle 4-bit chips as
well, they leave the high part of each register unused.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/pinctrl/pinctrl-sx150x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 1a1c8b51a992..a121819ffc92 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010, Code Aurora Forum. All rights reserved.
  *
  * Driver for Semtech SX150X I2C GPIO Expanders
+ * The handling of the 4-bit chips (SX1501/SX1504/SX1507) is untested.
  *
  * Author: Gregory Bean <gbean@codeaurora.org>
  *
@@ -1088,7 +1089,7 @@ static int sx150x_regmap_reg_write(void *context, unsigned int reg,
 
 	val = sx150x_maybe_swizzle(pctl, reg, val);
 
-	n = width - 8;
+	n = (width - 1) & ~7;
 	do {
 		const u8 byte = (val >> n) & 0xff;
 
-- 
2.1.4
