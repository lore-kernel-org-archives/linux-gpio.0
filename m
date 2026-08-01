Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11503624DE;
	Sat,  1 Aug 2026 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571255; cv=fail; b=PFPqiZQOKOMPYQKh/oDYybpX+N/6haN4+45i6DxYM16i9DBD9K+T09Q44JNx4LPxCuKfYf6w+zs00uUKvJ7NFJrV3yHu+8FT3Sjyz4ddQZjht+J6l9Zb2mtroxkHgT07rhjlFe+Cc4UGYdM+ON05JAMO+JRr7E8Umts9C4imJBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571255; c=relaxed/simple;
	bh=mA+Syy7nWaOnU+Vz6593KW9Mx13AGSDfHsqGB8oDIP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KI25KDxSF155S/dbUQIikqLzf+GOgzRt++LHmmm5VaxHAWPSld428o2aB0VbStsgWJELwnRcufGqBCDiJugeH0wnc6pHOqfM/Rnt5vrPnGxLp5UBOtJDHfjLdS5Qe2IRSORweNQRS80Lw04TWH/mlF6IcmzyT9Nmi/26vcbZen4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQsIM2YR3j+nEZucL43Qg5ryOSarWgTJxwoTkM3ikN4hK3zI/usMQ7XXFMIrpXGM4c7rD3myFuq78wSpm/1ByltMWfB7qpMZBaF/uVwhmofAHzS0X0Gi+dDgWb/Yh2c2moweoXVq7qUefB+plJ3JHhPvzm6C9aycpx9+7s2RUiahDEdsFm4L4OnWyQhyOVuqwG9ydXKuthWGc0xPh64jX9YmsHH0CBtI2XeuinsUfHoAQITkU0wtsRHfjGHx1SZQXbVbXZ0Lm3+KSh1w0P7j3ktWNd7h93vRTeqUKQUQCiqcVELoLC9kAgBhhqtYQbTxHfWjRDjwVNNkMsMOEd/XnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jofb9gupG3NGimnQGT1iDusbE3mw3eFAZVUo4cug2No=;
 b=EPvbQnorT8Jbkj9EpWhuoUgYmur8FvYmL+/+CSoUX9RheDiS79qVTcDJHrum3I3g7kVvIoG+IqwFAyHEp5PRodEUNmdI6tV6M7vKOC6yc/TbuocMegNbXykeBuAiNq6AXiW32Qudd0UH8UZtBg69rQ3tv2kIdRp6L53pmOPGNlvySSJARyKO8/K6WPl+Hg4RCffaf2GNhN6dkVs3WniY8sfmhJjRc0rqj00mZmUbtloQRdyY9dQ2D22Z5pfhp4Iqt6kn3c9LjjQ3w2zSNJf7790bnlClZ/D03rwYcc0xYlYZKr9OpS/HRH4d72FFOHm0sMGdVU1wRlRFnBr/OVBilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 07:27:20 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:20 +0000
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
Subject: [PATCH v4 01/21] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
Date: Sat,  1 Aug 2026 00:26:51 -0700
Message-Id: <20260801072711.153217-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 417aa2e0-2e84-4475-f6f8-08deef9e52af
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	j66+LJxpiR9D9GQeXHK2RjBExmoihm983aeMgU/1qIpll2DiVActcpmJUC+DmmkzrYFMBF06v85Rkqv86QaS/LyaGdXlIm6mgKaRv5y43eRfhEwYGOomQ9OJPMCau1Fyf8SlPDo9NGRB8mwESlY93IdYR+CRd5ovM8OQkRzUuYOeXNcNuztm4v5L1012lScH0D+K1BM5blZQ1Csa+Z18QkGy2HYgkQuZ8xx6Yzw03uGkY33rq01fkc/JygIU24RmXPnZeBuHCZiMc/GWTwvOeNg9kwzsDEzjI+GFUrDyKLulDx63oXF1GPtHbrjGwE9JYK7mcvjxarOV5tcunqVG0tGUG7wMe5glYb6iJ93LFTNy4KOupeVyPYLVfkUUEl1gfDSnVCxBo6ckVWYIpI1qdTNaOYa63VNi7gAN2KAssLBMqB19lMuisGG4UohVhMtBuyvTwcs+1E58e5KdBwzirBgOdjtJh8OzvMvLmgeS0gVbkNUeHjW3t0T/Klr3wy7ti2zgdXF1FiqBQ2yWhBoIVrcN+qA3Q7/0TEUzwuEF+NXqR7tDuTeZmCm+Rs9oyPMpIn1f4KREWeJ7qx9KuvMMaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GbhuFdbMuFXWWh9724wEYEPf8JpoDE0I6FgK9pD56OY0eyEj8HidBN7Sj35R?=
 =?us-ascii?Q?6lrY52P4kmOQfx/bJC7OYalyS0GTq93sdw6mq0ZDzyvQGbxzdekK9DKQHAtI?=
 =?us-ascii?Q?kSb2HRQKKCZZkZ+9CWUtxk62ylRAiE5jn5EylFYIa4NwxGu8QYTsWx4ksGD2?=
 =?us-ascii?Q?oKgR5KPGgzvdQdRofxdTDBvj0XnDQ/VxJy1tzKaIuazCeDcccBDz5SbUBWTe?=
 =?us-ascii?Q?SXBjSJg7/CH56K6lbybRpAvPSQyWNAJVqOjKVrKw237mQJRQF3uBA+7l3VaJ?=
 =?us-ascii?Q?i0Ul3fdTNooMxEdteRqDHgzKprrTDuJSBUL1wlwQS7ZZn1ZnqpymCxnQdjiY?=
 =?us-ascii?Q?o7T38/hXyQ+LZe8G8ckVTzBNlqxgKBuIVVNC5pgZhfmd2sq43q2yPPlnxwZJ?=
 =?us-ascii?Q?iwCYKFUPGJWRa7B3TnCCAxa0AFwdXRnLHhInm2eVUDhRqTjKvCt0riQVzvjV?=
 =?us-ascii?Q?b9XrI3oH1eGu5BPP4dPy3b2+B2HRdVKKFoc9R/4qND65a2NJx4FO1DnKXm5X?=
 =?us-ascii?Q?KaVodPl3Uwm/nN/n9SbBNTYdFYe0kNY7tMXWxVgsBnXPAGbxgf8I7LhGa6NJ?=
 =?us-ascii?Q?54M5NTaHxYcU1APGXpj1rlkippz6Vhn1kkL1mzivfWgVBUWcdyxlHGBRwjhV?=
 =?us-ascii?Q?b8W1euuG3CXBWADiO7y67FigCP/p56/3SfPgjqv5kzOcS+bHiRHqSqB2q8mS?=
 =?us-ascii?Q?NMo+jjHFsTsBXDXqWZ3h4P3RIJrJrbTtY48NL3F+qn2JQYMHYHTq/pNsbQBe?=
 =?us-ascii?Q?bdIQqftN3/31nr85WwOutoRGowqTMGgGv7Jtp8GQoK0papDFAP4u3+KNQEI7?=
 =?us-ascii?Q?hj5U1vBtuSZ3c5UUgSXfj0eVMVdKiCdYJIHkHUf9uArfqjiK0ybZq/p25ZHb?=
 =?us-ascii?Q?9Zy5emljiuRqAfacFpb36BIYpCw3Z9Sl/PsDzWrV/ZJJA/ZaUGeJCNMw8bLe?=
 =?us-ascii?Q?7im8R4DGy//MXHPDj/QBWUC+IacWvuLJjdHcCCq7yzm/5mGTP9hnTOxdNaxS?=
 =?us-ascii?Q?DyNLe246HWHWQ2Kztvj+Iz6UTqZ2iv1HGwWzaGsN9vbKbnp5xe+RP9D2tYUf?=
 =?us-ascii?Q?u2QUY05UGqlsGFWL+Tc71QJakTGhin+9GwhiAUBnm00bZ8VYV6H4yxFUbr7h?=
 =?us-ascii?Q?iLcxu3FzFyGXBTnsip3LJuCVkq9bgAZwa9YUniIpMsOgED+NoyMZ5ySFKmKl?=
 =?us-ascii?Q?F/Vhg7mC/5gqGJ21Ug68FYrw4oq4DSeJ4RGg8QKzEUHG8YrOvb0FQFFhdF/F?=
 =?us-ascii?Q?slBIgAqbRAYIX8u57jxpuPhhSVuHPyRmJ5sUnk+W15vSYf3WdRJaELoapMjb?=
 =?us-ascii?Q?BnsSinQ7+n3K+n2rq1eqBHmCpp2F+2rPgnuXFGvpjk3zQhAh7m71l9//diW1?=
 =?us-ascii?Q?2N00sutngPSeeF3zfYEnM/wLl4p+aZO4M9VKi2JXhR2R8ZM78QluLw/K0J46?=
 =?us-ascii?Q?paEl7AXp4xjeImCL73fIFSelCXexBMS2AMrbsPtVQvtwT7eO685TgXAMgbpx?=
 =?us-ascii?Q?LFvJJUNvk7t8Kqy9KzDLj64up44gNODoLiHqRu7Vm3WlqE18Q9s9TcMNF3Go?=
 =?us-ascii?Q?teZKenrwd2thVmILpOsUPvZygq0AQhGHO4/UX4vridZM1f1WJp6XazJYvo31?=
 =?us-ascii?Q?QFvAp27A9bXYfZOMKjx1n6QWrywVJTEOw2STMPqhrNk1uMEGo2PwrCjN9uqW?=
 =?us-ascii?Q?W655xLM+jq3lCnU3nEM/DpGAtot06eEq1V3+ddyVN8eCb2OrmhJ5HJikJROh?=
 =?us-ascii?Q?Jt0lb0qRZfzz9Kj9maP3j+CbRlZe3RD9D6N/yINU1F4n0rxQZKKE?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 417aa2e0-2e84-4475-f6f8-08deef9e52af
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:20.5306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcUkagZ0cak4B71jvuwDGY4WoQlAYWXLICTg0aKlH2LtPvl+CIEEkmnsXSET86YfhSqToTz8e1GJRqq6SUsnBTz5AC30cKKKXDtXKP3k93QWLtRWn4pAy7Ml8D1unYv2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

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

