Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE993AFB14;
	Tue, 29 Sep 2026 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668798; cv=fail; b=OWnyS5U7K1g89ZhjD5dO0sDc9znuZb2jxfXWrUAnbZRYvCXerTvNGy/LpV7u5jn/ieK5h8vUSk6Sx6ws9EFLXYZxMKZ1IE8cI8qFwozPwsbKnx6u9wiVNCQO77L9wXOyvgQk/MtkR5hp7Vpn9j9+kCinJKH/wcQ5B0gI6/9vFx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668798; c=relaxed/simple;
	bh=YNQJZrD+W/yWBiJQP5B9N+YRphWu0InG4Y2ugBpfvWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h+PK9YqcZf3q626f0JUaDMzfl1C463G/hOgkpl2JMS6vngqYvWZVM9wR2bSpNyFgJECAwo+mZHWvyvNGlJMOLwd4SYeDNPNdYhWkXfJDnt1/tifqA4xGXd/G0lHZttiimtGZGEcY5LM/XNUWBhd0Xzk6zKTJjyWJissk7k1aBqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=X8wXHjEU; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="X8wXHjEU"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U1oQ2405013;
	Tue, 29 Sep 2026 03:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=pFJG7dae7F/ZNH3vz7EcwLsWwvG+g
	ZmAQwTVk/z1m8w=; b=X8wXHjEUQDVhgPyV6ev92+8neh8AgYD93YW+31D+AoAq3
	SPB1/P7VszF9RHjxKIdtwA+PxdBnOjOq21QNKTQ1VAw0lVYXYnx18NV5tjZpCBW8
	3jnkZSTeg5ISRPlg0JZnUoLZ6zwl3qzqZ4srcphZpRJdUpSqV6eoOKSazdUjj8Aa
	k7YZAPuFW/aLfgAvQDhrxLpdNLAw5dncvDf+65VQHyXHo9KowmXpA+UNOEl4E3ZP
	vGpM1OT7LOXusCu2nOUFKS81bQ03IVv64Ls90bVxFX9JDyjKcTi+y4LjhIZR+yFn
	eznPLEGcNvHahuaBGrtucoIpnuJTAABLMSXeDaulw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gys5ynr32-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 03:59:30 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyejHSV/Roap2ELcEvQEaAoUQQ87Zcd7HYNsnIIyM9AzdHP+pGUSuIaC/XQeb0sf76XHpP53jIKNzaXruFzb8Hv/qw8R5JSyELS2SOgFU1l654zsk7nxY9Yy2OlXzi1zhaRYX2bAOvM/xIHbFZnU5X7kt+KgZqppIQhkrpdTeFZ3d+hvW1ywwdpX61W9ukdFgYoSoU0TxtEXmVllmELYUkT56ZjjC9pwHKly8N4cI4Rfg7pmQUR03V02UgQ3kJ9ppa7OECiHSZe84sUMQwajz5wNbeVzJ+8KGIDW5uGqL1pGBm9NeXUKbp+0cHZiPmgDRYpaca+L4ALjVzr+DsH19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFJG7dae7F/ZNH3vz7EcwLsWwvG+gZmAQwTVk/z1m8w=;
 b=pmVibbHx8nj1j50TEgmq/VpsoKKvzQXDdqIVNxk99SIG5fYx8ErKDdXxYO3PF/J8uSshRYoMvjAQ+kwnwaOczAaI5zX46SKiivHpg8n3okLESK78M0pD+qZowsSLAbKMug96mVGv36FPLdKKhxTCodCplUM+GxLP+bh3/PTRBA2tkShm6aJdrwWyEId1i5n/Xv8B4YsJQl+Jvoa76kCdfeJJKnkWm6+YYHmwir05uzfBuwym/95e7/Bg9rGEtAl0P7sd0voTFC3zTDjf9q8tgwt2dB4qvl592xA9mYK2gcG6Q3juMURye4OeaRrgzr4d/8gK5hSobAEHKRXBBg4Tyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by PH0PR03MB6398.namprd03.prod.outlook.com (2603:10b6:510:a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 07:59:28 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 07:59:28 +0000
Date: Tue, 29 Sep 2026 09:59:24 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Fabio <development@redaril.me>
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        xu.yang_2@nxp.com
Subject: Re: [PATCH v2] mux: convert to use fwnode interface
Message-ID: <artvG4bNLnvJ0lHl@analog.com>
References: <20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me>
 <araS8BpKyYI-nkxM@analog.com>
 <b16be8d9-eadf-47df-86b6-4a982c665f9f@redaril.me>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b16be8d9-eadf-47df-86b6-4a982c665f9f@redaril.me>
X-ClientProxiedBy: FR4P281CA0330.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::8) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|PH0PR03MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: c628eb21-b6dd-4978-643e-08df1dff95c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	bp+YINpRIbzAdLII6OUQUHL60f0tr5sHkmNOaA97RiXUsxWLZsk18bbjC8R0hL4iNdBxzXPFxAWFsPARb0GrJRms0fvcbNbVw+UBptC/AFN5wV+bKq3aOlkj3utF9SOhcJ2nzWYv03jDTsKcv+mCevwSZqosAKKXY00Yv+5X8bYAJC2iA5XpLgU9KKCdLfYwK37znYnb79ZSd3p00GBDo/pavnp/Apq1k4hpbOxa6lQ/o8WhETyvoQNELo8jXl9iyuwIzJHS6hS97PyjNWukTfzisCF7F58zMtdWKKtCGvVvP/H4QXUHRbKBk3KeF0UqHFmVeT9N+IrIRrtQRXmSnkVASTwgmraG6EI5fjAfiBgSXV3irRMsHxC1aj5q8B5VXxnSl5tBFZsT0Uy3/KfglbxRpBnYwftOV4mSTMp/+1osyMVFksks6X2AmRPpjyURsL6l+OCLsLQUDTsw0aop6eLg5eUF/TV+hm9UNos9o6OcyW0ZEhEhfxCPBgDxhxp/qPtlgXnHWTfufJbEzliGKgmWlSNNvQZmVqI0cvpZKFDt2RSPMs3mBGu9ffxtGodJIM+BjSYhOg7VWHp0XQb5NCVCYWiE8hVvOQIj/zG/rMaCIvEeSEcdMgSi1vAg8SFw8Q7qj6x84Tb8hT/RSaU7ozfX0NKbHyG2KzIcyfac4Ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2FTeHJrSDZsNXlxVmxUVjc0UklraEtTdlhJdWMxMVFicVpyT0Z5U0hIbEZH?=
 =?utf-8?B?U041aTBlWklNS2lKU1F6Nm9tMnVDWmIxcmN5LzNjb2EwbG1NU3FlR1MrT0pU?=
 =?utf-8?B?NXhqM25ybWVNZlh0STNCcDh2N242cFEwZkc5OUlOdXVNZUFtTTlmODkyOTlq?=
 =?utf-8?B?M1VaQW5ZS0hVWnl2bU1wZTlwUm9jNnpQL2pzUjZEZjNRQ1FjdGprU2Z0VUJV?=
 =?utf-8?B?dE5Xc1Y4TDBDZ2NnaDl4QW1DVTlVWCs1Mk0zMlZYTzhiRGVrdEg5bk5Tc1pl?=
 =?utf-8?B?T25jclF5eWsvWEdEM085N1Q3LythYi93N2FqcW1xVGdzeVEwT3dIUDZpdlRv?=
 =?utf-8?B?bzhFNTFOa2kxclNFbFJZR2VLL1gybVZJaEtFYk9vN3RpdXdNQ3UzR2hGV2M1?=
 =?utf-8?B?ZVhWY1VFUXVOVlkwZCt0azI2VFpUeXVhZ2lwWExhbThya21xUFZxRm8rSWZs?=
 =?utf-8?B?ZjMvdG5pOHZRTFgzU1FQVnU0TzVJdTVRU05lNWt6SS9RRlBaUWJqL1V0R3ds?=
 =?utf-8?B?dFlZSmNqcSttZVdqRzQ5YW9DRThFcmJrRWZId0J6eDkzVGJ3Z3NMcXpIZEhm?=
 =?utf-8?B?czE5amtkd3BZRk5VV2VZd2dQRnprampyaVk3Tm1DMXVWMjk3c2d1MGROblpG?=
 =?utf-8?B?L1phc0k0STlKT3F4VTR1R2RKVFdSQUdtMlk2bWJWRlBqdkI4VnkwSFNOMFdl?=
 =?utf-8?B?dFR6UGFFUC9mZFpPeGxNOWExbWEzV2ZrTkhsemVzazJTWDFOWVl3cndjWFdY?=
 =?utf-8?B?NFVrRURGamdjcHJaeElrRExMeEJTSnVEajZJUlNFL1lEbUZza3FaMWttdlBJ?=
 =?utf-8?B?STJjNDNUZDg5Ny8yL3NnczFMUlJvVzBBNVpNKyswY2xUQ1pxWjEzMFkvblB2?=
 =?utf-8?B?NXdwMGdNVnNBK0xKMDVzMlZTVkxrWW96c2h6WHYzMFFrb2dvTVltem5remZP?=
 =?utf-8?B?T3l0bTBYOTZqWCtFRzBCVWx4YllpWmtlb09YWk9DSlBhUmRWdHZwd3MxVFJK?=
 =?utf-8?B?Zjc0d2NlTTFuN3REQzZmdzhxTVJEeG4rRmwwYWlNRTBaZDE1ZlpHOUpUckRr?=
 =?utf-8?B?dzE4M3grcmZybVRpT2tUekhBdHZGRk9LODdWMDdmUVdrQkVPNytTZEpvTEtw?=
 =?utf-8?B?MkgySE13NURPSGpZU3cxSDkzdmxSMWRwSllqUnZnT0ZjUDVic1lTZG9XWGhE?=
 =?utf-8?B?YXdEOU1taElKaU1YVTZUeFdnY1BxR2dBL2pWTzR2TGFzVDZ6dDY5TzhwbFlH?=
 =?utf-8?B?Mk1WQndzSmNtWEZ4ZnFaOXBMelpMYVB4Wnp3cXpXN3R0YmZrMTkvVFIvNi83?=
 =?utf-8?B?a0RHdm4vK0xpNU53cU1LcDlDZGtFYS9ZT3pCUXVCdFk5WmQ0T0liQ1pNVnZx?=
 =?utf-8?B?SXJ3NTFuRG53em4rTmUzMGpocWNFTW4rK1hYUVJxblBtQTdVTUxoaS95VUsx?=
 =?utf-8?B?eVFsM1NvdFBsWnNqbCtPdUZLNzNzQk1hQjIyblpKYTRDMHdYMGptUnFzOWpw?=
 =?utf-8?B?aVAzQ2k4NlJMTTh1OXZvWkROdHpTamdpU29mUjVrWFUrM09sbHdUMUlSWEVw?=
 =?utf-8?B?K3dGQktvd1kxd1ErNVZ6OStzM3ZlMW5mQ1BTUG1ZZUxlb0FZWWs1TThZaFc5?=
 =?utf-8?B?WHpPM1pXSkkzbU5XZCt6OGZ6SDVBU3FsYXZyN2xlV0FMNmFmTSt5YWJrK2J6?=
 =?utf-8?B?eHRsZ281OUpiMnFnejJFSHJ4SlBzZkJaUkFJY1FZd3Bha3VzcmxRSUhUaUJS?=
 =?utf-8?B?ZldydHZQK3B3Y3RpUXpDY2xEamFsS2RwUURzVWM5elBDMElya0lwSGxhWUwy?=
 =?utf-8?B?NU5Cc21UZTVEaWpXS3ZkSEZMRFlUMGdRZFZIQXhzMkw5dEJjZ0V0M0Y5ZG1j?=
 =?utf-8?B?MGRJTFptTjJvRnFxaTc3MHc5T2ppYXI4TC82ZU5MRGtGSkxPZjdYd2l3emtE?=
 =?utf-8?B?Y1RpUjU0alVSOHpwRXROZkJ1OUpUOHEwM3p4bTJGaStQSWs2ZHc0NmJFeDVm?=
 =?utf-8?B?UWY3dEFKN0xlNU5NZ3VjYkhpcTVlYzd4NnFqNUM5Y2lydkNtemRDdGhtMHVO?=
 =?utf-8?B?Q3RYaTVrWHFMTXoxUTBiUHJDUXdxWHdBcnQ3WGhKUWxlUTY4T1R5NWRySzl6?=
 =?utf-8?B?QzBtK2dMZ3MzQ0M1Nk9lZmMzbTNPWFJiT1NUN0t2cEx5czZSTlB3TGw0ZUlr?=
 =?utf-8?B?b0NoUmtZemdGU0xPNVhBUEdMVUF2Zk9PdkI1K1k4b25FM1pwVXU1d1BYRWxz?=
 =?utf-8?B?SmpLWkZyQ21BdzF0K3UxVGQ5QnBpQktyUG53K1hwZnZ1TUlTeFdVcElFQXVn?=
 =?utf-8?B?b1liSEtQcnpyYU5pNzI1VHpnVjVoR2o4MEpES3dxN3FMME5GSWhzZz09?=
X-Exchange-RoutingPolicyChecked:
	saCmo/VOZK7fG5lBd4mMFWzCo4itzdXtIO0jmzPlUoYEs3JSvHwXJL4z+HtVyTXT1pIzN9WbAp+1HHd48riPRvt4LICkrajeHA1RovNEZ6sz28fvz0zCC+hJy00MHm2tBbAO99ex4Eiq3l/v7Rjhy7qmS54crWeohKyCWeLOCuGQjfaW58q13W05xiHpAWL8m1DDZmEEKcUElE4xbrdakX8re2R7Z9wg+C6KE10TzJv3ldRJ0CoeuqIoOFNd4FSIbSV/+x+9iJe/e8tdJNZDU8GMeRky3FCAqhObiuym8TXukuqWGAL4q4MXmXD2cZTCnodekfSkOxKFW7UUIK0f2Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c628eb21-b6dd-4978-643e-08df1dff95c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 07:59:28.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhUoWP4gE82IvIXAeHBRwoVkA7egBdtIZutYvOsDOE6PanyhgHeW0a7hSMyWQUSeaVHZhrclEtMma7PngdWukEzWzFO8y51gytMlnNlq5HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6398
X-Authority-Analysis: v=2.4 cv=ePyGH3p1 c=1 sm=1 tr=0 ts=6abb6fe2 cx=c_pps
 a=Yjro67SWnLjgwqeg4v/dNw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=W_E7SNS2Sw0gr08ymckA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fME3BqSOR4rXhTZ8j9Dp5354dbjnb_LA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMSBTYWx0ZWRfX1xVPgvlPGcBW
 c7qyAPFpf8Txu4iMgwK30I4DPWUMxCWld6PdmrRLGwlrKtI6V1DnZLAZc8EPBZPlulre860O2WA
 1tLaWxAjQ/Ydev0NXP0mp8CvGb+HziXh86ATCNJiwzKv1CLPCiygCNN+DPy/yfaDEZNYq5fBNtE
 3x9Gxtrzg5KblpZo7HDxeK/RSDMQ+6oa41LY7LWPe9XffR9er8E6HQkGemoPcjYQp2IkTk0zldZ
 QC9SyaCNTGd9eVku/xDLJzIroUcyitJUNlBmQ3Wu3zk/H/wQUaqCDtVPQ0vUhdOJ+A7jd+ZUSXp
 /3GvvAQcLfbTLWiKbi3iBSyxEu6G/StDFuPv+w6dJvMIk7kW0Uomh+17o7/dqTv0t5W6UEc+6kW
 xWLX/RLif18eNnNyvWUJJmEby4Rofhmw+ukWGJcvtsdy+P6NVPEFK6ROKKGiSdBiPBc1NRgOWyi
 ZiCfImIX6l3pgUQa0lQ==
X-Proofpoint-GUID: fME3BqSOR4rXhTZ8j9Dp5354dbjnb_LA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMSBTYWx0ZWRfXwKemX06fUGfQ
 gUnTbYtfeEo+LIyVs5Zohc9KxwG5Hdb21GvFLDQDmEXSMuhS4t3zzA3KgxEkOgKVn41PP5n19ts
 gBdnZMKba5YASBrNCHNubXRzch7Padw7yUPfy36An7UeqZVoIhQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290031

Hi Fabio,

On Sat, Sep 26, 2026 at 12:00:03PM +0200, Fabio wrote:
> > > @@ -566,39 +569,40 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
> > >   	}
> > >   	if (state)
> > > -		ret = of_parse_phandle_with_args(np,
> > > -						 "mux-states", "#mux-state-cells",
> > > -						 index, &args);
> > > +		ret = fwnode_property_get_reference_args(fwnode, "mux-states",
> > > +							 "#mux-state-cells", 0,
> > > +							 index, &args);
> > >   	else
> > > -		ret = of_parse_phandle_with_args(np,
> > > -						 "mux-controls", "#mux-control-cells",
> > > -						 index, &args);
> > > +		ret = fwnode_property_get_reference_args(fwnode,
> > > +							 "mux-controls", "#mux-control-cells",
> > > +							 0, index, &args);
> > > +
> > >   	if (ret) {
> > >   		if (optional && ret == -ENOENT)
> > >   			return NULL;
> > > -		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> > > -			np, state ? "state" : "control",
> > > -			mux_name ?: "", index);
> > > +		dev_err(dev, "%pfw: failed to get mux-%s %s(%i)\n",
> > > +			fwnode, state ? "state" : "control", mux_name ?: "",
> > > +			index);
> > >   		return ERR_PTR(ret);
> > >   	}
> > > -	mux_chip = of_find_mux_chip_by_node(args.np);
> > > -	of_node_put(args.np);
> > > +	mux_chip = mux_chip_find_by_fwnode(args.fwnode);
> > > +	fwnode_handle_put(args.fwnode);
> > 
> > I'm actually not sure why there was an of_node_put() here in the first
> > place. It seems wrong to me. Any idea what it's for?
> > 
> > I want to give a Reviewed-by here for the rest of the code, but if the
> > above _put() erroneous, it might be better to add a patch before this
> > one to remove it (and cc the stable list with that patch).
> 
> I don't think it's wrong, because fwnode_property_get_reference_args() documents that:
> 
>     The caller is responsible for calling fwnode_handle_put() on the returned
>     @args->fwnode pointer.
> 
> What is wrong though, is passing args.fwnode to the dev_err() calls below after it was freed.
> Or that's what I'm inclined to say; I doubt put() would free everything but fwnode's name.
> If I had to guess, fwnode_handle_put is (erroneously) where it is to avoid gotos/calling mux_chip_find_by_fwnode()
> in the sad path.

Yeah, I think you're right, my bad!

> If you agree with the above, I'll be happy to write a patch to fix it.

That would be great, I will give it a review when you send. Thank you!

Kind regards,
Alvin
