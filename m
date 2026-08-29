Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6562F3C1F;
	Sat, 29 Aug 2026 02:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972277; cv=fail; b=F4+vrmv75xT/wAo6Zr3AQABvVezui0lOu7OUaXimbhf2Ss9dVV4e4CkIGwzEjLkc4817KNCKcJGaAJGKIL7jE8Ayl6fLFISZVHPviyHWyGtnVYfTtlBzstWCfzB9uCoziDx08RfHs43blWtrQgJ7TncbyFxGTPmBUvT2TyQbrDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972277; c=relaxed/simple;
	bh=t28L1oUTsZ9XD6sIT2YdGl+zE3QrFsAYrzOna7rTNqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=epX9Bt4U0q9zv8rsFANCpw56W2wsCpng1nNWUcaT+gAF0rOF3VyjYupzWnVkcpv6rulwghc+dvPgkTv65R9xC4TDY64Sq1oKFWQ75Fzs/7ebeImqK13B56tov2AgpEfhQLbQe0b3Mf+lIRehKaJ9jhRGr1iZZOaR3IeU3IagM24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgnOLQeHB6nYZkWyORZ0W8EER1PxRcQQalTRx0o36c/zPpFHhlZSpiNRB3kTe1mgeh9oyB9BxQBqEdbiwL2n78vOqlgxXDtr13mTBFaaoMOjfc8s37nHdUCcMK9Ei+fzKvdJR9XWB3j81BVj9Dtn3Vgh0/c4xm5vKmTwShLjYFu1bGFW6W8voiMH1LmrrUbsdZkrku98pAG6Y980KKJR9vr3+SUo7Jpfr7eRMnPAacO5ibgU9bxvljX2AaVgYHhclrcdIfuCj3XlD92nXpWRvJOOOl8oWXgz0tESTaVs4WGuFoaiOLey0LcjNwWKjS9os61i6VLqKLRkwaBn7XrooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtsTRBD5By9lnAKnAtnF+WiK4mH+R20oalbMwPvliys=;
 b=kjWROjJXX0B+u9Tt+HNy3KtErS4baZu9Ln5qolzS5G3YlI/X2toPdidDWRKFCzsSGLtPr53o4wWiCO96cNDF9pIh+XXFJi1lQ25NvkPdJdB6CmuH3TFxUqrXTPO9YqIonQrybx3qpee8+jxZIdi4jbrp2pAzbifSxeeHBAqk/5RwCml97+kzPjQ5y79+qSlR0bbgE4YOh+Z9V/+019tDZ4un5JOxbu0t9IFeDl5xlXBZtwoSxy3SZZjSdJWeyohwDSMHUKWpfYhGGZkLhiDtNkx/Ue9H+8SbBvc8e6aXwsjJhCPw+zPZoxb2N6JPDaACDWSWMXmxEC1VRHfW6vW+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:34 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:34 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 01/21] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
Date: Fri, 28 Aug 2026 19:57:00 -0700
Message-Id: <20260829025720.23915-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn (10.2.8.16)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: b781f8b6-daed-4875-2f56-08df057946b2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	EX8ZBFQiOz5AVUJ5Rswlz4FcyMh9csubp7XxjTCgz2/iEzxi0sLontI9FeqipmS2GKRnyKWxk3n/6cF03/xn7b5LAyEeku32nqTj7Y4OPRcHV3EfLFBIC+G8JxHCtUQs9RvKOIBkaKNygpsqjy5Ed1K6tc0DAayq1WdRcPyhDce4NWs3KV+6CQmVvW4gtp+FWbsSGcotHMbZOWfrM1lkNdhSJZQD7MNM8n1zKgC4XFsziuuxGNVM12b+CCWT/HthIKIgFJSf62b/D7lNE0x7bkkvOqzHBls1X/EdwLDWbfppXaW9cuNsE/6u2rztwIp8Y/yAk0TwyUtNdEEfEFcvjYOCrZo4ivxA5PvS1ktXLwENWh5AbLMxF/TOKJs9ZdTEIlSBa8qYOwvSnk9dLInqYBOc01S/j8CgzNY14+4wFOHXFT1lwb+fvCCMUo5IqOWBg46v0fXs2UQxtVpcxX+U4KsxjwQE/pgTcUFkDLk6sUu2DU6fLHox5REL7lEij7pNB95BGgAaAZQ4SeJFTE63tEE85p6qHEA1gR++15rx1QeWDXsaUurEE26rAA+OgIRzMu/MTFkhU47ECDlVlChbjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CAMf0iut2DnxFehOtZkZ0Q3Y63aWQ/Wc+rVFk5Ud0HfSOkeBC1ZUPHR7Ue2M?=
 =?us-ascii?Q?ApCJEUP+dCfflmIymzsafqPnXue9e7LracqKPG7WeljbU39pj3AM99CR48jn?=
 =?us-ascii?Q?XwOp7qXuo1Lw+bW63lTeaiy8Ey/m+2oYKQsSYbUUF4V3sKKj8CJbIKGkF86o?=
 =?us-ascii?Q?6ng7TkcKAcn0ZOqmzrGMccG6+ISZLo9rb4j2qBixkf2kHSg8mlIWNulndt+a?=
 =?us-ascii?Q?U/MyxRXqKd+S5Z/B2J4v01jIew5Lbe7m90sWpHG+PfqLMdKx6Z7PgPZiLq4A?=
 =?us-ascii?Q?GHDZgdFprsjx/cC1SSnu+z9wkc+Y2RTlgOxRS2DPa5iGSn0254wODnfrpSkH?=
 =?us-ascii?Q?SrVNZhcyLHzcgP4VT4EUtBGxpGIirTgvxFwsxBPy0hJ+9eW+46s0zbNgpZJV?=
 =?us-ascii?Q?eazUwSdZ+nqN93BRjjnOfDTH3R66730LaAZswujWw10/JsZ6zdj0IKamy/Wp?=
 =?us-ascii?Q?wmxcMjX2q2rIYPIBDej/HSwYv4+jknYQ3OZ0VecZ0MekFDoRuyHMD9sZPMnP?=
 =?us-ascii?Q?ZVKWugxXZhBYDn12XfFFBhHOL0o4QRZpMwr978M+Wf0NwYxFNiqY1P1LOWLl?=
 =?us-ascii?Q?Q01Z/9qsfznhyv8cURzivU4kT/Cg8xHpjTUGvtkrN85ewFBT3QUhAL+Syvi1?=
 =?us-ascii?Q?rF4m5RCqupYKvChhCuaPwvuJguDi5Y/tAILUBChuRQfOEcPDml1uKavMF5Fq?=
 =?us-ascii?Q?fDHndj+HukDYQ6kz9MFWADWEAZP4A+F1BkAKLlf1CoBnUSWA2fAJ8SCoheWQ?=
 =?us-ascii?Q?w0SbuYokBxoSF+c4HGBaP/q3l2yqtygfF0HOcNmXPi0sGVXgOxbRY1enDtP6?=
 =?us-ascii?Q?y/ikJH2AQHIaDu7l9ihcn91zoUvQ0zFfw2iUJKVkeN9la6BmEG0IVeLH9xCD?=
 =?us-ascii?Q?azpIPBxQM1At5cM0BZ9VlqbzZ+so9Z8Zl9RWKBdh6ZcGpQeq1Zr+ntsn0gUU?=
 =?us-ascii?Q?R+Yj7DE8sUV7BcYNhkRRCyhiOgVb5rdOC4GT8dY/u3e6DDr7enGRbhMXXKEg?=
 =?us-ascii?Q?4MMD1HeuCl0KDWZ/pOS1rwuEEVJX9JHGtelya+2B/larg95kKAVww+4ZRoM2?=
 =?us-ascii?Q?hIhVmDMEvCxnWLZDsTQ4dSLDqtCxINAcoA4NEeBpZ0Pjn6w9hUxi9vnp/Uz6?=
 =?us-ascii?Q?jVjZ+vycvv8Oej6HAzX4ODx3WUv/a8+x1d3W6QeKampdp7QzmVN4qMbj7zr4?=
 =?us-ascii?Q?5xVlQzMobObhNWuWuQSIQ0x0r4JqGbhtD8naydLkJAqF7s+mZOUy7QHTXsNw?=
 =?us-ascii?Q?jj4KrNOqTyB1JFQX1Ak+qlSAa6nd/Di4q+xwS80QgirNcBIAPmo+NHP/NtE7?=
 =?us-ascii?Q?nInzhz3HXzpNWsbbQRmajd5atnwJOkbZct2ThCi+gO6R2aYHdNA7bLX8zKJl?=
 =?us-ascii?Q?GJPM6LpwzdF53H8/LvBhLDVn61AnpNODY+glUmM3WOyH1T+EEyBgaIQd0yLJ?=
 =?us-ascii?Q?ng+PpWKQLExrt5EBshAG0BzKJcdeBad1kruM77O2St1r+YKSKW77T3nBQpmM?=
 =?us-ascii?Q?MHRQL0xkrPLdYu6OLb3wJhyTYeca+Tcpg3fo4ofR9jkDY6WqYXZUTwQVetyk?=
 =?us-ascii?Q?q8ZbWy5DmGkJEnhOmIwn0qmzPYGxkju7GX0TBlDBAAopOtp50/Ten9j52ZVL?=
 =?us-ascii?Q?/d0mUlIT9jn8o1GVDIKfQ+7kY/e4Wcve9igUziXSS2yEHalx/Q2Msv0IN6n3?=
 =?us-ascii?Q?Uje+x59b92Fy7pDLI6Kz/uLgH42tFp2cNTazrhbMi/eae0tGUVRLvwp1z5dA?=
 =?us-ascii?Q?ZdDiSIUZl2pZ1jmauGkx8zNh6mKjnGwfZQyUo8bPRrkJfrsa24vW?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b781f8b6-daed-4875-2f56-08df057946b2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:34.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InFR+zxB3ltNotYPSY/8FwYO0JSeLwSd4hNmY8oCddvbN8JNCmEpUxHINOwzF/hM9iz+tgFx1lOxkvbFZDquztJsS489FEcy7101gJsIIaU41wFlv1+X9nWKtpbK1r92
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

The StarFive JHB100 SoC hardware supports debounce time configuration
with nanosecond granularity. The existing 'input-debounce' property
uses microseconds, which is insufficient to accurately represent the
hardware's finer timing steps.

Add the property 'input-debounce-ns' to specify debounce time in
nanoseconds as an alternative to the existing 'input-debounce' which
uses microseconds. Make the new property unavailable when the existing
property 'input-debounce' is selected to prevent conflicting definitions.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/pinctrl/pincfg-node.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index 97dbce8a261f..17a6270dce31 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -104,6 +104,10 @@ properties:
     description: Takes the debounce time in usec as argument or 0 to disable
       debouncing
 
+  input-debounce-ns:
+    description: Takes the debounce time in nsec as argument or 0 to disable
+      debouncing
+
   power-source:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: select between different power supplies
@@ -214,6 +218,13 @@ allOf:
         input-schmitt-enable: false
         input-schmitt-microvolt: false
 
+  - if:
+      required:
+        - input-debounce
+    then:
+      properties:
+        input-debounce-ns: false
+
   - if:
       required:
         - drive-strength
-- 
2.25.1

