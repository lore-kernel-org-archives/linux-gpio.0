From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 13/28] gpio: pch: allow use from device tree
Date: Mon, 30 Nov 2015 16:21:38 +0000
Message-ID: <1448900513-20856-14-git-send-email-paul.burton@imgtec.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Allow GPIOs from the gpio-pch driver to be referenced from device tree
by simply setting the struct gpio_chip of_node pointer to that of the
struct pci_dev.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/gpio/gpio-pch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 34ed176..56c9be4 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -394,6 +394,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, chip);
 	spin_lock_init(&chip->spinlock);
 	pch_gpio_setup(chip);
+	chip->gpio.of_node = pdev->dev.of_node;
 	ret = gpiochip_add(&chip->gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "PCH gpio: Failed to register GPIO\n");
-- 
2.6.2
