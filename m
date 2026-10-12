Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D82F5324
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 04:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778059; cv=fail; b=XTq/YIsHsqWeQd2FkhBW3j4360+Kmsa71gOf+Bob8FigsVJBFNouXymxvR1RU8mzOx5Kg+EJF2g8mnkcFeEluHJJugB5mkbwoHv2DcFcjRhEIC9ksidhRVwB3Tr/1jdWpepeGy2euyFEyTy3WKkiWGbeAzJVawGlkdms7SynVPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778059; c=relaxed/simple;
	bh=FlTp+Hlbgqf6qbWjJIrqNcZ2B9moxXBgZCY2U7ylt+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q24Jr2xDHJcmqA3yGopXoKLae4z1tGFipINysjoiephq7z4FmmkBKNOkRuhtaSDbnBi0E/HLg+bi2NI9Duv4Jqg7bAQDYqqqPLG8aI2g+YZXGXBomS7feZ3B7fIPgEUIa67Slt7XXY+XA2ZNOrztkOhY4aDwtivQyXjh1GjMCTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y4FlOssb reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y4FlOssb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epQ66209QOMYvI3Z3axhdHZfuhokXmOsr0su8IrQLgYF44rrBzWIGYCjicH41/UDhqfA88iQbrYl+hal0C3jh9nS33I/WkOq2bmI6R2PtiiKJzS6wqYblWdqsfWRHmghVGxn6xMOl/B6BgrNb8kuPV02I84X96DvD5UtzqlP4YCwpBYckDU1icb18vPuRJVmXNhh8b0R0X6GJ2xbhWisdDm8DZBOEfpH5fV/P/vlgzfuCcb/0aKNR1pqTmJBJUkE9vXvq2lcLw44aN8sTvfcXn0XrfFJXW0WX+YaCDozlU4g/pKFMRZ/wma5u8PNeG7eA1w8K3kvDzkJkRTeKgBAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8br1EoMqxJOVQPHbWPOpVYwDuVay/jfm0Ugg7Ez0Hw=;
 b=Dit0t/NFMv+Q+fDRIMg7YLgZVWbN4bAaMOroyKWKd/NY932lLflgdS6ZUKOOhpNKkRXhMR0ATJTKxUK9Kc3dhNzX53D+p4yLMxXOWQrGNavUmyHo1mM10HdBNg4UyxfmW9hdvdBtA1v2vukuv0hFH+9fOY5Ax7iQZyhurcNiVn8S0Ins3ATP4g+D33uDPrm1HxXMmiyVdiIEr5nN6v/hYC/VFLjTJNtZot0w2iyr5WY7PQ+WD5LR5xMA7TxYrsFFrO7wGrPTaqldEXXu8tVXLJyma3/FopoR6Rqw0D96W8ETbREjzBeQm4tB38pTs7V7ooKeotsnJ35NRl7ungm01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8br1EoMqxJOVQPHbWPOpVYwDuVay/jfm0Ugg7Ez0Hw=;
 b=Y4FlOssb0fVQ8HbRr3Fd9VYcwzkDWDeB05USsnFhfnRkxi+tNXESGpAetf9lCvzPiyHKA0fkzhlmT72U3QisBFTx6JI7slSldEDCBiyPm+bgTigECOMH1TkDoFL6VVIk0XhmKRBRKnsHAT7tyQ4rBSaHPU0BTkHSCzGFuxH07FLkWuIZ3kkUduw5Ty3y3EYEJ5qWW1GcIzUw74uVa/q10Ohucn/7DZgiBvgvK48Atge6lsIXFeG3MbtyoCLOmDAiWbjBD0DR213su0SKPTxR27w+AQtdlTDCD/lQJ8wvxmTLFxn4rl6JxGNTGmy0VUhTAmTQ3W2MoS0Xm/008KtsCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB8707.eurprd04.prod.outlook.com (2603:10a6:20b:42a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 04:07:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 04:07:35 +0000
Date: Mon, 12 Oct 2026 12:12:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v6 10/13] gpio: mxc: use devres functions simplify probe
 code
Message-ID: <asxeGf7LQN+B6Kht@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-10-cb47ce2ad758@nxp.com>
 <sashiko-outbox-167212@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-167212@kernel.org>
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e989c7-0dd8-4fb8-3e37-08df28165868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|10067099003|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	NzHdoMKJ+D6WLbq94IAIRSDbe5g/3Br+z4TIXi3lZaRpdsjgv5jRVvdItQmr+cQynZLlQxkyNXwXMjXMEg7BuDIhqMGwBq1XQHYnJPwqa5Sncm4Qxn1HOwJjQbFjmxxOkLIlZqQ1ebWS4t/0nl7CDNxp25mkzReR7zTl58/26ncnX0F9M3ltE3xy8LD3AR19gxwcu48QsbxJ3dNDF33u/rUwszn6cG1ZYWQ8gt4Oi3psCHmyFN8y82jNqE3cj5MwcPYtDTHx89UiiC5CVfWkQS2wY4TGOINoE0d44vGjIbcu2c6/za+u1JKUO5OgzmxCncsk5U6C0Fqh8IYaYpAufllRjs9wmFiVo9XXOs/jKx7q4ttcQs9MPuap/OGXAK9w8/1I9yDQ1AntLzmslrmyMezDzhxnJm0/YKmELQxbraCv+24TuQPLUY66efydh8v4q/kj0kQlzxi3ddgswRRFRZCInUwCx5y4G9wW9tiUD78hANilcI6eiSl3OYdnm1OYsw2ScIYtr4vhK+iCQcuhAgW0fdZD8d2GN7nb0FoXFmk0LkKXHVuCpdLS7DZk4IToDM5Uyyl3qusrj2FJlNedlrMtLqfrHd46yCzAtNvLIJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(261009223027099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?iWwXjwdeS3OtpnImV65f92Cmo9RsPEU57DpRrue9j+K242BJmagyawc7yy?=
 =?iso-8859-1?Q?XbwkclfKmc9zX2zE1HUiaMuO881qKMLfvJOROTAnOAYppPYOCJJwodTUEP?=
 =?iso-8859-1?Q?27au07XN8vBHRrwq2AzV37/emkjO4WRA/MUFJttiNJyO5cNOr+n6pcVWzn?=
 =?iso-8859-1?Q?nhArQ/gnfQm/EiR2nReMxpHBd0PK+0eaFC1wNlnF20GhQsrvciexmm6m+D?=
 =?iso-8859-1?Q?mlk3lJKVQkAfRndlTG5gVLacGH+agCgAyNIrZ8vXGLB57mfu05KC7gZL6+?=
 =?iso-8859-1?Q?mAouvgTlayPbvNMRWvp1OOpKyKGmiUkAuMf1lRhui3mgJqNJKXZThonig7?=
 =?iso-8859-1?Q?CLVuEGy5KlqBuS+anDMx6Xf9rPTy8haIHm8yV46uBD5aUhF4Ju5LsmIk+Q?=
 =?iso-8859-1?Q?qROBa5iyppN5zqBrCRz7FMbbvjmyqFW0AEYTP1jfGnKwAwvl04CiCSNqCF?=
 =?iso-8859-1?Q?mFMGwwIDIhx8OMOp3S4Rlgf086U8r+TXDqrQkGYab+Ys6Hi0u6MBgJvtxa?=
 =?iso-8859-1?Q?/d5mDYEc/SmspwpJ8/PvLUgMZpKz57FmrqHTWC7TdM7JzmPl5ob13c6F1H?=
 =?iso-8859-1?Q?1/bhBkL01gGV9aZWyDaJisftZVtAYUGIn3o8RPcg+qotfylzM9pObj62tH?=
 =?iso-8859-1?Q?gB2nmaH9Ca6Dw7eDxSN28L0a+/xf7PeGf6YQc/3KmaCR1DhXXWB2ekJNHn?=
 =?iso-8859-1?Q?u91pXB/MyqPQ721vnKTrGK0jiHOtcZisaCnDiagtT3T0svi5tQdUxHm+IZ?=
 =?iso-8859-1?Q?Gnn4mcS1/XllZYDaCAJHDVOMa30RkA4x+Mg1eo2RtGvbhRU3uL4qdBizgW?=
 =?iso-8859-1?Q?MtTBy1RR79QinKxqa19uILbewMOwUYXaEKyT9nR7nPC6qB6crOJrQtN4n4?=
 =?iso-8859-1?Q?diSFSC0s544nbr15i1FDKE8e4WLsK8BMRSPZvDWYerbdz+bxYIIegkZkGQ?=
 =?iso-8859-1?Q?Y+3Y+i8mVcykkeuVhRRPqyDFn8VQh55ylJEcxsIfYrfoDMKTp2DiA6f1DR?=
 =?iso-8859-1?Q?kokhTuORUbyVEWIdeBOajnfWP5vzB3qj3tl5Mgv3GqSb2vAj/btBHYe+o/?=
 =?iso-8859-1?Q?KcRfSSYF1oP3CbPlmkMIjnpsGhUTvMMN5nVUg8wlOqzdSAZCwVjTaXMnmI?=
 =?iso-8859-1?Q?h3TRa44y22WNcwcg6JmYWlI21AllMdrMJis3TT7URLqWj6WHu9O+JMkP9O?=
 =?iso-8859-1?Q?bYsMrWsjJngvp8x9SBWzwfnatDbgTQSmm0jwXmbSUO2G+hid4ulOCMTJbf?=
 =?iso-8859-1?Q?VRq2+hKGHF5TziS8UnTZcFwea4SaHH0R9dadr5MfjgClSrTehFrl2RhqK2?=
 =?iso-8859-1?Q?poVfLcM6QR8UWaPWDy3nU3uaqIXZ/ifwFsfj2CLdpREsqnnbKy1f8iybPn?=
 =?iso-8859-1?Q?NevCoEgjYq2IenI9z1xBfPGQqA0HJXdOm4Wy/FQlXUzasxtgXWVB7z4F3W?=
 =?iso-8859-1?Q?WIw4v4el5B57VUjNPUUFmtO6FiDEvde++HmyOmAM605V6B2TlecIj6TyFW?=
 =?iso-8859-1?Q?6h96t2ymDyUz4go9gagZRi4X6Y1ZZCckZqkqQ6VZfn7o9Ov15uA1s6CW2r?=
 =?iso-8859-1?Q?DUur2va8S81/xSHWdlMXwFbAurjYVRhOgbfS9OtjiRJuQj8WFyOPHiVeRL?=
 =?iso-8859-1?Q?ex7qIIqH1MavjdaWjll6XbL7SDDvAQYUhoxkHPU5uluuj5+O/i4tQbXQKp?=
 =?iso-8859-1?Q?dj6t9StMFwQmB4PS6yUiIBMSE0h6nWILl/5GpjSjbfHSg0WZzERFAhwcXq?=
 =?iso-8859-1?Q?BE92sYKvRNM7j51pjgbfrGAVFUBh1xx+6/WJ5TA7TEYadLm0t97RNpvOja?=
 =?iso-8859-1?Q?zYySWkKDt8GTDkkItOk9hTtSjFE26lp3vqp4KfQ7MxyQe+BqSQUV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e989c7-0dd8-4fb8-3e37-08df28165868
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 04:07:35.0447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HOk0CQeId8nhyp1J/zf0V8obCfco8qUcwsjI7tz4/EhP7QviGXrr8OH7Saq3V4C4A8vACELmm/92FGIKop15xihXo9zR61Rlz20/A5OG/ToqF2afbd3JD4P0RPnt2rO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8707

On Sun, Oct 11, 2026 at 12:05:31PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [High] gpio: use-after-free and premature exposure of irq_domain
>--
>
>commit e70e13ad3287f8fd0b2357d428d23270ccfc9522
>Author: Peng Fan <peng.fan@nxp.com>
>
>gpio: mxc: use devres functions simplify probe code
>
>This commit replaces legacy IRQ domain creation and manual PM runtime error
>handling with devres equivalents in the MXC GPIO driver probe. It removes
>error path labels by relying on device-managed allocations to unwind resources.
>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 8dcfd05e658a6..09acb186c84c1 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>
>[ ... ]
>
>> @@ -534,27 +536,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  
>>  	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>>  	if (err)
>> -		goto out_bgio;
>> +		return err;
>
>[Severity: High]
>Does this premature exposure of the GPIO chip cause a use-after-free risk?
>
>By calling devm_gpiochip_add_data() before devm_irq_domain_instantiate(), the
>GPIO chip is registered and immediately exposed to kernel consumers and
>userspace.

This is a pre-existing issue. Seems I need to add another fix patch
before doing the cleanup.

Regards
Peng

>
>If a consumer requests an IRQ during this window, mxc_gpio_to_irq() will
>execute:
>
>drivers/gpio/gpio-mxc.c:mxc_gpio_to_irq() {
>	struct mxc_gpio_port *port = gpiochip_get_data(gc);
>
>	return irq_find_mapping(port->domain, offset);
>}
>
>This passes a NULL port->domain to irq_find_mapping(), failing to map the IRQ.
>
>Additionally, if a subsequent probe step like mxc_gpio_init_gc() fails, devres
>unwinds allocations in reverse order (LIFO). Devres will first destroy the IRQ
>domain, leaving port->domain as a dangling pointer to freed memory.
>
>The GPIO chip remains fully registered and exposed until its own devres release
>action runs later. A concurrent gpiod_to_irq() call during this unwinding
>window will dereference the freed port->domain, causing a use-after-free.
>
>Should devm_irq_domain_instantiate() be called before
>devm_gpiochip_add_data() to ensure the domain is fully prepared before exposure
>and destroyed after the chip is unregistered?
>
>>  
>>  	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
>> -	if (irq_base < 0) {
>> -		err = irq_base;
>> -		goto out_bgio;
>> -	}
>> +	if (irq_base < 0)
>> +		return irq_base;
>> +
>> +	d_info = (struct irq_domain_info) {
>> +		.fwnode		= dev_fwnode(dev),
>> +		.size		= 32,
>> +		.hwirq_max	= 32,
>> +		.virq_base	= irq_base,
>> +		.ops		= &irq_domain_simple_ops,
>> +		.dev		= dev,
>> +	};
>>  
>> -	port->domain = irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base, 0,
>> -						&irq_domain_simple_ops, NULL);
>> -	if (!port->domain) {
>> -		err = -ENODEV;
>> -		goto out_bgio;
>> -	}
>> +	port->domain = devm_irq_domain_instantiate(dev, &d_info);
>> +	if (IS_ERR(port->domain))
>> +		return PTR_ERR(port->domain);
>>  
>>  	irq_domain_set_pm_device(port->domain, dev);
>>  
>>  	/* gpio-mxc can be a generic irq chip */
>>  	err = mxc_gpio_init_gc(port, irq_base);
>>  	if (err < 0)
>> -		goto out_irqdomain_remove;
>> +		return err;
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com?part=10
>
