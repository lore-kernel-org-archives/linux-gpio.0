Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED8391828;
	Mon, 10 Aug 2026 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343836; cv=fail; b=Ybf3wvRVOpNuv+qKjYI4fNu7nsyLJXY7TjVJVq2l0PxhVnjb0CkFp542+kORRD0qNu0bjMqTX4J7ZVq/Nka6nwFAkN6QmYy8hJh44wQedr1u8hgSGC1+j3feHt56+cOKwV1jE5TLfZ1dw9+gP03eXYVhJnvJZTzxA/Wyv9sgu+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343836; c=relaxed/simple;
	bh=t28L1oUTsZ9XD6sIT2YdGl+zE3QrFsAYrzOna7rTNqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UnCRyGWYk2j/pMuqaacpudWZIH+jmULfN6OLDJ6ZKnStf9vH4utkJf1bRidVjHZNA4W4oRNYXoYkkuABFcn6yL2RcZc5EyJpxqmkAbDpl55Mm0Wl0YwQb4qymqrQbIz5yF1nyuwEFeIbvqmSCgKEPprxw0XL6dUDMQUFhbxE1W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkuROVkpM+Pe2EzwRRnKLjSxtuldC4ELIMBhLxvz2nd4iWNOVlU2cPZA5n20T7K3eLmpSC62FSegh0gaxYsfMsAZfmp/x90IZRwXW9O4XOSU139uW3Lxk8ELgapPP6xLry/dYVlXBmWIiqLqv0jwpWvKbsWhO2blPBDX6B0gm7xn9/k2On6aVt6WuAEXcmuZYkqXu3jTN8kaPWgrYZzgCh9FQbBcgizMTMEfZyjpE3LUUuiYfff8AjW57iJEql1Nusth6bNj3vNq7OJJwW6hOIGIXWgY/x1QydMTavy2oiQaZCIBS96wJfJ3tlYv8otd2IfQheo5LqvZQaDRr9JY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtsTRBD5By9lnAKnAtnF+WiK4mH+R20oalbMwPvliys=;
 b=iPjtyYt11U3N1U1xs0HRl4dTUhecnt9PRkXP1CoTo5BsAe36UBEbhafV5khXNBmEz3OQVTSHEP5334ZNkVvdjQJMVP5g0HmjkmtKXfnteIQobULuWz5gwmJjVYZGVQmS75pgSMNg7UxgPDYujVin6xEelF0X0peBFNHRPty5nznklHmnd6TiwrsGknzxcsObC0FE2CDx8BL8LftTdh14LW5L95anbjpffY9I1whqq/ZZGgVvBGb32B+v7VVyRtI2Ag0hV5clf6nWz9j0H1zue9hRUnWXjWWwM5OO7/3Xbca9J04r/MB7w5+/ZVVPCam8YBwiOOBz/PIt8ouKW7v+KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:36:59 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:36:59 +0000
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
Subject: [PATCH v5 01/21] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
Date: Sun,  9 Aug 2026 23:36:30 -0700
Message-Id: <20260810063650.239303-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::31) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0329e8-8ae9-4e4a-27b8-08def6a9c7b6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	t2v39563yadcQCn5BWebfsZVonCf31i8uzwjrpsgJ/lWcDEwRudtycJ2coKyvhacJyt5n/4apygw1eelHoGuba+AfuyImoVegaxDfedBy3AuQiB16UmJga5fs4N4UzQJKA1BgKQ+jYhsBvAKZMlqFnFWD/A/4YGxeYP4qXVup/RlqWkYQ9yutzt08fC9YIKAuuT2r/c7IAQv2gDuIcGh8h/A2D6juyp6gkPRnR6zZhJViYCidzwRBVgXXMaoR9Lbpf4fNb0IsxKfdQpMFdjT1+IDe9bmRFDD9PKF8wrV/4n65+mwTw5figT4fFgwCMIoiJi9V80tP+7ekO03A93u1gJi7hygTRDF48/IzVIVxlJGNF0zsP7ZPGPM98gmORoc+j/tzfjVoArAXcO+cL+Cb8C8YLFzp+WYXrCeLD+wbVnmXki56EYw0LJOufoPE1PoZOXCup7X+38gd4G1k/leCX3GImqhETPsvaimPL+CtbCz0oUonmgq2nVAQRrb0Fl9EbgYcQC7DeoXCfl0Cuw2O5i9G10Y+fH4P846/QkCI65Xb+SffoQlpZ+U5NI88bAVbC3tOpttlLTV4/L59UA1vQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XMsx7hBXdImuxW82JlEUfRA6MOZvtCYPWHVKBFwlHQMfmmetyLUsG5ECcZ0v?=
 =?us-ascii?Q?ZEp1d/tL96NACIF9WwGXFSlakZVA7kiGQp195G0Pe8EWD4ObRJuCA0GykvTc?=
 =?us-ascii?Q?nolYcnpmlkupAuNghQczf0/we9ZLSX5fpYZgkamwlB4OOG+2uMbRyCi10qqv?=
 =?us-ascii?Q?f3NLnh3GEtARbRkU/4C75fulh7jp3RihOij8cGmi/L11BKMikJkjrSvuQJ8L?=
 =?us-ascii?Q?Sbr4ppkHh6gyudcG1DJeNYxDFxSVxAsxsVWJb/+Y91/zCyWCOVv7UdyD+o2Z?=
 =?us-ascii?Q?MO82yeFYKmJwTAdywn7hjYVEF5jCxmjTJNjUHa9fcnvkiUdev7jFc5fvqD17?=
 =?us-ascii?Q?TP7jWulgsSWSx1VMnWCcjanQgfM15j9Yg3fo3rV0KsI2X5rJQCxbmM6B+wJ0?=
 =?us-ascii?Q?JOp/V3UNN6tVhhLQNpbWFbcEZsj8N7R4PRb8VQI5cAoCb5mSknJEUiF+6YeK?=
 =?us-ascii?Q?NxG6YPSm7NgsC7moT6D9vJFkvMtJ/i3NUj/5UFjGoiVpM4nBSomZ+HZq05Gp?=
 =?us-ascii?Q?4ktIJRcN0vjhgiLwZnGGZPYoih9M44gop+90a4XmwnUe8zmcIuEZV4AkEef6?=
 =?us-ascii?Q?utbMQJvLE5F5nxUEDXJMCbjdfTqf2RhLoAd/dXraLD3KQj9oTQtlzaIc7Y8S?=
 =?us-ascii?Q?k1gi4MhIvjqUGe7tE4ZdPaxEAIeePWNwRri6icq/vcDkPhroDJUlsshqkqba?=
 =?us-ascii?Q?Ho+lzHKceTzITCrxYsmdbhQhe9fzHJxhr0UfvPFMKm0Qqgxum3aWKxHLuUZw?=
 =?us-ascii?Q?PE7ylpE8f7JYZYAHIqlCUmDLT9ovI1ww6p+if02yTT2rOFHdiZIEPIfeKZiw?=
 =?us-ascii?Q?nhKCPsVpYTnrH88v9ZTYiHRmwA8Rq9ka/ZaMicKR+MI5IusB6s6evuNUptd5?=
 =?us-ascii?Q?KAoJCuWMl/DZNWOj+linUfXhto68/Xl6/0Wc/nXU5lAWhvZXo+BpXiC6rUJo?=
 =?us-ascii?Q?bejWBx/6oAVWzo8cW0m9sHEVqrhrKtSQvbGb641g+M+CgJwysoJX3VOZdth1?=
 =?us-ascii?Q?Ynlri0wecN0Pl6Xojb6Cu6JjKh2MU8rs7Q6GsED4ePW8hf4Pfs6FfzxNJjoU?=
 =?us-ascii?Q?vOmaGjATRUCEu2MmZsPnqMPtFMPqIXWt6ExU5Nzypoy3cjPs7GcKsOCxeUp4?=
 =?us-ascii?Q?KPMuHMyuAjLriG00qOvbaXeLSmk6IAdyxIOWCv6Y11X/7sjK6K0Sz3wnRzw5?=
 =?us-ascii?Q?asD6BD81oRXe2uIAOdnIBV5LbkCX7cO5k8YtBHeEy9RjGVZ4OQzlf2BmsSMV?=
 =?us-ascii?Q?Ss0WQaWtdzU1RYPXFDJvUaVmYpr0WKh5A5CIf/dVC3K/EgicipU42zH6O7Du?=
 =?us-ascii?Q?eI6sloWdvksoeodp608JyjzlkGTe7Rh4qs70ga6MeedNqQ2CESecJgh23/Xe?=
 =?us-ascii?Q?B1c99wvdgRXgrJn+CdxlliTVsOXtNbrdwWZAlUEG71MEeD4pb+4C9imfRDsF?=
 =?us-ascii?Q?Gvt99+8wB4OJdrOgNc8f46Wb7VukTkiYxbQubX3YK3YCKZd2yWmwdQdvUnsC?=
 =?us-ascii?Q?eXqkJkdGSWyeU+xo9sjB/BGOks/RjxBoU1+wmPipNE9+ZzkLDWbpqhSIvThE?=
 =?us-ascii?Q?ncWQDxxZEtegzB8DU68DVVSclQBD3nYVA/dsYeNGFqVMd5lTc7SU35Kygf8c?=
 =?us-ascii?Q?qo4kxgoVGzwFLLRO3UGGdBlRGhfSrWLtgIEvGh+BaAdddCmEYB4rbBr9XBaC?=
 =?us-ascii?Q?nbwjJtQ5ejU52exSPrbvgykuzlcjQBK5S2snjGZfmatlMdBg7OHmzPohxUvk?=
 =?us-ascii?Q?HJpdvNbrDLlrl7sze+nBw/OtxD/45F3857Nzrf/wp6DV8zzpw39G?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0329e8-8ae9-4e4a-27b8-08def6a9c7b6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:36:59.5154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVk1CgdmO9LckkmRKEVYC4kwUwCXB066oNYxs5mHgie+tPRnXit0sS0DC5YGO9PejQTd+rXC85uWbM42SBXzsG3ZKWxtGzho2CoEkhf+DFG8jb/QYp/0PSNL5y181Ka5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

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

