From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] pinctrl: intel: Allow requesting pins which are in ACPI mode as GPIOs
Date: Wed, 21 Oct 2015 13:08:44 +0300
Message-ID: <1445422125-72075-3-git-send-email-mika.westerberg@linux.intel.com>
References: <1445422125-72075-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445422125-72075-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Reserved for ACPI actually means that in such case the GPIO hardware will
not update the interrupt status register (GPI_IS) even if the pin is
configured to trigger an interrupt. It will update GPI_GPE_STS instead and
does not trigger an interrupt.

Allow using such pins as GPIOs, only prevent their usage as interrupts.

We also rename function intel_pad_reserved_for_acpi() to be
intel_pad_acpi_mode() which reflects the actual meaning better.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 53e9ababdb95..88cd39d48902 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -160,8 +160,7 @@ static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
 	return !(readl(padown) & PADOWN_MASK(padno));
 }
 
-static bool intel_pad_reserved_for_acpi(struct intel_pinctrl *pctrl,
-					unsigned pin)
+static bool intel_pad_acpi_mode(struct intel_pinctrl *pctrl, unsigned pin)
 {
 	const struct intel_community *community;
 	unsigned padno, gpp, offset;
@@ -217,7 +216,6 @@ static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned pin)
 static bool intel_pad_usable(struct intel_pinctrl *pctrl, unsigned pin)
 {
 	return intel_pad_owned_by_host(pctrl, pin) &&
-		!intel_pad_reserved_for_acpi(pctrl, pin) &&
 		!intel_pad_locked(pctrl, pin);
 }
 
@@ -270,7 +268,7 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 	seq_printf(s, "0x%08x 0x%08x", cfg0, cfg1);
 
 	locked = intel_pad_locked(pctrl, pin);
-	acpi = intel_pad_reserved_for_acpi(pctrl, pin);
+	acpi = intel_pad_acpi_mode(pctrl, pin);
 
 	if (locked || acpi) {
 		seq_puts(s, " [");
@@ -737,6 +735,16 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 	if (!reg)
 		return -EINVAL;
 
+	/*
+	 * If the pin is in ACPI mode it is still usable as a GPIO but it
+	 * cannot be used as IRQ because GPI_IS status bit will not be
+	 * updated by the host controller hardware.
+	 */
+	if (intel_pad_acpi_mode(pctrl, pin)) {
+		dev_warn(pctrl->dev, "pin %u cannot be used as IRQ\n", pin);
+		return -EPERM;
+	}
+
 	spin_lock_irqsave(&pctrl->lock, flags);
 
 	value = readl(reg);
-- 
2.6.1
