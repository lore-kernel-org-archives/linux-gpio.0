From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: sirf: drop pointless static qualifier in sirfsoc_gpio_probe
Date: Wed, 23 Jan 2019 16:41:40 +0800
Message-ID: <20190123084140.16524-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, baohua@kernel.org, keescook@chromium.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-gpio@vger.kernel.org

There is no need to have the 'sgpio' variable static since new
value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index 2e42d73..2b3bd1a 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -782,7 +782,7 @@ static void sirfsoc_gpio_set_pulldown(struct sirfsoc_gpio_chip *sgpio,
 static int sirfsoc_gpio_probe(struct device_node *np)
 {
 	int i, err = 0;
-	static struct sirfsoc_gpio_chip *sgpio;
+	struct sirfsoc_gpio_chip *sgpio;
 	struct sirfsoc_gpio_bank *bank;
 	void __iomem *regs;
 	struct platform_device *pdev;
-- 
2.7.0
