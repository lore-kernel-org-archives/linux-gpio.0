Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D624BFE79;
	Mon, 12 Oct 2026 17:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826624; cv=fail; b=GGy/3yDooi1MohSFgCrygNNewog4aIQc+EzTnU5fKeokKbGk/QR0gA8rwksFjR7RJGR+UVhuE0vSlvD5K6FAMbXhkvu14rdFRNggtpAZRvsWpH9CaiSlrXmfPiVC2JpLqAuxRV2cfHqKkJdIPqfbqx6BWqds4SRfuDj0LqpDnkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826624; c=relaxed/simple;
	bh=bl9eqfnLubEt4A8noss/F2B+bDZmNnaPBWlmcWQIjUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bgee2LhuBzwgkLZ62ecXOL7eRmpPA+3azcBrasp/svXfud6XxcpRKxdz0uSRwWY4fmaeza8RcL8XRaQ27Qn1SCFEnOCLAgAcPWZYQcbPH3Z9rfcbjS9EVxDRfhUm/fHrZO2ncXb3zcfcbhhGRTi+YyJc3S5IWgQKXjEmW2LfTz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AADPe89S; arc=fail smtp.client-ip=40.107.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AADPe89S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKz6q/ooONV5QunKEG/QZByNgteD0u1XBii2qiSID99lgVGDnyMTFiqqjgM+FyKtHsDRGeOF9TRhOy3nwsHhsLSkPMrEuDe1J+Ib+INIE501bWO+6PeAxCBv/wyH66pdqTrn/TCicEM2oEKa2XTQtEg/GXw8vFiNKwaDzK3AC+CkCnXe84Ys8I6jLZg/HQMjGmC9QrMfDlf09EhQAY94Y3Ec0tuC1Vs51yGyyKaSzqX7xbpNm4dT1MEaVCj1pUEOOPEK5zC8OGqZG17C9hSNQ+rbBoTXgsQ0RU/dytaixer1Gz7wJh57vKcnkBC4vPPsy+H9+GwmGTdI3JJ9EKMbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqT7Z5h1MRBvbtHEcVzCAPwL0cyDzHArpOujwHhM/q0=;
 b=UlFm9kAoEmhMXV5Wss1dwfawfSQu2b8DTEknjO9+yvIhLyydYGu4AoggTEdgK/r4zvBJTeGn/g1SyvwvDFBljqktlGDUQmI1HrJCPGSqNfwj1SiYrj0Leo0FbtMLrHbFVtO+2Uatko5SqnXlOnBMt+2b3SVGbnolK9vX8xoeImCi7i6BX4puYX+43PWlbY693ULhe6gsMhwzM9vfgdkaeVJ/6tjNxFqI/beLDT5j1UYWEFXdWE84p77TON32vBdmILYaeaBzSFCsg/CDYdbtNRpNid1vyq+8tINf/DkU7150hQCXM3PCaD4bQH1FahjJTciAYOeuly8Tnsaf8Sbntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqT7Z5h1MRBvbtHEcVzCAPwL0cyDzHArpOujwHhM/q0=;
 b=AADPe89Sgxn7WT2fCyGp+Jjlp4kGJYjhG2Y/n0si2nu7GTqXo6uiFF+JvLnPckC9D8wIYJQLHMjZ3shSfJ1JJNkBqwaRbMdQeA/lsCUZUkH4hzyuykiV2HXqWw9rclNjCRoh+tletWuAxyMkhu4xaqjmasCrstQBC11kr7RHfzKOn+7iTeR+jYPbOudRHf8iA5Q1JjzMF+IY3eLevd1aMcp1LY5ge19q662ddg0phAv034WVubO/bGHXLpeyqelOHwkN08wou8xfVjav6q/OtCIUIverg+BoZR+DwBnwEX7oQRQexzC9spQfA2qRlXe/gWzhlAf761XBLn2o1+yycg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 17:36:56 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0496.010; Mon, 12 Oct 2026
 17:36:56 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Donald Shannon <donalds@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-usb@vger.kernel.org,
	llvm@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 06/11] gpio: Add NVIDIA LSTP GPIO driver
Date: Mon, 12 Oct 2026 20:36:04 +0300
Message-ID: <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::11) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 65953b4f-8cc3-4d17-c81e-08df28876953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10067099003|3023799007|261009223027099003|5023799004|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6Acr02YsMJWksYhiktkWUFp2JwwB8iM1xUydVOrK2PyLaNrGagXUGUyauNbhNOYWoFeNgVGmeohie2zQbDUqvPLdedw4KHeGPr9ZoabEPExeL3R4sQH3D0dB2aU5eaKnUmhBz9cxNNvDKraV6yGA6WFrVHktiGk6G4QDmK6P3dV3lk9jtudXt52i2dsiWZCItJRsE5jjgDMUSPHEVQdTKtHct4Peyj6NqFutKmW+WF8KuK+wyqrtMp1i/1ls+KRxBmb71ck4PGRewd3OAk25+rksoxU9BumXASz7kgJ6BeWLBS94KIk8kThk7A0V49OLEoGgjFmnwfSYX+xiBLwcC1ZwaVf5nyF2l6XQ+DpYpANJuNkb0M5SQZvdfAcVHW9JSzvP1+/2E/40bEslZLONrzu9IT/dvrndxJYuCN7sM4DoIWQwd1GWxOYcEw8mnjVarzApI/05XJgTkz0C6IBQHkYZK7lckJjyvGZpAV2AEW8fOu7MKUrr0Vh1KIQT3Vpuxk/Bw3xndAUxnGqGM4NNcW1UkOOCo9QXX4FmW3lcW8A14WMcDT22zhZzEy2LF1PeuByCU+SVwZzmB6uhT7lPWwbY0eJRR5cmR5jkGSBzVA7r+ucc1Wae6l/o9pmeXLXBa+l9wIyhY6d1UiVfyEJ5oM/N8s3SBCawE4gH3rmY+J4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10067099003)(3023799007)(261009223027099003)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GLAyiW698QxP77QgLg3N+f1/OEGKfzeJmPlgf63O07Wu9lRCVFuiVRWrzze1?=
 =?us-ascii?Q?RiBvl2EuNyD3xlBTADwXhniByPBmqQuM+JfBOlcaFE0mkmIJx5/ZEBxaD68I?=
 =?us-ascii?Q?p1uumwUopqLCP2GJeUzMl6oYpJi/C1K4xg214NH0Z9AhCeM8aTb+lLhMmpPc?=
 =?us-ascii?Q?vO5rJX7fCgaQWX+QKRho5cUi8D9ZdWj2yBWLATEqJPo7Hc4WTDmV9eLlraZA?=
 =?us-ascii?Q?ybIOyE08uLrTvtc/D1qHeyersnM4lVLcHyYGdX1MyhGzepTYbr1BIfMWJm5W?=
 =?us-ascii?Q?j3V9Ydau4Loe0gVvh8ivnr0eP2zBhf1rXg00IUEkpyEz4CXv66BodZ2e0TjJ?=
 =?us-ascii?Q?z8pOS+wy4MX5KZ0ue+bgpn3FJAfzSwJVyWSuAP73Ncu1LQJC4IGB+TsQ7Uze?=
 =?us-ascii?Q?GLzccAcc2vdBJsIf3OrANzWgf5uUtKCj2Qb2jk3uSE/E1tjkXVDolrI/MSik?=
 =?us-ascii?Q?V/eYUDxv5b0uYJ8kqggRThVj1Ah6JxQo2/3IUXF6VsCZijbAhHcpAkTa9k24?=
 =?us-ascii?Q?ynPstx0tUfXSJwZc8SkTnz3k40oAXNArbRwLhfElL1VkwtKUKqxHsMY3L711?=
 =?us-ascii?Q?hzikE96SHn20E91GgadB61Wf9aHnjFuMymNF6lszlkC/Np/Mg1h5OkJaK40o?=
 =?us-ascii?Q?1EPtITCToRC4EEB9LkBavU7OeoA8EOA0C0qefuqjvwu8FkfgxhdP23aau+da?=
 =?us-ascii?Q?Q+/KdxAkynQ98aYvF8vYnzXDMUOetDyizDjqysLf+JOWHo7WA7oYDAy/nrQP?=
 =?us-ascii?Q?zY6D4vJZUDJWtainnD/W4I3CVS8vfymGT6VJhBTwiq/Mn8LhP/kaNnZav7Tq?=
 =?us-ascii?Q?XfmV2IO2QX+pPnen2eTnTxiwVpcmRTgrd8xaerH4RI4omwC+3hl79RoWkC9x?=
 =?us-ascii?Q?3wUJkswLlYs/v2fMQHXvwsHDTjZN7Q6mR2VikxDhDLWdJkqXckCsquIrF5aT?=
 =?us-ascii?Q?7YM4i2zaMhBf7WcdSXGfE7lZsv+ulheowB6ac847JenkM+f4GbhQl2ZJGPrx?=
 =?us-ascii?Q?ATrl7ySUFkV/k8D1rtvD6Zfc8v9HGBpv0NycUfnjCqBkn2ECXTfPhfQbH7f8?=
 =?us-ascii?Q?O9vTKZ5AIIAAUqWUUXyVcdLcQ80M12To0lXjGn5AtJ/upc1PBcZ69/AJxs27?=
 =?us-ascii?Q?FeYzH1U7f0td8R/N81/i4lxE094sbVAo8Cu8HXtyR17sxD61VUFZrEbCc+Ln?=
 =?us-ascii?Q?9WXiWSJbPU/6IO6hwEIUNH+rbcCZpcOeOuBt8n8vtBLL31jsDDDhZw4XGcc1?=
 =?us-ascii?Q?4EQZ7OW/1w38fcjrN3zIVb6OxswHxQopM/JGTWeiPeezy8Ao5GVlKzCqfhBE?=
 =?us-ascii?Q?3Hk1JgWoArujfZMrnh3KHgg3xRM20e8iuOe/Zthv9PRBopep83E27OfNOder?=
 =?us-ascii?Q?XHqPmv+QA+DetTGHDWoyOzevdv8cbxLsMrzsoL23fxo5B0fIBQThWESWKLT8?=
 =?us-ascii?Q?XREeTRU56Nr503Fu9Qo0McotbN1TjiZlj9oddV4rjsxufr/ZFJkOJdYxjHto?=
 =?us-ascii?Q?oNMG2jUJwpvyzRDS60i27juQRGiCkwRyj+eXfePQK3Xpg3YFsKZ+XWtiArmj?=
 =?us-ascii?Q?V9TZCbUzIfkyKdVmxYj/EfTYSFNXF7UHRkNHeC1aA0XQrh4iP9HGKkZKGVGZ?=
 =?us-ascii?Q?S9b/kpZYFHu7OeSOu1C/emI2cL+KdDspAym7422ze4FaTSNODBb5DOt1c9J8?=
 =?us-ascii?Q?RkTIIc87gULBFgwipBuoGkxoHQ/rLjlEdT20pJCOKQNndrylfMNlMXqim/oQ?=
 =?us-ascii?Q?mU1ipMoizw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65953b4f-8cc3-4d17-c81e-08df28876953
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 17:36:56.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoA7U5+mfKOhqNuSiy9NEx62gwhU1zGXRd21KATLLKMJ8GKsXJ6IxltBjQSz+RxNkgT5ZH6ilDgXxSzN0VBE+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378

Add a driver for the GPIO channels of NVIDIA LSTP USB adapters. Each
channel is registered as a GPIO chip with an interrupt controller for
its pins; every line access is a USB transaction, so the chip can
sleep. Pins the firmware reports as LEDs are not GPIO lines: the driver
hands them to the LED driver as an auxiliary device.

At probe the driver reads each pin's interrupt configuration from the
device. A reply that misses the response timeout can answer a later
request and shift every following pin's state by one, so a single read
cannot simply be retried. After a timeout the driver reads all pins
again, alternating ascending and descending order, until two
consecutive passes without a timeout agree: at most five passes, ending
within 10 s of the first timeout, after which the probe fails as
before. The probe runs in the context that added the device, often the
hub's worker, hence the bound.

Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
---
 MAINTAINERS              |    1 +
 drivers/gpio/Kconfig     |   14 +
 drivers/gpio/Makefile    |    1 +
 drivers/gpio/gpio-lstp.c | 1194 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 1210 insertions(+)
 create mode 100644 drivers/gpio/gpio-lstp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e18d45bd7da5..639cd7b6b146 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19577,6 +19577,7 @@ F:	Documentation/devicetree/bindings/spi/nvidia,lstp-spi.yaml
 F:	Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
 F:	Documentation/driver-api/usb/lstp.rst
 F:	Documentation/firmware-guide/acpi/lstp.rst
+F:	drivers/gpio/gpio-lstp.c
 F:	drivers/usb/misc/lstp.c
 F:	include/linux/usb/lstp.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..7ef6a9031475 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -2051,6 +2051,20 @@ config GPIO_USBIO
 	  This driver can also be built as a module. If so, the module
 	  will be called gpio_usbio.
 
+config GPIO_LSTP
+	tristate "NVIDIA LSTP GPIO support"
+	depends on USB_LSTP
+	default USB_LSTP
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y or M here to support the GPIO channels of NVIDIA LSTP USB
+	  adapters. Each channel is registered as a GPIO chip, together
+	  with an interrupt controller for its pins. Pins the firmware
+	  reports as LEDs are left to the LEDS_LSTP driver.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-lstp.
+
 endmenu
 
 menu "Virtual GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..acd0cfae2914 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_GPIO_LP873X)		+= gpio-lp873x.o
 obj-$(CONFIG_GPIO_LP87565)		+= gpio-lp87565.o
 obj-$(CONFIG_GPIO_LPC18XX)		+= gpio-lpc18xx.o
 obj-$(CONFIG_GPIO_LPC32XX)		+= gpio-lpc32xx.o
+obj-$(CONFIG_GPIO_LSTP)			+= gpio-lstp.o
 obj-$(CONFIG_GPIO_LTC4283)		+= gpio-ltc4283.o
 obj-$(CONFIG_GPIO_MACSMC)		+= gpio-macsmc.o
 obj-$(CONFIG_GPIO_MADERA)		+= gpio-madera.o
diff --git a/drivers/gpio/gpio-lstp.c b/drivers/gpio/gpio-lstp.c
new file mode 100644
index 000000000000..cc988a09582b
--- /dev/null
+++ b/drivers/gpio/gpio-lstp.c
@@ -0,0 +1,1194 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * GPIO driver for LSTP USB interface.
+ *
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
+ */
+
+#include <linux/atomic.h>
+#include <linux/bitmap.h>
+#include <linux/build_bug.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/wait_bit.h>
+#include <linux/workqueue.h>
+#include <uapi/linux/gpio.h>
+
+#include <linux/usb/lstp.h>
+
+enum lstp_gpio_cmd {
+	LSTP_GPIO_CMD_GET_VALUE = 0x00,
+	LSTP_GPIO_CMD_SET_VALUE = 0x01,
+	LSTP_GPIO_CMD_GET_IRQ_CONFIG = 0x02,
+	LSTP_GPIO_CMD_SET_IRQ_CONFIG = 0x03,
+	LSTP_GPIO_CMD_IRQ_EVENT = 0x04,
+	/* 0x05, SET_LED_PATTERN, is sent by the LED driver in leds-lstp.c */
+} __packed;
+
+struct lstp_gpio_get_value_req {
+	__le16 pin;
+} __packed;
+
+struct lstp_gpio_set_value_req {
+	__le16 pin;
+	u8 value;
+} __packed;
+
+struct lstp_gpio_get_irq_config_req {
+	__le16 pin;
+} __packed;
+
+struct lstp_gpio_set_irq_config_req {
+	__le16 pin;
+	u8 irq_type;
+} __packed;
+
+struct lstp_gpio_irq_event_req {
+	__le16 pin;
+	u8 value;
+} __packed;
+
+struct lstp_gpio_get_value_resp {
+	u8 value;
+} __packed;
+
+struct lstp_gpio_get_irq_config_resp {
+	u8 irq_type;
+} __packed;
+
+enum lstp_gpio_irq_type {
+	LSTP_GPIO_IRQ_NONE = 0x00,
+	LSTP_GPIO_IRQ_RISING = 0x01,
+	LSTP_GPIO_IRQ_FALLING = 0x02,
+	LSTP_GPIO_IRQ_BOTH = 0x03,
+	LSTP_GPIO_IRQ_HIGH = 0x04,
+	LSTP_GPIO_IRQ_LOW = 0x05,
+	LSTP_GPIO_IRQ_MAX = LSTP_GPIO_IRQ_LOW,
+} __packed;
+
+struct lstp_gpio_pin_config {
+	u8 direction;
+	u8 default_output;
+	u8 output_drive_config;
+	u8 output_persist_state; /* bool */
+	u8 bias_pull_config;
+	__le16 bias_pull_strength; /* 16 ohm increments */
+	__le16 output_drive_strength; /* in mA */
+	__le16 slew_rate; /* in 100 ps (0.1 ns) increments */
+	__le16 input_debounce_time; /* in us */
+	u8 led_support;
+	u8 reserved_0xE;
+	u8 reserved_0xF;
+} __packed;
+
+struct lstp_gpio_pin {
+	char pin_name[LSTP_GPIO_PIN_NAME_LEN];
+	struct lstp_gpio_pin_config config;
+} __packed;
+
+struct lstp_gpio_config {
+	u8 npins;
+	struct lstp_gpio_pin pin_info[];
+} __packed;
+
+/* clang-format off */
+enum lstp_gpio_direction {
+	LSTP_GPIO_OUTPUT = 0x00,
+	LSTP_GPIO_INPUT = 0x01
+} __packed;
+enum lstp_gpio_pin_state {
+	LSTP_GPIO_LOW = 0x00,
+	LSTP_GPIO_HIGH = 0x01
+} __packed;
+enum lstp_gpio_drive_config {
+	LSTP_GPIO_PUSH_PULL = 0x00,
+	LSTP_GPIO_OPEN_DRAIN = 0x01,
+	LSTP_GPIO_OPEN_SOURCE = 0x02
+} __packed;
+enum lstp_gpio_bias_config {
+	LSTP_GPIO_NO_PULL = 0x00,
+	LSTP_GPIO_PULL_UP = 0x01,
+	LSTP_GPIO_PULL_DOWN = 0x02
+} __packed;
+enum lstp_gpio_led_support {
+	LSTP_GPIO_NOT_LED = 0x00,
+	LSTP_GPIO_LED_MODE_HOLD = 0x01, /* pattern brightness jumps between steps */
+	LSTP_GPIO_LED_MODE_INTERPOLATE = 0x02, /* pattern brightness interpolates between steps */
+} __packed; /* clang-format on */
+
+struct lstp_gpio_priv {
+	struct lstp_channel *ch;
+	struct gpio_chip gc;
+	struct workqueue_struct *wq; /* ordered: IRQ batches run in RX order */
+	struct mutex irq_lock; /* Serializes irq_chip callbacks (irq_bus_lock/sync_unlock) */
+	u8 *shadow_irq_type; /* Pending IRQ type per pin [npins] */
+	u8 *hw_irq_type; /* Last successfully committed IRQ type per pin [npins] */
+	const char **pin_names; /* Line names [npins] */
+	unsigned long *led_pins; /* [npins] bitmap: pins handed to the LED driver */
+	u16 npins; /* Pin count from device config */
+	u16 ngpio; /* Non-LED GPIO pin count */
+	u16 nleds; /* LED pin count */
+};
+
+/* One work item per unsolicited RX batch; raw payload parsed in process context */
+struct lstp_gpio_irq_event_work {
+	struct work_struct work;
+	struct lstp_gpio_priv *priv;
+	u16 payload_len;
+	u8 payload[];
+};
+
+/* Read @pin's direction byte out of the channel config descriptor. */
+static int lstp_gpio_read_direction(struct lstp_gpio_priv *priv, unsigned int pin, u8 *direction)
+{
+	if (pin >= priv->npins)
+		return -EINVAL;
+
+	struct lstp_channel *ch = priv->ch;
+	struct lstp_ch0_read_resp *resp __free(kfree) = NULL;
+	u16 pin_offset = sizeof(struct lstp_gpio_config) + pin * sizeof(struct lstp_gpio_pin);
+	u16 offset = pin_offset + offsetof(struct lstp_gpio_pin, config) +
+		     offsetof(struct lstp_gpio_pin_config, direction);
+	size_t actual;
+	int ret = lstp_ch0_read_config(ch, offset, sizeof(*direction), &resp, &actual);
+
+	if (ret) {
+		if (ret != -ENODEV)
+			dev_err_ratelimited(ch->dev,
+					    "%s: ch_%d: Failed to read direction config for pin %u (%pe)\n",
+					    __func__, ch->ch_id, pin, ERR_PTR(ret));
+		return ret;
+	}
+
+	*direction = *(const u8 *)resp->ch_config;
+	return 0;
+}
+
+static int lstp_gpio_get_value(struct gpio_chip *gc, unsigned int pin)
+{
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	struct lstp_channel *ch = priv->ch;
+	struct lstp_gpio_get_value_req req = { .pin = cpu_to_le16(pin) };
+	struct lstp_gpio_get_value_resp resp;
+
+	int ret = lstp_request(ch, LSTP_GPIO_CMD_GET_VALUE, &req, sizeof(req), &resp, sizeof(resp),
+			       NULL, NULL);
+	if (ret) {
+		if (ret != -ENODEV)
+			dev_err_ratelimited(ch->dev,
+					    "%s: ch_%d: Could not get value for pin %u (%pe)\n",
+					    __func__, ch->ch_id, pin, ERR_PTR(ret));
+		return ret;
+	}
+
+	dev_dbg(ch->dev, "%s: ch_%d: pin=%u, value=%d\n", __func__, ch->ch_id, pin, resp.value);
+	return !!resp.value;
+}
+
+static int lstp_gpio_set_value(struct gpio_chip *gc, unsigned int pin, int value)
+{
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	struct lstp_channel *ch = priv->ch;
+	struct lstp_gpio_set_value_req req = {
+		.pin = cpu_to_le16(pin),
+		.value = !!value,
+	};
+
+	int ret = lstp_request(ch, LSTP_GPIO_CMD_SET_VALUE, &req, sizeof(req), NULL, 0, NULL, NULL);
+
+	if (ret && ret != -ENODEV)
+		dev_err_ratelimited(ch->dev, "%s: ch_%d: Could not set value %d for pin %u (%pe)\n",
+				    __func__, ch->ch_id, value, pin, ERR_PTR(ret));
+	else if (!ret)
+		dev_dbg(ch->dev, "%s: ch_%d: pin=%u, value=%d\n", __func__, ch->ch_id, pin, value);
+	return ret;
+}
+
+/*
+ * Chunked across packets when the pin count does not fit one request, one
+ * lstp_request() each, so a concurrent access may observe state from between
+ * two chunks.
+ */
+static int lstp_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits)
+{
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	struct lstp_channel *ch = priv->ch;
+	struct lstp_gpio_get_value_req *req = NULL;
+	struct lstp_gpio_get_value_resp *resp = NULL;
+	int max_pins_per_tx = ch->max_tx_payload / sizeof(*req);
+	int max_pins_per_rx = ch->max_rx_payload / sizeof(*resp);
+	int max_pins_per_pkt = min(max_pins_per_tx, max_pins_per_rx);
+	int total_pins = bitmap_weight(mask, gc->ngpio);
+	unsigned int bit_off = 0;
+	int pins_sent = 0;
+	int ret;
+
+	/* Probe enforces bulk_*_size >= LSTP_USB_EP_MIN_SIZE; anchor it here. */
+	BUILD_BUG_ON(sizeof(struct lstp_header) + sizeof(*req) > LSTP_USB_EP_MIN_SIZE);
+	BUILD_BUG_ON(sizeof(struct lstp_header) + sizeof(*resp) > LSTP_USB_EP_MIN_SIZE);
+
+	if (total_pins == 0)
+		return 0;
+
+	req = kmalloc_objs(*req, max_pins_per_pkt);
+	if (!req) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+	resp = kmalloc_objs(*resp, max_pins_per_pkt);
+	if (!resp) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+
+	bitmap_zero(bits, gc->ngpio);
+
+	while (pins_sent < total_pins) {
+		int pins_in_pkt = min(max_pins_per_pkt, total_pins - pins_sent);
+
+		for (int i = 0; i < pins_in_pkt; i++) {
+			bit_off = find_next_bit(mask, gc->ngpio, bit_off);
+			req[i].pin = cpu_to_le16(bit_off);
+			bit_off++;
+		}
+
+		ret = lstp_request(ch, LSTP_GPIO_CMD_GET_VALUE, req, pins_in_pkt * sizeof(*req),
+				   resp, pins_in_pkt * sizeof(*resp), NULL, NULL);
+		if (ret) {
+			if (ret != -ENODEV)
+				dev_err_ratelimited(ch->dev,
+						    "%s: ch_%d: Could not get values for %d pins (%pe)\n",
+						    __func__, ch->ch_id, pins_in_pkt, ERR_PTR(ret));
+			goto out_free;
+		}
+
+		for (int i = 0; i < pins_in_pkt; i++) {
+			if (resp[i].value)
+				__set_bit(le16_to_cpu(req[i].pin), bits);
+		}
+		pins_sent += pins_in_pkt;
+	}
+
+	dev_dbg(ch->dev, "%s: ch_%d: Get %d pins, mask=%*pb, bits=%*pb\n", __func__, ch->ch_id,
+		total_pins, gc->ngpio, mask, gc->ngpio, bits);
+	ret = 0;
+
+out_free:
+	kfree(resp);
+	kfree(req);
+	return ret;
+}
+
+/* Chunked like lstp_gpio_get_multiple(); same cross-chunk visibility caveat. */
+static int lstp_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits)
+{
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	struct lstp_channel *ch = priv->ch;
+	struct lstp_gpio_set_value_req *req = NULL;
+	int max_pins_per_pkt = ch->max_tx_payload / sizeof(*req);
+	int total_pins = bitmap_weight(mask, gc->ngpio);
+	unsigned int bit_off = 0;
+	int pins_sent = 0;
+	int ret = 0;
+
+	/* Probe enforces bulk_tx_size >= LSTP_USB_EP_MIN_SIZE; anchor it here. */
+	BUILD_BUG_ON(sizeof(struct lstp_header) + sizeof(*req) > LSTP_USB_EP_MIN_SIZE);
+
+	if (total_pins == 0)
+		goto done;
+
+	req = kmalloc_objs(*req, max_pins_per_pkt);
+	if (!req) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	while (pins_sent < total_pins) {
+		int pins_in_pkt = min(max_pins_per_pkt, total_pins - pins_sent);
+
+		for (int i = 0; i < pins_in_pkt; i++) {
+			bit_off = find_next_bit(mask, gc->ngpio, bit_off);
+			req[i].pin = cpu_to_le16(bit_off);
+			req[i].value = test_bit(bit_off, bits) ? 1 : 0;
+			bit_off++;
+		}
+
+		ret = lstp_request(ch, LSTP_GPIO_CMD_SET_VALUE, req, pins_in_pkt * sizeof(*req),
+				   NULL, 0, NULL, NULL);
+		if (ret) {
+			if (ret != -ENODEV)
+				dev_err_ratelimited(ch->dev,
+						    "%s: ch_%d: Could not set values for pins (mask=%*pb) (%pe)\n",
+						    __func__, ch->ch_id, gc->ngpio, mask,
+						    ERR_PTR(ret));
+			goto out_free;
+		}
+		pins_sent += pins_in_pkt;
+	}
+
+	dev_dbg(ch->dev, "%s: ch_%d: Set %d pins, mask=%*pb, bits=%*pb\n", __func__, ch->ch_id,
+		total_pins, gc->ngpio, mask, gc->ngpio, bits);
+
+out_free:
+	kfree(req);
+done:
+	return ret;
+}
+
+/* Read @pin's IRQ type from the device; returns LSTP_GPIO_IRQ_* or -errno. */
+static int lstp_gpio_get_irq_config(struct lstp_gpio_priv *priv, u16 pin)
+{
+	struct lstp_channel *ch = priv->ch;
+	struct lstp_gpio_get_irq_config_req req = { .pin = cpu_to_le16(pin) };
+	struct lstp_gpio_get_irq_config_resp resp;
+
+	int ret = lstp_request(ch, LSTP_GPIO_CMD_GET_IRQ_CONFIG, &req, sizeof(req), &resp,
+			       sizeof(resp), NULL, NULL);
+	if (ret) {
+		dev_err(ch->dev, "%s: ch_%d: GET_IRQ_CONFIG failed for pin %u (%pe)\n", __func__,
+			ch->ch_id, pin, ERR_PTR(ret));
+		return ret;
+	}
+
+	return resp.irq_type;
+}
+
+static int lstp_gpio_set_irq_config(struct lstp_gpio_priv *priv, u16 pin, u8 irq_type)
+{
+	struct lstp_channel *ch = priv->ch;
+	struct lstp_gpio_set_irq_config_req req = {
+		.pin = cpu_to_le16(pin),
+		.irq_type = irq_type,
+	};
+
+	int ret = lstp_request(ch, LSTP_GPIO_CMD_SET_IRQ_CONFIG, &req, sizeof(req), NULL, 0, NULL,
+			       NULL);
+	if (ret && ret != -ENODEV)
+		dev_err_ratelimited(ch->dev, "%s: ch_%d: SET_IRQ_CONFIG failed for pin %u (%pe)\n",
+				    __func__, ch->ch_id, pin, ERR_PTR(ret));
+	return ret;
+}
+
+/*
+ * 0 if @pin's device-side direction matches @direction, else -EOPNOTSUPP: the
+ * device owns pin direction and the driver never changes it.
+ */
+static int lstp_gpio_require_direction(struct lstp_gpio_priv *priv, unsigned int pin, u8 direction)
+{
+	u8 cur_direction;
+
+	int ret = lstp_gpio_read_direction(priv, pin, &cur_direction);
+
+	if (ret)
+		return ret;
+
+	if (cur_direction == direction)
+		return 0;
+
+	return -EOPNOTSUPP;
+}
+
+static int lstp_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
+{
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	u8 direction;
+
+	int ret = lstp_gpio_read_direction(priv, pin, &direction);
+
+	if (ret)
+		return ret;
+
+	if (direction == LSTP_GPIO_INPUT)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int lstp_gpio_direction_input(struct gpio_chip *gc, unsigned int pin)
+{
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+
+	return lstp_gpio_require_direction(priv, pin, LSTP_GPIO_INPUT);
+}
+
+static int lstp_gpio_direction_output(struct gpio_chip *gc, unsigned int pin, int value)
+{
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	int ret = lstp_gpio_require_direction(priv, pin, LSTP_GPIO_OUTPUT);
+
+	if (ret)
+		return ret;
+
+	return lstp_gpio_set_value(gc, pin, value);
+}
+
+static int lstp_gpio_linux_irq_to_lstp(unsigned int type, u8 *irq_type)
+{
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_NONE:
+		*irq_type = LSTP_GPIO_IRQ_NONE;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		*irq_type = LSTP_GPIO_IRQ_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		*irq_type = LSTP_GPIO_IRQ_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		*irq_type = LSTP_GPIO_IRQ_BOTH;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		*irq_type = LSTP_GPIO_IRQ_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		*irq_type = LSTP_GPIO_IRQ_LOW;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+/* Host-side filter against stale batches or firmware that skips filtering. */
+static bool lstp_gpio_irq_event_matches(u8 irq_type, u8 value)
+{
+	switch (irq_type) {
+	case LSTP_GPIO_IRQ_NONE:
+		return false;
+	case LSTP_GPIO_IRQ_RISING:
+		return value == LSTP_GPIO_HIGH;
+	case LSTP_GPIO_IRQ_FALLING:
+		return value == LSTP_GPIO_LOW;
+	case LSTP_GPIO_IRQ_BOTH:
+		return true;
+	case LSTP_GPIO_IRQ_HIGH:
+		return value == LSTP_GPIO_HIGH;
+	case LSTP_GPIO_IRQ_LOW:
+		return value == LSTP_GPIO_LOW;
+	default:
+		return false;
+	}
+}
+
+/*
+ * Read every GPIO pin's IRQ type into @types, in descending pin order if
+ * @reverse. With @send_by, return -ETIME instead of sending a request after it.
+ */
+static int lstp_gpio_read_irq_types(struct lstp_gpio_priv *priv, u8 *types, bool reverse,
+				    const unsigned long *send_by)
+{
+	for (unsigned int i = 0; i < priv->npins; i++) {
+		unsigned int pin = reverse ? priv->npins - 1 - i : i;
+
+		if (test_bit(pin, priv->led_pins))
+			continue;
+		if (send_by && time_after(jiffies, *send_by))
+			return -ETIME;
+
+		int ret = lstp_gpio_get_irq_config(priv, pin);
+
+		if (ret < 0)
+			return ret;
+		types[pin] = ret;
+	}
+
+	return 0;
+}
+
+#define LSTP_GPIO_IRQ_SYNC_PASSES 5
+#define LSTP_GPIO_IRQ_SYNC_BUDGET_MS 10000
+
+/*
+ * Seed hw_irq_type and shadow_irq_type from the device at probe, so the driver
+ * starts in sync even after a module reload with no device reset.
+ *
+ * A reply carries no tag; the first one after a request is its answer. The
+ * reply to a timed-out request can therefore answer a later request, whose
+ * own reply then answers the request after it, and every pin from there on
+ * reads the type of the pin read before it. So once a pass times out, all
+ * pins are read again until two consecutive passes without a timeout agree.
+ * Each pass follows a response timeout with no request waiting, in which an
+ * owed reply is dropped, and goes in the opposite pin order to the one before.
+ * A pass that agrees with an unshifted one is right, so two passes can agree
+ * on a wrong result only if both were shifted, in opposite directions.
+ *
+ * The probe runs in the context that added the device, often the hub's
+ * worker, so the re-reads and the final wait end within
+ * LSTP_GPIO_IRQ_SYNC_BUDGET_MS of the first timeout, or the probe fails.
+ */
+static int lstp_gpio_sync_hw_irq_state(struct lstp_gpio_priv *priv)
+{
+	struct lstp_channel *ch = priv->ch;
+	u8 *types[2] = { priv->hw_irq_type, priv->shadow_irq_type };
+	bool timed_out = false, have_prev = false;
+	unsigned long send_by = 0;
+	unsigned int active = 0;
+	int pass, ret;
+
+	for (pass = 0; pass < LSTP_GPIO_IRQ_SYNC_PASSES; pass++) {
+		if (timed_out)
+			msleep(LSTP_USB_RESPONSE_TIMEOUT_MS);
+
+		ret = lstp_gpio_read_irq_types(priv, types[pass & 1], pass & 1,
+					       timed_out ? &send_by : NULL);
+		if (ret == -ETIME) {
+			ret = -ETIMEDOUT;
+			break;
+		}
+		if (ret == -ETIMEDOUT) {
+			if (!timed_out) {
+				dev_warn(ch->dev,
+					 "%s: ch_%d: Reading the IRQ config of all pins again\n",
+					 __func__, ch->ch_id);
+				/* Leave room for the last request's timeout and the final wait. */
+				send_by = jiffies +
+					  msecs_to_jiffies(LSTP_GPIO_IRQ_SYNC_BUDGET_MS -
+							   2 * LSTP_USB_RESPONSE_TIMEOUT_MS);
+			}
+			timed_out = true;
+			have_prev = false;
+			continue;
+		}
+		if (ret)
+			return ret;
+		if (!timed_out || (have_prev && !memcmp(types[0], types[1], priv->npins)))
+			break;
+		have_prev = true;
+		ret = -EIO;
+	}
+	if (ret) {
+		dev_err(ch->dev, "%s: ch_%d: No consistent IRQ config (%pe)\n", __func__, ch->ch_id,
+			ERR_PTR(ret));
+		return ret;
+	}
+	/* A reply a shifted pass left owed must not answer the first request after probe. */
+	if (timed_out)
+		msleep(LSTP_USB_RESPONSE_TIMEOUT_MS);
+
+	if (pass & 1)
+		memcpy(priv->hw_irq_type, priv->shadow_irq_type, priv->npins);
+	else
+		memcpy(priv->shadow_irq_type, priv->hw_irq_type, priv->npins);
+	for (unsigned int pin = 0; pin < priv->npins; pin++) {
+		if (test_bit(pin, priv->led_pins))
+			continue;
+		if (priv->hw_irq_type[pin] > LSTP_GPIO_IRQ_MAX)
+			dev_warn(ch->dev, "%s: ch_%d: pin %u has unknown IRQ type %u\n", __func__,
+				 ch->ch_id, pin, priv->hw_irq_type[pin]);
+		if (priv->hw_irq_type[pin] != LSTP_GPIO_IRQ_NONE)
+			active++;
+	}
+
+	if (active)
+		dev_info(ch->dev,
+			 "%s: ch_%d: Synced IRQ state, %u/%u pins with active IRQ config\n",
+			 __func__, ch->ch_id, active, priv->ngpio);
+
+	return 0;
+}
+
+/* Shadow only; SET_IRQ_CONFIG is sent from irq_bus_sync_unlock(). */
+static void lstp_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	unsigned int pin = irqd_to_hwirq(d);
+
+	priv->shadow_irq_type[pin] = LSTP_GPIO_IRQ_NONE;
+	gpiochip_disable_irq(gc, pin);
+}
+
+static void lstp_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	unsigned int pin = irqd_to_hwirq(d);
+	unsigned int type = irqd_get_trigger_type(d);
+	u8 irq_type;
+
+	if (lstp_gpio_linux_irq_to_lstp(type, &irq_type)) {
+		dev_err_ratelimited(priv->ch->dev,
+				    "%s: ch_%d: Invalid trigger type %u for gpio %u\n", __func__,
+				    priv->ch->ch_id, type, pin);
+		return;
+	}
+
+	gpiochip_enable_irq(gc, pin);
+	priv->shadow_irq_type[pin] = irq_type;
+}
+
+/*
+ * Validates the trigger type and nothing else. The callback still has to
+ * exist: with no .irq_set_type, __irq_set_trigger() accepts whatever it was
+ * given without asking the driver. IRQCHIP_SET_TYPE_MASKED makes the core
+ * mask around this call and unmask after, and irq_unmask() is what puts the
+ * type in the shadow.
+ */
+static int lstp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	u8 irq_type;
+
+	return lstp_gpio_linux_irq_to_lstp(type, &irq_type);
+}
+
+static void lstp_gpio_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+
+	mutex_lock(&priv->irq_lock);
+}
+
+/* Commit the shadow if it differs from hardware; revert the shadow on failure. */
+static void lstp_gpio_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct lstp_gpio_priv *priv = gpiochip_get_data(gc);
+	u16 pin = irqd_to_hwirq(d);
+
+	if (priv->shadow_irq_type[pin] != priv->hw_irq_type[pin]) {
+		if (lstp_gpio_set_irq_config(priv, pin, priv->shadow_irq_type[pin]))
+			priv->shadow_irq_type[pin] = priv->hw_irq_type[pin];
+		else
+			priv->hw_irq_type[pin] = priv->shadow_irq_type[pin];
+	}
+
+	mutex_unlock(&priv->irq_lock);
+}
+
+static void lstp_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	seq_puts(p, gc->label ? gc->label : d->chip->name);
+}
+
+static const struct irq_chip lstp_gpio_irq_chip = {
+	.name = "lstp-gpio",
+	.irq_mask = lstp_gpio_irq_mask,
+	.irq_unmask = lstp_gpio_irq_unmask,
+	.irq_set_type = lstp_gpio_irq_set_type,
+	.irq_bus_lock = lstp_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock = lstp_gpio_irq_bus_sync_unlock,
+	.irq_print_chip = lstp_gpio_irq_print_chip,
+	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+/*
+ * Deferred GPIO IRQ batch handler. handle_nested_irq() runs the line's
+ * threaded handler inline in this context, and the ordered workqueue
+ * serialises batches, so events reach handlers in USB receive order.
+ */
+static void lstp_gpio_irq_event_work(struct work_struct *work)
+{
+	struct lstp_gpio_irq_event_work *batch =
+		container_of(work, struct lstp_gpio_irq_event_work, work);
+	struct lstp_gpio_priv *priv = batch->priv;
+	struct lstp_channel *ch = priv->ch;
+	struct gpio_chip *gc = &priv->gc;
+	const struct lstp_gpio_irq_event_req *event;
+	const struct lstp_gpio_irq_event_req *end;
+
+	/* Probe enforces bulk_rx_size >= LSTP_USB_EP_MIN_SIZE; anchor base here. */
+	BUILD_BUG_ON(sizeof(struct lstp_header) + sizeof(*event) > LSTP_USB_EP_MIN_SIZE);
+
+	if (batch->payload_len < sizeof(*event)) {
+		dev_err_ratelimited(ch->dev,
+				    "%s: ch_%d: IRQ event packet too small (got %u, need >=%zu)\n",
+				    __func__, ch->ch_id, batch->payload_len, sizeof(*event));
+		goto out;
+	}
+
+	if (batch->payload_len % sizeof(*event)) {
+		dev_err_ratelimited(ch->dev,
+				    "%s: ch_%d: Malformed IRQ event payload (len %u, record size %zu)\n",
+				    __func__, ch->ch_id, batch->payload_len, sizeof(*event));
+		goto out;
+	}
+
+	end = (void *)(batch->payload + batch->payload_len);
+	for (event = (void *)batch->payload; event < end; event++) {
+		u16 pin = le16_to_cpu(event->pin);
+
+		if (pin >= priv->npins || test_bit(pin, priv->led_pins)) {
+			dev_warn_ratelimited(ch->dev, "%s: ch_%d: IRQ on non-GPIO pin %u\n",
+					     __func__, ch->ch_id, pin);
+			continue;
+		}
+
+		u8 value = event->value;
+
+		dev_dbg(ch->dev, "%s: ch=%d: IRQ event: pin=%u, value=%u\n", __func__, ch->ch_id,
+			pin, value);
+
+		if (!lstp_gpio_irq_event_matches(priv->hw_irq_type[pin], value)) {
+			dev_dbg(ch->dev, "%s: ch_%d: Skipping pin %u value %u (irq_type %u)\n",
+				__func__, ch->ch_id, pin, value, priv->hw_irq_type[pin]);
+			continue;
+		}
+
+		int irq = irq_find_mapping(gc->irq.domain, pin);
+
+		if (irq) {
+			handle_nested_irq(irq);
+			dev_dbg(ch->dev, "%s: ch_%d: Nested IRQ %d handled for pin %u\n", __func__,
+				ch->ch_id, irq, pin);
+		} else {
+			dev_warn_ratelimited(ch->dev,
+					     "%s: ch_%d: No IRQ mapping found for pin %u\n",
+					     __func__, ch->ch_id, pin);
+		}
+	}
+
+out:
+	kfree(batch);
+}
+
+/*
+ * ops->irq_packet: copy the payload out and queue it. IRQ_EVENT is never
+ * answered, so a batch dropped here is a lost edge, not a deferred one.
+ */
+static void lstp_gpio_irq_event(struct lstp_channel *ch, struct lstp_packet *pkt)
+{
+	struct lstp_gpio_priv *priv = ch->priv;
+
+	/* No GPIO lines: no irqchip and no workqueue, so nothing to deliver. */
+	if (!priv->ngpio) {
+		dev_warn_ratelimited(ch->dev,
+				     "%s: ch_%d: Dropping IRQ event on a channel without GPIO lines\n",
+				     __func__, ch->ch_id);
+		return;
+	}
+
+	u16 payload_len = le16_to_cpu(pkt->hdr.length);
+
+	if (!payload_len)
+		return;
+
+	if (payload_len > ch->max_rx_payload) {
+		dev_warn_ratelimited(ch->dev,
+				     "%s: ch_%d: Dropping IRQ payload too large (%u > %zu bytes)\n",
+				     __func__, ch->ch_id, payload_len, ch->max_rx_payload);
+		return;
+	}
+
+	struct lstp_gpio_irq_event_work *batch =
+		kzalloc_flex(*batch, payload, payload_len, GFP_ATOMIC);
+	if (!batch)
+		return;
+
+	batch->priv = priv;
+	batch->payload_len = payload_len;
+	memcpy(batch->payload, pkt->payload, payload_len);
+
+	INIT_WORK(&batch->work, lstp_gpio_irq_event_work);
+	if (!queue_work(priv->wq, &batch->work)) {
+		dev_warn_ratelimited(ch->dev,
+				     "%s: ch_%d: Failed to queue IRQ event work (%u bytes)\n",
+				     __func__, ch->ch_id, payload_len);
+		kfree(batch);
+	}
+}
+
+/*
+ * HOLD and INTERPOLATE differ only in device-side rendering; the host treats
+ * both as LED pins, which are excluded from the gpiochip.
+ */
+static bool lstp_gpio_pin_is_led(u8 led_support)
+{
+	return led_support == LSTP_GPIO_LED_MODE_HOLD ||
+	       led_support == LSTP_GPIO_LED_MODE_INTERPOLATE;
+}
+
+static void lstp_gpio_clear_led_valid_mask(struct lstp_gpio_priv *priv, unsigned long *valid_mask,
+					   unsigned int ngpios)
+{
+	bitmap_andnot(valid_mask, valid_mask, priv->led_pins, ngpios);
+}
+
+/* gpio_chip and gpio_irq_chip valid_mask callbacks: LED pins are not lines. */
+static int lstp_gpio_init_valid_mask(struct gpio_chip *gc, unsigned long *valid_mask,
+				     unsigned int ngpios)
+{
+	lstp_gpio_clear_led_valid_mask(gpiochip_get_data(gc), valid_mask, ngpios);
+	return 0;
+}
+
+static void lstp_gpio_irq_init_valid_mask(struct gpio_chip *gc, unsigned long *valid_mask,
+					  unsigned int ngpios)
+{
+	lstp_gpio_clear_led_valid_mask(gpiochip_get_data(gc), valid_mask, ngpios);
+}
+
+static void lstp_gpio_destroy_wq(void *wq)
+{
+	destroy_workqueue(wq);
+}
+
+static int lstp_gpio_create_gpiochip(struct lstp_gpio_priv *priv)
+{
+	struct lstp_channel *ch = priv->ch;
+	struct device *dev = ch->dev;
+	struct gpio_chip *gc = &priv->gc;
+
+	gc->label = ch->display_name;
+	gc->owner = THIS_MODULE;
+	gc->names = priv->pin_names;
+	gc->base = -1;
+	gc->ngpio = priv->npins;
+	gc->get = lstp_gpio_get_value;
+	gc->set = lstp_gpio_set_value;
+	gc->can_sleep = true;
+	gc->get_multiple = lstp_gpio_get_multiple;
+	gc->set_multiple = lstp_gpio_set_multiple;
+	gc->get_direction = lstp_gpio_get_direction;
+	gc->direction_input = lstp_gpio_direction_input;
+	gc->direction_output = lstp_gpio_direction_output;
+	gc->init_valid_mask = lstp_gpio_init_valid_mask;
+	gc->parent = dev;
+	gc->fwnode = ch->fwnode;
+
+	return 0;
+}
+
+static int lstp_gpio_create_irq_chip(struct lstp_gpio_priv *priv)
+{
+	struct lstp_channel *ch = priv->ch;
+	struct device *dev = ch->dev;
+	struct gpio_chip *gc = &priv->gc;
+	struct gpio_irq_chip *girq = &gc->irq;
+
+	if (!priv->ngpio)
+		return 0;
+
+	priv->shadow_irq_type =
+		devm_kcalloc(dev, priv->npins, sizeof(*priv->shadow_irq_type), GFP_KERNEL);
+	if (!priv->shadow_irq_type)
+		return -ENOMEM;
+
+	priv->hw_irq_type = devm_kcalloc(dev, priv->npins, sizeof(*priv->hw_irq_type), GFP_KERNEL);
+	if (!priv->hw_irq_type)
+		return -ENOMEM;
+
+	gpio_irq_chip_set_chip(girq, &lstp_gpio_irq_chip);
+	girq->init_valid_mask = lstp_gpio_irq_init_valid_mask;
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->threaded = true;
+
+	mutex_init(&priv->irq_lock);
+
+	priv->wq = alloc_ordered_workqueue("lstp_gpio_wq", 0);
+	if (!priv->wq) {
+		dev_err(dev, "%s: ch_%d: Failed to create ordered IRQ workqueue\n", __func__,
+			ch->ch_id);
+		return -ENOMEM;
+	}
+
+	int ret = devm_add_action_or_reset(dev, lstp_gpio_destroy_wq, priv->wq);
+
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Claim @pin for the LED driver if it is an output whose firmware config
+ * reports HOLD or INTERPOLATE; otherwise -EINVAL, and the pin stays a GPIO.
+ */
+static int lstp_gpio_claim_led(struct lstp_gpio_priv *priv, u16 pin, u8 direction, u8 led_support)
+{
+	struct lstp_channel *ch = priv->ch;
+
+	if (!lstp_gpio_pin_is_led(led_support))
+		return -EINVAL;
+
+	if (direction != LSTP_GPIO_OUTPUT) {
+		dev_warn(ch->dev,
+			 "%s: ch_%d: led_support=0x%02x for pin %u but direction is input, treating as GPIO\n",
+			 __func__, ch->ch_id, led_support, pin);
+		return -EINVAL;
+	}
+
+	set_bit(pin, priv->led_pins);
+	return 0;
+}
+
+/*
+ * LED children not yet released. Their release runs this module's code and
+ * can come after the GPIO driver's unbind, so module exit, and an init that
+ * fails, wait until none remain.
+ */
+static atomic_t lstp_gpio_live_leds = ATOMIC_INIT(0);
+
+/*
+ * Deletion drops the child's parent reference, so the child pins the channel
+ * itself: this release then runs before the channel's, which the core's
+ * module exit waits for.
+ */
+static void lstp_gpio_leds_release(struct device *dev)
+{
+	struct lstp_leds *leds = container_of(to_auxiliary_dev(dev), struct lstp_leds, auxdev);
+	struct device *parent = leds->ch->dev;
+
+	kfree(leds);
+	put_device(parent);
+	if (atomic_dec_and_test(&lstp_gpio_live_leds))
+		wake_up_var(&lstp_gpio_live_leds);
+}
+
+static void lstp_gpio_leds_remove(void *data)
+{
+	struct auxiliary_device *auxdev = data;
+
+	auxiliary_device_delete(auxdev);
+	auxiliary_device_uninit(auxdev);
+}
+
+/*
+ * Hand the LED pins to the LED driver on an auxiliary child named after the
+ * channel's instance @id. Best-effort: on failure the GPIOs stay up. The child
+ * goes with this driver's devres, while the channel can still carry the LED
+ * driver's last requests.
+ */
+static void lstp_gpio_add_leds(struct lstp_gpio_priv *priv, u32 id)
+{
+	struct lstp_channel *ch = priv->ch;
+	struct lstp_leds *leds;
+	unsigned int pin;
+	u16 i = 0;
+	int ret;
+
+	if (!priv->nleds)
+		return;
+
+	leds = kzalloc_flex(*leds, pins, priv->nleds);
+	if (!leds) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	leds->npins = priv->nleds;
+	leds->ch = ch;
+	for_each_set_bit(pin, priv->led_pins, priv->npins) {
+		leds->pins[i].pin = pin;
+		strscpy(leds->pins[i].name, priv->pin_names[pin], sizeof(leds->pins[i].name));
+		i++;
+	}
+
+	leds->auxdev.name = "led";
+	leds->auxdev.id = id;
+	leds->auxdev.dev.parent = ch->dev;
+	leds->auxdev.dev.release = lstp_gpio_leds_release;
+
+	ret = auxiliary_device_init(&leds->auxdev);
+	if (ret) {
+		kfree(leds);
+		goto err;
+	}
+	atomic_inc(&lstp_gpio_live_leds);
+	get_device(ch->dev);
+	ret = __auxiliary_device_add(&leds->auxdev, LSTP_LEDS_AUXDEV_MODNAME);
+	if (ret) {
+		auxiliary_device_uninit(&leds->auxdev);
+		goto err;
+	}
+	ret = devm_add_action_or_reset(ch->dev, lstp_gpio_leds_remove, &leds->auxdev);
+	if (ret)
+		goto err;
+	return;
+
+err:
+	dev_warn(ch->dev, "%s: ch_%d: Could not add the device for %u LEDs (%pe)\n", __func__,
+		 ch->ch_id, priv->nleds, ERR_PTR(ret));
+}
+
+/* lstp_read_config_table() callback: classify one pin entry as GPIO or LED. */
+static int lstp_gpio_pin_setup_on_entry(struct lstp_channel *ch, unsigned int pin,
+					const void *entry, void *ctx)
+{
+	struct lstp_gpio_priv *priv = ctx;
+	const struct lstp_gpio_pin *pin_cfg = entry;
+	u8 led_support = pin_cfg->config.led_support;
+	char *name = devm_kzalloc(ch->dev, GPIO_MAX_NAME_SIZE, GFP_KERNEL);
+
+	if (!name)
+		return -ENOMEM;
+	snprintf(name, GPIO_MAX_NAME_SIZE, "%.*s", (int)LSTP_GPIO_PIN_NAME_LEN, pin_cfg->pin_name);
+	priv->pin_names[pin] = name;
+
+	if (lstp_gpio_pin_is_led(led_support)) {
+		if (!lstp_gpio_claim_led(priv, pin, pin_cfg->config.direction, led_support)) {
+			priv->nleds++;
+			return 0;
+		}
+		/* LED config rejected (claim_led logged why); fall back to GPIO. */
+	} else if (led_support != LSTP_GPIO_NOT_LED) {
+		dev_warn(ch->dev,
+			 "%s: ch_%d: Unknown led_support=0x%02x for pin %u, treating as GPIO\n",
+			 __func__, ch->ch_id, led_support, pin);
+	}
+
+	priv->ngpio++;
+	return 0;
+}
+
+static void lstp_gpio_flush_irq_work(void *wq)
+{
+	flush_workqueue(wq);
+}
+
+/* Classifies each configured pin as GPIO or LED, then registers both. */
+static int lstp_gpio_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
+{
+	struct lstp_channel *ch = lstp_channel_from_auxdev(auxdev);
+	const struct lstp_channel_init_info *info = dev_get_platdata(&auxdev->dev);
+	int ret;
+
+	if (!info)
+		return -ENODEV;
+
+	const struct lstp_gpio_config *config = info->config;
+
+	if (info->config_len < sizeof(*config)) {
+		dev_err(ch->dev, "%s: ch_%d: GPIO config too short: %zu < %zu\n", __func__,
+			ch->ch_id, info->config_len, sizeof(*config));
+		return -EINVAL;
+	}
+	if (config->npins == 0) {
+		dev_err(ch->dev, "%s: ch_%d: Invalid npins of 0\n", __func__, ch->ch_id);
+		return -EINVAL;
+	}
+
+	struct lstp_gpio_priv *priv = devm_kzalloc(ch->dev, sizeof(*priv), GFP_KERNEL);
+
+	if (!priv)
+		return -ENOMEM;
+
+	priv->pin_names =
+		devm_kcalloc(ch->dev, config->npins, sizeof(*priv->pin_names), GFP_KERNEL);
+	if (!priv->pin_names)
+		return -ENOMEM;
+
+	priv->led_pins = devm_bitmap_zalloc(ch->dev, config->npins, GFP_KERNEL);
+	if (!priv->led_pins)
+		return -ENOMEM;
+
+	priv->ch = ch;
+	priv->npins = config->npins;
+
+	/* gpiolib bounds chip and line names by GPIO_MAX_NAME_SIZE. */
+	if (strlen(ch->display_name) >= GPIO_MAX_NAME_SIZE) {
+		dev_warn(ch->dev, "%s: ch_%d: display_name truncated to '%.*s' (max %d chars)\n",
+			 __func__, ch->ch_id, GPIO_MAX_NAME_SIZE - 1, ch->display_name,
+			 GPIO_MAX_NAME_SIZE - 1);
+		ch->display_name[GPIO_MAX_NAME_SIZE - 1] = '\0';
+	}
+
+	ret = lstp_gpio_create_gpiochip(priv);
+	if (ret)
+		return ret;
+
+	ret = lstp_read_config_table(ch, sizeof(struct lstp_gpio_config),
+				     sizeof(struct lstp_gpio_pin), priv->npins,
+				     lstp_gpio_pin_setup_on_entry, priv);
+	if (ret) {
+		dev_err(ch->dev, "%s: ch_%d: Could not setup pins (%pe)\n", __func__, ch->ch_id,
+			ERR_PTR(ret));
+		return ret;
+	}
+	if (priv->ngpio == 0 && priv->nleds == 0) {
+		dev_err(ch->dev, "%s: ch_%d: No GPIO or LED pins discovered\n", __func__,
+			ch->ch_id);
+		return -EINVAL;
+	}
+
+	ret = lstp_gpio_create_irq_chip(priv);
+	if (ret)
+		return ret;
+
+	ch->priv = priv;
+
+	if (priv->ngpio) {
+		ret = lstp_gpio_sync_hw_irq_state(priv);
+		if (ret)
+			return ret;
+
+		ret = devm_gpiochip_add_data(ch->dev, &priv->gc, priv);
+		if (ret) {
+			dev_err(ch->dev, "%s: ch_%d: Could not register GPIO chip (%pe)\n",
+				__func__, ch->ch_id, ERR_PTR(ret));
+			return ret;
+		}
+
+		/*
+		 * Booked after the chip so it runs before the chip goes: removal
+		 * frees gc->irq.domain without clearing it, and
+		 * lstp_gpio_irq_event_work() reads it. Dispatch is retracted
+		 * before the auxdev's devres runs, so no batch is queued behind
+		 * the flush.
+		 */
+		ret = devm_add_action_or_reset(ch->dev, lstp_gpio_flush_irq_work, priv->wq);
+		if (ret)
+			return ret;
+	}
+
+	lstp_gpio_add_leds(priv, auxdev->id);
+
+	dev_info(ch->dev, "%s: ch_%d: Started as %s with %u GPIOs and %u LEDs\n", __func__,
+		 ch->ch_id, priv->gc.label, priv->ngpio, priv->nleds);
+	return 0;
+}
+
+static const struct lstp_ops lstp_gpio_ops = {
+	.irq_packet = lstp_gpio_irq_event,
+};
+
+static const struct auxiliary_device_id lstp_gpio_id_table[] = { { .name = "lstp.gpio" }, {} };
+MODULE_DEVICE_TABLE(auxiliary, lstp_gpio_id_table);
+
+static struct lstp_auxiliary_driver lstp_gpio_drv = {
+	.adrv = {
+		.name = "gpio",
+		.probe = lstp_gpio_probe,
+		.id_table = lstp_gpio_id_table,
+	},
+	.ops = &lstp_gpio_ops,
+};
+
+static int __init lstp_gpio_module_init(void)
+{
+	int ret = lstp_auxiliary_driver_register(&lstp_gpio_drv);
+
+	/* A registration that fails after binding has deleted LED children. */
+	if (ret)
+		wait_var_event(&lstp_gpio_live_leds, !atomic_read(&lstp_gpio_live_leds));
+	return ret;
+}
+module_init(lstp_gpio_module_init);
+
+/* The unregister unbinds every channel, which deletes its LED child. */
+static void __exit lstp_gpio_module_exit(void)
+{
+	lstp_auxiliary_driver_unregister(&lstp_gpio_drv);
+	wait_var_event(&lstp_gpio_live_leds, !atomic_read(&lstp_gpio_live_leds));
+}
+module_exit(lstp_gpio_module_exit);
+
+MODULE_IMPORT_NS("LSTP");
+MODULE_DESCRIPTION("LSTP GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

