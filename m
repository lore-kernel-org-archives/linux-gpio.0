Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023130.outbound.protection.outlook.com [52.101.83.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65933E9C12;
	Mon, 27 Jul 2026 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138208; cv=fail; b=oB+vPEDOIIV9fIsTvTLMc+xNbIYFYq7FcHtsIISy6pxfkiFCCTf4E+Vf/y54EO5YWS+NW3WQHCSMnfMDSQCDIELcYTJXrTyPtmp+gOkoCxMQuAHku5ECde4VMzomrJZPzDFuxPVJTzrtUxaU0pfj8N9R09f/uzeM7hV5hL4bLPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138208; c=relaxed/simple;
	bh=o/c+H8B6zq1+giRpUuv3lam9ZEmMdoI4wWHa2YE5MJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ph+wCPqPli2Sv080pbG9rNkWez86kAJAY4vO4qnsC0YdT8ZIlDR2NdakN7qoODP/8w/676q2n/Tp3KVyleFSmJpTie55ZB94ngCYVYeSdk6SUPMO//wBS52hMWkqh4umVIQRY3MfV6S+igw3IO/IBa8/LcXloRhTeqYe647XO+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=FBbwHjYN; arc=fail smtp.client-ip=52.101.83.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="FBbwHjYN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqYA9/11vVff6i4NDxVnCIN18y0FUcZLbeNo9lpvxILc/hLcetsX/raqGz+psT2mMagZIfmCgOkSx775Pj73E2M8zTbc6U//iOgpyNR3HuTO1Suf40MUra7kgd2xiKTfaod6Rh9+6ZquwkW/EP+m3Sc0vqE0VWdJDfEVp1v89wfoybsbScHbvsMlMz2Vo9Lga22/Ra5iJ7m7R5z0YKvKU655rk821nxkF/fwUqXKGiGAYswZSBEMeZpWPJ34geOcx/BCyE1KCoKhnr6Jpr8dlQy+KSoC36ARNXbqyuJsvAF26+zPnjBopGTQ6W9YLVjfwj3N8zqojLAGg2EzHjM34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wmBgjtUx95LSs/nCTPOnFApPqxMC+nDPCDYIy5PTKM=;
 b=j7qAWLEAtyguJP2J15syKudTJcTcTqyETyOG4LcNPWYApTPPglZzzXXZD6thrjPEdvYMWpEKeTBvbtdsNdKIAMwuqvaYtNqbOoEIJA3hiytupV0JvWUrAynaSX3g2w4s4AgZMTTldWw/o2RoJgB6MGbEgVh0L9isNpzRHNcMeEVokvVWXzSgyrpKePIEjNKC+O00W8jvvFnG9hQDQolec6tOxNwydlI325expCX9DKwP9rdVCwk+c55qRSnlUwBmDPivriMpt/RsEKf5J8VW5hPPxxrztwCeNl7mvpYOxoVNMHiWlmsiwUpFP/FYYl/d9bLFQ1mLlaI4Fyr6NU+eVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wmBgjtUx95LSs/nCTPOnFApPqxMC+nDPCDYIy5PTKM=;
 b=FBbwHjYN5K7l4l/Fo7rY4ipieH83R/FYKPxYdCh/naOBbwPbgk5BfOEnE8YJUKA9E59LkThD2yP44DheSRV76kMFfxHMJVYBmWw5GUiXdP1VpQVdA8J33ICmc0umfxsaAJHwjrY4qmWw83ikBN+3djmSFGZLcGeCKt2lzkhe3jF4wXn38W+SFMTu6kNHX2ObIGprxxUPVe2LKDdfYY2yXuBhyIvadRYRKECRVR1Qb2grvyHNfBa5JHk5hmdA8ZcOJMJ+nOW5KQz8kgmH/EG9gnT/NCwrfdixRIy1/wgGDURLZvveOoKnu+Z/bToW5A4tncsnvJDM0OYqHQNNIEdKQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:21 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:21 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v7 19/34] pinctrl: airoha: move common definitions to the separate header
Date: Mon, 27 Jul 2026 10:42:19 +0300
Message-ID: <20260727074234.3761170-20-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: 73800267-74fb-4d26-f3eb-08deebb2bb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	DxZXgCiI/mvTVUDylosTk7fGKdGotW+AOKSDHoTFSKlkrxxtDPSCVzyPJP/USyX5lM6T7yuMib+qyxrJngxHt8Z/9Qn87mNcYJh/uQM6WHd0B3oiH+KHFPVODqhknVuBufOcSvmXF6Bmoieu22nuwvjCN3dcFdCsg2AGl1bGT5Gc8+NWsR4+7xcFJG3g2DfCzbzhQt35Er9kQSz1rZA7blBq6xAWFW8lTiha8ntq8xEfxhOHI2Pb+p+O6mdfPP5To+wuyvKKYFRd+Ru6b9bQ/juf4fqP/2wRm1pc2Q4TJM5g+kGXlnd/PLnTQxqp7mzXWmlJUNm2kqFSympIcZhfzFmsa9uyrYaYHbyv7iqYhPyxjKk+mn0zMuZMaa3r3s7t2SfNrV8G7ho4QenJahEyZ3IToad50fCKaefxamKm6MgS7wS6orcu9keXUlnKEX2N41AVutr6tbO6AN3UF0p25s5++DHiHfPMeKKb3xfXNQxRLU0ChmAyLwUkj33t2CcdS/JlmbWjU/woL3X6abU/O4gM37nsHV2SEL+V8R/nwUaywi605HLpqkJwyKDc9IJxIZvnbDqdCQyWrwbf5sh5TEGXLdBXDkANuFVMARQKgwLkZCeagVbo9bboDIdRh3CODixXwHqP+fkz2TB2/N9yXxZ/As6ICrkC3M5UukAQvpUjIr3+u0NADfKTM5nuERryQzbxU+1G/q16gfc4PuGzhoJKR+3W+PZF01UK/HT9TII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wb6M6tqPZRSyLOCmB5RE2fx3r+UfsnNRZkJRCYm+YOXdypNTOUlU7qpV0OKP?=
 =?us-ascii?Q?QE4R2gfIiRP1Hnm2jdNf4T5mLZVYcD83PuIzWhpUzQUuIq4p83E0OD+3lfZz?=
 =?us-ascii?Q?Yo82FQA1bf6MVMBlgwCR7Ey0/kiiJvhhhdbo8105eThcQ50fTnAUDectnine?=
 =?us-ascii?Q?4N9JdLMLU6nMjAvxQxSMTZGqRh5kU1ufM4ZLH8qketvCgkmonub5wZZwF+Xf?=
 =?us-ascii?Q?S/eN3UOXfEUyGp4r77RvIBxchEApZFpomy2kRa4EnjOUYWhbxxTgWCPHlBp7?=
 =?us-ascii?Q?D9lGqiMA/Gy81Mr/YqiUmSRMJmw87FE7WgrBK7lZXm7iQGUBwySvaFJq1+N9?=
 =?us-ascii?Q?tVhL0I78RLmrqmm/jAkq8IVzxlHzFERCV5pyBfc1LbMDakSGFQzVIT0P3/P9?=
 =?us-ascii?Q?+lIV0uNIyMEtopXd7bx+9HYA/IbE6001hlb4jfRtDC2j0cCvxyIdhZCS6IPT?=
 =?us-ascii?Q?sSYOBOFO9B/mF7YA8erW3rgwawiYJ5tdgX5cgnqzCv7m4ONYWW3KKxAtfemA?=
 =?us-ascii?Q?yF67g5TKQ/9q+wopXJDfSSDF2W9CZmBUUchdV3o8qVFqKjS4GOREVrouw74o?=
 =?us-ascii?Q?HTqz0YERFA8+LtMmNxF/6tpXsfeuCpWkahma6E0L2XhK+Lj87619YVRfYFtu?=
 =?us-ascii?Q?HSYZdxA+ZQEscmK5nPUtc1aMWy1rYPZe7eSQjWb7nveUPrw7PIZlKg1VKebx?=
 =?us-ascii?Q?uAxFKrHIau1DDgDOeppVQ8c7LaeMz0Xx5pVNSPnSY+8eT+OBRd9O31Yq0T2q?=
 =?us-ascii?Q?EacwaOILifvwmq1xKwZ45fX6+SIjQFcyCgHd+YCxbqpNhLXiFlSg5W3bbnKf?=
 =?us-ascii?Q?4pOPafoYa1b4sV14DsKwtasVcCDTJHsI30sMPZXsmeKzsaeU/w3+9cA4jl2x?=
 =?us-ascii?Q?5SlLT1wvjv8/3Uk7z4jp6ou0d7X+F1C3N3RtOWlX19JudvpZpcemCN22BP0l?=
 =?us-ascii?Q?URqYpnSKu5o5lZ9qHhLfMmYh1gy22nmUSeR4U618b7EIbjxCPp2nNsjjIcEL?=
 =?us-ascii?Q?H/zG7MqbNRBkratjTq6F8IgbbjxpCPQBoENCGMWVaA9W0HGWGXuBLqWQh1JO?=
 =?us-ascii?Q?yT/HgwcGCWAcCIwPPZlhKRU4sUgFvFQOn/SH6XFSyNGZH7jLxRzweYFWgv99?=
 =?us-ascii?Q?AS1FipkP+JfhFva+n6MF8GLZ1M8p85SD9zCny/u2uS8vIOs3d1W2SRpvBLve?=
 =?us-ascii?Q?u/Mn2t97jbdMctiaXpNhXegi/Fy2n5Cly8h6/O2471NyzTaOhCZnlVWxaRw+?=
 =?us-ascii?Q?RfnkH6FZlOxz4/6gJQyMdC2mGOoZ9GxfgXNXySqVyvPwIs/46EufNTXN8oBc?=
 =?us-ascii?Q?6AUL02QcWB4qbHiHhMGKd/7DuOPATK3knsXChy2yruObHIRjmZgLNlZsKewg?=
 =?us-ascii?Q?6Fa3JqJ+HmRusCe0mr8qldFDCqeVsavafIw/DU/zAlWYFfMKRwQD9UxMsp8Y?=
 =?us-ascii?Q?ZYQDjDyvmrTi1BcsxEI8ZzDBHom42pZDZ1tH0zWzB/gre2xHpoixG91g9p0y?=
 =?us-ascii?Q?gtw17Yq3OXIwZRNeuK4OVai/QO3L/jKkISp1zobVYY9b27OPAM8rPjxP24NF?=
 =?us-ascii?Q?9FOnhnR5bjRqRCXUjGnK24GcNj7SmXDAiOFEmqusTjGWCmIJfYHPghR4db8n?=
 =?us-ascii?Q?c0X//NyA9da+IMbAUAl9NWDHXx2kBmz5kxb1QPG+Gutfu+XOen9esZW7H84F?=
 =?us-ascii?Q?TueLsF/1D7jiNIncWAwZe6ogkzIGZvMfYEkofqNAQm3DN23VEVCWKsV7S035?=
 =?us-ascii?Q?vNm7wBLGnM+9HzQITxZBoBROVsEBnsI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 73800267-74fb-4d26-f3eb-08deebb2bb6c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:21.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9oJ/jhjIuwe2JF74lWAubl2TwtzeGYBFKv7Z/BbM+7uKre9hC+4GFZA6j+J0bIDJ3KaYU46HffWwzeJc7n6GrOmNEqXXWRxRjzpenM901g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501

Let's move the SoC independent definitions and declarations of structures
required for Airoha SoC-specific pinctrl drivers to a common header. Later
we'll have several SoC-specific drivers, so this step is necessary.

Also move GPIO related register addresses. It's not changed across en7523/
an7581/an7583 chips and will be used by common gpio code.

We will not move to the common header file other register addresses,
register bitfields definitions and macroses that use SoC specific
information. We will keep SoC specific definitions inside SoC specific
files.

No functional changes.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 163 ++++++++++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 414 ++++++++----------------
 2 files changed, 305 insertions(+), 272 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
new file mode 100644
index 0000000000000..40d7e515c09eb
--- /dev/null
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -0,0 +1,163 @@
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
+/* GPIOs */
+#define REG_GPIO_CTRL				0x0000
+#define REG_GPIO_DATA				0x0004
+#define REG_GPIO_INT				0x0008
+#define REG_GPIO_INT_EDGE			0x000c
+#define REG_GPIO_INT_LEVEL			0x0010
+#define REG_GPIO_OE				0x0014
+#define REG_GPIO_CTRL1				0x0020
+#define REG_GPIO_CTRL2				0x0060
+#define REG_GPIO_CTRL3				0x0064
+#define REG_GPIO_DATA1				0x0070
+#define REG_GPIO_OE1				0x0078
+#define REG_GPIO_INT1				0x007c
+#define REG_GPIO_INT_EDGE1			0x0080
+#define REG_GPIO_INT_EDGE2			0x0084
+#define REG_GPIO_INT_EDGE3			0x0088
+#define REG_GPIO_INT_LEVEL1			0x008c
+#define REG_GPIO_INT_LEVEL2			0x0090
+#define REG_GPIO_INT_LEVEL3			0x0094
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
+struct airoha_pinctrl_gpiochip {
+	struct gpio_chip chip;
+
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
+	struct airoha_pinctrl_gpiochip gpiochip;
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
index 65447d7e5965a..f42631afc05d3 100644
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
@@ -230,6 +190,8 @@
 #define REG_GPIO_INT_LEVEL			0x0010
 #define REG_GPIO_OE				0x0014
 #define REG_GPIO_CTRL1				0x0020
+#define REG_GPIO_CTRL2				0x0060
+#define REG_GPIO_CTRL3				0x0064
 
 /* PWM MODE CONF */
 #define REG_GPIO_FLASH_MODE_CFG			0x0034
@@ -250,9 +212,6 @@
 #define GPIO1_FLASH_MODE_CFG			BIT(1)
 #define GPIO0_FLASH_MODE_CFG			BIT(0)
 
-#define REG_GPIO_CTRL2				0x0060
-#define REG_GPIO_CTRL3				0x0064
-
 /* PWM MODE CONF EXT */
 #define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
 #define GPIO51_FLASH_MODE_CFG			BIT(31)
@@ -298,9 +257,145 @@
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
+
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
@@ -338,91 +433,6 @@ static const u32 irq_edge_regs[] = {
 	REG_GPIO_INT_EDGE3
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
-struct airoha_pinctrl_gpiochip {
-	struct gpio_chip chip;
-
-	/* gpio */
-	const u32 *data;
-	const u32 *dir;
-	const u32 *out;
-	/* irq */
-	const u32 *status;
-	const u32 *level;
-	const u32 *edge;
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
-	struct airoha_pinctrl_gpiochip gpiochip;
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
@@ -1437,36 +1447,6 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
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
@@ -1559,49 +1539,6 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
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
@@ -1718,42 +1655,6 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
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
@@ -2883,37 +2784,6 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
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

