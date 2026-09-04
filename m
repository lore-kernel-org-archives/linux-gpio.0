Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD07511E87
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 17:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542181; cv=none; b=YwWDBVYYi3BdTfrRnUEqsB19+uwgiRPDtqH4NSNK9S4ON/fVSQKfZEvyLWFa7Wpmg3C++/bAj6Xka93tbPcaBYdBqX8zFFOh6Qttw8srYSg3KaeFFp/s0YVaAcrciEs+CTwOxcbTVGfdiDfAV2uI8s/gW+gh4jEJkPX7ST/KLt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542181; c=relaxed/simple;
	bh=rcZ0lRSJqY/vDL620Ng40HlL3J3oAsbD69VlVp7JN1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cr5qwJJqf+25MHb3bRB+EErL5kavwoQbrbdCdJ4swX2atZh3jaezYyb0KSY4RLLbM6q0rEmGe5XLgTBwqfLVDjMlXgCjtfAEQuR7jbdyqdIu+wLV8V00uSvdw/fB5Za2/A/k3eviu/FuED0wVWO/xlRm3MRHzj4gmZwYOzzETkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+Bb0qQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bc2TFSJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+Bb0qQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bc2TFSJb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgsIh3121382
	for <linux-gpio@vger.kernel.org>; Fri, 4 Sep 2026 17:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFo2mxlAP2miNsca0zglZjL9NqIFeGnkjNs1IEzEBo4=; b=f+Bb0qQnIUN/JoEr
	V0FAY5MvMC4lFNKr+9mXc2c637x39HuQ5UpIxj3zduRSzlJC0oMAclOuK9MJCo2N
	B8OG39Y6F//Wfqo3qEi6YoigNpQGYEUZc8DGLlT0JwdQt+xUQ8TRQje5FG8Gho4S
	hocSp3ZZaVokXYZNADVTYDVmcFDE4YeC42Ui0p80DNNu52S0TFG381DrE64NP46i
	/2bSfHC3Ls+r9f6DgeFSg0VIx48647BUZtWKMS2UkLh8Y4wlxd+a5adKmoo7Rlxz
	Sc5Ez8XmlqjvIuCNIW7FS8qgXmsM+cO8K8q5pSrrLwFF150dpImM3ZiHJhZWcQdz
	c7gpvQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fk8df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 17:16:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a59f5ed87so105905137.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542175; x=1789146975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFo2mxlAP2miNsca0zglZjL9NqIFeGnkjNs1IEzEBo4=;
        b=Bc2TFSJb87yGDTZn+fAb0GWsdDCdRYtGxXw9qskgjh5I5KG6+COcl3NPGofglcvjAw
         P/ZIYbu+JAp8hjX1K7TR8YLsG/5ljkPEwMf7oKsvFqtSctNR0VMd+rE5C5hMJ5ckGCfG
         xykW2Im/GVGxE6B1ozosL2zwzZ9qZC0rAGFG/3jotNrrHO6kHaeHoVA1Why01Suu4dzK
         n9ODZGF9lA15GvILsAy1bOZ1P4zxvqhDHUoCoxlhBbtS6pHJ5P6fo71XGEoWXYL78ApO
         IcKTqhGuk0O8iJIGu7m6HaTRR0IrH9VyxDYwEQBRhJ1tyexqIpmupmy3kiyoAgdvIJOC
         zGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542175; x=1789146975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFo2mxlAP2miNsca0zglZjL9NqIFeGnkjNs1IEzEBo4=;
        b=FRGjOGTBxUTeXwMF6qWJxbOUUeL0VgXE6MkwRhx0cRO+pB2kVg9yBB9yAzGsu0mlws
         qZcwQVavRL/MDwUc0apkifGMfX5cnLQmhGtQyxsyNDNCwNojOx3o4XjPWVJyZvX/dydh
         z+pYqmBnzyON8EP6uSmvNnuZvR1+J90APXh+W7IFZhTA5BxfaqbSMpdrPNxJxftptIwx
         dUFUCCn9jMlXFI3gRm0Mekm81wuQpBULd6uGB1dlPtSewosBxREVg1RU7VQDDHd/o4Th
         i33j5vtxSGkcsejVXlQ5kgq6Bjf9uI80Bzyx3whw3jTRGWzwV4wFiFA9s6K0pf3234Qk
         wrtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxou3IoL2bfLjJfArkcCSjgmmQQ22YFpSuCv+lRwjqPVy4F9gZZZj/scepRhC7SHE2vMKQk3irTkeQP@vger.kernel.org
X-Gm-Message-State: AFuF++mXLvCBUTgujjlD5AGXU0BkjnYuxLZ3871eRvJtAEyFJLkrN6YG
	9q9HNSD16oMTsw72vaWtnjToTcxaDpc6HU1ADRNTrd8nKt8/Hv2LwSleOexHIsxN3Svr7TiXt1F
	Krn7NrodCn2+DdI1Y3XmnkeroCpf1K56yJaik7eJXU08zxXwB3wE0NQ0X57Y/GIuQV+D87/eJ
X-Gm-Gg: AYBFou3OmIGNx5Meu9tGBk3eu1UAwH1yr3O6FcRFqbcdPzs8wc3ubITG4gwcvha2TuN
	+R7df7tuyXycCDMxmDrsFQEUjZYzmMNO0MGWJAo/SV5qq7s1UlCiMSUdMAHVeqdrVlvlLohrpQr
	YijDYFR44O6axHjDImnGP8qj+gRnHMuZIhwZl3f5C8zfsGFwEq/fr8zFtwcceKHhaashFiLHCNl
	kEXd2VYYlMA2e2r8RwkrBXg7wYz0jLFF8R7d6+M4pR7hgm63xmQ+C1iV5eHm/EQavkZP8/Z3jmJ
	JK3zAZV/nrOtqCJopNFuJE/4MLdUfM+nak+RhmPrcOsO4XaJD4U379GAeER1OozhQaQm8Cw46Fn
	nZx27hUs//Sx0lg==
X-Received: by 2002:a05:6102:508a:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-78a4a917628mr2183524137.8.1788542174784;
        Fri, 04 Sep 2026 10:16:14 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-78a4a917628mr2183495137.8.1788542174206;
        Fri, 04 Sep 2026 10:16:14 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm11228935e9.1.2026.09.04.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:13 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 19:15:19 +0200
Subject: [PATCH v3 2/5] gpio: tc9563: Add support for the embedded GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-pci-tc9563-aux-v3-2-5b1449d62ba2@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9afce1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=xgoTPrYxRPbxS4DbvaYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: wwovdWt0KvokhZrczGeU2tgCqABpQi6k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX3jXdnivUYuHp
 yZ1EtfAAsvX4sOl/AW5mslEtf+GET8M7BtqKCFEdNNqTgRW9Cac4fQXE+/CtItiymObePaNXm2S
 /LcjyRWGse4POw/0S4yGJkQpWzpnwbU=
X-Proofpoint-GUID: wwovdWt0KvokhZrczGeU2tgCqABpQi6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXxvIoEYnllS4l
 PKSyt8hTZFEDoD7u43tbsMhM0ti29OnRsTNtf3FyVmsDkBWNVjRO0fjrQZiJOC1KDKwXVd7ZQN9
 U6XkIMxIHRGAN/bNw6r0hbw8Tuf1TRnsAScozAfwRww+R8QzIzQUV1T1IXN/V4is3L6cmkNCrAN
 /scqlFKpGqLALzilPuuZkjXWMQWAOVFlLIeUHRWOnHcSHBx8tHkH/rzf0vA1GzJgYZaYnxITQyh
 T4NFeYTYeR7UzNwKr2x7pkxtq3B+o5PkPBompha4/z7+0GLz1CDVP5BKgeprXZQFRnfJH+Pwoiq
 GlPWQsF2QyQvBob39zTmxnBNdw9H78BdUq8bg2EuHx/3UOg9lSEpanKCBbNQKvC5ji7bYk0uMBh
 /cxn395jSXgp11dNrn+z6f/Wo/woGghxjbAQD05J3ZbIb06krWy4oE+iVl8wWv3KSAqwgc+DLXo
 9AhRXAvtTskH2kqDyew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040156

From: Alex Elder <elder@riscstar.com>

Add a driver for the GPIO controller embedded in the Toshiba TC9563
PCIe switch (and the Qualcomm QPS615). The device implements 35
GPIOs using two register banks: three registers control the first 32
GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
GPIOs 22-24, 27-28, 31, and 34 are input-only.

The driver is registered as an auxiliary device driver. The TC9563
power controller creates the auxiliary device and provides a regmap
that gives access to the GPIO registers, so the gpio-regmap helpers
are used to implement the GPIO chip.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/gpio/Kconfig            | 11 +++++
 drivers/gpio/Makefile           |  1 +
 drivers/gpio/gpio-tc9563.c      | 99 +++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/tc9563.h | 16 +++++++
 4 files changed, 127 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..2179eaffcc48 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1830,6 +1830,17 @@ config GPIO_LTC4283
 
 endmenu
 
+config GPIO_TC9563
+	tristate "Toshiba TC9563 GPIO support"
+	default m if ARCH_QCOM
+	select AUXILIARY_BUS
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIO controller embedded in the Toshiba
+	  TC9563 (and Qualcomm QPS615).  This device connects to the host
+	  via PCIe port, which is the upstream port on an internal PCIe
+	  switch.
+
 menu "PCI GPIO expanders"
 	depends on PCI
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..792faa2668c9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -182,6 +182,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
 obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
+obj-$(CONFIG_GPIO_TC9563)		+= gpio-tc9563.o
 obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
 obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
 obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
diff --git a/drivers/gpio/gpio-tc9563.c b/drivers/gpio/gpio-tc9563.c
new file mode 100644
index 000000000000..70c3d61905a8
--- /dev/null
+++ b/drivers/gpio/gpio-tc9563.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+/*
+ * The Toshiba TC9563 implements a PCIe Gen 3 switch that connects an
+ * upstream x4 port to two downstream PCIe x2 ports. It incorporates
+ * an internal endpoint on a internal PCIe port that implements two
+ * Synopsys XGMAC Ethernet interfaces.
+ *
+ * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
+ * registers control the first 32 GPIOs (other than 20 and 21, which are
+ * reserved). Three other registers control GPIOs 32 through 36. GPIOs
+ * 22-24, 27-28, 31, and 34 are treated as "input only".
+ *
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/qcom/tc9563.h>
+
+/*
+ * There are two sets of registers, each representing (up to) 32 GPIOs with a
+ * stride of 4 bytes (IN1 is 4 bytes past IN0, EN1 is 4 bytes past EN0, etc.).
+ */
+#define TC9563_GPIO_COUNT		37
+#define TC9563_GPIO_PER_REG		32
+#define TC9563_GPIO_REG_STRIDE		4
+
+static int tc9563_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	/* GPIOs 20 and 21 are reserved */
+	bitmap_fill(valid_mask, ngpios);
+	bitmap_clear(valid_mask, 20, 2);
+
+	return 0;
+}
+
+static int tc9563_gpio_probe(struct auxiliary_device *adev,
+			     const struct auxiliary_device_id *id)
+{
+	struct gpio_regmap_config config = {
+		.parent = &adev->dev,
+		.ngpio = TC9563_GPIO_COUNT,
+		.reg_stride = TC9563_GPIO_REG_STRIDE,
+		.ngpio_per_reg = TC9563_GPIO_PER_REG,
+		.reg_dat_base = GPIO_REGMAP_ADDR(TC9563_GPIO_IN0_OFFSET),
+		.reg_set_base = GPIO_REGMAP_ADDR(TC9563_GPIO_OUT0_OFFSET),
+		.reg_dir_in_base = GPIO_REGMAP_ADDR(TC9563_GPIO_EN0_OFFSET),
+		.init_valid_mask = tc9563_gpio_init_valid_mask,
+	};
+	DECLARE_BITMAP(fixed_dir_mask, TC9563_GPIO_COUNT);
+	DECLARE_BITMAP(fixed_dir_out, TC9563_GPIO_COUNT);
+
+	config.regmap = dev_get_platdata(&adev->dev);
+	if (!config.regmap)
+		return -EINVAL;
+
+	/*
+	 * Only some of our GPIOs are fixed direction:
+	 * 22, 23, 24, 27, 28, 31, and 34 are input-only.
+	 */
+	bitmap_zero(fixed_dir_mask, TC9563_GPIO_COUNT);
+	bitmap_set(fixed_dir_mask, 22, 3);
+	bitmap_set(fixed_dir_mask, 27, 2);
+	set_bit(31, fixed_dir_mask);
+	set_bit(34, fixed_dir_mask);
+	config.fixed_direction_mask = fixed_dir_mask;
+
+	bitmap_zero(fixed_dir_out, TC9563_GPIO_COUNT);
+	config.fixed_direction_output = fixed_dir_out;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&adev->dev, &config));
+};
+
+static const struct auxiliary_device_id tc9563_gpio_ids[] = {
+	{ "pci_pwrctrl_tc9563." TC9563_GPIO_DEV_NAME },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, tc9563_gpio_ids);
+
+static struct auxiliary_driver tc9563_gpio_driver = {
+	.name		= TC9563_GPIO_DEV_NAME,
+	.probe		= tc9563_gpio_probe,
+	.id_table	= tc9563_gpio_ids,
+};
+module_auxiliary_driver(tc9563_gpio_driver);
+
+MODULE_AUTHOR("Alex Elder <elder@riscstar.com>");
+MODULE_AUTHOR("Daniel Thompson <daniel@riscstar.com>");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Toshiba TC9563 GPIO Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/qcom/tc9563.h b/include/linux/soc/qcom/tc9563.h
new file mode 100644
index 000000000000..0dfd25747b9a
--- /dev/null
+++ b/include/linux/soc/qcom/tc9563.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+ */
+
+#ifndef __QCOM_TC9563_H
+#define __QCOM_TC9563_H
+
+#define TC9563_GPIO_DEV_NAME	"tc9563-gpio"
+
+#define TC9563_GPIO_IN0_OFFSET		0x801200
+#define TC9563_GPIO_EN0_OFFSET		0x801208
+#define TC9563_GPIO_OUT0_OFFSET		0x801210
+
+#endif /* __QCOM_TC9563_H */

-- 
2.55.0

