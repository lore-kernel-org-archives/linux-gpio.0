Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C63471269;
	Wed,  5 Aug 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933317; cv=fail; b=J8qcwVEMK9BHX6Chsmv5uEabowMJJt1IIddozBXDpVXwdGe/MoOaBeOfDO6T/kL2gOUZ4LiphuwMBcrGnlnybnt8T9sLsPRd3fKEEL8Ccf3tL0TbrpGoiIlbnTdNONjXG0QPqF22JhVvLLmtktYL+AY8bd+CYobLZinp/vNJE5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933317; c=relaxed/simple;
	bh=ClbYKIGmjBpViIdFh4L/NrhYtP3K9YjHipy4LMDtZDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y4/J3gL2jEiWzEodC2z6+y37H31F3eRQHb+4M6UWXhGvyThEAeK9hI+NXbF13SkrcNZidj5o1DrZLogvTn0DUyWkgkOual/f3/4TqVuAFxDbgspTz6q+HaUPLWGUeWWai20q/icrnMrbeyi9fzg4xHcxVyVX0ukn7VgPc+cES68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=vltNE+UQ; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="vltNE+UQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b41gu0EoWU3hgRdHBf8sRTITF2w+tJ1rWRwfTAvb7OiWYtZUauHej0DnjDs/fB80tAD0UCnSR1Ozx6AYmYKT2ixqHium92DhbF/6bA0cE/7M7/mCHF7Lx8SGDT4GTD7kx2RinJuNLsNqBZbJRl96DBs65jfTeF2j+dg0w3xmAiT1CrvgDwaxE2/yztxf1Nu7eryDD+YzswQRgcBV0MZ5gzBCp1uKX77w+ogYFjnzrD4RyrPEKrnYYilbdTvBkWfUqyJhYNa5uJLSxOwYsnJZwjVH7v/K3mRXvYeIIVpEP+95OVAhu9ETvSalKb5UEmKyeLCjz+16XCj+4dGDq85iTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j30fhS7oAltAhz7ET7tEVtiIUNIwghKF74+7I5bpvY0=;
 b=zRj5q4YH1dNAFrQf4Xi0tj8/RcfJVTayx+agPGKdQnKcIx8KSHnBDWuF5YqXg4UnjSSY8QejDXKn5XJjJ/4AO87n+Uja5a/KRrnfQu+rya8Ttv7/YLhb0B4tP3iRr93A2hovWvfWkNjM0nCj8/1OCJpWL5TmJ4p3GOBgj0hxS3uxNt/UIZ5Qh8G1lqnGL0amUhGKaXFml0eBEE/u/OaCIRSbRu7FHh2859AILDxNI0AFmXdbcPX8fizTbnYnrVDtf8aCFeNylCcvykvR5i742Ra37XRJSC7WJ3EVmcxmwCARpaK7u9ZMHU/u+lV7hKYVMG61SJSrhwT96PYostaTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j30fhS7oAltAhz7ET7tEVtiIUNIwghKF74+7I5bpvY0=;
 b=vltNE+UQfOo69eX5390BReByim3kCi6ayh581Il4cOwUK10nX3Cho/a4Kkz8XSY9kV9QYyJIEo0mPUYgjEyQVrVeOoMSHX869AeYzz3QnU8A48WbduWiuGUoHXzFpENJFTP+lfvrGsNePhc1EpL8l/KuTQQAs5282+IafxAmDHxI7uviBBfqzY0QNlI7s0GzwBjvnUUjHmxQiHrug5Vj+0TIlLQ+afJiHVrXJnX1u3RBD8oggPtvtB2SE2aVxFxQagCYvYYHxHmIceIK9BcEz/HYSfyjpq0sqxqxt25FvbNVqQXQZnkxlbQAE9VE/KiHC+DF1X6TSFb1k2q2mgrMUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:35:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:04 +0000
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
Subject: [PATCH v10 23/36] pinctrl: airoha: move common definitions to the separate header
Date: Wed,  5 Aug 2026 15:33:55 +0300
Message-ID: <20260805123408.3767648-24-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAVPR08MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8089e8-d5cf-4984-1697-08def2edf9ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D52joHTVGN1OQQXDW5vz5DMNMVNDM4+rtJZSSqJW10H9nDxspZ7OlvzGGBRHlrNoZyD2KMmG6MgiVO8bzwu1jrh9Mj5sfJ+p8RdqTvShVxCkNYEXv/DuzZerVsvD/0HW3joDJ1CV8DlgRfo6uAqNcUWVZ82YW2bHws2vhvD9NQ0/vZYC2xMhjZlNHBfY1D76G8YSrqugJlaGo9AxuSVB/GhY4nOErctSCdvr+KR/M+YCEvJUivZeluTMaUg8rlAG5x5JpydKLwg+41cWCKy5S1V3ZGIv3lnvrwFYGoxIIt+N4uAoKA6hx+DOk5kO/UA8MMGy25laCLHBJaMVdSdRIKj1aFakJzVbXcA/B//5TbcgUviT1e3Nng/c8kimGV9ImLJZSSTdieJM8qBy00dlf/vpjWfjNGIjbNNFVNF/d91qwVPhUYecf5DuSirztSltdS7Skz1PENU4Pcw6Wm5D2Y3+rJoE2Rc3rwEUrtc12j4v79TEfoBm+FOkQqzrsHWGojb5B0CFWHwZX/s46aXPbanOQaTXoVGVljznvZLcJnozerXMPBg0uWDaxuaZOA7S9yg/nBdkO7gPvNL31LMueOwJmi1htbty7Zq7kutdL53A2t420AZ0I2DeMt9dfD6v3X7CeUzULM/0yjFWMGJavHQYYFQdJsGSAcH9+CZaZWHLnGb9W5xSbEog5LQ8ZA/o7dN+UUzU07Xhi6fHn7M3tM9RUiGmGkJFQbDIUK1c0s8Go5dKLeP82adAuPNxS3dP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tFp/mXlYAF0w6eo5NJHm9BqH2+yZOdme4HyhoJ2q2B5OLGcoNZgALpJNi94x?=
 =?us-ascii?Q?l3LzPfqHMem1HYcP4L/xnYGHHfdcsFJoQY6UwuH2+sZd2kLz/vmMsWg/SV7z?=
 =?us-ascii?Q?F1L+UeD1ci0kfYGHakmt2iuLt2GojYitMixebW6sSsjo5UWBpHYEmK5hKEv/?=
 =?us-ascii?Q?pJeK57rK5/eaUvtWM54V8tMtCgn7ozH9KISwVn/ARq+Sz9kFzLFJBuRAQPKq?=
 =?us-ascii?Q?FloRYWDt3koMGUYa65ocDgLdoBROSPfKwXBPWmsjzY8EMsV9cw0XY0TpAZUP?=
 =?us-ascii?Q?BWumGhgI5FHqFEIgyfoSOWg+ejk83vTKDeXZScvC+G00yxJAAdvPfiTNMCiL?=
 =?us-ascii?Q?D6ebqNTqyyydyxrxYlZ9VzXbWUOHpDPMlUDD9RZTqtJRQcsVS2uiR+J7jvO4?=
 =?us-ascii?Q?f4a7ItAStoMkN++A+fcCuXmR/LRmkHmH5R9veLlE0mvJUx7D0OhS+hvMZTJn?=
 =?us-ascii?Q?Hyb3wrnwwK5JnLKrafyrBU8jb+ckOatJ9CopPPU8vaSjZSNczV+DKc6g6Lj4?=
 =?us-ascii?Q?P3Z1NJRRYQg830LZSE5fMRgAj3/kzFcoQ6wzsu01m+6m1taOh/pQ8jis+a1N?=
 =?us-ascii?Q?BofRz1JWjgr5CwpE0wIOBlrlTKpQmkix+fed+78ylzZVeGoEP9PPAmcRsO2K?=
 =?us-ascii?Q?Mz7gzjuniEOaT7vssOpQ4otAzU0ScVr8b/mgo5EFlOjxQw7dZ5FJT1hrtcic?=
 =?us-ascii?Q?VMPbhz8GMBTgJUy+cipxTUOCNvm4dnjmbsaaFZuSlI/+SOdYe5GoZyPZgXJV?=
 =?us-ascii?Q?Tv0GezEKz/KIY36sYpG8x75CtVCfTPS5kjZrp4Rwv1lV5aH09QLFkYOvC+fs?=
 =?us-ascii?Q?aoWLBM3+iTB7zPhsF1APBnHJpQt5gM8Gc6dlbqLCH4TxBBDxBJf/3rvs5tkN?=
 =?us-ascii?Q?NX2+JwXwLwu76nvpojLwR5YRwsUy9O6w2QtrnYjDuW9QttHiuSdFu5KQXPmg?=
 =?us-ascii?Q?k0ITFB9IeKkbq2JsBYQsdY5xRizG3ufjXmkcH/J6+yKqnDFosC4ZgHKAMyMs?=
 =?us-ascii?Q?PXLSMxlGGc0Bb7UsvYhuursZ3zqi5VOvHxMw2wg8LSm14TEnZMtBC5sxF6P3?=
 =?us-ascii?Q?KxSQ1eQSn1OYdEZ2f7iCrZ/qe/ooAbW1VUaqo6tm7xHVvxP0LkJriakvo/hM?=
 =?us-ascii?Q?2xne/vq7fxWClqO8xmiX8MqkA1QQ37AdQnmSFG5eqmNrFog7lohyGGp+PYkI?=
 =?us-ascii?Q?Mpt86Owucjar/zXIz7nz8Osprx9zRrvpLgbzGP9DDAc3TIJWFMfRDhKFVKIR?=
 =?us-ascii?Q?kCAaGG+UoxI9wKygfKAoDEIT2lfVabRRs6wccnVHe0ilplEdThlcKsI+Uwgv?=
 =?us-ascii?Q?N9DQB/B2Rlg56weTpSoeD9tH8Cd0Wjsid/ssFmXtWaA+kLU8j3F+qT2K4hQN?=
 =?us-ascii?Q?e14nW1D55nJTpAIgvCyoncVLtYpLR5rj1rhTjopmQ267LBK6UmrKdrvz5r1c?=
 =?us-ascii?Q?Zv+gJAEI4hmWp97imaCYlae8OqywP3ny73LznXAIhtAQv5QP0AbSgpj8J9ST?=
 =?us-ascii?Q?I/RB7sqSotWh5WUoIQIrmLopfXWf2650sfzf7RhhZNLV0HqLbomRq5nPiU98?=
 =?us-ascii?Q?RawfmB1D+xuh3Jy6PtqR/RL13Whzi0blia/1AWYLetvy36oi0TrgPq5t+HqI?=
 =?us-ascii?Q?/Hh6ZtCve8RrNbvjeKBZdPdnKKZHoTSZdhuhm6hKyg/821B5vGR6NgtE8CJ9?=
 =?us-ascii?Q?0drqCTMkcco++mXg16GyeAGZoT8/VK3w8GdCWGSG0PxIenmBr5Uytvk+Ajml?=
 =?us-ascii?Q?vRGZWaDKcdVwiy5ImknSMtDAEDfLkiQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8089e8-d5cf-4984-1697-08def2edf9ab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:04.4476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoBXgWWcmjDKvGfoy1jIblMqM4ULkBBriu7TP1NpkKzzQ+q+l9Qog8G39J0lYez7Xt/YzxdyQ5gGJnQO1MtqbkAXGj7roGO+lZ5FAzU3N2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

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

