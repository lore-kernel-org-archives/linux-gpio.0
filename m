From: kbuild test robot <fengguang.wu@intel.com>
Subject: [PATCH next] altera_gpio_probe() can be static
Date: Thu, 19 Mar 2015 17:40:02 +0800
Message-ID: <20150319094002.GA4717@lkp-sb04>
References: <201503191721.tDh6DZLK%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201503191721.tDh6DZLK%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild-all@01.org, Tien Hock Loh <thloh@altera.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 gpio-altera.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 4d41196..449fb46 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -256,7 +256,7 @@ static void altera_gpio_irq_leveL_high_handler(unsigned int irq,
 	chained_irq_exit(chip, desc);
 }
 
-int altera_gpio_probe(struct platform_device *pdev)
+static int altera_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	int reg, ret;
