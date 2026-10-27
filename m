Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103245;
	b=c6bTIE88w6Efr7wvrZjnDAExOCggKPvorl4pdWZ6hFLt68hyuxu2ZMHLxq4L34XMPwVm
	 adzsjnfKox0sb6WNlGY3jGrFT40CLwB9YetlG0CB6HbB6wlxlU00RriRe/vpzPv3U6Q+E
	 d/7BtAtvHr/WVWd5hLCbu3BYX64hxTOVi122PEHlc2T7VwpJavpzcgl9lUBed7DyP3QFA
	 /PBGVJfTidfG8c97azfseTpTACRZqVxxcunz+xxV9Eb+lpR+K5YY5JZ3EzoirbHXTWXP7
	 cLgf2QZSggWutaSVK7XK71h2BxF86+j6nT3g3Q1jYsZQTL+s42PqSHzYQuPDqwJPG7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103245;
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
	bh=5K1U0t5kXJR6wOnUkEKC4dZVlqX2MYN8Qpjd5CLw9zI=;
	b=3jZYz4QteUPHx3AtXC9uvN4Hy+5tom/MQvJIxuRTEYh0D2jyyH7ZwQQtVUZ5Wi3peXzo
	 fTZQEQxcbtdkZo0KBL7qeJEXIi4rcEgSfskUJsadCYuJHDEq0CT4nagGebDPoJTTlXnnX
	 unMJ67GEJpUZTO2TKCkbpbghsXHcSphJOIfAFqB/xt4B+EA8lTdLZioCTxt0DIn8LzwFz
	 ItwZ7iu39Naq4c4SKHSXOkaKgdXngYa5DyzPeAIySkC+h66W6tjrRNMTkpNma82WKWCZg
	 diz1ggnuHSf+9LW15xsXNtG6LR5GkSPd91pP7LjC+gtszxAjtQDqKIwcp9Fd7kxMdVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xVkNCSUE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.23
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011023.outbound.protection.outlook.com [40.107.130.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70A1606C995;
	Tue, 27 Oct 2026 12:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70A1606C995
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xVkNCSUE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rk7tB796jp8i8jH4lzSvuNkYSb9EcYqiAkW8PGIlXdPfDj5SJW1quON8jlfzkFop4vgfYEqt+Aw/w5mWL7S7Oonbl3vVWoiGgionAi/WmkG6+jyRxmqkUAXZnEj1ic33MFj/ZU4rQJ2+p7tj7n/kqwVFadLocWYMgpTQk2O5ixBdYbp+HUCnIfQeF+4U7DCP+7h4/3E2g6t02KZ282grezhJhN+dg2W0nMagCKeTGkB2z3PIPqqTxaXivMWS5f0KiEPL74FOwkgJVavb55nxPMJN/410SrOGP6jUpPdkaZDYRdS4oZ/Z0k8z8jOvxXTHkIny2CE0yOG2XK8jjEwelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K1U0t5kXJR6wOnUkEKC4dZVlqX2MYN8Qpjd5CLw9zI=;
 b=bsFdYTDh9a+oayg1hGtlOTcyDuHeto+h4LKkFrVl/F7q0w/z0ZRslGFVBMgVui+RBbN1INIi2Qm42yxEBKRViP6OgbjvJYKlnv9839SXO3LMlziDO1GfFdNSQkez/5DmhjICrosKtRZee8iOaM5QQFKrDQPPNImu06FAXWpmnNnzqcpfNDAmPGz/8ThJV0Fc7LQvZKWspBHutSPX24FsM8ECoEVkteNKK1b4PG1rI7LO2gIYLcfcnmgdpogq6K+tYqHmz73TRuQfvN//LmWCCkMYoy/6VuhWisXCxsGMYx55igoT8p3ILn3bs5OlmREGRD+Y7yS9D6uT0K2+C2fEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K1U0t5kXJR6wOnUkEKC4dZVlqX2MYN8Qpjd5CLw9zI=;
 b=xVkNCSUE3JpEkg/FViCwgJXU2b4gwc9Vw42gUYHyCsSk7ShcAUsfIOvaMIMlKfNuJNgfIIuyu91gPPWKD/h/UhE51JElZc5R3RwaKagUQ/YvUIEcs+sRWTeeNYJOYnaCnDSQjibQVZbpP+q+4VlhPRg6wpRTgoNANdbR4gPOIyNai1G6BfAYuzF6W8kMAaP3gur5xfeioNG1TAcJlHXZLLkMXq3zhkH5RmAkCfTMfeyNUzDr7rqcFKhlAbORrrRZ50N/+bkbk7Z+veoM4fRMqxjvtE2Mn1GxfETcXpTxe1vlzAPp3MQbL46MnxEwObPdShsYMAuobvA7fGf3++EGiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:14:01 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:14:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:39 +0800
Subject: [PATCH v7 12/12] MAINTAINERS: Add an entry for gpio-mxc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-12-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdaa227-8d5d-4a1f-4114-08df3423c8e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|261026140227099003|11063799006|261026121527099003|261021121427099003|261009223027099003|56012099006|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	RvzgbvC7wGFkw9o4+scp9X9Ws/AKtcONDyZlfL6bFiARlBi4SeCIMOk3F+akN65l9sdnjLVNKPWhm8EKrDVZ1Axa+Zew/OUzCB1lWLG8iyOofe9iUgD3cMSMi3maHJ4wTxFVixAKupSsWoODmCPm19STGvK+pgIffojvv1GMaPpTBJynhAhSiB3yjQsakL4/uzuTXGtP5tlaMP6JZwRl/bFxo1rcLs/oH3kVvwqbCGI2Wv5DuJ8r68QWu7SbvTDAuosExhdxeUOtjbX66UTuE6/STQxFlI30Pf3aGABbUPomJY8Z8jlAD/zYYNuZ1RQLUOzxuKgx4YtNP60y4M3sQ1IIS3h5dCV1JzijrLXylvH1EU4G9kdYyMhzWJG0II/CDENsXaiuiLAIU4FT3nYxrsBSyibHcEeUQftyV8nGl/Es9afJK8XocaMXwZmtUfuEiRWpMPCUu+0GkJAme1+89wE0szF2RlBqPPXpVqPQQ81jBRz4PUzYpEVAWBCPvh5GQTIh+09/mOWbydIK9i0wQiXUw2PAeIZCLPr61xxMVJZcZ+FbTv/EEIRaU/Kh0YnYJWQmnJV1GrttfNZvIW5G+vTQPTO5gOcbifvO59d9DlXRnZ/s7K7AeY2fMPAfOUSmZQrvVZ2N6YMD5BCOfCjPGK7lJWS+BRcGiQ15dknCDUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(261026140227099003)(11063799006)(261026121527099003)(261021121427099003)(261009223027099003)(56012099006)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T21zZHJsa0dFSzdqbTJ3MGF6a29jUStGR1FMQTFDWWg2QWFGaHNqeTdIZkNk?=
 =?utf-8?B?OUs5aC9tUHB5TzQrK2VPL0xiK3h0QlJaWFY4WFdZR2dscE1FNTBrQUt1WDRM?=
 =?utf-8?B?SC84RE9zb1pYdTU2RENhWkVSRitobDBJcytIWm80NzM0bHFLZEMzYnkxRzBT?=
 =?utf-8?B?Z1QvWkxSckF6ZWsxNU5OZkdXbW80MnIzc24rNlg3Z1phWlVrcGUxTjRSei9M?=
 =?utf-8?B?TDEwcndKenF6NUE1NG9mRkwyWmlUeHFhelc2RCt3TkJoMHJGRVluUUEvdUQ3?=
 =?utf-8?B?TlcxS2ZZdUFQZjArSy82THg3aXM1SWJGRGdUM1lFaWtSTXJGZmt3SUxvY1Jr?=
 =?utf-8?B?SXRkZG5RM1k3cEhaM2pTK3lRMURFNGZ3QU0vc1JySk9ueTlkVlpLNk5Iam5t?=
 =?utf-8?B?TFFOSDZEYnFFNGpjS0hBV3ZmZGNTU1A1UVhPTHM1YUlUZlVBbGlzMm9POWxU?=
 =?utf-8?B?bUZRWC9OOXdKOFZJcnB5SDZTc3ZteWdsenVQRlgzUE4wb1NxQ0ZMbFI3S1V4?=
 =?utf-8?B?cmVQaDl5NE1TQXpkVE1pOG9LblFwSXVsaEJyejRHOXk0YkJsQklHamFGRjZ1?=
 =?utf-8?B?V1ZXSlZmUE1pRmtDOWZpaWpGTGFZaWFMTDhRdWV5eUZhcTdIRWFDaDlWZmN1?=
 =?utf-8?B?OWhqS0owS28ramZXa3dNazdBV0gxTXprd2ZTZUN1MTRZNkZKTDk1Wm1tVHZO?=
 =?utf-8?B?cTFZMDFpR0hTdFhaeFRIVWpPWTZ6UytuKzg4UEZvc3hYb2Mzc3lQeDBSRi9T?=
 =?utf-8?B?T2RBMDZKKzBlYVFwUjc0aFdJaUxoRFlkVC81dFRLYlZMZkUwUWEzUHNVNkp5?=
 =?utf-8?B?UFZvRnA3NDVEZ25LSyswazk0bC9kUFFManl6NjJBM2J4OXRHNmtxelZxUk5j?=
 =?utf-8?B?UDcva2tSRFhReGpLU05ITXRsbCtPT3NVbzNFSmN4azZUU0VtdUVkb2ZOZlhD?=
 =?utf-8?B?UDhMVUYyczF3ZG9vMHRLRVFWQVRoaGhUMm0zNGR0aVE0WnhxS2tnWDhmM2xp?=
 =?utf-8?B?bjQ2dzFvaGdwOHJSQW96ZVRkTXZTSEZMZkwxb0lmNldOeUhmWFl0Sm9EaEFP?=
 =?utf-8?B?cVdSZkF0TWVyc2JLRTJEUkFXMUpsaVRVcTNaMVh6dWJuYkRVbks1Z1Z0T3Q5?=
 =?utf-8?B?aFlLdkhmTVFSQWhpSXJMTXpCY0x2K3FuQ0dtNEoyVmd4amphWlNaR2RzRnZ3?=
 =?utf-8?B?aEtkdm9DOXRVZGx6dktCMGlQSXJrd3hjbExiYkVSY0M4RTdlYjBUOHpMbmNY?=
 =?utf-8?B?WmJZeWhvSGhTNFNNdlNFZXRYTGdjbVEvWU1ZZ05vRldZbnJvUUtJQjNzTXVF?=
 =?utf-8?B?aVdVb0xaTmMyK0NzUWJ0NDU0bytVKzQ2bkxNVVdVdUhHUmxsUEVGL2JHMWhM?=
 =?utf-8?B?NHZSWkNWa1IxY0NUdUZoK0xGOVl0clJNUmtUeGxKTWlybk1KRmdoM01Fc0ND?=
 =?utf-8?B?dTRJSTEwSlQ3TkdlSnBiLzJ5OHRnNjY0d1dRTXZRaWlOUGVwQnpaZTFHeGJK?=
 =?utf-8?B?ZVQvNTFicUZnSmRrd0FHYWxSVkRMM2VrMlJvRVpVSVV6MVNhNEpoc2JBWENZ?=
 =?utf-8?B?QnJ1MXRzaUpjUXBwM3FkUExMNURwRVdFaHZZV0h3c1hoQWdBYnpDWVo4RVhm?=
 =?utf-8?B?S21IWjl2cmE0Y1VsSzRpOFF2TTdmb2YxaW5JZU5yR0gyUXFsVGFHWW16cUlP?=
 =?utf-8?B?WnRzZkxDekRKNDg4ZkpVelpybFZFcEJSd01OemcyL3JCNFJBdmxXMEl0UnYv?=
 =?utf-8?B?ZStwMk5OVXpQWnlDYkU2cklLVkR1RCs0bFIwbVVpUVJYcnRmVWt2b3VvL0M5?=
 =?utf-8?B?UnJRQTJtUWZpdXd0Q20yYWtKUmw1OVp6dFVRd3Y4ckYvTlpUZ1d5cWg5a3lJ?=
 =?utf-8?B?VGZFcUsrdDM0ckt4UTFyVVpWWWpFK3ZrM04weHpuZUR2dmhhVzJNTHdUanRY?=
 =?utf-8?B?QjBUUVBrOXFFOXhJY0RmbDc4Qk1ZdXpFanl6VGRzRWEvV0VsbUdVL09HUFp4?=
 =?utf-8?B?OEcrN2JINHBONlM5alh0aFh5cTI2N0orSEFYOS9aYWlpeGV6bWVKeUpnTS91?=
 =?utf-8?B?K0U3alRWZmpJclF2NXpoa0xaMTRtRmh4bDJ1YjNwcG9zdDVIc1BudGV0SWsx?=
 =?utf-8?B?NGxPeUhhMi9SRTZZSGQycG1hOTJvUlIvd0NwYWpQSEt5VGMrZXBWVyt4WFdu?=
 =?utf-8?B?aHNqT2x0YmpHU1psQjFqeGt3b3YyVnc3a2ZiM2c4U2lFVmZ2Wk5sbGw5b2ZF?=
 =?utf-8?B?c1g4TlJJUVI0d3VxOG1SaW5nQU9qTkFvY1lpYnFFdHhCazZIQ3RWZ0dDM3Bl?=
 =?utf-8?B?S21ZcnBrN0ZxRURqWkEvb1pGR2FPcVlTYnZoeHU0ajEyOGZGZ05UNytCTG1z?=
 =?utf-8?Q?V2m9DQGje0jD9tI78TZrdjqeGQdaSE48DtTCP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdaa227-8d5d-4a1f-4114-08df3423c8e9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:14:01.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UdHgW3EhuktL/eNY4JeL0mUjLDol7hqru/aVuogw/jbMcg23RNxjnq4T+6vJALpQiG7JrxaS4HLzZnx6sht5oMMW3KQ89Abdt1vYtNZ+LGTii8BhwY+qs2BSg2ZY1yT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Peng Fan <peng.fan@nxp.com>

Add myself as gpio-mxc maintainer

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcff12847485..a7aa9a587496 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10738,6 +10738,14 @@ F:	drivers/perf/fsl_imx8_ddr_perf.c
 F:	drivers/perf/fsl_imx9_ddr_perf.c
 F:	tools/perf/pmu-events/arch/arm64/freescale/
 
+FREESCALE IMX GPIO DRIVER
+M:	Peng Fan <peng.fan@nxp.com>
+L:	linux-gpio@vger.kernel.org
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+F:	drivers/gpio/gpio-mxc.c
+
 FREESCALE IMX I2C DRIVER
 M:	Oleksij Rempel <o.rempel@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>

-- 
2.51.0

