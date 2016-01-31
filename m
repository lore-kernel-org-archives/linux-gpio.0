From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: uniphier: add COMPILE_TEST option
Date: Sun, 31 Jan 2016 22:32:51 +0900
Message-ID: <1454247171-25028-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:50882 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757345AbcAaNdq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Jan 2016 08:33:46 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Add COMPILE_TEST for the compilation test coverage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/Kconfig b/drivers/pinctrl/uniphier/Kconfig
index 7abd614..43f689f 100644
--- a/drivers/pinctrl/uniphier/Kconfig
+++ b/drivers/pinctrl/uniphier/Kconfig
@@ -1,6 +1,6 @@
 menuconfig PINCTRL_UNIPHIER
 	bool "UniPhier SoC pinctrl drivers"
-	depends on ARCH_UNIPHIER
+	depends on ARCH_UNIPHIER || COMPILE_TEST
 	depends on OF && MFD_SYSCON
 	default y
 	select PINMUX
-- 
1.9.1

