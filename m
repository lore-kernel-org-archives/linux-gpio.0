Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663286;
	b=xcu5z9kBTt4ImanW6fZpH0TYTRfPdJ+EvZiH1sltziRrOigr/Y4ZoDkAw2trdtiCVnyI
	 Zs/aWhUw6re+HJU63A6X+Lw8cfFIEnVA9VIMd0is1tgKnSpzHLKIlEX3Rd8OzTAnjG93c
	 n5ziwurzbMEMrDETMHm/FqotuLcq0mnpnLuAhjECM6OE6kPWHEvxIBVMLqKJRS7d5SE11
	 tJ5ZhqqtoePcqJ2D5I0hVnDbLEz+8re2l2mbWsqhLmc17ku1rajNh7jVP9aX/RPOk5NxD
	 HWMWRUFehp6iJJXie4DE3tNrf3gnFp6RA0Rj1BytKP+HP/hoRw+rnuBe0YjBPIj90Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663286;
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
	bh=0QO9YnVCkt7ThdRVqFV3rRIURk4t5CMmX0eW0eTkPDI=;
	b=PVpRsOZF+dty3T27c2eYxnLcGSGPcXBztV+Ivn4cjIiub2H/cCuLKm0xGOfIEgtbenCK
	 Ss10wEzCHCrxJLIoS77DakkyA7lMXaGjDyAHrHCJSo1tbO+m0JWy39tTv9S48PLIVyats
	 IlyZYq45pYHzGGhB9p7ZEUueIqJ1Lc96zSkP+uZ+07kX7lN5FcG+303oU4hvKxh874t2O
	 HyucnKsKw+o7DBKfBb4PxJg9JwvGrcttlBDuEiCrOQkrWBdMGx+wVidsU+VEAeBiuBY8u
	 dfXPFdfSGHbmuprUDlWMTTZ3IBbAIwvAQVJU1iE0HJftZWYiBR0lhx343qVkJxydrEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ltmad1Ih;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.60
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3343F606D809;
	Mon,  2 Nov 2026 23:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3343F606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ltmad1Ih
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNVERVUP2UUJhimcv0eUAuWStIPgHoDgMVxZzSYqi036BOnssAAU8900TO4Ogseq8bcDrx7bjmU+FR08+hLSLePtVWu8inw+i+DH9W9Fpe6f0Wdvxtyadcg9CKh20AGp1HolgBukdcOkbRn3ddtCnF0TKgkanS8vouDCH+O03A+W61U4bHQdBnzX/3FmEhNOhA0pRk4sCKWpT24ksS3X71kjRX9inRoWnRKXG+dfCwNWHZWGmpCUnueZ2bHFVxidRZtv6bHOfwvo4bSr5iYQC1wGsPaUCimFheZibcAGFfcKyQlarN/4O3ArSebQ5pXuUkrEfveMY/RXZHSxkdJTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QO9YnVCkt7ThdRVqFV3rRIURk4t5CMmX0eW0eTkPDI=;
 b=ZSHwmH+/CRi1eJ0O5+fwZLbBY8b4bBt6ZZ6Zmxp4nEWEJRUPX+CRGC6ocPzbM70Md9RxSG6WTyfwB9/yKDqsQ7TB8lhFe+U6LFSpj8323EZBfr2aXhitSueyHwQTTYq7pESJl8WKjrXXSWkhkig7e8AHy56pvxT68DYOXlwmNXUnhnzqqsYp0a+VMo3ZVeaix0Ojyyn3l28JGOCzKf0WRHM1E128GzDDbYOcgXeeh7OGuhT+kvCfR5y3JuXJb70yeFXw8BPENeZ7wGSMK3FvOhql8JmJY606152ANtisJjdHAP3j4veqYdL/2Q1Z9Ckk3gC9yeNPe9BS7T1zDExKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QO9YnVCkt7ThdRVqFV3rRIURk4t5CMmX0eW0eTkPDI=;
 b=Ltmad1IhyOj4pYGonFJyIvrtCffcFIqMUIkPAIH13qCc1wa75bhaxyB87bdn3aSy6gVexyfbac5tpLFxRVzLFjNZyaoUhiscCKz0J3i4IaYVHztJisSzNpJfMf4dC1vYiNXegAY9xf5tF0uZLI44y0w63IjJ1teNdsCjrYYqnqtEzGNvTg8sSPexTrOGg4oSsHEGtH9UurBgHfA6aLH9dgxhrCHSgPmMkyje5tkU7ObbPjV8tXhrK5K8TgVXFwZ2Hf6cLp13F500lz7VYsNky85AKlXH+Qw5Q/gJMymEueZh5HOymu/sIZar0RboIQj3s9mt0+pcBfzQIWajJxyShw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MIWPR04MB750268.eurprd04.prod.outlook.com (2603:10a6:290:92::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:48:02 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:48:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:09 +0800
Subject: [PATCH v2 05/11] gpio: vf610: drop unnecessary wrappers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-5-7c71fb36e184@nxp.com>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
In-Reply-To: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MIWPR04MB750268:EE_
X-MS-Office365-Filtering-Correlation-Id: 791e018b-18db-41de-e4f6-08df393bba97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|376014|366016|1800799024|23010399003|6133799003|10067099003|22082099003|261102123227099003|18002099003|921020|56012099006|11063799006|261021123027099003|261026121527099003|261022075727099003|261021121427099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	Qs26uxIF20fF4fWfAEzcnRpOw78X+0CBSnqEORZIjVEdKPciQMLl8A6BISZywfQnSNF0Uec00eKaFsJ2iEe+C4jsXRQp8fSFMW+boeLJAw5nNI443PBzEkkUnP6X62YSk0+JfxTNIvsG7WG2k1R6TjHogHFLP/ipWPLha4KyLLf4jfNnbtsCpSNXRuDg9sTjUeZxF9lLtURR2yAlr8mG3J0qfNbg9xkjZsrHTy/0K/Duog0lJWyAj5eu+VjNY90YBrNUzYGkOMOwRylLFiTbJ2Hi+0raj6lQylGZV2Ky8fxeZ1sroNSGTN+1B4ZVuQhioC+7kIwX6n8AYywapS1+3JnW/IOO1TeVhRFgyS9xbdcoCQYWVIBTVa2lcDv5gp1i0/zAharS28L3nOy4KhZtoecXkOY4F+pE99zSzKfLoisAOtCA4mrCzCidyyH3GfIncUDJe69Xp10kzL/kQLPpTfsTdsYLUqwWnvmonc/ubngXzIQB9iWHcRVhkDdrKp0xqeUQAM1rUL1PMhtWxuldkIxtXHcs45Hopq8qFJfdFcR1uBPaBIy6KergkwbfADvM22DvFzeIKCD/LUugxhQ4kPA+jRj+sgc+ig6pGOv0rWES/p9LmUfzQ+aayNs74ncqSN4C03OQlKQTXzLYMIf7dm2XULwUSf+jIMXSjoZ4Q1YYLQpX2ungsnsQ291q4/+PgwKAnNTY9l/DuxIyrnGaIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(921020)(56012099006)(11063799006)(261021123027099003)(261026121527099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEtvU05EM21HZURlSUFCSDQ0ZUdEakxuYVlwQUFyWDAwMzBGYXY0dmVXTVIr?=
 =?utf-8?B?RXgrSkpPa3ZmbzJPZXFjc1pWYk85OUNGYnoycFhSVzRjaGFCSlBpRGZZdTdQ?=
 =?utf-8?B?dzFWUXhFOFlpSVl6dnpSM0FIby9IUnVkNEZkSTd0Qzg1bGI3NnpLK2pnTWEr?=
 =?utf-8?B?YTV3M2FScGU5ckxBTWtVOERuYWtnaUVJVFlTNk8rU3VsMHYzd29NRVJVV3hM?=
 =?utf-8?B?a1UydUFzeE05VFR4WHdOeTgySjlLWDRrQnZ5Ry90Y0tSaU1ESkRDaWViTHQv?=
 =?utf-8?B?a1duNkg3d2x6VU9yU2tVU0xEZHJsdUF0T2JYeC9iYllsTjVxMlJpdDVhbGYx?=
 =?utf-8?B?a2ZWVnU2eDU3ZEF6OFdnK2JlN2dYNXpoNU4zMkRNYko1TUlzZ3dLWmhhOTRj?=
 =?utf-8?B?UmtlbEpaakJmWFgwM0hTa0swU20xNHZRR2Zzc3BJb0oyakdvaFYzb0FkWUJF?=
 =?utf-8?B?dnlUOUE3K0FXdVBYRDJGTU1seTJSazUxN2RBajJzMnlkd2lQTjUya1pIc3JE?=
 =?utf-8?B?KzBOMG52R0VvaC9kWEgvT3ZnOTM4MGpRdmlJYi9STkNJbGNKY3Vvdk5OYk5x?=
 =?utf-8?B?elVyRU4xYVFuOWhKNEtvRUpRVjZVTlR5aS9MRG11TkZZakxYQWpzOTZkeDFa?=
 =?utf-8?B?M1pYRXE0cVBqMEwwUXBNbllnM2NRMXlmRmo3cHhSWTc3K084V25mREZKNUQy?=
 =?utf-8?B?VCt6aTUzVFhwcFkrOU9nMDhlTUdkdldNTUY4dFNPSlVrNWVWMVVZekppVGlQ?=
 =?utf-8?B?bExCZE9jbWJqYU41ZW9OSVpLTzdFSGJ1TllOZDFwWG1JQkttRDRySGRGS0xt?=
 =?utf-8?B?NktremU5bnF4d3QrYUxvcHBRNzQ5djJVZU1VNGZoRXQwbkNGa1lvZ1dSVEE1?=
 =?utf-8?B?ei9XTFVLcUdkWXdLQzRic2RzTlV6ZVBZNytxWFB6THlFaWhxbng3SzRSaFRw?=
 =?utf-8?B?Wk16OER4UEc1VU9SZmVjeFVnaU1CTGFkcHdFaTJsRlNyN2s3b1dUbWdOWjRa?=
 =?utf-8?B?NEYyVDkwS3NGMzZsZnY1ZnA1SlJyT2lyMHNlclYzMHRBRUtMTUZDZTJtOWxM?=
 =?utf-8?B?eWVUWFBMVXhORkZ5cDFjWk16b2xjU2dzMk82a3FLOVF5TmpKOUtDb0I5dXdu?=
 =?utf-8?B?YVI2TmFOOW41TXlRWE1aZG9NS2lCTnZVbEozTG1jOHgxeFN5dC9uK0dDc043?=
 =?utf-8?B?UkZIK2Nac3ByMGVMQjJOTWF4eXQrYUtUeU1FZWhQdTVVaGl5ZHNaMnRaWDEr?=
 =?utf-8?B?eE01WERKeFlQSGdINVAyOEhacmU1VGlOM0ptMGg3NDZMMUxMTDhUUWlxWnZ2?=
 =?utf-8?B?WDRzczQwVmJOc0NZVUVzQkFtUUQwV0w0RnF3SkdLcjh2UGxkZVpNUktlZTE4?=
 =?utf-8?B?QldPdXU2dUoxbWd2Q1VXVUpEOVF4RzFTei80TkJ6Qm4wQ2hacjUvNXVzdFRn?=
 =?utf-8?B?bVhtUVRjZkNxWnZjWnUwa0JxTkNRdmRqRlpnNFRjTGtxeUV2ZlBSVm5iazFK?=
 =?utf-8?B?U3lvY0V4eXJRODlDcFIySUhHUzdqYU9ZclptWHcyMnNMZjIwZDJ2RXpmQTdP?=
 =?utf-8?B?NXNJZ095Q3NwNWVFYVJ3WnNjQmZKNG9mSkZRNktPTVA5Q0RPUkx3SGsxVnp2?=
 =?utf-8?B?Y1VoNFg1Um1Udis2dUdjQ3lhRDNBSFZOMzl0Mm5SRTBoMHVqZTY2SFFEVnc1?=
 =?utf-8?B?OWJBQjBRMzlLZWxDcTVpMCswSEt3M1A0UnlFdXVLWXk4Yjd0RG5NeVFqTzJJ?=
 =?utf-8?B?VUhGdjhEZk83a0FYNC9PSGZkQXRteGcwK2E2eXRKVDJaTG5oUjg3L3dJd3o3?=
 =?utf-8?B?ejMxTmRXV3RhOVlSd2pNOVNHMzZKSVlBZWhXQUhickhPVUplbnRUaTFiM3Zw?=
 =?utf-8?B?V2ZWOVQvZUxUbGx0bDdsM21EQUxpRFM3WnpidktOaHZQZ2tmTmFwMzNKdmRn?=
 =?utf-8?B?SldmVEdwVmwyUmtBSDBVUURVNzE2MlNudWFkQUdybHF1K0hzcnd3RkNEQ2Yy?=
 =?utf-8?B?eXE4cUVEOU5tYzZ0aHNzTVVTT0w3UHYvbmJLQmh2TXJMQ29FNFpSa1M2R0Ry?=
 =?utf-8?B?SHNqT2h5eXVIRDMvTnVsbGNCQi9jMHZUTm1odTZRVE5aK1EzK2ZXQTJXTVhF?=
 =?utf-8?B?OG5IbTR0QXFSYUdwaDdLcXF2aXVuRzhsemhzd3dieHNmdnJBeGhxRlFIU3BC?=
 =?utf-8?B?Q3ZWQ251SmJqM1lDSEt4K2hVKzhwQWRVcXdPN1hxcUNjMXpCaFcvRHQxNFVv?=
 =?utf-8?B?L2RKQUNzcy9ncDM2RGxPR2g4N2pDSEpNdWdRb1E0WWVYQWdMQWpRSURMRWVZ?=
 =?utf-8?B?ZGF6aHBMWFRYMlpGWTNMUXpGYjU2WUV4cGtDZzBTUUY1UVpGUmZYZitJOVJ2?=
 =?utf-8?Q?5H/tbsSWaTOd2GX2v0ALushPvisieme0HfZeO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791e018b-18db-41de-e4f6-08df393bba97
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:48:00.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iL19gNSJkyTUJR6yvmpapd6QQ9mjtA5cO4xknawIT2HxyVyjPAvYHRXu5ftWIVJaXam3tUaz2S4i0VrdvYKBGJ+qZ8HiNwEwMNknQFc4pVk2NLIMRGeJ+0hSIdNAOkvw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB750268

From: Peng Fan <peng.fan@nxp.com>

Remove trivial wrapper functions vf610_gpio_writel() and
vf610_gpio_readl() that just called the relaxed versions directly.
Replace their usage with direct calls to writel_relaxed() and
readl_relaxed().

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index d14cd5515293..0ef220eacd3b 100644
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
@@ -292,10 +282,10 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 
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

