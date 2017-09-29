From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH RFC 1/4] pinctrl: Factor out individual pin handling from pinmux_pins_show
Date: Fri, 29 Sep 2017 11:15:00 +0100
Message-ID: <20170929101503.6769-2-ckeepax@opensource.cirrus.com>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: linux-gpio@vger.kernel.org

Add a new helper function to be called for each pin rather than keeping
everything in the same function. Primarily this just reduces the code
indentation a bit.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/pinmux.c | 100 +++++++++++++++++++++++++----------------------
 1 file changed, 53 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 55502fc4479c..e76e6f6a79d6 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -555,12 +555,61 @@ static int pinmux_functions_show(struct seq_file *s, void *what)
 	return 0;
 }
 
-static int pinmux_pins_show(struct seq_file *s, void *what)
+static int pinmux_pin_show(struct seq_file *s, unsigned int pin)
 {
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
 	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
-	unsigned i, pin;
+	struct pin_desc *desc = pin_desc_get(pctldev, pin);
+	bool is_hog = false;
+
+	/* Skip if we cannot search the pin */
+	if (desc == NULL)
+		return 0;
+
+	if (desc->mux_owner &&
+	    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
+		is_hog = true;
+
+	if (pmxops->strict) {
+		if (desc->mux_owner)
+			seq_printf(s, "pin %d (%s): device %s%s",
+				   pin, desc->name, desc->mux_owner,
+				   is_hog ? " (HOG)" : "");
+		else if (desc->gpio_owner)
+			seq_printf(s, "pin %d (%s): GPIO %s",
+				   pin, desc->name, desc->gpio_owner);
+		else
+			seq_printf(s, "pin %d (%s): UNCLAIMED",
+				   pin, desc->name);
+	} else {
+		/* For non-strict controllers */
+		seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
+			   desc->mux_owner ? desc->mux_owner
+			   : "(MUX UNCLAIMED)",
+			   desc->gpio_owner ? desc->gpio_owner
+			   : "(GPIO UNCLAIMED)",
+			   is_hog ? " (HOG)" : "");
+	}
+
+	/* If mux: print function+group claiming the pin */
+	if (desc->mux_setting)
+		seq_printf(s, " function %s group %s\n",
+			   pmxops->get_function_name(pctldev,
+				desc->mux_setting->func),
+			   pctlops->get_group_name(pctldev,
+				desc->mux_setting->group));
+	else
+		seq_puts(s, "\n");
+
+	return 0;
+}
+
+static int pinmux_pins_show(struct seq_file *s, void *what)
+{
+	struct pinctrl_dev *pctldev = s->private;
+	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
+	unsigned int i;
 
 	if (!pmxops)
 		return 0;
@@ -576,51 +625,8 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 	mutex_lock(&pctldev->mutex);
 
 	/* The pin number can be retrived from the pin controller descriptor */
-	for (i = 0; i < pctldev->desc->npins; i++) {
-		struct pin_desc *desc;
-		bool is_hog = false;
-
-		pin = pctldev->desc->pins[i].number;
-		desc = pin_desc_get(pctldev, pin);
-		/* Skip if we cannot search the pin */
-		if (desc == NULL)
-			continue;
-
-		if (desc->mux_owner &&
-		    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
-			is_hog = true;
-
-		if (pmxops->strict) {
-			if (desc->mux_owner)
-				seq_printf(s, "pin %d (%s): device %s%s",
-					   pin, desc->name, desc->mux_owner,
-					   is_hog ? " (HOG)" : "");
-			else if (desc->gpio_owner)
-				seq_printf(s, "pin %d (%s): GPIO %s",
-					   pin, desc->name, desc->gpio_owner);
-			else
-				seq_printf(s, "pin %d (%s): UNCLAIMED",
-					   pin, desc->name);
-		} else {
-			/* For non-strict controllers */
-			seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
-				   desc->mux_owner ? desc->mux_owner
-				   : "(MUX UNCLAIMED)",
-				   desc->gpio_owner ? desc->gpio_owner
-				   : "(GPIO UNCLAIMED)",
-				   is_hog ? " (HOG)" : "");
-		}
-
-		/* If mux: print function+group claiming the pin */
-		if (desc->mux_setting)
-			seq_printf(s, " function %s group %s\n",
-				   pmxops->get_function_name(pctldev,
-					desc->mux_setting->func),
-				   pctlops->get_group_name(pctldev,
-					desc->mux_setting->group));
-		else
-			seq_printf(s, "\n");
-	}
+	for (i = 0; i < pctldev->desc->npins; i++)
+		pinmux_pin_show(s, pctldev->desc->pins[i].number);
 
 	mutex_unlock(&pctldev->mutex);
 
-- 
2.11.0
