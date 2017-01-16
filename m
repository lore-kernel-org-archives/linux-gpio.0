From: Augusto Mecking Caringi <augustocaringi@gmail.com>
Subject: [PATCH] gpio: intel-mid: Fix build warning when !CONFIG_PM
Date: Mon, 16 Jan 2017 14:30:41 +0000
Message-ID: <1484577077-13418-1-git-send-email-augustocaringi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35709 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750817AbdAPObe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2017 09:31:34 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Augusto Mecking Caringi <augustocaringi@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The only usage of function intel_gpio_runtime_idle() is here (in the
same file):

static const struct dev_pm_ops intel_gpio_pm_ops = {
	SET_RUNTIME_PM_OPS(NULL, NULL, intel_gpio_runtime_idle)
};

And when CONFIG_PM is not set, the macro SET_RUNTIME_PM_OPS expands to
nothing, causing the following compiler warning:

drivers/gpio/gpio-intel-mid.c:324:12: warning: ‘intel_gpio_runtime_idle’
defined but not used [-Wunused-function]
static int intel_gpio_runtime_idle(struct device *dev)

Fix it by annotating the function with __maybe_unused.

Signed-off-by: Augusto Mecking Caringi <augustocaringi@gmail.com>
---
 drivers/gpio/gpio-intel-mid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index a1e44c2..b76ecee 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -321,7 +321,7 @@ static void intel_mid_irq_init_hw(struct intel_mid_gpio *priv)
 	}
 }
 
-static int intel_gpio_runtime_idle(struct device *dev)
+static int __maybe_unused intel_gpio_runtime_idle(struct device *dev)
 {
 	int err = pm_schedule_suspend(dev, 500);
 	return err ?: -EBUSY;
-- 
2.7.4

