From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] gpio: rcar: Include linux/of.h header
Date: Wed, 16 Oct 2013 15:35:02 +0530
Message-ID: <1381917902-6829-2-git-send-email-sachin.kamat@linaro.org>
References: <1381917902-6829-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:44119 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760317Ab3JPKFw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2013 06:05:52 -0400
Received: by mail-pa0-f54.google.com with SMTP id kx10so840307pab.27
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2013 03:05:52 -0700 (PDT)
In-Reply-To: <1381917902-6829-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

'of_match_ptr' is defined in linux/of.h. Include it explicitly to
avoid build breakage in the future.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-rcar.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 6038966..9b04799 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -22,6 +22,7 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_data/gpio-rcar.h>
 #include <linux/platform_device.h>
-- 
1.7.9.5

