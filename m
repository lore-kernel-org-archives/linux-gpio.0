Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663322;
	b=vjHbm91UWdfTpT8Dpb6HNej8JIQJlYDPxsRh1bIi/bUPyXcGOLNMLSszVlrI2l/zJvt9
	 d1P9EPoPJ5JpG2iAbIwD9FIL3gF/StnJCfJ70fCVCGsQHD1qffTpSX0DDanQoVITd98IR
	 p1OtSzNz+LME/6VrBeDqO3DlVRpxhcr0aomKO9OG/2fWItcu6/gZETf70raxacQfeqQZS
	 e1/a+RQEf1XlGVO1sGPHgm6tRD32XRCo0nFAp8CT+HTR6FEbGJ73vLytsFbstDKJtF4B1
	 x3AuXAF2FEoSCciqJ47gw97n0WPt4QZb8AmcMwnTIvZW8jn1eA8nt/mq/gP0Ospo7uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663322;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
	b=ZdF/p9BUfchItonUE+RkMoAZtbM64z9vtg8MiEcUupiOooGTuX6jG5FYVmOj8Y47RSdc
	 5FScPetVQq+YT1x5tDpknRxdEDbaik/F54B7wnCmaeHbccnObWxR7/TzDo6riNlamXmLd
	 chrv35Zj5LbcQxHUfVFt1CZjq/UNj/yKj+xixUIAA7AmDosihKFLlpIRpnR8JkPaCExmB
	 CBVF3sRc+cq8SHXp2cS8Q9I9E4vGN2BwLASVvB1vLz7FU2r8vAphmHfuMzwNM0kwxA3Xh
	 BwrA3EDjCcR++e6WIyI1qF6ZfqN+QVCYPvdC6RHAG86Ir+0Jnxk+rrp8KlVYMofmYaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FJWZI7aV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.65
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E1606A33B;
	Mon,  2 Nov 2026 23:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B93E1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FJWZI7aV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1u3vs0biVL5ID0JmHgDx2CehX5l2vzCKD/0x0QEq49SMrTP+d6C6Y8UPvB3JlzK6TsmTrjWPLYmFPkJDaEVWW9h9bLSd1RLT7Kdf2Fll/8My099nMm7+eeycZQDXa8U4kgN92pWhZI2X7PDNEYA9WtuRCoIcHAsSA0XXiPXDpUFmUoubTjVBRoWGl7qGaMA+PvovuNtNFFsDX+diOS5ipZlrUbWtuiH5pqnm87fQC1Y77teokX4iXCWKRbRg7rGT/LLv1hydGpu8poVLbC1PEDoMiXEwVpKsZc14oshEyMD6d72wJJCl/ViDfhby52GnbRvJD58PE79LbFnGIlHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=VYAxKuppaOPhRK+xAvNP+5G+WeTNCro4pAc97zV518TXSAD+KSpQQyW6aCow2x/mvSWJ4aWwmc5y+1d9/CqBjaSDpY3cPEBj+SkbI6vtd1/3+vf0SGY7Uel8d+ehL578wZXTMQANnqIyADbwj49Hl9N1B8QC4ZyyZWBMRzdWvMA/9uBGDcT8uqKjxvOX1nkxILmP4wrTkzzkG4yakkEtvi6ZAWdOKZNgB/hinJsM1DeNTuDPPHFe7L2sFkVfBSLeY+bg1ovD55wKtCjNoE1+TCukZRAdxQaFMwkmGMKgd3axdiIkQR6NSP+tAgqXmpRgwVXef4pOoPcqy1kMyEwGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=FJWZI7aVRS5Fx4OwOct9vtJ13RbkZM+mhMyFj7cHWaSaQ2Pecpi+kQ/6gbb7S05xaBOYl4onQPbDuPhQE6gvVp/x9xpTlTr4FiQiy06nCH6QZS+dPCFYfye8OnkrrzdvN4gjqtQ15vvoBB49eukESXy+owoSgSlKshs8tPF5QvFkg/NKwCalDUJMoUD0NeBZkq81ZmNEENHuyGg7HPF7sgTvz4/rRr68RfGBhLFMiO3nln0df0yEjAjIvMa4iLqj+ayJTvlWQ3Hpxp6wlYNaRJrNo98wMXv9SEouRBeJf2qrzQjadg3XbPjsNzLy8kGiPDcMB1IIw4MuXHxkd3CAWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRWPR04MB11103.eurprd04.prod.outlook.com (2603:10a6:d10:172::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:48:18 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:48:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:12 +0800
Subject: [PATCH v2 08/11] arm64: dts: imx93: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-8-7c71fb36e184@nxp.com>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
In-Reply-To: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRWPR04MB11103:EE_
X-MS-Office365-Filtering-Correlation-Id: d10cf5d9-4ec6-43df-2906-08df393bc522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|19092799006|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|921020|261021121427099003|261021123027099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	LiQ+OWcaYzazr20bPqjpuHpo1JleqWTPIHhnFc8eaAjSM4i4axxsPuHqBGnPph8bPLyN9Oz7ksnHnnBewTfVw/6YclB19nEfqzwr3IUZzJgv4jYcnr4Als1jB1RS+go30eCZ71mZtnb2P4cRN8ffBESWRNFzGCIMXT/kqqHmSCN7U5sXJHcuE3fwwkIfTmAV+qLGpfL7xWy0suuoRzt4ZeVIL4Cw+rvokKjjGb3W9YlgcI9c2ZuIsdaIqIdcGsXIc05grDJvSF7Lk6sJ/uSkn58Cj+Ueh+4NGYezrAy4w4gZG1yVNHoehbjsbH48gWcosawi6Z1Lf81T6tREehlwtaCOw+rZtL842QiP+RJTDP521kWzAh0uufha0i2NuSvBvXKoMYF6LK0bsxrORJQtTOFMLmP0Y/5IgkrB+uTJ0a3+kPjIC97TYtI01b7u9TvKufzERhv7e89gkvMSzoB02YUe5oSSswQJzjJVvCCjboPIiOfYDMBzbRGaZRsa6k0lSEHyz+NB15CJbZ3BqNK335LXTgUEATctUVowWpKAkt0Q6FDifMPW2IAT86GZbtZXcxYDecUkJVUwWPSxGjr+e5vH74Ff3ZU3ZyS8M8MFk//HJUB/n0lVzQOFzERY93YZpJPbRx6VaKHKoVDG8NgIHBPRyXUibyOIDDaYWBHSefwHz1SVoK3VT4qQRKFriVHqCoNpufRY/nTPIb8ie9g2RQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(921020)(261021121427099003)(261021123027099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2p2b1ZHMzdoaGN1VGs2d21OdXl5T252S3ZwTkdCaCtZc3EvWjNXUlNMdXdM?=
 =?utf-8?B?VXNmT1A3Wi8vNWNabU9QUkNoTzBCS1MwUDNORXN5UUNqZktmMEtNdHZ2enBB?=
 =?utf-8?B?d2U0ZGRJeWZicWhnOE41TU5uUDI2ZzBIZ0o0RzRXUUF0UjVGaFhCUDNmSDV1?=
 =?utf-8?B?ZUU2WmlEaXV1dU41QndGZ0NMcU5yL0ZjU3pHVnQ0SXp0L013NHNxdS9ielNU?=
 =?utf-8?B?Q0FHT2tjOVFHTnY1bHdDMUxZdUpnam9NdUYvZVFoSVpjYnl3dEYxT2x2UzVJ?=
 =?utf-8?B?VVpXN0FtTnMrdHdsb3RrWnkrQzVwM24ySHkxU0lBK01EaGhBZUtjaWE3NGZC?=
 =?utf-8?B?UnFlbFhhSGp2ZWhDb1RmcUlHK1gzMHZHWDFMMUFjYkpJU2FySEJXN2pQSWRx?=
 =?utf-8?B?Z1VSTTA3ZFBRT3c5enN5YWgyYTdQVGwwaURqVjR2OFArQTFyUHdZOHg4L082?=
 =?utf-8?B?bzJoYng0UFBidEw0TmV4eFE5M3B0SjBaOVBzeTBjRHBlb05hQ05PSHNLczB2?=
 =?utf-8?B?UE1VR3ZRbUh0RFhKcGEwQSs5RlZ3SFcrL1ZDSnpTaVpOTjJwb1R4YVU3UDl3?=
 =?utf-8?B?M3N1bXFJdW5zNVdkTk1uaUZ0a2lLNjlaNU1oaWNyTEZQaTY3Q295KzFMMkxV?=
 =?utf-8?B?RWxQbW9VTys0V0VIVS83dUhtL0dwRjlBblY0VXE5MFlQV1FaemtSSG9BYXFh?=
 =?utf-8?B?UFNRRHBUWHQvR292WmV0Uit5MmNsaXRtMHhqNjZ1SEkrQ2V1V1IyVVZoVmVk?=
 =?utf-8?B?U215a2RneHJNdGZ2Z1p1K0lyMGRlTHN0ZDNzanVqaWYzV3hUYkZPdTV0WW02?=
 =?utf-8?B?eS9xMC9aYzJYK2xKZ1hjWFRqbTZya25kQk42ME1HSldkeTZqS1JLRGhKZG1L?=
 =?utf-8?B?dm11bDB6bmRPRkxoTzdQZUtpRGQ1YU04bEg4cEUxM2hVemNHMHp2WUkyaTdt?=
 =?utf-8?B?S096Ym9COUFJbGV1NjYxVGN0MmcvOFRzQmtOSUJENkNhM1dvUHBuWmVVYlYx?=
 =?utf-8?B?OEozQjNTQUttSDcrZEpKZ0JHaUc2RzNSOWVFZlYrSG1jamZqaGdzejZwVTlw?=
 =?utf-8?B?RjhEazF4ODg2WmpvMm1rL1cvdFpWWmZ6RjBIWVhXa2hINWMzai9ONXk4YmxY?=
 =?utf-8?B?Mm44dksxVU1YTWRIb3A4VVJ3MHpvcFB6Z0V0QTBEaFdSdzNKOVk1WFB4WTZx?=
 =?utf-8?B?ZTFHT3kxKzRsZUovSVF3aEE3MyszcXlwL3ppUmhlenhudXhRd2o4NzgzQnh0?=
 =?utf-8?B?cThOVXM0VGxVYThOZjB0WFZYSE1zWDFiTThMWGJmTXNZUitNcTl0QXRzeGVN?=
 =?utf-8?B?dFcxbmVmVW1wZGFPaWVmeG9Ma1E4WUNVVzRQTk9LQ2lrNmVBTXA0YXU0WDVH?=
 =?utf-8?B?disveGNza0t0ckVVNHpXUExrUmJaNTkrUCtGVkNWNEUrN2pqL2ZEZC9vMEFU?=
 =?utf-8?B?U1ZHY1VSMkRqb0lZcEFGWXNEcUxWVWdsaVZnYUtHb2ZPeWVSZUFQTzhaSisx?=
 =?utf-8?B?SEI5Sy9UTG5uM0tlUFF2amM2dFZEZHp2Y3VRQ1RoOXZtbW5DU0NLTzdIVXA5?=
 =?utf-8?B?YVkyRnRrOEtodDBnNDM1d0JlOUNrV1dQOTc2WmxHbnIyWkZDS3poaHVxNkhh?=
 =?utf-8?B?Z3VROFFwa0hoM2dBMnI5WGdlUnNDVjJZaWVFU05wWDBsS2JjNWJQNG4yeGRN?=
 =?utf-8?B?WFpWTW5OZFp0c2c5UXZUazhySE5adjRMclpNYXBIVHI4WjFDd3ZsMFBGVTFG?=
 =?utf-8?B?cVJ0OHQrYjc2bko0MFgwVm5hSUZVK29TdnNqeXA4NWF5YTgyZXRwcUVPZ29L?=
 =?utf-8?B?RzVuUGM0eDZaWVZPTldyOGRpWHRJRXJXV0doTnMwbGdwV2poTitUVHV6dU9L?=
 =?utf-8?B?cWlEdmUvaktIVTZRODRZdXBIZ2c3YWlNaTFweUVhT2JFL3BkdzVVejVqWGt3?=
 =?utf-8?B?ZndsSlpDQlNZeVdxNE1HVUpkV293UmJudnlBdi85VjNWTTBaaFRqZThadUhl?=
 =?utf-8?B?VjQ5ZEF0SmRTR1VybVRYQTRja1hiRFMwVHY3a0trVGk5MXA1NlhBTUQrSS9O?=
 =?utf-8?B?S0MzKzd0cVpCd1VaaThENFhxK05laTMxZmFURHMzNFRscmNTNjExaDFsbGpz?=
 =?utf-8?B?dTJzWmJDK1FaRjhnR2Rjem5OeENUMStlTWN5MjF5MExxTEZKTWNBOTE4aldo?=
 =?utf-8?B?RXc3SGo3bEZZSkNrOWgvSEppaGUvOXNUQjFNY0dzTFY3MXcyWjBodDFTWGI2?=
 =?utf-8?B?TmRuSzJ3SUlWMGwzcXRKVUorc28zUm8rRGFPekFtS3VMSmdMczRXaTRxMW9H?=
 =?utf-8?B?U1ZvbGtBWjNaWGJ2Sjg4b3JNdGdxS0pTN05hWGdLeWpOMk1hQ3JBVFJ2OFhU?=
 =?utf-8?Q?zzn5BaT/z+4hfm/nB9l6IiUeZFojnDqZ21ewR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10cf5d9-4ec6-43df-2906-08df393bc522
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:48:18.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ho5/v3LCkW+Gp03H4Ll1mNKPo697UDL4dyOymxH1BeJOxt+8w0Db+ZdzG++rQkVO9p3Te3BvqGN+CxwMYnMuR9VlATdyj+nExkdX6XEeunHuP1IoRhjw/P7QkGNHurV4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11103

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual [1], 28.3.5 Clocking:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf

Fixes: e41ba6957139 ("arm64: dts: imx93: add gpio clk")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee08..cf73dab17637 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -1034,9 +1034,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO2_GATE>,
-				 <&clk IMX93_CLK_GPIO2_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO2_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 4 30>;
 			ngpios = <30>;
 		};
@@ -1050,9 +1049,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO3_GATE>,
-				 <&clk IMX93_CLK_GPIO3_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO3_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1067,9 +1065,8 @@ gpio4: gpio@43830000 {
 				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO4_GATE>,
-				 <&clk IMX93_CLK_GPIO4_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO4_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
 			ngpios = <30>;
 		};
@@ -1083,9 +1080,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO1_GATE>,
-				 <&clk IMX93_CLK_GPIO1_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO1_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 92 16>;
 			ngpios = <16>;
 		};

-- 
2.51.0

