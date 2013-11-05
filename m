From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] pinctrl: at91: copy define to driver
Date: Tue,  5 Nov 2013 10:30:14 +0100
Message-ID: <1383643814-14308-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:53667 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097Ab3KEJaX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2013 04:30:23 -0500
Received: by mail-we0-f174.google.com with SMTP id u56so3163243wes.19
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2013 01:30:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

The #define for the maximum number of GPIO blocks was retrieved
into pinctrl-at91.c by implicit inclusion of <mach/gpio.h>
from <linux/gpio.h> creating a dependency on machine-local
<mach/gpio.h>. Break the depenency by copying this single
define into the driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This will be applied directly to the pinctrl tree unless there
are specific protests.
---
 drivers/pinctrl/pinctrl-at91.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index f350fd2e170e..0dfb8c7b58df 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -33,6 +33,7 @@
 
 #include "core.h"
 
+#define MAX_GPIO_BANKS		5
 #define MAX_NB_GPIO_PER_BANK	32
 
 struct at91_pinctrl_mux_ops;
-- 
1.8.3.1

