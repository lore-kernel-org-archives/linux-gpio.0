From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: select IRQ_DOMAIN for gpiolib irqchip helpers
Date: Thu, 29 May 2014 16:54:12 +0200
Message-ID: <1401375252-29260-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:48170 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932720AbaE2OyU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 May 2014 10:54:20 -0400
Received: by mail-we0-f171.google.com with SMTP id w62so540707wes.16
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2014 07:54:18 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

These helpers depend on the IRQ_DOMAIN so select it explicitly,
as it will not be present on all platforms such as Intel
desktops and laptops using Intel-MID.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fa3cb189f972..4a1b5113e527 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -56,6 +56,7 @@ config GPIO_ACPI
 	depends on ACPI
 
 config GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN
 	bool
 
 config DEBUG_GPIO
@@ -710,7 +711,7 @@ config GPIO_AMD8111
 config GPIO_INTEL_MID
 	bool "Intel Mid GPIO support"
 	depends on PCI && X86
-	select IRQ_DOMAIN
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to support Intel Mid GPIO.
 
-- 
1.9.3

