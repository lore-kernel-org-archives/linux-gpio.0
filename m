From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] pinctrl: intel: merrifield: Distinguish protected and readonly families
Date: Tue, 24 Jan 2017 12:44:32 +0200
Message-ID: <20170124104432.16477-2-andriy.shevchenko@linux.intel.com>
References: <20170124104432.16477-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:60709 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750781AbdAXKog (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Jan 2017 05:44:36 -0500
In-Reply-To: <20170124104432.16477-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Family 7 (I2C) is a special read only area. We can't write any values
there, though read is possible.

Introduce readonly flag and distinguish such families from fully
protected ones. Allow read the configuration back and make it visible to
users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 46 +++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 4d4ef42a39b5..4c2be847b0bb 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -60,7 +60,8 @@
  * @barno: MMIO BAR number where registers for this family reside
  * @pin_base: Starting pin of pins in this family
  * @npins: Number of pins in this family
- * @protected: True if family is protected by access
+ * @protected: True if family is protected
+ * @readonly: True if family is read-only
  * @regs: family specific common registers
  */
 struct mrfld_family {
@@ -68,6 +69,7 @@ struct mrfld_family {
 	unsigned int pin_base;
 	size_t npins;
 	bool protected;
+	bool readonly;
 	void __iomem *regs;
 };
 
@@ -86,6 +88,14 @@ struct mrfld_family {
 		.protected = true,			\
 	}
 
+#define MRFLD_FAMILY_READONLY(b, s, e)			\
+	{						\
+		.barno = (b),				\
+		.pin_base = (s),			\
+		.npins = (e) - (s) + 1,			\
+		.readonly = true,			\
+	}
+
 static const struct pinctrl_pin_desc mrfld_pins[] = {
 	/* Family 0: OCP2SSC (0 pins) */
 	/* Family 1: ULPI (13 pins) */
@@ -392,7 +402,7 @@ static const struct mrfld_family mrfld_families[] = {
 	MRFLD_FAMILY(4, 57, 64),
 	MRFLD_FAMILY(5, 65, 78),
 	MRFLD_FAMILY(6, 79, 100),
-	MRFLD_FAMILY_PROTECTED(7, 101, 114),
+	MRFLD_FAMILY_READONLY(7, 101, 114),
 	MRFLD_FAMILY(8, 115, 126),
 	MRFLD_FAMILY(9, 127, 145),
 	MRFLD_FAMILY(10, 146, 157),
@@ -454,15 +464,18 @@ static const struct mrfld_family *mrfld_get_family(struct mrfld_pinctrl *mp,
 	return NULL;
 }
 
-static bool mrfld_buf_available(struct mrfld_pinctrl *mp, unsigned int pin)
+static int mrfld_buf_available(struct mrfld_pinctrl *mp, unsigned int pin)
 {
 	const struct mrfld_family *family;
 
 	family = mrfld_get_family(mp, pin);
 	if (!family)
-		return false;
+		return -EINVAL;
+
+	if (family->protected)
+		return -EACCES;
 
-	return !family->protected;
+	return family->readonly;
 }
 
 static void __iomem *mrfld_get_bufcfg(struct mrfld_pinctrl *mp, unsigned int pin)
@@ -509,8 +522,10 @@ static void mrfld_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
 	void __iomem *bufcfg;
 	u32 value, mode;
+	int ret;
 
-	if (!mrfld_buf_available(mp, pin)) {
+	ret = mrfld_buf_available(mp, pin);
+	if (ret < 0) {
 		seq_puts(s, "not available");
 		return;
 	}
@@ -586,13 +601,17 @@ static int mrfld_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	u32 mask = BUFCFG_PINMODE_MASK;
 	unsigned long flags;
 	unsigned int i;
+	int ret;
 
 	/*
 	 * All pins in the groups needs to be accessible and writable
 	 * before we can enable the mux for this group.
 	 */
 	for (i = 0; i < grp->npins; i++) {
-		if (!mrfld_buf_available(mp, grp->pins[i]))
+		ret = mrfld_buf_available(mp, grp->pins[i]);
+		if (ret < 0)
+			return ret;
+		if (ret > 0)
 			return -EBUSY;
 	}
 
@@ -613,8 +632,12 @@ static int mrfld_gpio_request_enable(struct pinctrl_dev *pctldev,
 	u32 bits = BUFCFG_PINMODE_GPIO << BUFCFG_PINMODE_SHIFT;
 	u32 mask = BUFCFG_PINMODE_MASK;
 	unsigned long flags;
+	int ret;
 
-	if (!mrfld_buf_available(mp, pin))
+	ret = mrfld_buf_available(mp, pin);
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
 		return -EBUSY;
 
 	raw_spin_lock_irqsave(&mp->lock, flags);
@@ -639,8 +662,10 @@ static int mrfld_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	u32 value, term;
 	u16 arg = 0;
+	int ret;
 
-	if (!mrfld_buf_available(mp, pin))
+	ret = mrfld_buf_available(mp, pin);
+	if (ret < 0)
 		return -ENOTSUPP;
 
 	value = readl(mrfld_get_bufcfg(mp, pin));
@@ -794,7 +819,8 @@ static int mrfld_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned int i;
 	int ret;
 
-	if (!mrfld_buf_available(mp, pin))
+	ret = mrfld_buf_available(mp, pin);
+	if (ret)
 		return -ENOTSUPP;
 
 	for (i = 0; i < nconfigs; i++) {
-- 
2.11.0

