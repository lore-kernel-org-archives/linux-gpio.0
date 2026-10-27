Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103187;
	b=ru/dEbiQEdvH8/nLfxh8ehy7JTHZOUxY94XxvMJKCPMcSdIFI3oC8KtqDFxedJjD6OKe
	 yR8ofsKtPRKiS3zk3WPC9Vgf3R6/gSUqGhmQVdiQmWANgiCBlbk3hBteknXmYGfV74wce
	 +CI+Tvz6l7j/s+W99jxmUdlp4zS04F8mt1q0gHDgU0paREJ5OmtToTvp7m4hYtVsPurD5
	 lSeVr1tht54/WkFCaYzmIqSzXJg1gHQWAmBjOnih42XlLGg4yC5r8RGkmktd7NXnT1jeM
	 oLzWfA5/drhwbx8VIHFIVnnH3HEFFLP2ujAGSvtK3DnBSzJpACS8CAWHd6cbCIprDTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103187;
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
	bh=DzUvEQoxvv7eyCNSyj84RQnnpcLtffaUqf2TE6AhykU=;
	b=q4r/lrcMi6dfnSaEWxcF0/Stzryk8cRdVshRwAZs/6jJfOJzclmErNo0REmyrxKE+ZFS
	 Wu+EihP8JteHX1/nApR8K87teB2JCMUtcB2v4lzibkuRx3OYbK/C+Db3NOP8Gp3+8BiNa
	 IuWEhJTBgoLCKNHYmMKNh/kxyV3Yiq7l8Ch+znhbedPVVydz7QJbNiGMokQY7d/ADUZ/h
	 RO3ytHqtgFlOAZOfx32N3DSeWBFsCwmgBY077Nlw2jtgwvn8G+LEyWb3aqW/hiLJVWmWg
	 iw0cKou3uUlExnszOOH6bWHZxHSkVvWLNQg8wBJch57Cuw3yqiMCEDA/Z75MCivDRyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lGhbB1Af;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.23
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B02606A32C;
	Tue, 27 Oct 2026 12:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B02606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lGhbB1Af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVvqfF4ss9ljKteALMmsosDvrpFYAk3bWq3act9WF6lfVEcD0a8s2OeK6l2unwftJxw2Syw4KxR/NaNjuDOMVQ6qSIZiHIoa09VYq8Ar9Ag85gRoCsoe08oghdZAXk/jhMji6bOC2Rco//Tzn4O6rXHPbITLEulYE8rO8mti5DD96v04ZMX+6Q1JIq/iFyCqlxjSjkH4SWco32ItyLUn1lx9oZJyw99aJCvWPmzcDwQwK1JaHK/1Q0MKCrJjp3i0jeaM2KQY45osz6tLLDWmGCsjE5Sh3HUkHGXimoETVeJ0c/78e2gEw39st/h7TxpYTjmTeC/POl2zq42BwJn7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzUvEQoxvv7eyCNSyj84RQnnpcLtffaUqf2TE6AhykU=;
 b=FOVTK+6spKti04ClJ0+tKoQ8v9LVSr6xgpZlm0LCR5m3k1QoePqWWax5kZTyVCYvpKX5xGydiLk/ABb0FwLM5LZfO4Z394augjkHAtKrLAZiazYeszW8sIhqFSEbI5l3ZcT4LuIsWLNg39l8nHKNzH+rzDz1Fr7/E8lMsTR1yDtObsUtvNBEEaQz0rFdWNV+jaURY/pyLPvaFsYRN2roEIgtVIoM/sIWDLJ11vI6sl5iWcLnvr0YnNtkYKLSvrWoHuFs2Nyfn1tpyby2VRasP3ml94EHJ55tEBdDdOrKggW+z0drAw88SEQjL7jYagnMGwgLvVfEoxTTMVXNZQSJsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzUvEQoxvv7eyCNSyj84RQnnpcLtffaUqf2TE6AhykU=;
 b=lGhbB1AfpzvRCli1UwS7BuTTT2XIkzsZ8QVv5/sqSNC2Ij5/bTDj8m7wcaGIL4NCnqLJ+vSawY7aeXdiO9cTgNta0h2iWlZaPjjJzSiha2m2Ql5LezYS5S6sqxWiQPIUwRKtEdaLNdsqiqUjO4S618W2NcWL/xIWsvViGiBAEj4rBrB+BR5IP5lyoOD4qkov2W3RxFZs81kDDZDG/YWsljt1YwaGIB9CXrjgoV4is8Q4Y/mYDlQe7cu2O4eByJWJiXUfNb2QFIcSmlg/HwtJ5dpKjoS9vmevnDm5IYGjyQVDBHfws87iOWbhauVDAH+LBLCe5sI4EuBGgcikQipHYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:01 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:30 +0800
Subject: [PATCH v7 03/12] gpio: mxc: use 'unsigned int' instead of bare
 'unsigned'
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 9326c69b-df47-4e83-b0f8-08df3423a4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|23010399003|11063799006|261021123027099003|261021121427099003|261009223027099003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Nu2xRUvnaYgBmo6uD0rYB3nxFXAnmhZQQtZu6rCxvH8WyEh0t9/S+FCdIw6SG+X2ATYI6GWqwKvVYV4E9K0CBLI4VYXmBdRuT3eV2inxhuh/FUfyhCeEMTNvsF4WjqIbBQ47Hm2XUv8A+lzTUOrGbvCAIsxOVMlBnRDghVutq+OGSl1yYG5N5gUb6SsBDt4/8p3l3aYWLa3z4zd1T4LWMTMoTJCajtdN8oEvPc+/ogG+Wdf0YxexbrEv+RBUxqb67AbMNZVAWK+aTl/OEEBDfvlW5Ty24v4ImNQWhGpVD1FRbO6KB/KLATO1co6pdLR0snO6D34SMnfYoueuOC85Y1ykiYkIwkF2gVlXv+UI7TLicKYMlVbAbmDCmPP98qY2qwNZnvfbCnXYzdHqe1nELlKVVfufclOpslXBGaEv/yyLW/QvEiNe3ek9XfSLz61sq/4/K4VWiFurcJtixayoKOP9nFLMKTS/K/LV9/vpx5xOGlE5as4n09v5NdGt0MnHRsz6s9el2ZZxEKZy9zgNg0sDtKqBYu9Hy0yhfZMEu/8t/+KDfh8pyC/9x3b9OKbODZqVpt1zoO038HB1rvcwEx98u2gQ0T/rkpf91XjyigtTo5Jto8B/Sn67LbwYdzkIJrbnEv1avBOvw/4fgIgfZgNAk4o2Stbm1y8gY8yhDI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(23010399003)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEpqNmc5ZlB5Z2htUDVVckVEalVPcjRTY0hycTY1VTBnOEoreHhzMUsyYnRo?=
 =?utf-8?B?SURzVURmWGNFMWMzVXdBM29CWFA3VlFjSVZDM1ZXZDNsMHgrY2k3a0dQQnR3?=
 =?utf-8?B?bCs1VWk4UHFLZ2wyNDZZdXBkYlRoblV5c2N3dWRlMUNQMk03akxsUk82THRz?=
 =?utf-8?B?Tmg0ak5yZGRidWV0alhaa3ZiZUYrR2VuaXdON2J6N0VLdDNVcGtmT2NzaHR0?=
 =?utf-8?B?RmR4d3ZKMXd3V1RiZmZTSEFnaEdZWDRnb1RIenVXakdLbFJmcjF0Z2dCQVVl?=
 =?utf-8?B?NEpmM1d0LzBVQ2xVQjlLbm1vZUxyUk5ubmswaU4rdFhBSi9jSXpvbVk3NlJ0?=
 =?utf-8?B?R3JqVml6dDhFYXlBZUl0czc5RWUyU0JCT2VLKzkyc1BXcnFTdUNscUlBb0Jv?=
 =?utf-8?B?VXFjVThMVzIzVExaeG95QmxCR1VyYmFxRVkrbm1DRUVXMTRONmx5eW1sR2Vp?=
 =?utf-8?B?cXUxc3kwUitNL053dGgyRE1UWGVJZ0EwZWZGZkRXVlRyaE9NMU9raEJQa1NO?=
 =?utf-8?B?WUcraWVWOWpnamRMR1RQSEZjVG13MG9qcTdNMmlYb09UQytsTXFkZDZDbnVJ?=
 =?utf-8?B?dVNXZG5XdTBaYlpQQTNabkpteDZ6SXlIbXB2ZVBtOVlPaWlHdGlmYlBjZnh3?=
 =?utf-8?B?NXdrT29EODFTU0ljWm5UcjRkR2VTSkY4UFhOVDEyb2JoTlNVRERlMHBhaWdy?=
 =?utf-8?B?UGE0YldSODhXS2o1emZUNTZSbzNRemNaRUYyYzJwV0QzWCtzV3JERkVWNVZm?=
 =?utf-8?B?T1Q3YUJtcHBUMmxDNjdvdEw3VzlyaXNnSkZaazltWlcxZUZqaU9pUWdDaTZn?=
 =?utf-8?B?L2diVG1sanJpY3JSMStMc3ZNT0NVWkt3b045ZFBxem9uOFpqTDY0Ukl0S2hE?=
 =?utf-8?B?eXlaZ2YzRVNDWWl6cEdYeklOaE9lL1FhSVFkZmN3SGhoakRmQ0R1SmxaOG92?=
 =?utf-8?B?RndreDdmUk4rOXM2ZlRON3ovYXBvaXhBOUVmZ09aZVc5cjN2Y2U2c3JsN3M5?=
 =?utf-8?B?V0tPWFFWUUdLSDY0TU1Hb1hqVkJQWUR6UXlOajJoejR0MnpEaGRLQVF3Wko4?=
 =?utf-8?B?Zm8xaHVWNTlHRitHQTBwbTliQ2czcWRLOUtMUG9LMStMVjd6WFFIOHY3M1p1?=
 =?utf-8?B?enM3OC95ZmhVVVNxd1I4bW9lUWs4ODMvSUF3UjM4TjBVcGp0L2xTNTlCL3pT?=
 =?utf-8?B?Y2hJMkh0ZzlQclNxNmRpOE5DclBPdDdGUGtZQ1ljenZOais0SUlxQmROT1J3?=
 =?utf-8?B?ZnRSRk9mS0dldzNOWXhzY2lNaEdrcHJ3MmNIWWRYenpMbVB2R1NXY1Q3eVNK?=
 =?utf-8?B?aXZEWHpHdm03bElKVEF0anE0R1BzZGFLeW9YcEgwdTRQS1EzcTJjU1JTVktJ?=
 =?utf-8?B?ZUJERFpyVnRwMmdHcGNJb21EOTdlTnBmalFBVVNKVTViMUVNNDhZM1Yzejht?=
 =?utf-8?B?QWRWYitxSWdwNG81VFdEWktESnZuVC9RWnZxSUFZZ05pNGxra1FhZm84UjZO?=
 =?utf-8?B?MHAyeUVEUjdxNEd0aHVKekJhd3k1bjhxYTBUNVZSQXZDRmhiU0pxNy8rODNw?=
 =?utf-8?B?R2UyQ0pFQkdOUVN1SnJXZzRQWFlUWThUb3VZQjJjTmNxbGw0eVo4QTlWaHEz?=
 =?utf-8?B?TzUwcHV3ZzVFTWhJMG1OTkhlZGhkTmtBYnZVaGY5NEp6dHB4eXpEcHdLOFZP?=
 =?utf-8?B?ME5hQmZPUlplK0Yrd3QzLzgrUXBiZldQVHBXM2REcjZwaUNRYVlJVjNtMkh0?=
 =?utf-8?B?TzBUME9zRjNxMFZXcFZkSHFXNFRudTBMZk1TMjNzZm55NFJlQk9QRUx5a1Bs?=
 =?utf-8?B?TVVMZHluQ0g0alhGamtwMFF3dGMvVkNlVHQrdk44NXRkMkRXMmRaYnROSGU0?=
 =?utf-8?B?WHZXMUVqNmNEckxNZU5Xb1llOEtoQXFBMkdmQjBjSWNwWWtjVkFYdG4rSC95?=
 =?utf-8?B?NGkyeVlLMmtEemg2a0djQW9CcDQ5Q25KU2lvSFJWdVEwZ0pTckxycUM2b3RG?=
 =?utf-8?B?SnEwbWJtRFdIQ2NwZW43UGhWdW05dHFsYmN3YTJjR21sTG1yckRQU1VaNkY0?=
 =?utf-8?B?SndiQzJBdDJTcmJYRXNmSDdMVXdjVW5RYks0eHlyZThSWG5TTTYvaERHdGxK?=
 =?utf-8?B?L1RudEI5ZkUrR0VIdkRWdkJ1dnNWTHVYalRPVW9mbEFmL3M1QUFsQ0ZPN2JK?=
 =?utf-8?B?alZDUVhlUkE3aFRxUkNsMklEbUErTmhncitaUEI0aE01c1k4SDJvQ1g3UEdh?=
 =?utf-8?B?dVZQdTlnK0J0eStLdDZ4YS8waXE2OW43dllKY3FhY1VCdEFaREFjQ3RKV2JS?=
 =?utf-8?B?VUJ2dHZTU0I0V25jMEwvc2dLWjBHWEEvOHlSaGcvNGQxQWZ3dGNIZ3pYdGpQ?=
 =?utf-8?Q?55/FNajGoWpG+oh6/c0kUXEUJn8o+DGjwPN3U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9326c69b-df47-4e83-b0f8-08df3423a4b8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:00.3382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omG21DZR6Binq6qEEzRfHBikXnbxwzUKRmoWAnPgHsp3S1o6K/AFkbryFjXUHhthtF/FUvl2EL5tki95eBnLeBCe9d+k7igzUDZI3V+RjVoqRk+uE/KGzCSxj5G8megj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Peng Fan <peng.fan@nxp.com>

The kernel coding style prefers 'unsigned int' over bare 'unsigned'.
Fix all instances in struct mxc_gpio_hwdata and mxc_gpio_to_irq().

No functional change.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 848d7725ccfe..43868a214c17 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -36,18 +36,18 @@
 
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
-	unsigned dr_reg;
-	unsigned gdir_reg;
-	unsigned psr_reg;
-	unsigned icr1_reg;
-	unsigned icr2_reg;
-	unsigned imr_reg;
-	unsigned isr_reg;
+	unsigned int dr_reg;
+	unsigned int gdir_reg;
+	unsigned int psr_reg;
+	unsigned int icr1_reg;
+	unsigned int icr2_reg;
+	unsigned int imr_reg;
+	unsigned int isr_reg;
 	int edge_sel_reg;
-	unsigned low_level;
-	unsigned high_level;
-	unsigned rise_edge;
-	unsigned fall_edge;
+	unsigned int low_level;
+	unsigned int high_level;
+	unsigned int rise_edge;
+	unsigned int fall_edge;
 };
 
 struct mxc_gpio_reg_saved {
@@ -367,7 +367,7 @@ static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 	return rv;
 }
 
-static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct mxc_gpio_port *port = gpiochip_get_data(gc);
 

-- 
2.51.0

