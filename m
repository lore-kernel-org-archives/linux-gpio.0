From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] pinctrl: bcm: Default PINCTRL_BCM281XX to y for ARCH_BCM_MOBILE
Date: Tue,  1 Dec 2015 17:41:30 -0800
Message-ID: <1449020490-27084-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36257 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932370AbbLBBm6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 20:42:58 -0500
Received: by pacdm15 with SMTP id dm15so23293503pac.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 17:42:57 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: sbranden@broadcom.com, rjui@broadcom.com, linus.walleij@linaro.org, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>

This driver is mandatory for proper operation on the platforms covered
by the ARCH_BCM_MOBILE Kconfig symbol, make sure we do that driver on
for these platforms.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index cd11d4d9ad58..b63d7068f26c 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -9,6 +9,7 @@ config PINCTRL_BCM281XX
 	select PINCONF
 	select GENERIC_PINCONF
 	select REGMAP_MMIO
+	default ARCH_BCM_MOBILE
 	help
 	  Say Y here to support Broadcom BCM281xx pinctrl driver, which is used
 	  for the BCM281xx SoC family, including BCM11130, BCM11140, BCM11351,
-- 
2.1.0

