From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: fix constconst in devres
Date: Wed, 11 Mar 2015 13:43:19 +0100
Message-ID: <1426077799-26852-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:38445 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752489AbbCKMn1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 08:43:27 -0400
Received: by labhs14 with SMTP id hs14so7971488lab.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2015 05:43:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Olliver Schinagl <oliver@schinagl.nl>, Rojhalat Ibrahim <imr@rtschenk.de>

Commit 1feb57a245a4910b03202a814ffc51a900bd4aca
"gpio: add parameter to allow the use named gpios"
includes a double-consted array. What we want is not
const const * but const * const (const pointer to const
data). Fix this.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Olliver Schinagl <oliver@schinagl.nl>
Cc: Rojhalat Ibrahim <imr@rtschenk.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Const pointer to const data is what we want.
---
 drivers/gpio/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index ec24da2418b3..07ba82317ece 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -135,7 +135,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
 					    struct fwnode_handle *child)
 {
-	static const char const *suffixes[] = { "gpios", "gpio" };
+	static const char * const suffixes[] = { "gpios", "gpio" };
 	char prop_name[32]; /* 32 is max size of property name */
 	struct gpio_desc **dr;
 	struct gpio_desc *desc;
-- 
1.9.3

