From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] pinctrl: cherryview: Prevent possible interrupt storm on resume
Date: Mon, 31 Oct 2016 16:57:33 +0200
Message-ID: <20161031145734.193016-2-mika.westerberg@linux.intel.com>
References: <20161031145734.193016-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161031145734.193016-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Steiner <christian.steiner@outlook.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When the system is suspended to S3 the BIOS might re-initialize certain
GPIO pins back to their original state or it may re-program interrupt mask
of others. For example Acer TravelMate B116-M had BIOS bug where certain
GPIO pin (MF_ISH_GPIO_5) was programmed to trigger on high level, and the
pin state was high once the BIOS gave control to the OS on resume.

This triggers lots of messages like:

 irq 117, desc: ffff88017a61e600, depth: 1, count: 0, unhandled: 0
 ->handle_irq():  ffffffff8109b613, handle_bad_irq+0x0/0x1e0
 ->irq_data.chip(): ffffffffa0020180, chv_pinctrl_exit+0x2d84/0x12 [pinctrl_cherryview]
 ->action():           (null)
    IRQ_NOPROBE set

We reset the mask back to known state in chv_pinctrl_resume() but that is
called only after device interrupts have already been enabled.

Now, this particular issue was fixed by upgrading the BIOS to the latest
(v1.23) but not everybody upgrades their BIOSes so we fix it up in the
driver as well.

Prevent the possible interrupt storm by moving suspend and resume hooks to
be called at _noirq time instead. Since device interrupts are still
disabled we can restore the mask back to known state before interrupt storm
happens.

Reported-by: Christian Steiner <christian.steiner@outlook.de>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 097d835b3a50..c43b1e9a06af 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1652,7 +1652,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int chv_pinctrl_suspend(struct device *dev)
+static int chv_pinctrl_suspend_noirq(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
@@ -1686,7 +1686,7 @@ static int chv_pinctrl_suspend(struct device *dev)
 	return 0;
 }
 
-static int chv_pinctrl_resume(struct device *dev)
+static int chv_pinctrl_resume_noirq(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
@@ -1746,7 +1746,8 @@ static int chv_pinctrl_resume(struct device *dev)
 #endif
 
 static const struct dev_pm_ops chv_pinctrl_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(chv_pinctrl_suspend, chv_pinctrl_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(chv_pinctrl_suspend_noirq,
+				      chv_pinctrl_resume_noirq)
 };
 
 static const struct acpi_device_id chv_pinctrl_acpi_match[] = {
-- 
2.9.3
