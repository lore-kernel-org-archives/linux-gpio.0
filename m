From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH 2/2] gpio: mt7621: pass mediatek_gpio_bank_probe() failure up the stack
Date: Wed, 21 Nov 2018 19:06:13 +0100
Message-ID: <1542823573-20228-2-git-send-email-hofrat@osadl.org>
References: <1542823573-20228-1-git-send-email-hofrat@osadl.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542823573-20228-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>
List-Id: linux-gpio@vger.kernel.org

The error cases of mediatek_gpio_bank_probe() would go unnoticed (except
for the dev_err() messages). The probe function should return an error
if one of the banks failed to initialize properly.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
---

Patch was compile tested with: omega2p_defconfig, SOC_MT7621=y,
GPIOLIB=y, GPIO_MT7621=y

Patch is against 4.20-rc3 (localversion-next is next-20181121)

 drivers/gpio/gpio-mt7621.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 1ec95bc..68fca8b 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -297,6 +297,7 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct mtk *mtk;
 	int i;
+	int ret;
 
 	mtk = devm_kzalloc(dev, sizeof(*mtk), GFP_KERNEL);
 	if (!mtk)
@@ -311,8 +312,11 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mtk);
 	mediatek_gpio_irq_chip.name = dev_name(dev);
 
-	for (i = 0; i < MTK_BANK_CNT; i++)
-		mediatek_gpio_bank_probe(dev, np, i);
+	for (i = 0; i < MTK_BANK_CNT; i++) {
+		ret = mediatek_gpio_bank_probe(dev, np, i);
+		if (!ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.1.4
