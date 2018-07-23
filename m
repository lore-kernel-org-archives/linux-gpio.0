From: Anton Vasilyev <vasilyev@ispras.ru>
Subject: [PATCH] gpio: ml-ioh: Fix buffer underwrite on probe error path
Date: Mon, 23 Jul 2018 19:53:30 +0300
Message-ID: <20180723165330.25213-1-vasilyev@ispras.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Anton Vasilyev <vasilyev@ispras.ru>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-Id: linux-gpio@vger.kernel.org

If ioh_gpio_probe() fails on devm_irq_alloc_descs() then chip may point
to any element of chip_save array, so reverse iteration from pointer chip
may become chip_save[-1] and gpiochip_remove() will operate with wrong
memory.

The patch fix the error path of ioh_gpio_probe() to correctly bypass
chip_save array.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
---
 drivers/gpio/gpio-ml-ioh.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index b23d9a36be1f..51c7d1b84c2e 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -496,9 +496,10 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 	return 0;
 
 err_gpiochip_add:
+	chip = chip_save;
 	while (--i >= 0) {
-		chip--;
 		gpiochip_remove(&chip->gpio);
+		chip++;
 	}
 	kfree(chip_save);
 
-- 
2.18.0
