From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: dwc3: pci: Switch to devm_acpi_dev_add_driver_gpios()
Date: Wed, 22 Mar 2017 16:08:07 +0200
Message-ID: <20170322140807.34332-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:57731 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934505AbdCVOL3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Mar 2017 10:11:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Switch to use managed variant of acpi_dev_add_driver_gpios() to simplify
error path and fix potentially wrong assignment if ->probe() fails.

While here, add a debug message in case assignment fails to allow user
see the cause of a potential issue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

 Linus, according to preliminary agreement with Felipe it may go through
 GPIO subsystem instead of pulling from it.

 drivers/usb/dwc3/dwc3-pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index cce0a220b6b0..a15ec71d0423 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -125,8 +125,10 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc)
 		if (pdev->device == PCI_DEVICE_ID_INTEL_BYT) {
 			struct gpio_desc *gpio;
 
-			acpi_dev_add_driver_gpios(ACPI_COMPANION(&pdev->dev),
+			ret = devm_acpi_dev_add_driver_gpios(&pdev->dev,
 					acpi_dwc3_byt_gpios);
+			if (ret)
+				dev_dbg(&pdev->dev, "failed to add mapping table\n");
 
 			/*
 			 * These GPIOs will turn on the USB2 PHY. Note that we have to
@@ -242,7 +244,6 @@ static void dwc3_pci_remove(struct pci_dev *pci)
 
 	device_init_wakeup(&pci->dev, false);
 	pm_runtime_get(&pci->dev);
-	acpi_dev_remove_driver_gpios(ACPI_COMPANION(&pci->dev));
 	platform_device_unregister(dwc->dwc3);
 }
 
-- 
2.11.0

