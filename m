From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: octeon: Constify octeon_gpio_match table
Date: Fri, 18 Mar 2016 21:06:06 +0800
Message-ID: <1458306366.17098.1.camel@ingics.com>
References: <1458306316.17098.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:34989 "EHLO
	mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbcCRNGL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 09:06:11 -0400
Received: by mail-pf0-f180.google.com with SMTP id n5so167595573pfn.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2016 06:06:11 -0700 (PDT)
In-Reply-To: <1458306316.17098.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Daney <david.daney@cavium.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-octeon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 9373d4e..96a8a8c 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -116,7 +116,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id octeon_gpio_match[] = {
+static const struct of_device_id octeon_gpio_match[] = {
 	{
 		.compatible = "cavium,octeon-3860-gpio",
 	},
-- 
2.1.4



