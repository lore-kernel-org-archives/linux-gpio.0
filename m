Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794751268;
	b=C4UrmV3vFwFxiq2ZnSQTt2z6VQ/7o29kKWlr/XdhXvcwbGvEHTyH9z3+bcvpsfUTi/zL
	 oWtQSKwEssHhf7jxenTwWVC0ppSXUWAjHRT5fFWkKGk3wfkFS8KJ0QTXjlfPR/3Tz5HKj
	 DPnMAmEpSx5oc9Ge8uujZoSc/XKDKDOLCb1Rt1C7fSmD0W3M7BtPswGKCSp2rqj2Gmx41
	 DGb82BFr/HIROV+P7WPhtCn/ln9jI+aUu6KJF9BD48xSfoECk3kkmQsc+aaqPR8Yd5J1J
	 hzbp9Mbd/P9EpHTrAUqOkTJvkbVaH5W/L8+Fw2V9J8sJ9vhbKLLd40nvEBDa12qpjhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751268;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=STmFUyaqt4S30PfXA7RLzVhGz4pGWx6XGopVs73VU3o=;
	b=Q82acOkrSa7pW9oLijEJUSBaNTzJ4ivQSuEUlZMIlpTPKW/j3X6kpej20J++KNTY6zCl
	 v7j/Cxdh74OGRr0f0vROheZY4NMpeBAwUGqQgp6KqvxLUIm6XlNTusPYXwp5cK03AjB+Z
	 wuj4eBAgVlDr/Cnu9ySaK5mCldFZ7LVbsWWdnFG7cOL3qzQBE6xxNs8p+Fo1c3k5X/Rj1
	 UTxSCF5dNIETP9MzBewhivmLLQ/zUMIGLpvW54mJ8mTia9izicV8zD6oshCJ/b50rqxV9
	 o+doFm6J9JCZeqaqmdFZQ4gacWo7nDCQFGNd9lP2WLaGyXNs4NfWfhKjXtfwuMf5q8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iopsys.eu;
	spf=pass smtp.mailfrom=genexis.eu;
	dkim=pass header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=tev2uXu9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.87
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021087.outbound.protection.outlook.com [52.101.70.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19E6606A31A;
	Sun, 15 Nov 2026 14:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=tev2uXu9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCvU7inqqJTsO/qHq5CKDm/IaFUG7U6QDzsYZ3tbZCpEcR+N1WfQf0kbFhwAz+Sclxa++8YGErVTzKhM5NObfnXRf3abNMddlb27wGpZSvH6LnMbQuXckkAx6VkJiPJYwduWIsQdzaT2/s++LtY4XfI4WUaoSy5etJMg5N1EIpYRvhioplthjWC3lGbdodmZ8EpfwOdIynmtIu524Fr9EIDzrR77fnOmhUCsG7FeJglKMdeHVWVFCwjFMVEYTh8iMg6YunBIDfesFnbmXO0cwvrAwXWzTuIuZSa4DioD1O5FtYaAnnGWQ9dpHoAtSBbFJRq0wGE0Uaj1WhVIY6pp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STmFUyaqt4S30PfXA7RLzVhGz4pGWx6XGopVs73VU3o=;
 b=R5tjMtPVxlKQ86jUSHOJ1xblKGmBNRubnBbJk0FESwgBEUaPqeXrbk/JTAzxjnwg/KjntlghiqY/w/RR45QYt+GObOvRy6tI0y20mBT7eAQwYcI72seCys2H7JR+bBzb93skGiW0BnO2BIBito11bWk+XgB1aQkUPeDamQcFib4VmKnUBtjpldI3qWH9ZtbPcUPyLwiuq8eEiLb/IXgM7td0NMInGF2Jimc0ogqhg55tvznsMWS/8QTUPsRSpqtUaZNlG6oXLr2LQE4RBPfHV16qA+Ie6w2Ee3h8fWzO5brc88ReBzzMv/ELcBJU7684ZO9YHstBPQ15obWIzs0rPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STmFUyaqt4S30PfXA7RLzVhGz4pGWx6XGopVs73VU3o=;
 b=tev2uXu9boxzwxhKInMwmMTFtAGZp05UkUW/7vBbBOSC3wbLs1Yib1iT3r+2UdyPBF9SneXkiYzJAd6dcwCoGpjqDXMsTZQwafob/vnNfYGyif8sBwFukX4/jR9o8B46fkItsx0Ii3DmIJwfZx3nfRr8R0dLwtqLkXcPRJoBsARqYhzqtVeHVEr1kxZYLkG3nWBPfU2vuWwA2jkN7/vEElUkAdmuxfpg1avZC6awFIkhpxWDNwi6whSmdTWspArFjZtEL/oCyC3kYF2YneCL0MYX4heLJsWDwDf5Q9KEuEttZMwP1dblLqpY/j3xNnu/y4jN4099ozOpp8Vss1obDg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAWPR08MB8791.eurprd08.prod.outlook.com (2603:10a6:102:334::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 14:01:02 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%3]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 14:01:01 +0000
Message-ID: <e1570582-15cd-4842-8dfc-3c230f527bff@iopsys.eu>
Date: Sun, 15 Nov 2026 17:00:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] dt-bindings: pinctrl: airoha: describe all EN7581
 GPIO mux groups
To: Zhengping Zhang <zhengping.zhang@airoha.com>, linusw@kernel.org,
 lorenzo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 brgl@kernel.org, naseefkm@gmail.com, benjamin.larsson@genexis.eu,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lei.dong@airoha.com, ansuelsmth@gmail.com
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-4-zhengping.zhang@airoha.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20261110094339.749110-4-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DC28.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::111) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAWPR08MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 98eab58e-3ba9-4786-eab6-08df4320e18a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wD+0bUJDIE88lVtmqH76t5JVzu+bmQXZypS8OhbSW1mO6aGtJrI0KHpWXp1oTBqrhsK91YwfseERlfX4pAcyCERvr/VxvXruE7nFJ3hV+MCdy/wPiWq3+yLaiP/4Qygv/W7CRt6VxGXOyYlrrJqk5UyfTfneOwR1o3qIhzVOgbQP9awk4ryzs9f5mU9Pgz/OQdap5qNPt0culb6/L5Avtrx3ePU9fSZ15K6hcTUjckOnnzF3vcOb9Fu3rBiKWBRV387FV8yv8w27D2FfwbxdiQJXnHx67kOJEEatcDDBdKWsjTTlMMnZtx0lOFfG8nO349rjUz1RHzqvE2qDiSFCvc41C8aQzrdF/EvWa6KhlxT65sDnpQU9m6Vi9rV9kUA4aLyVXdiQBCPohXTC7e6VVF5QVx1tmnQUfi4fOrR2fzbmSD/OiZvs00xobX5XegUEoK1hV9lq8IGxQAiGt1W7mOXUyBwwQpfjxvt7arqR+tKINBOLxFZcCDGy4Qp+F+ZX05EEqI5N0k45slk1SKRteRhAlH6s8lVMZQEhzy9Q4tzzTixn26UVoQomjIyyqQDePYytP4+KOxKnrminCjhOBrqpTm+vnWhr3YITj69qfMzIU8k9MmWz8qpn3tu59TP6pp1wXADn8prLeo70+wj+pIBulUDovOnJpNsNMLqqAg0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RktVZFRpN0NFZE5CaEtuUm1tQVUvUExFWDNWcWJwWkZUM09NTkVSSjNGdmw3?=
 =?utf-8?B?V2ZnUmQ2LzRHa1ZOb3d5NTZIcml1bXVGeWJQR0dMUS9BRVhuZEJ4VFFINHUv?=
 =?utf-8?B?a3VOUC9MREo2UlcrSVdJVUFMQTRuS1dGWXB1QTN4SXRyZUdMWE1ZYmo5YkxW?=
 =?utf-8?B?U29TNEQwOGlYb2kxV2JiV1p4SmxYNjg1RnZ3aWFMUkNIWjJTL1BWVEZDb2xr?=
 =?utf-8?B?UHNFYTRoM3V0Kys1akd0OHFvbXRDbXU0M2s5YVlycGVuR054ck1NVVdNU29y?=
 =?utf-8?B?YzJZeTRvT3NGSHRHdlI2L3RPM1hST0pXL3hiN1NNZXltRXdsc2toU0krTVVL?=
 =?utf-8?B?VTg1NW4yLzlqRWZYME1ZL29HYjcwdmFhNUV3SitNZHhNeU45QW5hdWxkckFS?=
 =?utf-8?B?S2w2Z1pxbjVya0xvNDFNa0RKTThmVFY0dTh2cEI4S0JBcWhlMVNNWGtZN2l0?=
 =?utf-8?B?YitXNDYrSU0vc3hKTk5BS21TTnJlOS9GazE2c0dHa1c2OHdGOU5vUkhoSVdN?=
 =?utf-8?B?Y3ZWNWFNRUFJNFBlK1RDU0IzTWVscnViMExwZ3pRaWxjT3JBeDdwUzY0NHU3?=
 =?utf-8?B?aHRFOGNHS001alFQL0FQb290em5iU2xDL2FhYlVGS1c1Qy9JWG1FWUFBdmg4?=
 =?utf-8?B?aEZxZ2R1Mnc0b1I4M0E4ZjIvS3BHK1AxOXI5LysvM2hkR3g4TG9aVG0vdnRv?=
 =?utf-8?B?L1NFcDFzS0lGT3ZDQ0FheDltNDJUUFhvbklBTXR1TU1nblBHeE1tRVQvSlI2?=
 =?utf-8?B?MythRGt5cXJGWVhXNjM4TkhMVUhLRHZIMGkxd3FDMDNQUmRxUW5LVE9idkts?=
 =?utf-8?B?TUU3RTNSYmFjQ2d3SlhpZkp3djF5MUFNd1VUa09Dc2N3VHFNODBJV3RtSUp0?=
 =?utf-8?B?UDNVSHBOTTJ4UUlwOWRVUzBDK1Njc3BnK01TUXFIcmwydVVPS1NBOW51azlP?=
 =?utf-8?B?QlEyK3d0c2RrN1FVQ1JsaG9yeDBQK045RytraWtNMk01MUoweEEvczVGd2tV?=
 =?utf-8?B?ZGJHZkkrdTF0QzROK0lUaHVlNTU0eXdkNmh6ait2NytHZG5ROXRNR201RGNr?=
 =?utf-8?B?S0lhMm4rZUlqc0pPdXJaRS9RWnZrMnpCYW1UVUlrdUdKMXJ2ZDBoMkp3eEpP?=
 =?utf-8?B?TkRZeXhqYzQ0VzVEK0tPMUl2bzBtMVpMMzhZNXY0VzR2RWdZOWIzWSt3RTJR?=
 =?utf-8?B?dHJodmdWajZVRWY1WFFmcnE2d2lobmJRM1N5MDFuL01mWWxiZkoydnZBcmpG?=
 =?utf-8?B?YmtUeUtDT2FHdXBNbVNJK1hKbTdDOVdRbHNLbXhTOTlhbE1kRHJTU0ViT1dJ?=
 =?utf-8?B?dHBJRG5BNndRL0lqYVZ2V1g5cWlOV0d2dlczcE44Q2ZZSU03bTlESlJNaTBj?=
 =?utf-8?B?eFpGR3hncEVzZ0dCVmR1T2xsamVOQms5VTZ5Rm5TMHNRV2dHb09mQlk2N25F?=
 =?utf-8?B?aHRHdEhscVBtZ0dPMzRIZGpxNnBENjdEQnZmT2IrU1RTbCs5VitGdk1QWWNh?=
 =?utf-8?B?b2k2SThmV2hETzZFdXptZkNqbVVBS0pTK2xvSFREUDBSeVk3VmhKczVyUkdZ?=
 =?utf-8?B?d3VDME9yV01kODQrWGx3OFVyYjQzeHJPZ0U5U1E2ZithdG9GYUs1SnlUWWZL?=
 =?utf-8?B?QXVnbFZYbloyRzJiNERnbHNCWnhISmtQSy9nVkw3OWJteUNhMzI4OU1VOGwx?=
 =?utf-8?B?dTV1bStRL1RCTTBPT0JiUDhRbVFNbmdsMFdzR2RIVzZxMEhYVkphTUQvNG5Q?=
 =?utf-8?B?S29XZlpqdkpWNHk4SG1wZVJRcmNVTGt0RWhWYzBESmV1MWtLWjVIaTF4dEV2?=
 =?utf-8?B?dkdPM3NORDBMVWJKSUNkM3A0VVZZa2Z4RmEwcGdWallxS3ptYWQrZGFLMmxn?=
 =?utf-8?B?dnR1Tm12NndLeU5OK1RndWhHeFFCSHdGRGszRmZZazRJeXZlZXBCSUhSbUdW?=
 =?utf-8?B?MnIwWDNuK0hDaUFHVC9Oc1RwSGZTb1ltUUNEY3NNYlVhS3lIS1NIcnVrVVho?=
 =?utf-8?B?SlVUdmhiM29RSDFlaWlNaVRXdzg2dzdUeWNGUVQ5UmJYeGlsYmI4amdtNDNk?=
 =?utf-8?B?UExXNTlBMEp5MDg1blFyY3NVVmRxYjRwS0JtQTJnUFJ6cDdJamUraU55aFoy?=
 =?utf-8?B?UzFnMWgvWTBiRUVlSlZ5SmIxSXFZTFRDeUE5WlBWd0FQNEJYRHRUSHZoQ2N0?=
 =?utf-8?B?YWJrVzNvUkxOZVFBa28vM24xWjdmTXppUlZnK0xrbUhpNU1QNWtVMHN1Wk56?=
 =?utf-8?B?VVNTUkxza0RFZ3JPRCtUbVVUOEF3UTRjaENRZ3RBS0pSTG9YcHh0c3V1M25Y?=
 =?utf-8?B?dUdKVHh6ZjZVTmF6ejl5S1lrWkJ6QlVNUkZkbHhSdmpOK256UmNiRjhHUXlZ?=
 =?utf-8?Q?7wqCOHRT23JbLuiQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 98eab58e-3ba9-4786-eab6-08df4320e18a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 14:01:01.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEmcjG0vksJyxAYg0k9fvd3/u0CnhAvyA5IyPp8w2+BIyJYLbF8kC51xUgWmgCJAKUPUvCBUk+Ko8HqaL8c/NhPR/rhPFSdt0cB1R3rk1Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8791

according to an7581 datasheet
* LED0 uses GPIO33-35 and GPIO42 * LED1 uses GPIO43-46 so patch should
be fixed


On 11/10/26 12:43, Zhengping Zhang wrote:
> [You don't often get email from zhengping.zhang@airoha.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Expand the GPIO mux groups from GPIO47-49 to GPIO0-49 to describe
> explicit GPIO mode selection across the controller's GPIO range.
> Allow multiple GPIO groups in a single mux state.
>
> Correct the PHY LED pin groups to match the EN7581 pad assignments:
> LED0 uses GPIO43-46, while LED1 uses GPIO33-35 and GPIO42.
>
> The corresponding driver support is added in subsequent patches.
>
> Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> ---
>  .../pinctrl/airoha,en7581-pinctrl.yaml        | 28 +++++++++++++------
>  1 file changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> index 0cf1826c691fc..fa7b3dc58a3ea 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -194,7 +194,17 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio47, gpio48, gpio49]
> +                  items:
> +                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> +                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> +                           gpio14, gpio15, gpio16, gpio17, gpio18, gpio19, gpio20,
> +                           gpio21, gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
> +                           gpio28, gpio29, gpio30, gpio31, gpio32, gpio33, gpio34,
> +                           gpio35, gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> +                           gpio42, gpio43, gpio44, gpio45, gpio46, gpio47, gpio48,
> +                           gpio49]
> +                  minItems: 1
> +                  maxItems: 50
>            - if:
>                properties:
>                  function:
> @@ -225,7 +235,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio33, gpio34, gpio35, gpio42]
> +                  enum: [gpio43, gpio44, gpio45, gpio46]
>            - if:
>                properties:
>                  function:
> @@ -233,7 +243,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio33, gpio34, gpio35, gpio42]
> +                  enum: [gpio43, gpio44, gpio45, gpio46]
>            - if:
>                properties:
>                  function:
> @@ -241,7 +251,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio33, gpio34, gpio35, gpio42]
> +                  enum: [gpio43, gpio44, gpio45, gpio46]
>            - if:
>                properties:
>                  function:
> @@ -249,7 +259,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio33, gpio34, gpio35, gpio42]
> +                  enum: [gpio43, gpio44, gpio45, gpio46]
>            - if:
>                properties:
>                  function:
> @@ -257,7 +267,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio43, gpio44, gpio45, gpio46]
> +                  enum: [gpio33, gpio34, gpio35, gpio42]
>            - if:
>                properties:
>                  function:
> @@ -265,7 +275,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio43, gpio44, gpio45, gpio46]
> +                  enum: [gpio33, gpio34, gpio35, gpio42]
>            - if:
>                properties:
>                  function:
> @@ -273,7 +283,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio43, gpio44, gpio45, gpio46]
> +                  enum: [gpio33, gpio34, gpio35, gpio42]
>            - if:
>                properties:
>                  function:
> @@ -281,7 +291,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [gpio43, gpio44, gpio45, gpio46]
> +                  enum: [gpio33, gpio34, gpio35, gpio42]
>
>          additionalProperties: false
>
> --
> 2.43.0
>
