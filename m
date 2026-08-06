Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C7431A50;
	Thu,  6 Aug 2026 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054039; cv=fail; b=GeqmdKCqrDMD3pgsKvXsDsqqPuJWxJBkbzNCOMKVo5Zk2c3Udv+RvxldMGBTaAfwJ8UXlwmYh6+XyzIVhkaOT+OlSA9tgPoXVWoKkVmSyJRykCSF224LNTMle69I0x2PUJV/2jQOt9gFC8ZhuqpLxRiglvKYwIStC8Rhtr39Fys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054039; c=relaxed/simple;
	bh=ClbYKIGmjBpViIdFh4L/NrhYtP3K9YjHipy4LMDtZDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qGiMsK+3//a3W59GQxNxRRY/UBWCqKNw7cPcggFxHOajOY9MFN7HcZX6T5oMXnRNUSBAnCGrZr8w5MR8E5cEAvbqjX/F4liCfYxeYTCnywWijrGBGdoqy3XHWKMS48D48nQC4IN8O9BWuKXdSJPdg9e+avVtlLk/cj7XlHIyfEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=01Cu2saO; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="01Cu2saO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iToIQi2hUQiRpjLIC6KY1FHhoBCyVzlFjOH6KMQCFpLs4l48x2T8igw0SrB27XStpBCiWNxUCilIkVyPKPOpkaRnrfc4s+XzFzaTJgZBSFcILbtNIv+4jlbqCYij4hN55nUGA0jpFJxgvnc1tBVBgMk26K3EAuPI0R+zxpV334BCYhxjxppr6Bqa2CDkU9a1wWrPlNdIlsTvkwMVh9b4XAcQtLXZZVhmlUPayUG8ZfcX6V8lZUYAE4a2JxViQOx4t6/VspwIQgWToZAIqdiGbOqasdjnPmwsYnryyBxY9xE+KuIMtHprue276126THoDCS5fc/x76/zQUUOR8tT5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j30fhS7oAltAhz7ET7tEVtiIUNIwghKF74+7I5bpvY0=;
 b=TB0MPrZAMHq2FMzj9E5jSk8fYExCjykaPlanDk3kS0Q6or3LUgKHYMBsm0mFBHAndr9xwCgARcATDMNi6nG9nldQ7oLLHBWM4Tb8e82hDvRmAmwV9r0ZME/ugB/Uie3jQVuVP0G2TCsfPCPmqomXYOTfrXqW0GA1zOlN5AMisIXOFOJLTn1C/Fx/UyOEEAWg+i7T1GWHfO+HwJXpMpTQHopPJk3/BCNT1VIx55rz1lZAPhLT8UG6w7zWwNqMyVURlD/o+ks0Mv4WYgovJTAf0euyjd3neoYBjvNzDBAr5IYqxE3MlESwpbz0Sj2yb+GUd+AK0q39B8RwLqwG3WwuBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j30fhS7oAltAhz7ET7tEVtiIUNIwghKF74+7I5bpvY0=;
 b=01Cu2saOMK9H8ZOw1i9GwE1ga8fglo2UXPdfiFSdLFUAybrw2dQDsBivVsJfdY3ifTXHarLEH4hSMIyDU0CxXFqARsC7q13FKyG4vYuVIWzsFh8YFmWLl6G7IHSGdOgH98p7Iq3Z/17u8fvIZQf7NA9dYJvedSiKM7QnNd/z/lrEf1L5/b/FbI6Nv/pXKefWRGBrKVa8T+VxLQN917xdKGbnEz25kgqGC7qCkK8bGSAgBFzXtRTFANzRpS9UggDAygsAXFq1bQ9trRdZm9eVReADcEEJ0cbqG+Nodq+QZYWIdZe4nufgea2b/M5xi/MBqmMNz/I+7caJ1wehY7WFEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:08 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:08 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v11 24/37] pinctrl: airoha: move common definitions to the separate header
Date: Fri,  7 Aug 2026 01:06:02 +0300
Message-ID: <20260806220615.4078303-25-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8b5210-ca06-49c4-76bd-08def4070ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VKtin0NWy4Juoa5updXjZkzKibmeSkLKBvB6Xjaj7gDBg0y4C1Fj2s87ZRiYkuZSTAnyLI/UW6qGYPQDR1rmAk3po2Q7iZB7bnEXY25xXy64IKAqd9gReT7OAaio08FpprSEWxv0G1DbyboiAzlDRfnGHb6ZpTHQis5yf+HhSZ4ph4khsihrYYSvQVg05AnT28RXk4iakyBEgLcvXju1XfXotJun7oOj8cfrKz9LdEWaiYaRSfFAdKrhmixms0pA/TfC9bcCbG26g136TEz84wOyfRMElecqk9Ueshu3UOiAPNN43xvP5c5DJdyoVMpZdMEywB4QuXs5X8TOyOJ5WtG+bETU7CPwr3RPMxKUUieC0YO1jmLRoa8krugrSda/0i/1aQBdi6EL9TkNsviKY4xXO1Rw0024j1b6fmP3NCo2m+Zhabo3vgC6lLPNS3KsflN4hmVa8J3mrlxE+WItsHWIMnhCaqPPQsQiKpDe1IO1k93QiM+I2eNF2hJHvTySyXcD7Nw53dCpP6mNMupVna42ov6wXGjkRyuXDhxUGidr+9op7nvMiWtvj+187UTCjPsxEXmYyInt0QnObuYS60XIovksyUXlJvlnISv7LdLZ0lb6atExvIa5sigUQM66YJyqT8RmqR9vjn2kD8JwrHNgPOUVwRA7TXZSsXDvABBwqCN9OUXzvPCTQi/N3/tfWi4P/iOkWESqtk3yW3728h//O47naAdr+EXRVmJgCEfLcIK/SIeH/cEJN+R5wJ+U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?djhNDIoL3XhnFgNWbvJP3NL0SkwBVVge6bY8LW/k4ybz6vXfJHEMCD8H3VxF?=
 =?us-ascii?Q?W4qRNN+gF+9ILxz3/iwkNfcFCGQ9JwdrqwBPljZQiMkr4vjzk5y1BVNRlq1c?=
 =?us-ascii?Q?LVndkqWpBk+NuC68jkLx3ewgVptf3XwPPQrRltZawLqniG8h2dFy2h5LbWf0?=
 =?us-ascii?Q?NAgeC1O87X1vOeVT96SRuuyqW1Jx7sWGXWo3xCuUhmxqREPfHeBYuYxehH+k?=
 =?us-ascii?Q?8My30N9gXMfxZrtnkGpzHZA7OGtnC1xoiH5m3N+u6pfSe0mNogRuT+EMBAtJ?=
 =?us-ascii?Q?GzrWJOpqwC7Vpk1fG2vziLPw7Z/gPQhBFa9QDfODCAqCq9ON3MB/l8AHHe8I?=
 =?us-ascii?Q?bGra1iDJaOUPLCbD99Xa9QMxmOjyBRX7v3U6ARsiIg4er1BmKX+txHuEDWIx?=
 =?us-ascii?Q?jVJEUXjMfQAs58SrrIq4rtVAFtMcyMbT21RwXll5G0NFOHiTOXrbGMJLxke3?=
 =?us-ascii?Q?pu+X2DsAWdQ0/pnrbsHKvxauWiBIitNN9GzhzFFPSDWMZr/S7HRZHeAf0Sq/?=
 =?us-ascii?Q?IDTuLzpV0gAB+EecE5ETp07am3tthCjrKjozIw2AKj7MtdGZkFZtdZosoKsa?=
 =?us-ascii?Q?lheGuKQn1wRFIZbAOoppwYm+WTcdS/nKOmKyCm5MeuctZk0Y4oJ96bav3zg6?=
 =?us-ascii?Q?+eLGnb4E02K/BUr5riVhPmiogCEYLHUU9hQ8LARcrbLKMWGqxF9R6NWR5f8q?=
 =?us-ascii?Q?ye6i8lMEmjYtH1YK/COUwsE2mN8sxg242NgsV093ScS46Bo2XsxyVWHG9TX+?=
 =?us-ascii?Q?YjtfLrNub8xnqCYkMAGpfGFXuUWQk+rUWoe903q9r5yakexNxGNzGW1mVWI1?=
 =?us-ascii?Q?YZzFZVnmdQYb7e6M5qjMO3X5BNO5N08h2j3wJiswPAs5yDzOi003+vnS0X4s?=
 =?us-ascii?Q?fWROPVy3sWKv2EXkUVth8K6gOvntbaNjgYlFbI8HGZenvFTFz3wStuJJwB6L?=
 =?us-ascii?Q?cB9UP5z6K0p+o6v6R0W1W0Mg20Lc+FL8opQK4kIFaa+bq9MlD5EAU5E/QgRa?=
 =?us-ascii?Q?elJ1Cq+vLcCFWV4yQ8ETYf5j7mq0Ff3YHEYIyEkktkbgQ9RUIQG+BYTq4ndG?=
 =?us-ascii?Q?lXTKx1WbjZ5yR+0QbTdRBHl8b/daSOjgImuPLrTzB6rYsoBy3hc+rcExVC28?=
 =?us-ascii?Q?XIHmWMWiKG6q9DlB32gv6WwmbJkBt8k5zsvWYeuLw5DSjW4qzNWxaIj06vOp?=
 =?us-ascii?Q?TMhXiTst7ThbC3g3HWYDGDUhlEfUHme15uG59pcJ4zTTek2k4fmiGGblp7db?=
 =?us-ascii?Q?/C+7V0y0DFJIElxHLorNaA25tlUcvlUWdttExg+4aVx7MlU8akWoyAEqms40?=
 =?us-ascii?Q?OjybF6F6io3M8rUMWiRjd2m5j430menW8qJgBEVwwcv3Qs4pBa6u3qAWUdyX?=
 =?us-ascii?Q?iDPbROFZB2dXgs9emD62+VjXi7zZ1wmL8DpprbOGNfi1Bj8mPCHUraLSkTEd?=
 =?us-ascii?Q?r0fLiIDwRXKumAGRsUoWaRQf/S3MHJUnJZ1exwp4xaxPThobUzvPEG3fHX5k?=
 =?us-ascii?Q?1xLvXr1DOUNR3tD6GyfQ9pfTXUPaTQLmXlDgIS/aH2ZzH00E5KFxXi8UNbL7?=
 =?us-ascii?Q?FawBTp/nELlzRb4W/Es4/fEEUxIXBiqpnBth/mv5wpv7YdKQun6tc6zNTKVA?=
 =?us-ascii?Q?yX6X2gJriAh2LCGMEZpD+zwFxZLMvbgXUOIe8SbsP90ivZPo+UYOFjwtsImj?=
 =?us-ascii?Q?DV+UTk8XLJtXOU4GFwWiGE2v8BkKN58yjIgHt7FhnySWkes8XFeSF8SJVM4U?=
 =?us-ascii?Q?HKWpvEswCXeDweEetsogsgk28bprUtk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8b5210-ca06-49c4-76bd-08def4070ef2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:08.7831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93Cz8GX/TEieOUswROxRWlLud3KbmIxq2pIptENZ54VH5SDVPTds42RSC6QJy1Pf4vtsxYZ4Cg4rZz+/3mfDSJRzLM7/0wcfGr3wtFniYKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

Let's move the SoC independent definitions and declarations of structures
required for Airoha SoC-specific pinctrl drivers to a common header. Later
we'll have several SoC-specific drivers, so this step is necessary.

We will not move to the common header file other register addresses,
register bitfields definitions and macroses that use SoC specific
information. We will keep SoC specific definitions inside SoC specific
files.

No functional changes.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 142 ++++++++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 411 ++++++++----------------
 2 files changed, 283 insertions(+), 270 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
new file mode 100644
index 0000000000000..bffeea34c5a7f
--- /dev/null
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ * Author: Markus Gothe <markus.gothe@genexis.eu>
+ */
+
+#ifndef __AIROHA_COMMON_HEADER__
+#define __AIROHA_COMMON_HEADER__
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+
+#define AIROHA_NUM_PINS				64
+#define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
+#define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
+
+#define PINCTRL_PIN_GROUP(id, table)					\
+	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
+
+#define PINCTRL_FUNC_DESC(id, table)					\
+	{								\
+		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
+					    ARRAY_SIZE(table##_groups)),\
+		.groups = table##_func_group,				\
+		.group_size = ARRAY_SIZE(table##_func_group),		\
+	}
+
+#define PINCTRL_CONF_DESC(p, offset, mask)				\
+	{								\
+		.pin = p,						\
+		.reg = { offset, mask },				\
+	}
+
+struct airoha_pinctrl_reg {
+	u32 offset;
+	u32 mask;
+};
+
+enum airoha_pinctrl_mux_func {
+	AIROHA_FUNC_MUX,
+	AIROHA_FUNC_PWM_MUX,
+	AIROHA_FUNC_PWM_EXT_MUX,
+};
+
+struct airoha_pinctrl_func_group {
+	const char *name;
+	struct {
+		enum airoha_pinctrl_mux_func mux;
+		u32 offset;
+		u32 mask;
+		u32 val;
+	} regmap[2];
+	int regmap_size;
+};
+
+struct airoha_pinctrl_func {
+	const struct pinfunction desc;
+	const struct airoha_pinctrl_func_group *groups;
+	u8 group_size;
+};
+
+struct airoha_pinctrl_conf {
+	u32 pin;
+	struct airoha_pinctrl_reg reg;
+};
+
+struct airoha_gpiochip_regs {
+	/* gpio */
+	const u32 *data;
+	const u32 *dir;
+	const u32 *out;
+	/* irq */
+	const u32 *status;
+	const u32 *level;
+	const u32 *edge;
+};
+
+struct airoha_pinctrl_confs_info {
+	const struct airoha_pinctrl_conf *confs;
+	unsigned int num_confs;
+};
+
+enum airoha_pinctrl_confs_type {
+	AIROHA_PINCTRL_CONFS_PULLUP,
+	AIROHA_PINCTRL_CONFS_PULLDOWN,
+	AIROHA_PINCTRL_CONFS_DRIVE_E2,
+	AIROHA_PINCTRL_CONFS_DRIVE_E4,
+	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
+
+	AIROHA_PINCTRL_CONFS_MAX,
+};
+
+struct airoha_pinctrl {
+	struct pinctrl_dev *ctrl;
+
+	struct pinctrl_desc desc;
+	const struct pingroup *grps;
+	const struct airoha_pinctrl_func *funcs;
+	const struct airoha_pinctrl_confs_info *confs_info;
+
+	struct regmap *chip_scu;
+	struct regmap *regmap;
+
+	struct gpio_chip gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs;
+};
+
+struct airoha_pinctrl_match_data {
+	const struct pinctrl_pin_desc *pins;
+	const unsigned int num_pins;
+	const struct pingroup *grps;
+	const unsigned int num_grps;
+	const struct airoha_pinctrl_func *funcs;
+	const unsigned int num_funcs;
+	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
+};
+
+#endif
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 641b547a3276a..e02bc4a149ed9 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -5,47 +5,7 @@
  * Author: Markus Gothe <markus.gothe@genexis.eu>
  */
 
-#include <dt-bindings/pinctrl/mt65xx.h>
-#include <linux/bitfield.h>
-#include <linux/bits.h>
-#include <linux/cleanup.h>
-#include <linux/gpio/driver.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
-#include <linux/mfd/syscon.h>
-#include <linux/of.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinconf-generic.h>
-#include <linux/pinctrl/pinmux.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-#include "../core.h"
-#include "../pinconf.h"
-#include "../pinmux.h"
-
-#define PINCTRL_PIN_GROUP(id, table)					\
-	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
-
-#define PINCTRL_FUNC_DESC(id, table)					\
-	{								\
-		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
-					    ARRAY_SIZE(table##_groups)),\
-		.groups = table##_func_group,				\
-		.group_size = ARRAY_SIZE(table##_func_group),		\
-	}
-
-#define PINCTRL_CONF_DESC(p, offset, mask)				\
-	{								\
-		.pin = p,						\
-		.reg = { offset, mask },				\
-	}
+#include "airoha-common.h"
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
@@ -231,6 +191,8 @@
 #define REG_GPIO_INT_LEVEL			0x0010
 #define REG_GPIO_OE				0x0014
 #define REG_GPIO_CTRL1				0x0020
+#define REG_GPIO_CTRL2				0x0060
+#define REG_GPIO_CTRL3				0x0064
 
 /* PWM MODE CONF */
 #define REG_GPIO_FLASH_MODE_CFG			0x0034
@@ -251,9 +213,6 @@
 #define GPIO1_FLASH_MODE_CFG			BIT(1)
 #define GPIO0_FLASH_MODE_CFG			BIT(0)
 
-#define REG_GPIO_CTRL2				0x0060
-#define REG_GPIO_CTRL3				0x0064
-
 /* PWM MODE CONF EXT */
 #define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
 #define GPIO51_FLASH_MODE_CFG			BIT(31)
@@ -299,20 +258,145 @@
 #define REG_GPIO_INT_LEVEL2			0x0090
 #define REG_GPIO_INT_LEVEL3			0x0094
 
-#define AIROHA_NUM_PINS				64
-#define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
-#define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
 
-struct airoha_gpiochip_regs {
-	/* gpio */
-	const u32 *data;
-	const u32 *dir;
-	const u32 *out;
-	/* irq */
-	const u32 *status;
-	const u32 *level;
-	const u32 *edge;
-};
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+/* PWM */
+#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}
+
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_EXT_MUX,	\
+			REG_GPIO_FLASH_MODE_CFG_EXT,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}
+
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED0_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED1_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
+				(pin), (val))
+#define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
+				(pin), (val))
+#define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
+				(pin), (val))
+#define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
+				(pin), (val))
+#define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
+				(pin), (val))
+#define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
+				(pin), (val))
+#define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
+				(pin), (val))
+#define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
+				(pin), (val))
+#define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
+				(pin), (val))
+#define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
+				(pin), (val))
 
 static const u32 gpio_data_regs[] = {
 	REG_GPIO_DATA,
@@ -359,79 +443,6 @@ static struct airoha_gpiochip_regs airoha_gpiochip_regs = {
 	.edge = irq_edge_regs,
 };
 
-struct airoha_pinctrl_reg {
-	u32 offset;
-	u32 mask;
-};
-
-enum airoha_pinctrl_mux_func {
-	AIROHA_FUNC_MUX,
-	AIROHA_FUNC_PWM_MUX,
-	AIROHA_FUNC_PWM_EXT_MUX,
-};
-
-struct airoha_pinctrl_func_group {
-	const char *name;
-	struct {
-		enum airoha_pinctrl_mux_func mux;
-		u32 offset;
-		u32 mask;
-		u32 val;
-	} regmap[2];
-	int regmap_size;
-};
-
-struct airoha_pinctrl_func {
-	const struct pinfunction desc;
-	const struct airoha_pinctrl_func_group *groups;
-	u8 group_size;
-};
-
-struct airoha_pinctrl_conf {
-	u32 pin;
-	struct airoha_pinctrl_reg reg;
-};
-
-struct airoha_pinctrl_confs_info {
-	const struct airoha_pinctrl_conf *confs;
-	unsigned int num_confs;
-};
-
-enum airoha_pinctrl_confs_type {
-	AIROHA_PINCTRL_CONFS_PULLUP,
-	AIROHA_PINCTRL_CONFS_PULLDOWN,
-	AIROHA_PINCTRL_CONFS_DRIVE_E2,
-	AIROHA_PINCTRL_CONFS_DRIVE_E4,
-	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
-
-	AIROHA_PINCTRL_CONFS_MAX,
-};
-
-struct airoha_pinctrl {
-	struct pinctrl_dev *ctrl;
-
-	struct pinctrl_desc desc;
-	const struct pingroup *grps;
-	const struct airoha_pinctrl_func *funcs;
-	const struct airoha_pinctrl_confs_info *confs_info;
-
-	struct regmap *chip_scu;
-	struct regmap *regmap;
-
-	struct gpio_chip gpiochip;
-	struct airoha_gpiochip_regs *gpio_regs;
-};
-
-struct airoha_pinctrl_match_data {
-	const struct pinctrl_pin_desc *pins;
-	const unsigned int num_pins;
-	const struct pingroup *grps;
-	const unsigned int num_grps;
-	const struct airoha_pinctrl_func *funcs;
-	const unsigned int num_funcs;
-	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
-};
-
 static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(0, "uart1_txd"),
 	PINCTRL_PIN(1, "uart1_rxd"),
@@ -1465,36 +1476,6 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
-#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(mux_val),				\
-			(mux_val)				\
-		},						\
-		.regmap_size = 1,				\
-	}
-
-#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_PWM_EXT_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG_EXT,		\
-			(mux_val),				\
-			0					\
-		},						\
-		.regmap[1] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(smux_val),				\
-			(smux_val)				\
-		},						\
-		.regmap_size = 2,				\
-	}
-
 static const struct airoha_pinctrl_func_group gpio_func_group[] = {
 	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
 				GPIO_PCIE_RESET0_MASK),
@@ -1587,49 +1568,6 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	},
 };
 
-/* PWM */
-#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
-	{						\
-		.name = (gpio),				\
-		.regmap[0] = {				\
-			AIROHA_FUNC_PWM_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG,	\
-			(mux_val),			\
-			(mux_val)			\
-		},					\
-		.regmap_size = 1,			\
-	}						\
-
-#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
-	{						\
-		.name = (gpio),				\
-		.regmap[0] = {				\
-			AIROHA_FUNC_PWM_EXT_MUX,	\
-			REG_GPIO_FLASH_MODE_CFG_EXT,	\
-			(mux_val),			\
-			(mux_val)			\
-		},					\
-		.regmap_size = 1,			\
-	}						\
-
-#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_PWM_EXT_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG_EXT,		\
-			(mux_val),				\
-			(mux_val)				\
-		},						\
-		.regmap[1] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(smux_val),				\
-			(smux_val)				\
-		},						\
-		.regmap_size = 2,				\
-	}
-
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1746,42 +1684,6 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 				   AN7583_MDC_0_GPIO_MODE_MASK),
 };
 
-#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
-	{								\
-		.name = (gpio),						\
-		.regmap[0] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
-			(mux_val),					\
-			(mux_val),					\
-		},							\
-		.regmap[1] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_LAN_LED0_MAPPING,				\
-			(map_mask),					\
-			(map_val),					\
-		},							\
-		.regmap_size = 2,					\
-	}
-
-#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
-	{								\
-		.name = (gpio),						\
-		.regmap[0] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
-			(mux_val),					\
-			(mux_val),					\
-		},							\
-		.regmap[1] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_LAN_LED1_MAPPING,				\
-			(map_mask),					\
-			(map_val),					\
-		},							\
-		.regmap_size = 2,					\
-	}
-
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
@@ -2900,37 +2802,6 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 	return 0;
 }
 
-#define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
-				(pin), (val))
-#define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
-				(pin), (val))
-#define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
-				(pin), (val))
-#define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
-				(pin), (val))
-#define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
-				(pin), (val))
-#define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
-				(pin), (val))
-#define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
-				(pin), (val))
-#define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
-				(pin), (val))
-#define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
-				(pin), (val))
-#define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
-				(pin), (val))
-
 static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-- 
2.53.0

