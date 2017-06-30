From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: rza1: fix incorrect failure check on platform_get_resources
Date: Fri, 30 Jun 2017 11:33:55 +0100
Message-ID: <20170630103355.9769-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The return res from platform_get_resources should be checked for
a failure rather than ret.  Fixes warning:

'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]

Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 29ddd624fb98..e79c8b9818d7 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1257,7 +1257,7 @@ static int rza1_pinctrl_probe(struct platform_device *pdev)
 	rza1_pctl->dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (ret)
+	if (!res)
 		return -ENODEV;
 
 	rza1_pctl->base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.11.0
