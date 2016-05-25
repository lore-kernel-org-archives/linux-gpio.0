From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: return -ENOMEM instead of -EINVAL for kasprintf() failure
Date: Wed, 25 May 2016 20:14:13 +0900
Message-ID: <1464174853-9297-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:24096 "EHLO
	conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751223AbcEYLNe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2016 07:13:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

-ENOMEM is more suitable error code because kasprintf() fails
in case of memory shortage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index d94d76c..ece7028 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -256,7 +256,7 @@ int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 	/* Conjure some name stating what chip and pin this is taken by */
 	owner = kasprintf(GFP_KERNEL, "%s:%d", range->name, gpio);
 	if (!owner)
-		return -EINVAL;
+		return -ENOMEM;
 
 	ret = pin_request(pctldev, pin, owner, range);
 	if (ret < 0)
-- 
1.9.1

