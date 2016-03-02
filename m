From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/14] pinctrl: at91: use __maybe_unused to hide pm functions
Date: Wed,  2 Mar 2016 16:58:53 +0100
Message-ID: <1456934350-1389172-2-git-send-email-arnd@arndb.de>
References: <1456934350-1389172-1-git-send-email-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:64056 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750977AbcCBQAM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Mar 2016 11:00:12 -0500
In-Reply-To: <1456934350-1389172-1-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The at91-pio4 pinctrl driver uses SET_SYSTEM_SLEEP_PM_OPS() to
conditionally set the correct suspend/resume options, but they
become unused when CONFIG_PM is disabled:

drivers/pinctrl/pinctrl-at91-pio4.c:827:12: error: 'atmel_pctrl_suspend' defined but not used [-Werror=unused-function]
drivers/pinctrl/pinctrl-at91-pio4.c:847:12: error: 'atmel_pctrl_resume' defined but not used [-Werror=unused-function]

This adds __maybe_unused annotations so the compiler knows
it can silently drop them instead of warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index ee69db6ae1c7..4429312e848d 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -824,7 +824,7 @@ static struct pinctrl_desc atmel_pinctrl_desc = {
 	.pmxops		= &atmel_pmxops,
 };
 
-static int atmel_pctrl_suspend(struct device *dev)
+static int __maybe_unused atmel_pctrl_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct atmel_pioctrl *atmel_pioctrl = platform_get_drvdata(pdev);
@@ -844,7 +844,7 @@ static int atmel_pctrl_suspend(struct device *dev)
 	return 0;
 }
 
-static int atmel_pctrl_resume(struct device *dev)
+static int __maybe_unused atmel_pctrl_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct atmel_pioctrl *atmel_pioctrl = platform_get_drvdata(pdev);
-- 
2.7.0

