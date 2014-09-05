From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: single: fix freudian slip
Date: Fri,  5 Sep 2014 09:55:39 +0200
Message-ID: <1409903739-25998-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:51570 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbaIEHzr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Sep 2014 03:55:47 -0400
Received: by mail-wg0-f49.google.com with SMTP id y10so11414363wgg.32
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2014 00:55:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

commit 03e9f0cac5da6af85758276cb4624caf5911f2b9
"pinctrl: clean up after enable refactoring"
renamed the vtable callback .enable to .set_mux. The
renaming was done manually, and one of the alterations
contained a freudian slip. I confess, I am human.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 9032422ad18f..fb94b772ad62 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -519,7 +519,7 @@ static const struct pinmux_ops pcs_pinmux_ops = {
 	.get_functions_count = pcs_get_functions_count,
 	.get_function_name = pcs_get_function_name,
 	.get_function_groups = pcs_get_function_groups,
-	.set_mux = pcs_sex_mux,
+	.set_mux = pcs_set_mux,
 	.gpio_request_enable = pcs_request_gpio,
 };
 
-- 
1.9.3

