From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 3/3] gpio: davinci: Add support for multiple GPIO controllers
Date: Wed, 11 Jan 2017 10:30:41 +0530
Message-ID: <1484110841-2391-4-git-send-email-j-keerthy@ti.com>
References: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com
List-Id: linux-gpio@vger.kernel.org

Update GPIO driver to support Multiple GPIO controllers by updating
the base of subsequent GPIO chips with total of previous chips
gpio count so that gpio_add_chip gets unique numbers.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/gpio-davinci.c                | 4 +++-
 include/linux/platform_data/gpio-davinci.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 6c1c00a..1928de3 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -186,7 +186,7 @@ static int davinci_gpio_of_xlate(struct gpio_chip *gc,
 
 static int davinci_gpio_probe(struct platform_device *pdev)
 {
-	static int ctrl_num;
+	static int ctrl_num, bank_base;
 	int gpio, bank;
 	unsigned ngpio, nbank;
 	struct davinci_gpio_controller *chips;
@@ -240,6 +240,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->chip.set = davinci_gpio_set;
 
 	chips->chip.ngpio = ngpio;
+	chip->chip.base = bank_base;
 
 #ifdef CONFIG_OF_GPIO
 	chips->chip.of_gpio_n_cells = 2;
@@ -248,6 +249,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->chip.of_node = dev->of_node;
 #endif
 	spin_lock_init(&chips->lock);
+	bank_base += ngpio;
 
 	for (gpio = 0, bank = 0; gpio < ngpio; gpio += 32, bank++)
 		chips->regs[bank] = gpio_base + offset_array[bank];
diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
index ca09686..fd10f47 100644
--- a/include/linux/platform_data/gpio-davinci.h
+++ b/include/linux/platform_data/gpio-davinci.h
@@ -43,6 +43,7 @@ struct davinci_gpio_controller {
 	void __iomem		*regs[MAX_BANKS];
 	int			gpio_unbanked;
 	unsigned int		base_irq;
+	unsigned int		base;
 };
 
 /*
-- 
1.9.1
