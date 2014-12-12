From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mcp23s08: fix up compilation error
Date: Fri, 12 Dec 2014 16:04:35 +0100
Message-ID: <1418396675-16959-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:63509 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967963AbaLLPEo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Dec 2014 10:04:44 -0500
Received: by mail-wi0-f171.google.com with SMTP id bs8so2754752wib.16
        for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2014 07:04:42 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Alexander Stein <alexander.stein@systec-electronic.com>

The driver depends on the chip.of_node being present to compile,
which is the case on some target platforms but not others.
Instead, rely on chip.dev->of_node to be used, as struct device
always has an of_node in place.

Cc: Alexander Stein <alexander.stein@systec-electronic.com>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mcp23s08.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 93ee7da2d8b0..da9c316059bc 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -655,8 +655,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 	mcp->irq_controller = pdata->irq_controller;
 	if (mcp->irq && mcp->irq_controller) {
-		mcp->irq_active_high = of_property_read_bool(mcp->chip.of_node,
-				"microchip,irq-active-high");
+		mcp->irq_active_high =
+			of_property_read_bool(mcp->chip.dev->of_node,
+					      "microchip,irq-active-high");
 
 		if (type == MCP_TYPE_017)
 			mirror = pdata->mirror;
-- 
1.9.3

