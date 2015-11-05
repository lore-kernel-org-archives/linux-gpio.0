From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH] gpio: 74xx: fix a possible NULL dereference
Date: Thu,  5 Nov 2015 16:55:39 +0100
Message-ID: <1446738939-22320-1-git-send-email-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>
List-Id: linux-gpio@vger.kernel.org

of_match_device could return NULL, and so cause a NULL pointer
dereference later at line 132:
priv->flags = (uintptr_t) of_id->data;

Reported-by: coverity (CID 1324141)
Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/gpio/gpio-74xx-mmio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 6ed7c0f..4a7be0f 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -120,6 +120,9 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 	void __iomem *dat;
 	int err;
 
+	if (!of_id)
+		return -ENODEV;
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.4.10
