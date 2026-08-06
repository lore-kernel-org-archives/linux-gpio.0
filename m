Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE7342AF97;
	Thu,  6 Aug 2026 22:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054003; cv=fail; b=uWjB2NlmJ2IjdRDM1KY3A6VNIrepf740/sh7062M0XPrKQnjX2hxVU7goHKRUwGFrXLEu1CdBPsJyz2ryW1goOKa9CVKq8fxO/EHoUDGf8UhxJzx3Hj1GN8kkMmmsbVvRmcAYHHlhnZEYrStsPyXPKwSWspS9Q4r8OCKEfTM4nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054003; c=relaxed/simple;
	bh=plzH7KgbgSLELmTktEMKa4KIg+7YiDTlJTQFDbxbzqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JzcQFzP80+7J9sqVIkFve0vRw04bUKxzkNRa7RXqkLG2hw+8OOLw7cthX7yOyhK3Yb/zEkUDq1jcaCM9/mJJ1B81W1o6S89kfWRv8kEsA556cK2dSQoAnm4fKLK2ZXcjeNIEYP6Bi6aRC8PHF0eUJcpo7uYh4Et7cctzw+pvmpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=LQ9Qpj9A; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="LQ9Qpj9A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McpjJ56rhaSLynDV9217neSiu9Gi4LV6y/AlEEjXfBiyzmC3YjRUjKRWWtfgByz7p7blF1VSW/+biwA3U2WF7OkSGfPYzUywlf+0chE02eQNxeg89bVCrRV0ogmML6DW64AtqYv8ulNb8gZI+40qHpStiEedaVLdf54U6PNoW0AIgr+oNgzdE/lYdwlef96+zeTrTyfLqOIk+qMGAsCslXrOwFcpr2nr4fqlzKm0176cL7Yh+rYrwrceDy9/E4MniNvedqMcxaXkqVugKOKBHZ17p8ZYzxVhBFsP5dB3fBc6DIUnD2EYzh7SqMHAisMKQeocj9Dco00U3kQ56entyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=;
 b=kP87egzFFPqnYzpqTocrICSuLwM/dQ5iuEW+4m1sNcQR1a3YYMaS/yLMOgzVpDIAtH+YiKDSYyunmD4rzBE9qwUyluyMBKVALlBYuQxBmwFKlCFxCwujb28lAJcDSnyO54kNMI71+anotngUxJLc7sgt1bBiR7X4VYDUOiNkyqgU8ii58Kntz7AImo8v+qHao+3CMfTYhTekDCtUlYvMK1VdxuoAeT08H5sd4wysvnwwOD3T+Lqulvf8eMo8DTkcz+KLwwhfuRq3X0KK21eEHXmOeZ9Y73toNcGqUaWR+TZl9Xh5H/RzOLK+/pG8GBHFkxseqMpLJvwWkgI7EpmZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=;
 b=LQ9Qpj9AzkhuSiK55AgD4fLvqADVB08TnoIeNgJsTZV6OlUVZZZ8iqnmRWkt6M0YsAwv4vUdS40W4X686zFkGkOUibxG6yygwKWUbtAo18ORX1ccwPMgA5zMWhk7S43ndFuzdu3IwpuUHVuuSfwQIIDYubtveKK5IN24zu9iIytxUPJwqlnGrfmSiTScUI8whvRtKMa4EQuhT4F+D0hhSLcf28eDwaNHnVqnXwDiMd5aq5v9ZsnhApc2auty2YNhnqI+banrNjYeJqIw76WsBWfn6tIp70jaxYnJky08TfQluhvlsYjHlrfx5aNzGwRWQTM0Ui45prwTLccrRJNViw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:33 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:33 +0000
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
Subject: [PATCH v11 05/37] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Fri,  7 Aug 2026 01:05:43 +0300
Message-ID: <20260806220615.4078303-6-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: e565dca0-a897-422f-c935-08def406fa20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	7Qoripb94DfYvlzzK315Tuv7TZDruzupEGNrRj4EjOvb+SalxShqj4JQFIInIRsuGMIIoT4jQjAGJRJ1vkDqC7+iBjIpHYW+34DUXVvgnB5/+1H1WjQHC2gf70LLAqX1roVQRlMWO6v7PYmUU9Wa1lsB7Lpo5EZXznxSTS4/ONYXpdNfj3OwIx6SKGGTq8PlPQFQbLvLzlKphEkLPwRtv8usg/KguZjVTCG20QWMDWJRiU2/d0unwtZH4era5RLoJXPlkpxumE39iuYhQivDfVmEuZAJ/DSK+MDCJSzLgOtwsrDgxm8lG5BzQGzQ72IblnvvnfppWSCFE2ZF3rt1MsQkIwOfyK10nM80wIQXphCytVOoUd5fVxx26M3K+myNGltPuPBGykAHNMpNQA4UTrJaA6Hu50agaEnbsksQU9oJrHz+SB6zKsb/I+mWtL5zU5aL3G0Fpp+2wZCOgyM147zR3BJJnktohUELF07JefseGzYQgyXsrle0ePknESsQtoUBWMlXu0M4eTCIhnKkf6m5p1MEa0dxo6aL/aT/NhK8fIxW+SfOyhnsdzT/LYpxxh9Od8TQsZjDXaREQXSDsyBJG83dkf9pXEfRBZoE1haL69FUPRosI6E+QroqL9LZlCaMGL8Yspd5PpAOKjiX8sIT1GPN3XpSWrejBEBWPCe/8PlFAGG8yb0f3yMvB1Gq6khQEDunHajf+iRXeHZZYuv6hGSASBnIjQvuRpMUn5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PgkMvMqVvVSVubK5z1iV6fYjUmHnROudF+bqJmJNo9U2v4ybrPaJA0J6G/5S?=
 =?us-ascii?Q?+HBRO9PyjorVqB61NWeNTP5g+36EQW5u5HvVIS78BUvw9iLJOxpLyJcWkX0V?=
 =?us-ascii?Q?MaF1hiWG3AAo10dOFVZaUXnMTShU4yCG+vunNWpwiDdSf5QGFg1BXnMMaxSI?=
 =?us-ascii?Q?EIJ3P8ET9gtrKujs1sf6hWx6PJtoLPuxD3a67pllQFNCo7BftqiIadPcRajM?=
 =?us-ascii?Q?xtOHpdQ4XbAPBpLDMO/I2E5Rrd7OZU8AONZRgMc25GkCEIxXyJyitykEE2RO?=
 =?us-ascii?Q?eMEvWxcyC6G64jo4UOfvdZUmTA0S0sH1QdZD4I4o8Hml+3tmheokTwZP66dA?=
 =?us-ascii?Q?ENER+AOnyJCGOREP4u1zNl8hFFNyOEkr9/f5RaeDzwgncG3y0lEtuDIJz06T?=
 =?us-ascii?Q?xCUC5y1rnT4Dgu4BrU+U7RykUlQmsuXKPXDf64bN68RNpMxOsY+9H/wXNbqX?=
 =?us-ascii?Q?9+IRK3HbXAWWPbWUJ4L0mEE67f+JdhiMb8Edm99ecFQ2ERINJ8HGzxJzcG9L?=
 =?us-ascii?Q?tB/h8KE6SMp5aRf+VTmIzPfDcY19NkY9e0iCL1XcDogyZie+d7jOlfb+QzNo?=
 =?us-ascii?Q?cJ2PhRCpxOmMlmE7uZBIiuZL1H+aUbDOSAmzx0ORZaLyomBMjHFiXXmtTjDx?=
 =?us-ascii?Q?tDOLgl65emAozQYgeE2m28UcU+PLM6tAX2MPcgofev68HZcwnbhMN+NjmLWO?=
 =?us-ascii?Q?m/TYEtuu0rV4MuEG2B0UgYluXAofPf7EfpQt0DlM7s/IL+HMXRpCvw0oVv0E?=
 =?us-ascii?Q?3Nz4N9LCCwI+ZT1EnPMUSX4F4FnMxsD03m/Qp1bZ/bcogbihKQKe43DDO97/?=
 =?us-ascii?Q?vwT4vmW2cy6WAA/o3vhQV+MMcUjc/0inE7Ut2a3XpdqdHGXoO8DoT3AmhTFa?=
 =?us-ascii?Q?Lf0LecvVpCpLvGA54e0cZqmfN0kWsH0oeDQ8u/mtmeyzFthAJvPJ4InaMa+e?=
 =?us-ascii?Q?VIHoZxbYmFiNUYyQz74pkp9ymbb9e2OhdHvvDwMEmmHpyxDTvyj+beapr55N?=
 =?us-ascii?Q?G9fTiAXzNlirwdvh+J/KN2ZTAkJ2R2/RpgmSozb3mTNt536S12iWlsJSxnuf?=
 =?us-ascii?Q?Bpl9TwEQs5m77w3OgFoIMisRjGG4ZzECx4r3gTLpI14YQrRIFyRouWtquTSw?=
 =?us-ascii?Q?Psoj9SRgh0fZnks6Cq5WKQCiAStTYuHkVyqce487+EpJFIiqfrw4v5sfDF/u?=
 =?us-ascii?Q?xQU+9B15YP6qGoeWHccF+yZ0pkPUT+Lf5E8fN1j4uJYJflH0FwOzoxpARmtp?=
 =?us-ascii?Q?6fjp25eSSnqJLyLXF3TMFkzr3kelpOYSX929VCwCYOmck/dslPVUR3IG/dnS?=
 =?us-ascii?Q?5Uqqu0Ocpjx1XaapwYeML94pqzikvXOdlM3nbASegaBwGJIlgdIChGG9dMC5?=
 =?us-ascii?Q?iZiVTBDoSJgboarTRBy8FoRKevPjvx4TKwfs1C8QJAg+Wl6u53lJLZRbBIcJ?=
 =?us-ascii?Q?+G4rjzqxsIRGo7d61tn6QLcrr5IpL3XgAJpXjPBxNON9EqvDf4AyMSAAtg2j?=
 =?us-ascii?Q?qzAshvfS+LB3SgwFGFG/pe89R+YoBDIuua+V9FZahlLkHb65jsago/Nx3Lgz?=
 =?us-ascii?Q?wRZHuAYZV/j6kFMK+eOUYLkRouDofQuaKUTN+WbrzUi6E1xCP3/EIqllyU6B?=
 =?us-ascii?Q?YdpZRruo8YgW+uv1P1d2w4OtQG2tMVODPNJNI/7BTaM76rLD2nnXBADvaZc6?=
 =?us-ascii?Q?9cZ/xQ7bV6KBoDWFoIUH/VhKu0ypUbk/T3ZvqYOPiX/HhaDJ5ExT17fZldmn?=
 =?us-ascii?Q?c+JTn3ryE64Fx1+kpJ0yVH8uFmPIl+g=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e565dca0-a897-422f-c935-08def406fa20
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:33.8214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGBgGVtCislAINWf1IT96trldCCASpNEYa5VqAFrWii0YOzBSTNCIwEMi9WMk9s/Ln4JT2QtJqqglGDwHmFcFnNU91ze0+YAvqMI3tMhVvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 36d14103798b1..d743d7fdcf0cd 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -185,8 +185,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0

