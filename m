From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] pinctrl: ingenic: remove redundant dev_err call in ingenic_pinctrl_probe()
Date: Wed, 17 Jan 2018 11:29:17 +0000
Message-ID: <1516188557-147454-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 372ddf3..ac38a3f 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -736,10 +736,8 @@ static int ingenic_pinctrl_probe(struct platform_device *pdev)
 
 	base = devm_ioremap_resource(dev,
 			platform_get_resource(pdev, IORESOURCE_MEM, 0));
-	if (IS_ERR(base)) {
-		dev_err(dev, "Failed to ioremap registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	jzpc->map = devm_regmap_init_mmio(dev, base,
 			&ingenic_pinctrl_regmap_config);



