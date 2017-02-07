From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: pci-idio-16: Fix PCI device ID code
Date: Tue, 7 Feb 2017 11:51:19 -0500
Message-ID: <20170207165119.GA13838@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The ACCES PCI-IDIO-16 has a PCI device ID code of 0x0DC8. It is
incorrect to use the PCI device ID code of the ACCES PCI-IIRO-8
(0x0F00). This patch fixes the said PCI device ID code mismatch.

Fixes: 02e74fc0401a ("gpio: Add GPIO support for the ACCES PCI-IDIO-16")
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-pci-idio-16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 0220787240ce..b10f3cf7044a 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -331,7 +331,7 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 static const struct pci_device_id idio_16_pci_dev_id[] = {
-	{ PCI_DEVICE(0x494F, 0x0F00) }, { 0 }
+	{ PCI_DEVICE(0x494F, 0x0DC8) }, { 0 }
 };
 MODULE_DEVICE_TABLE(pci, idio_16_pci_dev_id);
 
-- 
2.11.1
