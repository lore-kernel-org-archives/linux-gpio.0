Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C4331D375
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 02:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512487; cv=fail; b=FpMB0tkwoOJgm/k6agbpK/tquXU8AKvHftCO/pUDTKlYDfJocThLTdrtr/4r8a3PzbpNCwGj+kPbopHjIvlafYNQMAR6ZBCPszJLaWfOOdeC9GfqW0U7i97suSnqhHSZGmxsMa/3WvQVHt8ws9TP030XFBmoF/gd2YFPsaZAwzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512487; c=relaxed/simple;
	bh=u/kXRyYowHa3U2ekNS0pc59lvJKdU8u9W0zpZmq8uuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PgnBP8fXT9D9MevsB1aeAXhRpBy7HveRAwqCwtlZOi9EWHQHODmQNUbUhP14s4J66srwGV918puYmcXooRQKNz353UmaxuPslXZ2XdVp/5V5iKmtEcfsTLiFYXAUO79G8BFqraY2lIHQxVEHShp35qJ1t6MTM6DURlwIQfs7Y+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kl/tF+lv; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kl/tF+lv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNGTyir9bXXY+rURTS9CS4tKk+NDW0V7C6GwODZqA/ht/ZOdCRzQFSTOrQuwu9lOaaLUg12gJGzMZHgN+si8wxE4hUJjWGdejLYkthso4DMS4JGeSFjXQXtWgXdDEM3u+ED1pjebbdSHiCFae2gmyMS/dcvBLYCj7mrde0S+UI2pQJtZd2F/4W+1uCmSMNAn2Zo/KUifMbrT6b9YnMF8uI2EVzxGORZZn2iuI3/C+qdJUipQHIclBSVu+3lB2gYh6+ZOBuwvPKftfo88u1YqNPMj00zh21ePztSvmJchnhJqzA6ZCrcBP5B+XoCi89Nal5WLvUA1VSVcJdE1v68H8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvgif3cQAhxTXUtO3oqRfHdHCAa8MsJOp4JqpmmQhpg=;
 b=uKJSodWBtcY/KFZfR8eCgwEcT3YNsFb+0hQpd4LxhTYascLOFh4pohOEclXUM/IQCKMFGUFD/EQSORBvAN7VcFyXdWXgZCr2jwqml6wGuNzgkPCm014F6SPiR9Qi3AH0bV6GaXYW8Jr/IQa+JI1WcuHgqJ1L5kgZrM4oQ8xwF4eWXuFrNby6EppEP++XVmHKncGPIhz+TxMtpr0KX55w1yPz9FpxiqsWBmuJiZKdGUslFRhWsXc+qJKv/Ibi0qNqaXeF1FNxZcgUtZZRSllEJlITYWw9I85K1hQIRhXjHujErkcWiCYGAA1a8QT4TM4OlMdbxaX/2eZo4kUcxEOPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvgif3cQAhxTXUtO3oqRfHdHCAa8MsJOp4JqpmmQhpg=;
 b=Kl/tF+lvDUe/naMlqar3BExpQZjV2jve9wutdyvGTn1s6EW821/mI1aWRN7hCIqQuZp9Rr+qEB4BxXtQNwztE/d/K1d8FZ1nWbim20HZqS1kud+UwjWJzmTPWzHrkJoW3mbHnC7EihX1VV7caN9IHSm8xVuPkJi4mj4mAWJaN+FJi+OLN+PDOD0P0Tbsugr3yKBB5SiYybb7rdSHFLhn7RhHQLgd0P1qfclufu/E1vYnyOaoAKvqDjjy8FK7BK2SXrTHvF9+X7BWpnd+I1KW+lUK7F1xM7CFY9C0rKOK61WIZfaMk/zO9Dp9N8FCDngagnM5PVqq1q7dubBqVhwHPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10556.eurprd04.prod.outlook.com (2603:10a6:102:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 02:21:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 02:21:21 +0000
Date: Fri, 9 Oct 2026 10:25:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
	linux-gpio@vger.kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 06/10] gpio: mxc: convert probe error handling to
 devres
Message-ID: <ashQs4mmqF0ECg3D@shlinux89>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-6-c9f5a8b50df9@nxp.com>
 <sashiko-outbox-162899@kernel.org>
 <CAMRc=McOb8Yh3h2oPn4GU-hnSff3UBd8WZzO0PirXm7U=+G56w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McOb8Yh3h2oPn4GU-hnSff3UBd8WZzO0PirXm7U=+G56w@mail.gmail.com>
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: a47efe90-a0c1-456e-b024-08df25ac026b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|6133799003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2AvvFJAYafhxTF18LRLkZHzICaKsOmQrLB5GSvAmzYoVj8461zZAJp1qZRdo0b5aEKHeTAiYiW2Outtc/Wi575PU5S4wJPyJmCuez7xkLVoViLtwejZxNbtPVpleYWmrjOP2g/Jx3Qda5SmbBMfXjm5yUiyglVg9ZoLOiGvnBgSkkD57TLcopmFj5ZcBq1hIo46lxzAVv37egl0TJePRBwGT9oZ654lb7QKbzWxDOYR2D4ZMkpQR0rf91qYSM6xB6gMeyFcqMBln+k2filfLMUQNahacuL47j5tHKtvrD6kFBzfH25/h94VqpDiQNaw73XTOSj6lUY9yxzGiGRDlEsCumYuFbSuQ7SYT+qynyXlrE5fZm6JLz2sx9NEvm/BTOeAPi/Hx2Bt/dATRSrmP4q6wIOBvM34lbiFjRN5fZRdMDlUHUgLvqaNygYR4O2S3kp3tRa4UrZM/Tz+otQXGsi/BRPHUTYZ6GuUZ7gnpcYvaouKPLooO+GNtmwWV2s23Q/Vgy7t8p1TBIawI+mExZ2w4HibGWuK6UiGth8UHL+wxsQx3MArlMZ618Fll+qYNeeEEj+UpiCfcIJZXGf5S5fKf5FjmT1ArYLLuRzMUkpf+zc3jBIG8heUp/i04FKnr+j1s+wxB+S+/lxoDjZUQp6usOJV1j4+n5dIgs+feCEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWFlemF4RkRaWUlsdlFheFkwT29PMUlOM1AxTGdsZHRQOVNlMHV1cGk0OURV?=
 =?utf-8?B?U2JLcWxnMFpJL1lndTg1TzRKUDZIeG9sOUlpQjU2ckFTTTFKQzNHQ2xnNFVt?=
 =?utf-8?B?bENxZzI2dG5ISjVDLzU3elVUdDEwUGkwRm85b2diZ2hxdnZhUFNYUE96NWJr?=
 =?utf-8?B?bW1oVld4WWJBdGhCYk5zTktuRUhDbmMrcEhpYXl0MFEzWEdsZ3ZJb2o4NWxv?=
 =?utf-8?B?YkRHbXlMeG9HaTJkRDI2NGVQWXNaQlBncXJpb1h2QVBUZnluU2tQN0txaW83?=
 =?utf-8?B?WXNRcnpCaU8rcmM3b2cwcmJrK1R4YjBMS3RoMGZFbGdlbi94a2hEbWM4dkdp?=
 =?utf-8?B?L0M4aldRSzVmcDdLZXZmMStvMUhFZUl1am50U0g4WnhrU01GTGVLbkd1ZGJH?=
 =?utf-8?B?NXc1YVVEaUV3UUY1UERFakJQdHY0ZTg3ODN6Mk1vdGxxUHJnMTdBRzQ5ek5v?=
 =?utf-8?B?Z3d6NFZiUnl1WHpjMzN5TlBXeWw0ODlodEtXNmkrTlFZTWFETUVYajBMZm4y?=
 =?utf-8?B?SEFOY3VsQlBUQWVPbys3RjNsUklKYWVXUzI5Q2JFMWdMUFFQZFB3NnFRMzZi?=
 =?utf-8?B?SzlMN01TSjlUaFEyaDNaaXcrR2lvZVh5azU5eW9uK0x0dmxKL0JRK1VJd084?=
 =?utf-8?B?bStQV2ptY0JEbzVBUFAzbE5mOTE1MmRPeU5la0xnWCtrayt3ekM3ZUVkdkZz?=
 =?utf-8?B?aUhONUt1NkVORWoxR3R5blNvN3dMOFdwMm5PNlJtZ25QWUpQWnNVdXRqcUU3?=
 =?utf-8?B?d25SSUxTK2lZT0wzN3JJVkI4SlIxYkNqOGs0WUZqbVBnVTBTblRwVytVU0Rl?=
 =?utf-8?B?RUtlbTVWd1h6MnM1VklrVEVTT2FxbFU4Nis2YlE0Q3M4K2tvWU04TDNaeUJq?=
 =?utf-8?B?enpNZ0FuL0NLR3o2VWcxempHc2s5MTBxVExaZXpsajdoeU5VRStnbmplZERL?=
 =?utf-8?B?Tk9XZ09GaWFyem5ET3lDY2ZhWlRPY2RVR0I5b2puR3R1QzZVc29xWEZ5MHlD?=
 =?utf-8?B?QUVseEVGMituL2w3czljd3hxL1gxMGVVQWc5cGpTYzBWTzcrY0ZsamFoK1g2?=
 =?utf-8?B?UHFjVnJ1MDUrVUZkdjAxd0FhaXgyOVptbnRMYVlya25nL2VjYzNRcm9qcCtF?=
 =?utf-8?B?WG1yLzFBWERVODhBNTRFZWpqakNNczlLRkMyRTB1aDEwT0F6dGUzVWNOQ3lk?=
 =?utf-8?B?K2IyYjNKUVB1ODZqVnpoZnVpZE9IMlVSdnRmMktpY2dIN09aMnBjbVRKcjY0?=
 =?utf-8?B?K3llaTNkVEFvSyt1bERhdXllTUZwVFRYSEhwSnZSUzVaVjdhblE0U3JrQkNK?=
 =?utf-8?B?S1VWdzZmenBwaWRLVHVpcy9US1ZuNmg4MmNjeUM0NjJpVnpRb1hKdmhXMWE3?=
 =?utf-8?B?Yjk3YnY5YVdkay9TWVZnTGtFSjBpUWVraVhFZjdlendwZFB4dFFXV21oYkd6?=
 =?utf-8?B?dy92eTZOYlBXNC9Xc0RJNjZaZHFjMzQydVpBZkVMZFVaTmhqblkwTmd5dER5?=
 =?utf-8?B?VGttWXhHQmhJZlVpT1lEVmJsdEpWOG8zSVJYZjZVL3BKRUE3SzVuRTRrU2Nh?=
 =?utf-8?B?ZVlmb0o5dERRY1Q1Vk53OC9XdmEyM011L3JseElvby9SZE1JdHpMWUw4SFdx?=
 =?utf-8?B?eG9vUUFQM3k1UTNHbGE2U3JiYTcwVThQVGpTc2gxQlVnVkpsWFlJWXFadnFQ?=
 =?utf-8?B?OWlpaGJlVytES0ZXbnBTellSVHJabFN2MlVNWU9PeEdDUExpZ25wMWIxVEk2?=
 =?utf-8?B?ZWNDbWJOakNJejd0UEFnZVF5eS9KWUx2TktDQ24vbXRqT3dFSjAzQWZiRHlW?=
 =?utf-8?B?NTdTSUhlS1RJdGY4RVM4azI0UWFjbVhEaS8xK05ZcThVaVNtdy9UYXRQQm5O?=
 =?utf-8?B?S0FMRWRIRWgycWErMlE3K0Uzb1hOd1RHUFlQRHByYWV1REZZOTZyZGEyL0JS?=
 =?utf-8?B?T1liTURQSU9UenRQRzJTSkVMWFREalRyNDk4SFMycGpwVVRZNkN2M282R2l3?=
 =?utf-8?B?UlNwc1pydCtxSTNDUFUwVldaV2VnUlNFbHMyVTh0RnJBTm9jMVdkV0dlczBL?=
 =?utf-8?B?VFpvNzBlS2NHSlFXYmdqQnNrbEcwZVpYZ2luV0FDdkNaZHExRW1LN1J1RW8x?=
 =?utf-8?B?ZEhiVTQyKzE0WlZablI5ODB4Q1hvaW5Nck12WHB2NTBIK3k0a3dzbGppRVpm?=
 =?utf-8?B?Vml1TGdJQTJNNDVPdU84SWduU2lrMDk3ZnhFSGY5ZkxuRStjRlBlMVNMcWVH?=
 =?utf-8?B?a1RJeHR1M3lWWld0eGhKR3Y4WjdReXhNb1kybWk0U05zSmlTUUozMjJrWDht?=
 =?utf-8?B?dDJReDkvY2g1YU5SQ0FqWmZCTm0wc2VET2tqcHBBZ1JTWkdrdlE3aXluSnBl?=
 =?utf-8?Q?oECmZuA5Rml3Ykv1FN3R5Gd6Tn4NyF9YS2ONf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47efe90-a0c1-456e-b024-08df25ac026b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 02:21:21.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTV+6K5bQYhgTrcTj7iKw5po9W//q/XgtyZbpG6pAgK1RSgqJnwc0NWfLtFt84fQidDGE2LLvJ88g+6WHmuQ+J51PA2vGwOZ/RO3O936u8MgZ9hSFoS7Zxzhn4hf8Zw3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10556

On Thu, Oct 08, 2026 at 04:47:48AM -0500, Bartosz Golaszewski wrote:
>On Wed, 7 Oct 2026 12:59:26 +0200, sashiko-bot@kernel.org said:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] pm: usage counter underflow due to mixed devm and manual autosuspend
>> --
>>
>> commit dc287cc46ea891b838f3b39a1fd6ed65d627a965
>> Author: Peng Fan <peng.fan@nxp.com>
>>
>>     gpio: mxc: convert probe error handling to devres
>>
>>     This patch converts the driver's probe error handling to use devres. It
>>     replaces irq_domain_create_legacy() with devm_irq_domain_instantiate()
>>     and updates the PM runtime initialization to use devm_ variants, eliminating
>>     the need for manual cleanup labels.
>>
>>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>>> index 5da603569d88d..54b09f1a4b509 100644
>>> --- a/drivers/gpio/gpio-mxc.c
>>> +++ b/drivers/gpio/gpio-mxc.c
>>> @@ -484,9 +485,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>>  	if (IS_ERR(port->clk))
>>>  		return PTR_ERR(port->clk);
>>>
>>> -	pm_runtime_get_noresume(&pdev->dev);
>>> -	pm_runtime_set_active(&pdev->dev);
>>> -	pm_runtime_enable(&pdev->dev);
>>> +	err = devm_pm_runtime_get_noresume(&pdev->dev);
>>> +	if (err)
>>> +		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");
>>> +
>>> +	err = devm_pm_runtime_set_active_enabled(&pdev->dev);
>>> +	if (err)
>>> +		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
>>
>> [ ... ]
>>
>>> @@ -558,14 +567,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>>  	pm_runtime_put_autosuspend(&pdev->dev);
>>
>> [Severity: High]
>> Since devm_pm_runtime_get_noresume() increments the usage counter and queues
>> a devres action to drop it on unbind, will this manual call to
>> pm_runtime_put_autosuspend() cause an issue?
>>
>> Because the devres action remains queued, when the device is unbound (e.g.,
>> via device tree overlay removal or hot-unplug), the devres cleanup will
>> execute and decrement the usage counter a second time. Could this cause a PM
>> usage counter underflow, corrupting the device and parent power state?
>>
>
>Sounds right, please remove this call.

we need to keep it. Without it, the gpio port will never runs into suspended state.

I think it should be not be marked as High severity (:

The driver sets suppress_bind_attrs = true and has no .remove callback. So never
unbinds. Even if we do have unbind:
Probe success:
  devm_pm_runtime_get_noresume()     -> usage_count = 1, devres queues put_noidle
  devm_pm_runtime_set_active_enabled -> devres queues disable + set_suspended
  ...probe succeeds...
  pm_runtime_put_autosuspend()       -> usage_count = 0, device may suspend

Unbind (devres cleanup, reverse order):
  [1] pm_runtime_disable_action       -> PM runtime disabled
  [2] pm_runtime_set_suspended_action -> RPM_SUSPENDED
  [3] pm_runtime_put_noidle_action    -> usage_count = -1  <- underflow

With PM runtime disabled[1], pm_runtime_put_noidle() just does atomic_dec() on
a counter nobody reads - no idle/suspend work is queued, no parent power
state is touched.


So to make things a bit cleaner, we need use pm_runtime_get_resume(no devres),
and define __free for it.

DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_put_noidle(_T))
Then in probe:
pm_runtime_get_noresume(dev);

struct device *pm_guard __free(pm_runtime_put_noidle) = dev;

err = devm_pm_runtime_set_active_enabled(dev);
if (err)
    return dev_err_probe(dev, err, "...");  // guard fires -> put_noidle

/* ... all error returns automatically balanced ... */

/* success — disarm guard, do the real put */
no_free_ptr(pm_guard);
pm_runtime_put_autosuspend(dev);
return 0;

Thanks,
Peng

>
>Bart
>
