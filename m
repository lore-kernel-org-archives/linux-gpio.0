From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to tristate
Date: Wed, 25 Jan 2017 16:26:08 +0100
Message-ID: <20170125162608.58bfbfb1@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46756 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750744AbdAYP0P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Jan 2017 10:26:15 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Takashi Iwai <tiwai@suse.de>

The pinctrl-baytrail driver builds just fine as a module so give
users this option.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
This was discussed almost one year ago, with no clear conclusion, but
also no evidence that the driver can't be built as a module. Is there
any way to push this forward?

 drivers/pinctrl/intel/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-4.7-rc7.orig/drivers/pinctrl/intel/Kconfig	2016-07-12 14:35:36.024835842 +0200
+++ linux-4.7-rc7/drivers/pinctrl/intel/Kconfig	2016-07-12 14:35:44.735904433 +0200
@@ -3,7 +3,7 @@
 #
 
 config PINCTRL_BAYTRAIL
-	bool "Intel Baytrail GPIO pin control"
+	tristate "Intel Baytrail GPIO pin control"
 	depends on GPIOLIB && ACPI
 	select GPIOLIB_IRQCHIP
 	select PINMUX


-- 
Jean Delvare
SUSE L3 Support
