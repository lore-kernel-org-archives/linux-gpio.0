From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: mediatek/7623: delete unnecessary .owner
Date: Thu, 25 Feb 2016 16:26:21 +0100
Message-ID: <1456413981-26089-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34630 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760202AbcBYP01 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 10:26:27 -0500
Received: by mail-lf0-f46.google.com with SMTP id j78so35265086lfb.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 07:26:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, John Crispin <blogic@openwrt.org>

This is set by the device core.

Cc: John Crispin <blogic@openwrt.org>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7623.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index bf0d05b6e7dc..67895f8234e3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -367,7 +367,6 @@ static struct platform_driver mtk_pinctrl_driver = {
 	.probe = mt7623_pinctrl_probe,
 	.driver = {
 		.name = "mediatek-mt7623-pinctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = mt7623_pctrl_match,
 	},
 };
-- 
2.4.3

