From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH v1 1/1] gpio: gpio-crystalcove: Skip IRQ CTRL register update for virtual GPIOs
Date: Wed, 14 Jun 2017 16:21:14 -0700
Message-ID: <5fabde8f9366fce42b5f361f3472bc91754ca7db.1497482431.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:24245 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752121AbdFNXVR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Jun 2017 19:21:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Commit 9a752b4c9ab9 ("gpio: crystalcove: Do not write regular gpio
registers for virtual GPIOs") added support to skip GPIO register
update for virtual GPIOs, but it missed to add skip logic in
crystalcove_update_irq_ctrl() function. This patch fixes it.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/gpio/gpio-crystalcove.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index e60156e..edc9aa8 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -134,6 +134,9 @@ static void crystalcove_update_irq_ctrl(struct crystalcove_gpio *cg, int gpio)
 {
 	int reg = to_reg(gpio, CTRL_IN);
 
+	if (reg < 0)
+		return;
+
 	regmap_update_bits(cg->regmap, reg, CTLI_INTCNT_BE, cg->intcnt_value);
 }
 
-- 
2.7.4

