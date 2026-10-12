Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C7B3AB498;
	Mon, 12 Oct 2026 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798884; cv=fail; b=CwF8LkPwujDVhaSE8dnwPZUetVxX86UBaBw4cZ3lUlwIOM8C4VJj0mwxMMGHsn+4jtTf4e3ycS724wEWgd9GzzbEPXF/5Mm9rTqake4pz4GD3LHYI0QL0fvvSRun3oXhQrhDU1fhdQRe0A29vJorHL+OpIUK/qGhFBqXXpVpGDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798884; c=relaxed/simple;
	bh=aiImPFXdD0g4sBl5oY+E1KbchgA6F0u4SDs8iCeTVjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OGjFBmBhFDOBPR+vpTFZ3bDBpnWQGzZglmhRjLaMMlfPSnC9m9XEzaLE0nbGmim0gLOgM1dydD5vpmmeatyvLwgjEszOexIWXzexmeEzQynLMY+/vg1sXlDfMVJtLEKIA7dHBM4/32azwfF3m2blQ+2OSn6GcATXJs2iZ/9YEXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mnbsR4aB; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mnbsR4aB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhSAXvhBv6w9/jPa3hGbApCMOBVp3K/td2nQdLMd/V+qmJ1qMCw7crdm41hAGuQKXubKbtteOmtlcVgLTVzSOUe+pUmxbhmf+5I/QkkAZY1YaSodCKJD6bjUbQ0bF4FHYZjpbbdoA1sNWQdZdKOdDtF0QE3LPucZdpuLChBaGbFD7gS7U67phkxoaTXMx14Cj0fuvzWGt9JcTrssAKnl9sVj+8qhfvfvEs863FNMGM4Jb9/e340LADI4HjIkIZ7+8NXtlWB6Dt0zF61pkrz5kFtfwxA/1g5tsoYdIgTzr/oAoB7PH+Ipp1aFxtfK8e2dzTkRNpE4VzxCjhQnic4IJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSW+R/UJ9EQFzrIgdGcYnmm991TVwnaPPJOaz17NMcs=;
 b=QbwoBuOrwYPIkISv/ffX09tREj/z7BtIG4bmg6NeX4wCYes4Bpd9fSnyPSfexumc5Mz9GzHu/6IMTdYW4WtzT85KmJL5pERDTLx8CXatFPPPO7e2a4pEG7jtRpdrMXbZv440iUwVv/MY5N3XDwjuoY+SrbmLUaPjJMIuqYeNnzSJLNyx5T7zFsJMEofEfSf2BHhS5qTeCcYR8CZtY77JHOZ9l/Vl9S1ys34Udt1Dff4cJjwhS6HoIwj+Uud5ta/wkjg5Q6zXfVN4jYDZXCgl0uRnw58/KhpOtFHVZWnrmXL48xMYUz78uRaTq2I8C+d1xdu2APDoFlQePvuJHpKBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSW+R/UJ9EQFzrIgdGcYnmm991TVwnaPPJOaz17NMcs=;
 b=mnbsR4aBJWJutueRS/OTQ/fz9rkxpzdn04OHyZnt5l44j00TAJ9qNbB/QIPcARJve146gfcwCDFklkD++C1XGvpC7wLjPqAQ6LGDj/59nqJ0XVQdvJean2SX4+zOj9Ow9O27ClN/15xFZ20igXdYmUtK1J4HuPnJcfEuwCQyGofoV3sikmvvo0wXhbDtTKKPPycrWdZ05NfV9oBrKaMX9bKUSo4FxUIOTsU1urIMM47QUzH/wzkr6eOdxMiExgPXxCxgG6QWRSBP/OLawgMzIqot/mEYX6Kr1eXfWZzo0kAUdhV1cI5j8pSw3vya2ov2gmOM+PtfLoxXk0NdWV+sXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12192.eurprd04.prod.outlook.com (2603:10a6:150:338::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:54:38 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:54:38 +0000
Date: Mon, 12 Oct 2026 17:59:12 +0800
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
Subject: Re: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
Message-ID: <asyvcJxbM5aD8pzE@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
 <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12192:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1ff4c4-f3fd-438a-8e20-08df2846d43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y66zJWDUmpgo5P1NpSBZCGUNYrR8EYM4x42gcB9tifY9EOubhT8vSNwO0n5DMLTi/Da9s9AvKIaoaD3xQegQ7YvSoEwpigTQ6MEWzTYPwcr/2txBcmMEMOf0xGSx1Um95zXeKXD7eKaaIVvmEeEgkcBTWbEpWt/bqZ5EYklFtWQ8+gd/bX/Ux2ZtShXkXbXDo8db5fdMYLep9pQhDCQaiDYiwpjkFnSnVuMX7nddaaG/1gXlvEf2vtfi4/GaCfvnnjM7vBTxBpN1O/V8fRnhutjNVnIURdjUNmxAWS/R16MwNzhnOuYX/j5yfTuhflHh6rMbKQcPAqYzqQ+hPteSpH3ZY98KiOfAGSbUXFJugQ7wV+GNHDC3hT5uBzE+nN4khPsN0o7sQwotnBsl/6oTm0apRjv8Y06BtfiQe1ZLWzgBBIbVCRsksr52zOpF225Y+Au+QDDOfLTdmbfb5x+zXDnjgvlwtilMQLIo7QG1xpHMtz53O1cwbRgloMcV9E/3cE/GTt1gI/y97vRcFtq4Mr2cSJPIBWQ10XSOLZkutFnLSeWEL/h+XLxyFFGunBQTGC9i9kphw0e+EbXj7q7q3Gm/jY7uQIGSppii+Ll7tCdfHoH/cx4ZzT7WMDM55ADqyMMWoOFMqdbb1CJgKgSs4PRIUNeGF7R92hm/MEu94g8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTRHOTNkcTM5cmNPWVU1MXE2NlY1QVNwMnMzYk5WYms4eDhGSlJva2FKZVpY?=
 =?utf-8?B?Rjg4eGZoM3lHQmVpS2dZSkRzem9DM2h3VE40RHFWcUtMU3ZscGUyQmM5d0M2?=
 =?utf-8?B?aVRQbk5VWFcvb3QrSCtyekt1clk5SGVWWjU2Rk1OWEh0bDR3TTQrTEJFbE1D?=
 =?utf-8?B?ZTE5Y0lnRFgwMUE5Q0N4L1loRUFKSk5MR01vYkllVWs2YjRQTnU4ODZGZTkz?=
 =?utf-8?B?aHJiNXBHU0NPR2xjNFJUbTNGdTVlY3pRaXZQMGV3aGp4R01QM1ZRVTR4akor?=
 =?utf-8?B?VzJmQzVFYW4rRzFScnBwVG1GbGtxOWtuOUJKVjRsSm9JaDVha1NyMmsxOXBG?=
 =?utf-8?B?VC85Wkh4TnZkNDl3WHRkWFA3KzJyRzR5QjNwNjZndGdQUm0yeUQvZXN2SU9p?=
 =?utf-8?B?ZSt5T1RLVmJHRVVCOHg3NkVyQXN6eUhrS05GbVFmbGhFV0pYc2VGZS9ldExE?=
 =?utf-8?B?aU96dVRzdkNGMjlzN09MbWVqWWNraDFqL3hMYTRWRlVTSy9IWnoyYWgzNkRQ?=
 =?utf-8?B?Y0NlUldwUUVldXdQOVhoc3JCaUh6bkp6YkZvSVVlajBPdjJ6Y05qNTBIWGow?=
 =?utf-8?B?UFByK1F3VEpJL3NvVWQyTHZXbnR2RkxCY1JFbVdKbmV1SllyVTVPNHcvZzVl?=
 =?utf-8?B?VHR0TFFBd3JaaDhrby9xYXNMelNBb25lSXpVeTBmUGd3SWpMRjJZc1F6WUlx?=
 =?utf-8?B?cHg1Q1FhMkpGYmljYUNoQnpablpmblRmVDZlbTVpYWp1d2ZDUkZoYmNUaWZr?=
 =?utf-8?B?YXAybWxFdGVCS1ROKzJwM0JXbXc4dGZrZTZTQ3BnRFZyeEs2VEVXQU5nbkhQ?=
 =?utf-8?B?cVRwUkEya0dIb0QvK0k0LzFFVUhMMElsZWJOZnlsY1BuQldHbktYbVhsR1Rj?=
 =?utf-8?B?c00vcys2Sy9MM2RYNmp3THlUUDdNTjNjZHo2WU03REU4Y0xJb2wxQlBEZmZD?=
 =?utf-8?B?MHM4bkxvcFdzaW83NkJLTzRtcktUK3BCZlA5ZExXMlgvZlhlY0lRNUhMT0Fi?=
 =?utf-8?B?TWg1a08xZWcwN00valg5VFE4aXZpUFdsTGNPWjlaNGQ5TTJHd1JJZkh5NWpq?=
 =?utf-8?B?YjhvZzJuVGtoNm15ajREQWp2R01HYUEvUk05dWJ2enBNS0VCSitWU3ZQOFk1?=
 =?utf-8?B?U1RMY3RTM1BqZUtEQVVLeVVhclZSN0VJNjF2V2NJTVI0SnpKQmR4Zi9iM1Fm?=
 =?utf-8?B?YzJ4cVFQdjR1anNXbklkZm5SRklqK3JLQit1Mmg5ZTY3ZlhXaGcwTDgxclBX?=
 =?utf-8?B?VFJMUXJCQXllS012VmlNWEJUVnJtVWxpRFRrTDNrYVB2ZXVGdWlvMVg0ZS9X?=
 =?utf-8?B?S0lSNTJFSDVlbUx6QUhOQjZvZ2dDREM2MHJLV01qUnVNWkVJM1Y5Tk9OZnJS?=
 =?utf-8?B?RFhraHFGclF3VkFVWlpBVHg2bWpjempHdTJZdC96VXk2SnZRNlNhQlhyVEli?=
 =?utf-8?B?Zk9udHlBdXZ1cG8wQ2MyTGhwRmdRRjFFMzhLVGtQNnRTYmY3YzVsVDJ5UHkx?=
 =?utf-8?B?MUdUOXBNQW8xRWJ6b2NCdURtbjdwNG50ZVg0bUdYNFpITlg1Z1NzOVlxanNW?=
 =?utf-8?B?NEQxY1QyZ2RRc2dMeUdzS2NKanVBTE4xMGQwTEdDODJ1dFhpSDk5Rk0wQzBT?=
 =?utf-8?B?aDg4cVhjYXgvU24zRzI3NTAzK3JLbjRTUFNzbytQZFlVYm1nRHU4ZERmSjJG?=
 =?utf-8?B?ZDVZY0JVS3J6OHE0cHBmc0w3ai8wbWs1cGRjbGZtNS9ENDV3MDRZdXJraFl0?=
 =?utf-8?B?cStzSkwrU2FjdFlOK0Y5U1RnMDRGZnJCMCtZcDlJbzlXenpMdjY2WnFiSnQ1?=
 =?utf-8?B?c093MitteWcvb0dTZXN1dVM0MUtQRFRCWTlOS3MzNEwwME5jQVFYakdlV2M3?=
 =?utf-8?B?MGMreWNObFRpWHJIUFpIVE1oZUVUNjdRR05yNitjQVlUaVNYM2hIT1l5R2U0?=
 =?utf-8?B?cC9qSEJrVnJZbHRJT3VUOGpybXVXMmZxQzdSdWFGVW84d0ZrUlVSUXF1Yjc4?=
 =?utf-8?B?SlBMNllKaGs5SkF3T25oM2RwYjJBMnowYjlPTXZYeGltNDYvR2pySlpuc3JT?=
 =?utf-8?B?eXBqaGc0U1IxKzlDUnNZWkJvL3dxVVk5U3RVMkxKUVdDOFAyaUNvS2l2dEIr?=
 =?utf-8?B?ZFN6VGdIZWZYeFpvZy9KK3JRUEI3RFFId1VRazUzZ1lFRzhTb0hMdmJDYXJH?=
 =?utf-8?B?TkZsV1VScFJwS3FRQzFKS2pySTd2T3NvamxrcXd5VDhjZ2xmZ2tFTENyZGxC?=
 =?utf-8?B?Vnh0Q3JCekVGOGJUK2NqRm9MNC9vVm5FWm8vVkI5TG1uNWxKR25pSGhvMXFu?=
 =?utf-8?B?R2JTNnZrOGJuUHRsSkpIUEpDMjJ6b2V1cjc1NklQZHBqL2JQZ3lkT25iMkVC?=
 =?utf-8?Q?uwWFWn9RC85MNGNE06GcHsg3qNb2oMrOoH72N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1ff4c4-f3fd-438a-8e20-08df2846d43a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:54:38.6221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZM+kypJaWSeiRM1foeQCf5H00hmX/OZ4W4jyinHraxoiUXv+K9qqxsrXvl7QcgqsRRMYQPkCNuZ9oB9LGFrTR8NMq68RXibhMGSmmdqWOlBGtKbi/2cNPFOQ+B1Z5I1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12192

On Mon, Oct 12, 2026 at 12:25:41PM +0300, Andy Shevchenko wrote:
>On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
>>
>> Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
>> with a flags field in mxc_gpio_hwdata to move the power-off capability
>> from a per-instance bool populated at probe time to static per-compatible
>> data.
>>
>> Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
>> instance that carries it, along with a mxc_gpio_has_power_off() helper
>> that replaces every former port->power_off test.
>>
>> While at it, factor the register offsets shared by imx35 and imx7d into
>> a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
>> initializers.
>
>...
>
>>  struct mxc_gpio_hwdata {
>>         unsigned dr_reg;
>
>>         unsigned high_level;
>>         unsigned rise_edge;
>>         unsigned fall_edge;
>> +       unsigned int flags;
>
>Obviously you need another precursor patch to move from 'unsigned' to
>'unsigned int' in the whole driver.

Could we keep as it is? I try to avoid adding more changes if not critical.

>
>>  };
>
>...
>
>> +#define MXC_GPIO_HW_DATA_COMMON        \
>> +       .dr_reg         = 0x00, \
>> +       .gdir_reg       = 0x04, \
>> +       .psr_reg        = 0x08, \
>> +       .icr1_reg       = 0x0c, \
>> +       .icr2_reg       = 0x10, \
>> +       .imr_reg        = 0x14, \
>> +       .isr_reg        = 0x18, \
>> +       .edge_sel_reg   = 0x1c, \
>> +       .low_level      = 0x00, \
>> +       .high_level     = 0x01, \
>> +       .rise_edge      = 0x02, \
>> +       .fall_edge      = 0x03
>
>Why?! Just to save a few lines? This makes it harder to follow the data part.

If I expand the macro the imx7d, imx8qm, imx8qxp hwdata, 24 lines will be
duplicated. I would keep as it is.

The current hwdata as below:
static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
        MXC_GPIO_HW_DATA_COMMON,
        .flags = MXC_GPIO_HAS_POWER_OFF,
};

static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
        MXC_GPIO_HW_DATA_COMMON,
        .flags = MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WAKEUP,
};

static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
        MXC_GPIO_HW_DATA_COMMON,
        .flags = MXC_GPIO_HAS_PAD_WAKEUP,
};

Thanks
Peng
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
