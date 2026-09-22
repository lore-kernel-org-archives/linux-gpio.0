Received: from iad-out-005.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-005.esa.us-east-1.outbound.mail-perimeter.amazon.com [3.211.80.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47542931DC;
	Tue, 22 Sep 2026 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=3.211.80.218
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071620; cv=fail; b=L5p3f87NpZhkrDhTp3LqZheyv0eVIcguzQf1WQA6Vk8FB3MIpXCLoeNSL2TGFmMKKUSOr3H4szEQFeqMB32klAz11hl7NjPqRm4G/rFbzwJkkfUw/79WSm+5q9fMd8e1eeO5dGYoh6pjuQzD2+PsjAdQ1McPmwXCVLdngsRjLZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071620; c=relaxed/simple;
	bh=Zkxe8TKIFt52WpED6R01s0NPXgsKzW/CE3ex6f6aFbg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=klnXLyqg7e2D4/5EdNZ+08IWkFKT3Z0bCU2Cx6UxTOZTfF57P/NmGo/MMm5gLhGOz8h9zB42cvVabhBsayeTnnB+uwcSEEiGF89qqE7OBf/tVVx9m+LCoawkSnKgkC4hdY9KtcIOQGlI+ORY6AyhVF/raQDBmXiMKNVds+Li98A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=bx74QQU4; arc=fail smtp.client-ip=3.211.80.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="bx74QQU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790071619; x=1821607619;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zkxe8TKIFt52WpED6R01s0NPXgsKzW/CE3ex6f6aFbg=;
  b=bx74QQU4JX9kOMXYvCtrMYbVCai+F4KCbk3V6TEo6wHN58eTDLMi3J0v
   n0NRHuRjJHDZV3T+JLg0QBKa9rCCndvS3m83/EZzTll4serDP9EWcaQPa
   ht/DmWhtWRPfNeJsvEIwshZThjQ54+sCKsWcMZrLRAEaiHXk0Go5QNIHU
   vaoCXgW685LHrjJlPxtUZF8+iqNlvxNUJQZDFd1D5QQe/bdBGZUWRfzck
   RTso0IdJfLoOv0ywphmlgdMIcZyZZAMiirwxskobhKeHGMhi+5Jdn+R0w
   RBmQJBroxshDnK/EWbPyfxNjfVVPLiwzt6Q8bMWc6GH2rpcjCF+bIWM6L
   A==;
X-CSE-ConnectionGUID: j2v4juUTQLuYE4XDAvVUXQ==
X-CSE-MsgGUID: zaB937lzTc2QvrMKkeUkqA==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="27873013"
Received: from ip-10-4-7-229.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.7.229])
  by internal-iad-out-005.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:06:54 +0000
Received: from EX19MTAUEC002.ant.amazon.com [52.94.133.130:27183]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.4.190:2525] with esmtp (Farcaster)
 id 31256f21-8f48-40e8-8dc5-68260118c44f; Tue, 22 Sep 2026 10:06:54 +0000 (UTC)
X-Farcaster-Flow-ID: 31256f21-8f48-40e8-8dc5-68260118c44f
Received: from EX19EXOUEB001.ant.amazon.com (10.252.135.46) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:06:54 +0000
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19EXOUEB001.ant.amazon.com (10.252.135.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:06:53 +0000
Received: from SN1PR07CU001.outbound.protection.outlook.com (10.252.135.42) by
 EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Tue, 22 Sep 2026 10:06:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4uXRieMr4C5U8bQFHVdaRPzDlyfVRxuBLdpj43Cft1rQ1XrBFqFI/E74dwgd0sUKQzNd53zfEBcUs6ollr+GhD8nN/CQx9fnCINAslvXX2Tf2Qd+OjVJa9Qwz5tilnSa5ZrNYPHBH9m1SrUBdc+xtHogyGK3vvG2piTzCgZ/+BDfEWdZUZCLq/37d5ZuZxAewtT50t+5TvHRnMFik5sAA1tVWPQMuWMBJssSVoe1W++TEQ74Op9IW64m8kXveoxTrSD9S8PrIc+2KU0HtixLwRxygN/aubdJziw/5g/c4nuApXU3kGOF0pxv+4cfreEu1U0VyvI5RWX23+fUbCNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zkxe8TKIFt52WpED6R01s0NPXgsKzW/CE3ex6f6aFbg=;
 b=EQyWHpBzZmdrp4m3XXRzSCdyNEs9G0+CU1ycCaGhjynufejIZ4M967T5jB65yanE2jUqF7oNonE6jTbfRJJsUlj4WbpJbpRKxsYfVPny3SdATVvMogQO+b8mdO9zuMq11qcTzD2GAMgo9Ald+MBQx7setv+IPCF2bqjEg3C6nJLS0nmc18Nl9dbZMsiLlj3YANMT28VSn836dkfJcTPYHo0qRbtGMlZxrXLbRvKN+NOLEWfmUOqg7wXRXxQeip40V025pQ7/MhiNor8jtMRvVr1PxpOpY+RR6/hY3FqLaGEtgZ0qwKk2j6ygvZBQjG4ESJS4qvypnop26dIcLZMt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by PH0PR18MB4508.namprd18.prod.outlook.com (2603:10b6:510:e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:06:50 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 10:06:50 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] pps: clients: gpio: propagate probe error codes
Thread-Topic: [PATCH v4 1/3] pps: clients: gpio: propagate probe error codes
Thread-Index: AQHdSnoVLE9MH5Ndq0av8MA0GPhZDA==
Date: Tue, 22 Sep 2026 10:06:50 +0000
Message-ID: <BY3PR18MB4722C9F2BFAD0736215CDD48C6832@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-2-farbere@amazon.com>
 <9eb4bd5c-39f5-4236-a0e0-3c3679bf7f8c@enneenne.com>
 <BY3PR18MB4722454B7A78A0E47345EBE8C6832@BY3PR18MB4722.namprd18.prod.outlook.com>
 <235b34e3-2eee-4904-9cdb-490859dabda7@enneenne.com>
In-Reply-To: <235b34e3-2eee-4904-9cdb-490859dabda7@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|PH0PR18MB4508:EE_
x-ms-office365-filtering-correlation-id: 9f185aab-35a0-44a2-2d7a-08df1891386a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: Wg1DbWEGmXZoZgDHsnd31OilW/9uc4OmBA2HkuZq81sBhGxnITH62Y/vMEmX9o77qk4u2jKkgoavACZ9al1pS+EG8kgD42jQmoYNgve6IoDyXd2TI60LbSvSKHJrV0qJ6mIUZE00ycbt3b/5Xt5xcWaVW8ijz3kTYbnXzSsjbS4Fi8o8vs7Gr1uHtGS4L7bU7aPrhX29iQfuq8EUvlpZF2/nMmN976RWLFWHaP+KwmsIoglWww2Wb2NnvETXOdtb1MKjyxqcvob3gH58iJMpB1jVwyRLymqArAzRe6+REPx6V5VmwA2KrijNRYdgdYfi18luAoXyaWUSYxHRWcIAjGuMSd06VkRUfXgCa+ksakiukJt7ofJeclgyqLL1ZQQ5r6mrEnEXPEeePMDmYsLiNqJ9uiSe5zZ4VMwBj7mc6b9Cyab9QQhnzGWj/tnDk61ko/WpJQ2UMaLVymzkLRQhhtv3wnatC3zQHOq9TrnApMFVVdeYAVqbS6icreXtqWdMoho5o/yDZp6m8VDXvM6Jpxr/ulv9G2AdXhrbNLE8MzIO6XqxkFOKcytT0fv89MxwR6llHxIRRbxiG9WNQDMveuaSAP8mShH33LcaNRlvDF62udM8gPSq8xS0k7xj2N5fCofoNjdg7Y4cKBYxeFxBnQBAWX3eeY/Un6RqiZYxHka0pKT82CqYI9zWelY4LcFsb7lK5dnDc4yRRrIPN4XKntPVnFEPISVqgIRrGVEjz8s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K09hUm85eE1WT1pZbDRkRTQra1JpbUJPNnk4V2YvQzJuOUtFdG5raFkydWhr?=
 =?utf-8?B?YzN3SUtmUG1PN3daTWMrWkVHaFhkVjdoUkZYdlZOMVNTdnhONTlmemtxNXd4?=
 =?utf-8?B?OWNaYlhrK0UvMzQ0VlBmY2xIZG9VRFg0K2JvdW9NN1k1Mk5FSVNGQU5nOFUz?=
 =?utf-8?B?OU1GaFlpL1hQOTN0VE5iTktoQ1dKamkwQmZZWG9ieEpFVjZiVjd5UHJDdXpR?=
 =?utf-8?B?dzM2dDdpVDl2TDVQRDNqZHJxV254SlZtZ2xYRnI3eGF1bU00MXREV0ZnVi82?=
 =?utf-8?B?SEF1TjUrYWpnamJyejA3ZHdTc3duRWc1NEgxdnJ4NHczMXI5STVlQmcvaFpl?=
 =?utf-8?B?cFdrTjg2MG9sY2U1YzVuQlNqdUNnM0hMb1lEWlJnMEJ5UHcyYlBVclY2RWJn?=
 =?utf-8?B?WjhqVTl4T0Q0alVKaTRZdng2N0NVV2pYWmVpbURhbGhaSWhlQ1lmWVZTdDVY?=
 =?utf-8?B?REM5eXdjdy92VGpTT3BRT25hUzNTTnN0enRWSmJpTVdwcWxzeE52cm1oUTNE?=
 =?utf-8?B?d2h3US8xQ1RJOGd2QklCUXdXenY0dTU5RkJmNjIwL2Y5SHdEVkpWdFZJMW43?=
 =?utf-8?B?b2htelJWOVAyT2ErTWhxbE0vdE9Jcm45dUNQWi9aNTdQam5PRHhMZkozUmJt?=
 =?utf-8?B?azA0aitBWDVNRWNnTU5DVzgrMFgwYnhQRm8vbDhkZ3RDVW9tTGgrOVNvaXN2?=
 =?utf-8?B?elBwWE9LSVFNUStKYi92cmJTa281bkpEUjRqUmZCcDNHaUVNZHY2RVRGQkc4?=
 =?utf-8?B?azZhUEJhRy9vSTFRaVRGa1oreWlQeWtFai90dnZUUjU5MmRETURXK25GWXFC?=
 =?utf-8?B?L3BPUjJ1bFk1ZlBqNUlETzlrWlMyU1pwbkhIc0tTWFQ1MHhTTFllSXZOdXpI?=
 =?utf-8?B?SW1ySHpRRlRFQXJoeWFtRU5xZWY1d0FGQnZySWVOWTJLRzVNL2NBUUdjWE4y?=
 =?utf-8?B?eTgvZUhFN0tBMFB2cU5iLzEyTkpCL2w4ZVlUaHpXd0VOSlRidE1SRmhjbjdD?=
 =?utf-8?B?emRnSXMxWlk3U2kyUFNVdHF4aDFhcUQ3YkRmL1p5MjhPSmhsbHlxcThVQmdy?=
 =?utf-8?B?WDd4Z1hFUGNEemxrbE5oSnZTVTlGekZSeVIxK2JHeFhDdStlV1RzTUwrejRC?=
 =?utf-8?B?MlpCN2IwRnN0Q1ZvTjY3eXdsZzVGdURDbDJlTE1hWG1QVjJLM3pDaW5MVVpZ?=
 =?utf-8?B?SWxUayt6R0tNU3hOTHllRlIwK3N2M3JzV0pINjlYMEUrNWR3Vm1vc3h5V0Zq?=
 =?utf-8?B?MWFUM3N1M3o1a3BvRGxVNzVFZHltQmQxLzFRNzhqUDZ5eENCa1pmeHhwemc0?=
 =?utf-8?B?TEgzdmJvS3RFZXhyMEhtNXZyd05nRmZCTi9LVVNXWWhBOTZBNlVmU0lLdENS?=
 =?utf-8?B?VkRyQkRLYzdsUVVRbDRodjRIcDBzaGNIU3RvV0w2WlluVEFkeEZpTHNxQjll?=
 =?utf-8?B?VlZIdGwrVFd2R1MwdkxRZ3dsalB4TmkveE9aMkpkTW5GMzRFQW5qQ0JJU0Fn?=
 =?utf-8?B?clMySGdRcWRqdzZzcHg0QlF3T2NpWVUxYzFyYnVjbjRBR3pNaWpuWTBMS0RS?=
 =?utf-8?B?VzN3dUFqbEd1dEhnSjk5amVwRU54YXltMGhxZHdGSkdSbVR3b1RQNDhQZXJ4?=
 =?utf-8?B?MXJDRGZGcFZKcFVEdTVEUkZWbmZDT043VDlBdVFOdXg5SU1aQUV6UklUTWIw?=
 =?utf-8?B?bnpKdFNmZXRkRUR3Mk5QcEdDb2NwMlJuODMyem1VVTlTbFhibHNVT0U3ajlt?=
 =?utf-8?B?TnNmc0NQUWg2VUUwWVB0UzhrbWFWNVBJbFQyWGM4b0lGR24yRXNyczg2d05n?=
 =?utf-8?B?WWtibDNScUx6M0JpcldLRGozWmdWeDgrSWtWaFFPbzFCUEl1ekdIVzBJOHlQ?=
 =?utf-8?B?Qi9Rd1dDOFBJSjB0TVAxMm5uaEF6aERHRjdWNjcwQVRUZTBabW1ZakVaUWpN?=
 =?utf-8?B?RmNoeHpTVmVEcHpCMmlsOVh2OURuQ000U2xVNC9NNGtQNE40R1hobTRyU1Zk?=
 =?utf-8?B?K091NjhFTFB1QWtrOXZQWVdoc0c0RWJENUJIY0loeng0U0ZjMURVd0pGSWJY?=
 =?utf-8?B?WkpCYXYwUEl1Y2lVNjd3Y1AycmwyaTRtVzhSdy85d09yMC9GUThtZXJENytW?=
 =?utf-8?B?OXh0Zkw1QVV0L0sxckY4dk1LZmxRQkRFdkpTWTVQcUUzUGtHTzhkSjJTV1Qr?=
 =?utf-8?B?QmJqdVlzR2ozWStjYUo0S3dUOEhzR0ZHYUlZK043b0g0d3pWdWtnSUdZVm1R?=
 =?utf-8?B?Mldza3dtOUNnQmFIUFBlZ2t1ZEJSRllHNEdWUTFMb2NOVE5SVkc0NVBvb1JX?=
 =?utf-8?Q?ZgM0yEd8Xwpyys5LAk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hZ5/qmgvI9wtqQiEtWTFQiBo57Ja4qOwo8tAWN7VFrGe9Z/Kh96QmrMULidJU9lh6drJ0ieZhPJ0QQAmUp7YQzJMzykDOCLD1SbSAthbop2CNKVN1K1ASKFWSmL/zbXtRJCr91EmTgChR/T2jT0l1KTwN3BaIthTu8psFk/J9gwD7ITBF1Sj99v4VbDvA2Nf0wVcaf72kRcHvMEwOokaW5EODfLkhrszuiv6Zy/DvKETLkhd8Ei6GPVAKA5f+VpIldz08WfB787QmaGD2OQoNOIqxoOko1UJOMisTtga7qfoyCdws2f8ZspKyyxl09++FpKZLZDHcHRhrgG+xRtXcA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f185aab-35a0-44a2-2d7a-08df1891386a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:06:50.5611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F5lOvFvnCubVtM1GSu+XwKhAasYEItI9iCYaSA2llTw2hNNFek9EozIyMjp/j2ntqMfkdng6sYLPGgzfLn/sXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4508
X-OriginatorOrg: amazon.com

T24gTW9uLCBTZXAgMjIsIDIwMjYgYXQgMTA6MjI6MDBBTSArMDIwMCwgUm9kb2xmbyBHaW9tZXR0
aSB3cm90ZToNCj4gT24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMDg6MDg6MDlBTSArMDAwMCwgRmFy
YmVyLCBFbGlhdiB3cm90ZToNCj4gPiBBZ3JlZWQgb24gc2lsZW5jaW5nIHRoZSBkZWZlcnJhbCBz
cGFtLiBJIGF2b2lkZWQgcmV0dXJuDQo+ID4gZGV2X2Vycl9wcm9iZSgpIGJlY2F1c2UgcGF0Y2gg
MyB0dXJucyBib3RoIHJldHVybnMgaW50byBnb3RvDQo+ID4gZXJyX3JlbGVhc2VfcGlucywgYW5k
IGRldl9lcnJfcHJvYmUoKSdzIGlkaW9tIGlzIHRvIHJldHVybiB0aGUgZXJyb3IsIG5vdCBnb3Rv
Lg0KPg0KPiBZb3UgZG9uJ3QgaGF2ZSB0byByZXR1cm4gaXQuICBDYWxsaW5nIGl0IGp1c3QgZm9y
IHRoZSBtZXNzYWdlIGFuZCB0aGVuDQo+IGp1bXBpbmcgaXMgZmluZSwgYW5kIHJldCBhbHJlYWR5
IGNhcnJpZXMgdGhlIGNvZGUgdGhlIGxhYmVsIG5lZWRzOg0KPg0KPiAgICAgICAgIGlmIChyZXQg
PCAwKSB7DQo+ICAgICAgICAgICAgICAgICBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVk
IHRvIG1hcCBHUElPIHRvIElSUVxuIik7DQo+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9yZWxl
YXNlX3BpbnM7DQo+ICAgICAgICAgfQ0KPg0KPiBCdXQgcGxlYXNlIGRvbid0IG9wZW4tY29kZSBp
dDogb24gdGhlIC1FUFJPQkVfREVGRVIgYnJhbmNoIGl0IGFsc28NCj4gY2FsbHMgZGV2aWNlX3Nl
dF9kZWZlcnJlZF9wcm9iZV9yZWFzb24oKSwgc28gdGhlIGhhbmQtd3JpdHRlbiB2ZXJzaW9uDQo+
IHNpbGVudGx5IGRyb3BzIHRoZSByZWFzb24gZnJvbSAvc3lzL2tlcm5lbC9kZWJ1Zy9kZXZpY2Vz
X2RlZmVycmVkLg0KDQpEb25lIGluIHY1OiB0aGlzIHBhdGNoIHVzZXMgcmV0dXJuIGRldl9lcnJf
cHJvYmUoKSwgYW5kIHRoZSBwaW5jdHJsIHBhdGNoDQp0dXJucyBpdCBpbnRvIHRoZSBsb2ctb25s
eSBkZXZfZXJyX3Byb2JlKCkgKyBnb3RvIGZvcm0geW91IHNob3cgYWJvdmUuDQpBbHNvIGRyb3Bw
ZWQgdGhlICI6ICVkIiBmcm9tIGJvdGggbWVzc2FnZXMgKGtlcHQgZGF0YS0+aXJxKS4NCg0KVGhh
bmtzLA0KRWxpYXYNCg==
