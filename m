Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C743BA225;
	Thu, 10 Sep 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034678; cv=fail; b=qei50h73PGjzU8jWPaMz3pzEDPh/bvKZSFt2bh1QlHUUMSJ8kCaLSq9SLFPk3QCR3xBF10cUIcXI9foc+hgyQGLp2UXkEB/rMTn00+Rg6+KqIHq5y7G+7wg6KwQr5+AD90TJBZZ/LFfrvU3TaW6vc6jF4sbpkt1Q7Zf5bVPEAsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034678; c=relaxed/simple;
	bh=t28L1oUTsZ9XD6sIT2YdGl+zE3QrFsAYrzOna7rTNqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nbntKWSdJoHh9BJToh61ndEzPso4HpaLWvg/EEUhJcKdQLOulj97oi4jIKtCd1OxPHmVm/AvZPGTGXsb1sc31PetMZDW1hbCYHm+cuykqs26Q9OUN31ATAXrZVVjdBQVk+KZHu2cSBRMygBBQ+FzTrAq3Zl/ENalZHf4yzR8dRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh6rJrCBUzMZoVuNUkkmTI6T4D02XteZQ9/MjX6yFrVnF/xojUj+MGZ56r7z1x8Tbs2AoJLmAboUjXiN01TzNrNr5UF6AW92LB8Q0lTZjYtEKwIVqr+Hdes6VUfRwiSNjwyFWdQThwzevAioCQcqHTqDlavrnvrmooOMD4yCfpwR2uewScYjCaGvekr+eiXbdvLomYoK7x3FY3rX9h6aGEAQD+WB7D0y+MwM+L7797cs5ovaJb0h5T3gFvJ+8R1VtkMCajvj5Y8qtb39gXG3mVgTrNjOgVCBMkXkxqOmfGU4FHhFVjzFCQcJDzcH19R90yfNkq1XvvagxMnLpICklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtsTRBD5By9lnAKnAtnF+WiK4mH+R20oalbMwPvliys=;
 b=YvavI5N/6R8wm8LK5J/v4en43l1gQLVY2GzXUyhMxJfyLWshbtYGlJa02kfGe74CDRnqkIOgNbb4iLegW+ocx9N7Xl/fHzHGSPNRp8gupOWFuKaMgK46uGwJQa9D6mN1qaH7lf05zUAPw5HC4piIH/DiYDScq8nIbAIF7OZiL+cJLhHUDzVTQNMuU7QAcZBiDReNfDuzk/27cRWhYLYF+dXcCkuc40CEtIkCygZUo8ONe9E9ghW1C/zPpUaKxJ6LoF4rxIYm/bi6f5vTftOpnb31gD1/MvgMFk6WEh0fQqvynCmTIErlSPBKBmRb2dRNDY8AgPxuVC70iJrYEH7oIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:10 +0000
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
Subject: [PATCH v8 01/22] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
Date: Thu, 10 Sep 2026 03:03:36 -0700
Message-Id: <20260910100357.130134-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ba223d-09c8-4a98-2930-08df0f22dbe9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	ujJq2Q+4A9nGJZfBPUv7+TyFXT7Ts2i4vTQC6YGh0XMUplt+dxXr+r16wewEYh5Un0mmig1TO2AnpNOQykacZ22ggGc8qaCbQz1/RWX6Xeh5J8utyi7/pBgqMmHtUgc/T/NFV4Am85ipUjd6qVvGqS0mjegR+5mQh5U5a4t165qQW5nKKQDZTQf+XDHfulP1V91tSxphSKqJgtkxwBokJVqmQHwFkGkggtU6E9/g6vTcEIZDg4nFBU4uU3T0q0xJwS/3f8a6KfFZTGtjfHGZ7qbP+lDQ707bLPxDbIqytCCS+Dbt4MKQEysN+4WWY3UeYJ77UdF29EOXu90lxeScGlwc+wY3/xbkjBm81bfsB7ns+RSwrkEWVRAuptpo52qSAOrgxEFSyOQvSilRig+/wnCwzlzWrAJnjj7JYXPyUM7AN5JpxAj2wfHafBNV+UBkPSPe4Ij9rQKyE3oqWuZM/Ew0XJmGPhbufFEn6LY18U/24FmOOv5VlWrcvC2OHjgnn3ZsKFmevoDl6Rhnl36qSsoVZ9xagFUXwYMfUbTyKEA4l3R7vtVvxhHlya43FK9i3KVfOreUNbSeLXimd/mPSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MSAIJp8yWxi3MieUL97WK77pOUkFo/GkER8mYx65lb+bWwlKGD9acE3P5fWP?=
 =?us-ascii?Q?kHfgE4kQq4tNCrFWKYO7mzzWEXHa3tKXJztrQLr5MB8M6omnayXK1gyrIA9W?=
 =?us-ascii?Q?CS736AlSf2oscGi1hiP1vjkIUDhi+Y3a0HoCNGl3dPv69klWtfJw97FjFojZ?=
 =?us-ascii?Q?cWALIoX7AZH6bFwbBsf48RC8uDD/Hnx/jrezu6GTQLYFYKKTSWJgl67D87gI?=
 =?us-ascii?Q?t9a4GHaVklStSKLqO3sb2KkTxemdQNo0zssTqZIQ+qLHH2Q2Ig+XK4XzOoUw?=
 =?us-ascii?Q?5ACQQIP3rNnzlClTW4nMxmj86LS4yFiYNTpXgJ5jDmPrWb/29x6NXo3QrJ/H?=
 =?us-ascii?Q?pOvyLBD03JUVKF723IvOxEElGdgorxZ8F+sgacExPjQNx1CcZTL1igCnhQG+?=
 =?us-ascii?Q?/egVStoqKkOFk7fDX/bgTi5OM6em8YMm4J7TFg7biLzpaj4xbCb2KTCbmDCy?=
 =?us-ascii?Q?w3zzOWGsRmSPjCi9bUbK67++vCfZ0YSeuqisSvH1T1xP1jLLvduF71kPvET5?=
 =?us-ascii?Q?AqQd8GIAKkhaAX2/QkVn6gCzWsvwL3o7zbpQFZ1+I1iNhVCAXx0QFqVMc+lD?=
 =?us-ascii?Q?mcS+j3sZkzR4a4tQ8frQp3gvQe2I0FgRCixU5QH/OWjD1DQ1Ras+NLbedCRg?=
 =?us-ascii?Q?vTAI4HSH4ykFO+MSe7OL78Wl5Y2B5gIBqcn9BUylEbcqIzETmaHiTyZZq2K9?=
 =?us-ascii?Q?eR5dO2RIVVLTU4+2OuTfn7JnJdlhKyx/dtc/+SZFIQd2iY0P0yWxskLfw4Az?=
 =?us-ascii?Q?7tQUXTe+KtVDKtgfmrg3FdHAwXAF070bCWrmxabixiHq0R0zQaGZC2bj2ZHE?=
 =?us-ascii?Q?mggjWc33QuoXrD2by4XqQjN8R8uiLlTt3PPcILfyn6bj2kR9dUcLiDJKgb9V?=
 =?us-ascii?Q?FPm5ulwyMUDDBq72UzI7E1JQDMet99mf+CaCekiUgMtyVYFTxPci28XqqxlU?=
 =?us-ascii?Q?A+pnjo6S9melETv5mXnC/wNyIQOHTnfMY3fV8lREAx+0xN1OfegwwKKLVMCf?=
 =?us-ascii?Q?JeD5DUWc/WTjcZb6PfcPWJ8CpMtXfO75G3hMg/U+VOnufdHZNhYbh86N0kJm?=
 =?us-ascii?Q?Ii1WlxT6XY5oIyO279lNg5kSGYuZ/oy3dTlVPu8CZK8N+J2HA7MNzOJ/Emx8?=
 =?us-ascii?Q?tqEHU8ucP7T//0evw1dik909W3iYBwMCD3MZbZOsCsyUMwRGiPRWIPbip4ai?=
 =?us-ascii?Q?wqft5hNgev9kgn/vdns7WmEpK5T+aPZmAgPMFJTk6fih0pHzhsbXr9KRQf0m?=
 =?us-ascii?Q?ndhjxkZ4izBCTPi0KhoGN1XKn7SGqfE93rdqwjgduNqFRCU/YxdbjyFsiQJT?=
 =?us-ascii?Q?VmWbdiZ5yzxa78eE0+Bx0hFkjhyzri2JQpOAiL/k3Ml5eSvuoQItMWAXUsi7?=
 =?us-ascii?Q?H5OXC/X72hgEJLQQRNvzYREY8WVdAx0P2HIep1jdLMoys2DakITKU3yqBxEX?=
 =?us-ascii?Q?tnClJSHFsglQwS7rF3wEKmtyPphEEJevUJ13IyV4MSqxqsnBIqJq7ncm+xFm?=
 =?us-ascii?Q?qG2Ni1AKMNOuJg7UkTySV3zsbptfAFKoU9YqottJNvYvHr/Ip/zRosy6mHGt?=
 =?us-ascii?Q?OFWSs+xhkrHkL3XVCnomo68AFu3BI16lj2mpX7S5Vwtl6unbWt9KsgaNYwek?=
 =?us-ascii?Q?drlEaysEXy30Nk0279JgOu7a7uczaak4rQ7PFS2S5tGWlL4hqZdttI+W5tlT?=
 =?us-ascii?Q?fwLQGSKUcaDMtbp1znnQ/yxk3U/He+XG1ERV4c/qfWN1BVZpYI0l2aVpuQ7p?=
 =?us-ascii?Q?sfkrUTS7twhd8AhZvAAYeQzeEM1C1rdzDb5Ny90gSrMULvRkofHG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ba223d-09c8-4a98-2930-08df0f22dbe9
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:10.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ym1LZ5LmGbRpQRcCaPgp1natmc/BB9xQueDxLD6VFmRWO9cHfbJcOMcpKuWwXAJ0QGX/uLk1FEG/VRsDXkNRcUG93wzAS0xz4PFr4uA0oo37RmKYfslVkbubuJrrBCcF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

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

