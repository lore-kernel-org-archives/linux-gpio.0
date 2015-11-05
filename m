From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: remove redundant if conditional from Kconfig
Date: Thu,  5 Nov 2015 15:46:03 +0900
Message-ID: <1446705963-7174-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:52406 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1034002AbbKEGpr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2015 01:45:47 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

The whole menu is guarded by

  menu "Pin controllers"
          depends on PINCTRL
      ...
  endmenu

The if conditional outside of it is redundant.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b422e4e..312c78b 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -5,8 +5,6 @@
 config PINCTRL
 	bool
 
-if PINCTRL
-
 menu "Pin controllers"
 	depends on PINCTRL
 
@@ -274,5 +272,3 @@ config PINCTRL_TB10X
 	select GPIOLIB
 
 endmenu
-
-endif
-- 
1.9.1

