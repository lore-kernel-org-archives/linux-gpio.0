From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 1/3] gpio: mcp23s08: request a shared interrupt
Date: Mon, 17 Nov 2014 09:38:09 +0100
Message-ID: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:35664 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751352AbaKQIgD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 17 Nov 2014 03:36:03 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org

Request a shared interrupt when requesting a mcp23s08 GPIO interrupt.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/gpio/gpio-mcp23s08.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index d5e9586..9295b6e 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -485,7 +485,8 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 		return -ENODEV;
 
 	err = devm_request_threaded_irq(chip->dev, mcp->irq, NULL, mcp23s08_irq,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					IRQF_TRIGGER_LOW | IRQF_ONESHOT |
+					IRQF_SHARED,
 					dev_name(chip->dev), mcp);
 	if (err != 0) {
 		dev_err(chip->dev, "unable to request IRQ#%d: %d\n",
-- 
2.0.4

