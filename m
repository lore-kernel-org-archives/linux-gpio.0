From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 03/27] tpm: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue,  5 May 2015 18:32:19 +0200
Message-ID: <1430843563-18615-3-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:46219 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761326AbbEEQcz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2015 12:32:55 -0400
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Peter Huewe <peterhuewe@gmx.de>, Marcel Selhorst <tpmdd@selhorst.net>, tpmdd-devel@lists.sourceforge.net

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Huewe <peterhuewe@gmx.de>
Cc: Marcel Selhorst <tpmdd@selhorst.net>
Cc: tpmdd-devel@lists.sourceforge.net
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

