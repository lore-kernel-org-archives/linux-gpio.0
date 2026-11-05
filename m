Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793868294;
	b=AhQFlOVJKGWcPKBNt32DlvnIdMVR/3YemAWHj1+GI18YYUtrf+ekmypzybvfRM8wFfKE
	 8lB9BNQ//jvsj3WjUw3V8k0P5wBz62DgX+Ivl2rExBIhQ6DE0s3srNFFnryw/8bLNMgTC
	 rJi1YKR3r7mU1CKT4hlDbDFAvSDiUCEZFatAk/5dE/JY+sCvkzAEiNNY9I2HdlcKllwpo
	 DZnCayF7GLRhYQK13kSc+1gGnK1shNFlh60hOeQFlfd3Szjb9Z613s2Z057xniwGUJp4w
	 TuDG8kp/B7IKabBAq25yBNoFJLUQZm9l31bGnkwkJi7qB3Q0YOWDfFIBNGzdma/NjmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868294;
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
	bh=cfvcs4rh7WxqBcBzee9FSliojVoItbNB+6Z2MSHDld4=;
	b=MBcGiTCcDv1I2uIYxQvJMwssBDkuIkgxD5veJ59tFLRKUwK02jdobCzpnmqn/LXmYICS
	 VvMEYEf37NVC5L/lMF+qme7sE3+8wWeJMDoPpxWIiw5EkjIrQ7kc0oPDssvhUexGluN77
	 SWhJU93GpmttWq/92BtG3wAhfjCqf8AxVPVAp+SutkX6sMPoZjxHJZdL0oc2IBe+KvTJR
	 t7h9SwKte7xxL/bBw+/AsTrqkCT5Ybz1uniKnekYhQlSE0DFfY0cGnoESGc7wkeTvMIxL
	 Tqaz9G+mUSoMPevpi/dBJ2gjrRnmfEX2Q9AktC0ZDiEZ0azadVV8aC4lWADyJDB+xKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3pC5YuF;
	arc=fail smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0976606A31B;
	Thu,  5 Nov 2026 08:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0976606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3pC5YuF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793868293; x=1825404293;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=re4FgwnMzule5SKYF5boXjbX2G1b0ZtvWHRwnJrvmP4=;
  b=a3pC5YuFqrddPcAWZNb7mncNFw7zNzm0MgFrpEMIOf3oXHJgyD5sJvmY
   55SmFTyl88E5rI5iDujma2vjJ9Ulw31YRzgandnAulNuwN1PG/sMALXiC
   FdyDn/1/wIVZIQxpTc2lagz0VZQA8U0ddLFBfoYlDcIVUXqdRrTkHfjWR
   Gi/uasIMWARIlAtPxbtNDFTk/orM83w7iuCvXOvvj0jmPw6OzuVABaRui
   61Oq8Q7XUi2MbR1BYg8SkYoP/imaUdFUGwMk1mq8U4l20o/nmf05sxrvh
   lfIaIYE6TNioAh/JDIomREbW1DdhX/X+GykwLdVBq38iBIOeDVb61SziD
   Q==;
X-CSE-ConnectionGUID: FofrqRjyQZSlsvQliavaSA==
X-CSE-MsgGUID: CzkfPSAZTK20c1eBxXXivw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2550043"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2550043"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:44:52 -0800
X-CSE-ConnectionGUID: 8fxvxBvgQ1Om68RHhli/QA==
X-CSE-MsgGUID: P736ZmE8RXWQC/BzeCAFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8810380"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:44:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 00:44:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 00:44:51 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 00:44:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VitP8aKaKEWix6n5qqJZDdlgRncP5Q4aWw+oVYPxubeevVSkCBsD2TMNkLYvAleBWd1iqMlLeMeneiHfydxydGRFS3Nas9Ct39HtRWk0iYz5UqeUP2zy2uitaVknf6uFxBeXLRf8MR6H15KZ5bRpdLx5OGRZkD8mMIZf5kMLg1/nICJf9ElwRE6H+Sx4emiAz408pp7qNcesnDiB5c02xkf1hz/ZGYN0OacOCxNXG0Yq9Ia2yXZm5N3q92Z72wQ9CNYVoVPdSsFpwv7Y2S+Hhdakcw9s8qJT4aCKcIqVU2OPxSqYp7JP3QVkV0DdAzg5Qafx1CyYgJ8zicMyqEEJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfvcs4rh7WxqBcBzee9FSliojVoItbNB+6Z2MSHDld4=;
 b=JKlpnOxV0iBBo4EDzc7lYtSIdO5FuhOC+FMFcCfyRhtHX0Ci6sQJI6i3RhnWwAO9r4quk+Xso53tLzbdhzAfN5ZhJuXduTddpP+TS9siBCHWhWa2rOS7XvoGlEtpvtCtK57WMLBOEgc2m/zuiU/tHK+pcv/hIMg/pws9JdjvvOrqOpJOfa3ppgj4ekjh62S3mA/E1Wi/igs2BKzsrEgo4RdOOEk9HkSFqwy7+eC/SLfU5alC9CQU2p7I424ljH2ztgNoVIi72SI8A2AEJQq5oXnJ+/nFUJELLQ5rqVX/beLWhkgC/4WQEVeu9TwXUBSDDG9QZNsMTavCy/Vf/KigMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by LVUPR11MB9810.namprd11.prod.outlook.com (2603:10b6:408:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 08:44:43 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 08:44:43 +0000
Message-ID: <b481c85b-9de2-47fc-9f71-b2e18ffe788f@intel.com>
Date: Thu, 5 Nov 2026 09:44:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: pcm3168a: do not request the reset GPIO
 as non-exclusive
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu
	<kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20261105-pcm3168a-non-exclusive-gpios-v2-1-982577248ed6@oss.qualcomm.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261105-pcm3168a-non-exclusive-gpios-v2-1-982577248ed6@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000524.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::66e) To PH0PR11MB4952.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|LVUPR11MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 0267824a-045a-4388-8874-08df3b190994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|10067099003|18002099003|56012099006|261009223027099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info: mvXBqwyJ7ZXr09ZR/T0kBpripK5ii6lJg80psdO5gEyYRGDTX2rxsnNFfBbv5VMeADyiMZBQHijBRLPe7rr/2xpqzzY0z3oaPhnYERZqa6ASLcF0Dt+umGBcwWTy+4Jwln0bcdujiVSt0eN6gXyQIUF9I9CFl0HPGCS2q2+e57zdd4rxENsltmFqSvHL23taeF/neT4lODRUzcmWHPMo9O8XOsmu/7+kYKLJRPOqMQDVUneV2wAzav/qqSqTNubaaazx5YspGbIM4jMCUGUqUJAqLTMgNeESSyqII3q/LVq3yZVu3Gm1TdT0Jr1PYHbbf+fspQdeUT1m+xhW/ea4oyfCutsYGZqV5U2BQNYV3dtWKTO9v2mOExQ/r4sjVVqdzTGf9jnftkF9WMuWcC8fJY89er3Y7inl43MORzpIGzafeQGftx6ijBdilRe+/EtTfIej/taIjTknWudSbs0MjYQQTZIjF082VorISYVUpS2u35g9qj2nBBWtb7l55AL61TVlKOgdVwZXoFdlz5oJ2I9DwqKuQj3IyCyMtGG7TiNi/YmHHXAgaMAFOsuQqCPD3hzbfFzAEbWymxOqh+9MKAsvRq4qRrEFCISNu7WdfPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(10067099003)(18002099003)(56012099006)(261009223027099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVh6WXA0d2tiU3FVU0FOaUdrN2lDcVZXSnVsTXZhQms3ZmJTZG5xdThEK0h0?=
 =?utf-8?B?aEd2bTFDci9TY1hYcForNGtMMEdiZ0ZCMHA1VWRJSXZzWHJqdkFvaHlhVHpt?=
 =?utf-8?B?aVhSL3FOQmVTU29PbW5sY0x5Q1c5U0hpcGZwK2h1cHdCbGZockVwR3JZQWNi?=
 =?utf-8?B?N0tGL1lsVWJJWnJjL0RKNkdqZjQ0Qm41eTZLVy9Ha2VHcU9KMkwwbVF5VUZN?=
 =?utf-8?B?Q1lEeVVnZXBaNjFmeVBEb3QxU2ZuTENURnNITHF5RzZsVk4vQUU0QnVoRENk?=
 =?utf-8?B?dDFOVmFjcEp1TzZ1cHIvTlVNbUp0a2JONlFxczRmT3llcDdDYVVjRThyei9T?=
 =?utf-8?B?MHdkZWdaVUNJMjA4Qmo0Y2xFcXZmTmt0TEZSMk5SQk9ZbFRDaENvUlBlbURE?=
 =?utf-8?B?Qzc1WVZVQzZSOTE1bDNMSk85T3ZMS1kvMjNXd3NDN21OdnRDTWFISzlVS3Rt?=
 =?utf-8?B?cUYxNG9JekRZdEZEU2c3Y09Zdkp2a2ZoZDFkSHN4VGhCTnYwd1BEbjFKemFR?=
 =?utf-8?B?VFMrL09XcWk4RURtb09Ld21SQzQ3Mi9GVjNhVUR0QmtTa2I0UWdrSUJjUUt1?=
 =?utf-8?B?VDB6OHp1UVYxNEx6UEZIWkNrSkFrOGN5dFRnYXBXOEczcm9nOWdKVUVTbzhZ?=
 =?utf-8?B?b0lFK3FEZVNNK3VzUzA0ZkRnTmNtSExGTy9kb3JNYkJjaVQ4dGt5M01TVktp?=
 =?utf-8?B?Y25LQVkvVWR5SjhJWWhteGs5R1dURWd2TzEyQ3hVOWZqOER1QTJyK3dzNEox?=
 =?utf-8?B?L3Y1N05KUlpTVW1TY1cycEJITEFSS05ZRVNQLzBNdWUvdENOZVBrM2FQMmR6?=
 =?utf-8?B?S2pyYlk0dys5WEJISmRZMkxjcXFlSHV6UjhzNy9mM3dYenI0ZXlGQ04rQk96?=
 =?utf-8?B?RkZVcU5hMDd4QjJreGh0MGttcngzZHdMVmtIRlB1NzBGMFBEOUZDS1d6TGdB?=
 =?utf-8?B?akEyY00xMjdTY2FBSFZYVmUxMTFFNFVBTnlKZVh2Ukt6bnUwTnV6VktKcVQ1?=
 =?utf-8?B?bWIzMHlrdHRjOXFxRWdCcjNWK1BNNnhtUklMY0lxdjdtOHFGell1b2N1WTAx?=
 =?utf-8?B?dFcwbHJseHc3YTYxSGUyWWhXMlhSMjhsMDJnTEhTUGdGNGVMZm51MWY4Nndj?=
 =?utf-8?B?QlVnQjJwZ1d1WHVzbWRZMnBrL2lCb1BxT29LQXdPcE1DKzZxQUJFWFFwQUxW?=
 =?utf-8?B?VHo3ZXNQaTBQcHcxdlM3QWtZdG9nT2NUcmpCako1VHczSXovZzRZZ0ZXR2lr?=
 =?utf-8?B?NTVtTEtuakt5WS8wTnBGbDdaOG9mRVR3VE0ySy9FS0lTRVFBek9jb0ZrUFNG?=
 =?utf-8?B?MUN0RENGenExWmp2ZE5DZWwyOWVJOVBOR1VUZ0NrbjRCeHAwb3NmZXVvQjFt?=
 =?utf-8?B?RnJlZTRLSUJoaUR3eFB4R3BnM1YrRTFzaVRMcDJ3L3ZraVduQ00wZGtYYnhl?=
 =?utf-8?B?T0ZualF6TkprOHdDSjMyT2R3Z04yQUhscVBtWVhpRlhUNVRDTXp6dE00NkYw?=
 =?utf-8?B?OEFIaUF2dzdza3orT21GSjl1b2ZQNmJDQUdlMjd3QmJyVjRMWFdhZUZxZHgz?=
 =?utf-8?B?dGNQb0h1YVNCY0hsYjNGNFlMbHUwUjFCdHJQTUtaS2hNaTVoNFJUT24vbXRN?=
 =?utf-8?B?UnlPK3lwK29MQXBKaDNqVmdXUDF5a1BkUDRwVS92THBhaFg5T3U3NXZ6NjZ3?=
 =?utf-8?B?ODhlak1vRW96ZEJLaWlLV0pvZm85S3Jjd0I1bE5WRUVJNWk0SkRCUlh0QXFG?=
 =?utf-8?B?dHNReU9kaHBJM3RSVUhMajdaSTh1TnU5TzQvMk1HR3FscGlqSFBjUTg3TWc5?=
 =?utf-8?B?YlVCVnBNOERTdXAybXE4NlJCUkFhblRHa0k4NXFCNVduZWNVdDEvcXhOcld3?=
 =?utf-8?B?QUlvL0YzZU1ueEQvdVlxR2NOcGIyUFlNa0pEUHlrZEZrSStlRjNzZDNITUZY?=
 =?utf-8?B?RDVseE8zWGN4SWJRRzFWa2h1c1lrb1poN0laaGcxSHpra1RUZVlVcHJaZlFE?=
 =?utf-8?B?bDZlUWMrTS96NjFObFJleGhScVZkb0Nrb0U3MWVGbHBiY0xIZkRKcGRpWmk2?=
 =?utf-8?B?NUF0UE5xQVR0ZFVjTFVreW9odzVkY05RUG9FNTNBME91eEFXZW4xTWhmV0ht?=
 =?utf-8?B?YmhtYXBpYkROLzhIMTU2UmNHNWNHTXpjVEhBYUhLQlhCTVoyRGZYdXVOS2NR?=
 =?utf-8?B?U3pKc3dXUzkyL1Jta2ZpRHptOTRSVWhJbVFKWkNNOWNxd3c4M1BXMm41SUpx?=
 =?utf-8?B?T1BMMlJRdTZvTlJaUVdVTWFZaXJkVUFMbUwyRFpkY2dkTWJVUzkvRFFyVDZr?=
 =?utf-8?B?TkdXa0RCMnpTWGQ0UTlKNEJlNEJpdEdCcXlCbmhGTmt2T2hrVHlDQT09?=
X-Exchange-RoutingPolicyChecked: zvTjOvHw7BdZ6TqKoMd6NVoVW8q9CeZooOMNsu+VVWyr9b6xqhXDdA0Nz+kK3MbpxvC3rfYjPx7abIh1kFUw79N918BVrD/CRRdaPOCoO2HMP+7uE2lxOef0hqG7monK5ZWyuudVxZ1yRZ1+9vXlLRmojPBVhhTpmbo5ZdZyr8c1gJnlLbID+lBEDThHff4ED7lgNI8iaU4UCQ6NZZk71S94ZW3Iy/LySZEJRGH28SwwY5k/5H36CnO70ZoCzseDmzvd7D+DLw3jzaqh1bOX6NJcp4zlLrX3eba/9MgWhtXOTx7icSFlp/uJ0qcHBHMa6qIhxaWnWC2P9LOZ66uXkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0267824a-045a-4388-8874-08df3b190994
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:44:43.2067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpr87IvFUzEAkpiqwJ4UaZ/TMTkhUsmiUP3bMydegBCiD0Us7ViLA909tzZeNYVX+YuOFWXnzf5lfFdElJNQDTaco1pUub2NBcsu5GeTjm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9810
X-OriginatorOrg: intel.com

On 11/5/2026 9:42 AM, Bartosz Golaszewski wrote:
> The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
> rely on the GPIO shared proxy. All users of this codec driver are either
> ARM64 - this architecture now enables shared GPIOs automatically for
> everyone - or x86 and don't share pins.
> 
> The driver no longer has to care about the sharing so drop the flag.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Tweak commit subject
> - Extend commit message to cover the non-arm64 case too
> - Link to v1: https://patch.msgid.link/20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com
Thank you for the update, Bartosz. LGTM

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
