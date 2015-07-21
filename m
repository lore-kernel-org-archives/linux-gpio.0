From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] pinctrl: use dev_err() to show message in pinmux_func_name_to_selector()
Date: Tue, 21 Jul 2015 15:25:27 +0900
Message-ID: <1437459927-5278-2-git-send-email-yamada.masahiro@socionext.com>
References: <1437459927-5278-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:50034 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751802AbbGUGZ5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2015 02:25:57 -0400
In-Reply-To: <1437459927-5278-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

Use dev_err() rather than pr_err() to display the error message.

pinctrl_dev_get_name(pctldev) is no longer necessary because
dev_err() shows which device the message is related to.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinmux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 766ec57..18ce18c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -322,8 +322,7 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 		selector++;
 	}
 
-	pr_err("%s does not support function %s\n",
-	       pinctrl_dev_get_name(pctldev), function);
+	dev_err(pctldev->dev, "function '%s' not supported\n", function);
 	return -EINVAL;
 }
 
-- 
1.9.1

