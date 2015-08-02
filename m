From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 01/11] tpm: Allow compile test of GPIO consumers if !GPIOLIB
Date: Sun,  2 Aug 2015 11:08:47 +0200
Message-ID: <1438506527-31098-1-git-send-email-geert@linux-m68k.org>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:43474 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853AbbHBJI6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2015 05:08:58 -0400
In-Reply-To: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Huewe <peterhuewe@gmx.de>, Marcel Selhorst <tpmdd@selhorst.net>
Cc: tpmdd-devel@lists.sourceforge.net, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
v2:
  - Add Acked-by.
---
 drivers/char/tpm/st33zp24/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/tpm/st33zp24/Kconfig b/drivers/char/tpm/st33zp24/Kconfig
index 09cb727864f0950f..19c007461d1cbd7a 100644
--- a/drivers/char/tpm/st33zp24/Kconfig
+++ b/drivers/char/tpm/st33zp24/Kconfig
@@ -1,6 +1,6 @@
 config TCG_TIS_ST33ZP24
 	tristate "STMicroelectronics TPM Interface Specification 1.2 Interface"
-	depends on GPIOLIB
+	depends on GPIOLIB || COMPILE_TEST
 	---help---
 	  STMicroelectronics ST33ZP24 core driver. It implements the core
 	  TPM1.2 logic and hooks into the TPM kernel APIs. Physical layers will
-- 
1.9.1

