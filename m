From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 3/3] gpio: brcmstb: Allow building driver for BMIPS_GENERIC
Date: Wed,  6 Jan 2016 10:55:23 -0800
Message-ID: <1452106523-11556-4-git-send-email-f.fainelli@gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:34766 "EHLO
	mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863AbcAFS4O (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2016 13:56:14 -0500
Received: by mail-pf0-f176.google.com with SMTP id e65so190262092pfe.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2016 10:56:14 -0800 (PST)
In-Reply-To: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-mips@linux-mips.org, gregory.0xf0@gmail.com, jaedon.shin@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>

BMIPS_GENERIC (arch/mips/bmips) is the Kconfig symbol associated with
Broadcom MIPS-based STB chips. Since this driver is perfectly usable on
these platforms as well, allow using it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b60f40a423f3..cb212ebb39ff 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -134,8 +134,8 @@ config GPIO_BCM_KONA
 
 config GPIO_BRCMSTB
 	tristate "BRCMSTB GPIO support"
-	default y if ARCH_BRCMSTB
-	depends on OF_GPIO && (ARCH_BRCMSTB || COMPILE_TEST)
+	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
+	depends on OF_GPIO && (ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST)
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
-- 
2.1.0

