Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECC52DB789;
	Wed, 30 Sep 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761570; cv=fail; b=ScLHAeIAhKA2nMENFt6Rx9IL42lWvIRchshuz/fc2yyJ30+UQkbQHwAAp86R+XsIoz9DDmpfi92V+Eow9+B02XUz78859aFir7Li9vpCZnhWVcxj4LiF/rl4BHgzLZPz3L4mO/GwUvXXo8QxheUPArr1qNhceYlqs+Fu+LrVEHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761570; c=relaxed/simple;
	bh=jx5ijhnidKHo0FKQ58Q6zNa74XHjycDv6gplD0g2t7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LQVKSbKRqP4mf2/YsfgCUwo+sIzGECWE6MUL87W3RPJ1mozO/WfyiK69rgQnSnTdmKDGuQYBgP5yWIX+v7QcsJBUE9tuswdgrlngOAf//DhEry9mvHGKTn90E2UES8oUAK2+yQDlP8Wuu+srTK+2HCd/2p1oR33dEbQgGOOWbSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=j724tjBS; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="j724tjBS"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dPPg3835304;
	Wed, 30 Sep 2026 05:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=vGDHj
	3zmrCnYjiCFXrEHb6g89JI4P4U2lNzS5o+17SE=; b=j724tjBSz5m2WoUZQjlYe
	JtR36fpBlEq3IF1T7Q0EXUC4I6TElXEgjSNRF1xl/xUwBiY5wwGPK6XlR45sTl+4
	0eXKES1tOdHDmyVVooXtdH6puvQDrCm+YNcs13SIMgOOMozPcfKewfOHDQt509FA
	tRDSN56lNQBZ/4d6Eu9gRYUcrX+i7ou6kft27cPji+Dfqnr37AcowZyOfpYJBzI0
	4Q7KWqcH+Yw/ktWuQeN7wSEEE8KUQAZbm/8+sWZooKWsCPPUHNhhN96F+x24CZwG
	KVpgS72Jv7MRUD1sEb74E5x/wMoJOaLR05TAe+cilFayWNzxuLHiLoIwMqhwkdQa
	g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h0x2y8ns5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 05:45:43 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5cqyMIdxY0bO8mm8MRXW4z+/1CEmp60EtAQ/G2rpVrU0xKBPkuJpnhVoE2BfsiuwZBv+sd9eFsp2elIt5XYVWTXaCqebHTbqCJgq+aM5AI7v3dZUfhvPOZcxKDKkjvdgu0BXhAWOS1C4KdL+JBv0tcRBUmAndEpg2D91jKFHKpMSS1/KBHU3sZgcviHA3nuZjCqzYhHRKlOeg3FV+3dpfh88Q0EqvI60K0Z4eF3LWtaJe5Vjns/UbICjlHMgB51vsS4ys5IM80g9OmgzE7jbrcH9GunI6b0WQMFE/v3xzYTrQq7Oyn+RXuTvFr1pjb/ZnG+DllVJgZaoNKQCEHK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGDHj3zmrCnYjiCFXrEHb6g89JI4P4U2lNzS5o+17SE=;
 b=NwndvZlbA2RgkTLKC6tj3bWg7Jb7kqzC+c90ez5j2UX6qAnho4jQSugYlUuG2vuzzqxD8q3kj2vOn3yflutiCthcjQmF4k5EMc8M1biWNjMT7A07vXgAu63xtoYbxxqjMnCXODzaP9vvnT5Rd90EeuBAKZ4JF4Bz7WGzVVZT++ECycZxHUR57fex0yjrqUEttDMCt/rNsuezTPxqHKD8zlvlNkE4Hlaz7z5DwkhzZ+XZNzIADRfsKNWu3wnpq1ia3Pe8L9logcsecddeurX/xeTtBB9UkQkTSxZFgJ6qjJSpzYAYYdd7U9kSaRBQu7332HMJCQ58eNIpfNtfH0QoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SA1PR03MB6610.namprd03.prod.outlook.com (2603:10b6:806:1c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 09:45:40 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 09:45:40 +0000
Date: Wed, 30 Sep 2026 11:45:37 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: development@redaril.me
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        xu.yang_2@nxp.com
Subject: Re: [PATCH v3 3/3] mux: Avoid use-after-free of args.fwnode in
 mux_get()
Message-ID: <arzY2haHccIweQah@analog.com>
References: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
 <20260929-mux_fwnode-v3-3-9b3b9ae1334e@redaril.me>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-mux_fwnode-v3-3-9b3b9ae1334e@redaril.me>
X-ClientProxiedBy: MM0P280CA0077.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::20) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SA1PR03MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edc10d1-e8a7-4d8a-a801-08df1ed7967c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aiukusBb9mFPHuQ75imq6v8LKL3VVsE8nkHSjHcOSkr/km2yrOtpGVW9Ak19QsgDna48ulyJgSzPeJ1Zjsad7pUfXhsC52twtDH669l+WpByc/B9GtsF7YPTHzLT+Tkcxu3r8WOStzQQt2AFS3eb07VhVD8EDgUEd+eBSbe8T4EGHxiQ8UW/SQGm4LewoXYRbd0cD9ZAuTaL0ginPqWVulrTo3YtwrOSBzShBL2d/9YdwCroWNcDnLEqJsdWwT4R6+1ZEiwAnVPGd1J7TUdUeTWlhH1+QPLiiepe42QExLPpryzjXeZLmb13u4B6Ubean09Se4u0fdpAq0d1x4gX4dUvtsaUcCFXemkquRIvg6qPLcgHxmYjhN2ijikLxtpqyTNsgVOcsu+0GSMfGusu5p4j03nCKCkhec2wiIUtNSIWr80St2QmNUrreKXdbMuRphJ5ljZMozY1ZcWj/4fIcfEWL4j4ZEEPG6dEeo4jtaIv3xGGMMv0tBt7PQm7Ze0ju+KS7aRNpBJe390cYmYV1dz5fu+zfNpph0J3JUYqpGsVaobpI3Nd9KFxYx3hr2lJD9cgZK3OlXR9/4QvxwxMFsW+McKlMYjgiPIvOoE9HsV8r8tQqoAw6WtMDc0BckJYNZjzn6galewW/jpu/SM/0BXB5VbdE8Lqzt2Mz4ZuZSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGFJRC9iUzlDcE5WNmJleFpidjJCdG4yYmo3SGRhQzJGM2Z3TDdhK0FmZEd3?=
 =?utf-8?B?V1dDbnRxNloxaFVBMG1RZHFxL3RUMFptQjBXU2ZNdjBmVytQNzc0TWQvMEZl?=
 =?utf-8?B?SldDVWxFYzZGY3BSNlEySVByanFXSTdWOWwzZVRJeldrOTBLbjVRcFVFL08w?=
 =?utf-8?B?V2xpdktmMFp5d2dEaEdTRFROOFZXNUZOUGRDcUkzTTRxSi8zVFE1YVlYSUVX?=
 =?utf-8?B?ZTZaT0NyYnlZVTNIWEtxN1kvOFRDRFdqaWVMWmw2QXM4bFU4TTJVWFFhQWF0?=
 =?utf-8?B?cjVoZkdpQjVIRS8yUGlPTzgxNzdhVHN1SWtMU3NGNUhrdVhmK0o0ZElKcXB4?=
 =?utf-8?B?NzQ5aXBWVUtSM0ZFZ3hlRCtnMmF2QVNLTjcwWDlxdTl4MFpLNnpvT2ZkeVFx?=
 =?utf-8?B?OXlMK2p0b0d1bG45aHBMMEVJc3dDZjZxL0dxT1Ird1hDYndsY1ovZ0pUUU5j?=
 =?utf-8?B?SFFJcXFTVGNjUEpTU0svM2RocktURmdpSWlvcXNGeGhka2p3RFdwOEhsTDVB?=
 =?utf-8?B?QkVuVVFsOHRoUEQ0UUw3cHpUZ1ZDbHZuQjNRdGx6aWxmbkJkS0dTLzh5bStw?=
 =?utf-8?B?WGdBR3hETWIxZzh0MEtxN2UraFMwanprWDlra0x2RGZjcE9yeGhMa2xYTGF5?=
 =?utf-8?B?SzRYa3pDOGx3dDBybEV6UVhGVzJiTWpPdklFdkNpY043dDNXaVJFNkJ2VlZa?=
 =?utf-8?B?bVRGM2RvV0NhT2FIMGx6WFMrTEFEekZOejZJczZja2gzek5ka2hTWk5yQ0RV?=
 =?utf-8?B?WjR2dHphbVArTXVJc0w3Z0djd01oU2IvZGpOUndtaTRkajA5OVc1MDFocXRW?=
 =?utf-8?B?MTFCcEZGRnJ5TXlma2c5b1c0U3VENWlRN0tkM1dvZDlvR0ZzNldDVis3N2lo?=
 =?utf-8?B?bUkwZzk0OEIyWGE0ZEhVZW53OVhvV2VCSWNBZ1ZQT05SYnVBeU41aXQyOUZu?=
 =?utf-8?B?djZxZzI2WDFicDNISVM1enQ4d2hIemlPVHQ2SFhzYzJwd3JTUkpqZGwwUjdN?=
 =?utf-8?B?L2pMaHRESVRBaXFkekovL01DRTVSTnNGS1FGZmFUcERqdGVpemtjWFJtVTdy?=
 =?utf-8?B?dTdTS1BOaFBta1dERGFaaFFOVXpmeEoxYWw3cWJlNkd2NXkvTUVNRzdSQTFl?=
 =?utf-8?B?ZVlxYW16VEtvVWk1N3JleW5xV0V2cEIrbmUrVHl5U1h6Zlo3bThFbjh6SENP?=
 =?utf-8?B?ekJTamVEZE5DODN4eFVrekxjQlQ1K1puVVdCVVZOVjFjZWV3S2pNc2FxVHFJ?=
 =?utf-8?B?TDNzYTBBcmJqRUNtNWNpWWVhK0h1WUtyaW1QbzZGRjlGTGgwNGRPMlhKYzVC?=
 =?utf-8?B?cFgxMUg5a1NjZm14dC9yemZaTVk3Wk9zb0gwb3oyMVR5eVpaSFdNY0g0K1FV?=
 =?utf-8?B?WG00dDJPOGRnSHA4OVNSbEFXYWVydmVFZXIrV01rdzNoS0tROE5YallMem9z?=
 =?utf-8?B?OWgyRHJuald3d1VMemhoMjErWW16UzZHMURGMmhROGJ6MFFiVFdncTAwbllW?=
 =?utf-8?B?UXo3TW16cVBmNm9iUElyS3dpeitMYTA1VFlVUTNtdFN6Z3pMbnBma1E3RjQ3?=
 =?utf-8?B?K1V6OFN4RytMcnBJVHN4dW9KN0c0S1NmeGF1SnNHNEptd0JiZktKOWxYcldq?=
 =?utf-8?B?cnh6K3RYakJDbVV6WmlRQzJxbDRrc0htdUxvUlZsczhLM2lhY1pIQ3U1Ykhx?=
 =?utf-8?B?aE9wMHVmaElsOGRIR2pFUUluR01hejJzNUNua2UyQlNDQTFoWXRzQmlmZHdH?=
 =?utf-8?B?VDczdnlrV1drWDRMbkVINkZjUEhlSXJ0S3RqRVQ2MUNOeEdzYnJFQS9QUXBW?=
 =?utf-8?B?SEFuWTBUdnZ3dmsyTzRaTVRKZEw0ZisrMUwyNTZhM1ZjcHY2Y2J5MldOYXRv?=
 =?utf-8?B?T2dHd0RrK2c4RTJISStkUndlVjUyUnhDNnk5MFVIWnR0Q3dNTFlBYUdNTTZm?=
 =?utf-8?B?dzJmVkduaWpCMVBUWWo3eXoxcElHRmFuVlRLMnB6Tzg3aWt0ZFdGUitYZjNw?=
 =?utf-8?B?Q0dIZHZlRWdLdkpFOVNCVlRmbjBqWWhDVWx5eUhtK0s5MnIySDAxWTREQlZO?=
 =?utf-8?B?ODZFL2o1bmJOZTlxdXVVdUdYQ3BrVFdiNTQxVVhKbnF2THM0bytRQ2FqN3E3?=
 =?utf-8?B?NnhpVHl5ZUdBS1ZmeTJqY0U3SWg5bndZUWx6OSs0ekk5N1oxYmluOGVkQnpX?=
 =?utf-8?B?R0FFSU1nUDV4cDBGNk9kL1F3UktlTzF2UTNqak1NSHNqSXZTNElzdzVjcE9N?=
 =?utf-8?B?eWw4T2hRZTlEc0w4c0ZMWllkbFFGbmppNkRYbXpuT1FNSnliMWtFK3d2eUcx?=
 =?utf-8?B?QVpXNlhob1pDNlpZY1VZZHZLc0E3V0kzV0FKdnNxYVJwaityM0JqQT09?=
X-Exchange-RoutingPolicyChecked:
	pt1ZUyfo5P/Aa4TUnLW6bh+YiT3+A3ICTow06cUZZdCMWPESa+NctKvSDGiGXAck3mdO6kEut1WMAnjEOnRKaajH0Bmuu5z3jwB/whb3CN5o/wU5X7DNHFlHrhrUQ5KrTHNt8ziLk4bx9VWZtneZ8IQyD4rMb6jofEdd9ZHjbmYoyB7K02EDAPyxfCbZAc0euAPVKMFksJUTiHqU+7F83U4yqRwYDfa+QLkBfk6YqSwBml3bZujj5iuQ3+6tUgOPw3ytGYAp/AYiZCy0jlbx6amJ5hPwqpkfShy7RJNMZVGYAfljUCcin6XUupNc5cNNSCt78o61pfiWAVe8UmEJTQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edc10d1-e8a7-4d8a-a801-08df1ed7967c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:45:40.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LttxGpIeqZc/wNEBgre9pOQ1usamzGA2JOoco35zQhPmNXHkl40ww19p+SpVIEZiprkO95B0EK5GYLPLu8D6ay+KHp//IHKvnmyZx0SVEDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6610
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX72zlZ6edOgE6
 VKpwicmyZQGvft+P+y1WAXnnKMhkMMLpjwb2DPSzsYhD1SucrIJfrcGC232O1v5p5eBNLL80J2Y
 CpEyKKOXmM0ifToEUN+VN1VmHYEiD83vVLcrma9U9kzVWIPyn02m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX1+RI8qAytqq0
 JPa8a9yc+NINjU6408DPJcUcMj68gULP2NmODbl1JQlhLh7C96jBF3QmS8Rfwx80FzQHiFuG6Up
 mFYNFSmivTKjsWUp9RR4wqCldX8zaZywT2R9DZXK0N3EPWDMN8bvbRzoiQ34/bJIxibt6vdHFbj
 b/xIT0I/Z0OY6M3WWeBWjyDFnlBou0XiU/rR5upKCs0Azwh3EoT7GRfaKsMjqum9Q2CMZa6DKrh
 fzdFTqCxTAG5EZwX1OT58mVcvsmPQ+ckP/k9cEmcU/V/1AX5b86hLRDpGPZO8TkJlOG9rS6pIV+
 VtozMhMFxPvxOmVtk2rtFLpau9dFuJyudo/zkHa9LBZnP3ILWha9hQubztN4d4lcOdBFRHLjKHY
 Ajiq2LJAP7BJmftQ7CD/spFMpZMFn7ENiT5V4h7WQGY+G1ocV2zMqpTrJaPs61LRV0NJZZPDz4g
 RlErqf2diqOcI5qzo5w==
X-Proofpoint-GUID: 7wb_DsDFO8Rt2iia0kYdJoMQmF32Rdpk
X-Authority-Analysis: v=2.4 cv=OJSyTiaB c=1 sm=1 tr=0 ts=6abcda47 cx=c_pps
 a=MVrca6uEa0E4C5ICDaep3Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=gAnH3GRIAAAA:8 a=jHoozNNMgoUfjAuJyI0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 7wb_DsDFO8Rt2iia0kYdJoMQmF32Rdpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300038

On Tue, Sep 29, 2026 at 10:51:48PM +0200, Fabio Forni via B4 Relay wrote:
> From: Fabio Forni <development@redaril.me>
> 
> fwnode_handle_put(args.fwnode) was called right after
> mux_chip_find_by_fwnode(), but it was too early because the error
> handling code below would pass args.fwnode to dev_err().
> Let's move all freeing functions to the bottom of mux_get() to avoid
> use-after-free bugs.
> 
> Signed-off-by: Fabio Forni <development@redaril.me>

I meant to suggest that you apply this fix before your fwnode patch, so
that it can be applied to the stable trees. Since you put the fix
afterwards, it either needs backporting, or the fwnode patch needs to be
carried too.

You might also want a Fixes: tag for it to actually get picked up for
stable.

Up to Peter though - it's a minor bug and the kernel has tons of such
refcounting bloopers. As far as the code is concerned it looks fine
(minor nit below). Thanks!

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  drivers/mux/core.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index d5121772c483..8bf8c79bc634 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -545,6 +545,9 @@ static struct mux_chip *mux_chip_find_by_fwnode(struct fwnode_handle *fwnode)
>   * @optional: Whether to return NULL and silence errors when mux doesn't exist.
>   * @node: the device nodes, use dev's fwnode if it is NULL.
>   *
> + * When a mux-control is found, it is the caller's responsibility to call
> + * mux_control_put() on it when it is no longer needed.
> + *
>   * Return: Pointer to the mux-control on success, an ERR_PTR with a negative
>   * errno on error, or NULL if optional is true and mux doesn't exist.
>   */
> @@ -597,9 +600,10 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  	}
>  
>  	mux_chip = mux_chip_find_by_fwnode(args.fwnode);
> -	fwnode_handle_put(args.fwnode);
> -	if (!mux_chip)
> -		return ERR_PTR(-EPROBE_DEFER);
> +	if (!mux_chip) {
> +		ret = -EPROBE_DEFER;
> +		goto end;
> +	}
>  
>  	controller = 0;
>  	if (state) {
> @@ -607,8 +611,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  		    (args.nargs < 2 && mux_chip->controllers > 1)) {
>  			dev_err(dev, "%pfw: wrong #mux-state-cells for %pfw\n",
>  				fwnode, args.fwnode);
> -			put_device(&mux_chip->dev);
> -			return ERR_PTR(-EINVAL);
> +			ret = -EINVAL;
> +			goto end;
>  		}
>  
>  		if (args.nargs == 2) {
> @@ -623,8 +627,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  		    (!args.nargs && mux_chip->controllers > 1)) {
>  			dev_err(dev, "%pfw: wrong #mux-control-cells for %pfw\n",
>  				fwnode, args.fwnode);
> -			put_device(&mux_chip->dev);
> -			return ERR_PTR(-EINVAL);
> +			ret = -EINVAL;
> +			goto end;
>  		}
>  
>  		if (args.nargs)
> @@ -634,10 +638,17 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  	if (controller >= mux_chip->controllers) {
>  		dev_err(dev, "%pfw: bad mux controller %u specified in %pfw\n",
>  			fwnode, controller, args.fwnode);
> -		put_device(&mux_chip->dev);
> -		return ERR_PTR(-EINVAL);
> +		ret = -EINVAL;
> +		goto end;
>  	}
>  
> +end:
> +	fwnode_handle_put(args.fwnode);
> +	if (ret < 0) {
> +		if (mux_chip)
> +			put_device(&mux_chip->dev);
> +		return ERR_PTR(ret);
> +	}
>  	return &mux_chip->mux[controller];

(nit) A newline between the above } and return would be nice.

>  }
>  
> 
> -- 
> 2.55.0
> 
> 
