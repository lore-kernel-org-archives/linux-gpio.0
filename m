Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.98
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794751804;
	b=mrCgZ/JYJ6rn0gglJmbbB84seRMJ4KKg0l4fWg22KJsRa2N0KmGboY0jw3rfNqWRq4MU
	 TfA2VwpAhMQ/UgtzZ/LxN4Z7hSpvXBAk+btLtbRsIgQvfvwLehulPzL5gcApy0FnfEwNY
	 3VRiCBhYiCNKBs1EkyBfOOY4Z3TldDuPMJES5NBQgNQmQkSfMuwchSQkHsJggn9SS+Pj7
	 u/tC/+RoZaBPFWwPywDn5jYFF8z5wb8fvVZAbd2S8QadLnCEwCF8ac2CzfT4quviHZBkO
	 +xMOzpPgmraRT/esf/c3lSvvLEX2/oJ9jEdc3cyXxbSrmmoDH8iEReGfW9x4EYpNi9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751804;
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
	bh=Z9RZhJAzIaxQ0h4AUcEDqCfFbFf6lYuypA5olKrlj5I=;
	b=gG3xU1epsV+97BTcoDZn64QQIDkChvWPeBcFBo1+whbfs0kLuzrHDUzKxpm3eD0Z+Poa
	 nc955guDRASM2iHOT9ZznV9o44GDAFGUH65NQs36cHO7eU3HXoI0SM8PmAfYswt6B+4lF
	 3DeAYXJI35cUnsK98Dpb5Ox4VRNeFIsjFoh874u9DO+WUrbdbJQ7Q8HzJv6FX9+Gqiijx
	 xG4jRJpE5LYuGx3tvUaLI19okOGSLQN5Z2CJVKw0Ml3UpeEqEf+hTwbX1JNjMquhauoWy
	 NGDZsL5YgwXMQ7n+UJf8Cd87+kr1xc4ZzutUllQqvSm6wN2PWt5QU3PPb0qQsT8NI+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iopsys.eu;
	spf=pass smtp.mailfrom=genexis.eu;
	dkim=pass header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=zBe7CmfH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.98
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022098.outbound.protection.outlook.com [52.101.66.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D1606A31D;
	Sun, 15 Nov 2026 14:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=zBe7CmfH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiZqecO3Hi87TXqZ2mRsCahl/5UnPA4CDBbDW0CRrvYWgdPpUDmykh0Q11n8rYd9cckG6P1OIOamq/2mtNriN/brtXMjgnIVkW4576a4mt9n261ksh1+IlICtovESUPn20QiavTxPyZe1ZbVsETmoR2uoPluyhw1itrXLhRrzgN7jiHFpSkjQXXHDkABbY87nYiW08chFLqgE7qt4zq/UGjdJ+SorDWlgl3sU8TG6n1HfvBX1Z95K0FVwb/fbew+R9q8v2TJ3q2ab9LJU88UUny3lZWZODGeDMt2dtwIKWqu8TgK2Cjowypv696wuzJQjbQ4eI963WyBq0R7I1JJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9RZhJAzIaxQ0h4AUcEDqCfFbFf6lYuypA5olKrlj5I=;
 b=OMl2HQ0QNUX7NhJdMVRIEMCrPLJ7x+k8U38trTqN4q2UpqKGL699K8zNvs5jM6YLdGFaNSsv8gt5py+4OXOtskI71vD3NMnABW7zj8RXVasw1x9AapUa7iSyF1USszmOKgxEuseaLYBIOEvFYlukDlVRZk05kyXD1owjM98ghuQVYov6m6nzKh+XGcvhnCURh8Xmw4tYxrgbRvtxyG1fzcY/d8xvI7fZY2I2e0qja7UEHpfC5+KO3WEnxqbveJ4D0GRW7mUj981a3qtSSyIlXABgyrj2cdADYtJiRp8XdhVQkGKku8TkOWWK90CPkiYO5IzwB/BtKlcmSh35q9GuYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9RZhJAzIaxQ0h4AUcEDqCfFbFf6lYuypA5olKrlj5I=;
 b=zBe7CmfHp4zjLNMgCqoJaVmE4NAWhr2NMCvIWh43P/tvFWzqrF8eKlY42tQzKYMyhlyOZBOkRHDy9yxunMKP66HJ5ojq7zea742GgVYtXHijNE5wVpUz5QQzC4vTgR3aglNv0wo27p65gOhI7XyPf7zXXGTiANwJ01hfamqar43ewpnKySlogIEiD7ng2iQOwIbaK4uE3Z4QyyKkrmo1xrSu/OGf+P4Pvht5mkXes7jtAYBR27TxQdEX97Bf7zOvEaP+YCmL6THTpKGwhEpd/dx81SIc1vlCBRwZcRYJ7QSRzFqHgqanDJlfYn0cmgNrXJvfggL7dY+ysCSmnb7GRg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAWPR08MB8791.eurprd08.prod.outlook.com (2603:10a6:102:334::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 14:10:00 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%3]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 14:10:00 +0000
Message-ID: <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
Date: Sun, 15 Nov 2026 17:09:57 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] pinctrl: airoha: configure GPIO muxes explicitly
 and fix pad mappings
To: Zhengping Zhang <zhengping.zhang@airoha.com>, linusw@kernel.org,
 lorenzo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 brgl@kernel.org, naseefkm@gmail.com, benjamin.larsson@genexis.eu,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lei.dong@airoha.com, ansuelsmth@gmail.com
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DC3E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2e5) To DU2PR08MB10037.eurprd08.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 49c23a49-ae4b-40b5-3aaf-08df432222c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|11063799006|5023799004|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nqfDc/D4IJ+V6S5/iuWUPeJEJp6VVT3KBNByFeECEsV+RxtH7PdBf5OgK2PUocTPsuUYk4LrnDBCseTouuwVNF/qmvf6YfP8MVJMLabB8aGgiSN1EzbhPJYxZ/goKQ4BYUWykfdrTDK83eHpRs44voPDYNDRzgdBTQGARa2XtMZ3nDruFjnJJOEyVw055Hb1SR3Iz5NDWdXvcYq0RK5xtE2UMCa9vjGtbsFcqaHHrkhDijjOsiioXOA1RM7EYWm00mp2y+WBqEgaE2ZaTomhyPmDGLMMVziiUBVH4ow7VaP6+g2MSs6YNT2jV382BDMM9O1XfYdeuRTulGpNtIMnv58L1rJFmfiZM1CKGNT1wsSwLpUy5RKPgPljkNfMHhcFO+y9N/C5W0EM+gUHLDut63SpojgGKqtm2H60PJlycMuQw+Vbmopgtri3RLwXPJlJjz9H+bYouGpIbPsP9E/o3w3/JXJwtVDxEhuGRdi0AbjRAa7JVI3CfIMiWi/BRcwOFEmVywNMfIwYhBxF0xgkWtB9ZixHj3gNCoSVl1FUuf49pRHRE3VyliQxp41vbGIHTlPCyxLSKbgp4HTcIaTIqp44Ersn5NDniX6ed3fvvzKY6WZkvJN3ygsfyk7suFCThtsAODwDLtSkQCb84OJuyNUSwM/KSCc1HO2yVzWZA0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2tMak5JV0JWZkk5aWE0bG0rdC9hZWZhN2x6YjFZNHFTVDZ1UkVieVBRZG9m?=
 =?utf-8?B?MngvNWI1aDNNaHhSTisxYVc1V1lGQmlSbzZSWnR6amhYVktqQWVtekRrTUpV?=
 =?utf-8?B?dUV2VXA5TGZGTlQvN0J6UmV0QXFtejFRZ2ZEdlVHclZOWitOZHl3S1JtejE0?=
 =?utf-8?B?YkZZbW90cUVhdm9XOER5NElTMzRydzRocnY4SzRSM1dRSkVYeXordFM0SVpO?=
 =?utf-8?B?N3RGK0NTZXhxN0pFSitYUXJRY256anVGS3RxNXBydHUvN1RNWURmRTVXRDlJ?=
 =?utf-8?B?ZEtMRFY2aG9rY2pycUhtamhRUVlPK3IwTlhGcTRPVEFTUWMxMk9Ta1EvQ0Ux?=
 =?utf-8?B?cGhUbUUweGNwY1Z1RVpzWkt1WlBrWmQwZlZRcU9UeUdsNmtBRld5cDdWZ1ph?=
 =?utf-8?B?OTZYY0VFQkRFUTI5eWdoL29xRVQ0b0JGZGJkWmJMV003SzBZZk5pMGhiVnpY?=
 =?utf-8?B?cUVkb0NOYWNCRmtmZkMvQWE3Y2xYeTJPcDF6WmRQNzhUTFhBeXlYZFdFYlhD?=
 =?utf-8?B?RG9sT1pJUW5COUVZbTdFSjNhSlhiUk5Ka2VxZm9KMU9xdlB2d1NjUVNyRDc2?=
 =?utf-8?B?NnlpRXZaQ2hhTHRPQUlkSnVGUFJKNDA4bWg5T04zbDBCbHgzRDJxWTRqdUpD?=
 =?utf-8?B?Ym4wY3Y2aGtTaGM2WEFNQXNVdXFvUjFyTWFheGJBMjNtRFJYdVNCNFIzcjZX?=
 =?utf-8?B?eXpGd2R6MitpSGh1cGN0bk5FUzQ2MG90QVRpMUh3bHZ0MVE2UUpDWlprQ2pi?=
 =?utf-8?B?SGZBbDBDNWdlZzdrVlYrS2xxMlVsRTBTT096elBMMm55akNLdlk2Q0pvcXQ2?=
 =?utf-8?B?Mkh3NWd6TWl4dnBleDdOamUreUVXd2t3clU2M2RsbUxPdTdwWFZpM1RuZkVB?=
 =?utf-8?B?Tm5qN1BYWnpNeUJqRnJpb2hZWnVBVHRFTWhuckdkL2R5Qkx6U1QyaERyeUpE?=
 =?utf-8?B?aU5uYXYzWWJybXJuTTNLSFJxTG43cjR0NVVPc0NqRFc2NjJ4NUVXN2c5TFo5?=
 =?utf-8?B?MFQ2Q2xIa1U1Z0t1WDVrZHpzQ2dtZEZSUnNrT1ZYUlZEWTZYODRNdW12WFRQ?=
 =?utf-8?B?ZFJBL2d0NG5ucmxUZ0h1Z3hVazhKays3Q3FHczlBWCs3TmEyWlBOWVFkNGk0?=
 =?utf-8?B?ZmM2NnMvOStkaFExWjdvUUNLOEdzOFJCb0lNMm93NlY2Ynl5ZUZVekIyc2lO?=
 =?utf-8?B?UjZRVm1qNFFmaGxwWEVjSEpJakdVMlpUQ2lDSEVoUSs4SDVqNW92WEQzOHY4?=
 =?utf-8?B?YUdlcjZnakdPcUlrRUM3bytuZEhJVW5wMjFZZjhJOEliaXlaZllBRisrUFd5?=
 =?utf-8?B?N3FqVTlub1ZMY1Z1d3ZSdnRRT2VGSVAvVmwyUytOdmVIWTd2VFZkemRMK3J1?=
 =?utf-8?B?WXFqcHBibWRuaVRMblEzTXJnZSs0Q05BNldPMGtsWndRVTcyd1VWdWJtZ3dT?=
 =?utf-8?B?MU84QzVvMVlpRHlMaWhabmxHWEcxaWN6bWhKWnovY2xHTkR2Smx2UVViOW9m?=
 =?utf-8?B?V0g0Nkc5MU1iMkxVR2tUYTM0V0s5bEFDTkZpZjl1a1c4MlBGYktENzRUWHZ4?=
 =?utf-8?B?ZDY3WmtyTXY2MHZqUi93M1NrVm43TUFLSDJqYnNTc2NnekdhSUplVGt6WERa?=
 =?utf-8?B?b3V3UDdCcFZiVklOcDJneitsUklXSkQ3dzQ2MU9NNzI0cllSWTFoYjdMaW5x?=
 =?utf-8?B?R2wwT1pqQm44Z2U3YkRORGhFSzNya1ZMbnpQMmxNbVpHbkFLeXBxWFN1VXZ1?=
 =?utf-8?B?Y25jb0NZdDFzeHVJQ21raVBtdDNLeElGTEJqc2wzRnJVVjJxSmxhdjc0a295?=
 =?utf-8?B?S2VXT0htOVd1YWpzdWltMXVvRG9mVExhYjJRQ3BOelFwb0JnVGN5c1VTMzdF?=
 =?utf-8?B?YW1LU1ZpemRlV1lMZ1YyZ0N0ZTVJeU85MnFQOWVzUFJIbXoxbHJhbjdyamx5?=
 =?utf-8?B?bnVFSmtldVl6b1ZFYTVTUjdSMEdSQTFJTk1wZ0J1RVNNeWhNVkpiOWdjamEy?=
 =?utf-8?B?NEErSzBHM2tNaDkyTzVMM290aDRGTVNwM1J0MzA0TzQ4cTkxY3dGYUs4dnpi?=
 =?utf-8?B?ZE4yWHdxOEtpRFNzSng4S2x6dXdBMGsybmpaWitZaVpPZ3dCU3BCQUNDVlJP?=
 =?utf-8?B?c09tRGZQdzRJSmtCUEhibEFRUVV1bVJCNHl1VkVIUzlreXFSNXBxVmFQZDI3?=
 =?utf-8?B?ZVFjNzZXNHRubkl3aGhHaXo2amFOVjNoV1R1aGlNSGI3U2hoWm80Q2o5SHhY?=
 =?utf-8?B?bW5aNXN3aldrd0hLN3FBYSt3bkhtbzBvRGFmTXZPWFdGSDh4VWNGa0ttUzJn?=
 =?utf-8?B?RlF1dCtTajR6K0JBeDZuZng3RnlvRDJFUWtUNVRmVUVwY3NlakQ3NjBIS0Y3?=
 =?utf-8?Q?YEQGhID1QtA9DCJk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c23a49-ae4b-40b5-3aaf-08df432222c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 14:10:00.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+qWk6HuGV1UXAVSPZUqohkVh6XdKzbkWAhTBlp10Sw2DLJPkyDkffBxzoZtaNj6X5+h9PQMm/zVIfcCvwg+oM69VCBRndOnYfK2o5B/pxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8791

Hello Zhengping Zhang,

Please fix your patches. Looks like you insert patches to the e-mail body,
thus your patches were converted to "mail encoding"
* tabs was replaced by spaces
* unchanged empty lines "<space>\n" were converted to just "\n"
* long lines were split with "=\n"
* "=" were replaced with "=3D"

and so on. So please use "git send-email" for patch sending.

Mikhail Kshevetskiy

On 11/10/26 12:43, Zhengping Zhang wrote:
> [You don't often get email from zhengping.zhang@airoha.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> This series makes GPIO mode selection explicit on AN7581, AN7583 and
> EN7523, and fixes related GPIO direction, LED group and SPI/eMMC mux
> configuration issues.
>
> Background
> ----------
> GPIO direction and data register programming is separate from pad mux
> selection on these SoCs. The current GPIO request path does not select
> the GPIO function, relying on the pads already being in an appropriate
> state. If the bootloader leaves a pad configured for an alternate
> function, a GPIO request can succeed without connecting the GPIO
> controller to the pad. Output writes may then fail to drive the pin,
> and input reads may not reflect the external signal.
> The problem also affects the opposite transition. Once a pad has been
> forced to GPIO mode, selecting its peripheral mux without releasing
> the GPIO override can leave the peripheral disconnected from the pad.
> While addressing these transitions, the series also corrects GPIO
> direction programming, AN7581 PHY LED group assignments, AN7583 SPI/eMMC
> mux configuration and the EN7523 128-pin PCM SPI CS2 pad assignment.
>
> Implementation
> --------------
> On these SoCs, shared GPIO pads can be routed to peripheral functions
> through mux control bits in the SCU registers. In the absence of an
> enabled alternate function, these shared pads normally operate as
> GPIOs. Dedicated peripheral pads have separate selectors for GPIO
> operation, so clearing all mux bits is not a universal way to select
> GPIO mode.
>
> Per-pad force GPIO controls allow individual shared pads to operate
> as GPIOs while leaving shared peripheral mode settings intact for
> other pads. GPIO-controller PWM output also requires the appropriate
> pad routing: selecting ordinary GPIO operation clears the pad's PWM
> selection, while PWM operation uses the PWM selection together with
> the applicable GPIO routing controls.
>
> The series uses these per-pad controls to configure GPIO mode on
> demand. Resetting the IOMUX registers at probe could disrupt interfaces
> still using bootloader settings, while clearing shared peripheral
> mode bits could affect pads outside the requested group.
>
> The common driver gains a gpio_request_enable callback and identifies
> GPIO-category functions through the pinmux core. It finds the matching
> single-pin GPIO group using pinctrl pin numbers, including controllers
> whose GPIO ranges have a nonzero pin base. GPIO requests and explicit
> GPIO pinctrl states apply the same SoC-specific group configuration.
>
> The common code checks for incompatible values of shared mux bits
> against GPIO owners and claimed mux groups. Validation and register
> updates are serialized, and register update failures are returned to
> the caller. GPIO request handling and conflict checks are enabled
> through SoC match data.
>
> The SoC-specific changes select GPIO mode as follows:
>
>   - AN7581: GPIO1-31 use SCU 0x228, and GPIO32-46 use 0x22c.
>     GPIO47-49 retain their PCIe reset GPIO selectors at 0x21c.
>     GPIO1/2 additionally require the I2C/MDIO routing to be disabled.
>
>   - AN7583: GPIO1-31 use SCU 0x228, and GPIO32-38 use 0x22c.
>     GPIO39-52 use the dedicated-pad GPIO selectors at 0x21c.
>
>   - EN7523: GPIO0-29 use SCU 0x224. GPIO28/29 also retain their
>     existing PCIe reset GPIO selector settings at 0x218.
>
> AN7581 and AN7583 have no documented force GPIO bit for GPIO0; their
> GPIO0 configuration clears the existing PWM selection only.
>
> Peripheral group configurations release the corresponding GPIO
> overrides when selecting their functions. AN7581 retains its existing
> MDIO and PWM configurations; AN7583 and EN7523 also enable the required
> GPIO overrides when selecting GPIO-controller PWM output.
>
> The AN7583 and EN7523 PON groups exclude the software-controlled
> TX_DIS/RX_DIS pads so they can be requested independently as GPIOs by
> the PON PHY driver, avoiding ownership conflicts with PON mux selection.
>
> The bindings describe the expanded GPIO groups and corrected pad
> assignments. GPIO numbering and existing compatible strings are retained.
> The final patch adds an Airoha co-maintainer and extends the maintained
> file patterns to cover the SoC-specific drivers and bindings.
>
> Validation
> ----------
> Tested the PINCTRL functionality on AN7581, AN7583 and EN7523 using OpenWrt
> master (backport to kernel 6.18), including build tests and explicit GPIO
> requests, with particular attention to GPIO-controlled LEDs.
>
> Daniel Schwierzeck (2):
>   pinctrl: airoha: fix setting of GPIO direction
>   pinctrl: airoha: an7583: fix SPI pin mux config
>
> Robert Marko (1):
>   pinctrl: airoha: an7583: fix eMMC pin mux config
>
> Zhengping Zhang (9):
>   pinctrl: airoha: configure pin muxes on GPIO requests
>   dt-bindings: pinctrl: airoha: describe all EN7581 GPIO mux groups
>   pinctrl: airoha: an7581: fix PHY LED GPIO group assignments
>   pinctrl: airoha: an7581: select force GPIO mode on GPIO requests
>   dt-bindings: pinctrl: airoha: describe all AN7583 GPIO mux groups
>   pinctrl: airoha: an7583: use force GPIO mode for GPIO requests
>   dt-bindings: pinctrl: airoha: describe all EN7523 GPIO mux groups
>   pinctrl: airoha: en7523: use force GPIO mode for GPIO requests
>   MAINTAINERS: add myself as Airoha pinctrl co-maintainer
>
>  .../pinctrl/airoha,an7583-pinctrl.yaml        |  18 +-
>  .../pinctrl/airoha,en7523-pinctrl.yaml        |   9 +-
>  .../pinctrl/airoha,en7581-pinctrl.yaml        |  28 +-
>  MAINTAINERS                                   |   5 +-
>  drivers/pinctrl/airoha/airoha-common.h        |  15 +-
>  drivers/pinctrl/airoha/pinctrl-airoha.c       | 263 ++++++-
>  drivers/pinctrl/airoha/pinctrl-an7581.c       | 629 ++++++++++++---
>  drivers/pinctrl/airoha/pinctrl-an7583.c       | 736 ++++++++++++++----
>  drivers/pinctrl/airoha/pinctrl-en7523.c       | 579 +++++++++++---
>  9 files changed, 1855 insertions(+), 427 deletions(-)
>
>
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> --
> 2.43.0
>
