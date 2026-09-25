Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344024C680B;
	Fri, 25 Sep 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350660; cv=fail; b=fFhOYBkztLvrFGIks/bzbYbnsI7L+GxK6aHscevkqgqm8J2GfcNoDvoZtTGpd7qjz1Ba6RwggW23P+gT3CZM4rNzjp+qKbp2TYVVUszEg0r6BMWUL/wfzhc9Ueh4FBBu5panR3f1SBJtPoUZo8nDXauFf2vn0bJIBk2rD6cf6wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350660; c=relaxed/simple;
	bh=jmotbAoR8q0ib1s6OZFjvnW4E7hUlelL6f51tbMWVXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gb0omhOKlBxoLwCMbWntdyKIr2ApBarHnpusiLusJK8zi3/nr2Z9X0dWPeTRjWlvsVWVVfaVSrqmShKLjBqnFl2nMgPCdhywOTw5EZ1QOHQmiPCVaCanR1aTay+n6IEvszwb48fFjYP7p1JKdyAzOgJIZP4lnOKRRJqBQB2ui5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mDkr8Ack; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="mDkr8Ack"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDhmUx3902923;
	Fri, 25 Sep 2026 11:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=6qsPTFw+6+V/58rdvSo7RgbEk0HvG
	3XQ69qRj6p1+N8=; b=mDkr8AckMfmbNLYqGNCFHfVacS2LgBGq+MzpcVFmcEfkW
	akqceV+nzN1NjQO96R4gWpRgAmB6cazBnJImpSegYM1SAFGsznB34YLyxr9Rp1Ec
	PKadXMQiQxwEO03ltxk+etnRrTGGQ4YmODpxWMByg7CCfxrII+7RTYQu44Ybmmxq
	3PGZ8BExDNqZjSICd/M4BmdGzgYwPjKT1X05slJ4u1scDBRlsz0oLC5uzVjx86Fr
	dKQ5UFXuuf6VE8ybKz2oOYCeqC6kZrpbUrio6BzbeoEbVilg57RJDvRQS7AHAkqh
	tfl7yw/EuZFHjlcPesk8HxPClXdwEltXkRm6jdBqA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gw714wmgr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 11:37:27 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ra52/61XICFbC7E5/9dj3IMVUFo+iDI8ZKviYR4kgMZULUzPpxeJ7iaUfojDFvgvvJMw7oSNAlZIG1z2xtyCh/3DrJyrjdzJr6Xw+9O3JoaLyroNGcP8hA3fc5KqZgCDU+wX+VTE6JwHQi4XUAgDG98kYkq+dTjfJkTFTsZFSaadjiI63IgN/4IKnHhBWvpawlN0mTURHWW6ZhdUq3L9k4zbq8snIiq5MAIRB2Ef3ng3Z59wNK03uwLEhsuuoN5D1kjoo/Vl+pL7BC5hdmXsULBLj3idNaQdeg96LZF9XlKHxCFnd0uI27HTlU8MsGsIDwsddhd9oJhuz/sAlcLj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qsPTFw+6+V/58rdvSo7RgbEk0HvG3XQ69qRj6p1+N8=;
 b=lZShM1pzhQE25MN0Z/Rk7vvnCo+v9p7fLiF0qACeNemId4CjFo9ablxNGPaiQBRGM9rA0ianqqcsWAe3xMNGNJC1p57mxxEMGPOppQX20VdW0me+J8vS8hqVPqVzl+XZgTR28uUztMPPnxOMeZmhFAA+rzSbG873nDhEN3J7R8YG3Uhutm6UvbaiWQJnYNjALyH37vrwYLnSGSfkyWtut7zCzRoO6PZ8LxS5kifZMvcg/MD76hYQdG39BOryWCZqgqYhvpSc99bScDNZwF5OKEjgGqmzciP7eEdvz4kZNsrcN97A0i//0dzdj8/o6pZLToELb6X27hz6y0kvWxrzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MN6PR03MB7645.namprd03.prod.outlook.com (2603:10b6:208:4f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:37:26 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:37:26 +0000
Date: Fri, 25 Sep 2026 17:37:22 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Fabio Forni <development@redaril.me>
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        xu.yang_2@nxp.com
Subject: Re: [PATCH v2] mux: convert to use fwnode interface
Message-ID: <araS8BpKyYI-nkxM@analog.com>
References: <20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me>
X-ClientProxiedBy: AM0PR02CA0189.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::26) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|MN6PR03MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 223d6a82-1d95-4a50-a1b7-08df1b1ae64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T+2ytAfkeXZpAs2nDjHzh397u9C2EZTiL1yX4M7yBPlv0OLn3K4USZt5J1H0rTB7yMVC1hPfNpbhIN5d+SqiqckZz/zBNuiUqy+rorBh/Z4IJ3vyKqKMaGVV2Cdi7t0qDFLk1MWMr2SeNLm31CxbmyE9/ByXYFCPmPbrIZ2aw/UE45HaC29FcFjY0Ql2F1hUU2Q8OWK56wwYPSHLgpGKnAcoWzegAJ18GDvWpY5cdA4swjaDvHIA5D8fA9XKShs2JIetZJTEYzembWJCS7kbZzCnKoRzTinMz6WNti9r0tlBh/+6sbYAAGX0Qo3eSFo2o8421K8HCexabazal1yk/461+EZ1YKJyAWyXpeuQbW4vGEsLjYFwyPi0gVl2KcvZQx/B/OcnMdES1o7Un3apcFD8+mCbNKZ2FgUaDp1tRawWJIlvZ21rYlM+yH6BK8PbAWXe3ZlRtE34+xf84H5eESuSkDYOiHlBrP3FwXVsL/VoQOVh4H4swPXbC0TSeWYsWoGY6VzaGzGHYdPPtmTy0qagwLlUtpp9UeIO/Ermh9uf3NTcvW3pRPp7ewjYJ0gqyYgLGLlaUBUI54FLdpABNcim+VOuMwG2DiM+Oyjkedo4xBbVtyEYd8UpDeHGHd8NBaX6Be4yKAZvKTbc+vgM0MaSgKfb0hdPNPVrDhmbF7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RncybzV6aVJvalNXWXY5d3M4cmtqVjVScUlHQXJHV3V4aVFBTjFNbllaVEpM?=
 =?utf-8?B?OUdPZjRaMWRKcGJVTUJYUXRIelNsM0FwZTJTT2l4ZjF2SWloOE4yNERmTFRC?=
 =?utf-8?B?UFRYWWxEZkhUZUlQVXROWkFGRVErMWpSTmd1VHVWNkxJSko4VlFnb3RUa2Nq?=
 =?utf-8?B?Y2NsbUFKQ0tIVXhjYlpEdjZsd0QzZFRPVG9TV01kY1ZLcitXamcrTW5MNUhs?=
 =?utf-8?B?RFVQdFNhSEowYnhoS21SNmdVdkU1TjBxdGx0WnNERm04b1YyOUlxR0pvSnUv?=
 =?utf-8?B?WXlpQkFxUkg5eE9NL1poRDhBMEN6c2h5K1dXNk1SK3V1M0hvYzJLR1JsSDRR?=
 =?utf-8?B?S25KNEhBS0NJc1ZmbCt6azMrOVZJNHRicnNmR3RhSC9jVVhjSVRTZzc3STFa?=
 =?utf-8?B?Ti9wYWJzQ2JwdmJYTTBWQUJVaVFtWjd6dm95UUJHK25SclpnMVFwdFRMRjBU?=
 =?utf-8?B?NEUxTHNneWlUWEFQZjlob3MrelczUUFteklXQXlpaERwY0g1ZVJacldsV0p4?=
 =?utf-8?B?L3hTZDhwRHRUdmcvNmtBQzdOTWo2MmNHU0FmZ1cwL2xLWTl6SnNscXU2REFV?=
 =?utf-8?B?cE1rbVl4elZYMWNjSkgweUxEWUwwTDFTcEhHTThPUmROWEYyYVBKc29MRFJB?=
 =?utf-8?B?SVRVeGhMN0l4N3BrVGFybitQYlhKSnR1VkNSQUlWYjlBRXdFMFJPVGUrVnFT?=
 =?utf-8?B?TzdFTFl1b3gyMXVQNTEzdEYwbGtiajk1dEZaWUlNbW5NRUwrYlFnb3Uya0pm?=
 =?utf-8?B?cDRxSlhqWDQzTW82VlpHeUxJL0lYeFpVWm1UUU8vaVBaR25HQlZ4Zzh6aVFB?=
 =?utf-8?B?bjN5OVVta0R4L1ZKUjBpeUtiV0UvbU96SjdyMkc5cngwQy9iWHFEYTB5SU1O?=
 =?utf-8?B?endWZlBXME10OTQwL2dZMnBTWmxSZkdJQUxIZGlOTmx0NlFkQjcvN2VuU3RB?=
 =?utf-8?B?N2tPMVVuM0NsQ1NoTUszNW1PckNTYUozY2NvSTl4cFVsa3RudkNYMUZDMFUw?=
 =?utf-8?B?bDVEenFuVlE3Tm4yZUVNNTduQmFsRVdKc1VtR2xTU3NSU0tNVU5zYnY3bjZm?=
 =?utf-8?B?dkQyZUhJWTVqZ2txbFlCc1ExZnBOTEcxdFpaUW5kRnRLdENaY3hFME1tQjZn?=
 =?utf-8?B?aWtoQ2liQnNyWHdIY29TbnlSQjB0R0hPUkVkMU1EcCs5N1d6Qk1Hcm02cTMr?=
 =?utf-8?B?VHZ4S1N6MEx2RDMxcVcwbFV1SWhaV09IeGxpcUwvUDZaWEo1eHRVUlZOYi9s?=
 =?utf-8?B?ZXQ4NXhnVEhGT1NUSk5YMTVxUWlZYlY3enZRdld4bStHL05OWkV5U1JrUm1M?=
 =?utf-8?B?TTZTbWhpdG5WN1BlL3M4elAzSmhDSGR4cGV2TTY0b28xbnd1Y05BNkFVOWdQ?=
 =?utf-8?B?a3U1bWRCTXF1ejlBYXFJTW9HY2NzQ3didVkvYkwyMWYwZnFnLy8zTzdwTzF2?=
 =?utf-8?B?ZVgyMGMwMElFQ1ZTWU5MWnJsZ214azIvYmhWNnRQS1QvakVKd2lMZjlGLzhO?=
 =?utf-8?B?azMzYUpDMzRYSmtIRnlFZDd6c2JoRWhRZUUzY1hSeEw0TmxldGlwOWpTRDZy?=
 =?utf-8?B?VmZ2ZHNsZDZpaXJDcm5QNDZSMW05N3FoMk1WaWVaai9KQ3ZFMDNyN3RIVVVp?=
 =?utf-8?B?OVpYZW5XY2RWcnczUjE5cG1CZjNYNEVyVlpubUtoMS90Y0pSUXNTVFI0c3RH?=
 =?utf-8?B?OXhXQ0RFQzRadi9JZWZuQlRTbFNwVktrdXR4RE9OeTVqVVd0OUt6bHpSSWc3?=
 =?utf-8?B?WDRTeGIvTUR2dVpQK3JsUHdZNWhBYis2Zlg4S29uSGtRQlZ5cWE0a1ozeHE5?=
 =?utf-8?B?akwwSHRiQlA4WFpMazJRYUZKa09GS0FKSlllTGJiclowbWhJK1p5UmltQjZk?=
 =?utf-8?B?WnFTRzVQQ210eEx6QUR1UDZlcjlZTFYvbjAxRXRBVWRPMnBYdk5WdlNaM3JN?=
 =?utf-8?B?UWNFSXpnd2JTZGJnVHVlK3JuRnY5ekUzOVZVbE91SDhtMGt2cFBPay91SWNB?=
 =?utf-8?B?WmJWZHp0aUlRVWNXdG03Y2xSWDdESmJ3R0VwdlNBYThGSlhSMWF5ZCtoSUFR?=
 =?utf-8?B?NDJoOFhJSWNIWExyaG5hazVMRFRJeFFjbTk2ajhxazRpSk1IKzZnV05MSjJj?=
 =?utf-8?B?NVFJZ0JOK25TYWZBOWorT2ZJZmtRNkRBalpDWENLYzhnN2xxWXZBck1QWDd0?=
 =?utf-8?B?bG96UnRleGt2WC8rTFEzVDlDMzBMcGVXMjdJZWxmcHV0dm1Ic0I3dU96R3Rw?=
 =?utf-8?B?U3JNUGRPd0U4Mm9wemZmQTFkRXI2bXEzcWFjMUdQb1lOQXdUclhhbDdIV3Z4?=
 =?utf-8?B?QmYvZEYwY3FJZjNsZTBvcURJSDdJdU92TTZwamlYVVdYR3FIay95UT09?=
X-Exchange-RoutingPolicyChecked:
	tjLCgYMFeVfxeUptpyPEWf12FhxINTIRk3NksE+9gjJJbU6Kt6RIvtziTKrX+ef/daEedlzsuiyNm2gidLi9BqPfq43Pa76KKA3LzvkKc5QVc619e+a6ocwM7RA2RxZRWbZAPMHeSQ8WhvNFRrzdWQ7zOgfW6LG4/NrNssTKd30+Qo7+sBqPNo97HfJvg79BocSx62Gr4VdTSF9IwoS0YrX3+G2PCef+8RzOf7PR4vq6YNAtUXZ9s3h5gsVusiF8pYPKRwqa8KZdh/BanS0J7PQ4KXzabC3Vb4003TcxjVehi2JAWuAnl0AiMcyWLBO7Fd0ReGdoP6V0rhpYrHLMgA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223d6a82-1d95-4a50-a1b7-08df1b1ae64d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:37:25.9681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/dkLcIeq/V1awrflAhNEOMA6KbtHzj5u9VFB7eEuAseECfUl80Cclhnu4DOTdiI/eIOGM56wLxlmxFFgOKy8Wizvd/2QUTxLdSSx2Hae7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7645
X-Proofpoint-GUID: aMAdFXEizwyTLiaVOlGxCs75Msa-Fp-b
X-Authority-Analysis: v=2.4 cv=b68ncdGx c=1 sm=1 tr=0 ts=6ab69537 cx=c_pps
 a=P8hJoqhRnqo/cwUvmyxmUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=3jW53moY2l_eMGSzyNoA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: aMAdFXEizwyTLiaVOlGxCs75Msa-Fp-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX9SssLiStp3cW
 1SuolaTuG5LosLuKB/mdcM09ivBeStgZjg0Ys5jAU+wNMo/fANw730VqqQKFQpZcFERC2ik0GW+
 T8MDHxq3qI+GSTQsuOdM/dpD3Mv5rYPDjXZH7lFoV2nSP+Sv2HIRBLTgPMQJbSN1X9EIIyCo5sg
 kf0Ucqg+rL8F8kD7+me5wdb4Ky7wrmxWf3czTMnOEBO1cuz66OLbXzRkEe7yQYD6Fys3ZY+qeAL
 gdZ1pDSO7Lzc4xGqYMwarRZdB6QFjqN86y/tFHYF6Ob7aDg/1ichBtT87Z9Nx/2gBb+21pvEWrR
 7L1Zwtz0jIcANMF7bMykiQ4sCDxu5HWoXgPkIVUu13NB+6mUxQB4FGobFcxA86uLU4YjaRsNfDU
 R2lf69btOCX8PKgT/DW+jwWyGsfz8/VLslmwCrYQ6vac/1HwRJ0JR5UT4t+nRQ+vjN/tTwD+OBx
 F/I4rcSX98LE6pML4YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfXxahPJi3ls5yY
 kFn72pV0oJCWVSJr+QYc3qEVvS/dy8cQRbdVJBMiIDl5BcrcethqlQrBdowV2OSGD+iVdFLpznR
 6DGp8kO5iHYejSHRVWdVgl+Uw76BWKpVMRLFBwaeDF4Vb+CgEkta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250062

On Wed, Sep 16, 2026 at 07:26:34PM +0200, Fabio Forni wrote:
> As firmware node is a more common abstract, this will convert the whole
> thing to fwnode interface.
> 
> Co-developed-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Fabio Forni <development@redaril.me>
> ---
> This patch migrates the multiplexer subsystem from using the of_*          
> family of functions and structs, to the more generic fwnode framework.     
>                                                                            
> It is a rebase of a single commit[1] contained in a old patch series[2]
> submitted by Xu Yang. The original commit plus follow-up comments were
> tested on kernel v6.12 on an arm64-based board, but this current rebase
> isn't tested yet.                                                  
>                                                                            
> Link: https://lore.kernel.org/all/20220823195429.1243516-3-xu.yang_2@nxp.com [1]
> Link: https://lore.kernel.org/all/20220823195429.1243516-1-xu.yang_2@nxp.com [2]
> ---
> Changes in v2:
> - Rename devm_mux_state_get_from_swnode into devm_mux_state_get_from_fwnode
> - Link to v1: https://lore.kernel.org/r/20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me
> ---
>  drivers/mux/core.c                    | 96 ++++++++++++++++++-----------------
>  drivers/pinctrl/pinctrl-generic-mux.c |  4 +-
>  include/linux/mux/consumer.h          |  6 ++-
>  3 files changed, 57 insertions(+), 49 deletions(-)

[...]

>  static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  				   unsigned int *state, bool optional,
> -				   struct device_node *node)
> +				   struct fwnode_handle *node)
>  {
> -	struct device_node *np = node ? node : dev->of_node;
> -	struct of_phandle_args args;
> +	struct fwnode_handle *fwnode = node ? node : dev_fwnode(dev);
> +	struct fwnode_reference_args args;
>  	struct mux_chip *mux_chip;
>  	unsigned int controller;
>  	int index = 0;
> @@ -551,11 +552,13 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  
>  	if (mux_name) {
>  		if (state)
> -			index = of_property_match_string(np, "mux-state-names",
> -							 mux_name);
> +			index = fwnode_property_match_string(fwnode,
> +							     "mux-state-names",
> +							     mux_name);
>  		else
> -			index = of_property_match_string(np, "mux-control-names",
> -							 mux_name);
> +			index = fwnode_property_match_string(fwnode,
> +							     "mux-control-names",
> +							     mux_name);
>  		if (index < 0 && optional) {
>  			return NULL;
>  		} else if (index < 0) {
> @@ -566,39 +569,40 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  	}
>  
>  	if (state)
> -		ret = of_parse_phandle_with_args(np,
> -						 "mux-states", "#mux-state-cells",
> -						 index, &args);
> +		ret = fwnode_property_get_reference_args(fwnode, "mux-states",
> +							 "#mux-state-cells", 0,
> +							 index, &args);
>  	else
> -		ret = of_parse_phandle_with_args(np,
> -						 "mux-controls", "#mux-control-cells",
> -						 index, &args);
> +		ret = fwnode_property_get_reference_args(fwnode,
> +							 "mux-controls", "#mux-control-cells",
> +							 0, index, &args);
> +
>  	if (ret) {
>  		if (optional && ret == -ENOENT)
>  			return NULL;
>  
> -		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> -			np, state ? "state" : "control",
> -			mux_name ?: "", index);
> +		dev_err(dev, "%pfw: failed to get mux-%s %s(%i)\n",
> +			fwnode, state ? "state" : "control", mux_name ?: "",
> +			index);
>  		return ERR_PTR(ret);
>  	}
>  
> -	mux_chip = of_find_mux_chip_by_node(args.np);
> -	of_node_put(args.np);
> +	mux_chip = mux_chip_find_by_fwnode(args.fwnode);
> +	fwnode_handle_put(args.fwnode);

I'm actually not sure why there was an of_node_put() here in the first
place. It seems wrong to me. Any idea what it's for?

I want to give a Reviewed-by here for the rest of the code, but if the
above _put() erroneous, it might be better to add a patch before this
one to remove it (and cc the stable list with that patch).

>  	if (!mux_chip)
>  		return ERR_PTR(-EPROBE_DEFER);

Kind regards,
Alvin
