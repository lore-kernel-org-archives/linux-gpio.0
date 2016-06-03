From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 1/9] pinctrl: walk into bcm subdir unconditionally
Date: Fri,  3 Jun 2016 08:18:20 +0200
Message-ID: <1464934708-24769-2-git-send-email-kraxel@redhat.com>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40886 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751255AbcFCGSj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 3 Jun 2016 02:18:39 -0400
In-Reply-To: <1464934708-24769-1-git-send-email-kraxel@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

There is no ARCH_BCM on arm64, and we need pinctrl-bcm2835 for the rpi3.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e4bc115..88586c0 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -35,7 +35,7 @@ obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
-obj-$(CONFIG_ARCH_BCM)		+= bcm/
+obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
-- 
1.8.3.1

