From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] pinctrl: single: support GPIO for bits pinctrl
Date: Fri, 12 Jun 2015 16:19:45 +0800
Message-ID: <1434097185-16464-1-git-send-email-jun.nie@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:33207 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751163AbbFLIUN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2015 04:20:13 -0400
Received: by pdjn11 with SMTP id n11so20194024pdj.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2015 01:20:13 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: shawn.guo@linaro.org, wan.zhijun@zte.com.cn, jason.liu@linaro.org, Jun Nie <jun.nie@linaro.org>

Support GPIO for one register control multiple pins case
with calculating register offset first, then bit offset.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/pinctrl/pinctrl-single.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 13b45f2..bd69d9a 100644
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
+			data |= frange->gpiofunc << pin_pos;
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

