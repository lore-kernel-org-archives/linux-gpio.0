From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 08/39] gpio: remove DEFINE_PCI_DEVICE_TABLE macro
Date: Tue, 03 Dec 2013 08:08:45 +0900
Message-ID: <001d01ceefb3$733b8cb0$59b2a610$%han@samsung.com>
References: <001501ceefb1$69c96820$3d5c3860$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33059 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753237Ab3LBXIq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2013 18:08:46 -0500
In-reply-to: <001501ceefb1$69c96820$3d5c3860$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Don't use DEFINE_PCI_DEVICE_TABLE macro, because this macro
is not preferred.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-amd8111.c   |    2 +-
 drivers/gpio/gpio-bt8xx.c     |    2 +-
 drivers/gpio/gpio-intel-mid.c |    2 +-
 drivers/gpio/gpio-ml-ioh.c    |    2 +-
 drivers/gpio/gpio-pch.c       |    2 +-
 drivers/gpio/gpio-sodaville.c |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 710fafc..94e9992 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -60,7 +60,7 @@
  * register a pci_driver, because someone else might one day
  * want to register another driver on the same PCI id.
  */
-static DEFINE_PCI_DEVICE_TABLE(pci_tbl) = {
+static const struct pci_device_id pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8111_SMBUS), 0 },
 	{ 0, },	/* terminate list */
 };
diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 9dfe36f..c5c356b 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -308,7 +308,7 @@ static int bt8xxgpio_resume(struct pci_dev *pdev)
 #define bt8xxgpio_resume NULL
 #endif /* CONFIG_PM */
 
-static DEFINE_PCI_DEVICE_TABLE(bt8xxgpio_pci_tbl) = {
+static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT848) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT849) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT878) },
diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index be803af..24c2f61 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -275,7 +275,7 @@ static const struct intel_mid_gpio_ddata gpio_tangier = {
 	.chip_irq_type = INTEL_MID_IRQ_TYPE_EDGE,
 };
 
-static DEFINE_PCI_DEVICE_TABLE(intel_gpio_ids) = {
+static const struct pci_device_id intel_gpio_ids[] = {
 	{
 		/* Lincroft */
 		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x080f),
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 6da6d76..5c94af3 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -596,7 +596,7 @@ static int ioh_gpio_resume(struct pci_dev *pdev)
 #define ioh_gpio_resume NULL
 #endif
 
-static DEFINE_PCI_DEVICE_TABLE(ioh_gpio_pcidev_id) = {
+static const struct pci_device_id ioh_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x802E) },
 	{ 0, }
 };
diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 0fec097..ef7a756 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -518,7 +518,7 @@ static int pch_gpio_resume(struct pci_dev *pdev)
 #endif
 
 #define PCI_VENDOR_ID_ROHM             0x10DB
-static DEFINE_PCI_DEVICE_TABLE(pch_gpio_pcidev_id) = {
+static const struct pci_device_id pch_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x8803) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8014) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8043) },
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 88f374a..5d171e0 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -270,7 +270,7 @@ static void sdv_gpio_remove(struct pci_dev *pdev)
 	kfree(sd);
 }
 
-static DEFINE_PCI_DEVICE_TABLE(sdv_gpio_pci_ids) = {
+static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
 	{ 0, },
 };
-- 
1.7.10.4


