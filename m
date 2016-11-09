From: Axel Haslam <ahaslam@baylibre.com>
Subject: [PATCH] pinctrl: single: check for any error when getting rows
Date: Wed,  9 Nov 2016 15:17:06 +0100
Message-ID: <20161109141706.12624-1-ahaslam@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:37472 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751725AbcKIOS5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2016 09:18:57 -0500
Received: by mail-wm0-f49.google.com with SMTP id t79so303362949wmt.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2016 06:18:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: tony@atomide.com, haojian.zhuang@linaro.org, linus.walleij@linaro.org, khilman@baylibre.com, nsekhar@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Axel Haslam <ahaslam@baylibre.com>

pinctrl_count_index_with_args returns -ENOENT not
-EINVAL. The return check would pass, and we would
try to kzalloc with a negative error size throwing
a warning.

Instead of checking for -EINVAL specifically, lets
check for any error and avoid negative size allocations.

Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
---
 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 539f31c..56e22be 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1228,7 +1228,7 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 	struct pcs_function *function;
 
 	rows = pinctrl_count_index_with_args(np, name);
-	if (rows == -EINVAL)
+	if (rows < 0)
 		return rows;
 
 	npins_in_row = pcs->width / pcs->bits_per_pin;
-- 
2.10.1

