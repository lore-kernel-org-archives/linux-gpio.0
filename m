Received: from iad-out-010.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-010.esa.us-east-1.outbound.mail-perimeter.amazon.com [34.197.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4BA52F28A;
	Tue, 22 Sep 2026 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=34.197.254.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071749; cv=fail; b=EY/MWjAUEnUKBwvegj8dpkLhANsifCP4ljfGcFgNCwLn9gKo/Tcjfcio8BOfYhFT0yAQY00+FKjWq2gBZeNqhkN4E0/OtNl9xrdV4tBu+PpGlHp6/sVcLcmAbOvJRo7ZZ3TFuQWsmjHM8o+nCWU3VH7/fQPebj8rTq1jLq0E0Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071749; c=relaxed/simple;
	bh=IS90ghmmsTGLPBm1BIfxGDVJuJtj0HMkbjqIDVRE3vM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DPfHfiNxAK+Xx7nIdf0FaAIbx/Na3S8q8NseHr72LtBOuiUdTyga1EQOwaSk0mgk85G6IZgBXOutXW3cGmcTCOnBzNmuSBZA24HM/W3CJT8l7NyZ3x6XD0pPZZdCt+hX6jRGp7B1rpgmsNBF1LpkpJMUeyy6aYa6R0gklPjBZk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=aesDg29C; arc=fail smtp.client-ip=34.197.254.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="aesDg29C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790071746; x=1821607746;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IS90ghmmsTGLPBm1BIfxGDVJuJtj0HMkbjqIDVRE3vM=;
  b=aesDg29CPWETYJ5w9aUvePgxYML7gP4h2cXrhS6nRoIcd/CK3DgSiZBR
   jUBPVkWxujyyPYi6SwLjWkFK8kd3E5absRFvSquIIH4815v6/ntnAsG1b
   ZF9H3/3aP35Mwn7n8em/rGZTzgpB9sGtKxHTvN7tBmjk/zlWrNopdNmUZ
   zYask74UoBLqG20wRdy1wkZMl400B2swdollBrKySeu8ApG6VRHaAUvGH
   cQ3B/yBniYjolBoyT6Hmk2ByMrFEg0kDZTxF3NuM5hWpXtJBRBnFldhMD
   Lmz0Euuy22CmwfGf57WvU2dJe964DfU5d/3yBRToOdA4zDCXSWG/P7zsB
   A==;
X-CSE-ConnectionGUID: 9ZDSP3BnQoyc5jJTTugRXQ==
X-CSE-MsgGUID: bdlxDCFdRBO40nr0o1YKQg==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="27632099"
Received: from ip-10-4-7-229.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.7.229])
  by internal-iad-out-010.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:08:58 +0000
Received: from EX19MTAUEC002.ant.amazon.com [52.94.133.130:21884]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.40.172:2525] with esmtp (Farcaster)
 id 686723f3-2a08-40ee-a81b-010a8a6ec1f6; Tue, 22 Sep 2026 10:08:58 +0000 (UTC)
X-Farcaster-Flow-ID: 686723f3-2a08-40ee-a81b-010a8a6ec1f6
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:08:58 +0000
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:08:58 +0000
Received: from DM2PR0701CU001.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Tue, 22 Sep 2026 10:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFGSv076pcgpUPLG6H3uDtzM0S+CacAPknWXgBmcJGHjz5TnmE1aQvddjAj5MiWIhDBPrkwL/DSrrBCrY7RoruSHP2/1RnhY8+IRRQkbvjH7hKGR25FkRu5IYfmt7uZscJzNBmMbaSycoooxrQDDxKVhCzkf85xZ3qxWiPqHhuaCaH+52Z7UZ6/Aa6Xhvrcphtmr8/ThFnrpj6fVItdmB1rjSCzu3d8aHkS2dJE1kiQTFeo5ETnAw8HEHsNwx4J5VNNYBnd0T7HO3vq++ZmpmbUneXDZCWs5C+KvfePfZDURQU/fpPBbC/luNSJ0UgGDJ9rUzEXwOexzhgZZRXAlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS90ghmmsTGLPBm1BIfxGDVJuJtj0HMkbjqIDVRE3vM=;
 b=Hwf6uRFfV45rOPvFxy8dICy9O8j/ZMJjdYEERQAhiMRmUYesuju4NNkap3SxskVdaVa/YFg7XGIcMfY9oBjs+Gl5qlvUgq9BveWqiBtx5C6tcGHh6kTYuEp7ZckoWLykVQYsuD3P9NYp6mRk+rPckm0CI6Ms/vmhJUC4+SBoCQ5mbTrUCTIM0SIYfy8bB2ZOL72LR0meOzqr2fBLXRiA4RyFi+KO13HhwoAaL3h85vp/ZALb+qZSo5+KLwlt44P8U9b8kpajN51+NBUO/vOkrGflVSuJy/SD1Pr1MrG+eudRrc6dICwfrMubldJXf1XLyWUDUXaxMmuHrRUcu/OMpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by PH0PR18MB4508.namprd18.prod.outlook.com (2603:10b6:510:e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:08:54 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 10:08:54 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 0/3] pps-gpio: restore pin mux on unbind and shutdown
Thread-Topic: [PATCH v4 0/3] pps-gpio: restore pin mux on unbind and shutdown
Thread-Index: AQHdSnpfdFkUi1FkeU2Km/jPOAo1CA==
Date: Tue, 22 Sep 2026 10:08:54 +0000
Message-ID: <BY3PR18MB4722D0C97A7B107141D05DF2C6832@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-1-farbere@amazon.com>
 <6ffa766f-9a99-41d0-b5df-6c517d1e94e6@enneenne.com>
In-Reply-To: <6ffa766f-9a99-41d0-b5df-6c517d1e94e6@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|PH0PR18MB4508:EE_
x-ms-office365-filtering-correlation-id: fc58da70-a6ae-4258-96b4-08df18918279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 5PY2ikn2wWEcYo+mLhUKWLZxuHtFOnTKtWCfA9Hu1LG6Zvtvh2HE8cRZFK+bKZR49M2imZW0tFT4aKmenQ6Eji1/k901o9HmK1LbPQDvfvEET16CJRvxd654YPJgh5fcae8+WPtIOfctsKmJ7MwYcnq0rLThWXJraB1odm60EmJNguNiA8wteOmZQratPwUFrDcsPR0SImqNQchrIYdZ1UJxQtmiwVZ6YoPvWWyHMqlFUpLyZ8YVnRz7nahcH3lUHJFbGXvRy4/qysLAX+zwgnTrsa/uPP3QZZMdfKxiUJeyD0btLia37oXhu6vn7m/Nkc7jlk4im+tEy+a+nmi/rccZL+1x+MZX31dCL4SpxGB0zCkXIj8RhrQP68ikRYRVAgbKxxelb0/WSfXAEYZmR8w8oBOnjodX7EQzrosCNbYKr0MVRMYcTUHPc3hKlFoNcjJf212EPKWv0d6V3SQLCbNvhJk+ueVFwMSxkF8iMDgCwSTmuwVrz6TMPGN7w2ghLj2lb63h8n8YPCIiDa0qWyLUi7nVAK3qGu2a6/havJukqUtHF4Il+Z2ZweUEV040Zj+4qd3nbFmSfSv0EYHjTUsqUKqBSlQgEMghfY03BMiFpqoDLJ/7fIycrpEKgzdlbjeSef3+lcBnGWJXe3QcYVEb3L4DbxaSrtBrg7YmkFQdFSqwhsZCEfe/qyGGINXF5Dz7NzDe8XZhS0LiPVyZUCSs/jON8xPszJ5dtRyOfW8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OCs2eVBkaWtSL0h6SkszQzV5WWU2NTRXbWxUenc2YnJKVGMxMTVEMGsrRkdK?=
 =?utf-8?B?aTB6clVWQWRFajNjeU5RazJFU1pvR2I1akI3a0VTMlVPc3EzM2pzOUY5WTRY?=
 =?utf-8?B?cWFjUjF5SmNWVFg4Y1YrU3VvK2NtOVVQZUZuVGpZL1hrYU40T1ZDcjZQTWI5?=
 =?utf-8?B?cTIxTFRNcUNEUEZJcTM2TWpZODkyQUxMTWhhQXg3ek1XWVJaNW5nMUNmU0ha?=
 =?utf-8?B?ZUdTOEpSNVg4YU5QZDMxcFc0VC9ESE52bzN3b0RIY3dpYzU0OTVVV2c5TGtO?=
 =?utf-8?B?K01qd29XeVEzRlowMWMrNWhVRzB3TDFjQnQwN3llV1kxSGF6MWoyTGtjcGIz?=
 =?utf-8?B?UlJidDdhZWhjZGt6eHIrQVkyRThxdWlaWk05UGVpQlFHbzBhTUxJcjBBOVhW?=
 =?utf-8?B?Tm8xNjNuVGx0OUkvallTR0pFS29CNTZJbzZvR1RQK3NGenNQN2Q2Y2grY2Vw?=
 =?utf-8?B?dFd6blNrblZhTEpWMU9rZGpxNmtob0QwVXNPVXVGRFk1NmRRa3llaUFFS3dO?=
 =?utf-8?B?YTQxMXhheDQrTm92NjJCMklHMzc1ZktVTzFEMUw4SFplNitwbHNxb1Q5LzBh?=
 =?utf-8?B?R2xHNHZLemZvaW52WHViNVNlOFI4V3Jsd1ptRzRWT2JxQkNPbzYzbVA4M0t5?=
 =?utf-8?B?emF0QVhsZXZ6bUtob0pEeHo4dWFWaEQ2OFhGTnFKcGZSbkZNaVdjcDV6YVlK?=
 =?utf-8?B?ZGlLUXBDTkFvWVVucHVUTytKMWE1eC9GV0FqMnRLYzF1V0xNeXpuWHpqZFlo?=
 =?utf-8?B?QkoxRzlsSm5YaEIwaDgwTUNFay9HamV5ZlN3QVNubkZhUlE4L0VQdDhNWWFi?=
 =?utf-8?B?SGRZMWxEWGNZM3JqY3pTV3VQOG4zVFJCdE95d21TK2tXT3dZZ0pxdTd2SkpE?=
 =?utf-8?B?cTdWeWNQYUtTbTk2N0dTZ1dzN0xvYzZoZXljT1ZCVVdKR1hJc2Nmb0lOVVpL?=
 =?utf-8?B?enBJRytxcDJGL0ViZEJvU1Vjb1U0SjM0YktaLytYczNyQUEwRjFtYjJSMzN5?=
 =?utf-8?B?Y3hIT09JS3J1U0RRYXYxQkxKOVZ4ZU1DQUFXU25RRDlTdmVOWGd0RExPa1dK?=
 =?utf-8?B?NDhRazZiZDB5R0E2WWZ1cTE4WklBVEczd1hUQU1jU01PWVdQNEtlVURoelNT?=
 =?utf-8?B?Z2xIM25nT0d1UENEVXpOeXEvTjc1WkFza1pVZjlZM1NOb2NBbEsyaGx0Sm5o?=
 =?utf-8?B?bElmclY0Z21rVGFOVmdIdTk3blQreWl3Y2pMYWN0RlN0S0JjOEJpa2dsWEJY?=
 =?utf-8?B?ZkdVbC9lRXZTRkNndTd6ODQyQlhFUG9uY1QwRk1nQUc1TnlNSndhUnlSV1g1?=
 =?utf-8?B?UjlYQ0J2VGtyQk5JcVVwWU55TFIrZ3FlRyt3NmFOcWY2K0lURk1tK3R5QmIw?=
 =?utf-8?B?Vm9GendSaDFEUzlaRTdoMzNPQ2hiMGxCYStQNlRpUzJ3SDJTaWtucHZRanBv?=
 =?utf-8?B?Q3gxRnI3M3h1VFZDSWNaajR2c0JDZzI4cS9KeHhDU3pwMTRvN3M0VzFsdVJT?=
 =?utf-8?B?Y2ozNjZsSWpOOHBGcXdJVE9kamNDZHc3SFZoODRUbktiK0MrOWtmN3pUenk2?=
 =?utf-8?B?RU1WcGNWWkpoeUFJcVNjNnFaaTdvZG9PaXZRSlZONFVpRVF3RjZ1MFhlc2JS?=
 =?utf-8?B?MVloc3h1TDRPQXNUUWRXeHloRXJzUWVqTkNVRDBkVlhJZFliK1pwYzRFQ3FC?=
 =?utf-8?B?TURNT3BodS9tVEdwSlo0L3F1NkgwKzRpMm5pZWhDcmdiWTZSWnFTMmNETWVY?=
 =?utf-8?B?R1ZoMkNmTk1RZ0RSdlYzampPUE5aLzNNTCtpbTUvRnlDKzdDR1dLWkw1dmxv?=
 =?utf-8?B?M1lNbWUvQWd4cU5jdVFLQU1wQ2E1STJSY3kxZTBhdkRlNTlybENyelpKN0xX?=
 =?utf-8?B?cHBLZmIybFNqbFkrOEhtVjFlc1hOSHBGNnJYRUFhN2NHcnNOb1NtREkzaVZS?=
 =?utf-8?B?UE1aQnFGcy9WNmxUOXNpSjNpc0FwVG1RMXpYRXM0WHlrWUorODVSRC9LcTJU?=
 =?utf-8?B?L3FrWnlCVXllZDdzVHlxald3NzgyQ2loR1dERWtQYm9iZGNrdDN3QWUzbW1C?=
 =?utf-8?B?OGRmeTBVckNtT3Zad1FUVk5Zak9EUjgzWG5LN0dkMkg1eVg0RGtQeFNKQitI?=
 =?utf-8?B?am5yai9oVlY2S2xnZHVzL04xNE9hM3luV0ttSHlFTXE5NnJtQytLYTVKeEdI?=
 =?utf-8?B?TVBuRnhZL2RkY0FFUGRaaTFlTnZ1NGtYUXN3Ym9IdlU1OEkvblJxZUtiR0gr?=
 =?utf-8?B?eUxJM0RqV0NmWjZ0OGZ4dGhIQTEwbWc3OVh5SnJpMFdyUlA4RlpWTUxhUDRK?=
 =?utf-8?Q?pexBbUsNLGEyUxvHnb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Sf7X4mE3FXFl3hTCKY55ZCS00Q/93Y5eaD3T3ZQnp5+KJNpMZe27R/X1oFK//Iu3PGY4ak/sFsrGNVGJdw2UC0Bs1QOOaPUrykrNOkar+aMXdaFCRHZZdIGiINChAJAK0UxKmk4d5gx/X4O+BLndr38RskWeP1ZCtiqnx7d9c8Zf7UGyUPjSLuT6SANdJJaDDfB/gYpC6lu0iXtwgUYRqMGSrfHQ8SVU6xoRMqGFDU69xEL1x1lcMUOdXkJjXs1EgF4V0/s/YdP7dbnD/cBYiWnsk5n/6pryuSpcM9UHmT6KpDOM7QwZea9GhSMUqE8f5nK/F/rD1WPzqjN7/3elVg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc58da70-a6ae-4258-96b4-08df18918279
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:08:54.7731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rx63ZCBO1g/Ke7SA3k9CM2icXHJVhyetO741ZYV3AtqAHZK1yzBgHOn/v5xKcpEqVMXZU2SjjdgfBPQ8zhy3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4508
X-OriginatorOrg: amazon.com

T24gTW9uLCBTZXAgMjIsIDIwMjYgYXQgMDk6NDA6MDBBTSArMDIwMCwgUm9kb2xmbyBHaW9tZXR0
aSB3cm90ZToNCj4gT24gU2F0LCBTZXAgMTksIDIwMjYgYXQgMDU6MTE6NTRQTSArMDAwMCwgRWxp
YXYgRmFyYmVyIHdyb3RlOg0KPiA+IE9wZW4gcXVlc3Rpb24gZm9yIHRoZSBtYWludGFpbmVycyAo
cGF0Y2ggMyk6IGEgcHJvYmUgdGhhdCBmYWlscyBiZWZvcmUNCj4gPiBwcHNfZ3Bpb19nZXRfcGlu
cygpIGhhcyBydW4gLS0gZGV2bV9remFsbG9jKCkgb3IgcHBzX2dwaW9fc2V0dXAoKSAtLSByZXR1
cm5zDQo+ID4gd2l0aG91dCBnb2luZyB0aHJvdWdoIGVycl9yZWxlYXNlX3BpbnMsIHNvIHRoZSBw
aW5zIGFyZSBsZWZ0IGluIHRoZQ0KPiA+IGNvcmUtYXBwbGllZCAiZGVmYXVsdCIgc3RhdGUgcmF0
aGVyIHRoYW4gImluYWN0aXZlIi4gSSBkaWQgbm90IGNoYW5nZSB0aGlzDQo+ID4gaW4gdjQgYXMg
SSB3b3VsZCBsaWtlIHlvdXIgZ3VpZGFuY2Ugb24gdGhlIHByZWZlcnJlZCBhcHByb2FjaDsgdGhl
IHRyYWRlLW9mZnMNCj4gPiBhcmUgbGFpZCBvdXQgYXQgdGhlIGVuZCBvZiBwYXRjaCAzJ3MgY2hh
bmdlbG9nLiBJbiBzaG9ydDoNCj4gPg0KPiA+ICAgQS4gTW92ZSBwcHNfZ3Bpb19nZXRfcGlucygp
IHRvIHRoZSB0b3Agb2YgcHJvYmUgYW5kIHJvdXRlIHRoZQ0KPiA+ICAgICAgcHBzX2dwaW9fc2V0
dXAoKSBmYWlsdXJlIHRocm91Z2ggZXJyX3JlbGVhc2VfcGlucyB0b28sIHNvIGV2ZXJ5IHBhdGgN
Cj4gPiAgICAgIHRoZSBkcml2ZXIgY2FuIGFjdCBvbiByZXN0b3JlcyAiaW5hY3RpdmUiLiAoVGhl
IGRldm1fa3phbGxvYygpIGZhaWx1cmUNCj4gPiAgICAgIGlzIGluaGVyZW50bHkgYmVmb3JlIHRo
ZSBkcml2ZXIgaG9sZHMgYW55IHBpbmN0cmwgaGFuZGxlLCBzbyBpdCBjYW5ub3QNCj4gPiAgICAg
IGJlIGNvdmVyZWQgYnkgdGhlIGRyaXZlciBpbiBhbnkgb3B0aW9uLikNCj4gPiAgIEIuIEtlZXAg
djQgYXMtaXMgYW5kIHRyZWF0ICJpbmFjdGl2ZSIgYXMgYSBzdWNjZXNzZnVsLW93bmVyc2hpcCBj
b25jZXJuOg0KPiA+ICAgICAgYSBwcm9iZSB0aGF0IG5ldmVyIGxvb2tlZCB1cCB0aGUgc3RhdGUg
bmV2ZXIgdG9vayB0aGUgcGlucywgc28gbGVhdmluZw0KPiA+ICAgICAgdGhlIGNvcmUtYXBwbGll
ZCAiZGVmYXVsdCIgKGxvbmctc3RhbmRpbmcgYmVoYXZpb3VyKSBpcyBhY2NlcHRhYmxlLg0KPiA+
ICAgQy4gQXMgQSwgYnV0IGtlZXAgdGhlIHJlbGVhc2UgaGVscGVyJ3MgZXhpc3RpbmcgTlVMTCBn
dWFyZCBzbyBpdCBpcyByb2J1c3QNCj4gPiAgICAgIHJlZ2FyZGxlc3Mgb2Ygb3JkZXJpbmcgKGJl
bHQgYW5kIGJyYWNlcykuDQo+ID4NCj4gPiBJIGxlYW4gdG93YXJkcyBCICh0aGUgcmVzdG9yZSBp
cyBtZWFuaW5nZnVsIG9ubHkgb25jZSB0aGUgZHJpdmVyIGhhcyB0YWtlbg0KPiA+IG93bmVyc2hp
cCksIGJ1dCBJIGFtIGhhcHB5IHRvIGltcGxlbWVudCBBL0MgaWYgeW91IHByZWZlciB1bmlmb3Jt
IGZhaWx1cmUNCj4gPiBwYXRocy4NCj4NCj4gSSB3b3VsZCBjaG9vc2Ugb3B0aW9uIEEsIGtlZXBp
bmcgdGhlIE5VTEwgY2hlY2sgaW4gdGhlIHJlbGVhc2UgaGVscGVyOw0KPiBJIGJlbGlldmUgdGhp
cyBjb3JyZXNwb25kcyB0byB5b3VyIG9wdGlvbiBDLiBJbiBmYWN0LCB0byBtZSwgaXQNCj4gcmVw
cmVzZW50cyB0aGUgc3ltbWV0cmljYWwgY291bnRlcnBhcnQgdG8gd2hhdCB0aGUgY29yZSBkaWQg
b24gdGhlDQo+IGRyaXZlcidzIGJlaGFsZi4NCg0KRG9uZSBpbiB2NTogcHBzX2dwaW9fZ2V0X3Bp
bnMoKSBub3cgcnVucyBmaXJzdCBpbiBwcm9iZSgpLCB0aGUNCnBwc19ncGlvX3NldHVwKCkgZmFp
bHVyZSBnb2VzIHRocm91Z2ggZXJyX3JlbGVhc2VfcGlucywgYW5kIHRoZSByZWxlYXNlDQpoZWxw
ZXIga2VlcHMgaXRzIE5VTEwgZ3VhcmQgKG9wdGlvbiBDKS4NCg0KPiBPbmUgdGhpbmcgSSB3b3Vs
ZCB2ZXJpZnkgb24geW91ciBib2FyZCBiZWZvcmUgcHJvY2VlZGluZyBpcyB0aGlzOiB3aXRoDQo+
IG9wdGlvbiBBLCBhbiAtRVBST0JFX0RFRkVSIGVycm9yIHJldHVybmVkIGJ5IHBwc19ncGlvX3Nl
dHVwKCkgd291bGQNCj4gcmVzdWx0IGluIHRoZSAiaW5hY3RpdmUiIHN0YXRlIGJlaW5nIHNlbGVj
dGVkLCBhbmQgdGhlIGNvcmUgd291bGQNCj4gcmUtYXBwbHkgImRlZmF1bHQiIG9uIHRoZSBuZXh0
IGF0dGVtcHQuIEkgYXNzdW1lIHRoaXMgbXV4IHN3aXRjaGluZyBpcw0KPiBoYXJtbGVzcywgYnV0
IHRoZSBoYXJkd2FyZSBpcyBhdmFpbGFibGUgdG8geW91LCBub3QgbWUuDQoNClZlcmlmaWVkIG9u
IHRoZSBBTDExIEsyVjYgSlJEMTA6IEkgZm9yY2VkIHBwc19ncGlvX3NldHVwKCkgdG8gcmV0dXJu
DQotRVBST0JFX0RFRkVSIGEgZmV3IHRpbWVzIGFuZCB3YXRjaGVkIHRoZSBwaW4tbXV4IHJlZ2lz
dGVyLiBFYWNoIGZhaWxlZA0KYXR0ZW1wdCByZWxlYXNlcyB0aGUgcGlucyB0byAiaW5hY3RpdmUi
LCB0aGUgY29yZSByZS1hcHBsaWVzICJkZWZhdWx0Ig0KYmVmb3JlIHRoZSBuZXh0LCBhbmQgaXQg
c2V0dGxlcyBhdCAiZGVmYXVsdCIgb25jZSBwcm9iZSBzdWNjZWVkcyAtLSBubw0Kc3B1cmlvdXMg
UFBTIGV2ZW50IG9yIHdhcm5pbmcgYWNyb3NzIHRoZSBjeWNsZXMuDQoNClRoYW5rcywNCkVsaWF2
DQo=
