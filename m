Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F75B206;
	Fri,  9 Oct 2026 00:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507273; cv=fail; b=e4xxqhXzofCvNY8F9F5BAKSuRASJB9dqpFu+dxSgVrxOAroG1xbIDxID7KTqhC02kmckha8Wrj1Dtkh9W+R/18Q1dpuZUGRuAHliFawdfJfDR/tL1aWZcv0R6ZaajQVzHKhKhoN7eaYMCJRn/TB5TB9JeRxo9eBbZFZEokjg9ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507273; c=relaxed/simple;
	bh=BYaBzdDmz2aBHj81+puqmXex83E8npxebJ93aCQC7aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SmxS3vL4EnONINL1BfQqN6FLtRPH1BhqtapWzKWtaZVdkxTrdit6Fqc6A7IgrjjCEmblEw8HTBallsqnVxSZb++t/SWy2doHKpnGEKp+hRQc1JZVZufXGocmvN2y3pivZvxRrX1SMqhWIm+gZ6+ixHY5dFHrTNvt3Kc60wYduYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MekZ+cGQ; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MekZ+cGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nE2klUv3O1F65m6wJEyTrgWWSFqs2EkS4Kxi/XrVUKw5eh9+7ARiGojFKcN3uOoYsIWo+uVJ6UKuncKz1HcOf8EPMArdP8kjI6DZGwGUikXVhV0tutjymgvW5G7iqaf6OyEPYtpXke8+eKtkI2N+AqE0OZZCV+mvkhaHqzK5VQB+1jACnEULy45j0OHb8gn7PSfL4NldBpAMGunPhJ7kxHJndOBEBJffdbx7LdEU10Z/ZjDXE+23fEw21UKnb0SKW6zhMN8Okk6Sw+r2eRSohFpGmaxFUHJb1jMjthFO1/hn6P8joPIzcDg9DaRoG+E8cVW1oL1d9aCT3IV9f3i2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNXKEnp52uRueiUJgcnWmmc76Wujwd1eToYoXvRjUk0=;
 b=jxtQJCfifQR1hxf1hFaZ3aG338yALTG4ylfR3WZYGA8BeUyivV/S4RaNOUcSd5Znno5aKd9bw8KG/OsEJLq9VDrRvttoWEhPlWQmucZl1+Z0l+Px1B1MKK2N3AgCrcZa+KLXZNiB4DSDLlkzZpwmYqFrrCFqjqfJgwIT++T+qrk/VgvNh5K+aAYbOEKgYnh8l85uhgxpKDkI9uC+itDExJEzFwMFgvadyZQF4hiTjvvi7Hd/RbMg58uPWSHZAYPkTXCY6CHzdJZzVuISrDFT7XhG/NMYE05DDa0aOpAOJS5329kbRtL8vAVUeNDFiSAn7ML8Qn5tKRAPVa380Ou5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNXKEnp52uRueiUJgcnWmmc76Wujwd1eToYoXvRjUk0=;
 b=MekZ+cGQWg00c8QDKHVqW0L+WIC9EWT3meQnsNtg0N9w4ymE4xMQpOhfjo/paXZXjWByVty0npGlolDoQ0208BGLCgFpqezjs6aNKIv5brCdBmkgbu2bA5TQKtKqS/sCvQOSlicbDrPCLiZJnvdmueRWanJ5zPgZauPIKz+gRRqEWYooilwA3iC+RJTbVhtWWlAWjYN0zrDWV2Ilmw6KCO4wkgBp8uJ4ibZKCj1Q8l89cgave5BdwT9w+ypqjTPbPf+u9m2PK/wlKfxUUsY82SC2qG2wt9Ik1RXP1v/tuAVbzcJhm3Z9xohUBnEnPHPXubInDPdRufwTRqN3ytzbaw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 00:54:28 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 00:54:28 +0000
Date: Fri, 9 Oct 2026 08:59:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 02/10] gpio: mxc: fix wakeup_pads bit operations
Message-ID: <asg8VPKLBF0029na@shlinux89>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-2-c9f5a8b50df9@nxp.com>
 <asf2GpEfE9aE7FQS@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asf2GpEfE9aE7FQS@SMW015318>
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bb871b-8d17-4d09-bc1e-08df259fdec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|23010399003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TCus078vRTndavNnwL+n0oGOSiOH/Q/TpwU6Nj23Ivf1rHeN05hKy2BZSHqTH+RZw6qzlAIEgtCPBqd5d4w6IsmFHKdS8k1WJEroI1NxQLl/BxLftN0EbZT7gUoAAXByp8sD0mHuhhVKGgBviZRLUImIz2E8Zx5SisXbGQvyfX7CdSmKxe8qlVJTVD3nzvhMVsrTMNaud3nscWeedY3DZN+YcDRRT+2+OAzwkMGc8IqX1WDeLj60wnGhR2Cpgb7GBBLS2x//WoftHGJ8qeU+lGlyzjg44OL+Fr57cbCM5Br/x32IYr2B0hh8V2vpZ0dcAWC1bJAGANok4GrpClaS9VpZm3VQGeILq92K1xj3sWKTj4g/p7tluYhjbJ5UImZJDhJSCrMWSKoreZVB6fTXAZwupHpzweG5siYC+r+fzmedtM6Gnq0vNAVpaKC8EzQQJcIT/5EuvekR0/1w3zGBvTahPHTJAt9fI4LSqtI3Obe8kKMwqYvdv81dwCCPW/YU5ceMC9Fpc4YVEcvZwZmz1jpjoukA6K+dyhmjHFTd03dJsovKV/0PuVMIJYAepQN2ILMWdNhICOWpTu6inAR3gmsIaX/rPIMIbcAdd67YDAg2i7J8EfPTtotHtDKTlZay
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NatlUe1rT+nnFJp0NL66bkuK4WUbuqcRF3tcrVFNpZ+1zGQjGPxnbpi2lGao?=
 =?us-ascii?Q?9Dg3L4EjOSc7tCphulpAq2HHx1mmc77BHJmsm7NvgeOl41BH6uH3YwNvcAv8?=
 =?us-ascii?Q?YGfIH0wwAde9OAVS67yg7YA3KyPKo7u09lGMTa4iETyJTWEdTvKIj32PmoEZ?=
 =?us-ascii?Q?w4WK95++PRah3nESpgMKnZaMc+CXH1oFDZvgKOd2iq0LM5PJK46Qawme14zN?=
 =?us-ascii?Q?4ublr1QfMe6n3dnYlfeWs6ywEOkygCIfl41Vl1u9Rx6h0wrU1UbreosFzz/e?=
 =?us-ascii?Q?8cTpsrcaMK8jS9hqy3bYy4tfJRbFDgbLmEbLECGWSY6eZJcXSbM03a3kPAZ1?=
 =?us-ascii?Q?+noVxDuOiir2cI0ZYWlzJujjBccqN5QBGJxgSsJOHyyhjK/woq+E+D6TBROy?=
 =?us-ascii?Q?qleFXPAyDXLBIpzInxkmWfqG9uFIMlfPnoFhHYcMFdzHUinFrpPbuprEfNX9?=
 =?us-ascii?Q?co6kFFDdmWZfk/AnFv4npRcoqv8wx7vdZjmn0oVrWcgQuDO9ypr/rhTHX0cM?=
 =?us-ascii?Q?54u1ll+BIHismLukK7RR8bVe7+f3A5BSXK+R24ksxPNxIduYDMSmj5/A1B+S?=
 =?us-ascii?Q?95DiwmQKQ/9o2ABk3zYF8lG17EV9Nww48dQzxMcZecdkQi1W2OGNxumvcy8e?=
 =?us-ascii?Q?rpQ1OjMAeqKOwn5DEdhXthrZl/ufe0H2inv97E+dTMjwuW4G+/Z9VDtpXZrp?=
 =?us-ascii?Q?HbtwDKXvoHjq/o4oHDHEDT/B2haqt4gSM9TvmhGjnzdnYxhupao8wi8WJjwL?=
 =?us-ascii?Q?x9rnkF2nDrNdT4kJNVvNOzItVzOHetEjBJPFmdf287CEzqUjcjZ/7pirSD0m?=
 =?us-ascii?Q?GSh9gQOHc6r1c5akdnCy3hSv4VDb6EPp9CCZvpkP9shwuexPAc0UgsU5MyMN?=
 =?us-ascii?Q?Z5mvgSttxCUdByWkpzzF/bzA//BRyv8zJNBwgZYG8wArI2ecpSe8MvwbZfUH?=
 =?us-ascii?Q?0kEQna+yD64YfbZ+Byl75kVNHd62DI1c9uNtKrfGmb3+9jgVDLE30JPJaLx3?=
 =?us-ascii?Q?RqRrECoF9l8kvOfBfISrWxRhhAC18EfgxEL96i0ts6tKf8YI78e5FI0RgUXb?=
 =?us-ascii?Q?gt4Vdg0RZsYM96MvVpJfHE+8ho1meI0uBCCsCaXLnmwTFFxOE1zsO8Eemenr?=
 =?us-ascii?Q?pZnemDHf8v8tfUuxcibwz1d23RTIS6v112/2dbOictIUGmXgjfOFdWxRgSTf?=
 =?us-ascii?Q?CRiUhub8iGqwBRtZrK0u3LFUNKqbQctLLURMudVtH5iGWBzPSCFJaeQF4p8X?=
 =?us-ascii?Q?mBh/2yEn5wjE357PJj7eW+gZ5d1t6LePXPjezxTUOsmEzPIjcNvqmoI2aH/V?=
 =?us-ascii?Q?kld7kWbc8FyJuZj9rmYkbdyfdXr60Mk3z+E2VUkcPOqkKWo4OziJLCWpmyRh?=
 =?us-ascii?Q?KJqTgdAieBrzCjNW2f9rMLSjBBUW8clF8fUkk2jIHXqa+kFFVlob2knS517Y?=
 =?us-ascii?Q?4FP2yp0ETt16shZt+SpntPStgw8+rI7P6bcs9Eb487LaPaaCg8DUwbSRCZPS?=
 =?us-ascii?Q?mF46iWdFB/J+Zv/RVpOfCPxf85r9RfTxRLm2NfLMAlCbZ2pO6bZoY3kcpK+A?=
 =?us-ascii?Q?/7fkxPV4iauuF2tcRF9t8/3KVpyko1TsNVDUeTIoni4QDUfynxyryZwEf6CZ?=
 =?us-ascii?Q?EwdlYSuXtVSihn0Uz+bUd/lKHYJDBfdkjvvFdeTHynYP6kPVbisxEmaVQI2V?=
 =?us-ascii?Q?gZbD908S7ARiHMox13FwBThdZiwJgerYZI9JieoyXpzDmHs8vfbh+HLOQZK/?=
 =?us-ascii?Q?2DswS0XGcNAy1HSHPdeXVr5exMUeO7IZXhlbk9J7+ZZkcteiopiQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bb871b-8d17-4d09-bc1e-08df259fdec8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 00:54:28.0823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGyZrAvPgc6bfCZMK1u5zd74ADBJNa6yztvRc2rcqPTG2VWQzz7yCX3BgzT34/6NVFmYRUD+kr7GLWLaFSNBpRyTnOZcOKI/rdpJqpFUXr5oGOf3pDL71PUM065sRqT2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

On Thu, Oct 08, 2026 at 02:59:22PM -0500, Frank Li wrote:
>On Wed, Oct 07, 2026 at 06:44:17PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> gpio_set_wake_irq() can be called concurrently for different pins on
>> the same port, so we need to use atomic bitops when modifying
>> wakeup_pads.
>
>So Need to use atomic ..

Andy suggested: so we need
https://lore.kernel.org/all/CAHp75Ve+p6TMr7MwQw0orGdjxLgNBN8gfTw2SY+EKBBgCyYXgA@mail.gmail.com/

>
>>
>> wakeup_pads is a u32, while assign_bit() operates on unsigned long
>> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
>> on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
>
>is_pad_wakeup is not member, that's local variable. so should be
>
>"corrupting the adjacent is_pad_wakeup local variable"
>
>> Change wakeup_pads to unsigned long and reorder to avoid the overlap.
>
>reorder can't "avoid the overlay"
>
>Change "corrupting the adjacent is_pad_wakeup" already avoid the overlap.
>
>
>>
>> And the enable/disable path unconditionally sets/clears the wakeup_pads
>> bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
>> the bit on success.
>>
>> While at here, simplify the logic by consolidating into a single
>> irq_set_irq_wake() call based on the enable parameter.
>
>And use irq_set_irq_wake() simple code. this part need seperate patch.

Thanks,
Peng

>
>Frank
>
>>
>> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
>> Assisted-by: LLM
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/gpio/gpio-mxc.c | 25 ++++++++++---------------
>>  1 file changed, 10 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index e05f276a50e8..627fff6f1886 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -71,8 +71,8 @@ struct mxc_gpio_port {
>>  	u32 both_edges;
>>  	struct mxc_gpio_reg_saved gpio_saved_reg;
>>  	bool power_off;
>> -	u32 wakeup_pads;
>>  	bool is_pad_wakeup;
>> +	unsigned long wakeup_pads;
>>  	u32 pad_type[32];
>>  	const struct mxc_gpio_hwdata *hwdata;
>>  };
>> @@ -325,21 +325,16 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
>>  	u32 gpio_idx = d->hwirq;
>>  	int ret;
>>
>> -	if (enable) {
>> -		if (port->irq_high && (gpio_idx >= 16))
>> -			ret = enable_irq_wake(port->irq_high);
>> -		else
>> -			ret = enable_irq_wake(port->irq);
>> -		port->wakeup_pads |= BIT(gpio_idx);
>> -	} else {
>> -		if (port->irq_high && (gpio_idx >= 16))
>> -			ret = disable_irq_wake(port->irq_high);
>> -		else
>> -			ret = disable_irq_wake(port->irq);
>> -		port->wakeup_pads &= ~BIT(gpio_idx);
>> -	}
>> +	if (port->irq_high && (gpio_idx >= 16))
>> +		ret = irq_set_irq_wake(port->irq_high, enable);
>> +	else
>> +		ret = irq_set_irq_wake(port->irq, enable);
>> +	if (ret)
>> +		return ret;
>>
>> -	return ret;
>> +	assign_bit(gpio_idx, &port->wakeup_pads, enable);
>> +
>> +	return 0;
>>  }
>>
>>  static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
>>
>> --
>> 2.51.0
>>
>>
>
