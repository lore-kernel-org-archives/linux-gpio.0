From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] pinctrl: baytrail: fix some error handling in debugfs
Date: Wed, 27 Apr 2016 11:08:35 +0300
Message-ID: <20160427080835.GB22469@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

We need to unlock before continuing.  Also the continue was accidentally
left out on one error path which would lead to a NULL dereference.

Fixes: 86e3ef812fe3 ('pinctrl: baytrail: Update gpio chip operations')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 6dcf43a..55182fc 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1390,6 +1390,7 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			seq_printf(s,
 				   "Could not retrieve pin %i conf0 reg\n",
 				   pin);
+			raw_spin_unlock_irqrestore(&vg->lock, flags);
 			continue;
 		}
 		conf0 = readl(reg);
@@ -1398,6 +1399,8 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		if (!reg) {
 			seq_printf(s,
 				   "Could not retrieve pin %i val reg\n", pin);
+			raw_spin_unlock_irqrestore(&vg->lock, flags);
+			continue;
 		}
 		val = readl(reg);
 		raw_spin_unlock_irqrestore(&vg->lock, flags);
