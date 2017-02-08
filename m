From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: pci-idio-16: Fix PCI BAR index
Date: Wed, 8 Feb 2017 08:32:46 -0500
Message-ID: <20170208133246.GA16610@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The PCI BAR0 and BAR1 for the PCI-IDIO-16 hold information for the PLX
9052 bridge chip on the device. The PCI BAR2 holds the necessary base
address for I/O control of the PCI-IDIO-16. This patch corrects the PCI
BAR index mismatch for the PCI-IDIO-16 GPIO driver.

Fixes: 02e74fc0401a ("gpio: Add GPIO support for the ACCES PCI-IDIO-16")
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-pci-idio-16.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 0220787240ce..f510672c9c6e 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -265,6 +265,7 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct device *const dev = &pdev->dev;
 	struct idio_16_gpio *idio16gpio;
 	int err;
+	const size_t pci_bar_index = 2;
 	const char *const name = pci_name(pdev);
 
 	idio16gpio = devm_kzalloc(dev, sizeof(*idio16gpio), GFP_KERNEL);
@@ -277,13 +278,13 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 	}
 
-	err = pcim_iomap_regions(pdev, 0x1, name);
+	err = pcim_iomap_regions(pdev, BIT(pci_bar_index), name);
 	if (err) {
 		dev_err(dev, "Unable to map PCI I/O addresses (%d)\n", err);
 		return err;
 	}
 
-	idio16gpio->reg = pcim_iomap_table(pdev)[0];
+	idio16gpio->reg = pcim_iomap_table(pdev)[pci_bar_index];
 
 	/* Deactivate input filters */
 	iowrite8(0, &idio16gpio->reg->filter_ctl);
-- 
2.11.1
