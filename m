Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103172;
	b=qhUhBt5iD2WB6mxb2IJA8A335s/0xFQYYxfqgCzEiDT+8Z3vHhh//BqLC+HdEg5xe2AV
	 ZFz+Jgd8jANxfAXd6KR9mKKl/UcS3iar7bQRF7dn+5iKxIeERC0bfc9TI31RdzzXkWpJG
	 rwYBymfnd18w5L76X3p8XSWyljrgwDWP+Z9zeMQV6SN1ULHa/nuT3aicqzUUL+w6iQNld
	 4tNyNnYHZ4BqyjhYt5bjhPDAOC+RuxQO6RPMLWgSqGtMpmlxEcS1U63Gjd9/arjOT02M/
	 PUM8JxrvtBcRCjCPvBfNDBhlonvP/6UNGoKfFdmix8AC+xqk46uQKpxUZsYhyg3z29Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103172;
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
	bh=2khqmycXQwz65se1FliWMKaPP0zVTIg2DE+VIRW6FKU=;
	b=UaeUdY2bEk0V4Ojs+Lahs3Su7WDyKrVGnZ9Bje+jRBIl3ThCFK1vZ/p47NcM+s8qnkmp
	 ypPZmDQ3NGzdo24tqA0y4le/l0VmJ6xtPFS5/6HWqri/DEuwYS9l2/ySHpjF2ewO7bohc
	 OUnktF9slHv/tmb5Jfeu8GVrP7E247vzEQCkJR2yt6eO6ycWMLn/Ea0z0QRa8i5WxBRJr
	 WgHc9hkI+7FUO2AEl7SMw4meeXHoisLt4EJr3x84sEQqJYFPI3N68V4+wtOJxWC8lxfda
	 eO9M5FGujAXtMSt77U73PVm3gAt9VMPy3EWlRSvTHZJcgfqZBG6oiC7CxcWHWGRlGKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=exGPhOM9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33791606A31B;
	Tue, 27 Oct 2026 12:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33791606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=exGPhOM9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9FfJvzJhk72rT4Dh54g+zGjubgadZ7jYTlRCz72v4mkJVjvx58Wfolvra1f2s4OQJB3eLtK9EGaBqm7R72DvS4+lrK/H5EJSHl6DexJjOwj90A0SuCqdt/5PuUKBPohxUkeLcjnRr+TcHZitynLVwKwT15IWvqJW2Y6GwmLl3DyNl6MgTkspBOhlcrxCym7TZl7hTQ1JAIWy6vQW7Xg0ZSuRgfD1FOB5lf+RMYGFLFMRVASC1MTOe5L1GT38/DCKlWHQl00ow9luioR4PJlsPsHjGONMyZWO8lY5qS0nepVVxXLonRZI60x0lDywDChhJEAxf76OWVrgkjzDSJhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2khqmycXQwz65se1FliWMKaPP0zVTIg2DE+VIRW6FKU=;
 b=iRBvYLR4S3di1vk5Yj/DeZ7LJpeeEJwo41kfoE8juw2/X38KSpeBbjEFrpJqRZheVj4qQPuttfEYD8XFa/Lwna1lNHcrKdZpsGteTDQykWwlZAhUx3UCQ/dCxqyRPMGyQ2W2Eq7t0Bjubtx1UrD3Djc9KSFLEKATHztiB3Wjd45DIZWPDMoeL4BXFvwbwfgzfoozkcVO+E4tOiYJ0dxBBXIg7nAPa5pLgiAPFRwvuMaowEPP9JHAPoyHKSbHmoVUSECMHqPmBsBcnZTbe3kwBCTe8/fMShTI1KQLZW46qWnuVbX6bWdMhFaobqU4uVnoJ15f1ycvlgmOEzLP4JdQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2khqmycXQwz65se1FliWMKaPP0zVTIg2DE+VIRW6FKU=;
 b=exGPhOM9YW7ozzW+YlBitcFYwOvEn+Ppb+5JIeG7Y1Q1irMEDBPvbJNld8DHPl3V07865pZh5oB8ZzoWp0BnPxe69pJFiQkrJl4qElqJ8o4ioD92pjy9W2yr7cLHpT5KnasJLi2T4lB6JZ0rQGhYGcgahdyxKHe+bDtclrCnpSiqbso//09CVQ1MGdt6yI8lC5MIkokb3079FyNI0omS93B3k0xn1umfvHW0YI+TjNKpB8MIzMM/glXF3CxD/8fHSK6ZlPvx5JMGXFBWMl7ufFL1xptlmTqJNoJaXvfFv0ZehVmwjuBTqyGlbIxviAjr6SUqBjjbXSQRA8bvQ9Wgqw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:12:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:12:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:28 +0800
Subject: [PATCH v7 01/12] gpio: mxc: use irq_set_irq_wake() to simplify
 code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-1-7b602d70c149@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBBPR04MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 245aa19d-bd0d-422a-9e0d-08df34239d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|11063799006|56012099006|261021123027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J9pFuEiXRGMb8ASvPTAH8/cxih1OZ9m5/xv8cJwjMRVnvjwA0I7R85Cf++82A2HbTkrm14/9skXPYdtqec4je9zROY7Uam0ct46pkwqAfUmRGCCYVS9tqjEmKYU2/SM6CcVGfTuYWEXyr+lRe+35MN4rGL6ahsj7WOd3lO0z+4vdbm5Kbxyu/Vkcmthjb2du+JpgBEc0GPMOxoa+G9+RGUZrgpnMRiptv5guvfDOPx2Y/TRaa9ksrEdiL2SlHFjTJ1wTZOSVkyQSjOJucKiSOa0dtwE4j4AZzRWgHjWeqV14Dm7ca26ZT/YBDUpjVO9Q9KAjqgA2D79EJq1xQY7QY0La0w5L/1HSUvPkl9cwNsyILPojmG2U1uZyRrzWUKl2XNQqi/HPQ59hl7a/C2D6vyKJZY9NATKuBiWpjYpDHOEet+JNTqZmnmFaZyxiiBllnFpAFV2/6s1BzCNmIv6EY8OlGWDjttGj2VHekYbHGprAvXQNtLzfSawWvprototUaGBTr5+ccA1Zw5ZybXORUhPJQ4S7GVRP/mAHxaQ9CBCzh7Oo8aeoVfa4otdEayKdoi4vBhi79RwtHHPtC7O+M7rNxzmKFz/zU4Mp6Urcc9zQRPn8i6IB4m6fOwJYJndhiC5X0kcQ+/EgWxuSpuGbSL2NIdI+MKZIULMdRljt9Xk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFBtSUdNaURpSXdTN1hzQnVaeUlNTmRxRE9sQSttNmk5Mm5tZ2lWaHNIU1pC?=
 =?utf-8?B?OXhmcU1nOUl4Y2VjM05veFpDN0paVmVCakg3WjNGeUI2aVQ3TEg3VTk3bVB6?=
 =?utf-8?B?VGdVOUd3NmpSZmdMakU0NloycjZIU3BFeXZOOEd6QXBTUE8zdFB1b2kwZS9j?=
 =?utf-8?B?Q1B1NjhKS3JPZmRCYmdJRnB0cTM2c2NaS1I3R3UvdloyZXBmRndjVkUyUUFz?=
 =?utf-8?B?WFE5V3FwVEF5RHJQSFpHQWJ3RzVuV2tIZ2ZKM2pHNVBrekF4ZWFQN3NZOU9t?=
 =?utf-8?B?ZUtXdXY5ZVpGT0VQeHdGL2d1U3c4aWJQaVlwRy9EejBIS01VWkh5U2FTY0Fp?=
 =?utf-8?B?aTgzaDBDd0p2QlNad20wai81ejJna0QzTmtXSmFFckpuc01qWDZjTnZKY2p0?=
 =?utf-8?B?bzRIRWZkaG5NaURpeW5TQTdnZ1I0ZGp5bnhsTTRld1FBZFBxUldzYXNYbDA2?=
 =?utf-8?B?VlNVTElCQmx4eXNWV0lPQnhLVEpNekVxUkcwY093TjFxdkFSV3JuRUJFbEZM?=
 =?utf-8?B?ZXNZZUdQVXY2MzBscnVzMzdOUExreUllRWFkYnVoaFJNWnAxdnByL1BWbG13?=
 =?utf-8?B?QzdTR0Z4RUpNVXZJcE1BL2VsQWQ4Y1hscGRHcGpWay80WHZMQlNJa0ZMUm1r?=
 =?utf-8?B?a01NT1lrYWV0eWcrK1Z1OUl5Z0w5VGRzMlBzc2ZReVM3RDlmYW1kanV6RzBQ?=
 =?utf-8?B?TVpYWE1NZktBUzhBNm5TWGhxT0F1YmRnQkNNdTBLaFV1QTZHZFZGcVducHg0?=
 =?utf-8?B?bGxHQXZQeFllWTViZThIbWp3RTRMdmVhWUFKZk9UTDJRY1JFeXQ0L1ZQdG1z?=
 =?utf-8?B?UkR5K1MweHJJRkxVL0o4TmN1bHF5QUhPY0F4SEU1SER2TE55UWdlWXdvVDdR?=
 =?utf-8?B?dFJhWmF0UUU3d0NxU2JvRUZIVDRaNDdUYWVVUWc5VjR2Q1VrSnhhTUg2eHF6?=
 =?utf-8?B?TDhXYndnaVdVUTN6TU1pdTc1MEI4SUM1Mng5aktFNnY0UzlJbnVUcTRRa1ZB?=
 =?utf-8?B?U0YvUFdoRzZxZ0xEcnp2a3I0OGY3MXo1L0tBclJWU0VMcjd4ZUFvK3dsUkFG?=
 =?utf-8?B?R2ZuRzQ2L05EQUZNNWEyUTZkL0VqMjlOb3FDTEZKUFZ3MmhhdW1QQS95aW51?=
 =?utf-8?B?WVFrcmNUdTRMRjZQNmQyekZKSlNWUlNCRVk2VW1QRUtyZzZOOGJMSHl1OUpU?=
 =?utf-8?B?RGQ3clQxRVpsTmdGVHI1SlhpdCtEdGxZd1JYWnhqT1ppMDBnTGd3NTR0Wnpi?=
 =?utf-8?B?WlByYkp1UkIySXR1a2ljbjZ2T0VqSHIwZzJ2UWs4NzMzaG1uV09ndmtjVTNZ?=
 =?utf-8?B?dW9LUmJucFloRkp0NUhCOFU3eFA2elNPZEUxVHFNZzBxLzdDOEg3aU0vUlRX?=
 =?utf-8?B?ZWpSTG05bXUyMEIyN0RBUVNzSnZrTEJpSWRXb1NLU1dnZjRldlFOeGtQVnUz?=
 =?utf-8?B?R29ZWFJqMGtqOTJWWjNocHhZTlJxMXQvOGJLZW1LK1E0YTR4UjlnaGxNTkpl?=
 =?utf-8?B?WW5vUDlrYjgrd21tL04rR2dqYlkwaDQzTGkxa1RhTno5Ti9mTUNuWFduVktG?=
 =?utf-8?B?K05Rb203MTBWWit6UWtad0NycEVWNmRmbm85czBGaDBoTks2bGdoM3BkaDFB?=
 =?utf-8?B?NjlaK0hjbG8zVU11OGhaUjg0Q2U5YjUrcjJHemluRE1VRC82Nk1KdmdQeHlx?=
 =?utf-8?B?Vmlmb05OMzE1WW9WbXY3VFZCWWJjc2J2NlNEbVFGSnU2ZXhmVUFuK3dmMXVK?=
 =?utf-8?B?bEtiblVvUFRyWnpJd0ZBcU0zQTVHM0NwWTZuNDRBY0pvTHhrL3M0dmlRb1Qz?=
 =?utf-8?B?WEN1NDhMTjBWYTVxTTF5VXBxSVlraEJnb1lmR3JrMEdlSi9kNkhKV2Z2dXlx?=
 =?utf-8?B?U0ZVZ0cvWm9nRmY5TDVBZjVEUklKSHdvUVk5Vy9PY29obUZnZU9ZTEFVZkoz?=
 =?utf-8?B?cUo1eDBtRDlYbGljc2xTVkVja0pyUXpZWm82OWNONk5xOXBZL3ptaVVjQlVz?=
 =?utf-8?B?OVlVNzBDT3E2YzZxRnFHYUY2UG1JdkRITHppSGYveFpOdFJnRGlrRDZVTmF2?=
 =?utf-8?B?Y0JaVUx2RDBnUnRZNXVSSmg3QkJwR2U0ZHlhRFkzVDE5YTJWeHJNTGJtdmwr?=
 =?utf-8?B?U0oydExKR2h6NUxHQi9WK0xnSlBhdTR4ejFPVjYzQWwzVHZmUmtpRVgra1BD?=
 =?utf-8?B?Zi9qblFwUWJqYmg4Mmwxanc3empvcjJ3eE5hUHZ3Mk5ZaXV6MWJZYkNvWFQx?=
 =?utf-8?B?RXRwVHJtTTQveTRnTXRkRFAySXZTYzdMSWhkM2FZSjZyTk5Kd2haazA2Q3FW?=
 =?utf-8?B?RUZDckRxWEt3Z05HclQ0Ymo0bk5sa3QvTFA2R3hRc1doZFJOdEduUmprVDMy?=
 =?utf-8?Q?zgPsUXt4Guz0fRjVSstFeN/cyIpKWuLJwSgVK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245aa19d-bd0d-422a-9e0d-08df34239d8d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:12:48.8903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrBNMGwZza4JWaLZBr2LRF44qjXafs6BhFrPp7lRMbbnmE7B76kiyPnJUDlO/2BiRm1Hn5tiSaB+69dhnMoZ2R0t9h8DGSUljgfFZ9X3+zbRRa+8i1THVFvLn1BHDAr/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899

From: Peng Fan <peng.fan@nxp.com>

Simplify the logic by consolidating into a single irq_set_irq_wake()
call based on the enable parameter.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 32ded7b548fb..95dfe199409a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -326,17 +326,10 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	u32 gpio_idx = d->hwirq;
 	int ret;
 
-	if (enable) {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = enable_irq_wake(port->irq_high);
-		else
-			ret = enable_irq_wake(port->irq);
-	} else {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = disable_irq_wake(port->irq_high);
-		else
-			ret = disable_irq_wake(port->irq);
-	}
+	if (port->irq_high && (gpio_idx >= 16))
+		ret = irq_set_irq_wake(port->irq_high, enable);
+	else
+		ret = irq_set_irq_wake(port->irq, enable);
 	if (ret)
 		return ret;
 

-- 
2.51.0

