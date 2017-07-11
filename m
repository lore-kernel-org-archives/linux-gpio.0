From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] pinctrl: qcom: ssbi: mpp: constify gpio_chip structure
Date: Tue, 11 Jul 2017 16:18:36 -0500
Message-ID: <20170711211836.GA31321@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gateway22.websitewelcome.com ([192.185.46.234]:20921 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932658AbdGKVSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jul 2017 17:18:41 -0400
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 59D142712A
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jul 2017 16:18:38 -0500 (CDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

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
  15136    5112       0   20248    4f18 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.o

after:
            bss     dec     hex filename
  14849    5024       0   19873    4da1 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 0d1392f..1e513bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -643,7 +643,7 @@ static void pm8xxx_mpp_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #define pm8xxx_mpp_dbg_show NULL
 #endif
 
-static struct gpio_chip pm8xxx_mpp_template = {
+static const struct gpio_chip pm8xxx_mpp_template = {
 	.direction_input = pm8xxx_mpp_direction_input,
 	.direction_output = pm8xxx_mpp_direction_output,
 	.get = pm8xxx_mpp_get,
-- 
2.5.0

