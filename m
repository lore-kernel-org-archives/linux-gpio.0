From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: fix pull debug print inversion
Date: Thu, 24 Mar 2016 13:15:45 +0100
Message-ID: <1458821745-10767-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:33518 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbcCXMPw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2016 08:15:52 -0400
Received: by mail-lb0-f171.google.com with SMTP id oe12so28983176lbc.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2016 05:15:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Pull up was reported as pull down and vice versa. Fix this.

Fixes: 8f1774a2a971 "pinctrl: nomadik: improve GPIO debug prints"
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 352406108fa0..c8969dd49449 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -990,7 +990,7 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 		int val;
 
 		if (pull)
-			pullidx = data_out ? 1 : 2;
+			pullidx = data_out ? 2 : 1;
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %s",
 			   gpio,
-- 
2.4.3

