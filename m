Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA3D38F255;
	Wed, 30 Sep 2026 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761162; cv=fail; b=JmTgFzbtB20XeFs8jTP6cV7q4I3ff+Boc1YVHMR72+WM8BGfCnjhiMCor7oB8WWs/6QAQ6qGfi17eHaF5kMwo0hFrKtbaVAgIQCUEoGRPxS1sUabIcYv6SZh3T09QBnjz4kONmlLOfSSCdTJr61pK8hOOYo4Zcy/UNw1/geJLoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761162; c=relaxed/simple;
	bh=lBhEWbS9GD2zmFcnEw8xBjWISMpEAu2DLA4ROP4Zhzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OdNStTO1wROrw4EWF4mv0+iR521W9A8gAHf7fAqIl/fsifPfCuCRLQcLyZGnzeP7eEjc/YiaPVd2pZ5HQfUB3RAD0fzvsjxs7tKwslRPD/qsV7Qk2vuJBh9XygZhYR8K+0xSxj0XAW9sGpnfaOBWb6cqGhfNOg/ZDFlH9dBftrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=U+E0fKrm; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="U+E0fKrm"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U8dCTB1408770;
	Wed, 30 Sep 2026 05:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=lQpAF
	o08vByyz25Unvq3X5skeCHBTcV4ycU06QVDZhw=; b=U+E0fKrm5jlUtl2VpNPlI
	+EKYGS3I12eMljt6CEnCZrzBWI6tZ1GuZcmZzWXVRACf1TLp39XATua3GiSEI0Ju
	AHvILAtGm/2FCKtrmEtxvmly6Dqd4Zxf6CecynwgN4RN3oLVtu3S0/hVUjRBx4/I
	SkVjw4zqy6jgU1n7in3g1MN2o5YA/nB9LOh72jJ/hiTdKnes4EqXAA/vYzDJ8ard
	Jf5JTTwsb8bvh9K41gMNLY33ZkMqOy52HT+Snncg68cXTUFfCBvZeBBaUPNYVbyc
	Eq954TV/aYtxnw8jH7cgp6c+BLr+eBGv89JY4IfRBFB9RICjJPR3UeUnL64qN1SQ
	A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h0y3tr84e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 05:39:07 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3LmrXdUcUrWHw3zWTxmwwAvVOrKqVbcACMT3wsI0aH+ngJrS6xWe10LiCLTq70TzUKaWYE3MXWT+FXjk2uJ4Jzqq9axpUwOiC35gvErtfApnlfk24N0IWWvle3uNftUmkRDCPKhRHAbnBJidPZBskP12JqOGF5H1ZfpIZEJRRlsLXiHLduButy3xbIU0iBoKwy9/h+Ii186AhN489LIzsmpikzj70ExjMh4B+JnXQS1nN3lyB4nndTyzHo6Vod5w8gn3+AIieA1wX+Xt/bNxxwoUgPkRWggSVWcxJRuyt0CXC3DN0/X7cpNzZudz3GYJMiESENTuFwKMJx1lTwapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQpAFo08vByyz25Unvq3X5skeCHBTcV4ycU06QVDZhw=;
 b=bkkZ28bt/mh3f0ok+XdJMUUjQpUc9wqlHAL4gFQzjpEvxAHAUILwqpknC2nu3NjNgtqLwA17DSbsWO6HmKywijp0SUeNIQz6HH8mAXMA9tkUmbEkIJxgCD6oCZhLguD8dgYplSCVgJEdTxPwTfa5WvN6iEbHyqWHNBytCpT2bpcLqN60FZ28bvn+sgn99Ux/tYd0z3ZdTE4x1azH3AGmbJN7/fMXBFNORoGY9vpcigYAsmxTcZn2l9Z5LKjBZa7DifPyXXXkCoueoRZsd3gabNrjDDTY6SWd5PXR9mLKZuBQoIbkT3ys+tYx/JbyN1LENvtG9gIO7zkZIdqm3jmPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by CHAPR03MB989226.namprd03.prod.outlook.com (2603:10b6:610:2fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 09:39:05 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 09:39:05 +0000
Date: Wed, 30 Sep 2026 11:39:02 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: development@redaril.me
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        xu.yang_2@nxp.com
Subject: Re: [PATCH v3 1/3] mux: convert to use fwnode interface
Message-ID: <arzYpNsduacQzAV8@analog.com>
References: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
 <20260929-mux_fwnode-v3-1-9b3b9ae1334e@redaril.me>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-mux_fwnode-v3-1-9b3b9ae1334e@redaril.me>
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
X-MS-Office365-Filtering-Correlation-Id: 672e8708-5995-47b8-0ea0-08df1ed6ab0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|10067099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	iyqbY1E9Tt197/+tgEeaZa+v7vhqr8jxgvZNYYwp+wWCLjhIvkNCcRj4PjRFyALmKRI/qgvy/aLqWKHreJ2pqHYH+8b28PV1ywMTCjZeWE1IsWewxQm+/1n8+DbwM7vQG2m4thP0O4LF0g9ErUyLo0Rh28rFDuVVlEhkIa+tV1xlM2HNDBVqdZmjpm1n+gQ8+OOOvU50R56xl4ccZIQvHyEasqm/1DTiJMAbvsOdR2HmiOFi9of5JUDitvwO2uD0JTHwM+I4PKWq0uZbGyyzuWbcvxhZxGffJ5gdbsDxgxgBGEJ9Xncm4BtZNemslD03+li7ypBnU7jgaIthGEupBcwr5XIdGHqvDME/jfpaEokGLquxpukPWRXVEy4xBH5jx/qMBvnn6v88PMsigrKsW8AiaWK/Xx+H34TkLlDQhcMvhKS6cbZw256kSCGDnNLmEl+C3ZfaEIaTgY94THS/H1cN5wmO8p3/idwkkJQK8y564qqgzOBN/TymkCkdC7XNnGqLbOIne7c+eyFci44KN9q5Q29yLVzXXzEx+7atUa3oOSx3/kMW9YwUbSGGzlJZg0MMR9P8zN/VxuRoFCezwFiAfyZpOH68JyY36rDriJtd+CJ/oqcTSbGXrpNN5DQ/HSzuStdeV0JMJ2jh41UCm/hlYKvrr7fu/U4lZ67zHUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2ZNTUxPbWxtSXQza2Z0c2NlVzV5YnJJL0p6RWpBR01TSDArUFpuVWtqMVFV?=
 =?utf-8?B?U3ROWmY4SGw4YW1JdEZVcDFIUjd6QU9sTVVrTHdBQ291d3piWHlHUy9RNXpV?=
 =?utf-8?B?bUlpM0dIV0hZTlF3Q0FYS0ROS2lFVVhISjQzTFprYmJMZUwzUWNEY0VhUmYr?=
 =?utf-8?B?R0hrSG1TYllLTWpOOTZCclFJS2pzNEdob0gzQldKb3dRNCs2d0IvWFUzcWJm?=
 =?utf-8?B?OTQ3MUR3Y0VzRkptNnpDaEk0RzlJNEl4ekR0VmdRSUFwNC8wZHI2di81VkFW?=
 =?utf-8?B?YjJwajhaVFVzVnRmbGJkeGVseGFBS1RWalJqQ3NIRHM3aG1DY1hFbW92Q1hT?=
 =?utf-8?B?ajh2Y0tYT1pQYzJQZisyZlR6UHRHQXhHTjI5cEI3dlBvWEkwcitLemFQcGFo?=
 =?utf-8?B?eGFRU01nUThtUE15WXlsbUtvaTh2MlJIK0ZaSTUxcVhzTnIycWZoWWxDWVp6?=
 =?utf-8?B?Vkp5M0w5dWg1YzIvVE5xRUNmYW9KYW1JSWZZS1JFbEYrNStaLzdLRGtZWmNx?=
 =?utf-8?B?MW5VSVBHeDRvNXZLZmx3eXVSaUttU0hQSGxNT3dsOS9WL3g5VnUzcHYzSEU3?=
 =?utf-8?B?aG9waUVjM2VGdE1wN25sZmI0dmp4Z0VodE1mbVoveENlNmFXc3lTRmZtSUlS?=
 =?utf-8?B?bTZqckR1NVREaWRFbVBRMmdqNDRlTlJSN0FBTVRqR0l2YTE2RlBLOWVCK0FO?=
 =?utf-8?B?SFc0ZWJBb2pTcTQ4QnljKytIYWlvakFGWlZZb21ucmJSNW9yclFCRmNWQUFh?=
 =?utf-8?B?QWxJenIvck5WWE9ZNjNBRktSVWErR0FFcnNrNW8xbEt5bVR5QzJYazYrb2ZM?=
 =?utf-8?B?YXgxK0JxNXpUSjJHMWhrdk00UlRidkdXcXhpb25CWk1VODhNTkpIak43SnBa?=
 =?utf-8?B?Q2o0bDkvTXIyL0lseXk5dU1DMVM3ajdCS3g1S2ZIajgzaWp0TUVhWC9YVEEv?=
 =?utf-8?B?Y1EveHdMZ2Y3cUEvUVVOSmhDclJ6Z1FTbkhrTHNUbVFmS2dmZ0NaZU5BYzhz?=
 =?utf-8?B?Wk9XVW16YVdBQ1IyN2NvSTdLbXZZS3hGUGVDR1R0dUpWSGdJVlkrRnBpSDln?=
 =?utf-8?B?ZW4vb21DdFg3NGJhc1o0ME10Y2VsNjFQejRCVkloOHFkVUVsbWYwNlZPa2lm?=
 =?utf-8?B?bXYzcXkrZFg3YzVBMFhHM2FxRHhsT0VqRHlZTEpiTk51UklOcGhZeW9hVngv?=
 =?utf-8?B?MlZ1MkNmSmJLVElPQ0pOUE5GUFoyMmVFN1BNVk1NSGtjeUZyQmpqZ25YOE0v?=
 =?utf-8?B?Y0x2ekpSdHI1eWdIYWtBazJQNU5QM2twZlFUNE5ZQzVTTkN3NmF0Tmp6ZkhE?=
 =?utf-8?B?RFVkRGdaWi9xN3VmR1RDc0JGOWZrVlB1cTJXajByQ3o1ZE9La083MWxBekNu?=
 =?utf-8?B?K0cxL2hwRTdPQkQ1S0crUEFTL3VJWGxNNnlzaGdyQUtMRWdUUFZGUTN0UnJx?=
 =?utf-8?B?ckNNYmFOTVN1cUc5Z1Ezb2tXbEdWQnNhdUVmUFRWYmNnbjVOZGNIK3ZmK2lj?=
 =?utf-8?B?OWdaS3dmRmNjRHFjVlpWZ05tNHFjWVpoRlpKeWw0VlZIZWhPdG9MVTBheTdz?=
 =?utf-8?B?M2JheCtRS0RHZmg4dGZqNk1BZmYvajliakI4K01tVGJlTFgzV1l1blRoalJN?=
 =?utf-8?B?TWg0OUJiV1ZsdDZncmdsM0gvTFZ5RnlhZkQrZC8xMkQrQTU1NFNMWDlOaSs2?=
 =?utf-8?B?UWgwQXJDbzJTckZEYVdMQnB4RUVGczJ0WjZPMUp3UDdmMXE1bGIwc216ZDRm?=
 =?utf-8?B?LzZ2ZnJvVG9zRnNYQlJ4ZVd2ZHoyUndwREl5bWlKV0NLbUtKenFMY0xNODJr?=
 =?utf-8?B?b2pVZFMrem5XV2VSSlhwZW5mcWJCanR1ckpaY0ZwZGRBaWpGa0wyd0dKVi9E?=
 =?utf-8?B?cDNhQmpsMVAwQmZQbnFIN2VIZDd4Q3o4S3VDc1NKNjBubGdRdzg0Z0hlSWZ1?=
 =?utf-8?B?VVJ5TVduZlEwMEN0YWFJMm5xemkyNkdQRk9YYWMyeEk5QWRPWFhqZHhETzY0?=
 =?utf-8?B?V2tnQ0xQa1RlbTZEQVBLMmxBbzV6YjJ0Z1doa0hSMCtGRTkxdlQyQXhralBF?=
 =?utf-8?B?WnlxTEN3QkVmNC80eUNGdjJDQVU0dElKNmUxSWNVNzBvY3RQc3VXZk9ESUZ0?=
 =?utf-8?B?Si9mdE1zeGdnaWYxRGdadlFhc3AyODdYTjh2M2doL3ZnUWgzaEJvb1V0MUlv?=
 =?utf-8?B?NGlzR3NpODBvYnk5YzFmbnRrZWdaNTFzSEt2aXU4ZFlraFY0NGVBY1lITXpM?=
 =?utf-8?B?bWFndzc2YlVBZnhtNHpDUTFuNW5aMytUaWhKaVZ2d2Z3eWtIdjBlaHNOK1E4?=
 =?utf-8?B?bnRKQ25lbmNiemJ1RHlpYjluQnd5YmlvNk12OEpUNE9xbXp4aE8vdz09?=
X-Exchange-RoutingPolicyChecked:
	plI4pyEAA9f/QvFFjbsg5mWwtGIqVH9KWVZi40RNilfd0d8+6t9niMQf4DMgfbzgnjunQWLdPe8h5l7pq3t3SagFTUrqR+JvSKM183XEchYX+VbDJepWqy3Gf94xAYY6P9SXhSe+aefThXoYScgdjJz9oj220PUCNuHqQs2v5FGe9lWaF5JMpypHp8jPXqSkH6FKWhP2x3H/WaLWURSreclqtyKG1fTvK829oPOA2VLixQOABXwiN6Hyu9VCK3X5+deVwJWlKGltnlORyuMZOqOggqyVFclwGFbP97b1o0h3r5KlaEanww79ye112ta5p4vG2IxyF090buvW8XEBpQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672e8708-5995-47b8-0ea0-08df1ed6ab0a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:39:05.3411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mgMsZxAnhFhwMVbuPpusPjXRo9c6gLfWMUVby2WnxdrZCKnBW2yCdcs2tOe9HWRH9qIO/QpspK/KKvYSvG9EqPwNHkPYJ3oqDdkL2zlSjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR03MB989226
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX0qnPkCeeExaR
 s2Xs4hFwhWD0D1Xefh2SXtuGCo0jzjtl3FcorIx2Os/ky8B4viyVF4M+IYIR8VxORNfgFz6aU3m
 cOYzQMB+GRpX49DnItlZIHX+Pf/nnefs75Q/jCPX4jKZ1XvXcr0r
X-Proofpoint-ORIG-GUID: EMbaLYlpyFJiF_ip1w4Nki4wVERta6KQ
X-Authority-Analysis: v=2.4 cv=c6E+0h9l c=1 sm=1 tr=0 ts=6abcd8bb cx=c_pps
 a=a15oepxCFtbapkdjUscCyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=8AirrxEcAAAA:8 a=gAnH3GRIAAAA:8 a=4dERbGhpkMjp6T4RhugA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: EMbaLYlpyFJiF_ip1w4Nki4wVERta6KQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX/iQLJp8E/Wby
 3tVlFX32fWQF3b577godXxU3iHywjv5mcL/oqvvhdFcnP6ny/QcGo79cGOXcLwtGNeU/VZ9HybL
 /5j40XvscMZ7mfaOgLvPkQ3I0xXtJYHojgbc/SR6tpz7baufbVzPO+plbNm115WHyaIqIJG/94g
 aZ3IJYeSlmPyzUcGDy+TaH6v9HNonaPlKbQpyqV/yArqjTQ++hZYxGnBv58h3hnKbnnVfeVVrgY
 YGWpsYxJuJvydbFkF1Ww3Pf2+BmJv+sPrZ2T0kdqqCOmAFWx0EmT62sNwwvFntAmB7z0R1jSYz1
 sL+16yB7iAg3SSuh7LnW5VWQgNFq8X/wjsujMdj0wH/pV1Ui+TEnN/hnb4a9q87SlzFG8fMVzmx
 K+Kga9mAOICYiC9vVOb/TcvnhirF8FAhwUmiu8VXB+dI3o56Qsr3Cea23DEf8bkWvJruCUSdh3L
 oYymCj1Xr4pBvF6Tqnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300038

On Tue, Sep 29, 2026 at 10:51:46PM +0200, Fabio Forni via B4 Relay wrote:
> From: Fabio Forni <development@redaril.me>
> 
> As firmware node is a more common abstract, this will convert the whole
> thing to fwnode interface.
> 
> Co-developed-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Fabio Forni <development@redaril.me>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  drivers/mux/core.c                    | 96 ++++++++++++++++++-----------------
>  drivers/pinctrl/pinctrl-generic-mux.c |  4 +-
>  include/linux/mux/consumer.h          |  6 ++-
>  3 files changed, 57 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index 5083e3d19606..56096a9139bd 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -18,7 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/mux/consumer.h>
>  #include <linux/mux/driver.h>
> -#include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  
>  /*
> @@ -118,6 +118,7 @@ struct mux_chip *mux_chip_alloc(struct device *dev,
>  	mux_chip->dev.type = &mux_type;
>  	mux_chip->dev.parent = dev;
>  	mux_chip->dev.of_node = dev->of_node;
> +	mux_chip->dev.fwnode = dev->fwnode;
>  	dev_set_drvdata(&mux_chip->dev, mux_chip);
>  
>  	mux_chip->id = ida_alloc(&mux_ida, GFP_KERNEL);
> @@ -517,11 +518,11 @@ int mux_state_deselect(struct mux_state *mstate)
>  EXPORT_SYMBOL_GPL(mux_state_deselect);
>  
>  /* Note this function returns a reference to the mux_chip dev. */
> -static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
> +static struct mux_chip *mux_chip_find_by_fwnode(struct fwnode_handle *fwnode)
>  {
>  	struct device *dev;
>  
> -	dev = class_find_device_by_of_node(&mux_class, np);
> +	dev = class_find_device_by_fwnode(&mux_class, fwnode);
>  
>  	return dev ? to_mux_chip(dev) : NULL;
>  }
> @@ -533,17 +534,17 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
>   * @state: Pointer to where the requested state is returned, or NULL when
>   *         the required multiplexer states are handled by other means.
>   * @optional: Whether to return NULL and silence errors when mux doesn't exist.
> - * @node: the device nodes, use dev->of_node if it is NULL.
> + * @node: the device nodes, use dev's fwnode if it is NULL.
>   *
>   * Return: Pointer to the mux-control on success, an ERR_PTR with a negative
>   * errno on error, or NULL if optional is true and mux doesn't exist.
>   */
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
>  	if (!mux_chip)
>  		return ERR_PTR(-EPROBE_DEFER);
>  
>  	controller = 0;
>  	if (state) {
> -		if (args.args_count > 2 || args.args_count == 0 ||
> -		    (args.args_count < 2 && mux_chip->controllers > 1)) {
> -			dev_err(dev, "%pOF: wrong #mux-state-cells for %pOF\n",
> -				np, args.np);
> +		if (args.nargs > 2 || args.nargs == 0 ||
> +		    (args.nargs < 2 && mux_chip->controllers > 1)) {
> +			dev_err(dev, "%pfw: wrong #mux-state-cells for %pfw\n",
> +				fwnode, args.fwnode);
>  			put_device(&mux_chip->dev);
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -		if (args.args_count == 2) {
> +		if (args.nargs == 2) {
>  			controller = args.args[0];
>  			*state = args.args[1];
>  		} else {
> @@ -606,21 +610,21 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  		}
>  
>  	} else {
> -		if (args.args_count > 1 ||
> -		    (!args.args_count && mux_chip->controllers > 1)) {
> -			dev_err(dev, "%pOF: wrong #mux-control-cells for %pOF\n",
> -				np, args.np);
> +		if (args.nargs > 1 ||
> +		    (!args.nargs && mux_chip->controllers > 1)) {
> +			dev_err(dev, "%pfw: wrong #mux-control-cells for %pfw\n",
> +				fwnode, args.fwnode);
>  			put_device(&mux_chip->dev);
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -		if (args.args_count)
> +		if (args.nargs)
>  			controller = args.args[0];
>  	}
>  
>  	if (controller >= mux_chip->controllers) {
> -		dev_err(dev, "%pOF: bad mux controller %u specified in %pOF\n",
> -			np, controller, args.np);
> +		dev_err(dev, "%pfw: bad mux controller %u specified in %pfw\n",
> +			fwnode, controller, args.fwnode);
>  		put_device(&mux_chip->dev);
>  		return ERR_PTR(-EINVAL);
>  	}
> @@ -714,14 +718,14 @@ EXPORT_SYMBOL_GPL(devm_mux_control_get);
>   * @dev: The device that needs a mux-state.
>   * @mux_name: The name identifying the mux-state.
>   * @optional: Whether to return NULL and silence errors when mux doesn't exist.
> - * @np: the device nodes, use dev->of_node if it is NULL.
> + * @node: the device nodes, use dev's fwnode if it is NULL.
>   *
>   * Return: Pointer to the mux-state on success, an ERR_PTR with a negative
>   * errno on error, or NULL if optional is true and mux doesn't exist.
>   */
>  static struct mux_state *
>  mux_state_get(struct device *dev, const char *mux_name, bool optional,
> -	      struct device_node *np)
> +	      struct fwnode_handle *node)
>  {
>  	struct mux_state *mstate;
>  
> @@ -729,7 +733,7 @@ mux_state_get(struct device *dev, const char *mux_name, bool optional,
>  	if (!mstate)
>  		return ERR_PTR(-ENOMEM);
>  
> -	mstate->mux = mux_get(dev, mux_name, &mstate->state, optional, np);
> +	mstate->mux = mux_get(dev, mux_name, &mstate->state, optional, node);
>  	if (IS_ERR(mstate->mux)) {
>  		int err = PTR_ERR(mstate->mux);
>  
> @@ -771,7 +775,7 @@ static void devm_mux_state_release(struct device *dev, void *res)
>   * @dev: The device that needs a mux-state.
>   * @mux_name: The name identifying the mux-state.
>   * @optional: Whether to return NULL and silence errors when mux doesn't exist.
> - * @np: The device nodes, use dev->of_node if it is NULL.
> + * @node: The device nodes, use dev's fwnode if it is NULL.
>   * @init: Optional function pointer for mux-state object initialisation.
>   * @exit: Optional function pointer for mux-state object cleanup on release.
>   *
> @@ -779,7 +783,7 @@ static void devm_mux_state_release(struct device *dev, void *res)
>   * errno on error, or NULL if optional is true and mux doesn't exist.
>   */
>  static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
> -					      bool optional, struct device_node *np,
> +					      bool optional, struct fwnode_handle *node,
>  					      int (*init)(struct mux_state *mstate),
>  					      int (*exit)(struct mux_state *mstate))
>  {
> @@ -787,7 +791,7 @@ static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mu
>  	struct mux_state *mstate;
>  	int ret;
>  
> -	mstate = mux_state_get(dev, mux_name, optional, np);
> +	mstate = mux_state_get(dev, mux_name, optional, node);
>  	if (IS_ERR(mstate))
>  		return ERR_CAST(mstate);
>  	else if (optional && !mstate)
> @@ -821,23 +825,23 @@ static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mu
>  }
>  
>  /**
> - * devm_mux_state_get_from_np() - Get the mux-state for a device, with resource
> + * devm_mux_state_get_from_fwnode() - Get the mux-state for a device, with resource
>   *				  management.
>   * @dev: The device that needs a mux-control.
>   * @mux_name: The name identifying the mux-control.
> - * @np: the device nodes, use dev->of_node if it is NULL.
> + * @node: the device nodes, use dev's fwnode if it is NULL.
>   *
>   * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
>   *
>   * The mux-state will automatically be freed on release.
>   */
>  struct mux_state *
> -devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
> -			   struct device_node *np)
> +devm_mux_state_get_from_fwnode(struct device *dev, const char *mux_name,
> +			       struct fwnode_handle *node)
>  {
> -	return __devm_mux_state_get(dev, mux_name, false, np, NULL, NULL);
> +	return __devm_mux_state_get(dev, mux_name, false, node, NULL, NULL);
>  }
> -EXPORT_SYMBOL_GPL(devm_mux_state_get_from_np);
> +EXPORT_SYMBOL_GPL(devm_mux_state_get_from_fwnode);
>  
>  /**
>   * devm_mux_state_get_optional() - Get the optional mux-state for a device,
> diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
> index 202b72351efb..6d5b6100c5ca 100644
> --- a/drivers/pinctrl/pinctrl-generic-mux.c
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> @@ -50,7 +50,9 @@ mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	if (!group_names)
>  		return -ENOMEM;
>  
> -	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
> +	function->mux_state = devm_mux_state_get_from_fwnode(pctldev->dev,
> +							     NULL,
> +							     of_fwnode_handle(np_config));
>  	if (IS_ERR(function->mux_state))
>  		return PTR_ERR(function->mux_state);
>  
> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> index 449e38e6e2c5..7d121217ca96 100644
> --- a/include/linux/mux/consumer.h
> +++ b/include/linux/mux/consumer.h
> @@ -11,6 +11,7 @@
>  #define _LINUX_MUX_CONSUMER_H
>  
>  #include <linux/compiler.h>
> +#include <linux/device.h>
>  
>  struct device;
>  struct mux_control;
> @@ -62,7 +63,8 @@ void mux_control_put(struct mux_control *mux);
>  struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name);
>  
>  struct mux_state *
> -devm_mux_state_get_from_np(struct device *dev, const char *mux_name, struct device_node *np);
> +devm_mux_state_get_from_fwnode(struct device *dev, const char *mux_name,
> +			       struct fwnode_handle *node);
>  
>  struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
>  struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name);
> @@ -165,6 +167,6 @@ static inline struct mux_state *devm_mux_state_get_optional_selected(struct devi
>  #endif /* CONFIG_MULTIPLEXER */
>  
>  #define devm_mux_state_get(dev, mux_name)		\
> -	devm_mux_state_get_from_np(dev, mux_name, NULL)
> +	devm_mux_state_get_from_fwnode(dev, mux_name, NULL)
>  
>  #endif /* _LINUX_MUX_CONSUMER_H */
> 
> -- 
> 2.55.0
> 
> 
