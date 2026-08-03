Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BA53B636A;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776206; cv=none; b=HWmlGYj0r2l6T8cchthG5NBP4hbhxlA9kEFre3+YdjgXA0R5Xsb96A+y+SlSzAhjtSKQpXFGLwthIc3cTJlWU/OjF0iivXjqAZ6M6Vp/CKGftYP1L2gQR4kc/X+ctPEFpqR+vspyE7DdgaOVVVdgL+baINYKHKGh0DdGdmL1HPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776206; c=relaxed/simple;
	bh=GspN0DMpb0/6pWqDquTQ23Bwwrp2YcUGDAwFcJac9HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DAJAe1xhrMgCmE9uad3nhaYGWiO7DaqXxgID2q27tO8jQVFCp1ctlSfSeaKKjb4GQBhMQc8FmMI+f4RLcW3zhbUjdp7sgknipPeu2tMkHfRrWqyzHVG3I9gUrJ/0ucJgDaH9fw45QsKC0DkJw6LQWiVvhxx3mDo1cTpNonB8T2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjSTP51G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjSTP51G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 172ACC4AF16;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785776206;
	bh=GspN0DMpb0/6pWqDquTQ23Bwwrp2YcUGDAwFcJac9HY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fjSTP51GPvewHyU4suo8hPE5Ll/xIe0R/2idA5zn3QdVdJ8RmSEDk7XJpZ93TKA34
	 /j11Os6NPDlr8Fq02wymkXTQozFBRJU39RqhGS4g4ivEvOTXaK5OBcaLZPUc5GI9ty
	 S8eJJrcOqtqWkOzZHZ+4bGIxZkiDAvhrvbSCmu8x7Su19RCeMhZcTHSUzg+d7a6oeR
	 nvLR5bFIvnkagsiGOwm00VdqEAF0nrfGJDfUC941VvFk10qWlwqs0875MKAimzRpAR
	 rtTxARiu2+1XqdAvcxHfHiFxmknplX++PerAu9NwrgX7bBmT5dL9d7ccFojRrzziXO
	 QoczQkp3ViP0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B1CC55184;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 00:55:55 +0800
Subject: [PATCH RFC v5 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ls2kbmc-mod-v5-7-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
In-Reply-To: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8716;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=k8JeTOimLAHg5/j5YnQsU12otCL9zLZnrtg1hbM1eng=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcMhK5yVam0ft3wH0Rb0rcCIL4VS/8gGRSuYS/
 /t1al508cCJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanDISgAKCRCwMePKe/7Z
 bhIRD/4uYdFXuAdGbBS16E0cOJ/oG/QHDLONGwCXyfp6aC1dfUmjqouBzXNSwx7GVMELM2Jg6O5
 XINlY/UZm8TtsVHwt4YcOsssWPu3SlK7QAwOJ24hYL9MXtNRv/KpONgzwSk671JELKxgWO9UMKo
 iNE+bL7HOq2cRRkHWqrg5bdYklDGPBGn7wPULtOxwJwkXCmaNyX96UykcPNb6r14/Wdv8/YlCCo
 11wgmjoXt0Q7FsXNoDPRcVGQ9EtLxNxApBJyuF51HDxzCWmpP51v15mhLGU45YQGdKQ5k8YH4cw
 RNkyIrFw8hCLDEF27ZQHFNW7omqY7GySZNZ1yrwkYbRnK4qfnvA3xlCwj3dVkY98L3LWg4psKsT
 YNqlj01wuYRHP8quFlfKEoTwm7Yw2GjK7MZpnkuu8KVUNZbxFGjYT1c/11u0BVCFTkdJwqwCsRC
 hTbYRkP0WjuOhBTlQCyaBHiKbMAIEfzurkE1JeZdT+27pxk8mm4+IOLFS9bX0Ta4hYNwjAsyIXy
 +ce/WrAlbIE+6isPBCuJESVe40ToXGvz8l1H7rsUVc4CUu5/tVcfAcsla1YHoLkMET3iFEYSYb/
 08gsL343r0Zg1cNKkSlGgdusohiFNF55axK+haPFBsMcLrcpKGIjV48By+gexqrdGLjkTJMWUuk
 /O9CqXtJHHOOORg==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

The reset event of BMC is captured through GPIO. However, this driver
bypasses the GPIO framework and directly accesses the GPIO controller
through the fixed address. When the same GPIO controller is also
exposed through ACPI and probed by the corresponding GPIO driver,
there would be a conflict between the two drivers.

This patch will try to find the GPIO through declared GPIO pin in the
_CRS resources of the ACPI node. If no such delaration is found, the
driver will fall back to search for the correct GPIO controller and pin
according to the fixed address and pin number. A possible DSDT
declaration for the GPIO pin might be as follows:

    Device (BMC0) {
        Name (_ADR, ...) // Match the PCI address of the BMC device
        // \_SB.GPO1 is the ACPI path of the GPIO controller
        Name (_CRS, ResourceTemplate () {
            GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
                     "\\_SB.GPO1", 0) {
                14 // 14 is the GPIO pin number
            }
    }

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 163 +++++++++++++++++++++++++++++++-------------
 1 file changed, 116 insertions(+), 47 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index e7bebfe696ac4554eb6283279811a27ed865ab73..97a666a136fe41ed4268cb70770201533aebb1d5 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -26,6 +26,10 @@
 #include <linux/stop_machine.h>
 #include <linux/vt_kern.h>
 #include <linux/console.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/property.h>
+#include <linux/gpio/machine.h>
 
 /* LS2K BMC resources */
 #define LS2K_DISPLAY_RES_START		(SZ_16M + SZ_2M)
@@ -81,18 +85,6 @@
 
 #define PCI_REG_STRIDE			0x4
 
-#define LS2K_BMC_RESET_GPIO		14
-#define LOONGSON_GPIO_REG_BASE		0x1FE00500
-#define LOONGSON_GPIO_REG_SIZE		0x18
-#define LOONGSON_GPIO_OEN		0x0
-#define LOONGSON_GPIO_FUNC		0x4
-#define LOONGSON_GPIO_INTPOL		0x10
-#define LOONGSON_GPIO_INTEN		0x14
-
-#define LOONGSON_IO_INT_BASE		16
-#define LS2K_BMC_RESET_GPIO_INT_VEC	(LS2K_BMC_RESET_GPIO % 8)
-#define LS2K_BMC_RESET_GPIO_GSI		(LOONGSON_IO_INT_BASE + LS2K_BMC_RESET_GPIO_INT_VEC)
-
 enum {
 	LS2K_BMC_DISPLAY,
 	LS2K_BMC_IPMI0,
@@ -186,6 +178,7 @@ struct ls2k_bmc_ddata {
 	struct work_struct bmc_reset_work;
 	struct ls2k_bmc_pci_data bmc_pci_data;
 	struct ls2k_bmc_bridge_pci_data bridge_pci_data;
+	struct gpio_desc *reset_gpio;
 };
 
 static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *pdev)
@@ -375,6 +368,91 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_ddata *
 	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.interrupt_line);
 }
 
+static struct fwnode_handle *gpio_dev_get_fwnode(struct gpio_device *gdev)
+{
+	struct device *gdev_dev;
+
+	gdev_dev = gpio_device_to_device(gdev);
+	return dev_fwnode(gdev_dev);
+}
+
+static int ls2k_bmc_gpiochip_find(struct gpio_chip *gc, const void *data)
+{
+	struct acpi_device *adev;
+	struct list_head resource_list;
+	struct resource_entry *rentry;
+	struct fwnode_handle *fwnode = gpio_dev_get_fwnode(gc->gpiodev);
+	phys_addr_t start_addr = (phys_addr_t) data;
+	int ret, found = 0;
+
+	if (!is_acpi_node(fwnode))
+		goto out;
+
+	adev = to_acpi_device_node(fwnode);
+	if (!adev)
+		goto out;
+
+	INIT_LIST_HEAD(&resource_list);
+
+	ret = acpi_dev_get_memory_resources(adev, &resource_list);
+	if (ret < 0)
+		goto out;
+	/*
+	 * ACPI memory resources are ordered and only the first one is
+	 * considered by the driver of the expected GPIO controller. So
+	 * here we also only check the first one to see if it matches the
+	 * expected address.
+	 */
+	rentry = list_first_entry_or_null(&resource_list, struct resource_entry, node);
+	if (!rentry)
+		goto free_resource_list;
+	if (rentry->res->start == start_addr)
+		found = 1;
+
+free_resource_list:
+	acpi_dev_free_resource_list(&resource_list);
+out:
+	return found;
+}
+
+static struct gpio_desc *ls2k_bmc_find_gpio(struct ls2k_bmc_ddata *ddata)
+{
+	/*
+	 * In conventional way, the GPIO should be obtained through ACPI or
+	 * device tree. However, when the information is not available,
+	 * we should find the GPIO according to the convention of the server
+	 * boards with LS2K BMC, the gpio signal reflecting the reset event
+	 * of the BMC should be connected to pin 14 of the GPIO input of
+	 * the first CPU node. The address of that GPIO controller is fixed.
+	 */
+	static const phys_addr_t LOONGSON_GPIO_REG_BASE = 0x1FE00500;
+	static const unsigned int LS2K_BMC_RESET_GPIO = 14;
+	int ret;
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
+	struct property_entry ls2k_bmc_swnode_properties[2] = { 0 };
+
+	dev_dbg(ddata->dev, "Searching for GPIO chip at address %pa\n", &LOONGSON_GPIO_REG_BASE);
+
+	gdev = gpio_device_find((void *)LOONGSON_GPIO_REG_BASE, ls2k_bmc_gpiochip_find);
+
+	if (!gdev) {
+		dev_dbg(ddata->dev, "cannot find GPIO chip at address %pa, deferring\n",
+			&LOONGSON_GPIO_REG_BASE);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	ls2k_bmc_swnode_properties[0] = PROPERTY_ENTRY_GPIO("gpio",
+		gpio_dev_get_fwnode(gdev), LS2K_BMC_RESET_GPIO, GPIO_ACTIVE_HIGH);
+
+	ret = device_create_managed_software_node(ddata->dev, ls2k_bmc_swnode_properties, NULL);
+	if (ret) {
+		dev_err(ddata->dev, "Failed to create software node for GPIO reset: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	return devm_gpiod_get_index(ddata->dev, NULL, 0, GPIOD_IN);
+}
+
 static void ls2k_bmc_cancel_wq(void *data)
 {
 	struct ls2k_bmc_ddata *ddata = data;
@@ -384,8 +462,7 @@ static void ls2k_bmc_cancel_wq(void *data)
 static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 {
 	struct pci_dev *pdev = to_pci_dev(ddata->dev);
-	void __iomem *gpio_base;
-	int gpio_irq, ret, val;
+	int gpio_irq, ret;
 
 	ls2k_bmc_save_pci_data(pdev, ddata);
 
@@ -402,44 +479,36 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 		return ret;
 	}
 
-	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
-	if (!gpio_base)
-		return -ENOMEM;
-
-	/* Disable GPIO output */
-	val = readl(gpio_base + LOONGSON_GPIO_OEN);
-	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_OEN);
-
-	/* Enable GPIO functionality */
-	val = readl(gpio_base + LOONGSON_GPIO_FUNC);
-	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_FUNC);
-
-	/* Set GPIO interrupts to low-level active */
-	val = readl(gpio_base + LOONGSON_GPIO_INTPOL);
-	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTPOL);
-
-	/* Enable GPIO interrupts */
-	val = readl(gpio_base + LOONGSON_GPIO_INTEN);
-	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTEN);
+	ddata->reset_gpio = devm_gpiod_get_index_optional(&pdev->dev, NULL, 0, GPIOD_IN);
+	if (IS_ERR(ddata->reset_gpio)) {
+		ret = PTR_ERR(ddata->reset_gpio);
+		ddata->reset_gpio = NULL;
+		return dev_err_probe(ddata->dev, ret, "Failed to get GPIO pin for reset signal\n");
+	}
+	if (ddata->reset_gpio == NULL) {
+		ddata->reset_gpio = ls2k_bmc_find_gpio(ddata);
+		if (IS_ERR(ddata->reset_gpio)) {
+			ret = PTR_ERR(ddata->reset_gpio);
+			ddata->reset_gpio = NULL;
+			return dev_err_probe(ddata->dev, ret,
+					     "Failed to find GPIO pin for reset signal\n");
+		}
+	}
 
-	iounmap(gpio_base);
+	gpio_irq = gpiod_to_irq(ddata->reset_gpio);
 
-	/*
-	 * Since gpio_chip->to_irq is not implemented in the Loongson-3 GPIO driver,
-	 * acpi_register_gsi() is used to obtain the GPIO IRQ. The GPIO interrupt is a
-	 * watchdog interrupt that is triggered when the BMC resets.
-	 */
-	gpio_irq = acpi_register_gsi(NULL, LS2K_BMC_RESET_GPIO_GSI, ACPI_EDGE_SENSITIVE,
-				     ACPI_ACTIVE_LOW);
 	if (gpio_irq < 0)
-		return gpio_irq;
+		return dev_err_probe(ddata->dev, gpio_irq,
+				     "Failed to get IRQ for GPIO reset signal input\n");
 
-	ret = devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
-			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
-	if (ret)
-		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_irq);
+	ret = devm_request_irq(&pdev->dev, gpio_irq, ls2k_bmc_interrupt,
+			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc reset", ddata);
+
+	if (ret != 0)
+		return dev_err_probe(ddata->dev, ret,
+				     "Failed to request IRQ %d for GPIO reset signal input.\n",
+				     gpio_irq);
 
-	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
 	return ret;
 }
 

-- 
2.49.0


