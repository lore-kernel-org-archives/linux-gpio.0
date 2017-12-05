From: Pravin Shedge <pravin.shedge4linux@gmail.com>
Subject: [PATCH 03/45] drivers: gpio: remove duplicate includes
Date: Tue,  5 Dec 2017 07:28:24 +0530
Message-ID: <1512439104-15507-1-git-send-email-pravin.shedge4linux@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:38773 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752043AbdLEB6f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Dec 2017 20:58:35 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: pravin.shedge4linux@gmail.com, Gregory Fong <gregory.0xf0@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

These duplicate includes have been found with scripts/checkincludes.pl but
they have been removed manually to avoid removing false positives.

Signed-off-by: Pravin Shedge <pravin.shedge4linux@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 545d43a..f40ec39 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -11,7 +11,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/bitops.h>
 #include <linux/gpio/driver.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
-- 
2.7.4

