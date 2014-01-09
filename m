From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio: davinci: signedness bug in davinci_gpio_irq_setup()
Date: Thu, 9 Jan 2014 08:28:03 +0300
Message-ID: <20140109052803.GA1265@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

"irq" needs to be signed for the error handling to work.

Fixes: 6075a8b2b6c3 ('gpio: davinci: don't create irq_domain in case of unbanked irqs')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 7629b4f12b7f..b0e98d379217 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -423,7 +423,7 @@ static const struct irq_domain_ops davinci_gpio_irq_ops = {
 
 static int davinci_gpio_irq_setup(struct platform_device *pdev)
 {
-	unsigned	gpio, irq, bank;
+	unsigned	gpio, bank;
 	struct clk	*clk;
 	u32		binten = 0;
 	unsigned	ngpio, bank_irq;
@@ -433,6 +433,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	struct davinci_gpio_platform_data *pdata = dev->platform_data;
 	struct davinci_gpio_regs __iomem *g;
 	struct irq_domain	*irq_domain = NULL;
+	int		irq;
 
 	ngpio = pdata->ngpio;
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
