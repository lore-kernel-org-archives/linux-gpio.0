From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: stm32: fix debugfs format string
Date: Fri, 13 May 2016 15:53:38 +0200
Message-ID: <1463147643-568615-1-git-send-email-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:59002 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752345AbcEMNy7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2016 09:54:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Laxman Dewangan <ldewangan@nvidia.com>, Irina Tirdea <irina.tirdea@intel.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The newly added stm32_pconf_dbg_show function has an incorrect format
string that does not match the arguments, as reported by the gcc warning:

drivers/pinctrl/stm32/pinctrl-stm32.c: In function 'stm32_pconf_dbg_show':
drivers/pinctrl/stm32/pinctrl-stm32.c:797:17: error: too many arguments for format [-Werror=format-extra-args]

This changes the format string in a way that gets rid of the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 3beed93c1617 ("pinctrl: stm32: Implement .pin_config_dbg_show()")
---
I could not find a documentation for the debugfs format, so no
idea if this is the intended format.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index e51c1cf5270b..4ffbe9551299 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -794,7 +794,7 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	case 2:
 		drive = stm32_pconf_get_driving(bank, offset);
 		speed = stm32_pconf_get_speed(bank, offset);
-		seq_printf(s, "%d - %s -%s", alt,
+		seq_printf(s, "%d - %s - %s - %s %s ", alt,
 			   drive ? "open drain" : "push pull",
 			   biasing[bias],
 			   speeds[speed], "speed");
-- 
2.7.0

