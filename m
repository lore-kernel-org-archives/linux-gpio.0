From: Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] pinctrl: ns2: Fix potential NULL dereference
Date: Wed, 29 May 2019 10:43:58 +0800
Message-ID: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Young Xiao <92siuyang@gmail.com>
List-Id: linux-gpio@vger.kernel.org

platform_get_resource() may fail and return NULL, so we should
better check it's return value to avoid a NULL pointer dereference
a bit later in the code.

Signed-off-by: Young Xiao <92siuyang@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 4b5cf0e..2bf6af7 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1048,6 +1048,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return PTR_ERR(pinctrl->base0);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res)
+		return -EINVAL;
 	pinctrl->base1 = devm_ioremap_nocache(&pdev->dev, res->start,
 					resource_size(res));
 	if (!pinctrl->base1) {
-- 
2.7.4
