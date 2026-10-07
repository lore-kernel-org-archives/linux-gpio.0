Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3164949D589;
	Wed,  7 Oct 2026 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370259; cv=fail; b=R7PjiYILasK3tK77kkRJH6i0qCzuAfVKw0mS2YX/NxQx1NBZaWRf4iapYzpv+sHK4zXvv5IDs6SY2dvqrvS6zy/L1y5PNZttbmX9Nu43ilSxeKllmSnEsSXEiaTaAishlnfYBjZkpzixE5veCpb3Bh1teGsJWHM4RKuVx3iDGpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370259; c=relaxed/simple;
	bh=riPx6Hd1qx6Ym1VDTmvlcE9QTMb+TmKg3bbeHqsvlRQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iHHgu7H5+asqSavWZG3+Yf48QzrJNNEFO/qVEwAxqVS05zBtvdtlOfykRgXioZCBA5zFWweYZEmptgzdGL5GybMIMrcijI8Rodla5NCp798MUKdGW7hP+cyH1W1dC3NnGu6FaVqnXpY6uBMvtmE2KgDmmv5YBz5y934ICPj0rv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LFL6pq1g; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LFL6pq1g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdPKNLaCrQqpEZtwu5qC2er3M9/ipsTmDMa1x0qNcWAHUVm7SXK61N8iwrorYBQr0CZtImf7AXPK9/LmT5ydMDRzHutaPg6xD/fOIKS+YntZhouyDwSkfhlSBNdS/woWkHZOURIVs9fnDykdTMPixCUYtAGaiKeuNvPN+HOh8mMqvgEXC7Gr0tBsOSiQVfh0LT6eEVSfysgHOAubh5lrq+y7yBa9fnmiG9iKOzGeSz5zgXzVCzYaLRknvL56Hoa2wCwuRphiPqUgDgpwSIl64zOvqx653CNCSYq1V02PQ8zKdI2VdyLMgEf7QzQmQ6bNWw7usyucOUrJxuCyMYU+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiYwXlvASnSVCxp2XgDqXeZkkpEAjT3F61JkcZXb7I8=;
 b=TQ6EIvqMoY86KW5eKRj0rRut5mFxnjE3DJntFvFxNehpSb2oLwd97LucfPH4q011DcYOQV5ZoT3n/iYGdvf+dBnQcZFTNKSc7pZKZ+2iSwhD5I9y/8qOIbCJFB/8gpOvvSCwHctWo3pW/wZ5Jj2NToFhYph8A1iF3jdkvHOfVI1olSsyIAeg2iTlDCxAF/G9EJrg2fQXkKXcADC0iPTlnW9SKQNgCXD1VEdrKMh4HW1RVMtY1qFzaDS52ng7wQAu5VR33StAKzbL85867SbYM54xx+lI2a8dtLrAxiUeQRVhNBuZjBHbgfTH4o+YfEvs96nZvck5c0m1pXjTza5YCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiYwXlvASnSVCxp2XgDqXeZkkpEAjT3F61JkcZXb7I8=;
 b=LFL6pq1gmCvlFzb2W3bfkfSYZcS0ZltIWm9k48k0T1ixkAxfGo38ouaHRnKdzWPFaROhvnpK+c2dXt7FdnYc4+sJFczZKdN2MvaESz+RmW99pVpGnj8ZO4sSlcwQ4OSWSzly/JpzkAd16yvQgexMWTiaW6vu/mLZOFfjSGwNZzBo8q1QrURrjslW7+s0LBxokIsZ9hdJ7EhK5Oub13YwVwE5YHZynmYqjnBlaf08lowCHGEuX8hF3Sy7CnV+n3WuhUIGQRSizgCDYt/4iwpmmZkuGRbBYl2i2AJKrv5fuF9Fdj6+/B7+tluUvS1MrWJHnY/bZiUgpAubn0rGR6Um+g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:48:07 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:48:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:25 +0800
Subject: [PATCH v4 10/10] gpio: mxc: use BIT() macro for single-bit
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-10-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0253.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ed7c77-aa27-4220-54db-08df246078e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C93ppILdlVwqAj6/2sZGJg208VTFbvzj7BLpXdubRDLle0yJBgqyrSJND4wu4mnaIREeFoo9QuCIeEbZLqCyXPLMr7u2cyuPJFWXj6DtNQKKoJIbzcCSjR37C9yQqE3iqiM81kyyXeRDo/Nix2c6FHrKWV6Ib/rc034fE6JjXThrUOZr+5Tw1Dg/I3XEhcODBJZM5t5/eZHFq7lWte2JI2cihN7OiXllUK5eGynThdexmPdRJ3UhfodRLsfb8vf8yM11Z4btAJFOkhL+vn6UzB/h+zMxXB54SurIvadnq98AV+osFKFsHduJX33dM7AMY2yaCrxxquovCqltXZ2qPfgWgUicCW9biX/Mb+ic/93NyANzu67R/vFdIq7dsuavIfGjDRUmXvLgFWL27YgC/L2eN48pD9+s/wEWd+ieUUbhACvQvepZatsrxLYXIPvYRgG/+4gEGRyyjdRjp/lWHQlMZkSz6OFq58I9C1LqVW3LQ7i6ETZ/8GtTOT8F7+ZwlApW4JGpwr33jL5CRxjowfXNVHKqur3RkmoI0yzwIngHguXo64hGo3wtnBunpuOq1qYsGnFWjrHVqKoCuo8wQ0piCUeLh1sCPPk69rltscNUSXXNwfbgXFLCA+b3c9OPI04M1LDuicwQQptZ4J1wpHk5Uxii4i5jIfGabEokueM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkdtQyt6SFFmOHIxM1piS1FlVXhwTDllWk0zK0t6MDMrTlZjUy9PdEc3T015?=
 =?utf-8?B?K3hnVUlZTnFkY3hHUW5idzltc2laUnVmQUJEQXMra0dRSnppOWowcFFjaDN6?=
 =?utf-8?B?ellUV2tOZlpRamVSQjF0Zmc2NGttaDd1bllkWGIycmpic3JuOUVDMFQ5QmV5?=
 =?utf-8?B?NVZrelNlcHJHbi9DU3V1QytFSVp6aUFYS3R4R1JaekRBSUJYM3ZrWUY4WFNn?=
 =?utf-8?B?ZWE2YXNkRmRZSjdDdVYrb0kwdm5CRk1QVE5JS3IyUUVqTjdyNTJsM1lSK2Er?=
 =?utf-8?B?TmZiKzJvUzQrd20xSmJ5aFpGd1F2SUptMVN0ZUJUQkljRENrMWhuYWdVT21z?=
 =?utf-8?B?SVl4bEdHQnd0SmFva0VRQTZDRHRzNWVDRFFQQXhYbHRzakI3cXBsY3hUZFk1?=
 =?utf-8?B?YXl6a0tmT2I1MWNZRm5QaCtCRXZPNlhLZVJhVlNrSno3YTBKeWsyNjl5RGFn?=
 =?utf-8?B?Q3pydVRFVE1JNWdIbDVOdGRzc0NlS3Z1STc1NnlTUXpUUHJLZE1pb2VoUG05?=
 =?utf-8?B?eGxrSGdFUXFGbWlacU1pWDBIdEdaWUxOc1lBVmlYMytTNkRFcEFIQS9vU2pX?=
 =?utf-8?B?WS9aR0tjMTFqVnlLc1lmVkVhTFgwTnVtMnVDMGlVcExKZjFwZjJubmN4RXNO?=
 =?utf-8?B?N1U3UnNVaFBNY2VtZVB0MEdta21iNTVKc3Y0R0JGZUlRNXkxZ3R3ang3cDJN?=
 =?utf-8?B?d0Y3b2hFSE1Jd29BM0E2RUtXZjYrbDhHVW9CdjdGTkR1M0JyYk5DeklPODl5?=
 =?utf-8?B?QTAyZHpPWW1nSDJpZ0kxdTVEUkNXUVE0NDRUbUdjYnBkYUVGRkJaS3ZFSFhI?=
 =?utf-8?B?ZjhIRnBZOURPVE0vZ2ZSTDFOM1NQL2V5WWM2b0ZmMjVnNUl0NktjazZvZHNU?=
 =?utf-8?B?eWZqYSs2L0xrNGtFWVpaWkw5TThsaEdSUkRMQnlXZzVDT3kwV0Z5Y3ZLeHJt?=
 =?utf-8?B?dURtOUhZeHV5SkVGVSs5UGVMZmVlUVhsV2lhRVJna2tGRXdOLzZFWEtlMU9V?=
 =?utf-8?B?VGNYdlZ4Y2lqenlYT2E3YUJLSDFxeDBZMmxqZEV0WmpYZ0dVQmVxNEJDdktt?=
 =?utf-8?B?SmluMVRqSnl5RGdWeDNRYkU1d1BVMnhYWStvaFdCRmRXQ3NPSWo0cFZHSG45?=
 =?utf-8?B?Tll4M1NFVGs2dHB2V3JBbjd3Q3ZiUFZmYmlhdnFkeGYyT0lvM2NUUDk2akFX?=
 =?utf-8?B?bmtuUEw3dDgvellvT1NKdlNYZUhRMW10dFZkWURlQ1ZRZHFxZU5WM1hiQjVV?=
 =?utf-8?B?eDZ3MTlRcXZmR0xCUE5SY0NFZFRxeEhURFpuK0trU1VLTVhIemNyR1RaVGxs?=
 =?utf-8?B?bUxiSHE3N3BOeXc4S2tUcHV0WHZkQTNWMFFxU1JoSTRaL1hxcFNaVUd2MXhJ?=
 =?utf-8?B?VVVrc2pEclhXUGdTNkxld0dhUVd3NVozY1pUVWxqQnpTU0VyRU1QUDVQd2ZV?=
 =?utf-8?B?RUxVb21vaVVoTFB6SE5UT1VvQzRFNjBrN3E5Umhyd2Q2SDhmRnJYSlpOTXpO?=
 =?utf-8?B?MzlaczZxb2RZZU5qeU9XWnFJMHFrNHlvdklVV1owV3htVEY5bjdvUnovSkFZ?=
 =?utf-8?B?eFRGeExtR3ladHBTMG1XbFBxeHYwK3ZVd1R1aTRGMzRRQXBVUSswVU9UQzhF?=
 =?utf-8?B?MkYzM1greWEvZGNlOFFDV2x3bG1BaXczTTBMcXVoN1YwWjhEVDZTdUtUVU1J?=
 =?utf-8?B?a0ppWlExd1N1NkVUYktMbmxrQm5sd1IvNkQ0T3luWEMzQmRrVjQ2YUlqR3h2?=
 =?utf-8?B?SW5aZWIzeGpCa0s2NlBIRnpjQVVpN0V2V3Yza2RvQ0pwemtOK2NXdWNKY1FB?=
 =?utf-8?B?bW1mbk54S1NSZlVqRUZlbnRBdHphSlhuWHJxTTVWd2dua3ViUFpCSWtJT3dp?=
 =?utf-8?B?YStYY2xmd1J4K29yWjVPbnhET3RxenJOeUNJUUJDRENCTlJZT3Z1R1ZBZ09z?=
 =?utf-8?B?ZUp5NTRycFRPT1I3OUVkMXVXcXlHMnZ6U2REbFh4Zy8wa1Erby85RVlFSzJX?=
 =?utf-8?B?SmdyaFpkcm5VbnhLeEZ2bUJ2bExmdURyK01lOG9NMzBmMUVmYlJqNUM5T2dT?=
 =?utf-8?B?SHdSMjgzYTVIUiswandIYW5naFRVQ1JESEVDTXdTd1RZSXpxTXBRb3FsZFVq?=
 =?utf-8?B?UkU1Vm5WWXlIVmxwYWQvOEtEcU93aUw4bkxQL1RrUnh6UDBEeitSRGJFYTU1?=
 =?utf-8?B?dW1WeFlaN0YrTlBVTWZuZmhTaEk1WkhzdjBrRGtVSkpvK3VKZW5pV0k3RnhK?=
 =?utf-8?B?aFIzSElFQmFSYVk0YXJaTEFkamkyRFNFWldIT0k0UEtnUDFvY2xrNFovRm0y?=
 =?utf-8?B?WkF1Y2x6S1ZIdTR6MWZXTkpXN3JWRGhhSmY0NEJMT2JhVVhQeElLWjdnZEJk?=
 =?utf-8?Q?i8xSnTDt44bMJFmwi0+IvH75p4jbq+UFthSF+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ed7c77-aa27-4220-54db-08df246078e3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:48:07.6010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH7hmsiYWso4BNfGJLx16nF/0gabLvZW3Ou4d7GGyImoR8c916hDvsqR5W9gyKBL+kYzFHnCu9wY0s60fPYlFw22rXOGBE2xUAoDrqjLjIzstfp+QCai3FiQRellv8WR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738

From: Peng Fan <peng.fan@nxp.com>

Replace open-coded '1 << n' shifts with the BIT() macro throughout
the driver for consistency and to avoid potential signed-shift issues
when the bit index is 31 (1 << 31 is implementation-defined for
signed int).

No functional change.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 39de616cd434..ad50b602c4a1 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -209,7 +209,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 	int edge;
 	void __iomem *reg = port->base;
 
-	port->both_edges &= ~(1 << gpio_idx);
+	port->both_edges &= ~BIT(gpio_idx);
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		edge = GPIO_INT_RISE_EDGE;
@@ -229,7 +229,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 				edge = GPIO_INT_HIGH_LEV;
 				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
 			}
-			port->both_edges |= 1 << gpio_idx;
+			port->both_edges |= BIT(gpio_idx);
 		}
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
@@ -246,10 +246,10 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		if (GPIO_EDGE_SEL >= 0) {
 			val = readl(port->base + GPIO_EDGE_SEL);
 			if (edge == GPIO_INT_BOTH_EDGES)
-				writel(val | (1 << gpio_idx),
+				writel(val | BIT(gpio_idx),
 				       port->base + GPIO_EDGE_SEL);
 			else
-				writel(val & ~(1 << gpio_idx),
+				writel(val & ~BIT(gpio_idx),
 				       port->base + GPIO_EDGE_SEL);
 		}
 
@@ -259,7 +259,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 			writel(val | field_prep(MXC_ICR_MASK(gpio_idx), edge), reg);
 		}
 
-		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		writel(BIT(gpio_idx), port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
 	}
 
@@ -298,12 +298,12 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
 	while (irq_stat != 0) {
 		int irqoffset = fls(irq_stat) - 1;
 
-		if (port->both_edges & (1 << irqoffset))
+		if (port->both_edges & BIT(irqoffset))
 			mxc_flip_edge(port, irqoffset);
 
 		generic_handle_domain_irq(port->domain, irqoffset);
 
-		irq_stat &= ~(1 << irqoffset);
+		irq_stat &= ~BIT(irqoffset);
 	}
 }
 

-- 
2.51.0

