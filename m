Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663256;
	b=q8RYR1/xpgemsbqP7ChAhuGvROTvi+BJcmfEg17VyGk0KhYd/17WOSB3N3kvWdWZjw4j
	 +NDQmWkCX4znWiPPnzl60fUjwxtJNaxurUbwNJlDR7/k7iD88LMf5P0QxCtRUbyOdtK26
	 hglfC/hMREWolValyfoMj0GbVoix1UIeAZTzHBP0sFAZ6Sf22OIHnnPBDlcuDPDfvi2K2
	 yHJhcy5tXJCYF4DfG9DMlk74ZlJyT4zNWRlQ7P1Yae5Q4IG8zw3/FomZCR/+bfBa1azhR
	 DFUheyQtVn2Nz4vM/l1edTgDhn+xaDcczu3dzRBMvmataTN5djQ1ulnxl2fuxNQEFug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663256;
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
	bh=up1+s/MXa9qFQppXzrtFyLnSUYZFoB06kMdg+QQZr3U=;
	b=wiM+KaFWwO2isXUFcLwQZxnlfbkdTS0aja9vsyZq5BKVrK+w1obftjWUDi5hd3M5phS7
	 /qnvjrlDwvgcrARu31pMNZ9+YEel7HQFf7Ncf6z5findLuDuFG7j7xSy9OMQIHTj7SoGs
	 SUVB52i942iGxapOFPcmMP6yvZnj6wCbf0pHy799H62ucC6T9M6qUi34eYsJQl0m1AT8r
	 hkabDkaxTPqGYYodI2oHXAytPhXJ3iUJKWJZ7pE0rEOEEAjerxGelDKBInsXihuesjtMK
	 E2DJs0GZDb7auIUCr6ZiD5w8G/Cr6Y9M9/kAGV1RwzCZZNF1FZ73j6al8aClxYRzZzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bFmU5rjw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C7C606A324;
	Mon,  2 Nov 2026 23:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C7C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bFmU5rjw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JD2XZyzc4AnE5rvs65OxQhh/qKvZBsQo7FUHrhfzGOW/haZI+vr9fgOmf3rnxet/8nYePh/NeNqxRM2dQl1bPRErZfO2ujArWBWJX4bb2ao8uSNvvktVkvrouALkEVsINIqWHkfTLd072rN8vTtCvg4xP6SkdPsT5cI5Ijru6hw3DmWuH6oAfA8KiRfVcE8o9/W/urA7rlDv5vMLB4iwq3WuvV8Gh6MOVUosV7p0PgHiNKmNTKSlXMOeXC6v36GUhgSZt1O2BYxShovMZxTSeDAMNrBoKYtDKhsJCbgj9YvRAD4ENTUgM6B5LsdKzRuJWTU/3m1hxFqu1ZK93sWMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=up1+s/MXa9qFQppXzrtFyLnSUYZFoB06kMdg+QQZr3U=;
 b=IRW25GMEqKshxKjzepMqfXvTef6RqxABwBiWTLjmHf3qrSCyRI0MX9WQLF4LwQnXl93QIFZk6eTKNQwHgNsGsOdq05vWxuADd8d7SMSSB52vkBtEPLGLgBI0Rr6DQ/V8VFXHFGgP2MSaIS7+BMlmTFBM+buGTbCUISQV6TjrrvxZyQ2ku2uU+9YnlysdCQfKBjIUo90nmv3RetXoLMCIUoLFtMleXoNrFfBzqnnznZ7wfZJBSPo9/8pdSWs5q7kTWc+aC/r909IDlg3vd2ctxrrjVnweZZ76kbRgzIOWBR+FVJPgtvwazyiux42oF4Yn0A64iAb7iNnAya8FWDZCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=up1+s/MXa9qFQppXzrtFyLnSUYZFoB06kMdg+QQZr3U=;
 b=bFmU5rjwriVGMm6vA0ke38kcHjxXSv5S5yblNe5q91iVAf7nq6fjt7npY3ADZiQdzZVtU1WAabwfQOwH3ldO2wJHmkUs4JZ85tGZLZv4YUobBUbi7T39Wt6uizJmUr8xqkQgiZapiFykjldtA1NUya8XplTtjC04qDu7KicCebtCwZVRSmJ9bmcawCtpjOxipPpSFbhwTFofF8g1xUChDMvOEhmnkl0iQ+zbdVSbxA7l/uNMW0lBZIbtFjesQfZZcD/ng4AAikjd3Vm3cyJyLjYP6BrYl82sOh3BGDaRq6/ylc5L19S5Pt7W5kR4E/gc+Z2uP+TN+MjrwCmpNv3Glg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by BR0PR04MB525839.eurprd04.prod.outlook.com (2603:10a6:2c8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:47:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:47:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Tue, 03 Nov 2026 07:44:04 +0800
Message-Id: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQg6WoC/32NwQ6CMBBEf4Xs2TVQFgRP/ofhIGWBNZE2LTYYw
 r9b8O7xZebNrODZCXu4Jis4DuLFTBHUKQE9PqaBUbrIoFJVZqmqcbBiMPQRsJeFPeqipLy+VEW
 vO4iadXwE0bo3P/bv9sl63nf2xih+Nu5zfIZs7/2ZDxmmSEVLFbWkKafbtNizNi9otm37Ao3Lp
 HTAAAAA
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
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|BR0PR04MB525839:EE_
X-MS-Office365-Filtering-Correlation-Id: 850d4fbc-bab0-409f-35c9-08df393ba936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|19092799006|921020|261102123227099003|261021121427099003|11063799006|56012099006|261009223027099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	f/cvMvP1TKaoXbSu7i3sqhZRgUot/kWnUwMoydEtJdLuA2vB4Nb3jOKO7YspzoIzqwIYcJP5+RqKyIqUBTD2HDjQG4wy53+rYado5PBcChGRetve8j+9OBs1GBx5X4UKLDe1VwgRmAIFt4w4T3gBOwYhwwjVGLq5Wsc9IA1xIpzj6bXo4A1dNtqSxtkLzv/DGnoLyPW6q5LOdLiznN3YKhh1jOl1ipduEDfXbSqXbKCKN9nBO8A9w/bDedSDVF9ECiBLQNtWZREBooIbe3eiOG/OaQhZtIgQqjETuASjb99XJnaXIexyC8w5FWlVOJl3B5nsdWK/esEQk+ZYawzk/9w86KW0zd1gzTpbr8l3uNcu1MEpSZUNiA1zaM4CW2IJHHND3Ed2m3CiIVsvT3yNFOjysI7s6ixQ4r75vIHrfZvfE3tCQYVBai688wwJ1gnk8pIZalTI/C5ofjEwkKn9rV0ANDhaO5IazpDx2MbyHqcjFKo1x1pe/UQ5gsN96fJZUzXD47wyavTwGj66hY3NiBnJvAc6vktb0XIUdNFFnx0D3+O40NaEvcZLTVcOuU5z+RK3K1Ob5q5XoM3vaveoWy7zCBDSq8Y6jUcyO4bLQCQvBz6MZ/oqJLoLkIlMr9FXXuJT0APoIHkd6BBQtVRD79WzErTb9YsFQOkyc0AS6zg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(19092799006)(921020)(261102123227099003)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTgwTmsyNjlyc2d4K0txVW00Ry9KK1pCTWZKRU9UZ3ZHTEs0KzI1RjZDV1Vt?=
 =?utf-8?B?cThQUFlZSm1obkVLSWQxZVFtVHQwMHg5dXIvRzlHMGF6WW5MejkwUDh0R1hP?=
 =?utf-8?B?aU41aG05UUZMeGgzUWE5bnVUYkFDb2g1WEtOVDFPRmk2YXdjeVFGVkNtSFVN?=
 =?utf-8?B?TXRPMUQ2bnA1WUd1dlN5S3hWK09QcVJYVnNSVzdyV3pHMHU0alVmMTAyd2lF?=
 =?utf-8?B?aU5qWUxKaWNLR1krVDdvejlsYXR4UXVCdS9Ic0pmSWp3VTFXR3BJbzNHWDNB?=
 =?utf-8?B?MFhmak5ZOFFzY2xmbjI4Z1lxSHl6b2xrdEFndjFiMXZLbm4zNHg0dk5VMmhS?=
 =?utf-8?B?VjRheElPcmY0TWsvcC85TmM2SmoybklTakNyeTRjbUpHTm8vMDMzeXhoN1Rv?=
 =?utf-8?B?NlhXeWxZRkZoT1Q1cVVhbGNsa1IzNjUrNHdpR3hYZE51M2hpVUQ2SHp4YWdO?=
 =?utf-8?B?L1JvT0F1UkJaNkxSQitQYWlPa1k1WENpQjFwWGhXTlhOWVlYaTQ1c3JjSXJq?=
 =?utf-8?B?aFVUcGxVcElmOXFGS3V5Y2pFcHozcDNVK3dOTzNLOTdIMStOSExKS1BNZExM?=
 =?utf-8?B?M01sTElneitVa0VxdlNkTXUrRDhHSm8wU1pxTE1BR2hTbnhLa1ZIVkZsaTd4?=
 =?utf-8?B?a1M1OVZDYmpuQ3FWV2JKZXpHeTg4bi8zS2l0WG5TYzJVK25TeUNPU3hZcDdT?=
 =?utf-8?B?dkVNMWRUOWpIMlZla20wTEpBYm9rY0pyT2R1NnlOQ3QxT2FYR0p2V0JPNG5I?=
 =?utf-8?B?bjVMc0tPcm1NQlNadGZXdE5wUFRzMWdvMHZqWFBaYlhqK0xKRGY5bHlDM1kr?=
 =?utf-8?B?N3VGRUVZaVlWeXFBcis3TEVuQ1FCSXcxL3dvenQ4WW5FclFPL0pxVUhlTUV2?=
 =?utf-8?B?d2xSRThTNlIydWZVVWFCbVBFd3E1WFRXQlRBWXRaR1haQ3JQMDN1WjdSeDdQ?=
 =?utf-8?B?cFNWcU5jRXMzbHZMZUI2N0RnRWt6NStyOENFdmU4MEVCMWY4RUdkbGhSdTVX?=
 =?utf-8?B?aytaQzAwWVI4MjBYQWJmdXk3YVR2c1RvQytwb0JyR3p3enB6QnZXU1EydFFa?=
 =?utf-8?B?emUwQWlmK2NtdDBPWXd0Y2hwVW54aEdiWGdJZkZ6Y2QzbS9UeWxSVGRMaXZj?=
 =?utf-8?B?UGpGbWdXRDZrcG5pTWU1eFFSKzRXRDNtanZReFc2eU40emNLMjk3aG1HWSs5?=
 =?utf-8?B?UmRzelZ2bXdKVDZqUnZqamxGVlowVzlVRXBzU3dNbDdwNkwxcE1YR0JNdDA1?=
 =?utf-8?B?ZlBwZi9yNkcwaG1DZkxGTnBKbS9mZTJ5NU1YQ2Y1cU9DQVhDazk0ZnF2ZEJF?=
 =?utf-8?B?UnZzVmVaRjBWSGExbjAwajA2aHBPaFhmTDRvL3JaajRTaW9tblRxNExVWmR1?=
 =?utf-8?B?Y2xtZ3lMVmM4MHlYTEJPaG9iRnlLcWxRTy90YndlRStXYmFKMTduRllQZEtT?=
 =?utf-8?B?M25OR0M0NUcxSzhMYitaTmdkV1czREZlODduSlQrUFBoaXVxWUNjTU9ibFFQ?=
 =?utf-8?B?TTJlMDN6MWlERVZMSXRxL3BaM0xMZUFVNWVuOGdUZGkwM2hwV2RZN3dSdWdt?=
 =?utf-8?B?ZUJpdnV5Q3NVTUlGcXJZeHJ3WDljMUxubWFQN3dQZlVkT0ZmOWhINCszQ2p6?=
 =?utf-8?B?YmZoRzF2UmxSdC9hUm9TSlF1WU5UR0w0TGc5M25uOStROUx3NDlYMEc1NVZ6?=
 =?utf-8?B?d1cxQnlJMUprRjRzbzJaMHNoQkZPSDdOSUYxaEsyYUNtRVFPbDUzS2dVN2tN?=
 =?utf-8?B?MUtFQ0hUdktSNDZSbXEySHlKMUlFcnNZaE5WYXFWbHk5VjFzRUNHUkl4MFdF?=
 =?utf-8?B?aEo5QWg1cXl5ZmJUMVYrY1RKcytSemd2dVV0NjMyZ1B2ejVWZjFtdEYxNGpP?=
 =?utf-8?B?ZzhEMVkrZ2FqaFZ2eWVEVjF6MFJkdVBINTNHQ3J3Yit0T2QyOTRIckI3SjhF?=
 =?utf-8?B?TDk1cjRpYThNRlEzYTBhanpyaUhTZ3Y0cXlPM1VvaSt3NXc0SnZ0UGlDVmNo?=
 =?utf-8?B?dWJxZmRrZExhZkFaUWhkTUVvM2RWVHROd1RyRDAydmFMRUV4OWtFZXEyUnVm?=
 =?utf-8?B?SmdtZHIxTDVTYmM4a0NtcVk0ZDhhdVZNNEVVbk9hZkZMM2xTSHRBZThJU1Mv?=
 =?utf-8?B?WUFXTlhsOXRZL0JLYlYzb3BzOVowL0dIK2R2Y2tVZEQrOHFPSjBHcFhhbjBi?=
 =?utf-8?B?a0ZaenFrMlVjME9OdWlXTHlObkJMd0JFOGErWGRQL0hlcVA5dkNTRnlCUmda?=
 =?utf-8?B?a1d2cTZhNk1iQkU3ZjQwNnR6K2JNQ0ZkRERxd25sYXUvU1pCNU9qMVplNktl?=
 =?utf-8?B?ejBsWW9zL1lTdm1ENVlESGJ3cXJZOXZMdU0vRnVoM1JveVpkVjNmc1Fkb3pj?=
 =?utf-8?Q?Rg5EglBnXviirMVvvvBh/uC35whZ8zkLthUYj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850d4fbc-bab0-409f-35c9-08df393ba936
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:47:31.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1HK8k2zlGuiZgggagCiyfG2+kQQ++4NsBgF43XMHyM/tmQ070D68qesEYmARtVZFy4v3Mwrlw6BXrkYcqpxTlp8TmvLbb3uDx7X1P1unNhXx3GMW8uvOOqv0EvicHM8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB525839

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
Changes in v2:
- Drop patch 2 "gpio: vf610: propagate return value to callers"
- Add R-b
- Minor subject/commit style change per Frank and Krzysztof.
- Rebase to linux-next/master
- Link to v1: https://patch.msgid.link/20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com

---
Peng Fan (11):
      dt-bindings: gpio: vf610: fix clock requirements per SoC
      gpio: vf610: simplify with irq_set_irq_wake()
      gpio: vf610: use devm_clk_get_optional_enabled() for clock handling
      gpio: vf610: drop unneeded header
      gpio: vf610: drop unnecessary wrappers
      MAINTAINERS: Update i.MX GPIO entry
      arm64: dts: imx8ulp: fix gpio clocks
      arm64: dts: imx93: fix gpio clocks
      arm64: dts: imx95: fix gpio clocks
      arm64: dts: imx952: fix gpio clocks
      arm64: dts: imx94: add clocks for gpio controller

 .../devicetree/bindings/gpio/gpio-vf610.yaml       | 32 +++++++++
 MAINTAINERS                                        |  2 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 15 ++---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 20 +++---
 arch/arm64/boot/dts/freescale/imx94.dtsi           | 12 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 25 +++----
 arch/arm64/boot/dts/freescale/imx952.dtsi          | 25 +++----
 drivers/gpio/gpio-vf610.c                          | 78 +++++-----------------
 8 files changed, 98 insertions(+), 111 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261029-gpio-vf610-fixes-c56439785fcd

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

