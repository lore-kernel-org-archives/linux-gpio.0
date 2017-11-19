From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: gemini: Add two missing GPIO groups
Date: Sun, 19 Nov 2017 10:57:27 +0100
Message-ID: <20171119095727.27689-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44705 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbdKSJ7d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Nov 2017 04:59:33 -0500
Received: by mail-lf0-f66.google.com with SMTP id w23so6951599lfd.11
        for <linux-gpio@vger.kernel.org>; Sun, 19 Nov 2017 01:59:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

The 3512 has two more GPIO groups on GPIO area 0, so let's
make it possible to combine these with the function.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-gemini.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index e9b83e291edf..10f8f3a35fe1 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -2015,7 +2015,8 @@ static const char * const sflashgrps[] = { "sflashgrp" };
 static const char * const gpio0grps[] = { "gpio0agrp", "gpio0bgrp", "gpio0cgrp",
 					  "gpio0dgrp", "gpio0egrp", "gpio0fgrp",
 					  "gpio0ggrp", "gpio0hgrp", "gpio0igrp",
-					  "gpio0jgrp", "gpio0kgrp" };
+					  "gpio0jgrp", "gpio0kgrp", "gpio0lgrp",
+					  "gpio0mgrp" };
 static const char * const gpio1grps[] = { "gpio1agrp", "gpio1bgrp", "gpio1cgrp",
 					  "gpio1dgrp" };
 static const char * const gpio2grps[] = { "gpio2agrp", "gpio2bgrp", "gpio2cgrp" };
-- 
2.14.3

