Received: from iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com [13.216.54.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315D23FD12A;
	Tue, 22 Sep 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=13.216.54.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064508; cv=fail; b=GrOi4OUrwa2Tie0M/J3F3jGqWw26f7PFbMCTuZgmE67VrtYK+EDjRr6/trXb40/gIE5oRaL8VRbVfUZ8kNzjDnDyoqWxpxHuCA5LrdzH5+/2QXTPrbnJp4D9VwUaiLDYatcJ1q3fpdOCmgz2UwT2UgGxVYM3oZLCaMOYMlIRg2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064508; c=relaxed/simple;
	bh=KZ7YZElnkUV5XhLbZ3bv0UHlzN6GjvP2IPVrnss9r9A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J3CwpabBuNlc/UefwFs/uKmB/0vJ5in7sP+1OX3uUoSZARvXbeMXMbUlyzOngXZP5AeaKdnReKE1KgdSRG2G66SnSjO5kHZURJPQxnao6essqyVuWwovCt3cmueE0xiSpErWoMVRS5+/WubICgcyGeqOP1nwouvgfhF5f1zrQjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=pz0QEkyO; arc=fail smtp.client-ip=13.216.54.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="pz0QEkyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790064503; x=1821600503;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KZ7YZElnkUV5XhLbZ3bv0UHlzN6GjvP2IPVrnss9r9A=;
  b=pz0QEkyOSvtDPO683ysNzc6TiSXtenXniwgiesWWs6iojBnGYzZyJwVN
   4YDqkBdeHuPGjxvJKDaQNl7PBEMxVwG8Ywm08oZRq3BO5bsHuSgWF1y+x
   gy2Mtd1H9sB0D4TvwGFgfNaTn/GHrPdtLG4TDZnJyM67DHfMdEuXafhG9
   AunJ0wrwX1nw6ZQzdk/9esDIAN+qCGMUc4zHX9OMCSpf+2mKz3SO6MelQ
   vHtM43ABzUnRGfuDyAseuB7J52TEHajibyAMDxAHCP0Gd2vP82gBq8qC5
   yMnlpc+SKVG22QMonlVOCzsj4nF1SrTjH0JzVFMXv7P9z6BJ5CKh8QgOj
   Q==;
X-CSE-ConnectionGUID: qXRKsiGWQTG6QGtbFBbRUA==
X-CSE-MsgGUID: HTJEqJSwRZCysRwbPU72Sg==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="27897734"
Received: from ip-10-4-17-41.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.17.41])
  by internal-iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:08:12 +0000
Received: from EX19MTAUEB001.ant.amazon.com [72.21.198.67:5063]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.34.106:2525] with esmtp (Farcaster)
 id bdc31fc8-ddda-4c68-bfc5-36415fca51b9; Tue, 22 Sep 2026 08:08:11 +0000 (UTC)
X-Farcaster-Flow-ID: bdc31fc8-ddda-4c68-bfc5-36415fca51b9
Received: from EX19EXOUEC001.ant.amazon.com (10.252.135.173) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 08:08:11 +0000
Received: from EX19EXOUEB001.ant.amazon.com (10.252.135.46) by
 EX19EXOUEC001.ant.amazon.com (10.252.135.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 08:08:11 +0000
Received: from DM5PR08CU004.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEB001.ant.amazon.com (10.252.135.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Tue, 22 Sep 2026 08:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcWd0S4RMCIU6O1J0ezN0fiCblEoxbyeaAfv4BHKR4Ob2YRZkmH+NFiTm6MmPCUpDie3ZgG7/9h2MB92dO4SdVna+k+oN29AVLAC+NL7G29LAjrtRncI6cEO/5pVF0zjYLrwVJikhMMHUVvbSn+zltO9xARS2fb9jFBxcEPCOeD73BGeNsgZkZRwGacT7nwlrpxO9amObRZhlUMwK0ejVS5mheTVhQpgLVZo1h9BKNaegl09MxU1v6z9Alsjk1mTIbrXKvTOzycmjaM3L1H3MRm7+8fvpGOhvVEo7MMQr2N1tAGExtpwYrrN4nTLlMVTjFaSsfuRiY/onyClGB1SqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ7YZElnkUV5XhLbZ3bv0UHlzN6GjvP2IPVrnss9r9A=;
 b=WN5vEOVe3M3MKtUFO6LyRAVYybcdwXtNS1h29cWO+7Zjvt6U6vcPuH+f9uVrt8O8uYTFZTRrho+tDwFmdM8HZnnLLFQtMkrhaLJu71MJdWsytfgKF8pLDRu5IDgfZgShRHe0t6MweflFORtQnUxAqU4N5UuQhtvgD6jIyuye840EvoLOMrmqQxMvP95a8v42QLZDP6F6HFfnwqOKxj+wnDp6zxhpSEARhqTRk7+bF2HJMlWZCrcNvAUvlWWFwkd0O+TdAIjHKCY9MoD6rwUSAcEX2UVDXodV+4xPee7EYov/i7rNFNv1ARlWbHmoMVXM8/8adl76fIvRQAZtqanlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by LY0PR18MB097882.namprd18.prod.outlook.com (2603:10b6:404:204::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 08:08:09 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 08:08:09 +0000
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
Subject: RE: [PATCH v4 1/3] pps: clients: gpio: propagate probe error codes
Thread-Topic: [PATCH v4 1/3] pps: clients: gpio: propagate probe error codes
Thread-Index: AQHdSmmBiVUcy3+1P0eAz5OGre7KQg==
Date: Tue, 22 Sep 2026 08:08:09 +0000
Message-ID: <BY3PR18MB4722454B7A78A0E47345EBE8C6832@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-2-farbere@amazon.com>
 <9eb4bd5c-39f5-4236-a0e0-3c3679bf7f8c@enneenne.com>
In-Reply-To: <9eb4bd5c-39f5-4236-a0e0-3c3679bf7f8c@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|LY0PR18MB097882:EE_
x-ms-office365-filtering-correlation-id: 2836be14-f8bc-4fa4-29f4-08df1880a3f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: Ur56RBh9nCrAK4gH1YFXTdTmrKPjpHba/XYPN9/0qlsnqGA9/XWn5B2BGF1sT0k1oBawPOzqWZD6fDWwVVJ6z5CzT98SN63+P1feTRybbJo40cW7c4fzopr6eJai6if/7YmSQKQKsP2pM2wXnloCZkIcLoy86ZutnVIqGLMl1weIySP/TFNsPDupIXhAO+wgi6CZzIm2U82v9D7PJcJUmh3sia+FLZKi40jPbY+RyLL2FC9q6vapJl/q51GSsqKQVzfPfYKNm52MM1soOKMrjkY50o1WivUb5V0UwCHvPiBM5IIWwOpThQNLzJybgggLxrWOWgbd/QL4hSpuHnWHO1+xgltGgSMyL5sWiMqQzk9gcbooYPxpfWhcdckwrxJc4Dpclyoo3v7cVZjPuK9n41R2/US4/0wNj9jMiBtNjsEx9hoAzndYk/vzquZ3BRqJU4BGXrgLWthqhOQ7fojTO5eaHpdw0FdwP0yS3eX4ibDrN2L2RzCxh31yUHmiPKY3t434fBwKB7lK8x2YTvwKQ+k+sFop0WAx757Ycr4AO93z+0yARgAcK+5ex2NbV3d3HPDF5l+22HB5w0tmJEMXBLSr+7IEfP23dZE9YjDzeePpx1g2DYE40KSey34QlQV99GAYlmCznx8MTymI1d2cSzCZAknofu34R1lma5svpYLB0jO2Om0xF5ttzZQAYpEHwfJY7dLhMpL4RXdyCTktVsP4cVkuBaNLEAMf9d1NYjM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWlhOXhwRDZuaUF6anRMMzNxbkFlbWpxTVBQN1FHalA1OU5KUkVsd2dTRFpQ?=
 =?utf-8?B?eUtnY1lPSU1iWEZpU0ZMOG1VSzV5WTRMWjBEV0J2bi9VWGdsdHhsYzQyalE3?=
 =?utf-8?B?VHhVN0s2TVFsQnNleU1JZGxXWTY0NXRNbzJaa3NoQ2l3OGJidXNhdFlqZ1Zu?=
 =?utf-8?B?cUlBNWdNd3RNd1Q5dFFDVjdtUE1RQ0Fid0pXMUNyTzMya0xoUm5iQW8rMWFD?=
 =?utf-8?B?eXNtcHpueXYvcldCTGFSNGlSa0hQUHA3UjFMcm9lQkRxTnppcVlzeTA3TU9K?=
 =?utf-8?B?cU9MVGJHZWFiYkFRUVZxK3ZPRUlHOWhWdDRTVkRuaTBkNVF2d3IxUzNtMXc5?=
 =?utf-8?B?cmRYQmVwSUdqZEZLTjJjWDdxRDhxd2RKRVYvRkR5WGpOMjFWNFFralQ5Tk1T?=
 =?utf-8?B?dGdkSWRiN1gwTmNTUHFEUnl4QmhHOUpQd081aGpTOFYxS3kxSkZNSm02RVpB?=
 =?utf-8?B?Z1Y1R2hRUThneHR5cDhYRzVkclJydFJHOTR5TVVRdkpKUXBnWTduazdSTWhN?=
 =?utf-8?B?U0I0SFVpMXl2c3FoK3Yyek96NHplK01ZRERCQkZDMWdidTVkT1c1SzdxWXBI?=
 =?utf-8?B?MnVQZWtHeCt5L2V0TzdZR0k3REt4allLK1p6WnBkTzZudDQ3RjFYK0FCT1hm?=
 =?utf-8?B?cEFlNktFQ2JSSXB5Q0xmaDBuNEZXYmQ2UkpLQm1NZEIwRUMzam1PQXUwQ3pi?=
 =?utf-8?B?UktpbkI3MllvVk9PMU5PMFdxZS9KeHRiWWJFSjAvbnFydlYybjlxL1ljRlda?=
 =?utf-8?B?RHNjZ3drZmxtT2w5OGh4NG11R0QvR0pESkNGeGlWdm53cnFVd3dYL1ZmYnRT?=
 =?utf-8?B?VjE1Ry94M0x2R3F5MFFyL05DalgwVm55cjF5QTVpQTI0Wm1qTDhjcG8rRmVr?=
 =?utf-8?B?NTRpbkNsN1FvRUQraXFONUtCTTJVeVBjeVdtb21kODlKbEhwbmZHYUlxZW5O?=
 =?utf-8?B?VUt6ZGovdUpRbHZiSXhxM2E5cDBESW9jMGpMRGpYYnhkcDZkOFd6T2ZLUWRD?=
 =?utf-8?B?WjNlSlh4dXN3S1NGL3VlOVFreW4zTnZ2YW5OZHZ4QStIclVhY2lkYXU3N0NM?=
 =?utf-8?B?SU8ydklDaGJWZC8yV0NnWU14bVNUcUtmSGVub095RitiL2N3N0EvTURCd21m?=
 =?utf-8?B?dW1YYUlxZlc2eVJ1WlFEcXFscGJhSkxlWGZNSEtuNHUxYlIwQ0s1dDFMN3Zh?=
 =?utf-8?B?Q0o1bWRWb0lFd3dXaVFCZWNTOGU3bjNpbDd2UDdIUGNNZy9nZ3VVTVQwTDEr?=
 =?utf-8?B?cnZIK0dQYWJ2NWVUOUVqYU1MOXU0L3RnRXc4dkl1VjRyUzJtQXprY1V4dTlP?=
 =?utf-8?B?VTdSZkRZNE1aL1hHbW41Ym4rYkRFMWNFRnRkVlhnRmFvUC8yZXAzNzJaVEJS?=
 =?utf-8?B?NkxZTTJTODNNREJXbHJ5VS84bWRVeEo0Ni94VWNJVmZGNWQ0QUY0d1A3K1A4?=
 =?utf-8?B?aTMzamlUYXNXZ0ppYmFFaDhRbkdMMUlHOTVTTXlXZzAvak5LWUo1NlpzbER4?=
 =?utf-8?B?TXUzak9qY1FYVlBHNjhtVTh3dFZOY2RuYUp6UnB6cEZ0emJSS0FzMlNPRllp?=
 =?utf-8?B?NFgrS0tuVElnZ1dFMzVrUG5FVlVtZXRpaGVibnVMU1ZpOWdyQkEvOFh0RTQ0?=
 =?utf-8?B?YnZsTndEYTNEVitMSVZBelY4YXo4R2k4RjFXQlhCazk3ZHpITmtTRXkwaEo2?=
 =?utf-8?B?TWx4cjhPajZqaVZTWU5zaGZVMTllbFlZZFNka0dYT0N3N0o0TkRsb3BvQ2ZK?=
 =?utf-8?B?Z3EvNGx2S0ZQeEhudURNRDdtVEJCQVNWUHI4Zk9uV3RIMDh1LzlabVFwa0lK?=
 =?utf-8?B?akd0bHQrMk5ZVVR1UjZ1YllJRkFKelhjU3N2VUpFaFI3ZkQxSTFXUTYzQTBt?=
 =?utf-8?B?NUQwbXZId24ydFpnR2RRazFFUlBmeFdMRTJWNGRZdHFLaUVFa1VubmQzMzA1?=
 =?utf-8?B?WDU3RzhBcnNBNnR2Tk1PM242c3pZTWllYW9jdXZxb29QYkVpb29sek93SXF0?=
 =?utf-8?B?ZnIyUEZFbG9lL3k2cCtXMExwbWk2ZjJDZms0RXkwRUl6a0JMY2hyMnZnTXlu?=
 =?utf-8?B?cmpoSGlTSUkrdjdXTHdiNkNnMFZMbVhVWXk5ckYwQzcxYXdwZW1DaWZjTUFJ?=
 =?utf-8?B?RngvYitSd2Q0TjZOa0hYZ1NvVjRTSzAzMWxCODJUNko5ay9oeWI3WDB4anpx?=
 =?utf-8?B?QlVRNFp1cS96NnpzN2pSTmw3MDBLRWR2OEwybzRudUF5OXpTdFhaM2xyQnY0?=
 =?utf-8?B?OE9oVXY5YjlFdUozdllLUk9WYXNsRGtRR0FpbDdUd3FvUmk2eTNsM0FIUFdH?=
 =?utf-8?Q?zQYuQsE7SebFVeO5RL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: brYs+sPF3FbQFmN8i/M6Z4r3dfvg2u5+Aog9r9DGJFFHLF6cVr6qgaUGiAPF/b6gkVIqZFyuqOU0yycB/41unT4t3jdIal0JVI5PQj7sWE6i6WGA0PEiswgQSLdU0gs7JaUv8X0AiWPjN3qPYZgaP9Qmt9k/0WMUdgyOfSAXAnqPkbbbU+3b+4jirVcBSAxfZG+l7xqMKuOOK16Lw39oJ29rQhX1XFe8NVZ1xXdlEIDw1aWIu2ytPSFO/WJpVb1KHbA7uan/Wfv/tGKa3SpeQvyBpDEOAzHreKPMaDUY9nvGu2S96UynO1VvDMo4I7seQTuLFI+L2YR1v36Rg1hUcg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2836be14-f8bc-4fa4-29f4-08df1880a3f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 08:08:09.5435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ypp88oQHXhLifbqFzDB0R5Q/iwQJwHyJo5Tg4qzjIdruN6+L8sI7fxyCwxaoRX74qP1FwdttTOTgQjTGbZhAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR18MB097882
X-OriginatorOrg: amazon.com

T24gTW9uLCBTZXAgMjIsIDIwMjYgYXQgMDk6NDA6MDBBTSArMDIwMCwgUm9kb2xmbyBHaW9tZXR0
aSB3cm90ZToNCj4gPiBAQCAtMTY1LDcgKzE2NSw3IEBAIHN0YXRpYyBpbnQgcHBzX2dwaW9fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICByZXQgPSBncGlvZF90
b19pcnEoZGF0YS0+Z3Bpb19waW4pOw0KPiA+ICAgICAgIGlmIChyZXQgPCAwKSB7DQo+ID4gICAg
ICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBtYXAgR1BJTyB0byBJUlE6ICVkXG4i
LCByZXQpOw0KPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgICAgIH0NCj4gPiAgICAgICBkYXRhLT5pcnEgPSByZXQ7
DQo+DQo+IE5vdyB0aGF0IHRoZSByZWFsIGVycm9yIHN1cnZpdmVzLCAtRVBST0JFX0RFRkVSIHN1
cnZpdmVzIHdpdGggaXQgLS0gYW5kDQo+IHRoaXMgZGV2X2VycigpIHdpbGwgdGhlbiBzaG91dCBv
bmNlIHBlciByZXRyeSwgd2hpY2ggaXMgcHJlY2lzZWx5IHdoYXQNCj4gZGV2X2Vycl9wcm9iZSgp
IGV4aXN0cyB0byBhdm9pZC4gIFdvdWxkbid0IGl0IGJlIHRoZSByaWdodCB0aGluZyBoZXJlPw0K
PiBwcHNfZ3Bpb19zZXR1cCgpIGluIHRoaXMgc2FtZSBmaWxlIGFscmVhZHkgdXNlcyBpdCwgYW5k
IHNvIGRvZXMNCj4gcHBzX2dwaW9fZ2V0X3BpbnMoKSBpbiB5b3VyIHBhdGNoIDMsIHNvIGl0IHdv
dWxkIGFsc28gbGVhdmUgdGhlIGZpbGUNCj4gY29uc2lzdGVudCB3aXRoIGl0c2VsZi4NCg0KQWdy
ZWVkIG9uIHNpbGVuY2luZyB0aGUgZGVmZXJyYWwgc3BhbS4gSSBhdm9pZGVkIHJldHVybiBkZXZf
ZXJyX3Byb2JlKCkNCmJlY2F1c2UgcGF0Y2ggMyB0dXJucyBib3RoIHJldHVybnMgaW50byBnb3Rv
IGVycl9yZWxlYXNlX3BpbnMsIGFuZA0KZGV2X2Vycl9wcm9iZSgpJ3MgaWRpb20gaXMgdG8gcmV0
dXJuIHRoZSBlcnJvciwgbm90IGdvdG8uDQoNClRvIGdldCB0aGUgc2FtZSBzdXBwcmVzc2lvbiB3
aXRob3V0IHRoZSByZXR1cm4sIEknZCBvcGVuLWNvZGUgd2hhdCBpdHMNCmtlcm5lbC1kb2Mgc2F5
cyBpdCByZXBsYWNlcywgbWludXMgdGhlIHJldHVybjoNCg0KICAgICAgICBpZiAocmV0ICE9IC1F
UFJPQkVfREVGRVIpDQogICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gbWFw
IEdQSU8gdG8gSVJROiAlZFxuIiwgcmV0KTsNCiAgICAgICAgZWxzZQ0KICAgICAgICAgICAgICAg
IGRldl9kYmcoZGV2LCAiZmFpbGVkIHRvIG1hcCBHUElPIHRvIElSUTogJWRcbiIsIHJldCk7DQog
ICAgICAgIGdvdG8gZXJyX3JlbGVhc2VfcGluczsNCg0KV291bGQgeW91IGxpa2UgbWUgdG8gY2hh
bmdlIGl0IHRvIHRoaXM/DQoNCj4gPiBAQCAtMTk3LDggKzE5Nyw4IEBAIHN0YXRpYyBpbnQgcHBz
X2dwaW9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBkYXRhLT5pbmZvLm5hbWUsIGRhdGEpOw0KPiA+ICAgICAgIGlmIChyZXQp
IHsNCj4gPiAgICAgICAgICAgICAgIHBwc191bnJlZ2lzdGVyX3NvdXJjZShkYXRhLT5wcHMpOw0K
PiA+IC0gICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gYWNxdWlyZSBJUlEgJWRc
biIsIGRhdGEtPmlycSk7DQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAr
ICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFjcXVpcmUgSVJRICVkOiAlZFxu
IiwgZGF0YS0+aXJxLCByZXQpOw0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAg
ICAgICB9DQo+DQo+IFNhbWUgcXVlc3Rpb24gaGVyZSwgYWx0aG91Z2ggSSBhZ3JlZSBhIGRlZmVy
cmFsIGlzIGZhciBsZXNzIGxpa2VseSBvbg0KPiB0aGlzIG9uZS4NCg0KU2FtZSB0cmVhdG1lbnQg
aGVyZSBpZiB5b3Ugd2FudCBpdC4NCg0KVGhhbmtzLA0KRWxpYXYNCg==
