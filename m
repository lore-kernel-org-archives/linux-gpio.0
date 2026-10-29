Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281586;
	b=dqZvHSazAASg5J23ARN88PytUhDlgz0oz9JCg/Fucu3DLswIDZZebDrL96eMTmj3GuPJ
	 I7Jp5Wjg/JAzTSXDt/36h18MZfciYgUiRC/EGAM4MXJPzeZbaDPUG+LTEZMpFmuZFk+Ev
	 SQkxTxaKDMIzns0kWRFz6hrsQkydAgeMuAHKDeKPz2lDBZTJiFyd82h9c/92+l06MG32F
	 4birkRT1OF/XPcxXJSaWDZcEOnmURMO5itBpOc24wAc9lynsq8NJIFNINSjKHsURGxEsr
	 P+k4H/36gqqy2jRpt8h1gvdyxlJzhufTX709JE75eCorziuvDA5lzWXtmSpRaAQUaWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281586;
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
	bh=bvHGMFbhjmfRVc+zBGC6n1YZJjr4C4N2A6gQz0K3WvY=;
	b=YfsjmA8VhN3jTixWGD7YYbTMoSqJdnNtW/tLyo/Bolk5j3fMMaj2zpRM0eLsxQBZvo1e
	 BndD8HlcweVceRoDZCIn7xXhny3afaaXZa6u4L73gUCvnG/wUKkWyWYQ39UDpBo/CCh4l
	 xaBFXiogRuHj6/SwaM2oPUn/cCGMwWE9ok1OXEL8uBSxg5Fz90zmRp9PyNujsgNdDWB05
	 cF0GyepYwPI6KDjscypBTTu1ZaLyBip7rZuegNluRFYYFwMf9emgpLGUzTfH/vdhPnyMa
	 fyM3qrB1OKbtCI8YjY1WRkQ3Ju5FfMAvdh7ku3eDlBg+Pbzg0TxcrtgYbR5g6XwOOXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SMjYzeOq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.31
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44595606A325;
	Thu, 29 Oct 2026 13:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44595606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SMjYzeOq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAhafnN1hjTAHWIo8+GZympTBX5WWq/KrL+C/HW2YeDEeIKr1EyPN+9LdliIinQcxkkNfbbuQlNkwH98FsZWbx7NJH16SxlHJEWD+HS6KDofs6sni5TCgLWMXwwGx5rL2PyTfUfFi33fExZKhEZi+oXH1eKLSuHq37tqMtjidMfggjtDXNZRQulYvP++AsqZfuNrx6RwsrFDZlEXuUqSFWnVgoHZhlPbTVEoTYUACwWbUbyqZVMkIMaHAUMW7zz0079WuY4OkbxEg+jgqe7P9I+ZL2CmYogbcIo8oUvYjWZbqYJxyokj4au7FcegTIQlIjzEXPVDUGDz9WLUHZp7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvHGMFbhjmfRVc+zBGC6n1YZJjr4C4N2A6gQz0K3WvY=;
 b=ClSKJRieASFg2r11WA+uRHXzpKaOl4uHRo8qLrZhTmw1nk9wo2Flzr1f9uzm2n73BAZzCUj9G6+ISyow6T5aYQyN6nZ0inX9mYxLklOzdQumhiedhpjRvvwhuwNLVk2DY0OC3GqIXs4srSrPfRk8Dd5020ZYzK6/iXCvyK+VOPshRJgMcDpeXTuvBSVvNV3f02GJH+6L9EF0k0UUmXbY4D++UNNMi2cgceuziOPAM/5dUMFsjeJvWBRkvwkZmUXOxrAmFSt8tpOaB+Eg0s07gq7Mi8YDMaiTfhtMQt29BXL7JnPcf64P1MneHw3ryGn9G0ijeCQuoxlz3Zb0i0kIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvHGMFbhjmfRVc+zBGC6n1YZJjr4C4N2A6gQz0K3WvY=;
 b=SMjYzeOq1nGlrJAjmQqR6YbyjUIH4R2CkH4aTEEyqW3f2ALsPvyCwBc8acWC+1pebigocG5qyKQTvdHs59xNJN7+js9ZmWfx0nlJCayY18TiHwmiLf9Sap9e3iIBVL2sxNawVtQeM3nc5TXOJkxG2DqbAeuh20o9Y4g9hAKCxdLPjsNOMvaI4e5D8ZlyG3ZHFbIa0YFuMeJLF1wk1/W04u0E3pkHYzOaAyc6pVzgxneqSZBWgwITcfjDnrbVBnIbyAO1q7Gn0+29OpYMi0dDEsfFKCFKAqbbFYt4LuoPILws4eIzGu53Ems4uWiYIP5wYnLNDCDw59o1tZlJwHo+5A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB10711.eurprd04.prod.outlook.com (2603:10a6:800:267::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 13:46:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:31 +0800
Subject: [PATCH 07/11] arm64: dts: imx8ulp: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-7-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 2bfbfe11-c669-4a71-7eb7-08df35c30444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|19092799006|261009223027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|56012099006|22082099003|18002099003|921020|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+JHHUuCc3qUhImjHmmor4wn3iJ4fGKAPPFrDo6XxI6oegr4lRTHpSjhggbncS6vswQ9ZU7BA5l2cziBIM4fZXANAQ8njSBBTmf835c0VTbRTWoM/PY/cLBbN3oESzhYztuceieSvvURBQ8yK2yHTVHFGGnj1UY28/JDYwiR6rzOp3J/mW0abcLEQ3aSpcGduoCCwe2RmDUnIzT7boJXMl6f7PNVZqPPqHpZ2g5pvH2NKjONw0/EYcXxazdusBQdSU7b8J19vaPxOvpNIPflFQNOJMRVja//GDWChwYJP1cbJXM2l4X6LTp0sIvaNCJyI+QWOsQ0ioGpZySrcjKr+OkwHn/liSWCD51VWtS6lxQF9Mwabip1PI17bKLCsrTFuDSr2Kofqkn8XgnxjcsTzrASt7PYoV9DDd7vhTdobxTyTpOGZfJjFIonL/n+yPZKtEizIubjYiEla3Fr4/wfhGBqqRymqNoY7Rn3q2B5ZO1Q8gbD7OibsDXib3UM9Yf0kEEmvabWzQ9bBUjvarB8rbXD7FKzRkH3+2b8LdN+r903NXKJOfzpNmUA/lEQ64EqtNXswCwwE2iyUFDJ0tmrHQp3lbM63SOMS2htuu2XCtxBP0g7l/1eDDBur+B+/4/G9f/FeGBY6y6vdHeBT1BcQEIyg+zS8QkaUp5zVf3xVzP2wrhmcvjughiG+HgpkTAhbkY9sL6zROZd1pw1K7+Uc8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(19092799006)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(22082099003)(18002099003)(921020)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWdHMWpGcjdUR0YxVTF5M2VFNUROSXpLdndiRmZSYU1NeHUvWnQvRXI2RjN3?=
 =?utf-8?B?VHBQWXdNdVFqdDgwSlk1VUxHSGNzb3ZHWWwremJyaWxjNFE3Yk1XNGlYckZs?=
 =?utf-8?B?ck9hUTNFaDU3ZW1YVFozNXRiYmZkejdvelFxTVhDU2NlcFozOG9NbWJjdDNG?=
 =?utf-8?B?QjZIL1ZsYzhMR1I1UXpsaERYSUd3dStJUVUwOVhJYU9iZm45ZlluTlIrTVZV?=
 =?utf-8?B?dUwyMjlTUlNJaG1LcDhZOEdIMVAySWdOa1M1enFhczgxai8wYVp1bzdiMm1m?=
 =?utf-8?B?MVc3NHpsR2hKOTRDOU50YVA0M3p4RmNGdk9XR0xDbll6dTNYSUxSeFUrYk43?=
 =?utf-8?B?eWZDbTFHTkxwbHBUYk9CQ2dFOGozTmZLQmZVamh2d0ZFM0pNdnVtNkFUZlIx?=
 =?utf-8?B?dkVjRTl0R2NUdkhGbjlRY29DdmtLV24vNGQzdXpOWm1BSi9hZ0hSdHQvN2tP?=
 =?utf-8?B?V29hVDVBdEg5amdWMXYxWExvSEQ5NXdGSE0xdmtMWXZrS0dEbnJPV3Z6Y0Zp?=
 =?utf-8?B?cE5VOFUvd2Q5emFHMGxvdGx2MWNXTmp5aFFjU045V3hJZlFWRDIxNmcydUJk?=
 =?utf-8?B?blBkVWp2TnlYT3gvNC9LZDVPRTJ0cCs1cjZidlM3Tm9XRFdHTnZheWdaMjVq?=
 =?utf-8?B?eGdLRDFUbUNrLzl6NzF5c2VsSEMzcGp2MFdaSVFlckplRkFFR0hmM1BTdEY3?=
 =?utf-8?B?NXhIM3NZUEdaYjMrQWhZcld3SUloYlpGU0pxbVhOWXh2UXJUYmM1bFRvZ3Iv?=
 =?utf-8?B?SjFGTVNzWVZVN3lpN1k3NlBUMEUvVWpTM2RxZGtXMmtqTk9uQ3RtTmhRaDV6?=
 =?utf-8?B?OUxCeDVFOXpRZXdsWENra1l3UXpPVUUzSzVIeVZxRFBvekMyOHVYRXNjTXNu?=
 =?utf-8?B?R08zRjJFTE9UTmZ3ZGt0ZWxNY2FEb3JzdjViTUduK1g2Y3FHeENBU0pwTU1w?=
 =?utf-8?B?WFlHQW9ndWpvQU9relZiTmNFTFRNV1RKelhDSGplRVh6WThMN1pFa0MxOUUv?=
 =?utf-8?B?NjRzeVVHaXpSdys0K0lXMFdXZStUbk1kZ3NvQVJxemk2QlcwSDc1bmdUd0Vs?=
 =?utf-8?B?YVh6VU1NcyswUC9iYUYvWnZ3dXkrMHJMTGNMaWJnTXExQ0cxRDNiSHI2bGlN?=
 =?utf-8?B?UFN1NmNxbTkvbHZGcHM0SU5tTUZVZHlJQ1g4WTZyYnBoSXNkSVdVMXFkV0lv?=
 =?utf-8?B?OXBEdUoyQmhYUWtyQTM4b011eTEvdkgzU3hjamZYQW9LOVBadjNpY2tXTnZK?=
 =?utf-8?B?TW0zSk1LVHBBcCtOY01QeDZyS01EMHlyd24rb2RIWE50VkJLVFprcElNTDQw?=
 =?utf-8?B?dFk3NStwc2REeWVDdDh1TFFJcDRROVVVcGhHVjdMV09FLzVUUkpWbll1S01U?=
 =?utf-8?B?UnQrL2JFY2pmb2JBeXc2VUpXR05LVFFJWG1DSXRoZXdJZlEyaWt5SE1xSjU2?=
 =?utf-8?B?RGVyTy9BdUx5TnJzZ1dFSE1jRS9abFdjRzFZY2tQL1lvZmo3TGlhbnBZYThx?=
 =?utf-8?B?Njl2VGRZQlFwVHRhazRvRjNJMDBQeXI0OEJtYXhsOExaRDgxdDM0TXdBVStr?=
 =?utf-8?B?QU5PSHFiemZLeVU1MGlYV2ZsenJFOEplV25PcXV3YUo0TlgrZXBpTDdaNE1r?=
 =?utf-8?B?SkRHVjExd242QXZMN2M4R0VFQ08rV0lZRWRRdXJCZDduQ2NuSUVYQ3lNaGJu?=
 =?utf-8?B?UUpEZ2RiS0xZc0tYMzZMUFlyL0tGT0ZFZmQwQXN6M2FpcHJXYUxGZGZYeTBj?=
 =?utf-8?B?cDZkT1R3ekpoQnNmOVpSMytrOHVMR0kvYi9wL1BsVjBhdGtTWFpQWUl3N2Jt?=
 =?utf-8?B?a0R5eERIWGtvYTVvS1NSUTJoQjhWSGQ0ajNwQVk4UWpldFFXZkdUcWhZL2N5?=
 =?utf-8?B?UEZZa3N3U2w4QnNvK0ZHYWxlOHhZRmN3cFN6RXBUaUZXSHFqVzJYK3ZCRlky?=
 =?utf-8?B?eC9XSW0wTHFaaVJOS3ZWa2ZBNEdMWXp6YWtLQzJvQVY2ZDlqOW1jbzBJK2l2?=
 =?utf-8?B?MHpYYjArQ3prNmZybENPZFA2N201cFdsc01vMUtoSEptN29lWkkyTFFtYU4w?=
 =?utf-8?B?UlljRHdvYnRpQ05wMHVyR01la2xZOEJJdmk4elZTcS9FMWZGMkFnUGhHeXFN?=
 =?utf-8?B?YjNWd21WK2lsNTQ0ZW9EQVpOKzJ0Z1pWVERLZ1J6aWtyU25JcFE3T0JRTnQw?=
 =?utf-8?B?ZzRtdFpUNTZTUGJwWmd6Y2NEVDZwcUNVWFc0SGw4WHNhMWtYaEY0cFlUMC9U?=
 =?utf-8?B?Uk5QekF0aHBwY2YvdlN6YmZncjZNanhBT2VDZ3p2THRoMnVqYVNJSmVTdmdn?=
 =?utf-8?B?NGx2ZTgyRUROQXJLejRFZzY0WmtBakVoRURyTEYxcnhEK0NrTnBYd2k4VGNX?=
 =?utf-8?Q?giwCwKPmUMT7SkFKKZdIFOSB4RjIf9WyMzvP3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfbfe11-c669-4a71-7eb7-08df35c30444
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:21.7801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MRJnDsA5WawjwEDgI7fymrr6QschHlNzgroCt4be6TxcTCeENaaqdZmu0P7ipF4EuWPOIxyL8xOtm9QceswWQuXMplccqNrG2HYtGeIC/N46gcp0Z/rF05JbCUX8/2K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10711

From: Peng Fan <peng.fan@nxp.com>

IMX8ULP_CLK_PCTL[E,F] clocks are actually clocks for PAD digital fiter,
not for GPIO. And per Reference mannual[1], 26.3.5 Clocking:
The GPIO module receives a single clock, which is used for register
access and synchronize external pin inputs.

So only drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX8ULPRM.pdf

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..cd8be753611b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -731,9 +731,8 @@ gpioe: gpio@2d000000 {
 					     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				clocks = <&pcc4 IMX8ULP_CLK_RGPIOE>,
-					 <&pcc4 IMX8ULP_CLK_PCTLE>;
-				clock-names = "gpio", "port";
+				clocks = <&pcc4 IMX8ULP_CLK_RGPIOE>;
+				clock-names = "gpio";
 				gpio-ranges = <&iomuxc1 0 32 24>;
 				ngpios = <24>;
 		};
@@ -747,9 +746,8 @@ gpiof: gpio@2d010000 {
 					     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				clocks = <&pcc4 IMX8ULP_CLK_RGPIOF>,
-					 <&pcc4 IMX8ULP_CLK_PCTLF>;
-				clock-names = "gpio", "port";
+				clocks = <&pcc4 IMX8ULP_CLK_RGPIOF>;
+				clock-names = "gpio";
 				gpio-ranges = <&iomuxc1 0 64 32>;
 				ngpios = <32>;
 		};
@@ -986,9 +984,8 @@ gpiod: gpio@2e200000 {
 				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&pcc5 IMX8ULP_CLK_RGPIOD>,
-				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
-			clock-names = "gpio", "port";
+			clocks = <&pcc5 IMX8ULP_CLK_RGPIOD>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc1 0 0 24>;
 			ngpios = <24>;
 		};

-- 
2.51.0

