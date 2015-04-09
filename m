From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: dwapb: remove dependencies
Date: Thu,  9 Apr 2015 10:37:21 +0200
Message-ID: <1428568641-16893-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:36278 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753569AbbDIIh3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2015 04:37:29 -0400
Received: by lagv1 with SMTP id v1so84249206lag.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2015 01:37:27 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Will Deacon <will.deacon@arm.com>

The Synopsys DesignWare DWAPB GPIO block is popular to
synthesize amongst many architectures: X86, ARM, ARC.
The driver was restricted to only these archs due to
using [read|write]l_relaxed() accessors that were not
universally available in the past,
but as of commit 9439eb3ab9d1ece6e4ad7baaa4a7f534f9b9dab0
"asm-generic: io: implement relaxed accessor macros as
conditional wrappers" these accessors are available on all
archs so this should not be a problem any more. Enable the
driver for all archs.

Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5b821a189780..17b72729ed3c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -142,7 +142,6 @@ config GPIO_DAVINCI
 
 config GPIO_DWAPB
 	tristate "Synopsys DesignWare APB GPIO driver"
-	depends on ((ARC || ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	help
-- 
1.9.3

