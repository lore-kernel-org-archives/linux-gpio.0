Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526875349D3;
	Tue, 22 Sep 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072599; cv=fail; b=EUGHpbHWXIyOZxpwlSmsV4VoJbJqt66AHyRmORY2s54Iq1CCh+yBxKZjgPwMLGIxveh4Jo9d/aSxM42N3lmDz/jej4bz4jCFJxkqCy+HdIBkG4x6ZXR515aaMfyPXJFgLpqKXNQX3CZQQ4AuCPOAgn9KgcOqK7DfWkgdaTxsBiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072599; c=relaxed/simple;
	bh=DQzveorFByygfHxu89169X+pQ1dVc/ALX1BNEgOehdQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Stt+ZJxpTVpwQ+wu+UbRI+tbHbeGEeN6FUCAu+FlsPkY4HswGT6NfOGBp8N1eo91kpQHYjdOlAugMlD3rE88JsVecLSnCgXS7nizMr5mQNfq0EhQUApPmzPfxooKItk46gH/q7yNEgI+QBIwl+6YyX0OETvbuARNU5+i1pb6VqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jqQ4zVPh; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jqQ4zVPh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UacE9j101+C1ZkP0Ymb85UH/07rVfXuTdVRzlaAW2TkBUf2n7bLL5g2RSejPHV/sjyzo8ezSgX2HksiSF+ZWyr+/Vy5QFpNsOXKxtC/4MfQ3V8NIi7xDTqxB9r9ljngB+5Q5dA04LkR/QHti4xqQhmDeHaGhvFzZED8ymn+yIeoAs77l7GiNffQOA3cBlPwPuSLhxD35hFfRoeoYmcTLi3tht12fnPJ7kdTF6EZcCaR6d2OYVJlOM3KtfC/ieK/QECfxU33ejYOWrZOQGjIqvjSmIatylFiVfVdt/jrmFIWgZsxVMvDcqQ5Qli1yLwNjHBVwsI2MdyUB2MrZd95j9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRvxAsfCFwox82C2mSkDy9Ex8/HiBkOPUhbZ2eJr/ls=;
 b=YlTW9GafukbBg9BKg6e2lCu0zlbuNBYljP0jYcpeI3FuD1/1zkwnacKBuERXaT4aHP0S/FhGzA0+dkz7uCCGwPIXxjjcRSOHTuxernIKG5OVwb1URfVAALdu0nqMnG77pqK+ckTlf1649S+Au37UCnZfXz6Fgey9qliHZfuMTDCo5Sl0EfiwwpSJyeQJv3Ig9+FJfjCuqFwIdhDJI8J2WkeUi/+rYx25zJtDIHg5e7fY4bx/Uvu4y3SLK1RJPtRtQTXMCtPSZ3QpZ78+zfvv4vxVZqki0eMIbL0K5Xyv+RSKEDFvklIoiRTDccK+j7lclcZqv/D4qQ6KQa/cv+Fzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRvxAsfCFwox82C2mSkDy9Ex8/HiBkOPUhbZ2eJr/ls=;
 b=jqQ4zVPhpbsyWKrjr5rIe4SjElTYA01lG+cRLGQw1FQvBFBdyIgFOXaA6SYwEvPlOuM0sg2ZQaak2eIdiONUNNUFAOl8o8ZoAFYTSQAf7Tj9jywiKAakIUyQHKdFz1VzwaIAfemvp/EEbr7qxhCm5g+h8ebir6yATB1UK8seeQKNkZq6aWvBiRWIfqSzGxHZ93u7QUqgwOkKv7U3UL7Kjz/Wt+hoDtKbyTHHwIRHS2JYAOVb/LA1p164iujvvtKTYeQSLxAd2vmYBqYUeAV7ITf4kteXWl76KeNQcgACaFx4Wf5nRzxpEiaKqX5TZ3OLxwgUQDjNAQoLNNzhANNWZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 10:23:02 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 10:23:01 +0000
Message-ID: <e1b7f681-3b4f-4163-afc0-9ad0c2bb4adb@oss.nxp.com>
Date: Tue, 22 Sep 2026 18:22:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: pinctrl-generic-mux: Fix provider resource leak
 on re-parse
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linusw@kernel.org, Frank.Li@nxp.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
 <aqxVas_FftE9-pTQ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <aqxVas_FftE9-pTQ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:510:f::29) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 14407c2e-b8fd-404e-1e6d-08df18937aed
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3EA97XGubQ42X9Wr4h2aynpu+gCJwUV/x3ro8s+6wzHN/0vKVgUQHL4d3zbADNdeNSludFG5xmBSCqzFATqXGvgjO2h93EXGumg6nIacwnAdxB/V4h1zfRDHKfek47YLrMBW/voccRXziyekRysHVSrYb7wdiBnuXLF2xXKdUvao+M6pRW6WGqjhfvdxQJmZKkXotTu0Pi0droV9Q+jd7GYTDzEUUkRc6n7MpYlP28e3jnxxvWR4pQc4D4DJowDf9bqpnldP/eyOcpqgxy976X456w+iySZ9OFL+uaMA0d/rkfIFPM/klO8DaXYiU72wlyRSPTLjoUMx0BtNjYTI2bkMc3K7dbt0zw0GxmOac5Tyj6fhJ8wd73aaqZhxTuck9+zxAhWNR7Yy7oCJEWsPl0ektWfah7tgAMZFIcypxD/gRh9Oi8cnrJ1kSF2GDJktD5n0hbtn3RjZMsd2A1AwZ9Hf9FpUX+DzqEPkS4yk24x0vnFs/+95snIF1C5gAMV8GEH5yv7EYGMqPBZBc50lLtIcmPtpQZ4TLjghqW8XF0zddLvrNfvQ1ZLK7YjaCF/isBuO3o7nAHjqe7YKvTH6RuzVaGUAI2mGueG3jaSsfRPVj0I43QRsV7yp0CrvSK6Xmm+T1y75p1XkyG7C48CheG+V30ZEJM9UmXexFdG4ILc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FVUVNJditpOGlML01KZm9FUy92SVJteVhBVnAzeGZnMHFWYU54cnZtZW5E?=
 =?utf-8?B?QmRkSlFNZzBiNUN2bnYyRkFtZHpHeXdIWTN2MEJQY3FJYUNuR0dNOXJxSWtD?=
 =?utf-8?B?UkNkNHczQzFVU2JhdjRWdTZyRVdZNGFGNFhXZ1dRVko4YkZTa1o1VlJ0Y1V3?=
 =?utf-8?B?TDV1TkY5SXJGbXhzS1A3SFNPWjg2Zi8yRE5KajNtSXpCcXJtbTY2c1F4a1Vs?=
 =?utf-8?B?LzhVdnh4djRzejVTdDJBTVV2U0UyandSQTFLbEZVdnUyNzR6L3lNaURBSkpD?=
 =?utf-8?B?Z2Rqcnl1eGtGMGIwVDZLSXFjckE1djBrVHQyb3Mxa24xbzlDc2dtcnVJek1n?=
 =?utf-8?B?WWxiVTNWazBuSHd4aXNVQU5QbGJIcEg0bC9WQnhhR1RCQVdvZGZheVczd3FF?=
 =?utf-8?B?dCsySTZyQjlwSnlDWEpmeFF5RmRWMjVZUHc1cGkyUVcvVlpRcUw0Qm1ObVdy?=
 =?utf-8?B?NDI5S2R2N1BrTFJmRzVGNWtibGdXOFBiZ3gzZ0s5dVFRa0NQbnczS201Z3VE?=
 =?utf-8?B?enRacWlXb1VXZXlWNExSSldaT1JqSlFSd1FZSytvdEZjaHBFeFlKVXZpd2M4?=
 =?utf-8?B?TE1DRWJlZEgyclJHN0hlcFNTTGlLMWpNZlp2dzdYTXNkbTM2RUd4L3NNSGNT?=
 =?utf-8?B?bDNEVEZ2TGV3MXhtUkR1ZmNUY2IwUlppejUxWVE5MlZXM3hCMkFlVG1FdEQr?=
 =?utf-8?B?RFFpN2VUV2Vzc1dBSGFRbmF4K3NZRG1kK2ZYMXVWSDBPc2xwWHhLR21BR2pr?=
 =?utf-8?B?UUNpNmw1RzhZNHpJWFVwbFp6bkpOaVowMzI3Y2Z4SWxrYW9ZVVBxWVA1b0pQ?=
 =?utf-8?B?blVUNmdndXFvazdZbHEwUXBGaUhkeUVwbmFRTWpHVlJpYTAwSUp6dlFTWHNQ?=
 =?utf-8?B?TmZUMlYyQndOcmpjT1NjRk5tZjl5SHBFRGU4U01HS0FCWHQ4dnlBeWU1OWNh?=
 =?utf-8?B?Y1JTbW95ZGNJdkhaUmdtaUZMZFhubTB6Vmd2amhBSWhyeTQ1Z3NzMm41Q0Q1?=
 =?utf-8?B?dG92Z1piUGlZMjNLRGRuUXNoRVdrVTFKUEFwT2M0M2k3bitsWmRITy9KUjY5?=
 =?utf-8?B?akx4Y2ZaN25vbFZxZ2FCUjNvaEVHS2VMYld0NHJXc3Z3QkdOb2RqbnNOSjQr?=
 =?utf-8?B?TGF4N2ZtK3pHTmsvL1BSeW1WN2ZPVytVbDdhNzRRVmR5VHE5WkxWOEduRHNm?=
 =?utf-8?B?Y243RFNCcGdUT2dRWXE1OVBPeWlzMnRyV0VGMW1USFdNS2lsSTlQRFNXaDdx?=
 =?utf-8?B?T3ZsSW1rZjJaYUJvbUJzdWRuVmt0L1pBUW8xV01TS3ovUmtyWkNqY085NDNP?=
 =?utf-8?B?bTVqMUN1ZUlHeGthdXNBOVRZUWZkWklDSkIxbkJWaXdzMGFYcEphSDVYdkE5?=
 =?utf-8?B?RmZLdlppNTUrRFFzSUJFbmwzeUNsTTJ6emI4T1V1dUdISkx0T21BRndyNE9E?=
 =?utf-8?B?U2pYeUtFY1hNeW5LQVluSTR1ODMxQ0lHai9EUnY3b05lZlU5K21ncEpZRWtW?=
 =?utf-8?B?SmM1SktMdWpuTi9nWk14NktMQ1hKckQvL1JJTUtKeDNWWnlVU2VzczdFZ3px?=
 =?utf-8?B?Y3o4ejZqd3R4bGdTS05KYm1acnBNc21DekF6dTcwaExQeFZyUzVOTStYRVN4?=
 =?utf-8?B?ZjRUYm9NbmxXZEErelRaUlJHcWlxdE1xVGJ6cG9uSVdDd3Q5NUp6RW9seldD?=
 =?utf-8?B?Qmo4d0lxVjY1Ui9pSmhLekhBd3diTmUvM3ZHV0pidjZueU1ZMkg4VzV5WlZ0?=
 =?utf-8?B?NHZGQzVRenFDM2V5bTRaazYybGEvcWprakR0a2JIc2lya2gxREFPaWVDemJv?=
 =?utf-8?B?TEpVby9aM2tIOW9vdC95eE13SjdGTytBQTZRNW4zbnVlRGdtN0RNRnRBTkl5?=
 =?utf-8?B?NFV4ei9kVUk3VUozdjRqRDJmL2ZMdHFSZ0NzMlpnYiswSzJpNC8zaDdCY2ln?=
 =?utf-8?B?TnFVNGNZNHhSY3NmcWY2M3N5N0NrTmRjeHpZV1pFdmhseDVLb2h0VlZPc2hF?=
 =?utf-8?B?L0tCZnlKOXptMnZqdWszNEQ4RUxQTFNrMzg5Z3EyWUlHWFNrMWZZQ1JkdDg3?=
 =?utf-8?B?Y3hmeWN6M2d5Z2ZjRU1qUjJoR2dETjdBbnFMYWZRNlNTZ2xIYUFGRjYwaERa?=
 =?utf-8?B?aUhKS1ByM0hUYXJDSUN2Z0dtYkVpZXhyYU03Mmp1VTFEejdjZ05VSUQzSGxT?=
 =?utf-8?B?NWl6aXdscXdsckVSbytndFUyRk1EQkNiVlMvKzRvOFVZcG1xK0Z5WlBacjNy?=
 =?utf-8?B?ajV6TmtoUmE1UXYrU0F3SnEyK1dBUXFSaWdEemlUbjdYeWkxSU5DYVNRUkRt?=
 =?utf-8?B?N2E0THlpcTk1a21KdHJKWC9Nd0VDNG9CeTIvQ0lwYlJVNG1HNVA3dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14407c2e-b8fd-404e-1e6d-08df18937aed
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:23:01.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5b0a/JrX7//eS2UK6dK3wvkHqif8o9Bgl1gwxPc9Q4C5CLRFB2VM94DQUE2YdGwO57rRUy82rP0YUVlPiIqNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

On 9/18/2026 5:02 AM, Frank Li wrote:
> On Wed, Sep 16, 2026 at 12:04:35PM +0900, Chancel Liu wrote:
>> From: Chancel Liu <chancel.liu@nxp.com>
>>
> ...
>>
>> +static int mux_pinctrl_probe_dt(struct pinctrl_dev *pctldev,
>> +				struct device_node *np)
>> +{
>> +	struct device *dev = pctldev->dev;
>> +
>> +	for_each_available_child_of_node_scoped(np, grp) {
>> +		struct mux_pin_function *function;
>> +		const char **group_names;
>> +		int ret;
>> +
>> +		function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
>> +		if (!function)
>> +			return -ENOMEM;
>> +
>> +		group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
>> +		if (!group_names)
>> +			return -ENOMEM;
>> +
>> +		group_names[0] = grp->name;
>> +
>> +		function->mux_state = devm_mux_state_get_from_np(dev, NULL, grp);
>> +		if (IS_ERR(function->mux_state))
>> +			return dev_err_probe(dev, PTR_ERR(function->mux_state),
>> +					     "failed to get mux-state for %pOFn\n",
>> +					     grp);
>> +
>> +		ret = pinctrl_generic_add_group(pctldev, grp->name, NULL, 0, NULL);
>> +		if (ret < 0)
>> +			return dev_err_probe(dev, ret,
>> +					     "failed to add group %pOFn\n", grp);
>> +
>> +		ret = pinmux_generic_add_function(pctldev, grp->name, group_names,
>> +						  1, function);
>> +		if (ret < 0)
>> +			return dev_err_probe(dev, ret,
>> +					     "failed to add function %pOFn\n", grp);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> This method also works, slice difference, if some pin have not used by
> consumer,  old method may save some memory.
> 
> leave to linus to decide which is better way, this one or add free() at
> .dt_free_map()
> 
> Frank

IMHO, the groups and functions of a board-level mux are static and fully
described by the devicetree, so probe time is the natural place to build
them, and dt_node_to_map() can then focus on mapping. Happy to go with
whichever Linus prefers.

Regards,
Chancel Liu

