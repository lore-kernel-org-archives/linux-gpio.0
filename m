From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2] pinctrl: single: support GPIO for bits pinctrl
Date: Mon,  6 Jul 2015 21:57:05 +0800
Message-ID: <1436191025-9024-1-git-send-email-jun.nie@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:36658 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755351AbbGFN5b (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2015 09:57:31 -0400
Received: by pddu5 with SMTP id u5so19132149pdd.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2015 06:57:31 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: haojian.zhuang@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: tony@atomide.com, shawn.guo@linaro.org, wan.zhijun@zte.com.cn, jason.liu@linaro.org, Jun Nie <jun.nie@linaro.org>

Support GPIO for one register control multiple pins case
with calculating register offset first, then bit offset.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/pinctrl/pinctrl-single.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 13b45f2..4f23ef0 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -494,7 +494,7 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
 	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
 	struct pcs_gpiofunc_range *frange = NULL;
 	struct list_head *pos, *tmp;
-	int mux_bytes = 0;
+	int offset, mux_bytes = 0;
 	unsigned data;
 
 	/* If function mask is null, return directly. */
@@ -507,9 +507,23 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
 			|| pin < frange->offset)
 			continue;
 		mux_bytes = pcs->width / BITS_PER_BYTE;
-		data = pcs->read(pcs->base + pin * mux_bytes) & ~pcs->fmask;
-		data |= frange->gpiofunc;
-		pcs->write(data, pcs->base + pin * mux_bytes);
+		if (pcs->bits_per_mux) {
+			int pin_pos, byte_num, num_pins_in_register;
+
+			num_pins_in_register = pcs->width / pcs->bits_per_pin;
+			byte_num = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
+			offset = (byte_num / mux_bytes) * mux_bytes;
+			pin_pos = pin % num_pins_in_register;
+			pin_pos *= pcs->bits_per_pin;
+			data = pcs->read(pcs->base + offset) &
+				~(pcs->fmask << pin_pos);
+			data |= (frange->gpiofunc & pcs->fmask) << pin_pos;
+		} else {
+			offset = pin * mux_bytes;
+			data = pcs->read(pcs->base + offset) & ~pcs->fmask;
+			data |= frange->gpiofunc;
+		}
+		pcs->write(data, pcs->base + offset);
 		break;
 	}
 	return 0;
-- 
1.9.1

