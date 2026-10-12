Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95B27E1DC;
	Mon, 12 Oct 2026 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799278; cv=fail; b=PyqW93vjeMK5mwXjqD3NBWnsK/q+qJcX4X62wv443HtHdcejexqxYkEixZU71OkPmEwgj0gqDAZkItUnzsm/N14U6UK+B0a3NhPGC9lMSq23GiAqmI6JTN6g/H7ugqrZsOAioh5/y/76HYxZ6/dNDQ20Uuye1pqw7/MRNjeBLzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799278; c=relaxed/simple;
	bh=J91YzoQAgkue4VMKmMypBl32PKeUg1Xh3QbbWhkFI0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XSfNO2nnB3G0uYufLiZwlR2MHuUAGUj7zRfGmma/+23ZcsGTLMQGyshlO2pdU1OeJLsM5v1o7Q1jB7krf/RL8uW1S1L/6W7L4SOFjeBYQ55Q96POutLmHqP9r4fBy0QD6OMdYkY8mpj/sNsQDgH3WF9HKi475C3Ok6CLBTydseg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pwZ4y3HI; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pwZ4y3HI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guUeRQUBeqnACYgerC1LGYX+St/nnqy4WB7gXoZqPLMFHJW7vL09AgFGIratOyzPIDXbObX1h04OKcZja9cCYoUl92Q/u2+03EevDkisO6v3tGTTdq6fnr/rhLoOPFR4Cw4aINPRBehlmNvd6EkG/X3c99WC4OhUQ9JQeRO3FKCW6IvikbZIJmN3PtqwiZMlxYI1OeBOw1K+mEZKMqO3ZGFtjkRJ/BOxte9LZkjroM7UO1D5duFo5iDbfmoL9REU3SLX2RPuGqBkkI79pmk6cenQoD2tPjm7zObJG8E+rUkXbuhMTdZ/xW+4Vm4YuHHIIoHvEyeBquwWFpOErOR+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikvxHn/fTkWESG74dczexCtmJNKpKWD4PefB/5syyLQ=;
 b=WddL2nQNVB8VYofxUhOga76HjPz+1iC1/SVXT3WZmVmc5V4tUDOfVzalz35On2ptzqQheDzZSXnGTCe6AI40DckGE/svRixm5KiFUdo2Hv1Vk6G6ugS1I2Dmu8HEwiZMr4dOqyjbur21hd6fPzMDXYY/LG3a5T2Oeob/t1Ies01RmHeisMCji7WgBV78ybKcQYIP7jbjtl1VxrYhNzeoIjr17kG1dnI9TBR9oBZRQSbeM7zvgcHiRnAOclRd5zFqRBvy9q+TmCxPeYYow6SodO0H+5Y8LblUQe+NycZg7kRhabCqDtiLKz+x7LKIjDCOcu4BPHFeuMIJbAAFHGsqIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikvxHn/fTkWESG74dczexCtmJNKpKWD4PefB/5syyLQ=;
 b=pwZ4y3HIdZw42cSFCD9sODwlocUl50KP5bU0b1DKH1vg4yCMImK2yW3UG4OtmBp+gUCKdN4dfu10y8OLehoC1IgiWDtxqmRduRz8iRiMCOZ/qIa2N5Rq1v9dmlHzPPG0cDP92ItU/2xyg0XgoYvwRkA6U8bAs0yugxwM4psu549AppBIc8jeGexoWAqf/T/MsqlxPXc7HEymBGqMKNELIcCIArhqa/25iScZA1ggA/+UPcDIL61J0Dj+bzSugowgL9G/woC9aZjpjPFgqbfXst3mcjBZYDREQqG/0J29+61nAippu3okKlOupCWLgXzW8qWvAHsdFaR+ceEOfByY9Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB9115.eurprd04.prod.outlook.com (2603:10a6:10:2f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:01:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:01:07 +0000
Date: Mon, 12 Oct 2026 18:05:42 +0800
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
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
Message-ID: <asyw9ns870F0g7UD@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
 <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: ff83bd29-ec00-493d-c5f5-08df2847bc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|1800799024|366016|376014|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9j0gKW7L3gqbmQ/8ec/77En7N3qUuMzR3a/ZSRzVdbLjsD5MjHWRfRpmX+zNgPp5zNs+LVOOEC3eagcoPzvJOG8ep1ykTL4Qo6euE3d/QDct/8Fc+/ykZK7St7+c0Vuo2raJgaIEaiQamLAQagtzkpMMUqq1TqPSEmRCRHV1Qzt3WuVzyoO7qAcTnp1Il/OTZSwhbt+EG+uj7bw6LOyIy32HWK5iWu6xMPn7/0qrbODF0DR6xX1kdzzqY9IY0MSplU6iBmNLtBqEY/cm4f+Sb/A9Mg6De8SI3OMwl04cEUmFrowkKSfBGwiVDRiVjW3Ds251IEpyAQvliMlfPVRkoXBiNjFNbTQuRJIUZHteorbaiwiwREHZ+r7LV7oxgXkwprLwPeMq7DUXBpyfqJW+ugf1AYRI6zwOSz0qZelKuseBwvUKh8c9/AMRrcO7udLfYMdfGHgory0woudeVwwk963ZsiNEA/q5bWf08tFxPq9nTzB948LFF0caQiuu6U0dDsmFQxElJX550kcSQBdhMN3ZUThnQqDgju/tbBjmcz+Cd8P+G4Rmet9H9R0KZYv0LPRMbtOzZnl/cgxzZpCEBYCuZL4+9199P5EX8+EvfhQR/ztqW7efeCmcngsQ0/NcjHX8BYtzyvIu8Kr+ZtVthA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(1800799024)(366016)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXk4QWpIS3QwRjdHVWZqTVFzVlN0RERmQ0xnMkNTNWFoYm9oYnBqMjRXWXo5?=
 =?utf-8?B?TUpTU205b0t6cVZsNnNiMExNWHZmTnF6aWV5V2syU3pZK3BUNXNld2daaFRO?=
 =?utf-8?B?bGVCdkRpT0tXWkRsbGZBQ3k0bzhZc3YvTitSRXdhNjdhZzRrOXZkbnpHOW1l?=
 =?utf-8?B?R2o5cUtCNHVSS096QnVwbkZHYXo2MXhGZHhqSGtxeVdQYVFrdTNSdlc1YXgw?=
 =?utf-8?B?eW5CSHJtc0cxTFRKcUVoTXEvaExTdFo2YndBSFUrNStjb3FIV3QzL2toaHhj?=
 =?utf-8?B?MWFtdFA0Y0VhWGRReWNidzRsRkVJaUhGQ2dNbW1UOEY3SEVkbGlDbFh3Q252?=
 =?utf-8?B?Z0dkRmZ5eUNaUFZMeDdoMFN2bmVZS2V1cUE3SHA4bC9vYlZnN0FMMDl4dWx6?=
 =?utf-8?B?OXNMZnBtOUphMWRXdVZsazlkM1hmeTNSU0hQQ3h5ejdZZ2E2R2xrWHAxMnJm?=
 =?utf-8?B?UHA3aFVFaHFKRkY1eTJ5dEJLMlV0OVNGVjlCbjBISngvcno1TmtYZEF3MllU?=
 =?utf-8?B?T08vNFptVzd1N0VWbW9uTUg3Vll3ZlIwYTJocVhqam96akRXejhUaVE3MzN0?=
 =?utf-8?B?dEl6b0p1TGNiQXlzbytZcS8waTZ3TnV4bVJwaGd1aFo5QnBUQUZqU0lSeWFT?=
 =?utf-8?B?elhuLzZmMC93RUlVV0pwZEdsbEsyajk3NklnZHFpUTFOcGtVMU54UUlhZjRM?=
 =?utf-8?B?dVJKMCtjTXQzd0hhSXNoY1c4QVYwYjlSd2dSTUgzSjJVcVFoWENhUm1XNnAw?=
 =?utf-8?B?VzZnUUd3SjVTck50L2NtNG1FcHdWV2R4Y3oyQ25YUWpuOHFyc3VqeHp4TVgr?=
 =?utf-8?B?ZlNHL29mT2lXT0NzRHA1U1EzdUpiVVAvRWFIVjdZTkY1V1NPUmdqR3AxOTBQ?=
 =?utf-8?B?bmZqQWNOM1RkVnhveTd4NU9ERDB5eUg2S2NCc3ltU29mMnRjY3hNemVhV1lI?=
 =?utf-8?B?Q1d2THh4TmFlbkJLMi8vMzZzUlZvYVpONXk2NE85VU8yVHA0dS85eGJrNlY5?=
 =?utf-8?B?ZkJTdURLYXo1ZHVhTkhDRmpjK096VzdHQ2VvQm8zVElDeGh6Y2RHWHNKTjFR?=
 =?utf-8?B?YWxKWlFYNWxONkZiSFRSTnJwYUlwSFp4ZEVhMmZYek5jR0o1a1FOSUZKSVhk?=
 =?utf-8?B?ejNvVXFXa3Y5UngrbGh0a09UK0hiTk10UTh0bWlOTmdFa05HYVRDem4xVno2?=
 =?utf-8?B?TGVUelBEanlvTWhFRDBiMyt5Tk5iazNNYTVxZ0JXMlhEK0NIek8wWFVOa1V0?=
 =?utf-8?B?YkNxT1JLa2Uva1p0bG9RSVl1Ri9Lc3J4UHczb0RTQ21HK2JSSnhUWEgvYWJW?=
 =?utf-8?B?dXAzMm92aGlxM0Z1b2VGTkdGTEt4V3I2ak1yVm5PVlRqZGlDdUxzK0xZU2tY?=
 =?utf-8?B?YXJPMENreVM3M0I1ckV1YlI0ai9nQmJWZTZmL25seEhHSDNRV0VPS3NMMGVy?=
 =?utf-8?B?bUZnYWpyMVRQUVBLSlg3Zzl1dEVuVFZQU1hpTjhvdy9Zcm1lcHAvSE9XbGpS?=
 =?utf-8?B?TWgyTkhmVmR4WkFqSXRpbzhBTU51M3Q1YnV1TmVod2tJUWo5K0dYOEpUc094?=
 =?utf-8?B?bWxqWnMvWHcwK1lnUjM4eU1maW9RRFNlRHlxdEQ2MmpIZ0YrSlhHR3RvZGkw?=
 =?utf-8?B?SHE4T0srYVlnR1hSWjNmWjU2Z3dIeWp6a3VzQkM0czJ6QTEyN2JWTjdkektW?=
 =?utf-8?B?aGlYVDdZZkpVMFdEODhKaWRQbzE0VWw0VnhrSE1YWDVYQW05aVl2b0lJeis3?=
 =?utf-8?B?bldUNThoUTQxVUozci9udjNmKzk4Tk0zajRLcHB0ZFpVcG5CUVR6N3dIWEho?=
 =?utf-8?B?YnFwZ2ZmRzdHWG0zOTNrdlpSRHViYVNVYUljd0FNWEFvSHdJQ016aEk5V1Mr?=
 =?utf-8?B?MEp4THlZRFhXZkNGUmFZOGVCMTJIelNsUUJMZDJHKzUvUFJmbVJiRUh2QVhI?=
 =?utf-8?B?VlpxTlN4Qm82Z1Nyc2c3WnZNTW5IWUp5SENGWTNySllCM3dpVzhpYmNKMit1?=
 =?utf-8?B?SkIrdFpzSGlEbjRBUXJsYzFvaWhoZnJ5MHVyMGRIYi8wQnFjL1dBNjduZHJt?=
 =?utf-8?B?U2VrTW4rb2RXWERKYS9EK3NNVEtRbUtDUk9iZ1VzVDI4WVZXZVU1eEc5ejVL?=
 =?utf-8?B?UXhzd1Jjb1huQ1E0RDdpaVYxY2k4czVIL0V5K3lHVW5nL3Y2a3BMVHlQT01R?=
 =?utf-8?B?blhJNlRpaElzcUtidVMxZUZuR3hWeEJGbXREd0ZLUzVxb1BjaWFPc1cvWHB5?=
 =?utf-8?B?VytVckM0U2JNb3B1Q2F6dkpWVVR0bXlYbGxqb3gvbWJTd3dzMFdJdks3dFc1?=
 =?utf-8?B?cVZtZFE3VGVsWnhlTncreC8wRm0yVFJMS3pjd2ZyWGo1K3ZBMDdHSmQ2M2dO?=
 =?utf-8?Q?XzcyjnCjfTfIQNAK3T6n0URfSmHZyvCARoIsO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff83bd29-ec00-493d-c5f5-08df2847bc33
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:01:07.8666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2j2P1Pd/SmUXASaXY/GfACRoO8ikGdLyagxgmgHjqto6X7vP92JfISsN/v4tHukp2GQPdnUOCyAILAJCRdJ+arAckPtrOyANAuDG9sdBUrzyF9EkO7lYgY+XmFwKmVEs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9115

On Mon, Oct 12, 2026 at 12:30:07PM +0300, Andy Shevchenko wrote:
>On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> Introduce a local 'struct device *dev' variable to replace repeated
>> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
>> readability.
>
>...
>
>>  {
>>         struct gpio_generic_chip_config config = { };
>>         struct device_node *np = pdev->dev.of_node;
>
>Why not this one? Is it even used? Perhaps you want to have

of_alias_get_id() is used, there is no counterpart in fwnode api for it.

>
>  struct fwnode_handle *fwnode = dev_fwnode(dev);
>
>here?
>
>> +       struct device *dev = &pdev->dev;
>>         struct mxc_gpio_port *port;
>>         int irq_count;
>>         int irq_base;
>>         int err;
>
>...
>
>> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
>> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);
>
>This message simply needs to be killed, with initcall_debug in the
>kernel command line you will get something similar from driver core.

ok. Let me fold the change in this patch, I would not introduce
another patch to just drop this line.

Thanks
Peng

>
>-- 
>With Best Regards,
>Andy Shevchenko
>
