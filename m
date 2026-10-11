Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5521338E8A8
	for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703807; cv=fail; b=GnnG/REqKLL5ebzgtJarbg10pVeV6TdxQ837sBT+qK6TKQlajZmMAQe2mow4ACrr2ERfUWF+FgtvXueKVyouCwX9tkjA8e3cSNmIxFqz8iVNeeuv/b/ZdSF4rARi0lU0EbvIB4SWddRpz8zs5T+dyLxrKgjSd4p1ys2Kam+H1y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703807; c=relaxed/simple;
	bh=29KE3BgXJPnpq+50sxyhmNz0cqj8JGOX06lnfmvDIdw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dXlpgaYk4yw78IlHBkUJYh3/YeoXiPTniGXdCtBiGyuPatx/NRf6XOsYwHoh56L4o0P5SgiuA/9PXO6eP/QRqnD5C2ZGfVvDu2O8aAhEZOQlXHiyqMb9OBTibDe2O+NfrlRLetlyz1uJ6UFNFFHWQcGg/U43d1eNimQr/WWNvls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWUpRwtc; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWUpRwtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791703804; x=1823239804;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=29KE3BgXJPnpq+50sxyhmNz0cqj8JGOX06lnfmvDIdw=;
  b=KWUpRwtc0WI6Kv9cSH6GAwsFx/Ok9QcJMMcc240Md5IXTIhNW0duVvhk
   /r8KS93QrjLIivkT6Zgzhfb9ZNCBkcmlGV9AK28XFfOMslJPs28jiZiqF
   3uHkI1Xvib8a3EXTe+lwIwzl9pjhjXM4VWRjuMgwCQpqHBtkeNw8fceXk
   +NERyDuwsHb03URQ8yoxQQ0h7MGFOoM23jNh23JN/1Jdc5SMhRUZCkLbY
   A04z5eqL9evx+tBlpVeSWTbf3bOVjsR4wP6TBPShzfaKnKFB9aT7e9XJZ
   1fnPQoaWg2kAocR6kcdyr/7T8Pt0TTATZ+f7THczvHGl6UdKK33sEyT8C
   w==;
X-CSE-ConnectionGUID: B0DhO7iaSX+MXr+oYvInUw==
X-CSE-MsgGUID: kNiHr97GRyWLvrBwxm8RMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="551211"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="551211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 00:29:34 -0700
X-CSE-ConnectionGUID: hZtWDVffSgKleVQBov/w7Q==
X-CSE-MsgGUID: IrOsR3kxTDO6JYwvqdTKXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="742477"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 00:29:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 00:29:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 00:29:33 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 00:29:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSWNlJLBktmDB8ct7X5SE1ojA5PEwu406VyK9Ds3FVglCm79ESWsqdnnh/Sn/+IxdGIa5kZ2jt4o38e/ck5vmaHS3bsDl5GuwFt00e22JVV9DVVXrZ16/pzeZQFLW9d7QBEANhb8aj9/civIJhAZ+rhz8FQk4annn1beyLx2i7WRfdAI4qrUQKo+XD/6aV55gvQexlaHZRhNH0r3vvkhVHvdGXLSK4Phl4SMl8PClUy5ivrJAVKXxE4CV+a9MGSq3/dwPQOtsVOdoIh9d+sEV+Rt2qlpXw03sUtQGuEU2aZ+A5xNT6NnH3yhv3XczsZ80Sb45tJgKvawt3hTjSWYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4X183UO3RQFvykYMTtCvAkdjbCWqLD9SslIxZh5fWA=;
 b=cZK7MwuCDn34sep9HpRi9XVAPRSxca5E03yG2ysdiAhAm62VE4yhlmzOKOKPUy9fdZyI7nzb4ZM9ZfnAillCLKgM4IA/iy8Peml1lWlR+97Va7jZU1Ovqu6bibpAieGw/8JCTkDy8ygsTSUEWQZ2wu0HCvvxnkhTIX9RtzJrk/0olM//Xkv1YSpt2mJD55rMirdoMhvygqktwUJF6BAixI+TykvhcF/0VyC0eiaAWCLgK8CihOKKzjLXwqKwJpuOCJ7sWuHdEMHmlO7X6HPsNP8YvlnVf8DQnHFsP3aMAu7xEdTnBS/QzgjlPtZeFz98UqLcKqYWPQrdiD4DhqAcaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by IA3PR11MB9255.namprd11.prod.outlook.com (2603:10b6:208:578::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 07:29:26 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 07:29:25 +0000
Date: Sun, 11 Oct 2026 15:29:17 +0800
From: Philip Li <philip.li@intel.com>
To: Linus Walleij <linusw@kernel.org>
CC: kernel test robot <lkp@intel.com>, <linux-gpio@vger.kernel.org>
Subject: Re: [linusw-pinctrl:devel] BUILD REGRESSION
 2430546e8d00b1a00fa85f71b666777bc9e3db27
Message-ID: <ass6zYCoCznCaNVG@rli9-mobl>
References: <202610092056.6NsErH0t-lkp@intel.com>
 <CAD++jLmQAnxhqkzfaC2st3ZF71Bodgg27HhEgGBENi-+kZhs8Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmQAnxhqkzfaC2st3ZF71Bodgg27HhEgGBENi-+kZhs8Q@mail.gmail.com>
X-ClientProxiedBy: KUZPR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:d10:33::14) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|IA3PR11MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa96561-85aa-456a-8929-08df2769606f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|261009223027099003|261009221227099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: wW1CB03kYpX6UcM+42WNvObs0rBYmPt8i2CAbzfkixVRkGw3mns9HXUcygMsQTJvz+md8jgv433X0I6JfdeZQ1Xp9s+CERGH+I9LsoJozisGC/lNI0JH4x8o3ISx74hNpi0SvJQy8Xkph/foMuB0+pDzaBheBDBls2zXt/0hlyFMFkDk2M7cRVTR1wCY0655zwpV3m83lIKCh0BNnl3bikyZqklg+0gEKYlAx1i++8ts67MobrN49qS/TNWD31JszjWErIU2T8MyknyV0l6oROnh63qFksJmn+/rZw/PL1qewQbxb4hZsFSf5iUWOEeRf8MgdZX6x5kyP8EuVOmzrC40VDtUxhpGfq33BbgkTI8ltBQ6CxNIWJsq5m2rpRFCGf+zD7rp+xG5RtHuNCyDCFB3tIyI8aNR0nFTsFfDacgdm4pyyD4XQXGXiYsCqmhMRedto1d0JZcGmHWpK9xGKvujhFfNvo5Atqrfn4zbsiStR14fbdCEHaaigpunUJ08XVVjiqBP3MrlnK4P0NQXFt+5ggkmquOOeo4tKL4om9F9GUrzoV7m3ckHLnvOyYI37Ea0dbRE/Sills8OGBVFzoJNQvpdrip8xG+mdebFuGnJJenr7o210R5OUO7WwmX8Wrt8k850AkDb5ODCs+CaPot4Nefm3B2iYDJIeAs7R2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(261009223027099003)(261009221227099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clRGcEhGWUJuLzNCdzV2aVd2R2trN0N2VzJPR2I1RlcxaGNmcFFIWHRTcFRw?=
 =?utf-8?B?SlR6WmFuWlMvcnU0bUpXQTFGYW1rTlRaNGJ1V3hSWkFoWUhiTTZZblNRcnNo?=
 =?utf-8?B?dEZiaW5NaEN0bmdnbzUyaHNwU09uSEI5dXdtWmd1Q1VvS0wyamJJWTRQVzdr?=
 =?utf-8?B?ZExlRks1dU1nZzNJcUpPcUxlcmdqTWI4aDZ1NEt2eE0zZkdEVjdNd0VlTEZu?=
 =?utf-8?B?WGZVYXhTNDRPcWUyNldpRHowc2lEcEFpdW01N2pIcHdrSG1LMmdjbFlxd2dy?=
 =?utf-8?B?bG5Oazd2Q0dLdEx4KzRmUGFPdEhxWlZnaUt3cW01TVhveHB3Vk9EMkd3WGQw?=
 =?utf-8?B?eWUwUzdjd2wwelZwdDNrc1hNVDQxbDlaYjkyUXNhSkZacnl3cldYWkZSWGxo?=
 =?utf-8?B?QW50bkVLbjE5NjFtZUN6bUQ5eGU5Z2FMeXFNNjU4RnR3Rkl6UmY3NUlNZDln?=
 =?utf-8?B?cjNmYW80VVc3VFFCMlY2Z3N5SXl1VWdCUDJ1R1J1ZGZyNzJBWE9Dc3hMRGZx?=
 =?utf-8?B?d3B1UVUyTU1WNkdkRzdzeENQaWZwRTQxalBMR2R6aGtYQWRjWGhQbmlpcVdE?=
 =?utf-8?B?QTU2K2ZkZS9HbW9PUm51K1pzUlV6UGNmbnd5aE4xMDJnOUQ2eWhzWGVpM1VT?=
 =?utf-8?B?UTFISW1KWEFiVDEvQW5ST1pCZ1ZrL3dIWFlzdlhNUVlkSVV5bXpPR3BweUVU?=
 =?utf-8?B?aHVpeUlxMkZiL255NDB5YWJFY3FDQ05PUWxMWTcvRE5qS1B3eGwxcmlCaWZv?=
 =?utf-8?B?c0k3TDErSXBIckpjeUVaTUNkSGNuL3RyT2tpYS96KzdCZ2g3R1JBL3IvSmN0?=
 =?utf-8?B?WlM2TWpOWW56cnRYVWZzbkFkTUFCQWNESVVqZHBzOTFQUVZUdEdYTnNSNkRI?=
 =?utf-8?B?VnE0WUFDT05vRURFYmdEeUdqQmsrQVRuWEdCd0tKTUt1VXkweGJJckVCSFBZ?=
 =?utf-8?B?RVBhTlE4R2E5MDlUeVdGOWRCOW03UXV1WkNEU1FqVTVIbHQ4S0dWTUlxVTJF?=
 =?utf-8?B?MWVRbmVITDZaNndRVnM2TDgvaHdZZ1h5bkkwSXF1Y2JEVER3YUF2RWVXTk55?=
 =?utf-8?B?a2FyWTFieERycThJRUtNTDZGRE9JbFlEV1RJcjlQcStXWk1vZzFMeUhPbVVE?=
 =?utf-8?B?YWRkK0FkZUppVkpGc0FJSXBVYUVxWDJYaFdUdUZkRTRZMis2WVcxbHYxODN3?=
 =?utf-8?B?RFBiODRScUhscmtmNHNEMHl5WkZKMHRKbjV6RTZIOW5IUUxZZHN5NXhVVVA5?=
 =?utf-8?B?ck56ZEx4WENldklmZkY2NmdwaEkxZlFaNUhqMnJUa3dLTUhBZ3VJVDgzbTlJ?=
 =?utf-8?B?RER3N2JmNWtkNWZUdHBhWktUc0JrYlhhL3FhS3ZZWVozSE42VVZzVmpOZ0Vo?=
 =?utf-8?B?UnV3MFBzNyt4NHdialdwYndmT2FQaTFsTEkrR1NTUDZSQTZjd0c0RDhsNFoy?=
 =?utf-8?B?WWhBQ2x1ek1XUyt3Q1FpNXJ1UXlDNVhJaEJtekV0RmkvTDZNRkVqQkRreTVL?=
 =?utf-8?B?a1pIU1RmSUZRU2hVanNXQzArcGVxZVNBcEZMbHBBRWFxYVJDQ3pqQ2JQOEJ1?=
 =?utf-8?B?OXdHajVzaUhzVTNSM0tXWmh4SkR1bTgrT2xQRGw0dS9LbDM0RXpGamVtUHUx?=
 =?utf-8?B?NE0ycjQ5akpnQ3RTY1ExZFlkUFdMS01ZMzBqOWprQW9ZN1F6c0hDNnB1YmU1?=
 =?utf-8?B?ajhxcndtazg3ajBmbUdwVnAxMVhoQUtMTmc4Y3lBVTBvZ0NLd3JxU25udGlZ?=
 =?utf-8?B?SmRYdlhLUkRDNmJRdHVKUVM4RE91MDdKcHNDMzFCdmJOaWNwT01Mdm1Mb3pX?=
 =?utf-8?B?ZEI4TmNFMXJFTm85WFhnWXpuSDQvRHRqUmtHY1B3eXJoZWNMTXd3aWtJSUl5?=
 =?utf-8?B?YkhIR2VYelVmekd4eUJOUklram9DWVU3NkczenFZeVBiWWlxOXdEM1JyUDls?=
 =?utf-8?B?NzZDMlQ0QW9DaHROSHpuMVhXeXJwNGdJZ080amxINXJkRVQ2WFAvOUtVUmdC?=
 =?utf-8?B?REtyUmUxcHJvWkM0bE1JVVQyem1HOEExZHpFZkMyaE05R2htdTlaZTVNdGMz?=
 =?utf-8?B?TDA4M1Iya2dobnIwNzdtS2Jld2VBSkFpV2Q3R1hnYndML1N2T3h4aGNrdXpX?=
 =?utf-8?B?NkZtbUpMRjBKalhyN3FSc1RWWlhKQmxqU29Gc2xuOUdxVmNIZTY3OGkvNUhO?=
 =?utf-8?B?VkRvdUNQb3dHd3QzaUNSeUxiUDRDb2FPWHQyUk9vOTRiT0ptdTlZRzh6MVEv?=
 =?utf-8?B?dDhvZWJvaVI2MVYyMWprNTk4YUVNOVg5MFM0cC9ITmRxZ3FieXVONjFwczNL?=
 =?utf-8?B?MXZwNVFiTlBZbWJHdVlvUTQyem5xSFRqVXpOVExhMTVyZkpRYmVLUT09?=
X-Exchange-RoutingPolicyChecked: Q8VTYD5rtl7NeH1tl5S01k9tKmuteBZUJgnpzyuhJpSRT2dzWQXDAUBg+/gMn4/eiRRQhgUE29kf2n/zvsQsKd1UVoEIo/eepgJdiV2JneMURlhsyMHk4xnlq2/dvoK6ki9JiuER3Z5Suy53Qvx141dTriHysMlfEg823YZHidlkszYPlrMNPJo5JOqnGNmDN9W2uzucZc3O+OOQSYhsx/AKO2W47s/6iRPAXX/ImpIMDuwyDcxum3gEuvy+qie463GDV8bIllda+ocVRi5PrY6FY2Q/sk+lOWOYBe13vzf+UW4oMWJeT1q3Qe35sKcuLGIgv+b0HZi54mR+ammpqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa96561-85aa-456a-8929-08df2769606f
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 07:29:25.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LZyCGCdJziKM7UphLtrTdw+wHkZUxX/Hb9nSkwCUCe3YJKyIdarLii4QkjY5lZs53jzLeDK7KIxTYSkwP419w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9255
X-OriginatorOrg: intel.com

On Fri, Oct 09, 2026 at 11:18:22PM +0200, Linus Walleij wrote:
> On Fri, Oct 9, 2026 at 2:49 PM kernel test robot <lkp@intel.com> wrote:
> 
> > Unverified Error/Warning (likely false positive, kindly check if interested):
> >
> >     drivers/pinctrl/sunplus/sppctl.c:980:1: internal compiler error: in final_scan_insn_1, at final.cc:2823
> >
> > Error/Warning ids grouped by kconfigs:
> >
> > recent_errors
> > `-- csky-allmodconfig
> >     `-- drivers-pinctrl-sunplus-sppctl.c:internal-compiler-error:in-final_scan_insn_1-at-final.cc
> 
> "Likely" a false positive is an understatement, it literally says
> "internal compiler error"...

Sorry for the wrong information, I will correct it to avoid including this
"internal compiler error" in the build status report.

Thanks

> 
> Yours,
> Linus Walleij
> 
