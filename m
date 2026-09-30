Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B352386552;
	Wed, 30 Sep 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761176; cv=fail; b=TJCUbQZzRRH834yWSs4W0C13zXMF32Cawcr1PjxbooEMxpnpYfzDy9WVsVY9SsNv7FhZR55x6rZtmdixIsmMcLdfJkzuYNrjS6M5W+D5F6a7DeDU8gjs2eb07+JRsBh+iyHNxourHJTYNh9i4Y6AypkFFUGgSB9WCMmZFj73KR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761176; c=relaxed/simple;
	bh=fsMK3n+wP+MpWusQYnbxfNvbgkDQAqD45/WRDRDNUQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qhPHpRaCMSz4Goe4Z7TaHdeYVO0T8/Hvw/9ZceMbnoFg4cudxV/gcGkmIfjr04BC6d1BgrUiRfOtxauhNfihSmoL51K/MeD6VZ02xxJmBRqw65hLr4cDI1ThNXNwFMALo43r5WoQ7toRYoxeIINF5/ou9j1outnwTAOAmajpNYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=uIJ9CrRe; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="uIJ9CrRe"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U8dCTD1408770;
	Wed, 30 Sep 2026 05:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=mHy1w
	sXHXsKzlA5S0XSJ3FYiLe2ekJ1ZN3QcmhrLyu4=; b=uIJ9CrRectydldS0JdcWh
	xulY2oZeXEW9Y7vHvnuHqNdDgYbumFgz1bFgLYE8ZVdtVnxBKDPto9Xj2CzHNEGF
	OAY8Ssxhg4E/ymof7U//OPRix0Eh3eCXSkYmeJJj/IGsl8scUrxhmwzNIM/EpPiP
	C9VLzactNZmhicGh1YoE5XnNRCtp6SaKgaStKpZaxsxMW33WbFbk3+sTHk1ZngUt
	8Eii0Te0AOb0khdJBoezzxV1KCpc95dAB82RoO1Ohf/A9W+yAqGzIvyS1DyYJaDH
	wbtjq0blzLqW22zU9uM7qEQVjOLNFggBaxJ/UCUoddvXwpVFP0qW1QJHXTw1iUUM
	w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h0y3tr855-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 05:39:25 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M69kjwmtfY+Q7g3bwzu40BUcx6A41Nzjt7yf62VkKvmUlZ+MxmeZK6lNch5ZbUdJCrI+TWFDvvag5FFd++KRp7aAmfmpJx1XeyT2Zn664t7Tf+jXNSWlc+2rMaPagxuDycRk4tb9XGzZ1oCfmvcm7o34FJMPOzdm5/wy0I4Rno8F4TK/s5LBp6uT7603PDLdVntu7Q0AtX7cdvoouoOj7yTKBqR/s+IrvPB4/5E+WYiqjxyDoja/9u6KS8ZmRFuXcpgk+xnK0KgDSAoStOD1XPDd964j/EpMp/hvMo5AHFXXydZt9Pui6pFD6u/I1J8zNuEE/j7yw7ErDQwRy75XHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHy1wsXHXsKzlA5S0XSJ3FYiLe2ekJ1ZN3QcmhrLyu4=;
 b=Y2l9pOV8XTjAFJqy5Ge8L4Vlc6zVOGcpR4Eod81XhjpNaD0GMfcmnbdIIYzoGdVkQL+RdFNS2FbStQK5h1s7ZsV+5elpy2/bKByK1j1sxYUm/hUNTN2CCgSHdypjuD5jbkG+Z5/yrwLRePQXD6zeVhhrc4Rf21Dw36ZlrDkxocUSeybxiT5BzWCiwsXPxXPf8tqvmIHcbdUrsjBFJDi0d4rfPXK+Wy0nuzzd4HbosBK71hIYVqLXX9rKXOSAM93krdCksqb/leu3Kh/qcXCdM0/VX4r1gepw+q+Lk03z2g8UtZ16j3Nw6ssoy10tVclolYUa4Bsgcrg0+SoS6O9XhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by CHAPR03MB989226.namprd03.prod.outlook.com (2603:10b6:610:2fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 09:39:23 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 09:39:23 +0000
Date: Wed, 30 Sep 2026 11:39:21 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: development@redaril.me
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        xu.yang_2@nxp.com
Subject: Re: [PATCH v3 2/3] mux: Document mux_chip_find_by_fwnode()
Message-ID: <arzYvT0pxsC72iP1@analog.com>
References: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
 <20260929-mux_fwnode-v3-2-9b3b9ae1334e@redaril.me>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-mux_fwnode-v3-2-9b3b9ae1334e@redaril.me>
X-ClientProxiedBy: CPBP307CA0024.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::10) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|CHAPR03MB989226:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fa8862-f3d5-443a-de31-08df1ed6b5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|10067099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CKlakqp9IuHtWmR3a1nQMNbvzAAvGm51AzNhre9LzAxnV+LO0B4dsy7IvuOvn/bL/f1BLwcO7xXSvbMsOoZLlPg4INPvdNVl9qwvG0+cuSZcez482AnSChaVoLzP5q18R5RTdXOwGs9eKOcxzXZs9RBsSREW/qZcyCuN7CHuu5yrdiSK8X67NhAzbR6FfE1nVIkzoItF0Pw/YG0eCFLMfzGqnUQgLjUHcPSLyVKZNTuV36kFxnyEfrrk0WgqfumOC2pLtvflIOEkSfaML3w1AhfiDZ31OevU5uL0mupiqQJtNa825Rqf0SgfwcXulVaK3Y+eg13GvtfWk4/N6d/z6dTmoScqkQ/fA4VNKUUedh4o85V8COXm5USNCK8MbXUaBNvZgZ47xBH2mNFEAmSjbKqrxzZ7z4vJzE77VX2+L8l8nbcIIJZeruuEL4abAKNUZ37jt++jW3Q2HLyjdT1O8/xgNdGuz8j+/JNNGDKqA+YeMyZ1zssBOzPu6Y9OMA+9EIFEEoqGIAxf+nVy//XaFEu3kTNZGYJJ5CqeWuJ9v5S8w1/iV8IzJzpr5mYsytnG1PcoUb4LtQ3GnInj2p27WKbQMU3kP2w/nYKh8NnpmKtVuX1go0YPZ6u8tgIuxuxeUc80zS25B2O0433MI2HyrPX1VAkzN5RZvxNBcGee//I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkhrUFR4eHBrZW40RUNHb3A2NEZiamQ5MENNZXZHYVF5N1BiVmo2L0FYenJv?=
 =?utf-8?B?SmNuQk43dXJvekYvSTA3Zk90KytaV1pvczBCMUVUSzBWOGF5VEN0NDBMYitP?=
 =?utf-8?B?VTN4WDRrOVptazZIZ1B1RXhaYkdkVnVzUkNMY3VJbnZyWG1HY2pXM3RoWCtY?=
 =?utf-8?B?T0dBSzc1UVBLMWIyUFVjeGlJdTczSGhTeVY0Q09YRGFKc0pNMzRFaHp2QzZJ?=
 =?utf-8?B?UTZiY1R6blo0Q3RDbGpXNnc5Mklacnc5eWJ0YVdCMlJkU2Yvenk3bGdRU2Jw?=
 =?utf-8?B?YlZ3OWt5NktEMFNmYzM4aHg1bHZRZzJTMmJYTDRJekVNUDV1V2UzY1dmcnFC?=
 =?utf-8?B?SE1xR3FHUUNtRjNVUVR2Z1JOaVA3Tk84YnNVVm9LMmJqTUgva2xQVDRRdFVD?=
 =?utf-8?B?RytlcUpkRWFzdk44SzFHMW9MbXlsR3Rvb1lTMVJCZkJLdTQ5R1Y5TmFUc0hi?=
 =?utf-8?B?SEsxNUlESXM2cldGU1hHTGVYM0REZ1RKMGxaM0NaVkcyOHBLRFd1S0MvWDI1?=
 =?utf-8?B?TUgzYStlZzNsS2gzYjJPNXkycUpDNzZLV2xSOUFsMFVNQk5hQ3BxM1gwZkM4?=
 =?utf-8?B?QlhkVEpFZmhxZXRhYnJUZ1pSa1JWRzZiMXU0U3hxYzQwUXMxZlkyUFBMZzBv?=
 =?utf-8?B?R2JwTXI0RHpqRFBrRldIUkVuaHpoak1Pc2lRTU9OcGt0STFFc3hhU3dFYzlr?=
 =?utf-8?B?OW5USWF4Q0RRTFo3WUdVcnBtZGpRMXJWblVDMURXZXdYM1luc25vNDVESkJT?=
 =?utf-8?B?amRhcFlSV1NYTmMvT2NKMVhVK0E3UGlSOEhEWURuVUdrR2pIRWRLMUJ2Q3k3?=
 =?utf-8?B?RDR4UG9scllwZHZSWVlxS0tkTUhhVThIZGs5TTB2alJscnNPVjNJejRsVGQx?=
 =?utf-8?B?TkZCSUxieW54ZkNMUE5FL2ZCQ1I2VnlXMjZWeHBKd2hVRWIxaE5tWkVwa28w?=
 =?utf-8?B?cmYrMVZBdndRa05pRFdDNGkydVNwNVdxK2pxaDMvYVhlb1h3bGJGV3V2ckxJ?=
 =?utf-8?B?N0dQSzRpZ1NQU1IyN2diMitmOXkwUVRXbEs3WGx6SHBSYzlrMWM2QklZMXFh?=
 =?utf-8?B?dDBNSEJTWXkwSUtXRHJhd25MVzJCWnF0eWtaQkZFZVlhZHVhN2tTR3dYRW1V?=
 =?utf-8?B?YUQrRG43cXRkaFdZZkc1RHFtTnVjamZNbTFKZE5QUEs4cVcvTGpjME83czds?=
 =?utf-8?B?ME90eUxkODhsUjBIUmwrRjBrSEhQK0RUZkw1MEN3ak9CWVBNOFM3NzhIZnJV?=
 =?utf-8?B?NjRMRGRjeFFKZm1JaEhOdFdETk1JR0ozSWt4dzBZVmE0NVN3NE4ydkFYaU5H?=
 =?utf-8?B?ejdOdnBsR1dxb2EvamtWeUYwM0VYTDk3Q1MzV0dHWHJMY0NhMW1nc3oxVHpv?=
 =?utf-8?B?L044NDRCK1czN3R5dVlVWU9wYTQ2UE8raVpaL2MzWnEyZzJBV3AzMk5wbk1r?=
 =?utf-8?B?ZnhkaWo2dEV4NzNYS2JxZjBNWDNubFhBN1NWMUJLRU1MRnZXVWMwaU1aSTYw?=
 =?utf-8?B?bG9jcjhmWVZ5NzVpQ3NJNXNGZzlmU282WGRmR1Zlb1FOSUFueG9kRW1VTDdq?=
 =?utf-8?B?dEo0T2pOanpRYThqWnd4NTBoaUZzdFBjWk90azAwajF6QjBDSm9hNDE0VWRO?=
 =?utf-8?B?c3lBR2MrY1FyVEJYWlpjOFUyMGZ6dHNFSk9Bakd4aUtsTHFlYk0xTHI0TEVj?=
 =?utf-8?B?cUtlOEkvUU9uSEpmNXN2U1BETXZHRkErc2tWbzR6QmMvcThURk5QbCtMT0M5?=
 =?utf-8?B?S25KMVRmQWlnRmhtaERMZ29Ha2Q5OVd6RlhGVzBTRG4yWmxSY1pINTZ1Tm5a?=
 =?utf-8?B?VFR5Ym1UWkk1enlIMXlOb0xYUnJiVi9Ia0hrUkd2YjV0Y2tUQVBJWUUrVmk2?=
 =?utf-8?B?anVyVXJRQk83RUIrdDBJdjZjb1ZRZUtoMExnNE1WRjJHU29vZlU2eEJSVHM4?=
 =?utf-8?B?NjVWbkt6d3BaUG9lU2ExOE5rN2NrTW1hUVRnRzJKTEE3RStQOWQzNnhTdmFR?=
 =?utf-8?B?SUhEakVheXBVQ0VxNXpDK0hWN0RtWERjVEwxN0ZMUHduTlRVWVRFeDZwSmZ6?=
 =?utf-8?B?THZDaWRKWFpIdTRQRDl2YTNRN3JSRWZVOGxFazZPaXphNzFNZFM1aS9RMVNt?=
 =?utf-8?B?ME9nQTNTalNmRTJQMkt5R2FqeWtuQmg5UGJUbEEyOU1QS3V6L3duQlpyVTh0?=
 =?utf-8?B?aU1QYzJma2krM0VyN29VaDZxQVFBc1kxN295a1o5WlN0R0sxVFVQRGJsSFVi?=
 =?utf-8?B?Y1ZWdGo2bjNlLzhCTHZHRC9sMGNlMkovK1ZTdk02UlZvczhCVXZGZDdsdWlP?=
 =?utf-8?B?LzhtWldsbVVndjUycHdpSjV4UEFZNXBmbjdzWW1LK2xwSm9MeW9Qdz09?=
X-Exchange-RoutingPolicyChecked:
	g2fcuvlQ6h18gX5ZiILDlZziS3z6ySka2BgnGKgMZ2ABbCPkciSbPViMEWjAZWFsKw7aMxfsxMXxbXQnFusWHeS8MWTadPDD3+k8T68ko+S+TqoXgyUDySVKboN9bfimrAw19dbC+VYi2QuKDyevLM9uNIfGQyUqPnm0V4QxmtNgPDE7lHxgtuZNVzS4PWxqvyjZTgAXkUTnn5soy+21XFs7QA4nlpt6SGfhlZ3sWQuei8MceduZE2IiskbJN2JAhtaOdVnywBNrg0sudUjb1Mn5g1KmMkAH1tdxXzAAsHfwatxr1Ilj5jMGgomQ6WjbPYIGFlBcwDOcRL5LiX0u5Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fa8862-f3d5-443a-de31-08df1ed6b5f8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:39:23.7132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IstHAv2GGzsfchd3GbH4j7Nx77d5Lgod/8nxdVRXNr9cpKklXE9iPYkhoAn3mRZygdwVkNcmurUyNeYxEEJODXbJqe+HvQ9bmct8HlrfyxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR03MB989226
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX9P5xdY5+jfWq
 H+8WgiUUbRBDsNWhlrDHXv2P/zZ/pd4Yke7aQlv0AL3jhlv1K2c8jOz1cGXEED4o0/LZqj7xKhh
 KYa8e6ThKbp6ho1O+Ch/JTE8oxXmcbZtHUGF50ju7XW/YnYNvzh4
X-Proofpoint-ORIG-GUID: I_v462Ge6qXwfNRG7dc9HVaJKjA-UD5k
X-Authority-Analysis: v=2.4 cv=c6E+0h9l c=1 sm=1 tr=0 ts=6abcd8cd cx=c_pps
 a=BRoDR27eCUDGJJSfTO8W4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=gAnH3GRIAAAA:8 a=WOY8TdmpXaPGWxVHKkAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: I_v462Ge6qXwfNRG7dc9HVaJKjA-UD5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX4GrhHGn1WzOY
 XrpLEYvI5lYQI4/NhwIRWgT7vl0P6DOg75xGvg/7C53R9L7E7L4q9T54o+0NuxLCnfeq2o4HRlE
 gOK/Bqg1uyYznW8/RWR7DdA+oKLG77EaTge/qV0E9uI9pXGZzpG+2SUlvis3s/a88CBmteMdTOc
 CvRrtuzHE7jO+R4arXhgyt1WouLhz33qJIzpxlkkMw4lYqDpMKXh6ATeM10UWAaW/I3N1WHJNxI
 +gDY3Hih1MH78c1HnADDWIRs5n65DRL3J1ZFwhUw4NOvlLe9G6XLozx3b19gPpdhcJMvFYM8K9d
 yA2yznVZneSiAmFaBCpvlcqq/KGELC6Yq0oTLBQ6jLEk7tjgaOb0PCTuIxJEGGZarOOXtvqzGR1
 97vKXGw/7SdTE9WayT5moLyP+HwetSiQhkVPmKH47WmXSw4R/sQIVr34uRTtR7LtrSC3p2RStHH
 l21auOzEa4XTo6K951Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300038

On Tue, Sep 29, 2026 at 10:51:47PM +0200, Fabio Forni via B4 Relay wrote:
> From: Fabio Forni <development@redaril.me>
> 
> What mux_chip_find_by_fwnode() does it pretty obvious. What's
> not-so-obvious is that the reference count of mux_chip->dev must be
> decreased when done working with it. This commit clarifies the
> requirement.
> 
> Signed-off-by: Fabio Forni <development@redaril.me>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  drivers/mux/core.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index 56096a9139bd..d5121772c483 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -517,7 +517,16 @@ int mux_state_deselect(struct mux_state *mstate)
>  }
>  EXPORT_SYMBOL_GPL(mux_state_deselect);
>  
> -/* Note this function returns a reference to the mux_chip dev. */
> +/**
> + * mux_chip_find_by_fwnode() - Find a mux-chip by its fwnode.
> + * @fwnode: The fwnode representing the mux-chip.
> + *
> + * When a mux-chip is found, the mux-chip increases the reference count of
> + * the underlying &struct device. The caller is responsible for calling
> + * put_device() on it.
> + *
> + * Return: Pointer to the mux-chip, or NULL if not found.
> + */
>  static struct mux_chip *mux_chip_find_by_fwnode(struct fwnode_handle *fwnode)
>  {
>  	struct device *dev;
> 
> -- 
> 2.55.0
> 
> 
