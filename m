Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793900807;
	b=HCEjPVIfX2oPA/hMlNrStUIPueTQseLsaFxaOhuoW5Ed7zQ29i52vCkYoGa8YC/KhTYI
	 tNo/Mf81PUO2W4aMFV0hEMDC/+eeDjOoMAB2JnUgoeSMw2/QT70bJ9CEDnZIxxPO+ZJV3
	 UaRaNl4dGg9TRhRm+ax7fhVXIqh6CvIgT+iWJ5TRSodO0nh5k+hCcC3FFm4eEpiWk8jnY
	 66VSiGGCGqZJeBQoaT+jeWtRni0X5FF+i4aB9emP1bDhSBlUms7igtHvbm3srFaNo0HdN
	 Ejz9v/YVr7L3DsTC00Btu/8CRMmqzCQJZQBCUxGlh0g1Bo5RoZCIaDeWpGnk291PE0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900807;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=dHJqnihLpsedYEDoedjmbv3QAhku/ez+SoHnusEYpyk=;
	b=B2pMzNq9N5K/sCeoGxwefOH4gMmONitv0/NSxYxrg4cUWmSvPMYIi+C1tQzSdtdu2MUr
	 Rl4eOX6joBktbqzpb0+I276DPH4tDMyxUHEPGfXzh5U7CJJFmCU5GeQVE/pE+UC+QGrFD
	 J6w0MKTm+vjIoBbrPCghfNRTr2hmFrxGlijwEWb3/x0qMaOvm7UxkqB2/gcu9XQjgTGbC
	 g+58oltD3DN9FEPFQh/67AezpyjRPMRDqoALu442qE1/yjwRHZEjhZ58FbpiSJVtP0KGN
	 HKiOIg/z0EEsVI0NI/X0jZWAJYlxRsXQV5cl8FmYO1ZiG6bNh+HLpnwKvavKkK22p5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dggOLZ3f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.32
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013032.outbound.protection.outlook.com [40.107.201.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE2606A328;
	Thu,  5 Nov 2026 17:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6AE2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dggOLZ3f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybwLihywSoZHrmNPWVQYaqllMEjoFHzuG0cgGcT2ir2vz3EV8j7bkmMAeysQsqN09JrBvvjTchcuMSltF/b9Gsq704smNTzCfCZ0966YjO1++pHuA0TaKIU5SGC8BRpaz72b8c3TxnjnfmIvnlInbAe77G/cczpmOyqeTVqPDl84W6U2z9zkr1Q2E7O8HzGlLeZdSHgxVeBASVLCoiuT/sNV/J4m5htFJPtoS9sSv+k8/KH4PhlxfrjCdWR2T1lJr1754nGhm8UYczlzSxtmvBINqn3soBkLdtkqkwJUz96ThKH4+D8Cl0VM68/Gczg5dZHWxiKX/ctK85q4Cmkgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHJqnihLpsedYEDoedjmbv3QAhku/ez+SoHnusEYpyk=;
 b=bhYeoUyPn9C248ZaVDeAGiMx2L09itnqwUMZm2xXh+j4h+/UzV/m/4K5StDGZxwl7CBeDFTjveSdDnJfX5yD9muwU5+6Cslr94S/W8gZVvJraLCyvaIAC4HnYSbakK/QwaiTt+sotf8WuBLxAKJV6aqAw4fpeytBAZTk2A9b6B8N2eLcFsGj3GTsbPmoFrSUfNGC5s704qCbfgwMhZKzcPeHmLmMdnjJ4Lyf0hVjJm0A7HXJgS5v9brAfw55nXImwKXK1XVDdx6un02oGUgAkrK5O15MG0FQ4Mp7qTPkDEipVwIU1wBiFxVAxWWnYnN0zKhiWw/0KYXBD2bpatyAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHJqnihLpsedYEDoedjmbv3QAhku/ez+SoHnusEYpyk=;
 b=dggOLZ3fQDyfu3Pn6TXUKzfzLiilqm4IaYYdbaP0alYO2RLm3wi9UVFUHJOfHU8h5UIrSlSbhOjookIVOBsksojPpF28YnfxWXum9n6xQMz5V2Pa/NvaEUYRE6P/0ajHv8E5WyFded4OBbgXAZ59MhhjHZIbwIMS6yQ+35lcvp0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by CY3PR12MB9578.namprd12.prod.outlook.com (2603:10b6:930:109::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:46:41 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:46:40 +0000
Message-ID: <39c2d670-4876-41be-ac90-af3db8faca8b@amd.com>
Date: Thu, 5 Nov 2026 11:46:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: amd: Clear interrupt enable bit on spurious
 GPIO IRQ
Content-Language: en-US
To: Munique Feitoza <muniquefeitoz4@gmail.com>,
 Linus Walleij <linusw@kernel.org>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
 <20261030200827.24648-1-muniquefeitoz4@gmail.com>
 <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
 <CANA1Dbk=Xw==LBpLSsYAxBDQMzxpcvkWajwzuZUZRC5-w4oT9A@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANA1Dbk=Xw==LBpLSsYAxBDQMzxpcvkWajwzuZUZRC5-w4oT9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0004.namprd18.prod.outlook.com
 (2603:10b6:610:4f::14) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|CY3PR12MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fff554b-7d94-4705-8cb6-08df3b64beeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006|261028144727099003|261022105027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	+VE1elsOi+HXhqV9YylisCxKPDcPhcMZ4Z8mOD/nvnA4Mu80SXFS9KHLeX/qeAevKKVc7Wa4STnUmns7YX91b/vyLPlf0GUA5g72hmLv09dcMXocwV8IH51dKqoDn08qKzxPQ3CBErl3mK53JsHVD91HrzXgqDACDlXdZ3sPfHni/T87QYN6VgMoz/qoqyWc7COeDRqCxWcnY42EXP8jjGCMnp+PRjOaboE7bPOjfxq2eZECcg8h355adjCki216XYcHHKERktG4aJYdi3xv8XL/fRMYUZuFP3EoZpp901icbeUQJDA2wNE4J0Lt3XzhxAmv46zMu3uLBcOvGaZRh6BjAkfaVI5HsRU1Cjecgsx7vfRFS2ed4u5YeIkGddBvRJYka2rrrX36UIZm8BeFOPRDTFxwNt8rKrGoiU2lHiTsvTrYta9qi2xVJJKfXYbI3ytH5T+To2nDk0lJ8PvUwu7UmfGRJYAQAxCqZOBwH0rLaXqVqwjpIaIudLzV/BXqIBG+sQFJeYbPLnKW1wG6ZCoxh0xynp1LgnBr/ERWJICDrtLH01bDex3O2mvGl+HWe++jmG3ScJ2Y5Cb2TPcXs1sKS1JpD0BKov5EBQ+9OD54f0DGpIAkH7OoM7x+Ei4TjrCiGNAxiTtsnKh6eZJ8N+uU2xPhrZbYu5Xmeakuc64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVNmWGsvaHI1MVVPbXIvWFpKWjVpR1YvdWJ1MndFUkRSNG9HdEhjeFFXcnlY?=
 =?utf-8?B?L0ZCN0kydm8rbnpqYmRKT09pUzlIa3hud2VwRVgyK3V0ZWdIWWFnblpUVXE1?=
 =?utf-8?B?WVY1ZmFzYWRNZDA3QkE0VlZDVTd3ZXhWd0plRVZYYzR1UWJWMSsxeXdYVUV4?=
 =?utf-8?B?Y2tmcXZUUkg5RXBXTVIyYlNRcUs0Q3gwbEU0NzdjeU9RVWFGbHZYYk9JcEpP?=
 =?utf-8?B?a052WXRKMTZEMkszYllVT0F2NXZQNnBtOGN5VUNOeTdzTFpIbHg0YlJxbERS?=
 =?utf-8?B?dnVOakQ0aitpR0Y1ZERRTFlJSDdMRU1Yci9Gc2s0engrNTZhdU12ZVpPYWdk?=
 =?utf-8?B?VThOZytHOHN3YWRhUTh2L1B3MW1HYXRXSjJFZjR5dnhuSG5xMTFodGFHL0Zt?=
 =?utf-8?B?bytwQk9ObWJLOXNvdCtIKzFRcnFOdkY3RjZqQ2RlTGhMWngvdVk1SVF0UzRi?=
 =?utf-8?B?Uk5EdE5iM2pBYWdic0ZIYXVybTFSRm42WFJiMFFqbUpwSHhjOXZiQTRVb3lL?=
 =?utf-8?B?TkpDc1dibnJvQnh5eGozSDVxaGxtb2Y5MFlSYjlDV1ZWVFNldE4vd0JOWFVs?=
 =?utf-8?B?aGFSUytpY2xzM1BsTEoyWFhSNVpycEZGemhiU3lGck45dFNFVHVZVjlzMkpr?=
 =?utf-8?B?Q2hkZnhyYUd1Z0xCZWRNWGdIR1FMckNxKzI1TFdvT0huZDM1Slp6TWJ6YzRw?=
 =?utf-8?B?MUFDamlmL2FjaXc5NXhGZHVXRmJiK1A2K1hSbTNMMGtJejYwV21qS0MrQjkx?=
 =?utf-8?B?QmsyVEZTdk1vMGNDUk9ETUxkWHZsZlJid283RDZWaGNuQ2RYR3o3M0w1bGND?=
 =?utf-8?B?ZnRKZldHTkxqSTROZmplRmxDS3lvejNtYWZ3QzYwVmp0SUEvbXZPNVFVRVFv?=
 =?utf-8?B?c2lkWlNhb0xDRTlGTzZVRFR0TlMxeklYWkRnKzdDWmtLZm05aHhDczlZS293?=
 =?utf-8?B?UXVZdjgreTRIdnpVbzRlVFBuZzdtalFRQ3B5cmdOMVBvSGZGODZaTmxkTXN6?=
 =?utf-8?B?dFdCS0VDMVRBU0FaNXhlQXI5L1d0bjhJRTYvQktEcHZyWnlEam5GY2pBOE9I?=
 =?utf-8?B?QXhCNHJNR2tDSHpBR0svcDl6M2EzZXFUcmdVdFZKTE5JVktyL0Y2RmFWVFhi?=
 =?utf-8?B?djEzS3l6SjVFc3N5V2pUbWlrWEJXZGtheDF4b2hPaklZT1Z1bGhrZjBvMWV6?=
 =?utf-8?B?bVNSSjJGNFJ3ekcveWdvVlBReFBOZjMwbzlxMDBKTnNVT0loTXdjSkRKMDdH?=
 =?utf-8?B?aDdocHROVmxXZ1RtSEpkTk54VlJFM015a3dVekVXT1g5Qm1pMElUUFBtSS9y?=
 =?utf-8?B?b3JnQU5RWVlRemMya3hjWnRhaVdmYnJsNmtxVkF5bUt0NEVVdE1iK1RpejFo?=
 =?utf-8?B?eVFScGYyd0xmSUxJUjV1M0hIMzNBNXZ6YWlEdHRXK1hJYzBTWlZjZ1Y5Q1B2?=
 =?utf-8?B?ZWZMeTBoVlpURmx2WUFjNVowcW01QUhnUDRPNy9UbTBWMXZVTUh6d2hDNjIr?=
 =?utf-8?B?ZWZUSVNmYkZLZDFPV1oxQWlTZzZmMVR6U1RwTHBjODFMeDFQbktrZmloY005?=
 =?utf-8?B?N1lDMFdIS0dkZkZRNEdOSDRVMVJSdi84Skh1NE1Tc3RHWWUvR2pQL3dWa3RC?=
 =?utf-8?B?SmpVUWU2aHBYQ3V2ZlJlMUJIRmx6VTU2TEJCTWw2cTlJMyswZXhJYjBlNmt3?=
 =?utf-8?B?M2V3cFp4SUFyb1JhS290TzNwUmFWejVzcXdmZlI4WUJqRlBWM091RTBaT2VC?=
 =?utf-8?B?K2VTNEUvOU9mS3lJYW52SFBTYTF3NHgvVFVML2F4SFgyTTNxTWwvRFhacTRT?=
 =?utf-8?B?Tmh0TjExU0RPTzJmNi8vNHV1aGcwU29PcFN5WTRRMEhnelRoWXNJQTd1cnhh?=
 =?utf-8?B?YXEvOGMwWFJsaFJVdGQwUGptVWt3Q1hBUXNPYXFReWNvSU53RStENmdiQmVn?=
 =?utf-8?B?SUVoVXh0NnRIM2Ftd251T2JxL3N0OWVScFhJWk9uK2YzUDdhblpvSE5zYXZF?=
 =?utf-8?B?SlBvSEhxMEhZdHdNTmhtekVZc2dlMm56bkNST2xIZUMxaXRvUU51M0s3ZVVU?=
 =?utf-8?B?Wk4xTXlYV2JvMUt4Z3hYMWJ5dStJeWRKS0VnSkowUnZ3b1hZa3dCZE1RWVJo?=
 =?utf-8?B?UUltNUdmR3BIRVFKZmdJY05LTjVid05kaE9yNDdkL0tXNG1ZOW1XNFZrM2Fo?=
 =?utf-8?B?ZUx0UFhUUVN1WjBMTExBdDVVSnk1SEljV0NjK1o4ZjhTVFczUENlNktOTXp3?=
 =?utf-8?B?L3ZCOTB0ZnZHbEsxL3NiTmlIS1pkUStXSWNjcm41c3k5ZWxkM2ZGRjBrT2s2?=
 =?utf-8?Q?GgEhR7OtYk2gzX+Tx8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fff554b-7d94-4705-8cb6-08df3b64beeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:46:40.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMCuBTgC/6qrFESqYHh25rTAdEtKl79FEb7sS5j2P91IKGaRh1+5Cg6rHO8IyhQp39KbTLfS+/cg1+3fvg8cZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9578

>>> When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
>>> that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
>>> currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
>>> BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
>>> INTERRUPT_ENABLE_OFF enabled allows the pin interrupt status bit to
>>> keep asserting in WAKE_INT_STATUS_REG0/1.
>>>
>>> Clear both INTERRUPT_MASK_OFF and INTERRUPT_ENABLE_OFF when disabling
>>> a spurious GPIO IRQ on both the main and RGPIO banks.
>>>
>>> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
I'd like to understand more about this situation that lead you to this 
patch before we decide which way to go on the patch.

Was this just analyzing the code and looking for a code flow problem? 
Or do you have a real problem on a real system and came up with this to 
fix it?
