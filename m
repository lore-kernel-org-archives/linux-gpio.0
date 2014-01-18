From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] gpio: mcp23s08: fix casting caused build warning
Date: Sat, 18 Jan 2014 13:57:15 +0900
Message-ID: <1390021035-21374-1-git-send-email-sj38.park@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:33760 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752066AbaARE5T (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2014 23:57:19 -0500
Received: by mail-pb0-f48.google.com with SMTP id rr13so4899563pbb.7
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2014 20:57:19 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 drivers/gpio/gpio-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index b16401e..97198ef 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -640,7 +640,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 
 	match = of_match_device(of_match_ptr(mcp23s08_spi_of_match), &spi->dev);
 	if (match) {
-		type = (int)match->data;
+		type = (int)(uintptr_t)match->data;
 		status = of_property_read_u32(spi->dev.of_node,
 			    "microchip,spi-present-mask", &spi_present_mask);
 		if (status) {
-- 
1.8.3.2

