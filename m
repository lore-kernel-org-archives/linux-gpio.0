Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FEC4F68BD;
	Fri, 18 Sep 2026 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741187; cv=fail; b=GzlLxb1+nkmMDLSpuCrzOqslzzdcbCEf/XLAmWN94V2WKVcdiPFefYQPGxnHgXhgCfiRY5DPiywEiKlX/Dr/dIAfTnZeoiQnIM/0tjHZIq9WyJczy+6r3/D5fwbKKELXHTOp/7+Hdg0Ex4w5K/OIIp+zrBDFTbODGKOut//MR3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741187; c=relaxed/simple;
	bh=1eArNOHLm+V1FirbMLCtg7TBW5O6v9kYDKlWwfU/kv0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NVjRyV1TsX2Pzyagn7EHheLIC33gXB+lzu81z88BeElbL/9iTBMgycEFiezNM4fpp6/T5DUGRPaG7u7yDeVaShH5Nt+4y1SghwGFov6g225gT+p+jDPHBFfQU1TXNsRfVWBVQ1K9NMswSGQUyEDb7WuWHVtTBD1xkWQoz/GkJo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GThCTDY/; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GThCTDY/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM0MKJONxE+CWB5RLtqXPymPQRhsACTnQ7aDp01HOiS29f+wSlYUt5fyDZQRyq0sgp9e2LaUxN4/h3kg79DgqyPLdULZG/DzCRJssm07voCq//o6yOzWlkP4/ijvCEMnF8weMUThEyK/UwIZGfJHN/74ulwBmxUEjrOD/mMFCnPUs0l8KsEgAaiYA5LPQpZHl5+ja8eTFSvCV7Ds2oWVodegVqhaMgXMJJz6vKvMN9cchauRf9Sh/ucVh8pH4d3jEPwfZQdPwnjyMGVQP1ItxYk1MdW6fwbTQpy73QR302zMNfEBw5qx3Qka5YmRCHZgXLuljX2P8UQ4keOSm+yR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TL4bt32jMwRrIxmCq8je87bLZh8/ncuY56MbvSNeqY=;
 b=UFUA91PRcrRM3oDRVlDEjBLQPfdxPG/goYQItAaj2di7JB0bQYm1/s9lo1cW00bRzSQgwX8oetH36zwapAsDGES2dd3NCvqUwJ113LfSdru50qaDuOmeFGYtu+wCsvHtlXlx053BbB5eUSCL0ErkQHdyGtOmUnpUFXGyrXWG8ymK9PtJQbZfrDOtKqgq7gpyxzPrlSez+NmCjgnImap4AoYtCF/tCggzgpq3pp7VFBMD3noyiX8No202F6aPVV1+cVJMhRbGHApUo8h0T7YrxiZnc9cTyk/8XLl3aHWVn0BhV6zfsosSDmV67cToN1NLcOtFqVvdXcb/fypJMjNcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TL4bt32jMwRrIxmCq8je87bLZh8/ncuY56MbvSNeqY=;
 b=GThCTDY/MUb3CDzccE21QND008bSdNqfnB3pHgaerk1qA0VLuJ7WwwBneybc18kLShVDu2greljrpFh+KOw4sYVB9B7gS4NSD84r/nFRHsd4aImKvvbSUwdjVU3Q76ETg4PSAU9a2zdjPkPdV6/gV4TZKFCdls1J5AN6sQhR08Y9zfcrP1aME6s3dApRQ1gS+766oXjvP7cJdHxcWpZmOlQiBdZnTxrEFRtd3CjdklMk0ARQb+5d6JB5ayJIIwajSubL5QnTCS5hGGf6UZG/kbL49suiL0fZfRNvt91P2dale7FqHRWw//YQIL45z+MHyDR5nHhrWp+828k5WXiHAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by ZR6PR04MB296659.eurprd04.prod.outlook.com (2603:10a6:910:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:19:43 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:19:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: dln2: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:17:13 +0800
Message-ID: <20260918141713.3022960-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|ZR6PR04MB296659:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae93f2f-5112-4f5d-39bf-08df158fe224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|56012099006|3023799007|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	LdTwFjagqdtWiV3Y1p0c45nVAQhpmxJEFeFdrOCtcT7nmUdYfW0QuZuYl9UGAYFeKrGVQff3l8EgR57gq3AlSikhgcOeh0QxzWOtt+r6fjMn6JPeaHHpVtL93frOJ0TYoNiJeRKvEq91kYAjh7yfYG1F9JP2EW6t5rK8xk9L9kdxFrDDpYG1P7qnCUJX57znfu4uyaykNccCxZ6RBss+giI/F66HkUpPup1oxTTYz6NPVwdMSCMYs6dfXVbXuFyajOLlbv1wD2akF+lAM2TQbnEkpgJyeSeGGHeIiCvW136qyFBCjiGF7BZ1YC7yk1INi7H+jzMr1KZNhDimqwLj92FtZW6qH7gE27lGEBq0awkPc8s4shZs3d4UQ2gptXE+ZA6INRxkxUcfhpjB0oxVFrizXJ+4KOW31wxwNywwwynrqO9i7sc1PoeX/FO2Ve38eXaXE3ik0n+k9LPXOaaWVWMy5cHWMLqqMw6wH3KBVlJ1j3VE3VF3yIrTuf66T6nU8TBIYRsWX7tjvM5e8lNyncqSir5QsWiTSEtPiUzkG1jyE2VWgCpk4/j+cHrc3ws7XO+if4pSnRtuaviK+ebSWG6xP9024lyfzhr38Xt2k1U0hy0ySWq3/ZoMgh1G1Ko/EmHnKYl7a192N7z2zKwXgRgpbIKW5CLkRBhST0OlOKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(56012099006)(3023799007)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?giZa/LBN+PJpi9AWy1AXPldOdmK8xirPJJGSHYY4rglKEIxOQn+FmW8KOEb5?=
 =?us-ascii?Q?u2f66OMB3/rTuk2JfX88WnYvOhi2pue4zZC65Cq3xEZ1yUquoeriv4cgfMBb?=
 =?us-ascii?Q?hIDzkRfk0kMHEobyyRn8Wnt6iIOvuM8RkW58mT1qNlp8YYZ837IuJadQuZ0z?=
 =?us-ascii?Q?eTc+1YM40OdxykLO8FoFHB6uLPI2NwVEk3kfOdjK8nYM16bcpuNOyQHbx7S5?=
 =?us-ascii?Q?0+zLTI+vW104xQy/zT/9r2saWPtXpRGAGbrft0kwkqD7xa8Dh7sR+WmTKAKL?=
 =?us-ascii?Q?gv4R4Is5WOo8UY76pIknLao523/3aZC4oOoy7vhuTEamF7484ddWPtK5sxyb?=
 =?us-ascii?Q?jNGl9t2NufRf0kxNFn56h5ioLH/DLnoBgZGDLhan+PodVmbyYQhP9xEsBn15?=
 =?us-ascii?Q?yTEJCRij0rtq2/BpZ2X+QLE19pQQ2LRlthtp9o1UG+mPnibadQHsUSnCMJ7x?=
 =?us-ascii?Q?b0gkdDWyWPAu2kYP0iehuKXftqQehNO4u5vDFAE6yoaSzs0Zc5Db0C2zECsi?=
 =?us-ascii?Q?RzcPxkgeaFSkZ/crc8It5WyCDrM6dnRexuHISj1KTsU+o4IyrY2cCkD7SJ2J?=
 =?us-ascii?Q?/p0JcOqF16wZ0tAfl8grwj5eZipEEkWuTWc2WfyUB2pZ8ermabPI/Qz8ky5i?=
 =?us-ascii?Q?qUTWABz3Vtzs7ZQT51LcQLDtB6Irbkd8IkFPVMGxnz9hcmewAhkkj6gjmqad?=
 =?us-ascii?Q?nBvJg34QZzDNVVdVH6LQcpLMiZ72eRNhvS4BYP3bVzeJ39QjZgUzA37Bcaj9?=
 =?us-ascii?Q?BgRYG0V8JX2GVYJmKLQiYUkRpvrikRwK6sJ8Ar3PH/QB+EMG2ZMagph3JkWU?=
 =?us-ascii?Q?DMoD/phzV3KgJUoVViOUtD3RXvwqMZcZhEKpOvzA2W7kI8zXwiaBm3YvhTBN?=
 =?us-ascii?Q?V9ePGYeJ31eSREHR6B1gshVJlrKgOT8fAZRocDttVpWc6ZJU9DeLFf/T5ysp?=
 =?us-ascii?Q?vGaKqBGhUS+7JfliHgweIeOeAHO+I6mGDapE6bQgaHUNfu5QfUrJEl9jeUBh?=
 =?us-ascii?Q?JkAxW3PPgcKZySx7zrnW0M27rFSTdQ+pDlwq1f8Go8vLZtIi8B+SOMHa4W8M?=
 =?us-ascii?Q?+Ef2mc8/czn1ECuAzU93vYqLRPVIA/7hq6AvMcarQKsvVxVZJY+oigaOZoHl?=
 =?us-ascii?Q?yZZnboIdCjaM3PPkMz5c7sdf5KPPnfqPTB/1NTW9bqE7E2vz6MGW0nC88Qp/?=
 =?us-ascii?Q?/jYxvOvwd7OXFuiN6gHlA5b/g9EVJF/sp6dX6l1QigE/Rk/JV87rdA/ms801?=
 =?us-ascii?Q?X02nPdX3pVIK6UgeLcSnrLQ/mNbodoDj2wc8MqN+eUb8Z1HtjE7GLGMptiMW?=
 =?us-ascii?Q?4uRVBh7ToBFyaE8TN+9zlX+QuQUslmnhtNZTc9Q0iVpqv1A5GPln6IZiFV6P?=
 =?us-ascii?Q?iu+6LtKqeLSw8dCuMO2+hS9k7GpT9mxiwY0wbUusJKKiEHkMLotIe98iWuF1?=
 =?us-ascii?Q?PQuFzYxIsFeWojWE3IjodYu/eS+A1toZxtn6+VuazEg75g4AaGnTm5Zv9T6I?=
 =?us-ascii?Q?kSMaEJAbb5jjh8yrybXpxpL3/t5Om5KhUJ+h+lI+OQEiHYwOOUZQdmte/BHw?=
 =?us-ascii?Q?ykoWOITC4P/34eq+0XSrAqG14Oe4XDDr4dg2B8vRSjFTZ7vpAsFWLWxRV2AG?=
 =?us-ascii?Q?PccWJqt9UbPKo+QOO735Kb157vfW67cCXhTThJXTPey3B6cD9ITAOfPXZPVp?=
 =?us-ascii?Q?Ejjb49vm3esthxLl5VrQRtjT9Jzl+Vs0rZztvURNe9XY7TsICYwlr0nFYJ8L?=
 =?us-ascii?Q?Si48/EQz9pIcTG6I4VEuH+v69DPup9s00YHtLieqy8d2CIlcywuw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae93f2f-5112-4f5d-39bf-08df158fe224
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:19:42.9225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFbbr+gUXCAHqG0TPIN3fjWcvDAqHphwZZ2dPX+CFzV/Ba3Jae0MHyu++aY8C7k1B0RROHsSDkQ3mZKQAh/YoL0oHTsk+gCl/cDf7nLVqHFHJQSJ3066YrAldDg/M2l5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB296659

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-dln2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 4670ffd7ea7f..aef4345d265e 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -243,10 +243,8 @@ static int dln2_gpio_set_direction(struct gpio_chip *chip, unsigned offset,
 	if (ret < 0)
 		return ret;
 
-	if (dir == DLN2_GPIO_DIRECTION_OUT)
-		set_bit(offset, dln2->output_enabled);
-	else
-		clear_bit(offset, dln2->output_enabled);
+	assign_bit(offset, dln2->output_enabled,
+		   dir == DLN2_GPIO_DIRECTION_OUT);
 
 	return ret;
 }
-- 
2.51.0

