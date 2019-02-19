From: Leonard Crestez <cdleonard@gmail.com>
Subject: [RFC] pinctrl/amd: Clear interrupt enable bits on probe
Date: Tue, 19 Feb 2019 12:59:15 +0200
Message-ID: <2155095e66a8b6329fa6b316b0e9ecd4b6d0c9bb.1550573871.git.cdleonard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Daniel Drake <drake@endlessm.com>, Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-gpio@vger.kernel.org

My Acer Nitro 5 AN515-42 laptop with a Ryzen 2700U hangs on boot because
of spurious interrupts from pinctrl-amd.

This seems to happen because the touchpad interrupt is enabled on boot
in "level" mode and there is no way to clear it until a touchpad driver
probes.

Fix by disabling all gpio interrupts at probe time until they are
explicitly requested by drivers.

Signed-off-by: Leonard Crestez <cdleonard@gmail.com>

---

It's strange that nobody else has run into this problem, AMD hardware is
relatively common. Maybe firmware generally disables GPIO interrupts
itself?

This patch fixes boot but this same laptop has other issues:

 * Suspend is broken
 * Ethernet is broken (only sometimes)
 * The CPU freq gets stuck at 400 Mhz (sometimes)

Those issues happen on maybe 80% of boots without a clear pattern. It
seems that inserting/removing the ethernet jack during boot helps
cpufreq? It's possible that these problems are also caused by pin
misconfiguration so this fix might be incomplete.

When the cpufreq issue happens `rdmsr 0xc0010061 -a` shows 0x22 for all
cpus; maybe this is some broken thermal throttling?

Also, perhaps amd_gpio_irq_disable_all should enumerate in a nicer less
verbose way?

Previously: https://lore.kernel.org/patchwork/patch/1028047/

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2a7d638978d8..3cb7ea46f32c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -592,10 +592,53 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return ret;
 }
 
+static void amd_gpio_irq_disable_all(struct amd_gpio *gpio_dev)
+{
+	unsigned int bank, i, pin_num;
+	u32 regval;
+
+	for (bank = 0; bank < gpio_dev->hwbank_num; bank++) {
+		switch (bank) {
+		case 0:
+			i = 0;
+			pin_num = AMD_GPIO_PINS_BANK0;
+			break;
+		case 1:
+			i = 64;
+			pin_num = AMD_GPIO_PINS_BANK1 + i;
+			break;
+		case 2:
+			i = 128;
+			pin_num = AMD_GPIO_PINS_BANK2 + i;
+			break;
+		case 3:
+			i = 192;
+			pin_num = AMD_GPIO_PINS_BANK3 + i;
+			break;
+		default:
+			/* Illegal bank number, ignore */
+			continue;
+		}
+
+		for (; i < pin_num; i++) {
+			unsigned long flags;
+			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+			regval = readl(gpio_dev->base + i * 4);
+			if (regval & BIT(INTERRUPT_ENABLE_OFF)) {
+				dev_info(&gpio_dev->pdev->dev,
+						"Pin %d interrupt enabled on boot: disable\n", i);
+				regval &= ~BIT(INTERRUPT_ENABLE_OFF);
+				writel(regval, gpio_dev->base + i * 4);
+			}
+			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+		}
+	}
+}
+
 static int amd_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
 
 	return gpio_dev->ngroups;
@@ -910,10 +953,12 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	ret = gpiochip_add_data(&gpio_dev->gc, gpio_dev);
 	if (ret)
 		return ret;
 
+	amd_gpio_irq_disable_all(gpio_dev);
+
 	ret = gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
 				0, 0, gpio_dev->gc.ngpio);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add pin range\n");
 		goto out2;
-- 
2.20.1
