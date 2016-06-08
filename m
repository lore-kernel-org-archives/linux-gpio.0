From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] pinctrl: Always recurse into bcm folder
Date: Wed,  8 Jun 2016 14:44:15 -0700
Message-ID: <1465422255-20716-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:36180 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751454AbcFHVoU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 17:44:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, kraxel@redhat.com, eric@anholt.net, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>

drivers/pinctrl/bcm/Makefile properly builds individual drivers based on
their respective Kconfig symbols. ARCH_BCM is currently a menuconfig
option from arch/arm/mach-bcm/Kconfig, which is fine, but prevents ARM64
platforms which do not have such menuconfig option from building their
pinctrl drivers, so let's get rid of that dependency.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 25ec45090620..8ebd7b8e1621 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -37,7 +37,7 @@ obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
-obj-$(CONFIG_ARCH_BCM)		+= bcm/
+obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
-- 
2.7.4

