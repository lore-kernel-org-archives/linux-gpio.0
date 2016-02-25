From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] pinctrl: sh-pfc: Use ARCH_RENESAS
Date: Thu, 25 Feb 2016 09:51:54 +0900
Message-ID: <1456361514-18765-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40071 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752353AbcBYAwG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2016 19:52:06 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>

Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.

This is part of an ongoing process to migrate from ARCH_SHMOBILE to
ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/pinctrl/sh-pfc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

 Based on the for-next branch of the linux-pinctrl tree

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index 35d6e95fa21f..9cf9af080bab 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -2,7 +2,7 @@
 # Renesas SH and SH Mobile PINCTRL drivers
 #
 
-if ARCH_SHMOBILE || SUPERH
+if ARCH_RENESAS || SUPERH
 
 config PINCTRL_SH_PFC
 	select GPIO_SH_PFC if ARCH_REQUIRE_GPIOLIB
-- 
2.7.0.rc3.207.g0ac5344

