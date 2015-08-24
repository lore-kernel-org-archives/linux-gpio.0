From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 1/2] pinctrl: qcom: ssbi: convert null test to IS_ERR test
Date: Mon, 24 Aug 2015 23:12:26 +0200
Message-ID: <1440450747-10080-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1440450747-10080-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440450747-10080-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Since commit 323de9efdf3e ("pinctrl: make pinctrl_register() return proper
error code"), pinctrl_register returns an error code rather than NULL on
failure.  Update some drivers that were introduced more recently.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1,e2;
@@

e = pinctrl_register(...)
... when != e = e1
if (
-   e == NULL
+   IS_ERR(e)
   ) {
     ...
     return
-      e2
+      PTR_ERR(e)
     ;
     }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c |    4 ++--
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c  |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index c978b31..e1a3721 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -723,9 +723,9 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 #endif
 
 	pctrl->pctrl = pinctrl_register(&pctrl->desc, &pdev->dev, pctrl);
-	if (!pctrl->pctrl) {
+	if (IS_ERR(pctrl->pctrl)) {
 		dev_err(&pdev->dev, "couldn't register pm8xxx gpio driver\n");
-		return -ENODEV;
+		return PTR_ERR(pctrl->pctrl);
 	}
 
 	pctrl->chip = pm8xxx_gpio_template;
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 2d1b69f..6652b8d 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -814,9 +814,9 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
 #endif
 
 	pctrl->pctrl = pinctrl_register(&pctrl->desc, &pdev->dev, pctrl);
-	if (!pctrl->pctrl) {
+	if (IS_ERR(pctrl->pctrl)) {
 		dev_err(&pdev->dev, "couldn't register pm8xxx mpp driver\n");
-		return -ENODEV;
+		return PTR_ERR(pctrl->pctrl);
 	}
 
 	pctrl->chip = pm8xxx_mpp_template;
