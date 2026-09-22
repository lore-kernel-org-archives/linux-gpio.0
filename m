Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647034F4D13;
	Tue, 22 Sep 2026 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.13.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072017; cv=fail; b=VvC4FG3ZZwVOsyJBYWikO5D/m4Xgs/TWA9Cks6F6b0Ng8TUshpxsklzRDXUaU7RCxLxE6VjlSuKBIltKuqCAFeprcCQirEF7C8zRtcRLSJPt94VU9DIb2vw2lt8EeuVUQ+G4NGfj611/npXIGmhzMwL4GGlprqi5H7elDbYM3po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072017; c=relaxed/simple;
	bh=ulWhrbHtBRCuhjrDYcuoE/RGlIv/hoGkSbbhYJ0FUM4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h+Ydv0Vo+8NxU8uziwrLMI7nTCwkJzz1xp84+BoxNFnry4UO6Cn9cGFzPAcWZdCe5TNBpNTU3I9hzi+yQT8dIqpBFJoA0V8YzCpjyKxWQarC0FmmiZcMOKVE8AJVXSiew5r+nSjAszf7+ABNH7YoL3Ge7josqhyGxVboKoIqOXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ATwG8b2f; arc=fail smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ATwG8b2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790072016; x=1821608016;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ulWhrbHtBRCuhjrDYcuoE/RGlIv/hoGkSbbhYJ0FUM4=;
  b=ATwG8b2fOPs0XMv9neDsHX1wYq5ypEB1wTsWrg7lZuxV/oSxstx724H8
   pxDqdFFAq3whtKRLXxYL7Ls9bPDf97sN1L9iuVOKrULwMF+VC6i+xjPbA
   W4Xy1hB7c2RWW+7Xb+cLLAcRkiNr13VDk0uxIqWuI2RnUSsXpWd+1yYz6
   6wQ3KmmWQi8uvDx+ePxi+qFZsgt6Xa7mB6y8AHGdw/hrEg6rNZK3Cayop
   ur4+3LNa9j/m3ftTSd/wWDRySSp/0l30OiAi6N4Cgxk2qtmNgjQxrY+O3
   9tSgUvwKS7FdLP+rhrxaQUdtldFl8c68rFY65SblOkw/V3fcFj4o6goBC
   g==;
X-CSE-ConnectionGUID: PlVjGpdHTN+Iqzhj7JsttA==
X-CSE-MsgGUID: JXihwU0VQ9OicM1J0S0Ncw==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="29303996"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:13:33 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:29087]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.208:2525] with esmtp (Farcaster)
 id 0b2bf839-1865-4996-880d-22176518d8b1; Tue, 22 Sep 2026 10:13:33 +0000 (UTC)
X-Farcaster-Flow-ID: 0b2bf839-1865-4996-880d-22176518d8b1
Received: from EX19EXOUWB001.ant.amazon.com (10.250.64.229) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:13:32 +0000
Received: from EX19EXOUWA001.ant.amazon.com (10.250.64.209) by
 EX19EXOUWB001.ant.amazon.com (10.250.64.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:13:20 +0000
Received: from CH4PR07CU001.outbound.protection.outlook.com (10.250.64.168) by
 EX19EXOUWA001.ant.amazon.com (10.250.64.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Tue, 22 Sep 2026 10:13:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5zw57ahGkt8brsjaqg014E0j2ePzVEZZHZjLID3ogQl4bwicG2J4j884fI2LjF8idTFxqWY0rfLhQQppOVVK0WJRVQVnSFYRd5uoQU7C7A7JITjwSitaq79hEbWvbZaHGDOrQcxY1sNCBdXYqz8H5RWOlnqgvY/aViG7J9C5HjJfwIhzagT0q8eXxtk2gDRqBK6X3UD1gPHwU7TyBIaq4TWCozifxj1NqC7VOu9MZo+2SPN45Z7rLZvS0J/iDFMBq8UWpxZ6IeXa4EPzjFT3rMbnIKr3KVSx7d1pjXYc2Wefhl3E264hIApF3wrfBfhotmWWMp/QtkyzsKkAqmJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulWhrbHtBRCuhjrDYcuoE/RGlIv/hoGkSbbhYJ0FUM4=;
 b=YCgig0EtR8eNmRWNO6FgAyK8yA0i4wpTWVzZevs5f3LYlweX2wryyhHEX0GsgaiFbzOsdcDOUvZKMSLrwE1UTQA9CZUZo7c/+kivGQk2mHpxUV0x5G7025mPBA4M3ytp+wPYoQRbbuPTeF5j2wONhT7ucnsBqDHIaDVaDKC1AgmrYFjeRNefhEMjL1X9RCb58SY69Qw3WCxirg5KwzJiR+/VY8FPIJGMZEA5E1gyHA7/26XNTuiy7Lq/MOG1zVoyShqh8j30g/7gmIKYhpiG55tt29XJxUuCXQYpxkGBENYSPfRa2tbEE6pxCtoZ5tIx83z99Qk1+jpq9Q9Al29xSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by PH0PR18MB4508.namprd18.prod.outlook.com (2603:10b6:510:e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:13:17 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 10:13:17 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Thread-Topic: [PATCH v4 3/3] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Thread-Index: AQHdSnr840PjYGh3rke+tbfdpPqduA==
Date: Tue, 22 Sep 2026 10:13:16 +0000
Message-ID: <BY3PR18MB472291281AF63117EE55E988C6832@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-4-farbere@amazon.com>
 <495ec89c-b035-4bc5-9c15-3ddbb108d312@enneenne.com>
In-Reply-To: <495ec89c-b035-4bc5-9c15-3ddbb108d312@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|PH0PR18MB4508:EE_
x-ms-office365-filtering-correlation-id: 322ebbb4-d8fb-476e-47b8-08df18921ec0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: CepoYL/Y1jafASCFB4sD5E5s9aIpFsa+1cN5Wn7ntQdXWzUYRMAfTH3ld97c2bNEtRlfqcSxL2bYZsM9gejc6iNC8bjVFm1rrULwWGIqPsvFJL0GJO+q+i2ZaYtUhNW2Rt8Xb9BnrCKZhvzabX6NCo8/a0wau/8fhiu+bXaNfw82LerTQjMuMGxiBTVm6i1G/OB0XNOvi/1JOUFETGMxxepifhm7ga+HNsqVZVr4sILHHHJNNn6GP74+hmuFxewWCVfeZBVwUE0a8Tkyd9W3o4iA7NlJ+LugU8Zjz3wNF9EqWOabEFsKbsJgR1RyZxQQD2rLFDqWuWppVntmTPDLFg9dE2fk085TEPFCEoCN+MwagYZ213tmamduv1ucytKp5i1Q7swuNS3PL1t3WyXNHtr36Yoq2XCu/RAjeprLeTg1nvMxyzpZQS/x6JxfL9F+8vvb5HPHiF6mNb2LGhKljOF2yQFjcgq6geZM7bTxl5WO9s9RqsAWI4rahlA0YT8LLnYR9e8pgPgsPV8njUM/sHDFoaXj6COzxDQu7RhhOxErbhmdnBZlmfFTlIK/HOaTkX6Lsx1ptoq1iG1XAdcnm5CjS6P77Zgs5Ad4VP2I69XhA3vrPy+e92iT3Wl/cziTSbNEjn3x9v9SG6ZK0FsTbRsgrGrrXex5rOJMpsYUEmhurqgBNYa8WTv8oMa5okRSeXKnvBXE6ZzS7R1vr3LFoJumCQQgRZ8jjQJoi5Tbjg0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWo2ZGN0cHJXcEtqTktnV3BLcWI4a0U5eG41Z2tJbkFUdko4Q0R3RDdLMW1l?=
 =?utf-8?B?M2l1S2Zoa0lmWVdCTGZHMWkwaktZOVRWdlluZFI4aHJ6QnAveGNVS0xTcmRC?=
 =?utf-8?B?aEZmcUlqMFhtNTE1cm8zV2g0eENDajFEK1ArOEdONEM2QVlUQkU5V09obU8x?=
 =?utf-8?B?bldHYVdiWHdXWUNvYzV3cVd0RS9xTnN4eEJWV29wSG9DVkFRRGFtd2RuL3JK?=
 =?utf-8?B?NlQ4aXZvQ0xxbzRURFZ0TDZKSGlCSVVGZzdrZWdhMDNDelJ0QUZTaTk0NjJK?=
 =?utf-8?B?RWwvbG5uMGd5Nk5mb2d5TFF0OXB5MTNJT2VYd2dWUUZmWDZSZUdwejNCeXh2?=
 =?utf-8?B?NHVjbzc0bUl5WENUNTREM0wyWjlwektKT1ZZUXlPcUdoeGdiTndIc25tck5r?=
 =?utf-8?B?bGdRcGFxVU1OSkhvZmgwZ0c1OC95d2tVODEzQzMvN2RTVENmcG5iL0hzVEJP?=
 =?utf-8?B?M0t1K3N0NnlJT2pvOE9wM0pJQkpJZVYrRk1xVVR6eURZQ2J2YzNCM1VoeGpX?=
 =?utf-8?B?cHFVK0xNbjlEZWVZN0ozUVF3TVY2SU5JZVE4LzdlN3RPY1hwTFc2TE5UWmpu?=
 =?utf-8?B?YlE3QlEvaGo4ejVNTDVOczFCOHQ4YUZGRlVoVnVGbEUvTWRzcWF0QjIxbzcr?=
 =?utf-8?B?ZFBtb1V4WHBFNlJ1MWM0QitmNUM3K3NTSXdVV1doaC9uUGZXaVdTNUJ3RSsv?=
 =?utf-8?B?T0dKVGVoL3BwTWFYZ0xwMjJEZmFZYmk1RTk4N1hGcmo5NW5DdXlqNEhWcmYy?=
 =?utf-8?B?Q3Z0R1pma3F2SG5OMC8rd2MwSmwvYmRnUDhRa3RSc2FXZmxmbFF2NHFBcmdP?=
 =?utf-8?B?cnZNLzhIdUpGVlR5b1F6L2RFenVMSTIvTSt0cTJ1V0hNbG03VG14RDNZZzNZ?=
 =?utf-8?B?cWdwTGlzMHJnWmM3bVREUWtrU2JwbmhRY0lYTFNmekluM01qV2tiSEp4N042?=
 =?utf-8?B?Uno2dnJHeXdUcTB5K2Yzc2RKZW9pTmlyaytsQ3lzRXBISVo1S1VvL1JFeDYz?=
 =?utf-8?B?dCtHUUxmTW53MG9kc1pZanpvdmJvVWhxcFdDSXI5ZzYrdjIwVDk3TmVkcGVj?=
 =?utf-8?B?RUtEQy9iaCt1WloyVkhvS0RKbDB5cWluZ2tSV1RyWXpNVlBqSUFja3o4cFNp?=
 =?utf-8?B?dnFVNzF4dGxhcWxkQmhyYi94SW93MTlUc0F5d0wzYmlvOXErU1hpcEVEd0RZ?=
 =?utf-8?B?OWhBUERqMVhtZmt4T3FrWlZUVmtFeDRzZ3UxWE5nbUR3b0syVzdiRW1hSmFB?=
 =?utf-8?B?eGRrRW4vWDVEUlRQYjk2QVJTeFhWdExuR0xRaG5NalJWdkpHRXRDY01CVnB6?=
 =?utf-8?B?TlpTZFNBRUpRK3AreGxtcGxRc1A3ZEd1RFBZRURFMHhMbUJaZUVnRVQycjlN?=
 =?utf-8?B?MnZrdlEwRmRPdnlndVBQeHVVUVh4Ry9haHByOURDNExpNjN5OU5YRkFObzEx?=
 =?utf-8?B?bVd4WEVzWFY1L01kQTUzamRsSlhmZ25rcUtUbzNDR3lBTmUxSzVNMGNtbTMw?=
 =?utf-8?B?WThCcm9iYW5zd3l3bWpNL0pXOGZHWXg1SXBYSDQ3RkZycVh2Nk1Pengya0Rh?=
 =?utf-8?B?SXV0N3YyMjFBUGZUcDQ0YkFuM1NJaWR3c3JNQUI4YUx2UjlIbm1CWVRKUFJr?=
 =?utf-8?B?cGViNytzODZvdlJrYXczNnZQV0RWeFc2YjBkMEhITHBQVkxzTFZFc3BzVWov?=
 =?utf-8?B?cGdXNnd2YUg0U3lWK0pMckFQNG10WmlWeDU2VzYwMC9mWGNuVE9pSE5MSGY2?=
 =?utf-8?B?YWtnbkU3aFBRcjZNVzB5czhVd3BpdTNYdVNxMHk3L1l1OG85RlhEUkpEUzRj?=
 =?utf-8?B?U2dzb3M2cXdtOUpFOHdlQUpYRjR6TS9FQ09LbTdKMXhFbFQ0T25ock02bTIr?=
 =?utf-8?B?dXh2UGlsejJyei9GWitzT2xJbkg0ckI2aU9oaGh1bnZ6ZlBqdTc4YUpxUENI?=
 =?utf-8?B?VytNNXMwdFpadk1TTWpSbzN4YzgydGRUTmkxYUs1LzdpeXZISSs5UnRnYngx?=
 =?utf-8?B?UVpaN2xHdXEvQWh6SEpYbFhBZnVYbG9vZHFuZUdGLzJYN0N2K0MvZVRlT2Vo?=
 =?utf-8?B?UVh0VHA0WU1QUXpheFU5bzFQR0JkMG5ob3Q3aG1nWmo1YzJUeXhCU3dKQUI1?=
 =?utf-8?B?RFdERXBxVVljSEVCMWpjQmFYbVVNS2o3T1NISnZ6M1k1RGg2MTVCbjZnNE91?=
 =?utf-8?B?ZVpaTmp5SWpvUUVnSnVLTndhMmFxdDBsczYxT0xwejQ2YVZsNDBaVlpNWHor?=
 =?utf-8?B?S1hUaENZUDlnZVdhUTg1UDdKV3BBZVVkTHBkWVB5YllTeXBOWWFROEJ0NVFK?=
 =?utf-8?Q?Vmg8btUye4+PuzF8GA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: a1h6BnrS8/bbOcsQd8wWo5zrLGvtBQrlX3KnfmxXGbrHWk+lc+GERH+rUtANKR4z6W1DmVz+H24vIBMrky3crLFcyQLu3YASSkmTSX3UXkP3sTgq+xAJxksnXZZ0yMzSC4brFLUA/Fo79kc6pKaHxqX6een1wR3pnM12KSLWuCbu906/2GvQfPeBSIj6NGaY6GQtjaMAtcyGBdeHgCyTz8XiESvJlcJ5VJAyfMW2NrpxxaB3pOUky8bJ6QUbEvOP85pQ3q2NnIgZxG3GHey8YvAkFdioNchv8n+S2EmV82Jow80bCv73cPb3iBDwB35LkImpa5ZptnvRY2A6CCX3vQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322ebbb4-d8fb-476e-47b8-08df18921ec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:13:16.9562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQGbV4jAwSl7QDWWIMcbtKoU/EATltlbPVeppSGoSjx3e89LnTGdnPxctiosJFjBQbZSRDnMddmQqt+tGfaMIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4508
X-OriginatorOrg: amazon.com

T24gTW9uLCBTZXAgMjIsIDIwMjYgYXQgMDk6NDA6MDBBTSArMDIwMCwgUm9kb2xmbyBHaW9tZXR0
aSB3cm90ZToNCj4gT24gU2F0LCBTZXAgMTksIDIwMjYgYXQgMDU6MTE6NTdQTSArMDAwMCwgRWxp
YXYgRmFyYmVyIHdyb3RlOg0KPiA+ICtzdGF0aWMgdm9pZCBwcHNfZ3Bpb19zaHV0ZG93bihzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0IHBwc19n
cGlvX2RldmljZV9kYXRhICpkYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ID4g
Kw0KPiA+ICsgICAgIC8qDQo+ID4gKyAgICAgICogVGhlIGtlcm5lbCBrZWVwcyBydW5uaW5nIGFm
dGVyIGRldmljZV9zaHV0ZG93bigpIChlLmcuIHRvIGxvYWQgYW5kDQo+ID4gKyAgICAgICogc3Rh
cnQgYSBrZXhlYyBpbWFnZSksIHNvIHF1aWVzY2UgdGhlIGhhcmR3YXJlIGJlZm9yZSB0b3VjaGlu
ZyB0aGUNCj4gPiArICAgICAgKiBtdXg6IGZyZWUgdGhlIElSUSBhbmQgc3RvcCB0aGUgZWNobyB0
aW1lciBmaXJzdCwgdGhlbiByZWxlYXNlIHRoZQ0KPiA+ICsgICAgICAqIHBpbnMgbGFzdCwgc28g
bm8gY2FsbGJhY2sgY2FuIGRyaXZlIGEgcGluIGFmdGVyIGl0IGlzIGhhbmRlZCBiYWNrLg0KPiA+
ICsgICAgICAqIFRoZSBQUFMgc291cmNlIGlzIGxlZnQgcmVnaXN0ZXJlZDsgdGhhdCBpcyBhIHJl
bW92ZS10aW1lIGNvbmNlcm4uDQo+ID4gKyAgICAgICovDQo+ID4gKyAgICAgZnJlZV9pcnEoZGF0
YS0+aXJxLCBkYXRhKTsNCj4gPiArICAgICB0aW1lcl9kZWxldGVfc3luYygmZGF0YS0+ZWNob190
aW1lcik7DQo+ID4gKyAgICAgZ3Bpb2Rfc2V0X3ZhbHVlKGRhdGEtPmVjaG9fcGluLCAwKTsNCj4g
PiArICAgICBwcHNfZ3Bpb19yZWxlYXNlX3BpbnMoJnBkZXYtPmRldik7DQo+ID4gK30NCj4NCj4g
VGhlIHRpbWVyX2RlbGV0ZV9zeW5jKCkgd29ycmllcyBtZSBhIGxpdHRsZSwgdGhvdWdoLiAgdGlt
ZXJfc2V0dXAoKQ0KPiBvbmx5IHJ1bnMgd2hlbiBkYXRhLT5lY2hvX3BpbiBpcyBzZXQsIHNvIG9u
IGEgYm9hcmQgd2l0aG91dCBlY2hvLWdwaW9zDQo+IHRoaXMgdG91Y2hlcyBhIHRpbWVyX2xpc3Qg
dGhhdCB3YXMgbmV2ZXIgaW5pdGlhbGlzZWQuDQo+DQo+IFdvdWxkIHlvdSBtaW5kIGd1YXJkaW5n
IGl0IHdpdGggaWYgKGRhdGEtPmVjaG9fcGluKT8gIFsuLi5dDQo+IFdoZXRoZXIgeW91IHdhbnQg
dG8gZ2l2ZSByZW1vdmUoKSB0aGUgc2FtZSBndWFyZCB3aGlsZSB5b3UgYXJlIHRoZXJlIGlzDQo+
IHVwIHRvIHlvdSAtLSBpdCBpcyBwcmUtZXhpc3RpbmcsIHNvIEkgd291bGQgbm90IGluc2lzdCBv
biBpdCBpbiB0aGlzDQo+IHNlcmllcy4NCg0KRG9uZSBpbiB2NS4gc2h1dGRvd24oKSBub3cgZ3Vh
cmRzIHRoZSBlY2hvIHRlYXJkb3duIHdpdGggZGF0YS0+ZWNob19waW4sDQphbmQgSSBmaXhlZCBy
ZW1vdmUoKSB0b28gLS0gYXMgYSBzZXBhcmF0ZSBwcmVwYXJhdG9yeSBwYXRjaCwgc2luY2UgaXQg
aXMNCnByZS1leGlzdGluZyAoRml4ZXM6IGZkZTA0NmE4YzQ5MCwgd2hpY2ggaGFkIGRyb3BwZWQg
dGhhdCBndWFyZCkuIEl0IGFsc28NCnRyaXBzIGRlYnVnX2Fzc2VydF9pbml0KCkgdW5kZXIgQ09O
RklHX0RFQlVHX09CSkVDVFNfVElNRVJTLCBub3QganVzdCBhbg0KdW5pbml0aWFsaXNlZC10aW1l
ciBjb25jZXJuLg0KDQpUaGFua3MsDQpFbGlhdg0K
