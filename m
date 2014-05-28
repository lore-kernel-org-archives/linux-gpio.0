From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mcp23s08: switch chip count to int
Date: Wed, 28 May 2014 09:16:38 +0200
Message-ID: <1401261398-29794-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:47907 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873AbaE1HQn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 May 2014 03:16:43 -0400
Received: by mail-wg0-f41.google.com with SMTP id z12so10779876wgg.24
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2014 00:16:42 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Michael Stickel <ms@mycable.de>

Commit 3e3bed913e8bbd78f38cefd5d575475f45c05dd0
"gpio: mcp23s08: fixed count variable for devicetree probing"
introduced a loop check to see if the number of chips were
unconsistent and going below zero counting downwards, but
this requires the counting variable to be able to be
negative, so switch the variable from unsigned to int.

Cc: Michael Stickel <ms@mycable.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 00fbb30b9b10..f3bee370bcf2 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -867,7 +867,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 {
 	struct mcp23s08_platform_data	*pdata;
 	unsigned			addr;
-	unsigned			chips = 0;
+	int				chips = 0;
 	struct mcp23s08_driver_data	*data;
 	int				status, type;
 	unsigned			base = -1,
-- 
1.9.3

