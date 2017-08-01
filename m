From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 1/2] gpio: mb86s7x: Handle return value of clk_prepare_enable.
Date: Tue,  1 Aug 2017 12:13:05 +0530
Message-ID: <e84a2b010f0632369030f92fa30572ba1e4aaaf2.1501569628.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:36591 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750852AbdHAGnb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 02:43:31 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

clk_prepare_enable() can fail here and we must check its return value.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/gpio/gpio-mb86s7x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index ffb73f6..94d7726 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -168,7 +168,9 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gchip->clk))
 		return PTR_ERR(gchip->clk);
 
-	clk_prepare_enable(gchip->clk);
+	ret = clk_prepare_enable(gchip->clk);
+	if (ret)
+		return ret;
 
 	spin_lock_init(&gchip->lock);
 
-- 
1.9.1

