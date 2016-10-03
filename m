From: ville.syrjala@linux.intel.com
Subject: [PATCH] pinctrl: baytrail: Fix lockdep
Date: Mon,  3 Oct 2016 17:56:55 +0300
Message-ID: <1475506615-31963-1-git-send-email-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Cristina Ciocan <cristina.ciocan@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialize the spinlock before using it.

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 2 PID: 1 Comm: swapper/0 Not tainted 4.8.0-dwc-bisect #4
Hardware name: Intel Corp. VALLEYVIEW C0 PLATFORM/BYT-T FFD8, BIOS BLAKFF81.X64.0088.R10.1403240443 FFD8_X64_R_2014_13_1_00 03/24/2014
 0000000000000000 ffff8800788ff770 ffffffff8133d597 0000000000000000
 0000000000000000 ffff8800788ff7e0 ffffffff810cfb9e 0000000000000002
 ffff8800788ff7d0 ffffffff8205b600 0000000000000002 ffff8800788ff7f0
Call Trace:
 [<ffffffff8133d597>] dump_stack+0x67/0x90
 [<ffffffff810cfb9e>] register_lock_class+0x52e/0x540
 [<ffffffff810d2081>] __lock_acquire+0x81/0x16b0
 [<ffffffff810cede1>] ? save_trace+0x41/0xd0
 [<ffffffff810d33b2>] ? __lock_acquire+0x13b2/0x16b0
 [<ffffffff810cf05a>] ? __lock_is_held+0x4a/0x70
 [<ffffffff810d3b1a>] lock_acquire+0xba/0x220
 [<ffffffff8136f1fe>] ? byt_gpio_get_direction+0x3e/0x80
 [<ffffffff81631567>] _raw_spin_lock_irqsave+0x47/0x60
 [<ffffffff8136f1fe>] ? byt_gpio_get_direction+0x3e/0x80
 [<ffffffff8136f1fe>] byt_gpio_get_direction+0x3e/0x80
 [<ffffffff813740a9>] gpiochip_add_data+0x319/0x7d0
 [<ffffffff81631723>] ? _raw_spin_unlock_irqrestore+0x43/0x70
 [<ffffffff8136fe3b>] byt_pinctrl_probe+0x2fb/0x620
 [<ffffffff8142fb0c>] platform_drv_probe+0x3c/0xa0
...

Based on the diff it looks like the problem was introduced in
commit 71e6ca61e826 ("pinctrl: baytrail: Register pin control handling")
but I wasn't able to verify that empirically as the parent commit
just oopsed when I tried to boot it.

Cc: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: stable@vger.kernel.org
Fixes: 71e6ca61e826 ("pinctrl: baytrail: Register pin control handling")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index d22a9fe2e6df..71bbeb9321ba 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1808,6 +1808,8 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(vg->pctl_dev);
 	}
 
+	raw_spin_lock_init(&vg->lock);
+
 	ret = byt_gpio_probe(vg);
 	if (ret) {
 		pinctrl_unregister(vg->pctl_dev);
@@ -1815,7 +1817,6 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, vg);
-	raw_spin_lock_init(&vg->lock);
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-- 
2.7.4
