From: Evan Green <evgreen@chromium.org>
Subject: [PATCH] pinctrl: msm: Pass along set_wake failures
Date: Tue, 19 Jun 2018 16:43:49 -0700
Message-ID: <20180619234349.166190-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: swboyd@chromium.org, Evan Green <evgreen@chromium.org>
List-Id: linux-gpio@vger.kernel.org

The MSM pinctrl driver quietly swallows errors that occur
when trying to call .irq_set_wake. It should instead pass
those failures up the chain so the caller can react to them.
Swallowing the error for instance causes gpio_keys to think that
it was able to successfully set a wake IRQ, when in fact it may
not have been, causing the following warning on resume:

[   53.777819] Unbalanced IRQ 9 wake disable
[   53.781979] WARNING: CPU: 0 PID: 1362 at kernel/irq/manage.c:623
irq_set_irq_wake+0xac/0x12c
[   53.794758] Modules linked in: spi_gpio spi_bitbang qcom_q6v5_pil
qcom_common cfg80211 ip6table_filter smsc95xx usbnet mii
[   54.016419] [<ffffff80081054b0>] irq_set_irq_wake+0xac/0x12c
[   54.022252] [<ffffff80083c86a4>] msm_gpio_irq_set_wake+0x48/0x68
[   54.028447] [<ffffff8008104d8c>] set_irq_wake_real+0x50/0x5c
[   54.034275] [<ffffff80081054d0>] irq_set_irq_wake+0xcc/0x12c
[   54.040104] [<ffffff800860fd00>] gpio_keys_resume+0x74/0xd8
[   54.045846] [<ffffff800852018c>] platform_pm_resume+0x54/0x60
[   54.051771] [<ffffff800852ceb4>] dpm_run_callback+0x104/0x210
[   54.057694] [<ffffff800852d7cc>] device_resume+0x178/0x1b0
[   54.063355] [<ffffff800852e938>] dpm_resume+0x1c4/0x38c
[   54.068745] [<ffffff800852efac>] dpm_resume_end+0x20/0x34
[   54.074315] [<ffffff80080fe700>] suspend_devices_and_enter+0x518/0x964
[   54.081044] [<ffffff80080ff1dc>] pm_suspend+0x690/0x6e0
[   54.086433] [<ffffff80080fd0f8>] state_store+0xd4/0xf8
[   54.091733] [<ffffff80088a3af0>] kobj_attr_store+0x18/0x28
[   54.097396] [<ffffff80082980a4>] sysfs_kf_write+0x5c/0x68
[   54.102961] [<ffffff8008297050>] kernfs_fop_write+0x174/0x1b8
[   54.108887] [<ffffff800821a9c0>] __vfs_write+0x58/0x160
[   54.114276] [<ffffff800821acd4>] vfs_write+0xcc/0x184
[   54.119487] [<ffffff800821af4c>] SyS_write+0x64/0xb4

Signed-off-by: Evan Green <evgreen@chromium.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 0e22f52b2a19..d48a74ddbc1f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -779,14 +779,15 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	unsigned long flags;
+	int rc;
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	irq_set_irq_wake(pctrl->irq, on);
+	rc = irq_set_irq_wake(pctrl->irq, on);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
-	return 0;
+	return rc;
 }
 
 static void msm_gpio_irq_handler(struct irq_desc *desc)
-- 
2.13.5
