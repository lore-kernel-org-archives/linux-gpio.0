From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH 1/3] pinctrl: core: create unlocked version of pinctrl_find_gpio_range_from_pin
Date: Sat, 20 Feb 2016 23:51:54 +0100
Message-ID: <1456008716-6236-2-git-send-email-manabian@gmail.com>
References: <1456008716-6236-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33811 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753038AbcBTWwS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2016 17:52:18 -0500
Received: by mail-lf0-f41.google.com with SMTP id j78so74018629lfb.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2016 14:52:17 -0800 (PST)
In-Reply-To: <1456008716-6236-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

pinctrl_find_gpio_range_from_pin takes the pctldev->mutex but so
does pinconf_pins_show and this will cause a deadlock if
pinctrl_find_gpio_range_from_pin is used in .pin_config_get
callback.

Create an unlocked version of pinctrl_find_gpio_range_from_pin to
allow pin to gpio lookup to be used from pinconf_pins_show.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
Hi Linus,

Here is traceback I got before I added this:
[  161.370000] cat             D 281b5275     0    23      1 0x00000000
[  161.370000] [<281b5275>] (__schedule) from [<281b5479>] (schedule+0x29/0x5c)
[  161.370000] [<281b5479>] (schedule) from [<281b54bb>] (schedule_preempt_disabled+0xf/0x18)
[  161.370000] [<281b54bb>] (schedule_preempt_disabled) from [<281b6401>] (__mutex_lock_slowpath+0x45/0xf8)
[  161.370000] [<281b6401>] (__mutex_lock_slowpath) from [<280b5ddb>] (pinctrl_find_gpio_range_from_pin+0x13/0x68)
[  161.370000] [<280b5ddb>] (pinctrl_find_gpio_range_from_pin) from [<280b8da9>] (lpc18xx_pconf_get+0x95/0x204)
[  161.370000] [<280b8da9>] (lpc18xx_pconf_get) from [<280b827b>] (pinconf_generic_dump_one+0xbb/0xcc)
[  161.370000] [<280b827b>] (pinconf_generic_dump_one) from [<280b8337>] (pinconf_generic_dump_pins+0x4f/0x54)
[  161.370000] [<280b8337>] (pinconf_generic_dump_pins) from [<280b7b01>] (pinconf_pins_show+0x8d/0xc0)
[  161.370000] [<280b7b01>] (pinconf_pins_show) from [<28068fb7>] (seq_read+0x7b/0x2bc)
[  161.370000] [<28068fb7>] (seq_read) from [<280547f3>] (SyS_read+0x2b/0x68)
[  161.370000] [<280547f3>] (SyS_read) from [<28008c61>] (ret_fast_syscall+0x1/0x4a)

 drivers/pinctrl/core.c | 25 ++++++++++++++++++-------
 drivers/pinctrl/core.h |  4 ++++
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2686a4450dfc..0c2cb883b18a 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -487,12 +487,11 @@ EXPORT_SYMBOL_GPL(pinctrl_get_group_pins);
  * @pin: a controller-local number to find the range for
  */
 struct pinctrl_gpio_range *
-pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
-				 unsigned int pin)
+__pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
+				   unsigned int pin)
 {
 	struct pinctrl_gpio_range *range;
 
-	mutex_lock(&pctldev->mutex);
 	/* Loop over the ranges */
 	list_for_each_entry(range, &pctldev->gpio_ranges, node) {
 		/* Check if we're in the valid range */
@@ -500,15 +499,27 @@ pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
 			int a;
 			for (a = 0; a < range->npins; a++) {
 				if (range->pins[a] == pin)
-					goto out;
+					return range;
 			}
 		} else if (pin >= range->pin_base &&
 			   pin < range->pin_base + range->npins)
-			goto out;
+			return range;
 	}
-	range = NULL;
-out:
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__pinctrl_find_gpio_range_from_pin);
+
+struct pinctrl_gpio_range *
+pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
+				 unsigned int pin)
+{
+	struct pinctrl_gpio_range *range;
+
+	mutex_lock(&pctldev->mutex);
+	range = __pinctrl_find_gpio_range_from_pin(pctldev, pin);
 	mutex_unlock(&pctldev->mutex);
+
 	return range;
 }
 EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin);
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index b24ea846c867..99bd8428542a 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -182,6 +182,10 @@ static inline struct pin_desc *pin_desc_get(struct pinctrl_dev *pctldev,
 	return radix_tree_lookup(&pctldev->pin_desc_tree, pin);
 }
 
+extern struct pinctrl_gpio_range *
+__pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
+				   unsigned int pin);
+
 int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
 			 bool dup);
 void pinctrl_unregister_map(struct pinctrl_map const *map);
-- 
1.8.0

