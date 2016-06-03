From: Helmut Grohne <h.grohne@intenta.de>
Subject: [PATCH v2] gpio: zynq: initialize clock even without CONFIG_PM
Date: Fri, 3 Jun 2016 14:15:32 +0200
Message-ID: <20160603121526.GA23642@laureti-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.intenta.de ([194.31.246.158]:41732 "EHLO mail.intenta.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751509AbcFCMVD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 3 Jun 2016 08:21:03 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Helmut Buchsbaum <helmut.buchsbaum@gmail.com>

When the PM initialization was moved in the commit referenced below, the
code enabling the clock was removed from the probe function. On
CONFIG_PM=y kernels, this is not a problem as the pm resume hook enables
the clock, but when power management is disabled, all those pm_*
functions are noops and the clock is never enabled resulting in a
dysfunctional gpio controller.

Put the clock initialization back to support CONFIG_PM=n.

Signed-off-by: Helmut Grohne <h.grohne@intenta.de>
Fixes: 3773c195d387 ("gpio: zynq: Do PM initialization earlier to support gpio hogs")
---
 drivers/gpio/gpio-zynq.c | 7 +++++++
 1 file changed, 7 insertions(+)

Changes in v2: Rebased on 4.7-rc1.

On 06/02/2016 02:30 PM, Linus Walleij wrote:
> Sould it be tagged for stable and sent to fixes?

I already asked this question in my initial patch posting, because I am
unsure. If you deem CONFIG_PM=n and gpio-zynq a common configuration,
then the answer probably is "yes".

The patch that makes the rebase non-trivial, is 615d23f80efc ("gpio:
zynq: Fix the error path"). If you deem CONFIG_PM=y and gpio-zynq a
common configuration, then this patch likely should also go to stable.

Both of them fix regressions in 3773c195d387 ("gpio: zynq: Do PM
initialization earlier to support gpio hogs"), which was introduced in
4.4, so stable trees earlier than that don't need these patches.

Please note that this rebased patch is only compile tested, because some
required drivers broke with 4.7-rc1. If you are reluctant to apply the
patch under this condition, I can report back after fixing drivers.
Posting the updated patch anyway in case the other Helmut wants to test
it.

Helmut

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 75c6355..e72794e 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -709,7 +709,13 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "input clock not found.\n");
 		return PTR_ERR(gpio->clk);
 	}
+	ret = clk_prepare_enable(gpio->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return ret;
+	}
 
+	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
@@ -747,6 +753,7 @@ err_pm_put:
 	pm_runtime_put(&pdev->dev);
 err_pm_dis:
 	pm_runtime_disable(&pdev->dev);
+	clk_disable_unprepare(gpio->clk);
 
 	return ret;
 }
-- 
2.1.4

