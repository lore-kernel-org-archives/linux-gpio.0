Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F38384244;
	Thu, 17 Sep 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612225; cv=fail; b=W5RLGpyBIDtfnNPRUiZaDOeYmpLjdiia5XNMc7kNQCt89VZWyWF92moF4Jzz4etY8VlBiDpQkHROBFVKURKPnUnl6swwMJsrj04brxLWEQDC+WUMaMV4TJklwc78Sd2Hx6kAnqc0NOI4Qsz8EnakLnn2F2Pxp57gQBvhq8cruQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612225; c=relaxed/simple;
	bh=MFom5KQTFW7tUCytGPvumylQP5kZuCsiK1S16BoF/Zo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AT0k1VEAZCFw6g6cOVKiKSxbkzwozphAnuJlGJztxmZfPWD+LWw4lQqFkZKX9Aqmk46TXZRkpOOSt+PxZ+8lu+Tni1OTVwhwb09rLuWS+WYNmYlrkVnq4tNKY0rYSXzkd6xCY4+Iq0GyevWKnZznI48yK3ubo6Q889vbvpALMlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rt2apAa8; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rt2apAa8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MARrcMaEF72YZ2Sb5VcNEpnMXCehU54tErJyo0f9jZxYkwkTMIQ3bvABtw4dGWMDF9QHhmN/ZbuUeXOnDJS8TYmM8K0wB52NTOm/w4Lw8hw8/Sgbb2cCt8VtadsVB4Scx4UvB1UzyNrSIPYfnuXQZR2m0yE5N+nKDyYVFMtDhmmLdRGW9ZgOGPHbcvcNNlYXl6+vddxDCA8zfpWGlnCwonL/IBonm9dA/Y8nZiXF9BoVWXkFHBp0bJSkYdpn8jS4LKPdg1ErkK3YiKk3kAZjAFPKjvs7R/sxrPmjooJGxcbKa7IHG8T/wZWonm5soLY86ZLDN2fKNULSMp0fDfAbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9a+Qbz7Q607YxtHRsj+hF6zF3nQ07TEwRm59RCpv2y4=;
 b=cLB5YB6AbL3KBCVcN3Qd/jiL+m/KgCie34VWa+EbBWlMkMzCPitmKSiakanl/SGjBlQVGXrsiV+wtpSHnCQoM0XjwFJwtS9Q8VkPLtSMteyIS5rwPZpTW74a4JEZD9G/x+2uAqLe4A83/J7/HWECdVbHGfj1JmAyUwLxr/Ea4Ue3Yj6hAfIkSA6A/tXdYKlBl4Ec5AN/YrjzPKkW9UOf3of5w+V4ZayjUHssuMqHf1uEgJP3NxqMvCs04V5XftDaWISgMDcLBCatppNnY6yFKV+7we61hikM0QVkgvQ3Bs3UWaMTIS5rFIF14KD7KgZLydE+1L21etowVXHGr3eQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9a+Qbz7Q607YxtHRsj+hF6zF3nQ07TEwRm59RCpv2y4=;
 b=rt2apAa802eL25AeI8FN/2BYnNPMeO4852W/O9yhAxxwumkT3mPBe97TxETc7ChkJweGfd9FlrK1NBmNq+Vtnbcv37kfRI361iYKS+yCZADSLTqUqjHuaoi398VN2VVWMNi/6P79L1hH/kdu5U3KLoyxs1yn2NqA3J8VIXerl5E2loNcb37/AuNGuhASjFd9kGALWEOJjyewJjVbsI40VVK5XlEIF0rZCua+RK4Sit/FogcDU2EQ1gxnQghSoc6mKq27/Nx5gkPaB2EGO8sOmMyRwI3tdXMM7zfDNGMMmW0URli614ZcrxglKk2JOu6x6JWACup47jmh3fV0qT+H4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB10343.eurprd04.prod.outlook.com (2603:10a6:800:237::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 02:30:02 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 02:30:02 +0000
Message-ID: <a63033c5-e4c2-4e80-b1e4-fd8423f463a5@oss.nxp.com>
Date: Thu, 17 Sep 2026 10:29:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: pinctrl-generic-mux: Fix provider resource leak
 on re-parse
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linusw@kernel.org, Frank.Li@nxp.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
 <aqr6u62EOwjXZSSx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <aqr6u62EOwjXZSSx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|VI0PR04MB10343:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be6c5d7-7170-4102-521b-08df14639296
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|6133799003|10067099003|56012099006|4143699003|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	04kgWK+YnNv6Hdw3I5+1Seg2DUKnxcMdaXQxTXIlG4usIPnA/ZkDH2JJwhogXrjmLjcI71A5XJ6GkbJwIeOD9EZsNBK05ChXa+nkJPO07BcOP36im9vKf3HW3Dgz1kAd6/pq3FkPIuOBDC2IzW+5aCyoLViXnA4oSzF/W2Q+IlpKIGb1LN9N6zPdorMqAVDRTGBSkacwt5s0b7QwTQbTNwRFEDS8SJU/MUTU3DpEzvxOyNZNeSpTkfnYhPSpKND3qVRwUgzKHJYHXT1gUv55wF7uRQ5klXeDeYjdNXaU4ws4JTM3XvqhNGA/YtaX/+B+MF6vmXSi+Q+wQGsw1MHHRcWPd55rGmVXhtDtEu/t4nfTv7cKnK7x90F+o/K4eXqfxvBPfNl5wEhRnZg9D7D+EALVCyDZZ+EucT2Bh/RKLtz0nmTIE0WOnpCinEcSTLf3hDUc/7uT52hZc/FTPjWU7Vw+ydqIhU4TGnGmmOxN+4dIG6UqZNXX8je7qM8yqjHEKn6dUCM6qXOsW6T24yXs+Jzl0rhMJ1t5qwOQDDS8on/cdaMd097cMpgXdAlIMiB+rM90Ejmp07IL3kxKQWUfgPH4hwymrGKJJRKvgbJwwy8BvWYNufbXpWguZms6ENfyznjwTo6yeaWTgaFwaYyPOtBDFO2AwnVWQ33AbSlVOME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b25XLzhHa21RY2ZVL0oyYnAzR2lMRlpPUUNFbVFOaGw3R3VON1BmWmVscm1Y?=
 =?utf-8?B?a3pOQjZmeHdLYjd4eFNTUDh6cW12dE8rcHdGWUFvWmtVa3FPQTFVUWZhd3E0?=
 =?utf-8?B?Z1U5SWJoTmJGNG1rU2pFSFVIUWkrMG9WeGRwalVFcHl1cnIwdG9zcS8vblgx?=
 =?utf-8?B?YXFNVUV2K1BnQUJwOHc5VEtDa051WHRBSWdwTUMxTXlIV2krbzZYa1kwQVhU?=
 =?utf-8?B?aWRLR2kxUG1IczlMMDNHRmprZzVoVk1nTzU1REx6WlFUNHRUbmpBTkpRbm93?=
 =?utf-8?B?dFErcXRWRk9MT1Vjb0lzazRPNmxnQ3ZxTXZkWCt2SHRMT0ZSRERlRVlCUkRn?=
 =?utf-8?B?QkRRdlNaaWx3RGVWQmZNd1hManQrZVlnaWZjajRWNXBGZ3ZJd3RZR28zMjI5?=
 =?utf-8?B?b1d5bk9SczJ6VDErOVZFY2pBdWRVL280WFJnR3p4U3JhcnBLQ1IyRW1vaXUx?=
 =?utf-8?B?OXRiYStnZEo5WkJUZ0pSSXFjM0UyRGxLdjV2Y3NRUzlZK1E5NXlKQnF2QUFH?=
 =?utf-8?B?aHNWZWphalBlRjZTd1E3Y2FzM2FGTG5pS29McEtWcGhPNGhlcElNdHpEbklr?=
 =?utf-8?B?K09UNWJoR1U1cFhzQ3BBQmw0eXVjMUgrWlpmVC9XOTgzTXRpWm9oYlB0d2xQ?=
 =?utf-8?B?a2VoTkxKOS9vVUhKM09DQ2NwNUtiUGx4c0NEWW5mbnVyRXgvZDJNNzFCdnZh?=
 =?utf-8?B?SFVXZm5Kb2pleGZ0aVMrWkl3Vk1xY29ENUE4M1hyOEFzbEZBNGFxWUlXQ0dP?=
 =?utf-8?B?WDgyRUdCdm82a2x3WWpOSkJpU0xhY3dma3B1VHBvaUFZWlJWR3A3V0JZUXpU?=
 =?utf-8?B?dTJvd0xJT0t4c1NzZlZ3QnJ1cXZ3N1FxUkhNcHNtYk5XSExUZEJZOG04clJK?=
 =?utf-8?B?bCtDWHRnclR2OHFHdDRpd2RLQ3I0djZaTWwvQVV0QmVZMDhZMitidm9SR2tX?=
 =?utf-8?B?S0dEVExTTWV0NzdrekZOWi9DNWg3WXgwdjZIUFRnZVR2cXlQWGUzSklrdHcv?=
 =?utf-8?B?RG5DcDdHY3pLT0VMOGExSG15b0NwREFpbDRQeFJhSzRmVllVTnVaK1Vhd0Fa?=
 =?utf-8?B?RXN1SmJuakxwSnBUa21Tc09xMC9ZZUt3L1lRNDgrUVN6OU5KUFU4MHNuLy9i?=
 =?utf-8?B?aCt2Z2Z3UjRLRzZBeW1lSHdyZVNMdnpaampOQ2h4UkVOejUzRGhYZ0FTTC8z?=
 =?utf-8?B?b2x2TGRmOW84c0xxMTFzUFkvbzVaUXFWeFNkcGFHQ2dKMG5neS8xbDBuY09X?=
 =?utf-8?B?SWV6TzhrRkxKelNkcjI1MzJkV1UxZUlVejc4ZVFaWEZGanN3UDFoNWhpRWIw?=
 =?utf-8?B?TnZJeHVvdHNYd3lrWGdrRWlicXlsY2NpRXJrQUdsaGN4UGdTN1phdm1ETnJB?=
 =?utf-8?B?N1NPcHBDQ1NyRG14RG4vbzViSDVkV0s5bDk4WU9XTWdPVkQ5ZklmQjQyd2JP?=
 =?utf-8?B?Y3hYOXgwQjFhWElzZ0lLMXcxWXZCNlZZbnBvMzlkUDJDQVZ6cWpRWGtQeklw?=
 =?utf-8?B?dTQ5Q3JQMWY5Z04yVENKTFBPaVFyZi9ITDV6WmF3dmFrOG9RS2srYTY1dzQ1?=
 =?utf-8?B?akF3VHZ0ZERDZzFxdkdBeXV3TkhFeFplYnVTTkRFK3NFdFQyNVZRL0pkbFp3?=
 =?utf-8?B?NHVzQ1RNQVNOelVMRDZNby9RV0h4Zk4yUGtJSzRGWU9oLzc3NUJtV0FQR0JY?=
 =?utf-8?B?bkFPV2lEYlUwS20rOE80TURkRTZMT2lqK2U3ZFdzQmp3WTZ2VUVhc0ZlNmF2?=
 =?utf-8?B?Zm91Ty94dXF4ejhFd2NBS1B3ZHlJUmFld3IvZTlCcUF4SFNrY2tWaWc5NVE1?=
 =?utf-8?B?VkRCZ1I0aEgrb1RIK2psRlZKeVF2akd6Sk5oN0NiK0QwL3F5TDlwU0liTXdi?=
 =?utf-8?B?V3FubFgyeVdkUUFzMmpvNFdrbVl2RkY2OFZLVWhnVzNjRGdhYk9TOFQ4MUcr?=
 =?utf-8?B?MkVrY28wVXZia3FxbjA5WGZ0YXVmSlBLeGdKbWFhSGtseEVrWGNJdFhDOHFG?=
 =?utf-8?B?anQ3YW55UHl6bmRqOHpVK1g2Zy82MTcvek9kM3FSenJJQWZwSHBOSXlDNnVY?=
 =?utf-8?B?Q2d2UTFuZklFY1VlTytXWW1leHNISVRHNTc0K3VMZEtqdkQxSjdoODJ3MXUz?=
 =?utf-8?B?S3B1eng0QitqbUdmNkRhOGVpbHhWR1dkQjkzdU1wdnNCa29UdWVvL1l4YTRm?=
 =?utf-8?B?VnRNemRJKzFBTmFkdGRRWVBYWkJGbVI4U3B2SXM0TlU3OWlJVWxLY1VRVmJq?=
 =?utf-8?B?WksraTZlaHlHZFlUcnVvK1E0TnhwVHlTMUd6RVFkZTczZjZIOEtwRVhMZWZC?=
 =?utf-8?B?akxDVys3NXBodTdUV1UycDQxWm4rUy9sMkEraE1tVC9TbnBrbU41dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be6c5d7-7170-4102-521b-08df14639296
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 02:30:02.0396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meX+C6USMF7LhNqX10KfGkNxT38pNmNiCoZiICOqzzgtc8mhG8QNeqoNZg0bdPcb73RhxVCDbBm936wIXU3NKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10343

>> @@ -38,39 +36,73 @@ mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
>>  			  struct pinctrl_map **maps, unsigned int *num_maps)
>>  {
>>  	unsigned int num_reserved_maps = 0;
>> -	struct mux_pin_function *function;
>> -	const char **group_names;
>>  	int ret;
>>
>> -	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
>> -	if (!function)
>> -		return -ENOMEM;
>> -
>> -	group_names = devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP_KERNEL);
>> -	if (!group_names)
>> -		return -ENOMEM;
> 
> 
> devm alloc is quite popular under drivers/pinctrl
> 
> airoha/pinctrl-airoha.c	dt_node_to_map	devm_kzalloc, devm_pinctrl_register_and_init
> meson/pinctrl-amlogic-a4.c	dt_node_to_map	devm_kcalloc
> pinctrl-at91.c	at91_dt_node_to_map	devm_kcalloc, devm_kfree
> pinctrl-axp209.c	dt_node_to_map	devm_kcalloc
> pinctrl-generic-mux.c	mux_pinmux_dt_node_to_map	devm_kcalloc, devm_kzalloc, devm_mux_state_get_from_np
> pinctrl-generic.c	pinctrl_generic_dt_node_to_map	devm_kcalloc
> pinctrl-single.c	pcs_dt_node_to_map	devm_kcalloc, devm_kfree, devm_kzalloc
> pinctrl-st.c	st_pctl_dt_node_to_map	devm_kcalloc, devm_kfree
> pinctrl-th1520.c	th1520_pinctrl_dt_node_to_map	devm_kasprintf, devm_kcalloc
> pinctrl-tps6594.c	dt_node_to_map	devm_gpio_regmap_register, devm_kzalloc, devm_pinctrl_register
> renesas/pinctrl-rza1.c	rza1_dt_node_to_map	devm_kcalloc, devm_kzalloc
> renesas/pinctrl-rza2.c	rza2_dt_node_to_map	devm_kcalloc, devm_kzalloc
> sophgo/pinctrl-sophgo-common.c	sophgo_pctrl_dt_node_to_map	devm_kasprintf, devm_kcalloc
> starfive/pinctrl-starfive-jh7100.c	starfive_dt_node_to_map	devm_kasprintf, devm_kcalloc
> starfive/pinctrl-starfive-jh7110.c	jh7110_dt_node_to_map	devm_kasprintf, devm_kcalloc
> sunplus/sppctl.c	dt_node_to_map	devm_kcalloc
> ti/pinctrl-ti-iodelay.c	ti_iodelay_dt_node_to_map	devm_kcalloc, devm_kfree, devm_kzalloc
> 
> does all have similar problem? I suspect this when do this patch, but I
> have not tracked these life cycle.
> 
> Frank
> 

Not all, but many do. devm_* in .dt_node_to_map() only leaks when the
allocation is bound to the provider dev and isn't reclaimed by
.dt_free_map(). So it accumulates on every re-parse.

Here's the calling:
really_probe()
  └─ pinctrl_bind_pins(dev)
       └─ devm_pinctrl_get(dev)
            └─ create_pinctrl()
                 └─ pinctrl_dt_to_map(p, pctldev)
                      └─ dt_to_map_one_config()
                           └─ ops->dt_node_to_map()

Every deferred-probe retry and every re-bind re-invokes .dt_node_to_map().

Regards,
Chancel Liu

