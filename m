From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: stm32: fix incorrect pinctl format message
Date: Tue, 17 May 2016 17:26:55 +0100
Message-ID: <1463502415-17920-1-git-send-email-colin.king@canonical.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:41820 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792AbcEQQ1G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 May 2016 12:27:06 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Irina Tirdea <irina.tirdea@intel.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are missing string format specifiers in the seq_printf
that are causing a build warning.  Add these missing string
format specifiers to fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index e51c1cf..ae9fab8 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -794,7 +794,7 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	case 2:
 		drive = stm32_pconf_get_driving(bank, offset);
 		speed = stm32_pconf_get_speed(bank, offset);
-		seq_printf(s, "%d - %s -%s", alt,
+		seq_printf(s, "%d - %s - %s - %s %s", alt,
 			   drive ? "open drain" : "push pull",
 			   biasing[bias],
 			   speeds[speed], "speed");
-- 
2.8.1

