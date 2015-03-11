From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: fix constconst in devres
Date: Wed, 11 Mar 2015 12:24:38 +0100
Message-ID: <1426073078-25029-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:43692 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752788AbbCKLYp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 07:24:45 -0400
Received: by lbvp9 with SMTP id p9so8043171lbv.10
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2015 04:24:44 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Olliver Schinagl <oliver@schinagl.nl>

Commit 1feb57a245a4910b03202a814ffc51a900bd4aca
"gpio: add parameter to allow the use named gpios"
includes a double-conted array. Fix this.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Olliver Schinagl <oliver@schinagl.nl>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index ec24da2418b3..0bd060bf7151 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -135,7 +135,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
 					    struct fwnode_handle *child)
 {
-	static const char const *suffixes[] = { "gpios", "gpio" };
+	static const char *suffixes[] = { "gpios", "gpio" };
 	char prop_name[32]; /* 32 is max size of property name */
 	struct gpio_desc **dr;
 	struct gpio_desc *desc;
-- 
1.9.3

