Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281603;
	b=Eowyxzit3gn/g64dtax+F3TXTDJmMt4/SzpkRJnAIOWPAzuI81sMFhL45mTsUChOcmAM
	 2zo8KtdOeZkRzuY+57pdiVrme6dFglXz/THVq6wj5noVrLb2ac4oHlSFhOo3SnDe9WY96
	 JtODKwmi9OhBB/WYntjSCrMhh8pTf/EgwOLDOKHrc44orCADYbuxLKTz/v6QhL++NVjeN
	 ESi3K3u6h5W1pVsCIHYVshtHCjYTzlWlqZgA48tItOWT2e6ZaxQ4zvzqDghC9lqovaojA
	 K6Jlqf7Rhdh8Ozn+2fI9CdbbQ23rJjBYLkFon0TNTQgPu3gjlJ6aGLCL0FrXhqdnk1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281603;
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
	bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
	b=CRXHTCeTGIcUFrqQB/lubgLjpYaw0ClEdtpD3qDG6zCxHeqqcPW8kMGi2vgEMy68Q9sR
	 zeidjUsCjiile8TF38EmkpBIL5I7s9ECAv4hfbUGBRuVNCJPpFVQJc01TZ8LaVCqVZtnk
	 BmHiOsKDXWfOWDD8NYxchUQteSJ6gxs1QkdOoJazlW+Utpk16yq4UkC/9Pbo1m9CRW7FP
	 GW7bl1CUrIahE0cpY+H6M+UWXiqoRKWs/GiwK1oy1pHb42aUn/rLr3IWvSCeL7Shy05VG
	 N143TRr7R8Ry/zzXxPW/A7HsYtn3KDU6iBRm5foapGym/S1KFpdSJ9x6sWY6sA12eqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vBkCrsdK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.35
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8854F606A321;
	Thu, 29 Oct 2026 13:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8854F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vBkCrsdK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afAFx+MZ3JrhyRnAlW+IrIMrsgTRn/gk1z/YwYPL83XLyuGPbwhxUB/eFH74bVgFg10ogSDJnbQCquq2y6GSsXvLzoyXkgikWms4eNpFs57jU5npVP3Zah95SweTAzqU5qime07P4cEA1GOmeKcTTX6Dpu968QcvCFs67T2yYcq9aDSClMqfoXgHEDhzgC3Yc222uq3nU8qYFcfE8IGsYRQKsT/okJOrdm4GchPYQ8KY2KPqZ9d9+utwH3aChL/cm+D+zXCUsBtxA6Vi5WSjWDcura4YtTQ8Tqnga28+YoCbrbqRAUMqFWV+aaDYRI4rTA0bLWUbe1JuAGA7mtU1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
 b=mVd9ivOa0oEQ51teMbNQaVeTn4hc7C9PkG/XUoh3s7mIqEyFg9nurdGgFCROGa1n24I9xomgwQ5UkK15ak8AJHg1JsGhfMQJwIuYkHTYTBC3Ugwihweh5jKE9pkTpoUt0805RgmcuOcrayYhk1mHjP5iCaIbNBCaLEsfzALOHiukMZD5vxNNPDGpL79hIRtgLDZyoCg4RpsU6mvJd2VFEwSRDXutfT9URqWpFF2KkUrcyZaJ+biuWkI/E7gvqZx3XU9aAEBQGiQhKp+MUgWxfKQSKxomCZ9zphKcmdWYZQ0Eg2fwWRqD25fyVylV5RL+mDPfiFZNGvSS0DBgTKlu2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
 b=vBkCrsdKB7OZy0jeZMjFWOjWfF0yuSL83X0P5F6YFV9s0O+DBfAJEBGhFfJ7ZMB5NjzvaHN6FytCGTquNonNbo4GIaKodnB4wcotWFRUAnAvxSpHMbsS+dqs5N7FOlzXiOurlrOuLETRBoktFUuFWuzNZGogzRdlNug8FaYK0ulTHDVWdqMe3HXLVTs8M/HGRArGLxRud5GG5l+IJKvheRpcGY8ah0Z43dxR5EqZRp0Rg9BhNGsFCmV+GIe4Jdu+c2YJRXNTopTwgimeZBd/avQlZ0Fm+N0/4s//w5uddTYWzL4R4g6cTdAaHzi0xv+/R+zITkPA9gPcmeUdDka9fg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:46:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:34 +0800
Subject: [PATCH 10/11] arm64: dts: imx952: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-10-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
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
X-MS-Office365-Filtering-Correlation-Id: 20798acc-7391-4cb7-9894-08df35c30f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|921020|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/bOy2uCeOBik6WZa0e/JMb0/+vFOF//4hGEAXtXEz/DsF7mGN74xDnHaqBdqrjlA8BWEBKtCuaX0JUj/wsPPvS2BSOBIknXM31eaM7g2E69KYIKGVqt/8UFiQGmkSYLL0o6GRXucHb1CmACUleSFnMKOIzucs9WbVXLlmC9dQv3Ng644p1INn9GpUqnyIVFWG2Qq7RxCr3+hQjolJ48BdCEhwUazTi9YyCsCM3YhkL2aVSl0wZlzgkiGpAgZJmLDnLUuDpWaxhb5uYH+ILPnqw9hL/4P21cyXS0k6v7hqV9z2K38udEHHLnN8k4iVBN4yFCvX4fil0bDx3Bi22iW55QGYD1yooIVSiKwi8cFUj2rBXo73Q72lBo6rJpWgPRYpzmuQaHyVI+0Y5zQLZknFACWlBYeQZuG0x7ySVZRLtWunUekYLonSti0Vzc3GXltOdMsQwCl2DIewhoDkQ0GQX1PHA6MM/O8pOhCez2NXbEdw83hnJQPxy7oOzu1rUbD9cqFO4gxas7WbUDT5Yur9p1ToQsvW/FptzpryyRVQ7z0zvsWyHdZkgaQdKsEfujRMQqvZ9lySYoKkr39au6OxD0NGrfQ1i3EqXj/AiVWvPQ+cUccn8/xr9F39r/G7ipat22l0mTx/PS2CC/Punw6Y8YI4gI7jNDx6pDtnAliOw2suU67wu90Du6TFc7JrcWzbd9f+EoYGDPdFME1ANITkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(921020)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDVRWUpSMk5hZlZOcEJBMlRDaHF2d2lhK0xRa2l2Ym1ISDZydWhrSHNRM1ZQ?=
 =?utf-8?B?MDdqUFVqbXVOTEtHR29VNFB2S0RqbjRLRW1naWN5UjNJeHBrLzR4Q3FxWGJG?=
 =?utf-8?B?bWsvWlVyakM3cFAxVFZIRDVLWHVYbzNzbFhhZTVMS1RDU3REaExLeWxMbjY2?=
 =?utf-8?B?QityMzdQMFo5ZEw2aUN4Z01UdU5ndUZZMWNWdlZoalhjeWV3K0RVSk9jMmhw?=
 =?utf-8?B?ajZIeG5nZktWZS9xNnpBN09iRkF0b2dZTHd3S3FmTzdoYWpMUERJcUVkNHgx?=
 =?utf-8?B?Q3l0a1IvWW8xRXUyeHN1YytQcjBjc2ZITWdQZVFOM0JmV2NVcUdRY2tyMjFm?=
 =?utf-8?B?djBDSzluNUQwYmxhRzR6Y0pLUlpFS2JDTlJkTlB2SEorRnlPZ3NEMnpKU3Fi?=
 =?utf-8?B?NC9BNWdhWHJTK2MzTW1JVWRsTDUrYkFzNDhjSVBpSFdlQ2p5UExTU01NTWx5?=
 =?utf-8?B?d2FoN25SQzU1eGU2dnZQVFhTT2hNUWtxS1YyQklXRHNlVWZMdHhWTHU2cnp5?=
 =?utf-8?B?V0Y0UGpkS1J3c2JaWkZYUExaQXFkSjAzWC80djcwWitUUGwyNDBkeTA2MlNk?=
 =?utf-8?B?dDFMbEVDVEdXMzFFWkNIZ1RGNGJlTzMwT2xkakV4bUpab0VTeURoMHdxc1hz?=
 =?utf-8?B?YmZGUHR4b1QzVitGMFZRK3dMUFpYL095UHAzSE1lRmtRYktRR25VWjhKcFpE?=
 =?utf-8?B?OFh1WHFjTlVSbG1ueW1GSkY0NTgyRHpZT1JYY2RZcjU5Z05YK1pyYld0WWx4?=
 =?utf-8?B?MzRZVG8xMjQ3OGg2Q21Wb010UUdUT2pvUlJFRGw1K2lTWWhHNEJWSVJKSnZ6?=
 =?utf-8?B?a0ZnanhQcExEZXlxbzJKOXVUV3E3aEc3b0NaZ3RKS1lsWVpzekdicGVpTGdp?=
 =?utf-8?B?M0dHZGJDS2lJTnJVVWNCNUg1dFNjQ2RXWktwVFhDMEhZYm9wUGpWbmUydU1y?=
 =?utf-8?B?eEE2dVNnMkEwUTdiNHlxOFJqaDhPTi9NRzc4ZU9oQnd1RithbUV1TXEwbVJl?=
 =?utf-8?B?cml5cmRSR2xQRWZZSDMvc0tyWndrZWo5WmZqdU1KbEhBVGJ3Vnh0cU0rNVEx?=
 =?utf-8?B?T1lqNlRXcTVPZUMxOTVNcUlIRkd6bEU1SGFiR081WGVsNFhqbWozQXMwa2VL?=
 =?utf-8?B?cER1QmtYY2NWVkd5Smg2REgxZUpjYmswcXluc0dKMnljMm1TNGJrNm5GaGYz?=
 =?utf-8?B?b2toNHQ4TVVxekk0Nml2UUZwSitMd0RzNXdGZlpPVFIySzgydlJMUXFzcC9G?=
 =?utf-8?B?T1BGcFhCK2lzVlFKZm9DTzE1R3NkckxiMnMrbkZWU3I3MnQwMVdKTmovRVZ1?=
 =?utf-8?B?NUVqZ1hoN3F4YUxjRnZyZ015SzZaN0Q2MFQxcFlCaFpib1NiWUYyYXRwSjBO?=
 =?utf-8?B?Mng1WVpvelFFV3B6SXlGS3RHK25Sa3VWZldxTUtXM0VyVWpSWXlGQVNKS0h6?=
 =?utf-8?B?VGcvdTErWXluYmN4V1hBL2Q2a2x0YjFzeUZNRVYveGNFaURzcWlqemlDVGpC?=
 =?utf-8?B?SzZ0Yk8wYS9GSzVsaWx2emN4YUZlSmJWWTdJckR2RXhEZnpQYTJmS3dkclNj?=
 =?utf-8?B?andlT0NmN2IxeGV3ZUxoMmIvbWJZOVNkdjA2SVduOERyWjJZM1h1c2MySzdM?=
 =?utf-8?B?V3kzazNJeHJsNDRlU2xLa250bDltRnMwblNHTkxQUjk2WklMMW81UDdObmRS?=
 =?utf-8?B?cC9BZlFVU3lqbktGalN2SktZckd1N29kR05DTDJDODdYU20yWlcyeUI0Smtk?=
 =?utf-8?B?eVBaT1ROelNtOEF2TVQxNjVoemI0c3JqZGcrTStTU1liTnc0UXdqT0lzY1ZB?=
 =?utf-8?B?b0VNdGQ0cjhoMkZiRUFuZVFZOFIzU1BOUEwxYUlBK0tmUnhFeEt2bHdCUE4x?=
 =?utf-8?B?UExoRGcza1ZYREZGdSsvRWdWZ0gwSlB3ZnlyMUV1L1ZwTWlMWGZKYytVMysz?=
 =?utf-8?B?ejZkREh0RmUwdCtxRE5DSGNRdVZvS1diMU44WEdjRkFLVFpQR2hPV1B1Q0o0?=
 =?utf-8?B?STFFaFdlNW4xZVZ0Y253ajVzbUJMSmRDTnN3c2dGbmN4ZmNDSHg5OGRGZUJM?=
 =?utf-8?B?ZXZ3b0JDVzR4d3VyY0E3SG9GTG0wanJyN3NXVWlOSzIzS1p6dGcvZU1rVW4x?=
 =?utf-8?B?dzR2Znp4Y2MyaXpDbnFIQTRYbTRjWURzd1Q0OGRjY0Z3eWNIdHpXSVV6c2Rw?=
 =?utf-8?B?TXpRaE5QVk40Si82V0tMMHdIalhKVmZ2bTFocjdmVitZOU43S3BnRkZFLzZF?=
 =?utf-8?B?ZDRZdFJsREJnNkc4WU03eUlqMjVXWUw5WTk5MHE1R1lRMkFSejV4eG9IUGhN?=
 =?utf-8?B?clVHQUVmSXQ0Zm5RdTl6Rk8yeXlvcjl2M1h5Ukh1NjNBc2NrVTVldmNYcXZ5?=
 =?utf-8?Q?SRchriepYiYzpUGgo7ijNh6B+WjWABSMiy1Fy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20798acc-7391-4cb7-9894-08df35c30f14
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:40.0791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNJpbn0f0wx6LrFp3ahd1rLqf+U7XjUrWDho8NMbbhwegCJvRoU/TXMnyIM3sqHtNaUKVTdLwYmCJjn3q5cHEbUp/p+FlNNI/iDW/Z1W4wTKoFzVB/L3KHUVlXpHVAHg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

Fixes: b516a4dd6a1f ("arm64: dts: freescale: Add initial device tree for i.MX952")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 1154b66dadb2..22f02f48298f 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -1024,9 +1024,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
 			ngpios = <32>;
 		};
@@ -1040,9 +1039,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 115 8>, <&scmi_iomuxc 8 85 18>,
 				      <&scmi_iomuxc 26 53 2>, <&scmi_iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1057,9 +1055,8 @@ gpio4: gpio@43840000 {
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 57 28>, <&scmi_iomuxc 28 55 2>;
 			ngpios = <30>;
 		};
@@ -1073,9 +1070,8 @@ gpio5: gpio@43850000 {
 				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 103 12>, <&scmi_iomuxc 12 36 6>;
 			ngpios = <18>;
 		};
@@ -1411,9 +1407,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_M33>,
-				 <&scmi_clk IMX952_CLK_M33>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_M33>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 123 16>;
 			ngpios = <16>;
 			status = "disabled";

-- 
2.51.0

