Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2023AAF5C;
	Mon, 12 Oct 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798472; cv=fail; b=IfP7LUJ27odzGqxMVjiBksX3fGfjkFzDsgoR2/ot+0gU5vcUmXKzS/Vj57+nYUfuzKCJ5MQFMF7j0f2INHr4E5ugdXdPkDPXvIIOx9nktCzFupoKRv3KAfh557g7lmSZ7fw1TBUTvzxfZwEG2F74tUQQ7gHfdhe6WlfQ2pkvXMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798472; c=relaxed/simple;
	bh=Hlf1+ITqOg8d8mFy+UCqoYYCHPmMQuVI7D9v0bhgbew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XoWxzDMIu+dnEXilK+EJna4bIgrLaxkPCGzrZe8cy62+VLdzfmmUqFprIm8u0XYy3NV9CQMk6IJ0R7zx/GD8HYyqN3qJOIPPGUIY85FmihwUoWQA88ujE3bxRvxcPRg0LyWfrQfdzJQcu97D+62GnDPKVoxhzebNNCw3tBh4Tkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JarNsXhH; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JarNsXhH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCEg/Y6z8sFKG4rwBtLycMkKqy8oBHXcWAdmmOpso3Qc/Ev65JI+/YD/IFzKv9DgTNfBCXrE/Wi6RD3kij5HNr9ZsQi1sp6unwhk4HyPQFVz7yvTYh2B4aBIaDosuG25J5EUyozq1wS0t/HNaGUpjIzJEANM7EelSpVaKWmXZkRYbkH/GmxrSLDfRPfmRMQ/wrCFdQvbACb9FyAgtw5oLIPjvJtw3csh5W+/f36JfdWdplMsukbzFVbdccnyMUCRhxVS1nVQy6BQ+qkBGeDMsn2/j2l0sDga4s9WFcrYtj1afI8c1oRCPQr1KhVM4LQj8L6wKqrceuXCmBj69Wr4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30JEjIXm3ccCzbdCwEqZiqKRlV66FDrUf2kagRP7RPY=;
 b=u68Lu2c+haz+D1aXhsFClNmUkkcM2hc5ojFRTE5N95pCjX15RoZKcs4gUJ4xvUKVUcWpsNggydUJdrpDjUEPKdef5q7JapqUE66lWkdwtWz2aB7SHEWzJ//NPI74zhxnTdMlkPoGvQo9sWg700vE8mAY7WGvi1qyKE0GbDyqWDyhBq95uKvMuexfZuKRR02PO1nv1Wzu+iDwmkamvZBNZ5H3sWF+4A6x6gHqJUBIMLi3Zxl4/piIxKzW18U65bFCgRWRiBnh2ecs/MsI3PexhCg50YV4X8kRaG8iCEcqIrZ2ShHdj0OWMW/8R0Kb7bW5x7e0q7+3SA3/nEtPgPv7uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30JEjIXm3ccCzbdCwEqZiqKRlV66FDrUf2kagRP7RPY=;
 b=JarNsXhHKI9E/ePQCV7UJheK4GaMREyiIw7zC7c1xLbjBdw7evdASmrh5cO6PBcQOcYSxB4IBFg6R8y2CyrDtekO4p00cRauKK7gVDxSKU7aH/tSHsmP50CrEUEN1BaBoBhoeE0PpdXb7lN4lS+jYYYDbKt24Tq7W3bzsAQXFAmElaRqD6ovR6I0r0GlpHZIgh88MaLnN89fkMQ2wz3PVOweMEiB4DPt7ZPQoJCPz5aIfw5g7Ee61qbhNOLmf8+zkE9ORb17Ye4iQxbSdXL898kGM2LSfWEfzxi86FuMMMEjFfJxhinot/xm4CY6pwAka2bh+CNk0mVCTSudu6xFsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM7PR04MB7064.eurprd04.prod.outlook.com (2603:10a6:20b:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:47:48 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:47:47 +0000
Date: Mon, 12 Oct 2026 17:52:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 02/13] gpio: mxc: fix both_edges bit operations
Message-ID: <asyt1mZfAPhbp9Y1@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
 <CAHp75VcWZSoMRvdBECyD5AM29+JWX=s0PORFM-QSMCNPD8wkCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcWZSoMRvdBECyD5AM29+JWX=s0PORFM-QSMCNPD8wkCw@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM7PR04MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cd7749-4839-4119-7107-08df2845df84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|23010399003|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CZwlQAtjKXqU+rSeletPI0rsH62IgWx7Ju2AjIyByTK+ZHTlPRhY4qVnxny5k/nEBtaaIHFU9+qAvMn7MvJ/z3U0ZGYmNWOFLnmKDX2FY1uWd7na0PzKuTAxPCZ7uHNEwYT3zc7I9Xev+HgBf6Wu6pDaiBQGdkcgSuJNwULljM4lNbUJ3hgnoBsRTCSwwsqVqbsxMun+cCofHgIUnwNrRpXjtw/9bt9Sh+Qa5yMakq+BzvxgRyCttKPihyEmlGX+c4M2vk8MaJQyuXwVNEwxsS70UolPmg27j3xtVZ7wFCFGBzy0QQ8PIT/yujlgt6vO/VVkfeIISg1QnUlBa54tDCLE7Yv0LOO9drxdZfVSDXzGGo6GxibFVKfABs7r3n2//lan1HjdawHhf0I4fCXoSV+0BoS9Wb+ArxRP5/RNmdm1g+nMBt3Zvw7jkBeC7NxPhY/Q80LwyWqn1R7q7A3ZYrgKY97FJ/5iWt1veYv0TWkuHo0P8PtBltEgdTGcQgajx9AARv1xKFxj6X+G1I5ns7pgmXsgP4yAagQbcM9gU7UYUAUjlt6JxVU9TA0MqXkcGNItOBPtUpKU4EFR+vAeiYaRXBdHF/9FYP45B1FDq1WbYMw3HOn1+7kP6T5R2DOb0QuT8+Kh3O8E7K11aVhS+qG/4iX9cgNGL8yBvO/uKao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTRIVXkwendaOFZxaWZMRWh0Z0htbTVQazNaeG5ZbE1YSk0xbzltaHNUcEdJ?=
 =?utf-8?B?TkFLYi9aV25hRjB1NW5TOGdwKzBCa0JCcXNSY1JRckJaYlU4WDlESFJueGk2?=
 =?utf-8?B?bmVlalAzczc5QWtDR3pBaFdBajZoM1BCSVdLTkJaWk0ybzA1VVFJS25lY1VI?=
 =?utf-8?B?WGxwK0RXT2l3SlNBOTFEdDlSSjZaQXdaOWIxUDBMOHB6VVc1d0dpMkQvNHJ0?=
 =?utf-8?B?UXJXL2JyZWI0NlpDNlhXazFMamZnNGtINHdKZURITzNRNGJjYUtlWWxlUVJB?=
 =?utf-8?B?YnBra1A2aWFrV0RQVkREdjB2cksrM2VVRGJpQ3VqUm1EVlpFRi81SDJ0Y3Ba?=
 =?utf-8?B?Z09HR2YvWVFsQmQvK3VpR21lQ2xPcENzWS9CZmFWRVhGM244a0c2TlNKOGxF?=
 =?utf-8?B?NmxJT2FHZFhhWDdyZEgxVmUzVWlOSldYcDBDQktOV21GWlRmbms2UVFCM0k3?=
 =?utf-8?B?VHRaM1U2eE1Jc0Zaam9UZ0hFeDFGVFpkOTJ3eFByTlJIVEpIL2hqQkpKcGRn?=
 =?utf-8?B?V1o4eGxvYkVnWGpHZ243M0NUeTBESXRudE9JVjE0SUcrVWtCeU4yQ3RlWmkv?=
 =?utf-8?B?ZlBNOXZOd3dPVzF3U3ZSTTN0UzhSUzJPZUtXYVh5OU45N0d4clFRQWRFVTEy?=
 =?utf-8?B?Z0lxbUl2OEVRS28xNnpSMmhSZDhGSTRUZE5EY2lrQ082NHhxVVpodjJqdVB6?=
 =?utf-8?B?cmdyckVIa3lSS3ByTm1pYW85WXEvTVd1VXlwZVdEYUU2Y0E0aUJra2R5OGVP?=
 =?utf-8?B?MktIQkNpeHVwY3VqMDZLZXRORFhYZlRBaDduTnMzQzBmanVxRGpHU282dERU?=
 =?utf-8?B?MnMvMWVGMFd3ZytEa1ErRHFIUDhRWnptMC8wUUg5NFd0eDE5NjNIK1ZjN05N?=
 =?utf-8?B?YlM5U0FXdnIrYkRQS1V6NmFseUtJT1lmSnU3VHN5MXp4SVdHMnAzaU9qek82?=
 =?utf-8?B?UU8yRXJtOWc3RENPWFIrZTZ2Ym5LYStGUHpodTFyTU83OWRDTlRudUhpb2RS?=
 =?utf-8?B?alJnY1NHUExER1AybUVML1h3TDBFVU9TZUF1cFNtcXRsbHFHc0ZOZ3J0UXZt?=
 =?utf-8?B?WS9SRUZrMjFWZE9laVRjRnNUZlZwRS9pRERsRXdhdVJOZkVhanQrOS9XUUg4?=
 =?utf-8?B?S0Uzd09IR3JMQy9DV3ZBTUlEcXFnYmd6K0hyR1paNU1LODN4bjJCZ3lZakdZ?=
 =?utf-8?B?VnF0L2VnTmtLRFozOTdrNEx2OHBmUXo0QkpISE5NN05uSG5PeC9rd01Cd1N3?=
 =?utf-8?B?VkJraFY4dXdKY280ZndpOFJGcHIwanVGMzR3VmVkekRTTU9VOTRBakdjYlpG?=
 =?utf-8?B?ZEtmWWJvbDlTN0M3bnVJWW9vNjhLRC9iMmRXQ0IwTUFZUG9yOVhnSTBnVGl4?=
 =?utf-8?B?UWowb2lKZWhLenV6UDBoOGpOOUpqWFZ0TzI5KzczdTJFalIzOENCV3U3N3hO?=
 =?utf-8?B?RTBSM0R5Y2lrNlU4RXZ1aG80UTF6WVl3cTlTL3hJYk8yWnJ6UHAraFppNkk4?=
 =?utf-8?B?TkRoNkc4TDNVWlRKSnZtd1dzc09tVjRIRGhsMG5oeVN2aVZsNmlKR1lDL0pm?=
 =?utf-8?B?ZnNvcFUxTklNZkR0ak8xS3hXTHNLVUtsZlNvMStJR0FNTUNNMEErbVUzaDBT?=
 =?utf-8?B?Y1lFZFZYVHdwTlNTTGRzeGh2c2cxNTE1czFnM0ZiYUQ0MWJmOVZKeitiSkdP?=
 =?utf-8?B?MXNsNk90NFAyaGNkVk8yVThudlFEWHJDRVo1ZWRaOGI1ZUJ2QWxBNDFMWVFJ?=
 =?utf-8?B?TktONm9UZVdnWFRFK3lSYk8vM2ZpaTFTY3g4TlY3Z0JGdlJBdmZOdnZ6MlR0?=
 =?utf-8?B?UE4wNWlTL01KK04wWFdGTHdtZFNOdzBpcUJiMG82RW1PNTk0S2FFdkVKaURl?=
 =?utf-8?B?S2k4dTBuME16S2lwSGZtMnk0MGppTlZVQWw3S3J6YTYrZ2xETTlKM2dGYnFl?=
 =?utf-8?B?TDlNYmZWelp1WWN6S1RDZnFwTVRndWhZNE5ENWM2RlV2cTljUXhKdVBGOEs5?=
 =?utf-8?B?aVlRUjA2eS9nTlBhWVh3dklzZ2xnTnJpTmdTKzlhYjFYL2NiendlZ0JBRUNO?=
 =?utf-8?B?RDhTZzRuaFh1UVRqeUhIbHpZK0hxK3ZncVFSeWNDSnN6NUdYT3JFdGtKSjd2?=
 =?utf-8?B?eGlhUGpUVzEzY0pvdERKY2lpL1hnZ296ZVVXdVphajZydE05eXlNbEhhaUk5?=
 =?utf-8?B?ZTJMQ3JRRG1hcjNHWlJneEtHaWszV0Q0bUtEZUFsYU52TU5SNS9XVWZJdE1l?=
 =?utf-8?B?WHdYOXljdnBPMjJSK2pEalozM0lzNm5KOW5ySEVOUzEzbXZPNyt3MDRBejJX?=
 =?utf-8?B?ZWFuZ3prcXJ3K1M4MHhRRGViRHhGbVpRQUltR29kYkkyVnlyaEQ3bmRwLy9y?=
 =?utf-8?Q?MatXdVxvJTGz653uheNaNnmyCAS1I/fIetGYx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cd7749-4839-4119-7107-08df2845df84
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:47:47.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3xGQMJVdox+AOu5S8rTDwfK1nOS1R2pX3oKhLljRImJU4s6I0Tne6luLhdGIXB2ZChlPlQVIuVzQ3MlBNj/MZT8mSkrSok5Uf47onl4gPxoMW4/03/2TisDlQ58LzTb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7064

On Mon, Oct 12, 2026 at 12:18:33PM +0300, Andy Shevchenko wrote:
>On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> gpio_set_irq_type() can be called concurrently for different pins on
>> the same port.  The IRQ core serializes per irq descriptor, but
>> different pins have different descriptors, so on SMP systems two
>> concurrent gpio_set_irq_type() calls for pins on the same port run
>> without mutual exclusion.
>>
>> The read-modify-write of port->both_edges is performed outside the
>> port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
>> concurrent updates for different pins can overwrite each other,
>> causing missed interrupts or stuck IRQ lines on dual-edge triggered
>> pins.
>>
>> The original uniprocessor MXC SoCs were not affected; the race
>> became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
>> driver.
>>
>> Convert both_edges from u32 to unsigned long and use set_bit(),
>> clear_bit(), and test_bit() to make the modifications atomic.
>
>Is bitops.h already included?

oh. fix in v7.

Thanks
Peng

>
>-- 
>With Best Regards,
>Andy Shevchenko
>
