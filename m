From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH] pinctrl: don't try to print function groups if we can't get them
Date: Mon, 8 Jun 2015 17:16:37 +0200
Message-ID: <1433776597-615-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:13072 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752545AbbFHPQm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2015 11:16:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, nicolas.ferre@atmel.com, Ludovic Desroches <ludovic.desroches@atmel.com>

There is no reason to try to print groups associated to a function if
get_function_groups returns an error. Moreover, it can lead to a NULL
pointer dereference error.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 drivers/pinctrl/pinmux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index b874458..fd944e3 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -544,9 +544,12 @@ static int pinmux_functions_show(struct seq_file *s, void *what)
 
 		ret = pmxops->get_function_groups(pctldev, func_selector,
 						  &groups, &num_groups);
-		if (ret)
+		if (ret) {
 			seq_printf(s, "function %s: COULD NOT GET GROUPS\n",
 				   func);
+			func_selector++;
+			continue;
+		}
 
 		seq_printf(s, "function: %s, groups = [ ", func);
 		for (i = 0; i < num_groups; i++)
-- 
2.2.0

