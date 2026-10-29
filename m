Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281597;
	b=2Ts8Db1xyG7vqRyjkA0SkeayOu8yzHfPW7EVtVrL65wfBT3Dhx4NtC5mITz9CIiB59i0
	 gMNIwZNB9BwiNDIdm0WmjL9suhPa4DRFU2iSLjWAp/M85xKzP/Th58gVYCgTgmwvFMRAW
	 mPzvs1uwUea8OBr8l4i/OgIrpElQWzUNBZmMjQrH1B7PKd/9xKnLiTGqSuYanxWJyeYfZ
	 WWRbkwuS86SqtsmbOTaYChYABCTHJaotnUF2OV88PrjXjs5xEDOLVHN0zN4vkwTZcqBHP
	 urCOQv8r+FJTWiyLPtZMG7qJlk0L1ci4bvi7SO6qEvxWXqpJVymmtRbjSuSM9lntCHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281597;
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
	bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=;
	b=vk5fWUXM4T1munur9gw3zqp7da0TM5TiKr+D8OyNKAGCmdce1Upl62Pt8HTtsJPnZL0V
	 nU8Y+lgey9NM2OgxXT3cY9wSHkUGjMdLvz8UZCrWrkhwVZDDmrorMXKcNspBBRUl2yfnN
	 fvLqfsS+IR6+HnnP4ivmCjCR7t6h/Oe4h2R9kr77GGmaiPoRe14Pl5QmS7mcRVMFAQQQc
	 h1qQYzmdPnvETj/jHmsAWYLNOoi6hDzVVCYRaiGtPTT/sl3O+kgB61cORWXawR9bN34Hw
	 fhMherJaQdulRLMq5uQwtXJgZv7WvYe+uTPNQdfHLd/GXW72SiToxJDEB8x8ySPVjZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NF1yzSlo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.5
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F2606A327;
	Thu, 29 Oct 2026 13:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C3F2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NF1yzSlo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3b1O5QMk0PR5b1bOryh0nBtYCWdVUJX7aiYpNEu9B8hO8SEGbcORmt2+PUj75jlVnvSy6AkIdPHTbEHA552dmfNg2rkrLtBuvcUlsrWjw94BBWTpPMVLS5xD/V2eIVwIJVnKjeF52L7YOhF2q+KcgGi1JtC3CJONbz495aidqsJUyvySec7CvEtnVNdYM36/sfD7rpWcgTAm+YiMU5NyilZU70qmjgtlZmK68JMAn/Y0NS6TkNtEiU6MO9g/sq1s1/+aFQswlKZRt/S4dSDA+TSkFoXmBBq37gn1QVyPO2vvUjYkJMevbfo83f5E6jsN7kRagg4x0oyxTL1ThA27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=;
 b=J+xWAOeJvOXjK5vJUzYbb2PNhYWwrd1jI4yyBXUjwx3jFFYbl5gVNUXCCINJkonvcy62ncmwQhEbOIw+brVCx+3a7o8nV+JNUSnnJt7T33+CdltoTFiYFfAUuaUKwx+Y9i7nDp50r6JX0vUra76TgbCK08qoLrWUXVLeQrcV84sdBZCxkvJbwKUlk1E4U2sDuImTlgTN1ST+h4ubxBS64BZHsd9tEbKhiPeaB8TDuayIW2xLbcB2sVZhUgBUedYOuG4Ug4wvPAn/9YtDyPw5vvsBDOhQA1UIS8FHT/kg1CugobXofHMMfnymx8UMpajZjkbpqWF3tGu+kXxbNYOx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=;
 b=NF1yzSlovw5Rp81PrMFXPLB+V2AqVe9d+U2YaWQAA+D9kQbfS4nVrsXkLfbSBmhz0Wp2YDDxlCJFSWw3c8weW0GC9F/1axVemPFTYSULItXkHvl5bIF365lYaWLSKLap7ozoKQTKOAPpo8omtszJ9rtb+bEfcQLjzjArbYZNpDWYR+U9SwKhKAG1oK4GDEpPJMnUz+03bmzLo7BrGx4/LH6I0PK/+0j33Z5K4ruTMtVFa1SAnFA6+FNEomy++A7yRc87rybaIKHndr6T6dkhroqwx5dHybWOkAFW0JXj1bnEuuBVXxjqDuCL4CrKB+Y6HD+eICHj6YNDueQo8f9PgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:46:33 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:33 +0800
Subject: [PATCH 09/11] arm64: dts: imx95: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-9-45b484b4c434@nxp.com>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: d050114f-dee3-44be-3d00-08df35c30af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|921020|11063799006|56012099006|261009223027099003|261021123027099003|261026121527099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FkXbSFmeqzz9pOc2d/V8wcHtgbmjugYtyh065OPrNS459mnfhXeDLhaVR9Mcc1ClTb1S25wf8Le0CMgBomY17IvHgREHiWPxXVksarhiM8vtPWG1WyMgTC1FXb1+0oAZAdj6R6PUHZDt+IgMxcAXrQBgkr+WuNfaShq24VCwu39UGYDblEk6YrZ1uftMpYvFsf9WdhvUMDDLf0/z9FJat0L6HBoo9ilcJ5ONtGvcKroKCCOlgnvk4aNY5NskHibhkOBxs0HEiGUwuatVc0DqXZNT+PvouG4q4c+reluhJSvCi4S8wMvdw7lyS9pWXL+xrlhbIp/EAcUn7Huu2iEW7bsjivOtHmNFA5CNU7JhIueOpPpnEG1uHZdP2nKkPauLkbQ9rza4c7bYTJb1NP+z3DgJn4oYyPNg01ZNT0RU/6Ja9tGOGnZg2yBmGG1QWvyk56K4m79D1J0T7CWjhShM1QsS+cUQEDxeTOPPMJ9K1slteXTaR2Zwk+jFG7RijupUpl0soq5VTVczh0aREXO1abnZE6J+l8uVjojSeFWHrhpAl1raQFPGa9J7B9xBzn4jXnPF+Z+1fpFECJRC1yVoLp7EukjcAD7kwakQrc9mU0f+6SEsM4VtdGnjxBwSEhjbIgjjvtSXQLf15O45smhqHbygL4W7RK2jYhIXCAHDmaeHzCOowHBKFCV/xPzKGyGKBQ/OeLmouyazYTMXv+LU2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(921020)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261026121527099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmRDTHVxcU5Ra0VVTWxuQ01mblBUTDRHeTBBZmdLemQ3RXF6YjAraHh1ODh2?=
 =?utf-8?B?Rk1lbncvWnNoS0xJSGpHZXF1eUVidUJxUHdEMXk5QkhYZTBLTW5scmFweVhN?=
 =?utf-8?B?U2xTWjJJTUpXNUpzK2oyMGpJMmVuK1QwazRZMkZTRWZRYlBadTlDc3hBVGhw?=
 =?utf-8?B?QWxCLyswYStWRUZzNWU5aGswZ0ZYN2FaWFVLZTJ0Q09rQkVtNVpFZ0M2YmpK?=
 =?utf-8?B?MXU1eCtCa0Y5dDlDaTc0dGlIdUxzZlVmQjZINXlhcDRROGRrYzcwaHNYY2V3?=
 =?utf-8?B?NXp6dGVHSmpPRFNuQ1RMUDg0Lzh3bENtUUY2U2M3eEVYWUc2UkdoOFBxSDNn?=
 =?utf-8?B?V2R6bk9mQmtVZXBIQVpkYThWRGNFU2FTMTNPaDdiYWdrdGZrYUpBWCtyaDkw?=
 =?utf-8?B?UHFCa0YvcFk3Vjl1NzhUeVIzRHpnZWxxa3cycmlEQnN5V0FRZ2VBWGdWbGpk?=
 =?utf-8?B?Sll6c2lGUWFLSERaZlZseWkrT1RXRU1yck92dkpPZHI5QlVQc1dLQjArR00x?=
 =?utf-8?B?clljai9CaFBpSHR3M3lIZ3lyVUVGYkJwUkN6RnZXMStWY1RHYy9CSXJqS2lU?=
 =?utf-8?B?ZFZzN0Vjd2F5cGgyNHR1eC9yUXNCVGJmN2RQVEI2elNtWm54NjhSaGF2QnVM?=
 =?utf-8?B?em1iajFERXdPTVdoeGE0b1lWTVhFOTZFYzhkUEtFcnl5aEtYcWJWcEl1NjJ2?=
 =?utf-8?B?MnRoc1VXTU1kS2FuTzY3dk9uS3RKN0JpZ093cENZWWpWZ0l1bU5Qbi8wOTVM?=
 =?utf-8?B?dmlnditzQk9HQ1N5SWFYYnYydWtzNUJqOWtQc2FSYmRpcUkyaU16a2l3SlE2?=
 =?utf-8?B?OW1HZ2hNMCtGeW5tRm00alFxd2kxQjgySG0xTGgxQzk0eUNYeGx3ZHUxVkpu?=
 =?utf-8?B?TjVycUVDUk1FK1V2amIwSEczamgyVkFUa1NNZEI1eHZHUHdxTkE1WHdXRDhI?=
 =?utf-8?B?eXN3ZUlPNXE4aEtDaDdNU0ZobytaMFVzemFiNnJSc3IyWW5BaTQ5K0pXRHlT?=
 =?utf-8?B?bFpqeDlvR0ppUC9DcUV2Q2M4ejRNQUx4N0RRY2pGMlZ0WlN0ZFNmZTk5bndm?=
 =?utf-8?B?R2ZIUlhUSDdZaVZ4cWk4K1paYll4MDNCSS9LMUlsVUJ2M280L3JvZFBqNTFW?=
 =?utf-8?B?eU5MakY0LzdZSE9HYTZDM0tvaEtJNE1vMEQ0TlhGVTIzbXJ0UlN1RzJyOG1x?=
 =?utf-8?B?VEtlS0IycURyZS81TTBVZDBxMk9IOFBheXdRaEJTL1JYR0dLdHdwQ1lHVFFC?=
 =?utf-8?B?MGVxTTlHY2phNVVoRCtwL05PY0RiMWtXakVTYi9ySDFXbFJ5b0RMcDJyU3Bp?=
 =?utf-8?B?aUVvTmVRU2phd3RVT3VuWEhMVk03aTd1akhaUmRiNW9LZnBwK3JGRUc0VUlH?=
 =?utf-8?B?NkNkSWs1RVEvMTliNnVhVGZtbGxJZGE2RUZzZFlDM3F3RDUyNjZFaU9HNTFr?=
 =?utf-8?B?WWxaVTQvamREdW1XekpFQUN0WUQ2NFFyUkdlZW16WDM2RDVQaUNrS2djanJj?=
 =?utf-8?B?S1h0R2NMcGxxQUZzd2ZiTlJMcFl6eFM1QUJDaEFLMU1LM0tTTitpWi9YdzNy?=
 =?utf-8?B?WjJNRVpMN0UwUm5HKzVHUjQ3cndNdmRmYm8zdFJ2dnBlTUs5aUpsNHBab1JP?=
 =?utf-8?B?NEN5RFI3cWt2bk9vWEFXUEV0NFVPa1M4ZkdlUWY0VVc0Q2xxdmkzWDJzRVNo?=
 =?utf-8?B?aU1ZUU5kOHNxWXdjdnh0T01Xa0hWZXhBNys4dXFQelcwZ0JQUXNDTnhPdU96?=
 =?utf-8?B?QzFCVmtTdEROelVDOEhHVkgwVTh4UzZSNDlyMFpRcHo3RnpnT2tUNTJ2VTZI?=
 =?utf-8?B?ekpaSExrSmRxMGVWRXJRMzV0Qm54Y3MzazJ3NjNUTkxRZVlaeXFFbVQxUjdZ?=
 =?utf-8?B?ZVk1QnRoSVhPdFduZERsZXlhR2YzejFUYlV0MkhXV1AxcXhoZDhYb1ZFTTZk?=
 =?utf-8?B?MVlXY1lqS3k1OUNlN2hveUxpRG1YL2t0L28xK3JKVmVxV3JqRlVQcjhDNkpD?=
 =?utf-8?B?alRCbkw0WXR3TDFQcTU1L2dtMFFDTWpIYnp4S1p1aCtML1Z4d2oyQ0drbWx2?=
 =?utf-8?B?Q1BkZ00zdGdyL09SUzY0SWZFWnBvNitrYTlBSmRVdjhVWFJDVGZYRWRtMTBT?=
 =?utf-8?B?bDF5KzdJaXpacnZzWWRQUk9kSzY2dlJ0ZkNMRmdTdjBjYUFLN1VHb2UyN0ZN?=
 =?utf-8?B?dlZrdUVjbVE4Ti9ld0t1T1VBREdjQnRhVE9kbEJlMzdUYTlOa3lFQ2JiSWZu?=
 =?utf-8?B?SXBMSGJOVXYvTktRMk9TZGJNMUE2RzFCbm5STGoxVGptZnA2STlZZUtKakd3?=
 =?utf-8?B?RmQzN0grK016Y1JoSkFPVCtIZmkzRVZnNVh3ay9WbHYxRTU3cDZTc3ZMQnNK?=
 =?utf-8?Q?c3FETIXtnwpQGINdDFqbz4/uh+3xkS9OHRdKq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d050114f-dee3-44be-3d00-08df35c30af0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:32.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eG32p5zV549Hc0E859HjwN18jv9mkScRVfMsqEfTRy4cyuwb18DkoBdl3n/hLen+WDBPE/o8awNuzsCfAVdUicwjhkjGmtcqwakBq2161NunqK8ajkoZ5WxVAOUCS4IO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual [1], 69.3.5 Clocking:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf

Fixes: 5e3cbb8e4256 ("arm64: dts: freescale: add i.MX95 basic dtsi")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index d20c2498b9aa..0398de491553 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1300,9 +1300,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
 			ngpios = <32>;
 		};
@@ -1316,9 +1315,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 104 8>, <&scmi_iomuxc 8 74 18>,
 				      <&scmi_iomuxc 26 42 2>, <&scmi_iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1333,9 +1331,8 @@ gpio4: gpio@43840000 {
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 46 28>, <&scmi_iomuxc 28 44 2>;
 			ngpios = <30>;
 		};
@@ -1349,9 +1346,8 @@ gpio5: gpio@43850000 {
 				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 92 12>, <&scmi_iomuxc 12 36 6>;
 			ngpios = <18>;
 		};
@@ -1689,9 +1685,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_M33>,
-				 <&scmi_clk IMX95_CLK_M33>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_M33>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 112 16>;
 			ngpios = <16>;
 			status = "disabled";

-- 
2.51.0

