From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 127/182] ARM: s3c24xx: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:35:47 +0100
Message-ID: <1449668147-3869-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34793 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754496AbbLINfw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:35:52 -0500
Received: by lffu14 with SMTP id u14so34383288lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:35:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, arm@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: arm@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC guys: please ACK this so I can take it through the
GPIO tree.
---
 arch/arm/mach-s3c24xx/mach-h1940.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index 9f54300df4b3..7ed78619217c 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -664,7 +664,7 @@ static void __init h1940_map_io(void)
 
 	/* Add latch gpio chip, set latch initial value */
 	h1940_latch_control(0, 0);
-	WARN_ON(gpiochip_add(&h1940_latch_gpiochip));
+	WARN_ON(gpiochip_add_data(&h1940_latch_gpiochip, NULL));
 }
 
 static void __init h1940_init_time(void)
-- 
2.4.3

