From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 1/1] gpio: mcp23s08: Do not free unrequested interrupt
Date: Tue, 11 Nov 2014 09:08:43 +0100
Message-ID: <1415693323-19046-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:35729 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752185AbaKKIGz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 11 Nov 2014 03:06:55 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

If devm_request_threaded_irq fails for some reason we call
mcp23s08_irq_teardown afterwards.
Do not free the unrequested interrupt in this case. free_irq can also be
omitted for the error free case because we use devm_request_threaded_irq.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/gpio/gpio-mcp23s08.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 8488e2f..d5e9586 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -514,8 +514,6 @@ static void mcp23s08_irq_teardown(struct mcp23s08 *mcp)
 {
 	unsigned int irq, i;
 
-	free_irq(mcp->irq, mcp);
-
 	for (i = 0; i < mcp->chip.ngpio; i++) {
 		irq = irq_find_mapping(mcp->irq_domain, i);
 		if (irq > 0)
-- 
2.0.4

