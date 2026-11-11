Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381029;
	b=Jw9bkkrQX7LAp7M0HrMdtb5pKtdudKTWb18ouJn9NC8lacu8L7TBTMTPpVi7xsFl9iLJ
	 J/rxypkjmtQfPKPu42HOvMX7VZLQPaOwYQanp2Nc4zgaG9bjskk6MyAV+Pd9z4eIe4w4R
	 KIDeaTPWjW1vgn4VD+0yc9nQr+0eLmPXhUKZLUJw0oGPmmBIGWbP9qhSciWO/y/6DBmI4
	 MKHgf1j8z2QbIM7+cwCTM7TSLOan7zOZdt4x1GEs5fxleQlT1KAS51tYsuXrcQtSeQkui
	 ElCGtTBi8V0a7kRH1MmihvAJxqe7biREVhHOsWrEiVPrnk1bKHCoHTicY0pZmKxl5mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381029;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=o2ocvwUtRHoZO23Gn/vzzci2bnDtKHdN1bTUTkdpVyg=;
	b=WKZv4oO3JOJS+y/avtQ6e2VIojQPKVK7SDBPUlhTSBj3o0Opc0RwXSaX9yF7aTgLwWck
	 6c44weYhxUHzDfJU8rGer5OdiaEgMum7NmRlHymgh69WRtQryI9rxXGxENHBuRiP9D/KU
	 xC2OXRjdUCOVPtYvo1oJ+lQujdR7zVq3byXgbuEriQpg7SHLE075EWXrCnK8wiEbGP9ls
	 rExRXY32PlqKr22mwyC5WN0czw+UcMaNIYcZal73XN3wQF1Y0l0yt5kvYm0856nDbqOz9
	 o44+06V21UQIkexWlx+BHP2cQ48KNxYZqtOsMggoidyhp/xR4zF3LxK0PZkwakL25aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VJLDFdzO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.70
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DAA606A31C;
	Wed, 11 Nov 2026 07:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60DAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VJLDFdzO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukFjfhc0bRHOro1Gi8AHYvAQ5H3XGsFERpdL1ycuy3W8Ja1Ifs5DDH4hpqXS/yR8/6/SyHlsPKRLWn5OOWNdCkuGAhjJoJ3UkrtE0LxWjKDnntkKpBHp2038gZ55oHcXCvkSp6Ank4nW9RBBuNe6oRXhW1P5q3VqNKyneyu6ZQp43Q/ZfqvzB8XgmFoBGBcOtOm33oxN8kTKvM4Sa7phBWX3hUJQPtACyrE8xtj22hbBr6/VlvUPcPEu1SRBX9UqReSRlV/B8rx6e0E+Z7tiVJXIkrTYbAGeWWyVPIBtoK6omau2be3ti8Px3vG8lJH4dGBdJOMYJ0fnNSLYkqlllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2ocvwUtRHoZO23Gn/vzzci2bnDtKHdN1bTUTkdpVyg=;
 b=oNVZ1P7Pu7to3UYAaUAV6nIl9nszuHHuAjTHnrCByJWlYp3C1GE0TqXC56Ai0XoFHRgNBh46NU/KSuQYETBYHM5nOJwjI21hgbuj07ur/qIo41L96uJVuvQmfEPTwmBYg4sVaxfbkoCO5xCYY91oQvYVlc+1kVi0kSo2I4MiE8VEuTQyEQKvLAof1yMGgYrX+Pm20MBiGMsGzL5aWYz+KiSn8+3lms4C45xiqAVPvsLpLuIscUArvZBO5sAVC/qsjjVXqMZAH9efWNmjS0V8l8QRBQyFX154Spar5k80h9GUY1sU7Lo9qGF5XhFFiVz1dMvjblIGH5ILvdJdaEUcfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2ocvwUtRHoZO23Gn/vzzci2bnDtKHdN1bTUTkdpVyg=;
 b=VJLDFdzOsAwdORzmnHca/m5i7qLOZeM77ztA8/MKUcJYSXmmeDlDPWKhbJSIvUTix4J5k7xSYRDKOmjDsLLh2Ce2Cf4P7FUzC6J7kRdjZyRI+Tb3OzWfUk0Mbf8Yx/7Jf6cJfhDBvUZ8fzPt0GUuhkKeBWcwsKgDuOnBvwrXADOHm9rLBo1Ucs5rbT3SwhyWjSiEmZPsoGDmsutDqhnbBAh9jwCwHb9KxfoC3BoQq/XOk0cR+B44YTo0cuKGY/SoJ9utEXoct1z8EzDbOkvjaLaRmki+VPTCmx7ouCThHCfAxYXjSde3tYXuHL3wkmL9+jRoLCXv1h8NnMEpo+K0gQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB9246.eurprd04.prod.outlook.com (2603:10a6:102:2a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 07:10:19 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 07:10:18 +0000
Date: Wed, 11 Nov 2026 15:15:07 +0800
From: Joy Zou <joy.zou@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Ye Li <ye.li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC
 data
Message-ID: <avQV+8VrthWpKAWT@shlinux89>
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
 <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|PA4PR04MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acf1d42-0835-4d69-5c45-08df3fc2d70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|10067099003|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261022075727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WTI2JhlF8B1/784s+GV8EUuFymeAlQXHHNxZNciWfrW9lA0h+O6ULVvBupZTe/eBM5vyOtm5d6ZkvHBEPKYterMsrK5Iorde9O97Td3rKrNku28Lc6kJ8whQFiqEppbv9b3W+2P4pPOIw0FACgiRJDpSwle6VRQoWCyqbNkWU1VmliOo8b9znyD/k1sfKjcrn0OBWnNlALvOxcYZWzJleWEZrLE1MV3O1nmrNbu86Mg8RisEzDjOcQ70itqjt7q8RWpg6DyAPzNLfZsPvdIjlw9KYzVvQO87rFaUBbC7yatyexAjtxDo/vNMWr0LL65v9ATotkCSQTh6QoKEvpPfjcDfjffaKix0f6DHM0+xLGzTMXqkoUmDzUH9gqmTYFfMw8+G3a7eo4Fe76Q2ZVsCnBckF7gHDho0sfq6lVd23u48F8kqG0Ci07ozAdqp9HMSc0SasHMZh3XpWngC9bZjO3arUcf8eWOLELllfOHmOPkzmLtDxI44lmyw4VZVgoEiUJt2buxUSZO3KJzPq5Ld23H1fImwy/nS0pB8QOXNziwpkxiDtVZ2DUeGUqN6Lw8zJNkAKUzazjU5oYAMpJqwFAGJnuguanbmFmShi/cdNBJZPOR3i5nr6ajdk7DwKdLRoEp97C2Jh1QmkWqVrrwDk/o4saNCnRkU5i2hy754AQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk8xOFczTFZMZUh6azhSclQ5V3BPaE55dE9KQkpMZXdKTWZ3UWFSS0pNTEJw?=
 =?utf-8?B?NlVYcTJUMUhRZHpWRnJCMEhsRitCS3g2ckpMZlhjekpOcG9LOHc1cE9HZkE1?=
 =?utf-8?B?VlFFTVd2OWRWMUhoZGRtZnZ0a2ltQnZoblBXOS8vcDZ2OUpjODB3elVmdXhi?=
 =?utf-8?B?cjJrMjlJTVVGOEJvaWJIRkFGZ3BBc05HT2lQOEdkYkNxaGpUemRmNTQ3b3p5?=
 =?utf-8?B?WURXUU1SZlgxVnIyQjh4ZjFGWmdINHNJK0dOa1BheUdEcWRDdU5hd21wN2Zk?=
 =?utf-8?B?WGc2ZlFlRzFCcGhmQmEyZFBTYkZxWVhxR2xhUm1GeWFUOGdvdHBBazBhNVFi?=
 =?utf-8?B?SDEzZjNpUFJQOThObExUNW9UTHQ2MjJJcVNsMk5SZU5MT01Vc3hyL0Z0UFJY?=
 =?utf-8?B?SzE5amZiRVpnb2E5YytMOGZjWUVHZkswK2ROSFl2KzRRNHU3R1h6a1pkcXZH?=
 =?utf-8?B?V0NVOGhNOGFrbWptbmhqQytkbmtaY2VoQUd3SUR5aWtqczVUU3AyUHYxa1hj?=
 =?utf-8?B?NVE0RUtJZVFxQ2RUVTJ3WDJPMFZxU3NkWXdiYWRQTG1zelJLRUV3bStSTXBD?=
 =?utf-8?B?MU9rTHRvSzlCczVHSno5QmhqQWVVOE5vbG1tUkVUenBiNkVkMWxoejBEUmJp?=
 =?utf-8?B?SHU0T3NyOFpncm80dHpQWXc5UmpYWUd0KzZqT0RXQVFTNWR3VjVYZ29NdEVi?=
 =?utf-8?B?bnY0MjBtVXJ2alUzSWc1Sk1JWVZTRzdja2N6R0tyeC9WUmtWSmJpQ2FCa2xu?=
 =?utf-8?B?bmhOR3BqUXVQTkpabmNmNDQ1ZDVKWU95d2Z6T0pHTWtNOHd6V2lWb0VJcnJu?=
 =?utf-8?B?T1dmMzZJVlJpaXFSNW5nM2hmV1dFZkhiNkhLTlV0aUFqY1pNWXp2Y1NnZFlL?=
 =?utf-8?B?M3c0Z1dDQVRvYVdNTGVHaVNnYlU5K3FRaEJLdUJyRGhiYzdjMHlRWDE4TE8w?=
 =?utf-8?B?bzcxeFppdHNRVVVmLy9GYXhFRThMa0hqOWhwVFhScER3NmdzSFZUNGNnTUl3?=
 =?utf-8?B?MkhWdjRlcjh0MTExTUJCM0pab3A2K1B3Y1ZkMDJlT2M4OWpPVTh3S0dlUHFU?=
 =?utf-8?B?S2ZiRzJPYnZKa1pnMm9FMlpYMUg5ZVozRHlmY1FJOXR5a1Rid0ZJSlpDa2F3?=
 =?utf-8?B?bmNDc2U2aEJVa25JemVnNWdXMjhwVTJwTU5vVi9CRkwxYzltc1RUWVJQRTdD?=
 =?utf-8?B?WkpZZnN2QTFkMlR6QWd4U1dRYTU0TFd4alNSYmhmTTFYR0svOXY1V29vcXJU?=
 =?utf-8?B?Vzg1R04xRElIMWQvUFNBRGJXKzVQbEF0dmdyM3RRRHc5LzRBUlZ5TmVmYzgv?=
 =?utf-8?B?eXNnVWNYT2t2R0hQS2FSbk1jbTFPSmJWN1VLTjZQaStxbGZZZUtXbXd0ZSs5?=
 =?utf-8?B?aWk3OE0zc1ltb2ZBZUlMY2s0UHpwV2pJN0UzcjhnQUwwR2NkQTlUbk1lUnFN?=
 =?utf-8?B?dUtyZFdKRVFpZEcrMWc1L1ZCU295ekpyVjFYZGs4WTNxOTBwYjhBQXlya0Z3?=
 =?utf-8?B?ZlNRRWlLTGFzQVNtY2RBWU1ZWVBaRlY4a0Q0MmtaOGZ0eEFKZjVyZ2xPTVRG?=
 =?utf-8?B?bzB0R2tGT0piSWlkOVJqZDBZdktDYnVnTW9sVGxLSUJJZGlJV2owaE9nUDQx?=
 =?utf-8?B?SVgvODFaN2NsMndWaGx4c3ExT1I5dTVjSlBlTlFaUE94OU9CRjc4Q0ZHU0sz?=
 =?utf-8?B?VTNqUDFJRVl0ZlNidEwvMWRudGtVdHM4Tlh1WUxHK3ZkaGpZdmxHRVZYblhS?=
 =?utf-8?B?ajhFbVZjNUZoYzhnTG9mWnBFZlUyT3R1MjJNUERybXBpckJuQ2R3Z2xlQXVs?=
 =?utf-8?B?NzFOMUZnZkxzdTZmNHUzeW5EMjRNcU81T3NrRFNzbTFyQlpEY29OMk1lYkRr?=
 =?utf-8?B?TlFnZHBHTmNMaUFkK2dYSWJxUmMxVlIxRm8zc0tFRnE5cXZjZXlGRUxqMXJ3?=
 =?utf-8?B?T2FQTGhRdzVkWHNLcFc5WllseHprcVJoMTZkeVNqMHVYa2IvUE1CMnEvYksy?=
 =?utf-8?B?SU1pRlVaSDhvREo5ZXRPT29HUUNWd2h2dVNtVjlsVkFhR2o2WWpZMWpoTnpn?=
 =?utf-8?B?dGRkOVJxVTVvK0VYZGdXbnpaZUNwZDBiNFZJV2Fva0h3OXZuK2xRVkFCczli?=
 =?utf-8?B?L0tLVWk5Um53N2c2RmQ5UmNSb1hlTEpGODFCYW5lamwyM2dYR0tOeHdlaXN2?=
 =?utf-8?B?WXBYU2NEV2xDdFExZTJGSXhxSHlweWM0R1YzdGprdnBCOHR3ZWRpQ25YcFFZ?=
 =?utf-8?B?STRDbHpLZGlwMi9nWjFuRGsrMlpKNThRZTlBcDJDQkg5ak9Hdm9pSGxGd1V3?=
 =?utf-8?B?SGVNMkNxc0wvZjNLY0pBUkM4N3RqUDI2LzFUTGQ5TElVd2pQYjhYbkMyemRP?=
 =?utf-8?Q?w7YJEQv5jHrq9duxubsuVbJAjgyhhaEGHo/Hz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acf1d42-0835-4d69-5c45-08df3fc2d70c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 07:10:18.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC32MC1MwG9JU8I/hbdKwz/GsKnB3FbdNd7hAGuSpf2NI/j3268bSMYA/8PcvVGbSfeuYgXGZDn7JFlt1nmgG+HT+7DSEfKGr5QEGRvOTptqPx+fgvI9AVzxI9HTBVOM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9246

On Mon, Oct 19, 2026 at 08:12:26PM -0300, Fabio Estevam wrote:
> On Mon, Oct 19, 2026 at 8:05 AM <joy.zou@oss.nxp.com> wrote:
> 
> > +       if (!pmx->data) {
> > +               dev_err(pctldev->dev, "platform does not support scmi pinctrl\n");
> > +               return -EINVAL;
> 
> This NULL check seems redundant as pmx->data has already been NULL
> checked in probe().
Thanks for spotting this.
You're right, pmx->data has already been checked in probe(), so this NULL
check is redundant. I'll drop it in next version.
> 
> > +       pmx->data = of_machine_get_match_data(scmi_pinctrl_imx_data);
> > +       if (!pmx->data)
> > +               return -ENODEV;
> 
> Can this be NULL? If there is no match, the driver would not be probed.
You're right that it should never return NULL in the normal probe path.
I kept the check as a defensive guard in case the match data table is
modified incorrectly in the future. However, if you think this is
unnecessarily defensive, I can remove it in the next revision.
