From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/4] pinctrl: gemini: Add missing functions
Date: Sat, 28 Oct 2017 15:37:16 +0200
Message-ID: <20171028133719.27528-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:51232 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751199AbdJ1Njh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Oct 2017 09:39:37 -0400
Received: by mail-lf0-f67.google.com with SMTP id r129so10112155lff.8
        for <linux-gpio@vger.kernel.org>; Sat, 28 Oct 2017 06:39:37 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

Some two functions were missing from the Gemini pin control
driver. Noticed when trying to use ethernet. Fix it up by
adding them.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-gemini.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index 39e6221e7100..7ffd768c0e02 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -2074,6 +2074,16 @@ static const struct gemini_pmx_func gemini_pmx_functions[] = {
 		.num_groups = ARRAY_SIZE(satagrps),
 	},
 	{
+		.name = "usb",
+		.groups = usbgrps,
+		.num_groups = ARRAY_SIZE(usbgrps),
+	},
+	{
+		.name = "gmii",
+		.groups = gmiigrps,
+		.num_groups = ARRAY_SIZE(gmiigrps),
+	},
+	{
 		.name = "pci",
 		.groups = pcigrps,
 		.num_groups = ARRAY_SIZE(pcigrps),
-- 
2.13.6

