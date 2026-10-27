Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103179;
	b=EIayucIi8nE5rB4HoH35yjCvyi/aQw/+nN/9v85PxIr0c+c4yGeIyHauTpu978wu7Nld
	 qkuYOO8Vn7csuxAU9xj1JwlwQViT/14qf1vNBhDDb9t6kNuxF577OpAUW76ei35boRbxO
	 NjEb3Eb1k2PpEXcO2205q9ZyouKK7ztWgcES91i3eAy5LFjtzJtAOvKRIzPCyxNZ/dGd5
	 FSupwFYHt2+X2ueSKDWlIYqtYg1rDQpbktk7tlOm3xZiuj3EcuKINsWIvbBIfoHmZui+N
	 XLzQIpr5VEBiWniSUIa0R3yhLMZAdNRTyjGRaTK6MML4bc/GsnfDmVlTL8NQle2HZlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103179;
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
	bh=KogjAJS8GHNBxLennVxySIsbTFNOEuApAdCQ03h/ajI=;
	b=4khUAvlW4MlqquUcco70O/wLIcpboz7yT3qSjEAIWewOHDux3L24R6JvnsJ5bzJML+ry
	 8ZS2E1/INBGZ4W55pgW1ESRW8TnygeK/vE0f4GnDWbcF2w7k0bvNwVRbhE2xdIgEnPyhr
	 YjjI9q+hbTQaaVuaOKv/3e5Rzomvg01Wn+Zt7oU0O61JvyOPN8iTQgfFqjgSXfKGmLorr
	 eEpHhh89UBSFIYHNXQxCe4HrGaoNh5kxgTEZrQAEAF1h2dbJ2EIREPrhnN99QhwFdfWxa
	 ACnzhzusL5fmPVkM7bEQSl8FwJAW98asnzZwsWQXPQFEv7nKz9i9SKVM6jai2FEndQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IweCEaLD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.13
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E77D606A31E;
	Tue, 27 Oct 2026 12:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E77D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IweCEaLD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es+XTScn3ZbmINqKT/K+cbtJ5UWB2f6KU+micIF+xaqcGWPhXfzKS4IkrJ8fAFz25Lv8DuqrOodFWGOhM0FSiVVQsC9qUCnvqyeuCeZHUps4nC7NTmEjzNIRJK4GtN1FEWpkb349ftE6Ld94q0wBX7B6Unpecl/QLO2cMLOl2UptmFbmlj5/PZxhk4zzIQMhBUu/LeA4V/UfPYQPvoDF/bXwILqk6YxAPL2i9anT8GSvp6XpMTdQMDuNTnwq2nrKTKaZVjD06vZQbfXhrqKMfZ5BU32B3WFNMwwQVYeAqH0ayPh8CpfqXGyuug0joH3NIR4dtIl3Bdm1dThTwNLQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KogjAJS8GHNBxLennVxySIsbTFNOEuApAdCQ03h/ajI=;
 b=tUT1CCTchmOyWGHuovj4XcAzVDjiid46r1E3XrvOowj836zQTbP2OcV9sb9cq+XFEPmKy9xzUaB6olF41nAAOx+9rT59p7iAJXzVwmee8+9T59zVnd8F5fAkvBuiw/PwwS9DSpMqMLao9P5fdDoOCJa0mRWuk/RqKr2GsgNCtZ5gEBhDtKb6s2hStlvZsSXX185VwxLG48pQXef5qpjJQzcIVTmQ99RGIzL6hKGP3iXYj2p7pQkwBrwwoSX7RgZ2xWxSkvCGfgXycuozYPN6susVg9spKbwKVq7bs/x3t54BezR6FT3xPfvVvrfQomMZnX/GZW+yCCey13229I1Mew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KogjAJS8GHNBxLennVxySIsbTFNOEuApAdCQ03h/ajI=;
 b=IweCEaLDeYvNCa5W3DsYwJH+Rj+PQ4eqf0B0R9tx7GFgxaPg7N00ocaQUmtG4ObxAfvwDR3D+j67a/fcHHx/dmuY+gq10mNq+rMDHYyupWNQgKvoNe0I6yEo3d2TyzVoz5zniP/zYjsSCjQhmew+rQxfmowWWLHoIlKHSsijG6j58FMs2xAPr7wBJHsQZFk60PSgLgVOeHvi4DyIRmxIixpQ6cmC2t1nYDy6DEb/ETZgQ8nY6CHPDUdhKj5ICxn4Dr3xOe2pUHgy98fIXAUswMrVhZUqZDsX07GS4LjpWmVWj5kho/f8aPpB8fBwV1T7TUV5RXe32owGMe+QB/JJgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM7PR04MB6885.eurprd04.prod.outlook.com (2603:10a6:20b:10d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:12:55 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:12:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:29 +0800
Subject: [PATCH v7 02/12] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM7PR04MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 69faa767-8e17-447c-b39b-08df3423a165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|19092799006|1800799024|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IS4ZeQqUoLmQOvzC37TVWFQM/HP+4CtzbajKcQWjOYSVB0oiQU0sUHL/FJKc12rZWWCMl8f3XIaXkKZUwefCn2CVc7p4GY1IML4bxRwSkNKOFYPF2f7E+OznCYBMy/znFo0u/PvQnHk4SG0kitD2+epA4d95VJQpgUzrXgzqFWdT6sEPEtdRJA9BoSyNohv5iURrs0S1xZJ83sco/qCyic0dBg2oyJRh+4oWAPw24v9nC01E94srO/ZNJS8wjY4BghFHQ2Q+Oo8o5EmiLUaICsRVcYumkuuhOxyJSDIzILeiuu6EtUYQwCkVDp7xwVvqfL4z4GXvw3xMNhYiEZw/EdG5FGJnbIfjUdRnljXmyCmYDdIwwSOhqpEcqC9BXXLEajnOH1x48EbLH5COVVkCn/0xrW1/9Jb0JZjT+6TCpOJ74Swx0ZPQ/7db6WB7XOhfhMUBMSmvUszxaxbz9KFyH71x1/psAIi9KmZgyWUtoTwPB0+pfTkEDp6H6LHimqalTR6fp6r4KKplmpOI5YJXP9Bj5mnhlZy0EP8IaXFDfZ0sas5Qed//pAEreBptEopehZnFeI/t0Y+6Ve/rBBchGz5FSDoYeeHoJKX8HjMW0Sxb5DQH1xzpNekct6OWW75+pMAtvbVRKndDxd8kIzu98JbZjBcXhnk8tTwdTN9tAXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(19092799006)(1800799024)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzM3c1ByeUhUSHUwYWN4QmlKWjVjMHp4RURMWFNXWFJ3ZmViN0lyNk85YWxV?=
 =?utf-8?B?bW9kUnMrZEpBRmJxR0ZCOVhiaTV4UTV4Z0x3NnQ5V0FDbVRMNldQNkg5WW95?=
 =?utf-8?B?TjlWc3U4N284c2psa25LTWxzYS94UzFMdjVQTXphZ1RKbVJkemU5bHgvY1oz?=
 =?utf-8?B?bzMzUk1qcVQxUDNCNGUxTDIwSDZqM3ZUWThONjVIZ3BpSlprZFkrWTdSaWpt?=
 =?utf-8?B?UkhCNm5INjJvQmNjR1FrZlVGeDk1VE1ib3BFcVBPV01FU3pMRnhqRGNFVWJr?=
 =?utf-8?B?MXlBS1BMZUJibDFZMHh1aldrZ0NIS0l4dGJrQytqaGtCVkt1dElPdnliOHEz?=
 =?utf-8?B?VVllNm5jc2NXZWlOMXFlQW91ZVJkeE5QdkVQTSsvWTJNWGhSOXkrLzQ3Ymxk?=
 =?utf-8?B?RHVGdkdVTitWOVJRKy80TVBFTDAyMG9BdElyMUxTZXc0bi9xR1FKb2QySm1i?=
 =?utf-8?B?SHFwbTJocXlQeVNtM3ZnS2VVZzFsQXVJbTFJSExlT0hlR3dHSDRvbFZoeFFr?=
 =?utf-8?B?dU14eS81dnEyU29tZXl2blBydnNtSWhxUTc0eHlFTEQ4SXJxcWk2YXlxVmx6?=
 =?utf-8?B?UFc2bjVJSzdpUTdyYno0dS9sK1JSc0l1cTUrNFhPdUdLb1cxMlFiUFhUZ0NY?=
 =?utf-8?B?MFZoRkNac3AwdG45Z0JLLy94R0JsVWNEVUFpU1F2d0R4anhkNmt5L1lRbHNS?=
 =?utf-8?B?L1o5SHM0V0twNUhXK0V3UmdhTkpWYXJzL0tYek5qRG94SDdnU3RxaEQwVVg5?=
 =?utf-8?B?SmQrVFBweVRVOGQza0pCZU9HUFE1cUNQS0s1MnhhVEE2VXVWd3ZGNWs4Z25n?=
 =?utf-8?B?cFFMWDJZQ1NyRWJEZ1N6WWFnQXA1Rnp2K0tLM3duQkEvT2xJTjNpZWxZV1NL?=
 =?utf-8?B?VmlaaThYckJhZjhzZjE1VDNkQ1NQbVhEMFhSVjNJWkFJalNGMnJ3K3N3aGM2?=
 =?utf-8?B?dDlVandoLzVnYVRacEJtdHR3ZlUvZ1JJRnorbkRpUWxtc0dmY3hLYU5Dd1N1?=
 =?utf-8?B?R3BKMWtaWDJMWTV1OWNCbWp2UnA1MDg4ZTFleUpkNGFCSERYRyt3eGpmdVFV?=
 =?utf-8?B?Y25kbHE0bGVSR3hXQlZEVEFldHFjK3ZtZGEvaTFFS29UZGZGYzdUSjNnRnN5?=
 =?utf-8?B?Q0x2b2ZTejJaV0R2NG5EOVUxSUErRlpWclVxTTlYME1McGlHbEN6Qml5dnVj?=
 =?utf-8?B?MXNIUURSRDFFSEdBZkZCOVIwdEdibjAyd0J5YjA5NCthSTRQalViNFdYSk44?=
 =?utf-8?B?UFlCRzVVZnVHVklWV1UxS0o1MVo0TVRZdGw5WWpERDA0WVFMNHd4M1BzVmIv?=
 =?utf-8?B?bW1BTkd4a0ZaZnN0cCtpbUFuaTcyNithcHk2WkN6SjMvditXSWdiQ1dwZzBy?=
 =?utf-8?B?YVExSDRaVVVKS09FTlJEbnlkcmUraUV1SGZsdXpQdXpsY0loZlV2R3hkTG5H?=
 =?utf-8?B?QUFRY25nVG0xZTk2Ry80WVp2NjhUNmpPaWc5TTJ1NFEySFgrQzB3enZKYmJG?=
 =?utf-8?B?U3VjK2hFUXJ3ZndDWWtPOFhKalQ0UzBFZkh1RWxDQ3pSdjlUSGdXVlhYa2hj?=
 =?utf-8?B?bDJtZ2NWWkk5MXZEZDlENkZhYzBaakdyWWE2TXViTGpKSTdua2t3NVFocExZ?=
 =?utf-8?B?V2grSDFybCtpZzVORG5iS0JwZkhHWU1veDZoU2dzdEdYOVpVQ1BHUmJsejZC?=
 =?utf-8?B?aXBBNnRUQ3htd29uOXRZanAwKzNHVzE0RVdNR0pBdEdKRXlNMVhCY0U4N2lm?=
 =?utf-8?B?d3R2a1NoTlVNcTdSckQyd0NBdDV0NThkYytoR01VaVZYOFB2L1NyWmFmS1NO?=
 =?utf-8?B?NVRHaTFGSVdwNWxpbHpRN2ZtdW4zVGJPemp0aVg3cnBBbTdmd25tcEREUVo4?=
 =?utf-8?B?ejhQeGp1TFhQWm42RUlxMzlFQko0TXgzSW1qaFg3VjFMY3VURm5USjdJTlNE?=
 =?utf-8?B?TUhvRWp1MmM0WlRDNGhRSHY0aWdRMzZ1UDJ2bjVqcjBicmo4OFFFVGJzQWd2?=
 =?utf-8?B?ZEs3NExvTU1leEdhYS9IK0tPdXBkang1cngxN2RHRTRmSllEbi9IZ0twTk9N?=
 =?utf-8?B?ZzFmdGVMdk9GL1BPTGJLUWNrc1U4eGYvUmV4ZDVUbW5QTHNQcnVpdG4wTkJy?=
 =?utf-8?B?NU9FSTFkT3psclVCdTlXVmpZQTZCK1NEQkU5Y29pd0E5RU5nQm0xcDZEZnJO?=
 =?utf-8?B?TW53VWw4cDcyRk9QTzh3bHZ5VG53N3FIOVpzMnhyQ1hFTW80WFBZZG5ZNHlr?=
 =?utf-8?B?YUNlRkVrWnNNVzMwRzBSbFYzd1pYNHNIbkZQTlRrY0FmWkR1Q1Fvc2YrMkhq?=
 =?utf-8?B?dFF0anNJUUlmaFlJLzNyMXNxTlNHMnFha29oTEJsdFN2ZW9vdmV1NWxUT2Rk?=
 =?utf-8?Q?fiWMHCLjgymNj0HTemYF1JsL/GYP9YWpAzkGQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69faa767-8e17-447c-b39b-08df3423a165
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:12:54.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R29tW01x8Mq0vkxdvb71Gry6NG3c6gdkCWTeGKVrdTYMyadXt/LoHsDEh/FnpKaWM2BoC4B2H92lnOjSG0APaBaF7/jGZZA25/77v0XyqxvQwRESfj5yDX1QIxZlIGNq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6885

From: Peng Fan <peng.fan@nxp.com>

Use for_each_set_bit() to iterate over the enabled wakeup pads instead
of checking every bit individually.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 95dfe199409a..848d7725ccfe 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -599,22 +599,20 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 		IMX_SCU_WAKEUP_LOW_LVL,		/* IRQ_TYPE_LEVEL_LOW */
 	};
 
-	for (i = 0; i < 32; i++) {
-		if ((port->wakeup_pads & (1 << i))) {
-			type = port->pad_type[i];
-			if (enable)
-				config = pad_type_map[type];
-			else
-				config = IMX_SCU_WAKEUP_OFF;
-
-			if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
-				dev_warn_once(port->dev,
-					      "No falling-edge support for wakeup on i.MX8QM\n");
-				config = IMX_SCU_WAKEUP_OFF;
-			}
+	for_each_set_bit(i, &port->wakeup_pads, 32) {
+		type = port->pad_type[i];
+		if (enable)
+			config = pad_type_map[type];
+		else
+			config = IMX_SCU_WAKEUP_OFF;
 
-			ret |= mxc_gpio_generic_config(port, i, config);
+		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+			dev_warn_once(port->dev,
+				      "No falling-edge support for wakeup on i.MX8QM\n");
+			config = IMX_SCU_WAKEUP_OFF;
 		}
+
+		ret |= mxc_gpio_generic_config(port, i, config);
 	}
 
 	return ret;

-- 
2.51.0

