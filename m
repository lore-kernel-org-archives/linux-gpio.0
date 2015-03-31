From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] gpio: dwapb: enable for ARC
Date: Tue, 31 Mar 2015 11:30:07 +0300
Message-ID: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:54096 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbbCaIaN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2015 04:30:13 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>

From: Vineet Gupta <vgupta@synopsys.com>

Synopsys SDP platform uses DW GPIO controller in design with
ARC cores. So adding ARC to architectures that may select this
GPIO controller.

Even though support for Synopsys SDP is yet to be submitted we'll need
this tiny option enabled at least for properly working interrupts (DW
GPIO controller is used as interrupt controller).

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4b3284b..83d2d0b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -148,7 +148,7 @@ config GPIO_GENERIC_PLATFORM
 
 config GPIO_DWAPB
 	tristate "Synopsys DesignWare APB GPIO driver"
-	depends on ((ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
+	depends on ((ARC || ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	help
-- 
2.1.0

