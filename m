From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] pinctrl: coh901: constify gpio_chip structure
Date: Tue, 11 Jul 2017 16:35:19 -0500
Message-ID: <20170711213519.GA3391@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gateway22.websitewelcome.com ([192.185.46.234]:36542 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932159AbdGKVfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jul 2017 17:35:22 -0400
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 0F1EB30205
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jul 2017 16:35:20 -0500 (CDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

This structure is only used to copy into another structure, so declare
it as const.

This issue was detected using Coccinelle and the following semantic patch:

@r disable optional_qualifier@
identifier i;
position p;
@@
static struct gpio_chip i@p = { ... };

@ok@
identifier r.i;
expression e;
position p;
@@
e = i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct gpio_chip e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct gpio_chip i = { ... };

In the following log you can see a significant difference in the code size
and data segment, hence in the dec segment. This log is the output
of the size command, before and after the code change:

before:
   text    data     bss     dec     hex filename
  12775    3696      64   16535    4097 drivers/pinctrl/pinctrl-coh901.o

after:
            bss     dec     hex filename
  12440    3640      64   16144    3f10 drivers/pinctrl/pinctrl-coh901.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/pinctrl/pinctrl-coh901.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index 741b39e..ac155e7 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -387,7 +387,7 @@ int u300_gpio_config_set(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static struct gpio_chip u300_gpio_chip = {
+static const struct gpio_chip u300_gpio_chip = {
 	.label			= "u300-gpio-chip",
 	.owner			= THIS_MODULE,
 	.request		= gpiochip_generic_request,
-- 
2.5.0

