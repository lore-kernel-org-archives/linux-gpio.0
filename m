Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8B355C1D7;
	Thu, 10 Sep 2026 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061400; cv=none; b=TFy0LRnEk9lrn/kVjXAfeF/dNmpGG8L/pL4I38Xf5W2LgxQx8iWLT4O0PQXY5pV8EgWc6EOs+L9WV+vYmqPnRapdcu2/XkZuIyX5SBsxV+h7P/4gG/4jABqFKP5HcKio9D+FItbPMKt+fsf/s1MA6Z/ajMJHvEc7yvaIQPUvqJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061400; c=relaxed/simple;
	bh=qj04lnfabPkO4RhURI7w92r5/cwoXH0pgIJukWhuhBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BzDJwH9V5rgd9E024ZQ7n9otTeeb7FHPbkmO1E4dFG1PxIcLpTJOsB9MI/aysV1NcBadtYlsKx1xf0id3zLpqGrxtZwpZgOVElJbuAmm8VxjQkH3xVfpuYs5wmWlTyNwdPWrTF8xO01yQPePP9ezTk38FGHyLXo7CENf8QCmbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=0KalttTC; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="0KalttTC"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF7Qm6343103;
	Thu, 10 Sep 2026 13:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=G8GvV
	apYrb5qwfEX35H9jYhItTfnC+pyFDI6wfAjNdQ=; b=0KalttTCC1bF7xyTYWES+
	MU1nWoOypLPvcjaU1O6mWvx3GIMWQAxgklsEBmec3HpEmmRQBVCuDKhn+ttlh1oo
	awu4W7dc177r31/PcFRKvi3KAZU1O5JPgjp0VnEgo2QqlZulwDH7spcWOXIt9cWW
	X+GT6sIFJuvdfaEBDe/dLW1A1g3jlWl6+36XDuvZul78riR+iVaTX3MI8oW+Wadz
	YWJoqvpQ7ccoPf8Usy/BPRDiWn9TPzcABTIWh0A8/TDfz0MYpk3W5zKZldt/e3cZ
	Ovlu7BO8YpRgmcxNEbFz60E0g7u1WO9tJ/7X6hSuuzamyGQMRCyl4EjtdhPeE5Tq
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcx950ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 13:29:35 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68AHTY2Y037800
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 13:29:34 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 10 Sep
 2026 13:29:34 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 10 Sep 2026 13:29:34 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com ([10.32.225.204])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68AHTIdr018670;
	Thu, 10 Sep 2026 13:29:30 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 10 Sep 2026 19:29:12 +0200
Subject: [PATCH v8 3/3] gpio: ad7768: Add AD7768 GPIO auxiliary driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-ad7768-gpio-v8-3-6aaaa15adeb3@analog.com>
References: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
In-Reply-To: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Cameron
	<jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Janani
 Sunil <jananisunil.dev@gmail.com>,
        Janani Sunil <janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789061359; l=5661;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=qj04lnfabPkO4RhURI7w92r5/cwoXH0pgIJukWhuhBA=;
 b=A0f9/jZZyvSxWIaCIJmuDhNV8hu5nAvDbjdrJ07cDIFLFwr3ZBVoFL9d3zy/+1CTKcj/e+25+
 EayJFyK49BOAersCedgdEkDD0S0slUTvgG4gWjBPu46/tySMBgJJpfy
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIxNCBTYWx0ZWRfX7ki4cBU6iqlx
 klhZryDWLajUv4vPU5jIj7t8XzoCROLXka7yeOr57ZRLWZA/Gr06NfX6/fbDGC92rjMoD1Tf5dJ
 567tD9XSz+AN8g0rwdgNMxJXP4Y7TR3qBokhTRUWo9vm1Zfg8ceC
X-Proofpoint-GUID: ktNsYz2yY6mlNYCMt5ZRrw2rD6lZXIT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIxNCBTYWx0ZWRfX0Tjv4jNtfDrD
 WXr9iAqqBcLy8a6UAFyGDGraRPUyimTDJncEfZXNALhC58ljb5EQmRPknDXZCvp+bd9Ts26rXG9
 Qeg/2SqZAicgKzZsGFTu4z21Mqhky6A45GS4nDmR7m4dtSF4J+iK3ES8UIhETeaTET5zrbKrMF5
 q3cWj1AGojTEsk/h5ecIFWOqoTtQJkJ7aYQHQhejbhBO7heh3t2l/UAR9dcYG+YXg/F2xapkY4v
 HTVMNdIRPtA5l6KXUeiUUvhBPUGulIVRn95+w6ILNls3KiYQELhc8Ptdkp6KVU6PkhGpQaUiN15
 zHxVFGIF4v6/ZYa7gE33sd8vLf+CgwUoP6sypw8ZpKsJosD+FcnIYg7TaXmOpE6tOuMlXRf1wxm
 SAPTpR3W1yIcFIUrA6eBqh7G1f+1XN/Nwh/4GK2ek2TZU4EFJh80Dh1pSih7Qn/1es6y6qLV81p
 /EWaBC3ctcNXDxVdxdQ==
X-Authority-Analysis: v=2.4 cv=G8CJgNk5 c=1 sm=1 tr=0 ts=6aa2e8ff cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=8fq82CzG31171KfXEYkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ktNsYz2yY6mlNYCMt5ZRrw2rD6lZXIT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100214

The AD7768 provides five GPIOs controlled through registers shared
with the parent IIO device. Register an auxiliary gpio-regmap driver
and use the parent device for runtime PM.

The device has separate input-state and output-latch registers. Add a
reg_mask_xlate() callback that checks the line direction and reads the
programmed output latch for output lines while retaining input-state
reads for input lines.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 drivers/gpio/Kconfig       |  12 +++++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-ad7768.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..07b7f8ab0ccb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1818,6 +1818,18 @@ endmenu
 menu "Auxiliary Bus GPIO drivers"
 	depends on AUXILIARY_BUS
 
+config GPIO_AD7768
+	tristate "Analog Devices AD7768 GPIO support"
+	depends on AD7768
+	depends on GPIOLIB
+	select GPIO_REGMAP
+	help
+	  Say yes here to expose the AD7768 utility pins as GPIOs when the
+	  device tree node is marked as a GPIO controller.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called gpio-ad7768.
+
 config GPIO_LTC4283
 	tristate "Analog Devices LTC4283 GPIO support"
 	depends on SENSORS_LTC4283
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..ce56e9b3f55d 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_AD7768)		+= gpio-ad7768.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5585)		+= gpio-adp5585.o
diff --git a/drivers/gpio/gpio-ad7768.c b/drivers/gpio/gpio-ad7768.c
new file mode 100644
index 000000000000..c37e1ac30612
--- /dev/null
+++ b/drivers/gpio/gpio-ad7768.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices AD7768 GPIO auxiliary driver
+ *
+ * Copyright 2026 Analog Devices Inc.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define AD7768_REG_GPIO_CONTROL		0x0E
+#define   AD7768_GPIO_UGPIO_ENABLE	BIT(7)
+
+#define AD7768_REG_GPIO_WRITE		0x0F
+#define AD7768_REG_GPIO_READ		0x10
+
+#define AD7768_NUM_GPIOS		5
+#define AD7768_FILTER_GPIO		4
+
+static int ad7768_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	if (ngpios > AD7768_FILTER_GPIO &&
+	    fwnode_property_match_string(gc->fwnode, "clock-names", "mclk") < 0)
+		__clear_bit(AD7768_FILTER_GPIO, valid_mask);
+
+	return 0;
+}
+
+static int ad7768_gpio_reg_mask_xlate(struct gpio_regmap *gpio,
+				      enum gpio_regmap_operation op,
+				      unsigned int base, unsigned int offset,
+				      unsigned int *reg, unsigned int *mask)
+{
+	struct regmap *regmap = gpio_regmap_get_drvdata(gpio);
+	int ret;
+
+	*reg = base;
+	*mask = BIT(offset);
+
+	if (op != GPIO_REGMAP_GET_OP)
+		return 0;
+
+	/*
+	 * AD7768 has separate input-state and output-latch registers. For an
+	 * output line, report the programmed value from the output latch;
+	 * input lines continue to use the input-state register.
+	 */
+	ret = regmap_test_bits(regmap, AD7768_REG_GPIO_CONTROL, *mask);
+	if (ret < 0)
+		return ret;
+	if (ret)
+		*reg = AD7768_REG_GPIO_WRITE;
+
+	return 0;
+}
+
+static int ad7768_gpio_probe(struct auxiliary_device *adev,
+			     const struct auxiliary_device_id *id)
+{
+	struct gpio_regmap_config config;
+	struct device *dev = &adev->dev;
+	struct device *parent = dev->parent;
+	struct regmap *map;
+	int ret;
+
+	map = dev_get_regmap(parent, NULL);
+	if (!map)
+		return -ENODEV;
+
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(parent, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, AD7768_REG_GPIO_CONTROL, AD7768_GPIO_UGPIO_ENABLE);
+	if (ret)
+		return ret;
+
+	config = (struct gpio_regmap_config) {
+		.parent = dev,
+		.regmap = map,
+		.label = dev_name(parent),
+		.ngpio = AD7768_NUM_GPIOS,
+		.reg_dat_base = AD7768_REG_GPIO_READ,
+		.reg_set_base = AD7768_REG_GPIO_WRITE,
+		.reg_dir_out_base = AD7768_REG_GPIO_CONTROL,
+		.pm_dev = parent,
+		.fwnode = dev_fwnode(parent),
+		.reg_mask_xlate = ad7768_gpio_reg_mask_xlate,
+		.init_valid_mask = ad7768_gpio_init_valid_mask,
+		.drvdata = map,
+	};
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &config));
+}
+
+static const struct auxiliary_device_id ad7768_gpio_ids[] = {
+	{ .name = "ad7768.gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, ad7768_gpio_ids);
+
+static struct auxiliary_driver ad7768_gpio_driver = {
+	.probe = ad7768_gpio_probe,
+	.id_table = ad7768_gpio_ids,
+};
+module_auxiliary_driver(ad7768_gpio_driver);
+
+MODULE_AUTHOR("Janani Sunil <janani.sunil@analog.com>");
+MODULE_DESCRIPTION("Analog Devices AD7768 GPIO auxiliary driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

