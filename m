Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AB3E51DE;
	Fri, 16 Oct 2026 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157995; cv=fail; b=OR8SXSOk1DqlyhTRbM2M4VicAuJv+4UQUG9fPR6Idoi08wBKL+DnTvhVcpPDizIhxO3TM/029hNSDPE1sWZZ6+5/8xzVYJCOgSspFtY1i8ohnz7PvMFPvjJtDUD/Zc8CtPocHAb9Ap8rYldvhg8NRdr6sDgwGSzNqmW5uBn+BxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157995; c=relaxed/simple;
	bh=9ErqS+nDuGLcxDKH1BV5Pem9pIEc9ApRPgd0rsbt9Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VDiVJphkWFXogZB2E9TbwfTqSJD/h1OmQwKZvTKi7ZCFVIHklG9hhm4zPW1YYUJSBOY0/XWBLybLfRxc+EaDFrE63CcYEk8pi5pIzRFJc3csSInZTr9Xl7vmC3ogvQG8X3/yL82nC7SOXHTxDYZhyatqcQ6jnnso+79B38hIzdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VpNO577U; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VpNO577U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfvv9qQHJpu1lWIGTcxhBpCc/UgHwo4/bTxrmc71ig9pF7638IwdAj55OAAmiCx/MjdPBZk5tK4QKm7d6zB47IaeeyyWyfkL7zyZgCLlSupuIQABnsSnZgzWlxhvv7bcSoOKYPwo9gzGQK7WxAsPuDjP6AEKYgAh94sMZ741zPvSVWpCXZGNdkVLuT82Pt1g9/B3mXbIW5o8Y11dn+RIMVj+2ryHkmT5jWEDdynmLRzOWw90hVeJhE9K23irqxvKkhIXJ5Z8DcjPjNPoYbPyhsuzKZqqCP9i6vFt5bmxRe0vv29WsQNLv7y2WTkiaEm1ux6IJoRzhrE7mNt3C3n5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVFY48KRdqYrK8YFZ3aCqe1gk+BBNBRnJg871UJjKrc=;
 b=N6loF+3x3epKoC1fXCoN9V+u0WKSRd6qr7wLPBFrxwOwRkuO6Ql7rXvuaQiVC6jHjHI+m77MtzN833hbNcaGEufEzgEP58L/5lnv9XcS2d0e04qfFORn+KUTB06MLzhSadlZq6vWmklrCXoRPm06oPWLAbe1Yd1y6XSINwahjV4P8tH3Ox9v9o7oOBiiLnCeHGh9emFqqBVW36yYLjsU0ESby1csATe2e0p2mN3uRxq9CTt91cBSjzB7FEBHn72kYsF5+A6SLiOJ8l3tFuyRNYtRrVSC7RxMyNQYMNWID1yNPEtctgM0azFnoeicPCc4tJlKPzK/v0qU6CmBjhSRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVFY48KRdqYrK8YFZ3aCqe1gk+BBNBRnJg871UJjKrc=;
 b=VpNO577UyJGWbvBFpIY7LEG4IvzHHNRT5Hs0FO8TOjRowcrf2qT4zNomsE0Uj+37DK6nb6OFZPJivkiqTgAYZlvk4Kig4k7BKaNauYBtKa9otRZ8ZPHpICKHPVVQX21C0FBPKdtf59Y8fd0B1N4aURYN82wE0FpRsgs6H/w+LItHqyvBOYGGJSQAkWVHWO2RHX73t+Q9OHaGR0RbaxgJ58CadfZ8id3q5lchlwxYM7kdzwuLqXvy9zmi0QILKaFlikrTieWq0UNX4veAbh7LVOEYm4EZ/8NgJntKE/Rl05UcnH8RFbOD/OpXYgOweYMwgaWb4tTRWmaOA03+u8eNWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 13:39:51 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 13:39:51 +0000
Date: Fri, 16 Oct 2026 21:44:28 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Message-ID: <atIqPOBaflct369Q@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
 <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
 <as8+sqlBEuhfdtZ8@shlinux89>
 <CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|BR2PPF9D47B45B4:EE_
X-MS-Office365-Filtering-Correlation-Id: 433ac22c-45f0-4397-ca56-08df2b8af408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|19092799006|1800799024|376014|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	m9tVdce0M4ofKCmzqvpVjOf9oSIRaFrILfT6GfFsjzq3eo8TnOBz294a7PsKVGcAXaLKJ9csfpSqCBCr8PjkGSRQ1/TG6m4Fl8TJvSF0jnoDs3MvcGY0yTKPzy8si7vAMRc4ZjFXnpXLVEhwo5hTCWA5NYo6gNVQsgUDq2g20ShgQL9IWB6HsavFXme6Bg2kZ6ESczIIvP//eUXUltXD0A0JdBzqpSWUIAU8rkZPse9Yq9wegIvudk8jLHnxkFz6QN3xM9MGeKGf22kKljnqclbDjdU0m8cL6VI1KSAm9gq7ckNbcSKtn3KrPHd+1+wPPWXbhHi3jMl522PnCrXkNvr9DFy0M6TFW6WmdUFAl2KK9b57dj3BnS+NBOm5JjvkaP+Aacc12Ru4/JbN0TFNwddcKSrUY72AAvdjeXChnGDARzJd8o+US6Opu11cbkttd2cAZf8ObeMtjcmUbwpbmAG3MEvU2Er7LGnmhmGmKww7SYgzatC65EQd4FhDNe6uI9pG4690ijo/c8f90qkxrFuyQnQyRhFBVG/iwmc9qK+Ly8fKvlEQXpBoW2Bc2X7ihU74iZhdkoP9/+oXEZWSmOR1+TlgFpnckMlZyBp5vMNcL/lsdIyWj44eLiGa3nKpXjWpqpELyEUF8RwJTTZ3ddFym+o+6frEUke2GT0YZOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(19092799006)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXNRV0EvaUdLK29PZWo3L3o4MkdyZE1UM3ppb09ZbTRrelpSMXBWN3M5UkNt?=
 =?utf-8?B?OUgxSEJhYVk2UGgxYjdrYjFXckxtbFh2d1c1Q1cvWDdvUGNlQmg0eWN5YXkv?=
 =?utf-8?B?alZaNDg1WXBVQ2hIakoyTSt5Yk1MMFd0V1R2Q2NQYmo2T0VvU2ZoUW10Y29v?=
 =?utf-8?B?b3hZVW93MlVMN1pGYlpnb1JodDFYbE9KOVE4S2oyTCtpMDl4d3NxWW5xNDFO?=
 =?utf-8?B?QUJBak5LSDZRdWZLWVNYYnpMWEpJQjdpNUdpczBDZXprMTJiU2VWUWJ2dFNJ?=
 =?utf-8?B?bUJMMjgrYlB3MnhpZUJJanF4QTVRMWNYWkJVTUp6RENPWTZRU3Jqa05SQXUx?=
 =?utf-8?B?aE0xVGFRb3VxUHB2eW5yOXhIQzJXRllRekxId0hON0JGN21yK0JEcUpGZWdH?=
 =?utf-8?B?ZURPV3p1a041WmlQb2Zjc1laU3V4Rk5XMTE1R3Ywam5Pa2lCYlRTRXNoS0pp?=
 =?utf-8?B?RlVET214RDhiY00wa0hlWFVXOVNYK3ZzYjlEWVhDUUUrN3dQN2hGcWdGYjh4?=
 =?utf-8?B?YWtNS3B2bTNsZTZjdmc5cFRSNUV2Y3NlWWJOelJtR0RUVitlTzk2UFhZZUFp?=
 =?utf-8?B?ckV3bUdBNWVReWZCdmw0NS9KVlR6WmNVRUpxTTJGQzVESzh1dGx6ZWtYbkoy?=
 =?utf-8?B?UnMwRHlhUTZ3eWc2VTcyRTRJMUoyUmtiUXFwdHRCV0E0OTlCdGY0cUMzazRD?=
 =?utf-8?B?LzlMOWpINk5nRXE4ai9XTW1raE1lUlRZLzFsR0xSK3pZZ1FkS0JFNElJK2pm?=
 =?utf-8?B?aXh2ajVXOXBoU3BBbCtJTEJqbHI0eUNiZHdHdTk1eEVHbjY3WWJZNjM4Mkt0?=
 =?utf-8?B?NG8zSVdHd0tFbXM3WERXcGNiRkk4Q2wrTDc5eGJSOXpEM0hQL2hjQnNzNmp5?=
 =?utf-8?B?eC9ZRDY3MnhWS0xVWGVMV0h5bzdCUlFLeitlNGNsS1Z1dlMyT2E0bGI5ZURt?=
 =?utf-8?B?dk5VZTg5RGJhY0FCNnZKZTFFTEM1a2pLaXR6NEZnZ0MzdjZaZ2J6ejEwQlIz?=
 =?utf-8?B?Q1hNOVJQcmlqRms3QVdNaUl6YUc3NmZqcUU2bStNN3pSUFRnL09aRXFGaUVz?=
 =?utf-8?B?b0k3Vm50RjBpc0UyN2NSYkhqMWtzRW8zeTJRQkIzbFAvcU5jcjI4ZnRnQ0h4?=
 =?utf-8?B?U0hyRXhFRjFRVkIyb1VRZE5qUXhWQmJzWVk1b3VnbnZGUWZZS1ZBUjFGcFZD?=
 =?utf-8?B?eVdBWTBsRXl6ZEZ5bEI3VUZmMVZ6bXJoYnJZUEFMbHJzUEI5VndESEszWkkw?=
 =?utf-8?B?dFZmYllCR0NiUVZZRWpWcFgzM29PWjQwYkZ6UHdKa2N4Mi80ZVpKb1FRUW5t?=
 =?utf-8?B?T01wR3k2WlpNL3EyZ1BQeGcwVFJyZW1Hdmhvclc0NkNxdThPSmszejJ0YS9p?=
 =?utf-8?B?RlJlNDh3Qmo5NlhDaHVHTTFCd0FsS2xyRWZNVUtYeGlPekZVOFpDSVNDTXRi?=
 =?utf-8?B?Vy9RLzl3ZE1EdHg0QXpPVHhONmlncXczenBKMnJCdnNSUjRXd0R3NFJEM3BM?=
 =?utf-8?B?dDVkbzNqNGxFeHRKR04rZjhmdURPbUF1S2YxbFZ0RmdiZ2duNUFERTg3aCtS?=
 =?utf-8?B?VFN5anlGT3ZwazNtZ08zWTBLSi93a0NHMFlMQzhHeXFyckV5U3VvcXMwTUFD?=
 =?utf-8?B?UVpMeElJM1JJV3ZFZUYvYmk1LzRNVjVvK09XTGcrQ1BUeVV0aUtxdmRBb0s1?=
 =?utf-8?B?R3RGWlpnSmNFSTdqOVVaS2dDNytoM0FzczJueEpMRkFlNHZOY2JtaFFYdG13?=
 =?utf-8?B?YkVwcExXSWRzOVVXbUlZekdabDF4RXdnZWl5dkkxTDh2VkhJeTNzdDRicUZJ?=
 =?utf-8?B?SGhpeUN2SVpkOE5KMi9nam1tTUsyTHl1aUFwdG5SaEtUQkNJb2RYeU1PTnB2?=
 =?utf-8?B?NkxsYmpmMU40Zlhtd3Z4eC9UakNPVjk2Y1FDTEhCbDBSaUdqbXdjazdnQTBm?=
 =?utf-8?B?bmE3M1BlUU1pK0M3ZkkvbS9QZC9QQ0RaOEtJeFdPV1g4bmtUbzhpMW9yWlQr?=
 =?utf-8?B?WlVVa2duZWpUdVZpbDdTZTVnVi80bG9qSjFhL1o1b09VNE1EN1lVem5CUTUv?=
 =?utf-8?B?cDgzKzdYanFSb0hMam1OY3I3LzBJQXQvMjdpNE5GVmdzVVdEK081TlVBTC9G?=
 =?utf-8?B?Mm02bVdaWWpQZDFlMlRtY0wxTW5QYjVDZDQzMkgyNmlpbzJ3RERtcTBwVEgw?=
 =?utf-8?B?MkFYQVRQanhNS1U5YSt6VVZsVzlGMnNoWU1QeVh0WTZEUVVTdEcxcFNTc3ZU?=
 =?utf-8?B?U1NYczZFZ2hEVGs2UWJaa2xxeXlTRjZmb3piYnoxWHZqZ2Q2eFJjNjZiOXlj?=
 =?utf-8?B?aWlFaGlRUVRsSWtlUmsrMlFibUJFYlVNdTFrVkM4elk3NDZtWFA2UjNlSUpC?=
 =?utf-8?Q?0OuLnCfeDbfNRRV1Dk57p1bbxcns5TCbGhV1e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433ac22c-45f0-4397-ca56-08df2b8af408
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:39:51.1542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAkC+FWglpxeX4M00dCoIj6fJi24KgskaSO0VEFa7Z/TP7429WBbOLnv4gzdTM9cua5POsn4DZXnSzBerRAlvnCGmlmJh7RPkDpp3x5oRNaYcJ0NhsUeMQtm1WCd5WB/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PPF9D47B45B4

Hi Linus,
On Fri, Oct 16, 2026 at 11:13:28AM +0200, Linus Walleij wrote:
>On Wed, Oct 14, 2026 at 10:30 AM Peng Fan <peng.fan@oss.nxp.com> wrote:
>> On Wed, Oct 14, 2026 at 01:10:48AM +0200, Linus Walleij wrote:
>
>> >Hi Peng,
>> >
>> >On Sun, Oct 11, 2026 at 1:51 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>> >
>> >>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
>> >>                 unsigned int offset, unsigned long conf)
>> >>  {
>> >> -       struct device_node *np = port->dev->of_node;
>> >> +       int ret;
>> >> +
>> >> +       if (!mxc_gpio_has_pad_wakeup(port))
>> >> +               return false;
>> >
>> >Why is the entire call to mxc_gpio_generic_config()
>> >bailing out here if the port does not have pad wakeup?
>> >
>> >> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
>> >> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
>> >> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
>> >> -               return (gpiochip_generic_config(&port->gen_gc.gc,
>> >> -                                               offset, conf) == 0);
>> >> +       ret = gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
>> >> +       if (ret)
>> >> +               return false;
>> >
>> >Then no generic config can happen.
>> >
>> >This looks weird, isn't it just some of the configs that
>> >don't work?
>>
>> The early return is correct and matches the original behavior - only
>> i.MX8 SoCs with SCU have pad wakeup hardware.
>>
>> gpiochip_generic_config() here calls into the pinctrl backend's
>> pin_config_set(), which on i.MX8 programs the SCU firmware with the
>> PAD wakeup source type.  Non-i.MX8 SoCs don't have an SCU pinctrl backend.
>>
>> The function name is misleading - its only caller is mxc_gpio_set_pad_wakeup().
>
>This is just a big hack and I want it removed.
>
>Implicit in this reasoning is: the only config we support on
>the pinctrl back-end is wakeups so let's gate the entire function
>call if we don't support wakeup.
>
>This is a *generic* back-end like the function says:
>gpiochip_generic_config() so the GPIO driver can't make
>assumptions about what the pinctrl backend can and
>cannot do. In a new SoC using the same driver the
>pinctrl back-end could be something different.
>
>So this is breaking modularization and encapsulation.
>
>It is better to let the pin controller return -ENOTSUPP
>or whatever is appropriate instead of gating the
>call like this,

Sure. To get rid of the hack in gpio-mxc.c, we need update pinctrl imx driver
and gpio-mxc driver both, which will create cross-dependency. So I need
to take two steps:

1. Update pinctrl-imx.c to return -ENOTSUPP for non-i.MX8 SoC
2. get rid of the hack in gpio-mxc.c

The current patch is mainly code style change. Could the above 2 steps based
on current patch/patchset? Then we no need to carry more changes in one
patchset.

Thanks
Peng

>
>Yours,
>Linus Walleij
>
>
