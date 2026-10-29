Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281542;
	b=2LdgjSUPlmkiq9nfdeTamUZQ5hYEN2EoLuyOovtuHRqy99hvq+NTjyLChcAdYHvJ2s8L
	 Y0DbRljbc//QHwsw1ApNcts36fx8yLR85hCv6LimYE6xSTDCKpGq8G/iovHSF3wFGVUqG
	 TIHpabylWC8+/wnms8l3T6cxsaM+CYe9MvmKiHUS4AEcaafsJpQLV2gaVCRJEKlwTGHo/
	 X19G46JTyapXmXv2v6XFAkxC15rwxYV50EYrdflDawN8gpPstk9Qv1Z+rQVqr16Vw6Wr6
	 LKS3L0Qgb8eWoqZmznRzeR/Y9cKEFx2T+EuGX+4RVPSZdA07gqSF899dNaKNjCqSUeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281542;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=FNRrkMt7whwBkS9pPwmkGQQJY0dLd+wJ2clDJP13xpI=;
	b=m72LT8T2199X7qOXQFhQOWHdQj/BC3wd6QxziHEiaqsZZO0DgsbNumCIBBExU3Vw8ake
	 fkouCucdQER9askwGlXGo5eSFLfyO9ZkMatQk7DZe/pDazzd26WZc2HHLqPgULRE3aVXg
	 COx/jlvcDATjPIQtcw4fU4W5NGKW61FbApU76VnsMPUfMbJYNH4qCQc0JFQQwjNB88VmJ
	 1Dg2xKSKwF7miCJ6eFcX9sVaQHhh/OEz7cjLYzN/xlu2Q7VzSy6KwzOZed/arO9MrQPeh
	 3igUSwDoZDcVlEm9BoVBTAb+SHWgttj4Loa8/0viEkQlHa5c2GIJ7hu9ZYKj3B2R48g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="bA5lIL/z";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.32
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7264F606A31C;
	Thu, 29 Oct 2026 13:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7264F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bA5lIL/z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WttwDV+qN2jkrxCRgm7FQS2M2C074h3/ga83QjxPN/G5ZBIw29wpPzBulCgv08BQttO96C3EohkmvN67DRHmmzRkk5rQO5xMdxP49KFrTdhIRi5tXnjarxdrjFK2asNTj8kOjCv0vWLnDDj8MkvZUL0/tpbMbwF11U7w/DbN4NUPQxmb3/vv/sSBhmR6qa2yXZQWXDW9NCB/bkMOAu+dCwgl5XzFJ8QX5tqpNgmivM7OaGRSUM21Y0mjkcDir0JnNaCtDcAhIvj/g4uLVQcVds35LzxNQNnT0zFIk2Jg+yutP4rzxSRplxkH4wHGsUDwzDoRLvDLk4hO8Un9jcFh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNRrkMt7whwBkS9pPwmkGQQJY0dLd+wJ2clDJP13xpI=;
 b=QV6lICGuWHcbHnklnY2z1xpBWNHaddvXz04MWyqaFdbDzd2yftvHTMMQabUXoTMxOKXotAd/nPWvVBfiR72rLrLCsu1qtE1pZbP7SaTcZm4uFcoZkN96X6afLPVE6eVPwRc+x24CXrQ3QXe0t3Jh+kSEGSzwACg/V4efkbAeViNSrPf0wEb0Ao6DImIFpXWLf2tXWyCxjFZnBtJ19xknjKjKNeec8btMLSb0NdzGYRez3ngzOzUsgpGoUVh/eOFzfBuRbP9EvSYpT1GfJnWmWBOTLHK3KvdnvccTmbS/QmfPFdk/dQGI+HERSi6DO8o7K2C3t7k0CM8fNlZjWuOFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNRrkMt7whwBkS9pPwmkGQQJY0dLd+wJ2clDJP13xpI=;
 b=bA5lIL/z1tvczD4mAv9rWZzoyTSNB9ja8/AAdIdcSsxozFAKmSXsKxCl/HX1AAR3wCIE1AVD1BHykFeqd6+KXDFGurZCVBzxLwMjcxnGIf8cVXW5YDNlPTq+iYERc4s80NGvxiY1GcXZIcIy3nGKZMWavGLhuQ4DLcAzKKBibHH2AmrHTxypqmqz5E7ncOfVRXEv4KahIa4qf/Vlg4ucVQcl6vfCNMVwnzSXUt1p1m820MSU4s1q6wapUkcoqvEzNRuhOY1Oe89HrKWIF7ezU+Bwda3viRqNkh3y4gK/JsIfTE4lRFbrfsActBei9JmQDm1JBqVhpw0kYWHrSMC2ZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MRWPR04MB12355.eurprd04.prod.outlook.com (2603:10a6:501:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:45:36 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:45:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Thu, 29 Oct 2026 21:42:24 +0800
Message-Id: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEBN42oC/yXMSwqEQAxF0a1Ixga02v9WpAdtmdI4UKlo0SDu3
 ajDw+O+A4Q8k0ATHeApsPAyK9I4Ajv+5oGQezWYxBRpYmocVl4wOAU6/pOgzYvsU5dV7mwPmq2
 enkGr9vta9m4iu90/cJ4XR7IboHQAAAA=
X-Change-ID: 20261029-gpio-vf610-fixes-c56439785fcd
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
X-ClientProxiedBy: TY6P286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MRWPR04MB12355:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db6f734-58ce-466e-f97f-08df35c2e8ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|921020|11063799006|56012099006|261028144727099003|10067099003|261009223027099003|261021121427099003|261026140227099003|261022105027099003|261021123027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eFZX2qS04a4c8Bb8yQ3y0e7U0eClhN3jZGLF2NvZBnPPU5aO8zRlrvNLBbtUkvYEwzex3Sb1ybHzF+lc0ELdpiOK6FYkB37SHCuDcIh0nLG44/odpgkPwymZeEPkMKytuMdMLELVms18z16JKbMKxDCqiPv1PKADHLlcrvN46mXfe7POZStWgVjtAR3D1gtPwyLUPJnBfXLrQBHUHsq7x1NnCYLr24bVnAR3+rsU4hAE4xpJpylq1kY3kWpuA9bACK9zfaIOZNGM4cj+H9pRVqtk/66AqH56wUZ58QtKuTx0JiXEAI7wJuDipbRdB50RHgx1EeN+dFQt+HntWx7t8jLilYZOTILl0tIEgz89DV9aJiUpSG56ZOxwnsI1xcjlznmHDC5MPmo7dE54rCJrkwCO5DwZKo9nMUzfaRa8028CA6vDV8U06GImRdclkIsQA4T6d/3wS3BoFU0NwGE9QwCJQ4XuEWZwrphqgB60iNn1ySyDXRyhJcIdyqBWW/eulwpwnbhW7g2UiYDysHWASlMCQ6mi9uaABUimGyRyrMnUvgmOqJYbIRZ9SWgtO+/ShF8Rfy1qan08Bra3aZrKcbSGS19ty1BSBn9Td98dhJRMj3FWdSoSYjYq9KWWvVNgnEi4P+PZLE19Mki9H+yu3iKA+HB5LO0W2TKVK5V1dgfftJCQ8aUDrHXE73s4K+Ik3Axa5gR8yBA/gO7f6le5sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(921020)(11063799006)(56012099006)(261028144727099003)(10067099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnBJT1I0Q2VseUFSeU1xaHlSRTltaS9KYkQyUmFtVStMalk4SEV2OGtWV1ZX?=
 =?utf-8?B?ZEd2dVE2SjdOQWMrMW1tc0xEMXZDOXVtQlh6Sk9ZRlRsRElQa2FXZ1BYVkxi?=
 =?utf-8?B?dkJNcHBGYnIya1VtdlRtUXJFNFVKUlE0SE9YV1BqeXV0NW45Q2x0YWt0WElR?=
 =?utf-8?B?cks4UmNXQ2xudHJHTUlvWGN2K05sN2M2cXlKQTcvbXo0U1c1QXRFQmtpd0xl?=
 =?utf-8?B?a0QvVUZ6elV4alhYRlNMK3hoNUd5MzlidGpVWW84ZHoyWEVYV0l3WnJ2RXJD?=
 =?utf-8?B?YmFQSTY5eHlIekZ4dVltWTNNOG4xdlNxbHlaMHUwYzFxckQ0RzFsWmhyVlN2?=
 =?utf-8?B?WUZJSFk2cjFxeG1TaVZYRjVSNHBnZTBOYkFGSUM3Q3hvamRZRExUWG9uaVVI?=
 =?utf-8?B?WTV2NmF1MVVLRzVXSFRPK0xtTkNyeUhxRW1VRzZlbVZIYVlsSTk3RG1IQVht?=
 =?utf-8?B?Y0ZhR2FiZ2QrZVo0MFp6bS93djFPdjUwUzVaUW5XT2NBcnZGRS9VMHpURCtN?=
 =?utf-8?B?VDZRWVZBRWZiQ2QzcTFpTU8wTGRrZFgyWlRNUmlOeEt6Wm9WS3JXSmRkSURV?=
 =?utf-8?B?dFN1ajlEaTNIbFhBU0JLSXN4eWJKVGtWTU1CNzBTdk5pREtJcCtXQ3ZRMEts?=
 =?utf-8?B?MElZbENyQ0pPZkhCZUt2ODFVQWxOVkNpTk1IN1lTeHVtanlhMFpDcXhBL1BU?=
 =?utf-8?B?VXRxaVU4Q0wvT0NaSmxXaFpDRERuYVRKdlB4Qk9MRDYrRTVqZWdPQ0VRemdB?=
 =?utf-8?B?NWg5cUpEWDRVWXY2MEpDalJ1d1ExdG5WZUNRZVlzYk1PQVJDeXVsMXZJd2xM?=
 =?utf-8?B?R3p5R01hSE1zSE9IYVVSRGhyOWF6M1RTWUUvU2pRZ1Nvc0VnQWU3TFIzNmUw?=
 =?utf-8?B?YzdMSnBJdk5pbk91akxLa1FnSEhTM2VLamNJOWh5WGpHVk10R24wVjVUVnow?=
 =?utf-8?B?L21CbmRKRmxLWHhIb3pnVGpsL1hKMGs1SzlXOE4wRTI4Zjh3djJVMmxadk1p?=
 =?utf-8?B?ZTdUMUhONU1zcEtabGtwVEJHcjVzVyt3OVdKTTdydGtDbDZIZTc0MmVmZU1t?=
 =?utf-8?B?eVZZbDArOGVSS1hGTDBRY1ZHWmp4bmc4aGwwQVVLNDN0UklTdXJzV1NWV1dF?=
 =?utf-8?B?STRJa0h4Y2VqRXdVL1RwajM5V3lIL3FEanNSQkRFT0Zxc3ZpWDlVUGRUV1hx?=
 =?utf-8?B?bmNlQzVzeU9qTEt3TnIrVFlUdXpVTEoxbkpsMTMvNTdZL1dmeXVsTzM5d3ow?=
 =?utf-8?B?TnhlZkswNE1VSnhpNDFZQ3A3OGQ1UTd2a1FwNGw5SGIxa29lRXppNDhQbzRH?=
 =?utf-8?B?VE9xUzBvTEV3NjRxeTZsWFpXM2VNQkM3M1o4R2VUeXVyZG5PaUVyRFE2YUVw?=
 =?utf-8?B?aG5RNy81K3ptbVZSeGtRbXlzdjJSUkl0RlVVaGpMT0tBdzkrU1QvY0tKNVk1?=
 =?utf-8?B?WWM0M2NYa0lvaDFwb2w2VEVOMkgrSHpqb2plL3R6WHMrUWthV0k1bUI5aXNF?=
 =?utf-8?B?dlRUMENtN2YxSUtUTXdveVREWVkwWTNETE1oejZIWitiVVJ3czFSNm13amFr?=
 =?utf-8?B?enAwNkNsd2JBQ3g3ZVBuK0xsRE5Dc2RFUWxGSVg0Zi93cmxLdXdXVUtnaDgy?=
 =?utf-8?B?cFFFUy9aakxVN24ySGkzSEduTFlsTVJXQ2ZRMEdmMFRBUlR2Zjc0Rzd6aUNC?=
 =?utf-8?B?UkF4bk1neTZQTFJFdTZpZmxuTlBDUlVsUTE5VDdqSi84VDMydHlPNmRGS0tJ?=
 =?utf-8?B?MGtyRTV6STBudlJLNStFUWd2MmpOY0tBcWZWQ01XckZjd080MENqekRsYVJJ?=
 =?utf-8?B?SGNaMjBNeWN2elQ4Umo5cURkN0t1M0dsVEp4bms3V1FxNW1WT1d0aXdoWDht?=
 =?utf-8?B?NS9YRDRNMXJQOXQ2cVA5bGNZTWg4WFRqcm1TK1ZyTklQdnBxcXloN0szTUhv?=
 =?utf-8?B?Qnozbll3b3pxQTQxSGE4b0ZiWGVEOG56Q3JuWWdKL0VKWlA5MkI5T2I5V3hr?=
 =?utf-8?B?NE1lc015cDdDbHRWVk1kTlZDV2FZU3FySGMvU2Jpc3NORXJNaVQwWHJRdGZ5?=
 =?utf-8?B?ZUJiSDZVankxSVZsZ3BndTZvZWEyNElBSnZVN2lMMEZiMXpUV1dlWjAwWTQy?=
 =?utf-8?B?bjUrdjN5UU11eUxnSUZmN3QxZzBIbFhuZXFNcFJWenRGWmk4RlB6OTVQd2la?=
 =?utf-8?B?b2dJeEMxRk5NRnUvN2RDVnA2Y3d1emErZWNqVlNQM1FpUGludXB0bXIwSXpq?=
 =?utf-8?B?WDJmOEJXTEUxUWN0K3QwWHl2b0ZjeVJvbDY2NUdtb29TNng3eS91L0tEU0p5?=
 =?utf-8?B?SWlLUzU1N2d1ZjlPTkdxV2JUeGpDTFV2VnhSckNiS1ROU1RBaTlDK3hadzJ6?=
 =?utf-8?Q?sAfSZlMorMimOj4dAppuvJ0OS6OPqUS4yyEM+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db6f734-58ce-466e-f97f-08df35c2e8ef
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:45:36.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0SkxryqQKT85fIdNkuONye1DvsIp9qt74tLyA7PsPT0TZu4jFBDgAn+G9DaS/XYnvOiI0ioMb1eFodYm6dYFv/f5Iv4TjTwP/O+mSsy8MqFvp0TPDClLTb+sQdoIgSy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12355

Per i.MX8ULP/93/95 and etc reference mannual, there is only one
clock for a GPIO controller, so drop the 2nd 'port' clock.
And for i.MX8ULP, the 'port' clock is for digital filter for iomuxc
PAD, not for gpio controller. If we need to support digital filter,
we need to add the support in pinctrl driver.

With binding fixed, to avoid dt-schema failure, correct gpio node for
i.MX8ULP/93/95/94/952.

While at here, a few misc gpio driver cleanup patches are also
included, more info could be found in each commit log.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (11):
      dt-bindings: gpio: vf610: fix clock requirements per SoC
      gpio: vf610: propagate return value to callers
      gpio: vf610: simplify with irq_set_irq_wake
      gpio: vf610: use devm_clk_get_optional_enabled for clock handling
      gpio: vf610: drop unneeded header
      gpio: vf610: drop unnecessary wrappers
      arm64: dts: imx8ulp: fix gpio clocks
      arm64: dts: imx93: fix gpio clocks
      arm64: dts: imx95: fix gpio clocks
      arm64: dts: imx952: fix gpio clocks
      arm64: dts: imx94: add clocks for gpio controller

 .../devicetree/bindings/gpio/gpio-vf610.yaml       | 32 +++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 15 ++--
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 20 +++---
 arch/arm64/boot/dts/freescale/imx94.dtsi           | 12 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 25 +++----
 arch/arm64/boot/dts/freescale/imx952.dtsi          | 25 +++----
 drivers/gpio/gpio-vf610.c                          | 80 +++++-----------------
 7 files changed, 96 insertions(+), 113 deletions(-)
---
base-commit: 8a36f53fd5ec3eff01f1b637d42cbdc3821d0493
change-id: 20261029-gpio-vf610-fixes-c56439785fcd

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

