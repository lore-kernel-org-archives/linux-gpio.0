Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AB74718C5;
	Mon, 12 Oct 2026 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799004; cv=fail; b=ipnJATU9ElmCU3aQwbEWRwotRpnB+TMUBzPOVtEszowk+ezYxNNdSAKLT4EvXL0JLYS3CCSax9gGa11zfssJ3WzoTu3wG9PfF9NguHioLhGgTpxzZAqobq0gfiWw46fVNIO8wt+XEKLHEQgW8sZy90BB60bcKwkt5DmuvRDDsm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799004; c=relaxed/simple;
	bh=dkC4z/LWKUjxR102bN9b04iHyN19QYf5OHF68wV2SMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EQh/+MJWp+qxR7+8hi6xz17PW83d8XtwZNZpNxxA+KmZb/2QiezoIVXyJAI0kUo06VcEqPWzcFw6kmrqZtorBfymhMyGI0hu9VrP084QKLQZZRRn9vdLvWS63nkctK0ZI2Uy5sDh0HuWCGDZWv8TTf5mQGuutQlQX7ax3hiBleQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IEPXYkpK; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IEPXYkpK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ajt2lUd7i+WFoN9PAC/+vA6NyEo69c+c1KkEj0hWS93O7typJ1CStqGEC49G4XFdmk6IOMVWX0fYIQ/KJN1/Imj6llJcPvM13tfGY+gYET7vjCZ+EqyWYyvaKq3VxQFgTDMm5cAdLYUsEktGiGI2xNGDPyDsYcP3UUJulMXXXny8uVEYVaXIYeUzV3i9EN2ZMuvZPjiAUeQa/zSQY7rY12MogQjD3Br1nxDOSu6qPneqMHrshWaiigKN5WAcQGQIGzZe4jPLcDVi9c1VQSREAhx7s5dOhL01HyeaGad4fwBYKzw15Z2SVm++U/yvP47d2gkA3uOk0TYmMD9S+SL4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hb9EX+cSiDP0Fz60f61+uibE5n7UvfM0bqANFfGio4=;
 b=j/nwPwsg+w473WR6q4yM2ZhiPG0T+OgWsZM+5t9F3fj9E/UsLS73qjgklJFC6DY2xYjob1ZENs8YcHlSzvdkaDWDpW1gN4DrKPMGEcbtLubCPJiQswbFFN7Dnv0VCDIq2R3xFo6C1SM1/k5y4Dcozx60Es6mqeauAhnlvTZhxbVilfbObflLfQPVxc7RK6CHieWqkcdi787NUivnz3zWNztPyZU2EEN9ifYrZk7r6XEmJ6zqnsH0M7yRfEclFaWVB2XaGGUDGQphSDjbsAoAGxQt4ul4HdFbshS2bo6liplcvOyJLf+GdO/66HFjMsaxtVuBvleP/XcAcwF3smyE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hb9EX+cSiDP0Fz60f61+uibE5n7UvfM0bqANFfGio4=;
 b=IEPXYkpKv6AEQCSXBKiXRsmFhUK2hTJ2IUqGCTR/nrykE83tIJgoDqw0wsbWv4ffXAb6gv+PgJi7ytK7HNinLqcmQcfGEEp7cUGHfLJEyi0Sgu24k6+iycMIObbxcXD52wz2phw5DkEz/hudSPcJSyySW1m6sf3d4HlXfymiIdj7tCY23Vd9a7F/l+H5WGmd3gr0F2oMF5SkLcIgQng9l2vFHQkYAa0HRrLQpgIG0I8KFtg5UEdyglL5kWTWFwlMwNGhaVjl+kEk6NbTxaGjOeTQB2QNNK/kC+WkX85fDB1hP3GebqyGzPhsG2si3bTTYPLjruiElRqsS/LsyUJgYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MIWPR04MB011266.eurprd04.prod.outlook.com (2603:10a6:290:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:56:38 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:56:38 +0000
Date: Mon, 12 Oct 2026 18:01:12 +0800
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
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Message-ID: <asyv6HK0c0VnpKp+@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
 <CAHp75Vdkh50W7j6oh9mg=DqyNu0ZZYX-aA0goqW+Knf0MmJ1ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vdkh50W7j6oh9mg=DqyNu0ZZYX-aA0goqW+Knf0MmJ1ag@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0275.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MIWPR04MB011266:EE_
X-MS-Office365-Filtering-Correlation-Id: d0490f53-432b-416c-e124-08df28471b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|7416014|376014|366016|10067099003|261009223027099003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Mem/q7bJ6Xim2NtIE59FcUIV21RsbX4CuW/Ps5H/AC13CEGuEGgmH5/strthtKuCq+zEtFeh82VBvgAwzctU+STkIQKnrnYtiWJkUC6D8V/1/dp3lqQa5PwTKIDoDGJT8bAS+N1/qGY0sOQsNjAXq68yYS3pgEYvzN4g76822wX44KXL3IkfR+3iiDqGrpKan1zqlPwi4dShkY08EnVNY8skpnVWevRLHc3oeJtsUdQl/eZXCG7SlwqHY2AzGJrkkwcy0IXkY3FR45JIJeOSba589s/5AlAMBE9D3aio9JPgktQW8sAncwbRTzKVkLV3CoSGgEUWC3a6cvGPdWX/jG6e186ER5FeGLFwx42wL+aTVqbchb2IPr7BB5e7lEjWOoZOLcnVr37fERxE2DiBgauk9sq7yP2VjzCCctcRvatjjamdaMS61i66mwaa9ClLOg+dnka6JclidnLnV8WVjEYmB5bDoWGnQ7AiaAWyT3nss1lrcNuZUN7ac2kOjM1qT5pQs+kR4HwgJqchV12zSTsNnSgE4YXQ5j21BDTkJJgv7jkArbKWVOzBL4EeH4EzDKN8Q5wa5xJtxQhd/cxfWRO3KcNTWW5z0LJdg9IiOK8dGqJo3taa3vBjOHCu+4wMVqFruKrKXOA7cn1gfYCPlE6xdZcmVRAi+UzCKwlnHgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(7416014)(376014)(366016)(10067099003)(261009223027099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2Jubms1VlczZ0hKZkVOOFJ1NFlJa3lDcklXQ0RZYVUzbFpQTGJzdy9QYVhR?=
 =?utf-8?B?aVBwVTRhUVR6RTN5N01jdnh5NVdnelo1ZTJyTUsvSmVIWm9XcTk1dlNaWjU0?=
 =?utf-8?B?MUpSQy9YLzdYb0piMFNnWTgxUmhUOWFvL1VZMEllc2hheWxWeUlhbmsyZ0Uw?=
 =?utf-8?B?ekhLQWpVK3drV0NOaGZqVUM2V1o1NURBWTFUcnlTbjlvQUsxdkhYVFNUamtG?=
 =?utf-8?B?MXlGRTUvcXRYTTUwZExwVW51OWEySGMwUWtWVk84ckJ1WE54V0NQQXlsaXJ1?=
 =?utf-8?B?aEdOMzRsSlNaVWt5ZnhFM2NDWkNSWVJvRXo4L1dnSVJlQkdCdGxnYlpVSzdO?=
 =?utf-8?B?bi8weU51WExlcXZMbGJXbmM5N1YzZVBlNXR2Q21kUXJZbXp3eldRS01EcVhi?=
 =?utf-8?B?YVFNZmVla0NlK2xHYlhmT3g1bjUrQlFlTGw5Q01aUDNQbWtHVE9mZEtlMlVw?=
 =?utf-8?B?RGtqR2xpQWIrNWJGMkxzY3RGdUk0NytJMzErbitaTW9VRDBudVdNSmJKWjBv?=
 =?utf-8?B?WVo5ZWxSQWQvUWhudHZ4ZldwMGpzck1zeVNhTXU2c0xvUkJBWHRnZDlGVk5P?=
 =?utf-8?B?bk9NbzBBbVkyM0xaUkE4VjU4WkFHYktxNldXS2RaaFNScGxkZnlaazI4WW5k?=
 =?utf-8?B?KzdyS2hsN1k5dWlrRG9YMDhUVUZhR2trU1VkTEtsdjFDbWh4TC9Udks0YU0z?=
 =?utf-8?B?RWhUOXh0QjhVc2RtSEYzUkNMbUNTMU1WQnMvVERhUEtGSjNLSm1ub09jTDcr?=
 =?utf-8?B?dGMxWGhkRHdKdW1iaDZNVXRkZ0Q0ZmViWlhFcTFKelpiQVRCTTJqQzhPWE42?=
 =?utf-8?B?VGRyMFcvcXhUYUgvVExhTmRWclRtdS83R1N0UXY3QjFYT0lEU1Z0ZzNoYkk1?=
 =?utf-8?B?ZXQ5NHR6TjdiVHUyZDdYNzZkUjYyR2pzek4yN0JydElSNkpZdHpIRUFPTHph?=
 =?utf-8?B?eFdtaWczQ2ZHQjhGM21LYW5lNUc4Y1NrQWZlZUkrYW5ESCtnRU1ZSXhTR1hG?=
 =?utf-8?B?WkY4OHdVeURreHVaQ2x2bTlONjBKazZYRHFVeEt5Um9pSTlSQnlhSUZod3NX?=
 =?utf-8?B?ZjRZNVd4QmxkWVMvR05RNHc2b3VZeEMzVlBIZXVQV0dxM2FiZWt3WXl5bTBi?=
 =?utf-8?B?Ung4dElEbEh3bnA0M1Nhai9TRDBHT3ZoZFRWbm1EVTREbjBiTmM0a1RjVUN2?=
 =?utf-8?B?S2xMTGlBODZyNkFVQUpaNXJXUVBSZkNMeEpiUkdhMktXSTdKaGxFMHFYVVJS?=
 =?utf-8?B?RE9Ia3J1RUY1WmNqQkxrV2FYK0x1N3hCdGlOMEc0Y3cwb09ISnhDbVlEM2l1?=
 =?utf-8?B?UEZUNkhHeGhEdXg2RHRXTkxVZU9CWWNHUEFSV2VseWtFL29McTVFQ3dlU2Jy?=
 =?utf-8?B?MDFsUktWMEhVZVZlMG44QVF6dlUxN3JuM3FaWU11aGVMUWEzbmhSenF3WGJL?=
 =?utf-8?B?bHkzbDFYUTczN2RzdkZJeUNvRGFxSytEL25oMUlTWGdtc200NUt3TWltWWZr?=
 =?utf-8?B?N0I4Z05rZnFmR0J5SzdBVXhDUUpNbTYwZlNRUkN4VTNCU0VnWmdKV2RjQ05F?=
 =?utf-8?B?eXpGM0JXK1c2a2hNTGh6QklXNjQzajVHVW1KcjJnZjNqTERCdEpWcEx1TWJQ?=
 =?utf-8?B?MDNTQ1JUZHQ1Z3E2MHBaZDJhYUFXVzBGWEY1VkxDZ2dJaFRIR1V0MW9reVZu?=
 =?utf-8?B?SVJjK3NTRUNOc2VmQldNdy9uL2g2MEU0ZmdlR01KSVoyQy80dDUrMlZpOFg0?=
 =?utf-8?B?aXhNeXFUTXMvYjAvblpIano2WWwyclBSZlBLZjN2ZGtnSUwra2w5MURRL0JJ?=
 =?utf-8?B?VDkyUlBuQ0Z0Tzhla3Q0a204RjRhZkh2WkJJWC9DYS9QMmtoK0tJNEJDVHRw?=
 =?utf-8?B?SWVlUGtNNWZKdlBPYU1HWEVmeXJJZ3grRWNXT1BIcDVESUNWMHpHb3pZb09E?=
 =?utf-8?B?VVNYVElyT3hoY2JZeW5UdGhqdlJQMitEelJqdHA3N0Z4V25xNTQxUUREeTFp?=
 =?utf-8?B?M1BybENJQTZ4Y3JCTFBGT3RuMldPVWF0alhPSzBXamczL2h1SHhWZU1Ma1Vy?=
 =?utf-8?B?V2E5MVFYNWpnalhYZllaZ1ZmUk1OU1pmb2phTkJwZ0ZVNXFxU2MrTUdweG9O?=
 =?utf-8?B?SUpzRXJNSXpxQXNOM1V5Z2d6V05ndWZVWExhM1lWWXdPZTlDcDBDWjJpSzRP?=
 =?utf-8?B?TFVhd3NhMGJJOXZRbTFlTm50blZlREFCQmorcDh2ZzdzZ3V0T1lhOEFtSUxn?=
 =?utf-8?B?KzUrb2t1UGdiZWJ2T285bVZXUlBPcVRrSjlzS2txOUdZOEVpeDl6WTA1VlZv?=
 =?utf-8?B?Q3JyenEvYzlRYTlRd0xkYzBGTE9QRDdaUFF4MzVCeG9HZjUrelkvbGZLUW54?=
 =?utf-8?Q?zEDKp8yKcheB/1XRbm2a1kkKmGganqDg5+CgF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0490f53-432b-416c-e124-08df28471b79
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:56:37.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0B7vWWP0/kCfbsVMgf8x9I7toXdueXqXHn5ohNoUSXEYDP8C2+X79uBmvE8a5aB3/w7VzIBZre8rOmt550u3vsnRpu6HqxNPDz0bSWjRW2h06AK6ReUPWJDqN5HL0Fw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB011266

On Mon, Oct 12, 2026 at 12:27:24PM +0300, Andy Shevchenko wrote:
>On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
>> of_device_is_compatible() on every invocation to determine pad wakeup
>> capability and i.MX8QM-specific behavior.  These properties are
>> invariant for the lifetime of the device.
>>
>> Extend the hwdata flags scheme introduced in the previous commit with
>> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
>> dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
>> This replaces the repeated device tree string comparisons in the
>> suspend/resume path with simple flag tests on static per-compatible
>> data.
>>
>> While at it, clean up mxc_gpio_generic_config() to use a local ret
>> variable for clarity instead of the == 0 comparison.
>
>...
>
>> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
>> +       MXC_GPIO_HW_DATA_COMMON,
>> +       .flags = MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WAKEUP,
>> +};
>> +
>> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
>> +       MXC_GPIO_HW_DATA_COMMON,
>> +       .flags = MXC_GPIO_HAS_PAD_WAKEUP,
>> +};
>
>Okay, if you want to deduplicate that, make another data structure
>inside hwdata, or wrap hwdata with flags. But really, kill that
>definition.

Ah. this would need more invasive changes.

Bartosz, Frank,

what's your take on this?

Thanks
Peng

>
>--
>With Best Regards,
>Andy Shevchenko
>
