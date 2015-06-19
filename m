From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] gpio: mvebu: kill bogus dependency on GPIO_GENERIC
Date: Fri, 19 Jun 2015 20:31:03 +0900
Message-ID: <1434713464-32069-2-git-send-email-yamada.masahiro@socionext.com>
References: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:46926 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750906AbbFSLb1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2015 07:31:27 -0400
In-Reply-To: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

The driver gpio-mvebu.c does not depend on gpio-generic.c at all.
Drop unneeded "select GPIO_GENERIC".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 25c232e..241d441 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -283,7 +283,6 @@ config GPIO_MVEBU
 	def_bool y
 	depends on PLAT_ORION
 	depends on OF
-	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
 config GPIO_MXC
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
