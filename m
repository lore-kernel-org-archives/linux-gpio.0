Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793790582;
	b=wHXtVZzV0pgr7uY4c0j6AZNv+NApMslxLjAFVj/8fJT0YMjZGoR1ghJwkDHRBfL1wYz4
	 LQBvtTzfNAKVs83MAFE/N4cQ7DmcjibFG2V4WifQA0t+PNVX8Wpmjml3acI/JiYvquepI
	 W2YY+74LUIZa6KqP4Nngjfx6zbX0cLpdOfQKv4D+Ylcs8ZeOIs6AKKa3fnxVBFi70roqn
	 5sev+U+DLrUkjbK9CaWpNKpSJh1NTSe4nzImzWP9yhTQTMFFqTYFX9vjzdrZlxhMmFWlX
	 xS3zQAJaZOJEGfzsfcxKOb2Ssihrp/DFTpylDyO2pT73F55boSa40dgPRDoCyeFQvmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790582;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=+yJXkO0jjkqExRBE/uyKj6kZAU8NqTpsTbp9/eBj9As=;
	b=VC2EGWDP+DFl0ZlaLFxVll6dzeNgkYU364fAXARf0zkOltBBwLJ57Eh1mHK/ngs8ySZl
	 /S8TVwuV0wDQrqDlmfx/clDo7luapPP/bwrV9Yelqnm6H6/4giwNOovM/Q3NrK6jalNqw
	 s5obX2xtxY53QEkTKh4/wgIAXLuxr79L2cLGaDf633gx/y1U5wgkwQDcqYFb6iKvJcrRz
	 UAqtSZSgWBv4IC7WBUKJYk6ooATLyXGmHLiyZbi1WCwAJTkHYvA9JLcJ+PmNUK9NbcyKB
	 VrNUHtcS4UwCpNDFYKL/XE0wae5NKTk1ByOWrhV9Fx1g3b4q+horUq7hGcT32EZrqUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OmNuuj2l;
	arc=fail smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E366606A326;
	Wed,  4 Nov 2026 11:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E366606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OmNuuj2l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793790582; x=1825326582;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+yJXkO0jjkqExRBE/uyKj6kZAU8NqTpsTbp9/eBj9As=;
  b=OmNuuj2lfEFo7eG0+12pKxN7YwbgVN3xOslhqn3VkliJr/bUp1H5Q4ts
   Ypi9VNVhiNcR2igWIxA7MzCgfx9pc5LAGh04UiDSOXAhxYv8aeORylYKS
   u0ih/YDVD4Uq0YAyE/P0RlsFxdop+b8uODqnA2NIvY6MsMbOkHKYyUlwH
   4peKD3FiYSwq5yAUX37z/XP7EKivzg4Q/U4iHdzWV9bZAvvcvs/SCsaUl
   8+uieGzJlsPEtuOi3lhE4ormC107PNHY2kSfQaCEqWbZU7S69Glg3VvUL
   r3dqq0jzFUrldQc8fyc+m79Qe4ZJ0F6tKyumERh+vSQ/ssE8NLQazD1Tb
   g==;
X-CSE-ConnectionGUID: jLzk/U/CRgWjHF8OYHMOmg==
X-CSE-MsgGUID: ypVClxWzTQaajM+XzlxboA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2553382"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2553382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 03:09:41 -0800
X-CSE-ConnectionGUID: qY+NApv8Sz2O0+jJW7IrnA==
X-CSE-MsgGUID: 3qB7LDrvSy+abYlFY7XKfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6545996"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 03:09:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 03:09:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 03:09:40 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 03:09:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSfAahx3ktjBKiSaw+ffqs00M6JhVygD4cSlzJnH/XRumuUO64PpZguLN54x6kyi6cwLp/9gVhOg6oF67Ao0vTtwY8ikIxMcV6+Dw3Qg1JYzXrGR/7d9Hv2hJ2CFkdQnDg98f6BAZzBR7MEBYbzCtwW4XkG+JcVSOptVLNu1dBp0sgq19pbr8xKfPbqJLOoRjJbONYOfw63o5/Jh/DfxYoKOqtzHZyNGqak2+7udoaEVrc4YAo+OfhaHJtZc25zGr6HlYJzl0ssNChjmD+e182KSzsLz+w480+NhPeU9OSEM9PnmcCh65qNk7834LUPAq8nwDEkd+8ki7cwqQbfMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yJXkO0jjkqExRBE/uyKj6kZAU8NqTpsTbp9/eBj9As=;
 b=xEhKpSA7QVyJQa2Nib/MPw8afwiaM0bfxlFSHq50qxQhICTE/NE1mlpRLKZJ+tg1sxCyYXd9NgPQHUki6IAZYXV6O/1lU4z3rwKCs17zEaSpaTndDyB1oWmS3zTOQNOZGFNdLiOpOEWHUC9bzM1Ciz8hGGuuyRA+tB+Mkn8vpeNYJzwC30faJuKjVVP6KJna8UAfCpTAQZM2y8r+nu9Yn2A29QaWDz3bIsBFrG1/1Cb3giECOI0XjQq2HacFRQ629Ae9SznrXlnfLJZotqW4ePex2SQMadXlZoTTZDfh0qrJCPUdWOcs3SHC8F863Ss4zX8Scq6Xjdtp3SLhVm+9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:09:38 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:09:38 +0000
Message-ID: <9c22be49-edc3-41f4-ae72-4749a6b10d0f@intel.com>
Date: Wed, 4 Nov 2026 12:09:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: pcm3168a: don't request the reset GPIO as
 non-exclusive
To: Bartosz Golaszewski <brgl@kernel.org>, Mark Brown <broonie@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
References: <20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com>
 <179375063580.2186205.641519776071903771.b4-review@b4>
 <laiektucfxhzdf7ifiypwy6plkifriuovtarzz3qrwyd2yk7ks@3cskrh7fkwbf>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <laiektucfxhzdf7ifiypwy6plkifriuovtarzz3qrwyd2yk7ks@3cskrh7fkwbf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0117.eurprd09.prod.outlook.com
 (2603:10a6:803:78::40) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 237d793c-43fc-4ff8-7dfc-08df3a641e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|4143699003|56012099006|11063799006|261009223027099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: om/nf/2q0KHBbLnTB1r68GgVb7EX92ou2m3Az46Su4c24rNGnV6ErbjXIDNUFzy/6fode/TLOgaR9KZDVBHreME867jy0aJEYVsSlhz/o4pVKSfUuHgfbOAJiXVtoaLfZjgwP1OxDB/hrcnzqhx9pCeNx4ZuS7bqFHSBB4gP+87DdZh7IdtgQ6+SKG7E4nHkcge6aSa8sAGyFyiNIPyJHU2q/mXXdrwN6Vdatu3N6NuoGInvYvJlExtLjPG2PcD7/ZS6zDoONrsO5cBLEsuvo4SPORq7YXbcXAlGkC68JrfgFrRzFM9OMf7OESiLXY7596lupjg3fw4A7VYraxSQY/H4RNoMa9YT0tz8GyX+ksE386s7/ovh5hdBSmIHQNnhNKIs9nYSCnmKn8Eiyp8zEBwdaQDcPxW1TtYoN/DZOuX2+QxPqTpAkM//+1cYCDN9UjimQbLnVV8LbHM/rOUS9p1gbZaMsY44DrjW02W/6vOfvKb3Fz6Hj0xS59xb2qK6l/ZrGj0gZq0HYwCOBrHhiBRWK0RTLc5/E7reV4mtb6dBOGVQSjus3g0eLyCUslDzb95scg+ia8B8/nSWB74DgEJp8PylL6YHkF6JE7mseq0GlAyYcpIypMWWphQxcyr+KX2pl5RrMmKDMdphbwA4yIU4etS+w45yH9yzIg+Va1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(261009223027099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWRJMmMxUGpJVm12QWRFNmJFaW5BTVp5dEs1U3M0VDRpTjYySUhUL0d0dE4x?=
 =?utf-8?B?SFg1Myt1OU1IbEV0NFZTc1pMN2pFSGsvSDRqOEpTSGZBZDF2cHk2UDZVaGox?=
 =?utf-8?B?TjNWbHJwTXY0M0EvSFBRdDdTMUtoMitaNVl4UkdoWW9qWjl6V21Da0NxSnl2?=
 =?utf-8?B?ZlZjTTJTTHZyWk5jUUo1b3QxSWVSYURsVFBpeXVvbzJKRXFFWXhJYW8xK0sr?=
 =?utf-8?B?a0VtbmRXT3FPZUM5YWdmWTNWUkEvcHMxMXF2Yms3cFlWTWZPVnpraEhQMlo4?=
 =?utf-8?B?NXl3ZFE1U3FNamNHTFgzbDNwcEYrQlV5bFhXWFcxTEsvVUV5NXJqVzFmT0kz?=
 =?utf-8?B?U3M1TEYwaWZ3bWoxWE5XTmVtQ29tNEpHWkx2T3RGOTNCUm1UcXg0TklCOFFU?=
 =?utf-8?B?YnF4RkRqQTdsVEVNaEpUb1p2c3A4b2hjZUpnU2o1NUhZZ2VNRlhKUy9wTjU2?=
 =?utf-8?B?aXBEYzBITzh2ZFp0bDh4eDhhVWNEMGJ1ODdQVXpqaUVQS01LbUtXVjZDY2Vl?=
 =?utf-8?B?S0Qxa2QzNGQ3SUQrQ3BtVFdKRnNHZ3o5TVpHbjhwNCtmczlnc21STW56WERQ?=
 =?utf-8?B?RVlRdnlWaGFXMGpDRVRpVjRnNlBBa08yQVlJcVZ0U2pBZXZ6VHUzd3cra2wz?=
 =?utf-8?B?bmQ5M2tZdXdrSDZLcFc4U2JTQitIUHR1NkdCKzRmN2FZOTI5Q0FhZEZRMHY5?=
 =?utf-8?B?cTMxN04xMVJXc0E1UFNRWFNhU0VRTmlUR2g1SFJWOXEzSGdqVWZIQjl1TS9q?=
 =?utf-8?B?VjM5TlNXQ3Y5NDNmcERRdVovZVpMNSttbFh3dG5NNmU0VjEydkMxVVM0Yndy?=
 =?utf-8?B?emxRU0lXVXBxQzIwL29MSnN3UXhzSHZLNGdHc3ZoYlQxYnptdjBTK3hOYjJ4?=
 =?utf-8?B?MTJoNXh4QStPSTV2b0VLcnlGLzFaWUJnWVJ4TXZsOFZjSmRUT0lnL3hrWkww?=
 =?utf-8?B?Sittc2xieWV2S1d0cDM3czJpTWlINXJQYWVQQWNXZ2owdXQ2MmFKbzRzNEly?=
 =?utf-8?B?UWNuK1RkVTRFWkFqOG1WYUdaSk8xbSswbmwwMlR0RHBDbEo1Sm0rMzhJaEJU?=
 =?utf-8?B?UjBpSzhtSlk2ZmJMK0x1dU5EajB5VDZBWG51aUVOZ2hHcGJTdWl3SHd3SFVN?=
 =?utf-8?B?MDhucGRZVG9PUENmVlROL1JkNjQvOUNZU2JnSWVsS3hMN1JBMXJpV0Y3cG1J?=
 =?utf-8?B?d21hTWg5MkVxSkw4d3J2c1ZjdVkyd0JYWURwcWtLZFI4Y05MRTJXT2JESlVt?=
 =?utf-8?B?ZGM3aUZpb2taZ01ZR01iaVlnYVJBbzhBekxlVTVDL0FZbEg0MEhEQ21haVRw?=
 =?utf-8?B?NW9lSHltV0tseVowUk1zSDVoZDRweE51WjdZcnMrbUg5c3d6OEhjWEhuL2Vj?=
 =?utf-8?B?T1V3dkRCRWhDZzNmQkVmSzh4dTdqdlBnUHpHdm5qMFJyT0lQK29QOGJEQlF3?=
 =?utf-8?B?bkkzMmx2R1JRZ3pEc1JDRVdLT3h0VERxb0lqcWM1TFFzdFdIOVJWQmdqNGhn?=
 =?utf-8?B?ZlN1MW5yYjU1cVo2MHdxNWoxYnpjUzNIR1ZTOUZRTmc1TEhzYnpNRUxyQWN6?=
 =?utf-8?B?SEZkUHR2WE40QVNrc21BY0FOaWFsQ0ZDWUk4TkNVSG8wc05sRjFyclFKdU1G?=
 =?utf-8?B?QlJEQlNWUjRhUnFjMXNJRlVDbk4wUE1OZzdCcEdOb2h1NHNRMERmRFIyRVBE?=
 =?utf-8?B?eERXdmRLQm8yQnBvV0FPT0pzbG50bkhSTkg2YTdZRWxWWkt4YTZSdUhDUEJu?=
 =?utf-8?B?OFdrWWxtL0RKdHVCdnc1azNRYUJWUE1DODhpNzdnMDIrdTgvdDR6WVFPZWlF?=
 =?utf-8?B?eFphOG95VE9vMlExSkFsNjlHamhwRGMxVmdOdGRDQWZYLzcrc3VNb25PVTRE?=
 =?utf-8?B?bFNPYVlUSlpKTmdFSUVUWW1TeVF3bmplRXRYakt3Tk4wTElJOEpZZm9zREJs?=
 =?utf-8?B?NFo4eGNqd1BqYWFML0FiVmdBbXUwK0pFUWZHUG1xUmJJYWpOR04zN1F5T1pG?=
 =?utf-8?B?NUNWQ2toMEtlN0I0MnVwUHRPY1JSVmRkaG5saG1lMzlENXBaVjlGZ3dsVFZn?=
 =?utf-8?B?M0w3cnF5aXMvNjFyNFJrdHlGTmYyS3Q4dTZuSUN1QXhlNEtXOWdjMWJpVmlO?=
 =?utf-8?B?bDhXQ3Z1RXZua3M2ZktYTU90ekNBYTkwb201Z3hkMEFGaTZLaE5VSkZWRkxM?=
 =?utf-8?B?NCtSNWVMMWx1Z1dIaEI4Um5keGdRRXBzVjk0cEx4VU13aXlxdVVIcXg4Nk1o?=
 =?utf-8?B?cVRSWGpaeTZtVGpIN292Szl6RmpSTnZsL09MeW1YWXRBSnlkMUEyb0pVNG1m?=
 =?utf-8?B?K1JjaTRScHVjQ21zOXBkVlRxaWYxZkFMSzVidkkrV2gwV2dKT1dvZlBiS3pG?=
 =?utf-8?Q?ocSFxShUq/bklEqg=3D?=
X-Exchange-RoutingPolicyChecked: L8KrBvnTFVB3H8mklxd6uV8/kZfd3m1Y31cwx6ynGBk7c9pCIcdSieu+o/0WESXqRw/HnV69z2y9dmbQ/bujzJEdgh2Sk4MlcxWctnw+aJ5si0isD8TkewhD5w/znO9fLModkR6RPFdwkAKgulvUqBbNpFLNi3pOr5Ex7zxIskPFaG7LDb5OtdBrH6nPOV0tQwWFcboGlsAcR+QA/bI/hsd+nhKI/1u6Zjm2vv3jEJSpXA47S59Syp/PLurpR7Mrmn3/Fye/8cJ+ZrYGW+S2XmkOGzI4+8eiyzej2Ny48OKVcE6HQLizo+FWY+R9RAXlQJmtAfjTDEwJaY43f6QRQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 237d793c-43fc-4ff8-7dfc-08df3a641e11
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:09:38.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PM1nLzaY/zpLh/CrYdVz37ubXEFgB0BvVi5IT1TOijVa/OsUB9KyVwa8ICk7S7KqJtCIiS3j4zpd3ea7UChbX42Nq1jVjumvdLj5ALEmbu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
X-OriginatorOrg: intel.com

On 11/4/2026 9:06 AM, Bartosz Golaszewski wrote:
> On Wed, Nov 04, 2026 at 12:03:55AM +0000, Mark Brown wrote:
>>> The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
>>> rely on the GPIO shared proxy. All users of this codec driver are ARM64
>>> and this architecture now enables automatically shared GPIOs for
>>> everyone. The driver now longer has to care about the sharing so drop
>>> the flag.
>>
>> sound/soc/intel/avs/boards/pcm3168a.c would beg to differ about this
>> being arm64 only, though that only has one CODEC and shouldn't share the
>> GPIO so it should be fine.
>>

Thank you, Mark, for mentioning this. Indeed, the x86 user (avs-driver)
does not utilize the GPIO but does utilize pcm3168a codec nonetheless.

> Right. Do you want me to resend with commit message amended?
While at it, two nitpicks:

ASoC: pcm3168a: -> ASoC: codecs: pcm3168a:
don't -> do not

(the last one simply makes the greps easier, and is more of a preference
thing).
