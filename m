Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE5386571
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889616; cv=fail; b=pmmwq9VjihErKZA9r+hCQG4NAcMaeJD8EuuNaQ4VbHNu7w3QaHaccbSYs5vnaH6cgtwnnHulKcOpPGjvNkAz7rVALV+RwWbNRlDgyzfELIvlu0Y7M/CoE6GASM78/kmJ3ObsBkEvBF43zgsgdtOl4/AT/z8WlibQCv66wqRvVAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889616; c=relaxed/simple;
	bh=ifHdXaXz+nw4Ozlk99u29KCWm/xJ0x4ZPPD1qc2zK3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SqkThF3opJKeibo2vkqof22fhiQGpsagSEdkQrMB5jTSs1V0DVjK1xVoMcXRTGWe92PpoZhyW8eiKT5f6z9mNy2DwS1PAu9G0bXxjHOf+Gzvg+5K2+NLOCWZEGV3MPNDBZaXXZmG/VAXDfpenOg4O5fGPuziTVLOEOCpKOa8bU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ETxUUKMZ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ETxUUKMZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TogCq98tk1AXO9CsV2ozdEV3e3JK+HTOoxpZFZUquDU4WCtKmlW441vXb4rdPKsaDOIs2wUMez+aRWFrTBa9aJ8xm3ggmxRj0MW5PSy4W6+4sYFyNROczCeQVj+piH4uEUqyyaWPgiHR201oGgMoYKm8f3/YTbbHftP1z1n5fpq1aN3pYPcOIL0zVHeJlwmR6WH/qelDZRr3+5FrbMEc7IXUt8aWw4/zYWAje7B0r/+t0liv1oZ871XDr0tB/+CfPM7tF7rr0zIkX+M4ct18+hXvrvKibEqff7I3rSvP7DviudN8T2Dw2Kot0ELEvlpfRViVdnv+HVPwDE/zSMfEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPWJmqVorznMd75DhJyBXBx8g+JuPfiFX2877B/SDNU=;
 b=tOwcGnb6MbJ4wKL4ANIPSjWRmhtnLayh6C7Wy/VVhrx6wcyaRRLn2b0q4+j9l4w0a4+p40fF4ECMjX02RLY6jw6MRtjl50W1Q6HWfisdTdn4f4MK9ZD1xaf7pjYIYNNVY4htWBocJ6sX1DJtSmTxwRxe1yEbG7GMAvLll5gbo0c22aB5J/JsFXlA1uhKO3wiZ7tUNPZkV5MLHxe4curDOwUtuvWLj0eaqSCO7fPzipLQSjWx/ik8dV6LtjmYibeMoNeDxLT8IXP+vj7SWpzmJJIE5YQj3JiuUHwQz04ns4/iXbODZKZtlUIT053hdSmo72HDczG98Fag5Jk1mLKgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPWJmqVorznMd75DhJyBXBx8g+JuPfiFX2877B/SDNU=;
 b=ETxUUKMZ5QKyWsy5Jh7z+15/mbRCMbGL7i32u8zH9YfT3HAh6tuNGlBE4QErNQdkwK9jpopnvcDMvB7LrzpaZP7rloUg27mP5bUo0DKzFwSUpJOj7J6Ew9IZH734h+Wd/NXZ2sOfd/YRUyvoUYk4CJKTVI5XmqQ2ySBBRvQZpwNbzX98gnlOsCq69PlyTK16ES/Bec4AsSbnIneRwgj31myXvaLl7meyC25AKlhVkmQxQl4MXzky1dy479pjtNZ2DIVCZpd12y8o0lpKG1AL3lioPoYZakPy72TQ+03Lovgq4AWlbvKXWTQL2SrGQ6kL0nMXasrJwHqfvDD86xOjlQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAWPR04MB11647.eurprd04.prod.outlook.com (2603:10a6:102:509::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 11:06:52 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 11:06:52 +0000
Date: Tue, 13 Oct 2026 19:11:27 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-bot@kernel.org
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v7 3/4] gpio: mxc: fix wakeup_pads bit operations
Message-ID: <as4R31FJUNlnqdOX@shlinux89>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
 <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
 <sashiko-outbox-169107@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-169107@kernel.org>
X-ClientProxiedBy: MA5PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAWPR04MB11647:EE_
X-MS-Office365-Filtering-Correlation-Id: 80265f5e-1765-41d8-823c-08df291a15bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|366016|260925022911599003|260925021911599003|260925021311599003|10067099003|261009223027099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WSXxQFlCJKMMNqQbwN9cdkqmNCBPqwKwqVJQjDXVvpgYvC3rGg65bbgFgaZDg6AmqtofXUkU8jU+7hnZeKzUqz5ituV/IDXBwvRfZVv2g6M4alcPBet3PGLoqVD+zf9arj2v5+3Lk+AqoON12DUDcGXjd3bzk1ygZxjEY8ZejX4ocTcwjjte4UlnMPnPRf4YA6COakH9zjS1T0Z5odBlqGuJZXmv/9plrqAryyNQTG3kqKpcWFMzxqjrSUvB1xE6BEuv6azpdEQO8DyUDd4jW/X7Uq+tR77ZCBetmHGxeA0sZJv9CLds1EdT8X7359+CCctKfnG8U5QzOHwkUYwhBVpGRSNZe4wTJhuDx7lOK0JxUEM5SxyC5O+/TyAO71PTdPX/IU+yzTqNN9Pk1gKTif1zO5Dshk229qMxE+TWTlBS/tLxPFRIaBL1GqnnQt9cR7mRCBh1HRtSrMP1cgUOndauzedc80+DB3XRvfPpVvzc+xiu4HY7aIDJXSw+GEMwe78KJyUmqjelTEg4Ve6h2GODTdjen02gbLY383EjOn95Dd9y1AogZpsBMLXmdIkOgVFUu7s4f2ZccgDrDHRVMJtv9F4fOaNAUk+ZuK2Ofy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(261009223027099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ArXsVbem89ESqmmxMnhnQbO297vRuLVWnjQG9PfYnpBP0h9If7Gf+Gby3v?=
 =?iso-8859-1?Q?VIQhklU4G74jXN90RcPixu8JbWiccgsIf/ovjqCPcsXLLd2S7bpm1peTeK?=
 =?iso-8859-1?Q?LMR1jZ33HSyiI06dpKw6bNE+y5kSld9YwYFSbgsORQe/HFefxiHB0k+RRX?=
 =?iso-8859-1?Q?vDNXFFOzgxtwHX33sOVdmLpR43p7ekbFjsyUJYTKJCSi2GQ8whn8ob1y8D?=
 =?iso-8859-1?Q?hftB6igcqhIfLQOdpSQKRy/qE3aPV++TUuFuz+XO7WkXkRVrf2LZ0aIoLq?=
 =?iso-8859-1?Q?Ds5qd05M48da+qj2Nula3KG5I6EmuC7l5rqrxzrrUId/uoBMqMBShSvNOU?=
 =?iso-8859-1?Q?kz+ainfXa1UpaZyfDdZQXySpdsuAdhAfVmeZxzkBzPtAqB3r1FUx4FLOsG?=
 =?iso-8859-1?Q?L1xql+6IY5UZrgd0gnBqYXLHmk3m/IoqKGFshPtk74fISy1MUQjRwv8YI8?=
 =?iso-8859-1?Q?Aq9sVT8Y6LjHcZnZdONqQ0ZOa+j2hcxmYsSggXp8AxDNsuShmaQOEBWUbM?=
 =?iso-8859-1?Q?01q5yJUaFaJ0FR/0ryoP3XBrMdsG0br9yn8+BGeUvHE3r6I9zAcE5QvLyj?=
 =?iso-8859-1?Q?R6Vz7IgczQA4nWNr2+ZaN0W13hO6qwvHFzafbcIhA2yx5RjUHcQ70C529G?=
 =?iso-8859-1?Q?Z+4VsjGchsFwyTamHBi23xutMPUQl1SXIrXfmWjSPXM8QDw9lKtnZGluHV?=
 =?iso-8859-1?Q?pn/rerMuL7XAFeQ0k+zazMw/ikTzlI4VZaldG2yis/qCQ8LlCX+Ct+WWOE?=
 =?iso-8859-1?Q?bz5UCT651zdhry6X7+cI8FqzKHC1Vd2JOHYxjzzZeU7euASOakqewd4Phm?=
 =?iso-8859-1?Q?JpBPQ0tyZplJKnKvBT41TVLwGtahSMLmZCR7nwXnhHRdX1TbtSv1F8w/XI?=
 =?iso-8859-1?Q?uB+yeKMvi+NrT4IZ+KARhSRK2NXWMLqMks+9So/8mKeM3rhWL88jkZtRJr?=
 =?iso-8859-1?Q?rIUjcpngfh29Jg/KG4JHBg6rw/NlrKq49wIiwRH+/SzpDCZx0PKhgTF/+p?=
 =?iso-8859-1?Q?hhUCL0LR+L/DEFmjd/qn1EI7BvRLVdZn7e5tRqrxp+uRKQoJAYMcaFq3fE?=
 =?iso-8859-1?Q?IJYY4RxgeJzWvO8LXA5Av1qo+//n5s1myKz4dM1sZ8Hyc32Cg3YoxFxYwc?=
 =?iso-8859-1?Q?0kT4rrrsbn0Gi3KUAWMO4gj8sZETU9pyCnNKIM0OHmVf9tY5wokTkcC0el?=
 =?iso-8859-1?Q?ffKnDdM2NjETif9GqAADVcOCE7xTcjZS6KBlzu+msQqfZryNDNHEHzv48w?=
 =?iso-8859-1?Q?rt/fNo7+iEfqONhi+wtHLQHqQufFEC4tLKupYjfecUZ3RauWVztff8dO09?=
 =?iso-8859-1?Q?+H8SUhntmoxAMWH7V2gIXmIsFeMyw5RwY/UXuU9qqHIm3kr+tuMYAfFuBR?=
 =?iso-8859-1?Q?AnzDF2lU3qZqS0CejHvNczZjalqOCrO36o66lO8VdLouSdMFt07p/p8VV2?=
 =?iso-8859-1?Q?wXY49qJVS7EsvCsVJnJx5JOjJUy0dSTuieXywrX6gedJS35pCTcF0NFZDy?=
 =?iso-8859-1?Q?gxAr/I8/ycFkR30sC91h6PqLHLDlIUHYc09jjjqWWMkR7Yf6YHAN4rQ/ea?=
 =?iso-8859-1?Q?iCYGXnKcOM5LyI6iH4Tl0z5oX6ib+keBFPqNGCrO9hyZXtLo0FdFw/V7YK?=
 =?iso-8859-1?Q?ZU9l7K2SP5eqT9W2FyAbMLuZkHM6L347iO+xyNBgAFQPiVnKRUFAHUq7Q3?=
 =?iso-8859-1?Q?u2DofTKeSLbtH2a7VxEqH7yz9eB7Hy4Sopd1sAS3UnjbwDwOwPZqeCo2fc?=
 =?iso-8859-1?Q?AhHGUAFoEuAMqU7BfGIlFbwHlKO4iVSPq249pSf7ootMyY6m3wcv0zslZB?=
 =?iso-8859-1?Q?Vxdot7I/M+3AImky5set72cgPLIXLcxDLxJtYwgVdWOyqkygXKoq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80265f5e-1765-41d8-823c-08df291a15bf
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:06:52.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHrNOP8FTvVj36SQR22Nl9KYEq9IecGKMTs8hrzEpuWa1HzByHuJgKJYngHQ7JrS6At1d+cKPzmRRyEYhrodYdUJL8n5bYBvizh6i71tEuaynmmYIONi62O45BBJI24G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11647

On Tue, Oct 13, 2026 at 06:35:07AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] gpio: mxc: missing for_each_set_bit hunk and sign-extension bug
>--
>
>commit 163a0b84d8efa779538111b96ea2ce2543fbd9da
>Author: Peng Fan <peng.fan@nxp.com>
>
>    gpio: mxc: fix wakeup_pads bit operations
>    
>    gpio_set_wake_irq() can be called concurrently for different pins on
>    the same port. The writer-vs-writer race is the concern: two concurrent
>    gpio_set_wake_irq() calls for different pins on the same port both do
>    a non-atomic read-modify-write on the same wakeup_pads word.
>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 7e17d7668980d..e3a80f17d0412 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -72,8 +72,8 @@ struct mxc_gpio_port {
>>  	unsigned long both_edges;
>>  	struct mxc_gpio_reg_saved gpio_saved_reg;
>>  	bool power_off;
>> -	u32 wakeup_pads;
>>  	bool is_pad_wakeup;
>> +	unsigned long wakeup_pads;
>
>[Severity: Medium]
>The commit message states "The reader side (for_each_set_bit in
>noirq_suspend, wakeup_pads > 0) runs in noirq context", but it appears
>the hunk that changes this loop is missing from the patch.
>
>Because wakeup_pads is now an unsigned long, the existing loop in
>drivers/gpio/gpio-mxc.c:mxc_gpio_set_pad_wakeup() has a sign-extension issue:
>
>	for (i = 0; i < 32; i++) {
>		if ((port->wakeup_pads & (1 << i))) {

The code will not incur error. for_each_set_bit() patch will be in
the following up patchset after the fixes patchset.

Regards
Peng

>			...
>
>On 64-bit platforms, when i == 31, the 32-bit signed expression (1 << 31)
>evaluates to -2147483648. When bitwise ANDed with the newly widened
>unsigned long, it sign-extends to 0xFFFFFFFF80000000UL, which inadvertently
>masks against bits 32-63 as well.
>
>Could the missing for_each_set_bit hunk be added to resolve this?
>
>>  	u32 pad_type[32];
>>  	const struct mxc_gpio_hwdata *hwdata;
>>  };
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com?part=3
>
