Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2543443E47;
	Sun, 11 Oct 2026 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719781; cv=fail; b=RSrFMd+N3q0tvJ2Rv8HD4hZbOIYLyTBDQQnC1sdI5Vf1hmW2Xda6d5qd+VC3AwGQoMxFUa3PR2fmpyYmExeLpNfY4dB61EHEpFfaA0QHAQydQrE+D3iC9Y2gjEEUF84bMqBxVmljkMNf+sLnx+iykToWlDMd+KoSdyj81YqX0gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719781; c=relaxed/simple;
	bh=wW4aB4Cr5IkzPfz5qm0RvC3Tre5pVoS4A6oY1as6lO8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aSj+PIqVF7TeQ1xCbjXP89GadQPlhXvuf2L0bXWsSBLmdJJxqZ6BjDQUnAox1yFHwbtqMZahmTG6e7r8mS/ak598ZVadSgvwyrTZe/+oIa5JO25cY4KPJxFD8OpW5i7Q2ciUp8IbDkewlTVOnfpCnU6M2nqFpAIFLmCbIjsoL/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EMnZzZpD; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EMnZzZpD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtFRSVLyLPMAncuGYF7nfTeeuwdg2UGt24NmbIqibahMvpLBylQz8AwhRytRbrM/Ehhe8YunVOn1s/ANRntWpd1px7vNlzJWe8D7O6cZ/0GC+DAVzkBA7ZJ2ExSZ2cw5Pbcjeq626EJlzbiqlu6JAt38BHsZ1zDGZ/oacWeK1KbF2FlwAAeCK0yqsLnLLTCWQojp9U83OnTeJ0FACW32kd2uJDUmr3Pw+LYsHxWk3K7wKTnJssjJS1ftvBThNOn2aZ953Uqz/C6KO76u775wk6yIrHDcozR7Tpdmp9rdJBqpLScSQ+SQBUDoGkUplms4AOgpVsGWG0of9BaN01nsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjQ6oDQ+VDkRGWZe8tA8JZi30NGShiKj6eCQ9wZeS4U=;
 b=XfNkhF2ZstB4NyjEUNMpJxKy/GagGGv0pwJ8673svIMrdV5Cxm6bKJA2YqpIhM6cCQM3oxaKkux5QDXOeQyPdQSLhcggGd/Ga+lCyPSnGJKUsNTLUp5V6mDApIOyRGo3hEY54IdRBMr5SagIH+CMDPIt3fpJs3Q0W3aicJ7jqry/igL/3UYT6oMD+/IX8fYytjeJaStsdPEo8PhLv0MIL9/dxHhO2Hiqx1k++L3ke/vFWNvskCz2JaeFB07ClrXGATM4GBq8+efuf6luv5580tYmItISaweqOBq0SHLWe7Y+aIVbJFfKWs7SjiGwZcrZ2haOPLFJKinhLZgGl+cOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjQ6oDQ+VDkRGWZe8tA8JZi30NGShiKj6eCQ9wZeS4U=;
 b=EMnZzZpDib2LZyiiseJNtKLNj8HDNtfJEKhJVqaeFghZ2hpkDLLUafBFYnFMqiN4VBbA8fZTTFcTUk773hF+oGHN0ToMBiBQM0AuZLnFpruHE4vcU3PuGXAt/WGkkNRpbLXuNurfHxeUyRpytE8BUoC+vbcnxdCCRrBxKQM6JpzZOYA7ukYSuEpdPLvYmLHzVs3dF4R9cK2PRaeKFbdiUrDv2Ca+citVI0EE0oAVIXj3eZkQt0AGytky6KyU0rhvowPcRJVywNEQfGOlIT7aELI/m7cGMEPJ2WacNeXeodub4fBuqvHDPG+ymtFIdVi8OOfSc11vU4sJg8tLNfqVtA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:55:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:55:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:34 +0800
Subject: [PATCH v6 13/13] gpio: mxc: use BIT() macro for single-bit
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-13-cb47ce2ad758@nxp.com>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0183.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 7888e814-e065-4081-53f4-08df278e8287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nvXLo4/X4OMNXi9dD6j+OQoRKIl45Li/mOzy+CA1z6KQrMWXTDox4/qMH0Q0hE4tlnrwiyuHfm3qwrCzSo7q/++KSYqTRbYMfu/Jr1jTvXWUvqsDIoR0td4mzEQAv3rzSqiW99nxm5k1BX4vJswjTnSKm+7Vw9gxzcJUyXn3LzkUEsqGqrWf5qzf+Np347B3CKMPdh3mJSu7fQXfKWVfZvK7ocPARX3SfLnLsPYtKsDn8T9GsMxVF/CNfDtk4Vy7czwrfUS49iehv92wRVyeStFkAxI07c4QaW3akoVZbX37twS1bsUhrDRDAvmXQiY9m9FKYWOgrcPlm6PfLO2myq2ab9DBYEBNfQj4p2FyZCqMCoMpdWg6b3xFPR+0d0ikkeRD0XML1WxvoqEuM6CYfvkbTg0BF7pk6QONy7Oj9Gu/C75WsTJpLAyPQ/tIaXj6gXB+2q7Ms6lHvDPG7qs1jREZEzvJMy49D4GOeQxRmKXprhOG4dpXXpyrkCB5PowS/PTq9KB2PGCIFWCKJOSF9DHzykYTrJem3x45Q0VaJzOuvPaACAXmxulbPzMSIDuaKRYaSoT+6Sd+/hXdJXYPm00BrlR/29bBOmDX6nHFwKsXvwvR4buz3CUVvBT/pZZOOTOCrZ3g8Uwz7oLiB0JXDJniFGNMCwn57O5jahv356Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDdUUkRBMUlTcDhYekdIOTFIc0pUZjJDMUF4YWlIb1hPQ05VNEp5RlczUXVh?=
 =?utf-8?B?TzRKZDFSR1ZqK1RZMFVVaTVpM3pTYm1VenVGS2ZaQWMrTnVuUTBoMzBLa1J4?=
 =?utf-8?B?VjlzeVJlUTdMR2J1UFBMV0NuYmpJMDNkc0EyVnJKVGl2VnU0bzcxODUwemZh?=
 =?utf-8?B?QStmQjUyRHVUM1IzNWxGVW43THZjeGVpdmF4N1BFaWQ2R2l5dmZBNmpXWmZB?=
 =?utf-8?B?S1R6YWE1NDFqc3RRbzk3bnZtNzBTbE1EWWxvaXZ6dHN1NlFBM1k4Q3A1b3Ar?=
 =?utf-8?B?OThHQnQvTThpNDBka3hhYXRWNmpPWlpMN1hUeWNKYWNicFl1dWVRZ2ZSbFFq?=
 =?utf-8?B?ejRXOG5RSmYxVjNkYmh3YVkwRFlFZDVmSXN0eEtoR05Tdk9yZjZwaVA4bW1o?=
 =?utf-8?B?NTFEUHJDZmdlS3J4T1ZJWHlGdm5SdklBREZJbzNyWFFqRFY0YllWZDRIa1ZW?=
 =?utf-8?B?M0loUEdWbzdHalNhN3R3NitQL0lJQ2VpRnYrN2ZNU0pWSEZpWE1xUmFXbk41?=
 =?utf-8?B?WWZEa3lnTm5UQ2RIUk9rSXhPdlpWa3NWMFpvbWRoVk56V0VyUkpuSGRqaTgy?=
 =?utf-8?B?eTU4ZGxGRm5DSHdycm9JUVlERXhDQmhQSDc0cWpBaWtGbXhvYzdVSHBQSjNy?=
 =?utf-8?B?MjhiWlVmaDdhNnJ0Q0tPYzFZdUd3MWhGVW5sWXY1QWhGSkNsaWhVNDR4NmNB?=
 =?utf-8?B?YUpJZXpPckZSNlRyaVlxcmMrcWQ0V3BwelZEZVF5b0xxYWQvdnY4aHEyWC9V?=
 =?utf-8?B?TlViL09IY0F6WjRVNjQ3UUYyOEhyb0lMNnJ5eDhOTEhUVGVEN01QYW1tM3Zm?=
 =?utf-8?B?ckZXTVRFNnFnRGFFWVlBTVFPdFJNOHJTOWlXUElvc1RCNVF5ZjFWeG9lbjd4?=
 =?utf-8?B?WWxQVDlwaCtZdE9iQU9QQWpJeFdsb0pUeUVVNVE4dS9xQWZDWi9ZT0N1UGF0?=
 =?utf-8?B?dVB0SW1Zb2YzK1pvS2VDYzVtWngzeVN2cmdIdXJiRXNNMlBWQzhiazJtODhE?=
 =?utf-8?B?TWRPL1VKbmU3T3UwRjRkQUk2dEZZdHZBMjVNSmdoY2hSc01jbk1OVURBV2Y5?=
 =?utf-8?B?emhCajk0b0VoRzROakJNRWxtdVJxUVJHUGVsOTFLMEYxRFQ5cXJEdjBHdzl2?=
 =?utf-8?B?MGwxSDhQUEJiMmFBVGZrNStZdENqYVFqT25zT1BjYlJ6bnU2NWh0bVF0My8x?=
 =?utf-8?B?YnA5ZjFINEhJZTJoWEdaVUVPZGw2TjZrbWdocCtPV1VRc2dKUFhUa0F1VFNK?=
 =?utf-8?B?N1NXaFlUaTA1NHZ0aHNIaW01b1R4ejAxbE9QY1lXTXBOVm83dlNJUTJEQmda?=
 =?utf-8?B?aURLekE0OGxXU2VLZDdqbU5FSldtNEJ0NXpGNVF4am54ZjBpcDluS2ZYcG13?=
 =?utf-8?B?S3FYRUk3QkFNaHdoQU5EUzZRSWdQTjVpQkF4MExWaGFBVDRzWFRZRDlsUXAy?=
 =?utf-8?B?TUw2N09VQmVuNGhOK09SK1U0OEppamtFOHpPeVVLV0xVUStMZkJHVlluelRw?=
 =?utf-8?B?YW84ZU94bXZSSHdsbGlmN1RGVzJwRnplUm9yUjR4VzdGNlZBNVMvaDNmRHZr?=
 =?utf-8?B?ckhQb0N6K2U2RndwZWhuRmlnV3I3OXh2NXhvZVRUdnBMVEh3amFrYUtna3lO?=
 =?utf-8?B?bVZLcVRJdnpjMXNBV0lIME80SjVUM25pTzBuTTBjekgrWFhNTjZydUlEMmtF?=
 =?utf-8?B?K0ZlbUlCdnpsRnIyVm1SSlpmRTc1dVVKcXROT1VpVkxSQlY0SFBlTVI2aGRR?=
 =?utf-8?B?d2tTQkN5UWNkK2dvUEVob2NrUGV3VjhjNE5Kak92bWlCNzU2c3VQcnF1ZXY5?=
 =?utf-8?B?OWwyL0grR0hpaUxid1l6QVFPaDFHZTRDRStRYTVxakZJTUMwaFQ0c0IvdGlP?=
 =?utf-8?B?Z2VEc01oVStpd21JSlFMaUxXOHM4T0tPbXpCdEM5ZlBTQ2lPaTBZZmJ3Zzll?=
 =?utf-8?B?Q2lQYTJEaHFYQTJXTkM3YklwKzNpZVhkRmtzcmJFTFFtd3VQK0Q0MGxOUi81?=
 =?utf-8?B?RzYyR0lrUWk1WCtORjlFdy9LTW1CMUtSb3dkcnFuN1VXZ1BWRDhJMUtzQU5N?=
 =?utf-8?B?Q1pLSForOW5BU2g4OWJNc0J2WkdCZDRnZnRIWnZycXdSQVRxZXFKOW9rWG9M?=
 =?utf-8?B?aHc1Q3VaaE4vUERURjc0TkNaUzdDVC96cTk5Yis5QjhoNkRVb3lTNWpncFhq?=
 =?utf-8?B?OFVTWEpKMERreVU3T3hzc1pjTXBJZWJBMndVU1JtVXp1N29JemlLUjNCY1B4?=
 =?utf-8?B?NjRCV3dYT3hPKy83TUhJRHViYjlzc0JobmRDbXRiZXc4Y0F3WEJybmZuMVUw?=
 =?utf-8?B?UTBieWo5LzJibHVYTHVJRkxCNUR2QmNkWHJMQ21GWVhNaDM4SDEyNm5HUXc4?=
 =?utf-8?Q?lc31GPhYF5nXijCQ4PDFHGGKQdSh0Cm9fX0RX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7888e814-e065-4081-53f4-08df278e8287
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:55:14.0961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3TUt/PINK/Vy7u+ALJzf2oxhN/6J3zEQhv2A3JtmamMOa2oVhyZGM9yn7isCPnW1XnpoN/I0RdJgV3Ffval0w3qooGYG3LChxQdO2/74F7cWAS1V9Yor9D2ejtElYoL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

Replace open-coded '1 << n' shifts with the BIT() macro throughout
the driver for consistency and to avoid potential signed-shift issues
when the bit index is 31 (1 << 31 is implementation-defined for
signed int).

No functional change.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7987ea2de32c..23ba5098eaee 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -260,17 +260,17 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
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
 
 		if (edge != GPIO_INT_BOTH_EDGES)
 			icr_update_edge(port, gpio_idx, edge);
 
-		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		writel(BIT(gpio_idx), port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
 	}
 
@@ -309,7 +309,7 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
 
 		generic_handle_domain_irq(port->domain, irqoffset);
 
-		irq_stat &= ~(1 << irqoffset);
+		irq_stat &= ~BIT(irqoffset);
 	}
 }
 

-- 
2.51.0

