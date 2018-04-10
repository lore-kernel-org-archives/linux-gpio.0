From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v3 1/2] gpiolib: do not add duplicated GPIO Pin ranges
Date: Tue, 10 Apr 2018 16:18:15 +0200
Message-ID: <20180410141816.30452-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

look if a GPIO range with the same ID has already
been registered.

For pinctrls that are set up through devicetree, the
GPIO Range might be already set by the the gpio-ranges
property.
(see Documentation/devicetree/bindings/gpio/gpio.txt)

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 drivers/gpio/gpiolib.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 43aeb07343ec..3882e1ff85fa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2069,6 +2069,19 @@ int gpiochip_generic_config(struct gpio_chip *chip, unsigned offset,
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
+static struct gpio_pin_range *gpiochip_find_by_id(struct gpio_chip *chip,
+						  unsigned int id)
+{
+	struct gpio_pin_range *pin_range;
+	struct gpio_device *gdev = chip->gpiodev;
+
+	list_for_each_entry(pin_range, &gdev->pin_ranges, node) {
+		if (pin_range->range.id == id)
+			return pin_range;
+	}
+	return NULL;
+}
+
 #ifdef CONFIG_PINCTRL
 
 /**
@@ -2086,6 +2099,20 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 	struct gpio_device *gdev = chip->gpiodev;
 	int ret;
 
+	/*
+	 * look if a GPIO range with the same ID has already been registered.
+	 * For pinctrls that are set up through devicetree, the GPIO Range
+	 * might be already set by the the gpio-ranges property.
+	 * (see Documentation/devicetree/bindings/gpio/gpio.txt)
+	 */
+	pin_range = gpiochip_find_by_id(chip, gpio_offset);
+	if (pin_range) {
+		chip_dbg(chip, "found existing GPIO range %d->%d - skipping\n",
+				gpio_offset,
+				gpio_offset + pin_range->range.npins - 1);
+		return 0;
+	}
+
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
 	if (!pin_range) {
 		chip_err(chip, "failed to allocate pin ranges\n");
@@ -2139,6 +2166,20 @@ int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 	struct gpio_device *gdev = chip->gpiodev;
 	int ret;
 
+	/*
+	 * look if a GPIO range with the same ID has already been registered.
+	 * For pinctrls that are set up through devicetree, the GPIO Range
+	 * might be already set by the the gpio-ranges property.
+	 * (see Documentation/devicetree/bindings/gpio/gpio.txt)
+	 */
+	pin_range = gpiochip_find_by_id(chip, gpio_offset);
+	if (pin_range) {
+		chip_dbg(chip, "found existing GPIO range %d->%d - skipping\n",
+			 gpio_offset,
+			 gpio_offset + pin_range->range.npins - 1);
+		return 0;
+	}
+
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
 	if (!pin_range) {
 		chip_err(chip, "failed to allocate pin ranges\n");
-- 
2.17.0
