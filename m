Received: from iad-out-014.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-014.esa.us-east-1.outbound.mail-perimeter.amazon.com [50.16.246.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7A338737A;
	Tue, 22 Sep 2026 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=50.16.246.183
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088920; cv=fail; b=OkDOBXihgKD8i+e7ELBSy0STh0mJHhnQnPoLT/A4fWeG3lZSPYSWoxTiegqGjyrbZhLvFfvyxA01ipjcEqTp9fVRrC47H/W90G2HxNhi6HXqCmsiTCWj8VJNm1KorM7AA2LFHDnrjx5uDrPEUZNb4KvGGY774vg+nZ7193gh4h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088920; c=relaxed/simple;
	bh=g8Iyl8A1JtjU0CvLkakOC9yM57H3CWDNQymRBPWQsE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KA4iRtEQwaXhtCeaggMz2IJF59YWaX6leKa2f7COjusRQJBPN+LPN2PMjZV99UfqRqrc6NGDvWg/TAxg8RZxOMvax4x25r6/xWsjSOZGAeekrDc1eKFEqio+JlpMBydFGOwOiiVVQBBBuiqXjEnTer94i6NDusa+qHgv3qUyprY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=cAVSXDL1; arc=fail smtp.client-ip=50.16.246.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="cAVSXDL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790088919; x=1821624919;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g8Iyl8A1JtjU0CvLkakOC9yM57H3CWDNQymRBPWQsE4=;
  b=cAVSXDL1sjrcGqm0P1A8NrHqep/xsxRkP9siTSVjHSX3gfYO1UNwHM32
   RHruHLa7FVaZblumh/OkLyCUgjsNXSG9dWkM3TAC8BZJJSDbVUmrHviNp
   XI9lX9Fre7cApMvJDVufiBvT46VFXXqZfqKUJtvKb507memz7KjAUxlw+
   AsF8nVD1I2sYyyxuk0z6wMgoxJmXbs/JT2kaOrwyUfAgP8jvVT1w87bFr
   9k2vptCKQO74wU7fVzX3Y4SVUE1u72JNnbWNYPmA1Q1XNRCiah19wJvbp
   5ID8ApW3dRk8NONoJDzTUEJFCMhoTEY4wavlJk3JB2bO/JgbGfLJR55Y5
   Q==;
X-CSE-ConnectionGUID: XGWJQ1JrS36JV9uERBSytQ==
X-CSE-MsgGUID: VscwbpvVTHSjGjhzxYLlMw==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="27356289"
Received: from ip-10-4-13-79.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.13.79])
  by internal-iad-out-014.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 14:55:15 +0000
Received: from EX19MTAUEB001.ant.amazon.com [52.94.133.139:6016]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.10.255:2525] with esmtp (Farcaster)
 id ddb30f02-1c43-4d8b-8d6c-fd2e7e86ebda; Tue, 22 Sep 2026 14:55:14 +0000 (UTC)
X-Farcaster-Flow-ID: ddb30f02-1c43-4d8b-8d6c-fd2e7e86ebda
Received: from EX19EXOUEA002.ant.amazon.com (10.252.134.207) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 14:55:14 +0000
Received: from EX19EXOUEB001.ant.amazon.com (10.252.135.46) by
 EX19EXOUEA002.ant.amazon.com (10.252.134.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 14:55:14 +0000
Received: from DS2PR08CU001.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEB001.ant.amazon.com (10.252.135.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Tue, 22 Sep 2026 14:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wADgbj6TdNoQGF1iydfCbRvZLZzpC1ThK7UrN3drmBgVPV6I8hlt/McLTc9V5lbN4vR322NUhLDYIGcnv3Sea90WEr6lcgtlFOhtTRRsg2JnFSCcOxnOW71hHGzL2R0LT+Gq8EoU+5BHxqAS5PwiHTRtcSimHONuDjW/yx6bZwFWbFufY1HfvELmTDbVKYt6L1XNsYp6J7dDpwlfVVhmIwPmmeMr3JIFy/J0u8I6keH4IU0emrvr5afH8vvpBpWH74+BXlRxiXtvsSTSGmWBHCXG4XAiDuewVMFDi2QW7nJ214GiuYFAz4M4Nn4736AbvUVn0GfICueVu4ghxY3KEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8Iyl8A1JtjU0CvLkakOC9yM57H3CWDNQymRBPWQsE4=;
 b=rbOcG5/R162m3Sggx91PEys0bZLPfrqbF67n+yHJ1HuPHel8nZn8D0rSYKX22uzKrEy6AVb/9bOTsCnVuGsKaDMSqVVd4RgHG4et1+Dygui1g7H847R/b+UseAYUKzd9SbYZmqA/EHWMkRKfqtg1Mt94TR+h18axUbTGDJtKEqQDZPGtRqZH+/ZE6VZ9faWH4JArxmq5ZXkc+eXi0hF9q9FDF+OXBPyNW8fPCE0YMeNp1sSt/gmWSZ/UjGaa0VOauOJ9qi3PPN9SrdO+GysN7r0d52KYjdyM6YqqhW7WeePQtoR9lP2xHCTVULT3ppbtkLJQK590YV5ocaTz2HmO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by CO6PR18MB4401.namprd18.prod.outlook.com (2603:10b6:5:35e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:55:05 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 14:55:05 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 4/4] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Thread-Topic: [PATCH v5 4/4] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Thread-Index: AQHdSqJaW4ltrLQMx06VTXWXuj3/Jw==
Date: Tue, 22 Sep 2026 14:55:05 +0000
Message-ID: <BY3PR18MB4722D28B37D2DBCF3DC38ACDC6832@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
 <20260922103051.5257-5-farbere@amazon.com>
 <d9a9ecdf-8e29-4595-aedd-e62afa7ebb4c@enneenne.com>
In-Reply-To: <d9a9ecdf-8e29-4595-aedd-e62afa7ebb4c@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|CO6PR18MB4401:EE_
x-ms-office365-filtering-correlation-id: fb9b4c08-7f57-46ae-4d46-08df18b97d29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|5023799004|11063799006|56012099006|10067099003|4143699003|18002099003|38070700021|22082099003;
x-microsoft-antispam-message-info: yGzH/AlFwLgrRgymnx9ADmLqfYpy+cqQYpOq0zMR/iFcsyYtUg9Lhef/MYQ4n5zahNtNnxSBUP2b3oEfqhK6Pm2HGZv1KUKaU4FmuyqWkcuSw/HBEv4i5YnxUo0mRbFQ7c/2l/U7fSCk8MKhH568XD6PoWM1HLbLR4YuCecMtYfGpfp1/X5f+HhIiN4sXG5D4MLG45/Xi9pkiVnp2IRluUwoc3AYve3FbB/ggels0elnZVWoACcOgPIE4Z6RgYh3+f5CE3X1P+PUwrD8gxExpxxr7ZThUvWjYeYF2GEeIbUU3iVAvlgtMGq2Ms1LZtm/xBeNxr3YH0Xz4v9CeautqNv0I6dA9oChC1fXoVr/4VEjzR4Y67L0Z++aj4RDsVzqqRx0TT6A7GVTU2fHPd4PvwqdGVCnUCKPVbALWxZ4Gk08Vw9Dg0HVxmNYTv1sHlMIFyMa5FWY0KqaGip3O0S+srRH6ERjBiAt6SkVPs7ai2X37p8D/SyQQd7JdUXG/CNq1UqlLDZRmdGl3qzhSo10M/cL06omhrMtz+DITL26P61dwEldYMVK7ffuuJExYNxPAWabZkXgoKp/5r36MxnXhCpRMxHwEaTOpnmygHEYUa6UQcqf59bF7BDbxnkzuKm40CLlDQ89SFd4Bb5mQVwsacegyUjXEs3NGnJoa3cX+2DmjUv9Kuww9AC2FMoZ3E5yNfms47uffYTD1yiiaAXoUYC4DsTB5g3wE37K1PwsIfk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(38070700021)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUdKblNKMDhGZ044SllvUDF1Z0sxZ3FsRjNlQ21kOVp1WXFhNEVycmVRdzND?=
 =?utf-8?B?czBJUWY2V05kMExmdm5Gd1AxU001MjhueDFOMXFWSXpXRlBsL0pxN1NLT3Nj?=
 =?utf-8?B?bkRWQ2RUUmFYUlpZTkw3VjdWWVBxUitibURTQjd2cVR5MCtjVWZGVi9VQVNr?=
 =?utf-8?B?YTB1SDZMUjhwL1F0YnI2MTNQeVYxd0VhMFk4NHRYdVVFTEprb0ZwcG51M1NJ?=
 =?utf-8?B?UkFFU2tXdVhVZXBDaU5DWWtINFVzT2VncTEvbnQ4d3VxbjJDR1k3VjNyY1VL?=
 =?utf-8?B?UFFLbFpTSXhlM1I5TGJxSVZGdC9FY0RQMW5qODVGdVRPL3Eyd1hibXFoSUNV?=
 =?utf-8?B?SUI5d3lUR0YzaXJkWW8zQ0dLY0tEZk1LdmxxcEFpellMRGsxUW9IWmpEYlM3?=
 =?utf-8?B?SEFWa1ZtSUpicXpVQjZzdTIxajBDNTlZbFBGU0U4N2ZYYlM0R2tjbTdjdmdB?=
 =?utf-8?B?cWtYQTFpcjUvcEsvQS95eHh5d1E2aWxIeENsUm5ReE9FTFNsQ00vZUlVUzVK?=
 =?utf-8?B?ZDlYNDBPcmNyYW8rMzFMU01FSllRcGtHK2tqUjhhc2hXU3VaYVhDNDlNZE92?=
 =?utf-8?B?Tk55b3hJMEZHSWpIeEpFSlA4NXBMQXZHUWt6eFlEU2JpTnZsVGRVUEJqbGZv?=
 =?utf-8?B?S1dCSXdiUFVkYm1Ua1BIazIwZDZia2JmME12R3NuUTE3bGx1cEt1UDNwTXdI?=
 =?utf-8?B?bnIxUEVibENzOGxkcCtwbkZSV0dHcVRrcGwwZ2ZPQlRuYjN3N2FJWHB0TVhl?=
 =?utf-8?B?TzBUQmx3TmVGeEl5S1hTZ08zajlLZU5peklSc25RbVJLVHdkemQ1UEY2ekRK?=
 =?utf-8?B?R3NjaUY5dmxkQnlua0dCMXJ4amFaK3FxNmRFY0pQU0NuWkVlaTYxQzVUNjVx?=
 =?utf-8?B?SkRkYWFCS3VGclFPMDBUVktwYjcwQ0xPblBRSzR4eTZCMFhNVGMvVm9NdlF5?=
 =?utf-8?B?OWhjbzZFQk1tZ2owZTVXL2tKTXJlZ2lLbEp6NXFHK3l3dHRIQ0NvL05seTJp?=
 =?utf-8?B?T1BLbUJjQzdKc04xSitGUG94MndHSFdqeTB2cWRIeDl6TDBhMUVkVDNnREJp?=
 =?utf-8?B?S3oySHl0aHJMNXM5R0Y5YXZydmwvSDY5bE5hQzlJRlVVTjhSTFpQWk5haXdV?=
 =?utf-8?B?MXlSYjhMSXhWRk1vZWFUdnJZVGI3MGFRbXZXZWRxZHY0QkozN3ZvSTRoOWkr?=
 =?utf-8?B?dUd4ODhBWWNmakQrcXB5ZEtSaHVYNlpVVDhLQzFhejI2Nmd6NUFBdWRaRTBC?=
 =?utf-8?B?YlVRUWlwU0JtUE12bktjNFRoWTd0djczWE9mRzdyUXc2QzUwaHFYaFc2WFhn?=
 =?utf-8?B?NTU0azhjT2hMUEw3VFpOWlNJZ0g3d1grdGY0cjJmWkQvSHNLcVcyOEdBM0Zu?=
 =?utf-8?B?NzFOblZheHZaS09ob3NxSXVicVJmMWVTQVlnTkNVVVBDNnJTeU9CUjZKQ1Nn?=
 =?utf-8?B?anlVRHJ1Q0pUajZUbkV5YUZ1SjFaNHJ3bTdrOXp3dHdCZ3dsR0NhQ3R6ZzZV?=
 =?utf-8?B?YjdmVytxUHU2dHZaR3RGQ2J3TDdieS8xUlZtNFkzMEJMT0lZdmZJaGpGbnYz?=
 =?utf-8?B?eXdhcEdiV2pBdFhmWVE2RUtZMDRJMEdrc0dnN2ZjcXNVQXA4R3l2RWMrb1BQ?=
 =?utf-8?B?RnEyQmpJY0kyVzNoMEcyQnVGQlZERkoySXFxREdzSFJ6NzFPTnhlTDRSOC90?=
 =?utf-8?B?elhEdDB4S1Z0TEUyTStIOVJGRXNwUklpbmpsMHVhRUZkRWRCSkpCMExyemN5?=
 =?utf-8?B?TjFlYzRuam4wM2pYc3ZEMXU1ZURrSHV3YTlNMTYyTndUcVNNMEFPTEQwUmxu?=
 =?utf-8?B?QThMNkRlNGVqNXJNYUdncXk2Qm5lNGpQZ1hYRUdHMklWbGRGNE14c2JJS3Vm?=
 =?utf-8?B?WS9rTUZ5eE5lODdqYngyTkF4b2Z3ajd1TThIRkxUdGNubk85ZlpmTmNZVmh1?=
 =?utf-8?B?VDN1bFN6eWRTRU9TbmhsYnRPY2tvTjhIWFpqdndBWUhrWm93aWNqZ0xWSlZW?=
 =?utf-8?B?MDBhZytJN1NaVXhlUkdRRjV4SURCbVRXNU9VdmFRWUY0Nlp2VHUvTC9aMHBG?=
 =?utf-8?B?dUkvRzRzSEkrZy95SUZxQzhobFg0M2pxWWo5Lyt5clRDQTFZQVRrdE9qVUtS?=
 =?utf-8?B?aE1vaGxiZ0t2cVpYTTNNVmR2d1dheHJjUFdmQllBN3p2cW9CVkdCdHZkeDU3?=
 =?utf-8?B?bkE2cExhQndvSjMwallvOFMrRDRIVmsxK0dnNHBhTEpaRWlmU0pZc3VCZzdG?=
 =?utf-8?B?MHNQWnRzSlFpWFNmNGo2Z1VxcXYvdnBESTc5Mkt1clFGZy9VdWoyL3k4SmN4?=
 =?utf-8?Q?aQob92//auepo5OQ9+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MK6x/HhP630b1Aptf0qnbBbNv+Xbc0U+Fe9qs0vKv46VFvgO7zytpJdJ9jQyuz9h4HXtC/T7dNCPeW2djOF69PgxuYmtnr7+92wxZHl5eTbVHDWxYzqK3MPTkBzBD13mbZRaLmkyqcjsbgHCTOQkHVwAvo3ZBdvFthCeA4KjHblir6S/A02hhv8mDdQDDrZpu6ErQ2rqcPf9xefC8ZAiJLVE/hqEmPBy8xsoZxihWcx7qbFe/6dWqSvgd4k/wya60PePuPkaHM21uKXExloutyhTTUiCZnACVpAKskU9TgsDyWEjVjRmIMZapH7pgEJ/R55dS0Wp/5D2H+gmZZgyLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9b4c08-7f57-46ae-4d46-08df18b97d29
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 14:55:05.7473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsOPMJn56oUFVeldeshheKLQip4eg0F4eTvKHMf1ob8RFX9w9R8WW4WH5wEG4/Jc5QWU7Zx7lwSl75mRJuA2ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB4401
X-OriginatorOrg: amazon.com

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMDI6NDY6MDBQTSArMDIwMCwgUm9kb2xmbyBHaW9tZXR0
aSB3cm90ZToNCj4gT24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTA6MzA6NTFBTSArMDAwMCwgRWxp
YXYgRmFyYmVyIHdyb3RlOg0KPiA+ICsgICAgIGlmIChJU19FUlIoZGF0YS0+cHBzKSkgew0KPiA+
ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgSVJRICVkIGFz
IFBQUyBzb3VyY2VcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRhdGEtPmlycSk7DQo+
DQo+IFRoaXMgc3RheWVkIGRldl9lcnIoKSB3aGlsZSBib3RoIGl0cyBuZWlnaGJvdXJzIGJlY2Ft
ZSBkZXZfZXJyX3Byb2JlKCkuDQo+IE5vdGhpbmcgaXMgYnJva2VuLCBidXQgIm1hdGNoZXMgdGhl
IHJlc3Qgb2YgdGhlIGZpbGUiIHdhcyB0aGUgYXJndW1lbnQNCj4gZm9yIHBhdGNoIDEuDQoNCkkg
bm90aWNlZCB0aGlzIHRvbyB3aGlsZSBkb2luZyB0aGUgY2hhbmdlcywgYnV0IHdhc24ndCBzdXJl
IHdoZXJlIGl0DQpzaG91bGQgZ28sIHNvIEkgd291bGQgcmF0aGVyIGFzayB0aGFuIGd1ZXNzLg0K
DQpUaGUgYXdrd2FyZCBwYXJ0IGlzIHRoYXQgcGF0Y2ggMSdzIGFjdHVhbCBmaXggaXMgcHJvcGFn
YXRpbmcgdGhlIHJlYWwNCmVycm9yIGNvZGUgLS0gdGhlIC1FSU5WQUwgLT4gcmV0IGNoYW5nZSBv
biB0aGUgZ3Bpb2RfdG9faXJxKCkgYW5kDQpyZXF1ZXN0X3RocmVhZGVkX2lycSgpIHBhdGhzLiBU
aGUgZGV2X2Vycl9wcm9iZSgpIGZvcm0gdGhlcmUgaXMgYQ0KY29uc2VxdWVuY2Ugb2YgdGhhdCAo
YW5kIG9mIHlvdXIgdjQgbml0KSwgbm90IHRoZSBwb2ludCBvZiB0aGUgcGF0Y2guDQpUaGUgcHBz
X3JlZ2lzdGVyX3NvdXJjZSgpIHBhdGggbmV2ZXIgaGFkIHRoZSBlcnJubyBidWc6IGl0IGFscmVh
ZHkgZGlkDQpyZXR1cm4gUFRSX0VSUihkYXRhLT5wcHMpLCBzbyBjb252ZXJ0aW5nIGl0IGlzIHB1
cmVseSBhIGxvZ2dpbmcvc3R5bGUNCmNvbnNpc3RlbmN5IGNoYW5nZSwgdW5yZWxhdGVkIHRvIHdo
YXQgcGF0Y2ggMSBzZXRzIG91dCB0byBmaXguIFBhdGNoIDQNCmlzIG5vdCBhbiBvYnZpb3VzIGhv
bWUgZWl0aGVyOiB0aGUgZGV2X2VycigpL2Rldl9lcnJfcHJvYmUoKSBzcGxpdA0KcHJlZGF0ZXMg
aXQgKGl0IGV4aXN0cyBmcm9tIHBhdGNoIDEgb253YXJkKSwgc28gcGF0Y2ggNCB3b3VsZCBvbmx5
IGJlDQp0aWR5aW5nIGl0IHVwIGluIHBhc3NpbmcgcmF0aGVyIHRoYW4gaW50cm9kdWNpbmcgaXQu
DQoNClNvIEkgc2VlIHRocmVlIHdheXMgdG8gcGxhY2UgaXQ6DQoNCiAgMS4gRm9sZCBpdCBpbnRv
IHBhdGNoIDEuIFBybzogcGF0Y2ggMSBpcyB3aGVyZSB0aGUgZmlsZSBmaXJzdCBnYWlucw0KICAg
ICBkZXZfZXJyX3Byb2JlKCksIHNvIGFsbCB0aHJlZSBwcm9iZSBlcnJvciBwYXRocyBiZWNvbWUg
Y29uc2lzdGVudA0KICAgICBpbiB0aGUgc2FtZSBjb21taXQuIENvbjogaXQgd2lkZW5zIHBhdGNo
IDEgYmV5b25kICJwcm9wYWdhdGUgdGhlDQogICAgIGVycm9yIGNvZGUiIGludG8gYSBwYXRoIHRo
YXQgbmV2ZXIgbWFza2VkIHRoZSBlcnJvciwgbXVkZHlpbmcgYW4NCiAgICAgb3RoZXJ3aXNlIGZv
Y3VzZWQgZml4LiBJdCB3b3VsZCB1c2UgdGhlIHJldHVybi1mb3JtDQogICAgIChyZXR1cm4gZGV2
X2Vycl9wcm9iZSguLi4pKSwgd2hpY2ggcGF0Y2ggNCB0aGVuIHJld3JpdGVzIGludG8gdGhlDQog
ICAgIGxvZy1vbmx5ICsgZ290byBlcnJfcmVsZWFzZV9waW5zIGZvcm0gbGlrZSB0aGUgb3RoZXIg
dHdvLg0KDQogIDIuIEZvbGQgaXQgaW50byBwYXRjaCA0LiBQcm86IHBhdGNoIDQgYWxyZWFkeSBy
ZXdyaXRlcyB0aGVzZSBwYXRocw0KICAgICBpbnRvIHRoZSBsb2ctb25seSBkZXZfZXJyX3Byb2Jl
KCkgKyBnb3RvIGZvcm0sIHNvIHRoZSBjb252ZXJzaW9uDQogICAgIHJpZGVzIGFsb25nIHdpdGgg
Y2h1cm4gaXQgaXMgYWxyZWFkeSBtYWtpbmcuIENvbjogdGhlDQogICAgIGRldl9lcnIoKS9kZXZf
ZXJyX3Byb2JlKCkgc3BsaXQgcHJlZGF0ZXMgcGF0Y2ggNCAtLSBpdCBleGlzdHMgZnJvbQ0KICAg
ICBwYXRjaCAxIG9ud2FyZCAtLSBzbyBwYXRjaCA0IGlzIG5vdCByZWFsbHkgd2hlcmUgdGhlIGlu
Y29uc2lzdGVuY3kNCiAgICAgb3JpZ2luYXRlcy4NCg0KICAzLiBBIHNtYWxsIHNlcGFyYXRlIHBh
dGNoIGFmdGVyIHBhdGNoIDEsICJwcHM6IGNsaWVudHM6IGdwaW86IHVzZQ0KICAgICBkZXZfZXJy
X3Byb2JlKCkgY29uc2lzdGVudGx5IGluIHByb2JlIiAob3Igc2ltaWxhcikuIFBybzoga2VlcHMN
CiAgICAgZWFjaCBwYXRjaCBzaW5nbGUtcHVycG9zZSAtLSBwYXRjaCAxIHN0YXlzICJwcm9wYWdh
dGUgdGhlIGNvZGUiLA0KICAgICB0aGUgc3R5bGUgdW5pZmljYXRpb24gaXMgaXRzIG93biByZXZp
ZXdhYmxlIGNoYW5nZS4NCg0KV2hpY2ggZG8geW91IHByZWZlcj8NCg0KVGhhbmtzLA0KRWxpYXYN
Cg==
