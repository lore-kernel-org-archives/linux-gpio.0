From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] pinctrl: uniphier: enable UniPhier SoCs pinctrl drivers by default
Date: Tue, 27 Oct 2015 11:28:30 +0900
Message-ID: <1445912911-1292-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg012.nifty.com ([202.248.44.38]:62034 "EHLO
	conuserg012-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752292AbbJ0C2j (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2015 22:28:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Add "default y" to the Kconfig rather than adding entries into
arch/arm/configs/multi_v7_defconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/uniphier/Kconfig b/drivers/pinctrl/uniphier/Kconfig
index eab23ef..b1d2f941 100644
--- a/drivers/pinctrl/uniphier/Kconfig
+++ b/drivers/pinctrl/uniphier/Kconfig
@@ -7,26 +7,32 @@ config PINCTRL_UNIPHIER_CORE
 
 config PINCTRL_UNIPHIER_PH1_LD4
 	tristate "UniPhier PH1-LD4 SoC pinctrl driver"
+	default y
 	select PINCTRL_UNIPHIER_CORE
 
 config PINCTRL_UNIPHIER_PH1_PRO4
 	tristate "UniPhier PH1-Pro4 SoC pinctrl driver"
+	default y
 	select PINCTRL_UNIPHIER_CORE
 
 config PINCTRL_UNIPHIER_PH1_SLD8
 	tristate "UniPhier PH1-sLD8 SoC pinctrl driver"
+	default y
 	select PINCTRL_UNIPHIER_CORE
 
 config PINCTRL_UNIPHIER_PH1_PRO5
 	tristate "UniPhier PH1-Pro5 SoC pinctrl driver"
+	default y
 	select PINCTRL_UNIPHIER_CORE
 
 config PINCTRL_UNIPHIER_PROXSTREAM2
 	tristate "UniPhier ProXstream2 SoC pinctrl driver"
+	default y
 	select PINCTRL_UNIPHIER_CORE
 
 config PINCTRL_UNIPHIER_PH1_LD6B
 	tristate "UniPhier PH1-LD6b SoC pinctrl driver"
+	default y
 	select PINCTRL_UNIPHIER_CORE
 
 endif
-- 
1.9.1

