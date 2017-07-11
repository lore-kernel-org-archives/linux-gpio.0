From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] pinctrl: vt8500: wmt: constify gpio_chip structure
Date: Tue, 11 Jul 2017 13:28:42 -0500
Message-ID: <20170711182842.GA23293@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gateway31.websitewelcome.com ([192.185.143.36]:23850 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755913AbdGKS2p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jul 2017 14:28:45 -0400
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id EFF3039C90
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jul 2017 13:28:42 -0500 (CDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

This structure is only used to copy into other structure, so declare
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
   7754    2328       0   10082    2762 drivers/pinctrl/vt8500/pinctrl-wmt.o

after:
   text    data     bss     dec     hex filename
   7472    2272       0    9744    2610 drivers/pinctrl/vt8500/pinctrl-wmt.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index c207e60..974e646 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -546,7 +546,7 @@ static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return pinctrl_gpio_direction_output(chip->base + offset);
 }
 
-static struct gpio_chip wmt_gpio_chip = {
+static const struct gpio_chip wmt_gpio_chip = {
 	.label = "gpio-wmt",
 	.owner = THIS_MODULE,
 	.request = gpiochip_generic_request,
-- 
2.5.0

