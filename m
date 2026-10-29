Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281579;
	b=sIUoBz8bS8ntRHWzWCJ4BT6AtnZ6u6+tAJIZtBRgnwu5PVJPwZhULSr1lTYF9IPrij17
	 ECYbUSx6zS+VYYoP02TEZFlG26gA5lZ2xh41pK+WYnSt+FmdFcJDzSmEwiScourpsauck
	 lQeEC+vxNH61/X6481EXjvBwE6yhmFbsg3wiYaLb4V7x5gpd+smrK31bJ8ZgosxnkrWke
	 nqDW9UUU7cFFT9ac4601em8ZzCWAd+r0aixA5wzZiAxpR/aDR/MhFYM20qvqa37q2ITCY
	 stT1Ag0GS3+TMTHDnyPIaFh/aF3vQilHdNa3ftMvUq7dk/dDRdwf0hBPP9M6bbEZYLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281579;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=v43hENHk3TyWSFjYYaHgNvDvSYa2T/yVBxnyFV1FwBk=;
	b=oQdznTXjVIGFM4G9t9wLjyx46Xt2af2O14NjexTJ7w6mVKuSCIj2J5+rdIN/rhV9h73x
	 xRIbNlLuBwOKPYQ+vXc+gDi0xv1zn3FnITY71S4pda30uJUk6rNs3QjgxeAnW7IvhNkYa
	 /R2PICX7NCapOUW5fJTB1Otbi3xv9vir6zH8AKZXDXNpEOd4nTdzaA8lMDsmJbf/DU6kW
	 pAHyzwa3HXlwFa5rpZ+/2zSj5w6EfwmaKE8V2QvZV1qCJrmSctfkoPyIvElZNxJP9NBsZ
	 ndsHTI5u5sYPG/Cx8+zgxhyjWNdtYIqmqjUrhAbiZ3AwgG3epdURjuaHwSKkkW/9B/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GKiM5dDY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.14
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579060A2608;
	Thu, 29 Oct 2026 13:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D579060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GKiM5dDY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKu88u0OQGyaPrs0F4zd4DoHmCOzkLZW3pzmXv9W66r4jYGq+WxEAfeHs+1zeMUJkW8vQe6dHQ99h35Hmq7+gQoR2iPuIGPL8MM+IXRyNDcQawbALqbKNWKrtRPVLHNQm/iVAp0671ldmmrcI1UsaY98u+v7mICzge63ZJG3P8F35yqTIi9W/V+rILE5P7KXQNA1JvMfJuoJr4K1kIPr8EQntAL1dDsb2o5DR07ZPspzJmJOscW4V174I4NGbet+05ZTIlhoZdQ9iD6jymxXEhi5Z8I+mqBU/tOwqR2QbYCDeA2uQPrJinjN6MvK5QN6N6GTQUIG1Y3ObWJfqrQJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v43hENHk3TyWSFjYYaHgNvDvSYa2T/yVBxnyFV1FwBk=;
 b=IMrCquafM3EWsSsK2q/biB915Mj6RSmvRBkPI4K4QUvJc5NT2F4UaUYhm8c6S/Q6n6AHzSDo5zo9KSYHA2Sg74tj4BmI/gp3MhSjtDmJufkO9Zwt+xGBqZqLGkdssu9EtITj4xf46gJ20yjZ6wFX3cLA4YXI/UQ/Rv+0oopLluPXfoR4OkPpohrC09gpBaeE5g1UbkciM3q1fYXywOtw+P5Z2q+isIC+AYWmnzb4UXYNOAlfwCsjlRAKPfWzTdEdaUHvC8EJbkK6xVuesVnFB+vPIMcCyLcAzamUoBV4rciPrtZlRXJQ6evrstlz96g865jOzQh8JT7tCA/NwmEkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v43hENHk3TyWSFjYYaHgNvDvSYa2T/yVBxnyFV1FwBk=;
 b=GKiM5dDYnD2tI8gDprPoOeBPt6YomwcGU6PT6EqsVNEL7jHqTzCI/1nq+pVhY7pww8RqhtsJGjrofG/wb8+CDOmMne6oEp88R5xsngujS6+15DBy/aZ/qCy2ThpifzvWwtOEGby2P9epHBUvNecIyrVIDPRz8hvqYu7m+piPQ5wHsgl/RcrGrTTecoZBhqoV3nz8HZMhEkzKUxXgWB/WZQXTJ8ddDliYyaMZV3b0YiXUZC92K4FPPh25mujMIzwYyEp1i+8VYmVZuZJ0YNfUO9GVLmbSU9gkH3dWg8xfk7XJirKbFTF1SA8MpcUgtv/wIAyU3dtQEIJSIZuWEPhUDA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB10711.eurprd04.prod.outlook.com (2603:10a6:800:267::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 13:46:15 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:30 +0800
Subject: [PATCH 06/11] gpio: vf610: drop unnecessary wrappers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB10711:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0b0496-f72e-4a0f-98cc-08df35c300af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|19092799006|261022105027099003|261009223027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|56012099006|6133799003|261026140227099003|261028144727099003|22082099003|18002099003|921020|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OwZJSjsip4+S3AWm46KafoAi+hLS2wTetyIXjghNqrm66Utn4z6iGZ52iJUQL8rswvZNSYkvWw1roOxDFuZlt/U2c5AIBJDo2ZsjrzDX6+sv3sdRmySeVB2LvR8Xc/EUi7FrPBZeu0jzaqd0O0q+zr9ceQTzJOnFesLQWvPpRQSz1s2fix7NauGjsNqr60CfxGQ7ZAhqqzJY8us+C2kA3xD8+8HxPX+G2ScgTo1aHrAlSrMBVOvU9Mvr8esbViE1mu9504SFKQiZiletbkt4UcuIED8HWVGSYcr30MVaaeeMv0r1lCc4BJEzxLvzuYoB+GWdN34M86iKtujRiKGw95QV2vmxEBSyEJwoEjMj0ShyhwL6Tl60KmcbpBV1DT4J6v2Nbv5X3GSvsEW3OhSihjnxDIrnZ6R+Z8aiqWk2KaoWUJheG+f0I3kkVqL3M+JFpmU/F2Lw4r7fbb2ORb1qSXJCQSdCctQu0P3G+ouYqVq/neUz/q0u81L8hYSAeE4jlWBTI2aI/sz9AY8YRU+y+TSRQXzhJupNs6pRIJVWoKLlQ89B3IlGRhkapqJQXbrbXVvCqTyFwE+u9i9tOxg858/N/a8EC8QaF8ZIZ+XSMQOh5Lm6vcBhNWDcXK3+Puv7PrdBWVF5Rli1pmsOBMNvGyIhc0U9XkVzdXfFpxPLPGp+PO8uUcYqf1CdLFMpB6uF168JMptdqBjM0WetbybrwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(19092799006)(261022105027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(6133799003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(921020)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE9kUnRoZWw0cnRyWXJpWVpFaVExS09NTzNORUp2YjFsVTJiQnZIbXVzd1Zx?=
 =?utf-8?B?SEhrTk1BcjQxcWZxaEY5THlZZ3lMazRjL1BsbnlTUUJ5eGNEeDlEbis3R092?=
 =?utf-8?B?YXBkZ0hPd2NpZnF0cVU1SDB2eFo2WTkzS1JkbUJpSElBOWFlMGl5bEt1OHJ6?=
 =?utf-8?B?V1BEU0p5b1o2UkQzVUxIQnRTa2hUUWVzQnNCMlZ5dHl4VmswK2dqQ3BxUEZy?=
 =?utf-8?B?aC9UUVpTVlJJdUdXQWZsMGZtQkJvazcxOENEODJwM1RRK2dES010Y0dMUkNI?=
 =?utf-8?B?WUMvM1JjcEhDaDlkSDZzUzVDMDBPNzh3Z3c4MldwYktoMkpTUUp6dFEwMFRZ?=
 =?utf-8?B?Y2l4L0p1RmprMXFBS2VFejNEOU90TzFYRGFOelZybXZkR0JTaXBzYmpxRkhX?=
 =?utf-8?B?bXV5TFhEMGNabUFUWllpMVc3Q3hmeGRIQUxNdGVTWnFUWGgyK0N3L3NPeWdy?=
 =?utf-8?B?RUExcmRtMi8wakpOZVFIMyswSFRrcklGVWJTMGZaUlYwbXB6ZG02VzJMaHU3?=
 =?utf-8?B?L0FFWnZnZk9hOWhXM2lnRGhBaENUZWs5UkhpU3YrOWlTUXo5SnJsWGcySlFI?=
 =?utf-8?B?RFJRaElsNXF4TlI4UHhnMjJJdHhTb1QwakovNzVEeEhVenVWbVlBN2dnbW91?=
 =?utf-8?B?dWNjMHQvSFRNQ3AzUEpOUlNkZytYbTdtL3lmMkdmTlozT0NrbzJVaFQ2Z1hK?=
 =?utf-8?B?Yjd0cC9UcittZk9ybldJNkpNYVhoZmh4cWprTWJ2R08zd2VldXJNZWhHZmVY?=
 =?utf-8?B?TmJyT0tmMW5WbXRVM01xYzgwSUJUcnBkamRsMllpSlU0Q29BNHo5YnlpdFJj?=
 =?utf-8?B?UVg5bWlLL2xHTVZRY3dIazRTemVDa3ozbVl5b2pVOEpOYVYrbkp5YlVyMzJk?=
 =?utf-8?B?K3Y4eWFLcUdCa2hWanpOQlhwNHBGSW9PVmR0V0w5UDB0SGk3aG9oRk5mSmdu?=
 =?utf-8?B?aCtkZjZvRUwzS3Rtb2R0K05NaXVoTlgwMFNyVVI3ME1ZZWJEUVNibDZoVUM2?=
 =?utf-8?B?OU0zUVNvMHdoQlFVRENicFNiWElLZzViT1dsakplNStMTjBaekFxMVVrN3c3?=
 =?utf-8?B?SVZPMGNYSkU1TTFhZGdIZkZCMTFBOTRlUk1HQ2VEWG5CT2ZpcndEK3NRQ0VL?=
 =?utf-8?B?anFYVGkrV3NReTNob1gvQXBoY2VqQnAreFVFK2NuM0trdjBUR0tvdzZjQTg5?=
 =?utf-8?B?YStPOEdreDhDUHdWVHBzUjcxYXk3VXhCaHFXYzFyYnEzcG05Qkp3QzBSaGNB?=
 =?utf-8?B?aVEzc0xNRWFwaVhLTHN4YS9QUlE1aHJIdGV1ZkF6K0ViRFlINXd3OEtKV2lU?=
 =?utf-8?B?VE9YdmZ3U3BPekVqamVpaXhndTloTWhGVVViR3N0Vm53N0drZytqY001cGNN?=
 =?utf-8?B?VzZ2S2YrOGFFRTRXVTZieEJQaUtHNDYrU1dLN2ZVZXBHMFJwaEhac0lJNlVB?=
 =?utf-8?B?dGVOanVaV1ljWXQyQzJVeFd6d3B1ZXUwZ25jK3BXdzA0YlVmTEY2UlJpL2lC?=
 =?utf-8?B?Q2s1NWNLdnNEdFM1QkZWQjQ0Tk5la2NoYzNIQ1FrQzJqT0dMUGlVNWt2L0Uw?=
 =?utf-8?B?R1hyY2hQUjdaU3hpTEx4VXNTVG5mdHpNdkZBcjhqOFMyQTcrcDRPeUxyTXM4?=
 =?utf-8?B?eVA5MXdpTkJvOEZQYTBTMzFSYzZUaUcxRHVKM2VNNlZzMDEza3Q5TzJWTVA4?=
 =?utf-8?B?NkJhQXFiM1lVT2NpMW5iaTAydUd6RzA2eGJiRk5ndGpsSmd4ZFVrRmxHcjVw?=
 =?utf-8?B?Ky9XQmgycys5YXhYZmpWQTI3Vi9ldlJaWkpKWU9razhPZGl4TzhjZ0Z0MEdX?=
 =?utf-8?B?ZklzTnNmT25Jdk5pNWF4VXoyK0dqNU5pdlNoZkFuOXNnODFneTZ1SEtWZW1I?=
 =?utf-8?B?Z2ZTRm5lcFdadGNHTE9lMlRIWnZkTnpKS0FWdmhvSnZOL1RlSXVWYjlaaG91?=
 =?utf-8?B?K1B1V3o0b2FQRVBSWEtDZnZkNVp2WDd2REZTY0M5VmNEcmhWN3M2anNLR25y?=
 =?utf-8?B?WEVTR0JJVzQ5RUZIaWVpQVNQSTltOXdlMzZHY3RpM0NqZk83bGUyT3hZQ2xX?=
 =?utf-8?B?WUJCbFlNVXRGaE4yZ01aYi9Hb0htbkQ0Vm5HUEpydXIrWVR0ZEF3cDFJUWNJ?=
 =?utf-8?B?Ty8wSUVNRktTMTF1VXhxdzdWZlJxNnZoRWc1d3R4NGI5WDUxYUxMR3VaU3lH?=
 =?utf-8?B?WlRQamVLRTBhbGYzdmFZTUJzRkFaaE5FSnZSMVN4Sjdvc3FIOWZQUG1iOS9x?=
 =?utf-8?B?RTdyTVNGL2Vpc1Z4cmVZc3lndk83WnVBa0dSZlpPUmh1VDZobW9KVlcxU2Jp?=
 =?utf-8?B?SUs2M2hVR0ZVVjJ2UEhMME8rQndQY2JIZnZ6dmlhR2w1MlFqTFo4eGJ4RXlv?=
 =?utf-8?Q?ucUtz6v/CBdGRDoI9lK6zA/45PFVAYBEOEoDu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0b0496-f72e-4a0f-98cc-08df35c300af
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:15.7546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/Zt8DCkDKxpptXeGVgJf2YMrM6bOdCB6IaUD/tOImx2UaqBCoQvUQ4xAgp7GajRrxcnAgteQKLL4bJ5VLS4zwW3ijJHHRevq++oZSPa/Zrglc3sHFwojrjsZpWZTew/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10711

From: Peng Fan <peng.fan@nxp.com>

Remove trivial wrapper functions vf610_gpio_writel() and
vf610_gpio_readl() that just called the relaxed versions directly.
Replace their usage with direct calls to writel_relaxed() and
readl_relaxed().

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 4c46342bc66c..f6712bb45841 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -82,16 +82,6 @@ static const struct of_device_id vf610_gpio_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, vf610_gpio_dt_ids);
 
-static inline void vf610_gpio_writel(u32 val, void __iomem *reg)
-{
-	writel_relaxed(val, reg);
-}
-
-static inline u32 vf610_gpio_readl(void __iomem *reg)
-{
-	return readl_relaxed(reg);
-}
-
 static void vf610_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct vf610_gpio_port *port =
@@ -102,10 +92,10 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	irq_isfr = vf610_gpio_readl(port->base + PORT_ISFR);
+	irq_isfr = readl_relaxed(port->base + PORT_ISFR);
 
 	for_each_set_bit(pin, &irq_isfr, VF610_GPIO_PER_PORT) {
-		vf610_gpio_writel(BIT(pin), port->base + PORT_ISFR);
+		writel_relaxed(BIT(pin), port->base + PORT_ISFR);
 
 		generic_handle_domain_irq(port->chip.gc.irq.domain, pin);
 	}
@@ -119,7 +109,7 @@ static void vf610_gpio_irq_ack(struct irq_data *d)
 		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	int gpio = d->hwirq;
 
-	vf610_gpio_writel(BIT(gpio), port->base + PORT_ISFR);
+	writel_relaxed(BIT(gpio), port->base + PORT_ISFR);
 }
 
 static int vf610_gpio_irq_set_type(struct irq_data *d, u32 type)
@@ -165,7 +155,7 @@ static void vf610_gpio_irq_mask(struct irq_data *d)
 	irq_hw_number_t gpio_num = irqd_to_hwirq(d);
 	void __iomem *pcr_base = port->base + PORT_PCR(gpio_num);
 
-	vf610_gpio_writel(0, pcr_base);
+	writel_relaxed(0, pcr_base);
 	gpiochip_disable_irq(gc, gpio_num);
 }
 
@@ -177,8 +167,8 @@ static void vf610_gpio_irq_unmask(struct irq_data *d)
 	void __iomem *pcr_base = port->base + PORT_PCR(gpio_num);
 
 	gpiochip_enable_irq(gc, gpio_num);
-	vf610_gpio_writel(port->irqc[gpio_num] << PORT_PCR_IRQC_OFFSET,
-			  pcr_base);
+	writel_relaxed(port->irqc[gpio_num] << PORT_PCR_IRQC_OFFSET,
+		       pcr_base);
 }
 
 static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
@@ -290,10 +280,10 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 
 	/* Mask all GPIO interrupts */
 	for (i = 0; i < gc->ngpio; i++)
-		vf610_gpio_writel(0, port->base + PORT_PCR(i));
+		writel_relaxed(0, port->base + PORT_PCR(i));
 
 	/* Clear the interrupt status register for all GPIO's */
-	vf610_gpio_writel(~0, port->base + PORT_ISFR);
+	writel_relaxed(~0, port->base + PORT_ISFR);
 
 	girq = &gc->irq;
 	gpio_irq_chip_set_chip(girq, &vf610_irqchip);

-- 
2.51.0

