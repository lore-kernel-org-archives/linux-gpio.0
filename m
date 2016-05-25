From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: copy per-pin driver private data to struct pin_desc
Date: Wed, 25 May 2016 14:09:31 +0900
Message-ID: <1464152971-11533-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Currently, struct pinctrl_pin_desc can have per-pin driver private
data, but it is not copied to struct pin_desc.

For a driver with sparse pin space, for-loop search like below would
be necessary in order to get the driver-specific data for a desired
pin number.

  for (i = 0; i < pctldev->desc->npins; i++)
          if (pin_number == pctldev->desc->pins[i].number)
                  return pctldev->desc->pins[i].drv_data;

This is not efficient for a driver with a large number of pins.
So, copy the data to struct pin_desc when each pin is registered
for the faster radix tree lookup.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/core.c | 22 ++++++++++++----------
 drivers/pinctrl/core.h |  2 ++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 03c08c1..fb38e20 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -225,13 +225,14 @@ static void pinctrl_free_pindescs(struct pinctrl_dev *pctldev,
 }
 
 static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
-				    unsigned number, const char *name)
+				    const struct pinctrl_pin_desc *pin)
 {
 	struct pin_desc *pindesc;
 
-	pindesc = pin_desc_get(pctldev, number);
+	pindesc = pin_desc_get(pctldev, pin->number);
 	if (pindesc != NULL) {
-		dev_err(pctldev->dev, "pin %d already registered\n", number);
+		dev_err(pctldev->dev, "pin %d already registered\n",
+			pin->number);
 		return -EINVAL;
 	}
 
@@ -245,10 +246,10 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 	pindesc->pctldev = pctldev;
 
 	/* Copy basic pin info */
-	if (name) {
-		pindesc->name = name;
+	if (pin->name) {
+		pindesc->name = pin->name;
 	} else {
-		pindesc->name = kasprintf(GFP_KERNEL, "PIN%u", number);
+		pindesc->name = kasprintf(GFP_KERNEL, "PIN%u", pin->number);
 		if (pindesc->name == NULL) {
 			kfree(pindesc);
 			return -ENOMEM;
@@ -256,9 +257,11 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 		pindesc->dynamic_name = true;
 	}
 
-	radix_tree_insert(&pctldev->pin_desc_tree, number, pindesc);
+	pindesc->drv_data = pin->drv_data;
+
+	radix_tree_insert(&pctldev->pin_desc_tree, pin->number, pindesc);
 	pr_debug("registered pin %d (%s) on %s\n",
-		 number, pindesc->name, pctldev->desc->name);
+		 pin->number, pindesc->name, pctldev->desc->name);
 	return 0;
 }
 
@@ -270,8 +273,7 @@ static int pinctrl_register_pins(struct pinctrl_dev *pctldev,
 	int ret = 0;
 
 	for (i = 0; i < num_descs; i++) {
-		ret = pinctrl_register_one_pin(pctldev,
-					       pins[i].number, pins[i].name);
+		ret = pinctrl_register_one_pin(pctldev, &pins[i]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index ca08723..747c423 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -134,6 +134,7 @@ struct pinctrl_setting {
  * @name: a name for the pin, e.g. the name of the pin/pad/finger on a
  *	datasheet or such
  * @dynamic_name: if the name of this pin was dynamically allocated
+ * @drv_data: driver-defined per-pin data. pinctrl core does not touch this
  * @mux_usecount: If zero, the pin is not claimed, and @owner should be NULL.
  *	If non-zero, this pin is claimed by @owner. This field is an integer
  *	rather than a boolean, since pinctrl_get() might process multiple
@@ -148,6 +149,7 @@ struct pin_desc {
 	struct pinctrl_dev *pctldev;
 	const char *name;
 	bool dynamic_name;
+	void *drv_data;
 	/* These fields only added when supporting pinmux drivers */
 #ifdef CONFIG_PINMUX
 	unsigned mux_usecount;
-- 
1.9.1
