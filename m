Received: from mx0b-00622301.pphosted.com (mx0b-00622301.pphosted.com [205.220.175.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668D33B4407;
	Mon, 17 Aug 2026 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.175.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950353; cv=fail; b=oZH/A3ps1JOXJigIkHu+1GcjF2uL7oEuT1ZEfn98SDvVIqPrxetMfdo0MiVed1Rblql71bK7yqw+Keof9ACzoFV7280IPi37i1MrroGUKQkvh8v/uav2siZLlYPKWEJh++chC26MUj0bNFJg0x6TyJhoF4Ae5b0OiZVyix334ME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950353; c=relaxed/simple;
	bh=jK9am4lzOPUZMrNtH4Z1/Mdb4lk23NUXn6q4tRvhslw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=lIhLMFhUX0RiBX8sSFuFm85yHI9s9Pwq1FXrvHoGp8R2zDwQa6CrP/0Qy5vzOLtYKS3234F4fQQCLjymqGNfSibrt6LEkSmLPkinhzPbi9B6r7bGYZ124VMhhflR1CvnCzxx/a/9wnTOaGUJPW507pi8+LP6aZ3Dq8wo9pjwYcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=wgSbdvo8; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=da0h5a4B reason="signature verification failed"; arc=fail smtp.client-ip=205.220.175.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="wgSbdvo8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="da0h5a4B"
Received: from pps.filterd (m0241925.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H6O8fs2801601;
	Mon, 17 Aug 2026 07:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=jK9am4lzOPUZMrNtH4Z1/Mdb4lk23NUXn6q4tRvhslw=; b=
	wgSbdvo88Jcxhfk1ysk7CrjoIJOdjbEhlXco3lXwFgP9h5EnduFv5hkuy/3HmUBE
	HN366gXm2pp/v8RPXd4FXDhPZF2v8NAk1/hgZSB7iLIDlNP/WhEoDD3HDTfjslun
	bxotSpIl82C1tRsvFZMn7kfC3/GpS7TY/XnOvmhTCnoUpbMXFgIKEhqZDsU8Xsvw
	7D+At8rrF12ykPwbfv4pTu6z9pF77gT7YtppHXETzV5xbWTUbpI97k+50CnZndgC
	vJGCy/IjUSliIlj1kHuaqqVtb5EaE+fLRd20VDCgSgJBXPlTCefH8FaNP4qsPE+L
	6YUyytXwNe7Xft2tZ5e08g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020095.outbound.protection.outlook.com [52.101.61.95])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 4g2h7hsffy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 07:05:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xy3W/36VWm6zoF48C11yeOZa9bFbut0WCsY90lKvjmuTll2RS83ZhZPxYgX+gyRNInOvCtmvL8MWT/JYJYzrbDW2yRCDH/nWWx55Un0EYMdpYjuccPes8XyOoXVGXyALp5gCkKE9YXkBBhDRYdHaDve7GKgNPcGm1Uta3CaxT7fCy38552sERmUo/gMwxtiZUKCNQ5mkUNu8KZTVevyasEoWhkiRYDVyGn+dh5oMSp+/llXB7hvntvvYV5XH70BUl1psXY1mjpMfi8+4P+faQ1rmoQCAoiLwBIoRTLO6ZBFuNbT1S9PWyBwySMOCvpMs36Ywz5dicX/28Lp9t80VXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSr4WSj4Rt5Wtz0YUa5CKmaPEKM12+GDL//Otqeoucw=;
 b=hDoRvURMCykXvsIT/tWEv1haYwW/L/ACCUnMUvOjDrAf75pgUHGEPwJzSzB0YG6355VrU1lkm98P79gf4iSCZpcOGYzgKmUkAoXidOnM4Y7Ht6scJkA9kpKMimTwsy23CVa+PQGqkw3xpX+fcZMgTI6nlqnEM4n2swO+VMWvIjkGkKXXyAMqNqrn+OFdhinQpzR87MyLzF7G2gKmaFlfTCf0Nze5apmcZrqeU9n92VgpjJQl724t4a6+Z7UxXVLxIXI/DAO7ml8aFCswKBrg97tQGATQ1jp+NvTgAOWpxowcBTG37WGf5LGXVGmoCt+hECYVOclmV92Krlfa5kw5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSr4WSj4Rt5Wtz0YUa5CKmaPEKM12+GDL//Otqeoucw=;
 b=da0h5a4BtUjavtBf4p3CpW48IyN1vH+VkLIUyzaXliwrSHgseWNGAZIMXcVW0EGvcUDlxT/c3OVDRg94/5h1+OvdtLZA2K7+9evDz6Cx4qK6+szY2SsH6uegzBdqYyXi6QNQ2GZCZ7SpFZYdF4ymwpdE1WvhWHMzyLKUFj60YWWrZIXHtbEjmDkvGuPsDG+hDQE4YurrqUqyNT+JhrWXzhIPZXiJlzCLMG+Aba6lyMxTMZPmXpjMfaqSTesYIU6COGq/LQFqZ4Tn0NZAlc6x1/EOu7iVS8pY6LeyrWrLQopIC8f7zOxh+lCSyAsKzQGjH0V/w4Z1PPqJd2X48HFt2w==
Received: from DS0PR19MB7925.namprd19.prod.outlook.com (2603:10b6:8:163::21)
 by DS0PR19MB7902.namprd19.prod.outlook.com (2603:10b6:8:15c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 07:05:25 +0000
Received: from DS0PR19MB7925.namprd19.prod.outlook.com
 ([fe80::dede:8f9c:d33e:6b8b]) by DS0PR19MB7925.namprd19.prod.outlook.com
 ([fe80::dede:8f9c:d33e:6b8b%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 07:05:24 +0000
From: Long Zhao <longzhao@ambarella.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: Re: [PATCH v4 1/4] dt-bindings: pinctrl: add Ambarella CV75
 pinctrl
Thread-Topic: Re: [PATCH v4 1/4] dt-bindings: pinctrl: add Ambarella CV75
 pinctrl
Thread-Index: AQHdLhbGYs6qKCO/Qkmof4W0awKeYw==
Date: Mon, 17 Aug 2026 07:05:24 +0000
Message-ID:
 <DS0PR19MB7925EFC4D705CAD8DBD1C300DAA72@DS0PR19MB7925.namprd19.prod.outlook.com>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
 <20260814-cv75-v4-b-v4-1-ef2e83ec0eac@ambarella.com>
 <20260817-perfect-berserk-sunfish-ef2d5f@quoll>
In-Reply-To: <20260817-perfect-berserk-sunfish-ef2d5f@quoll>
Accept-Language: en-US, zh-CN, en-001
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR19MB7925:EE_|DS0PR19MB7902:EE_
x-ms-office365-filtering-correlation-id: 8930fdb3-882e-4667-a80b-08defc2de929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|38070700021|10067099003|4143699003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 2cYB/qPWtSxL5/NUw0eB4IGDHTKRwn0KuB/d6yHO6HLYN8IZOcgNrUYCJTlKCwDtz+0oufimf8hrxqruaXZAHgGG6lDhNrNp0VaGyA2040uX2/Vr/Q1AO4Lk6k3J7dhhAwPrVALGzm1aglMbvYAZmQTefMTiwpYKIgAjZCxUQnut/NuzB++/LJaAGPrIFssNlTPCZGDHjvXajin/IiZFNxhEEpzJGTToRWjM5Ly7JCLCWIiQzgEzroZZJDNd+MRsEjI85oc++GDH/mWoYkMAkqIWkyaSB0bpedtqqH/782Y+5wjt+FgjN+sIUj9NFlukEDXNvQIlSVFa9cCaMsUrTvnIGouDU6aS/3NS4qMj8uEaZ3kLgu/qwGIFbl5Ljm4HkOPId6GS0pxpRnOiK8bv3WbloTGQnl73mKxcrwaetOjboFDcZR1zy0kPNkLU7fWgTIgBELFXoxvG9Jrh/WaTfhlhEoFScMdNRjevqasMV/iOAP20J8LxhByKc8JfVEA7VhbI28DGbElunNeY2U5nmbkV5BcVOCvQFkOkxkjfoGB1BaxJ7GWrGwMyhS2PPNZCTQZ0+4CZurEJZ4Pg1WGMxioPW0MbjSfeS0QVjfkDgfDyafu2A53haiifLonNKiJTyzJ2nSKEQrYfFtYAQZpT3ulCh+m3B41Rdd9ZNxo2agvYZTpLX6Xo3Qx34cNI4o3Axf6r0Fo7K0q6D2slrmA8DB9sjH+S0o6Kzg56cB20b10=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR19MB7925.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TERKT2VMSGR5TktGanpDWFNmbG53SUlwQURFbDFxQVlYVzRJRi80YzlxVStR?=
 =?utf-8?B?WW5zRTJXSjNYYlB4QnJocTg1MHpOM0lBWGptWjFxd0JJOTJNMkRHVnNzc1FU?=
 =?utf-8?B?ajdPQk9ET29HNjJCTUg5OFRxUHJCQ01jNVc1NEpEd0ZxS1RSL083ak1MaWNJ?=
 =?utf-8?B?TUhtdURIcHhEc1RDNGVnajVRUGZpcFdlSEJUeUNVd0RPQjJDM0EwZmFURFlO?=
 =?utf-8?B?WXlYSStOd1JyREZURzhoemRnMVBjUURlOWZVRlRRblZFL3pXYWdlN0x3SWUx?=
 =?utf-8?B?Y2hYd2ZzSXV0dFUxS0x3cktkQml2M3FBbGhFcUpMQi9aNU1NUGhLdDgwOERi?=
 =?utf-8?B?bldrV3EwUHo5MUhNY240SEVWekY3VUEzYS9KUWY3OUZnbW4yM3Bwek1WYnU4?=
 =?utf-8?B?OEtySTVrVlllMG03QWhiQWJRRk11RnVEK0d5THVLaStSdFljNStMclZjNFhu?=
 =?utf-8?B?eXNTektvRVhyekxqdkF3VDVVOGErM3puRTVoeGxaRGkyUXUyWTJ0YTdYckIx?=
 =?utf-8?B?WnNRazhLUU1WQ1cxUjVSWCt0QklaSEluV3BNVmNTem5QUXdHdFdWbjF4YjUw?=
 =?utf-8?B?N3pmbTUyNGZRcm1QZkpIVC9xdlhRSGhsdGtNOU5GVGdEWnRzVUF0Y1lsMGF5?=
 =?utf-8?B?ek5EUDI2dC96cUNQRHQ0WU1DcnRmZnAwNWN4Qy9UbFdJTlppdVpTd1VvN0FN?=
 =?utf-8?B?QU1qdjJFTVBxU0JrVzFXMUFXU3BxNTJoUVN4bWZ0SjhrWWVsbXoxQ21jaFBN?=
 =?utf-8?B?dU1LTUEvbjBLaU8yWHdUUEJ0OU9tbE00YU9tRTRQRnVndXJMODhva1RRRkNN?=
 =?utf-8?B?cWF1UG5wUzlkRFl1V25YeGdKSi9CMVlxalo2dW9YT1hCUk4wMGV4OExJREdJ?=
 =?utf-8?B?RC9SbmNiZnRxc2xHbGFFbXNhbVRmRUdEcjg3UEJTZ2krbFVraGJnL3BkVS9m?=
 =?utf-8?B?dzQwYXgwQ2YwbG9KUFN6bnAzQU5Fb3l5SnBzTDNMcTRWMTV0aG54Q2lwd3ox?=
 =?utf-8?B?eEFqckFtdWczT2VtaWRtL1AyWEtJdExSSVpBZFdncUZQK3R4bHJpb1dtZmpq?=
 =?utf-8?B?WGVpWHhacjJEK0kwMHl4ak9BMnJEaS9Jclp5SjBLVnNnQnFIKzVReFhYdE9P?=
 =?utf-8?B?dU0zZ2RRbk9LdWh4QW9PQU1hM1dhWG9hZTBlKzVHTXkrR0R5UUxpOWsvR3ZR?=
 =?utf-8?B?V3Q4UitwWHJQTWFVdVNnY01oQkFzWEpONEEwMzY0NmtkaUNLMTkxNG9sZGZk?=
 =?utf-8?B?ekpJYTNrd01ycDFVeVNoL0hrK2hSdmtKMUdCejVlTnZLU2hnMjRJdW5tZnJT?=
 =?utf-8?B?SE9xT3pHWUNaaGZpQTJsZzFNazkyQm5FdTFlU3UrcERsUFRmV0ZKVE40ZERR?=
 =?utf-8?B?OHdYTUgrMG4xT3V5Z0tkWllzRElxRGViblRCZzVjVXYxbVY4Zkl4dllnb3VJ?=
 =?utf-8?B?TjZhVUxRWXlOVUFzUzl2RkUyMXlVVWpjTDJVckJiZG5ieGYySmc4NTRoQlpq?=
 =?utf-8?B?K0owWlBNNGpybGx1TWxEUjJzSEtUeVlVWG9zNHJIcVFUV3pmR2duQzcrWXZW?=
 =?utf-8?B?Z0NpL0FQdlVKWXRlY2MxRm8wQlRFV3B4TStyaGFtckt1VERkemZ3dWgwb2hI?=
 =?utf-8?B?bmE5NjVabklqZC95Uk1hNDljS3Uxbzl0ajE4K1h6WHAvaEc4RlZxdHZMenMx?=
 =?utf-8?B?SEQ2VUs0bis4cFM1Q3ZRaFJDYkk5NlFiN05xTmJxSGk5blJVNHM0OEU5Z1Bw?=
 =?utf-8?B?d2g1aDJxSVdPMENnRHAzbDFnbEZ3ajVyRzcwV2xxN3BHSlNLaWpJazdJdHZ6?=
 =?utf-8?B?ZHhIWFF5ZGFWNW9OaXdjV0QwLzBTai9YSyt6UStxNERaQVUzOGo1SFA0YjVI?=
 =?utf-8?B?VVBoWXpidU9ma2tkbVpSOGIrM3V3T3ltVnpJdnEzRmJHTjluSk1idXBVL2Rt?=
 =?utf-8?B?Z2tITjV3TG5XRlY1eDl5K1hndzhqVi9vaEh6SXNuclE3L0p3TGN3ZjZibjRp?=
 =?utf-8?B?RkdOMzM0QlNJUCt5OGVrdDhibW5qYTg1eEYzTlVYby81cjU4Si9VdUVVQW1L?=
 =?utf-8?B?b1pGdEhiSW1jbHBXbmRpVnJJUjZvOTN2U3J2SUpZY01PbEV3REFmQUY5K3I5?=
 =?utf-8?B?Y0JCR0dMWnFxT0hpMytoOHRXbXhRN1RyalBEMmFmRTllM3Vaa3hDeTRPdkR5?=
 =?utf-8?B?eWR5SEhSWDZvS1liMDNqa3pXT3FHWm5mNzhHNG9VdmRwbzE2T0xuWjk3UTBw?=
 =?utf-8?B?Y2RURmtpdURleU1jVEdPbmptL1dGRHJ2Uld1bEY1WGRYOGFmWFdpRURRZllq?=
 =?utf-8?B?MTRzNXpEVjUyM2ZRMWNRejgvMWttV29Mbm8waVhrN2hwVVBYRElaQT09?=
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cq96ItRYZP5/aE2Dj9pPNdsxN7eVz+g5vV+GXOrqh2NlPDXmZQ2LQ9vpi8gRiTTes/oMdc5rGcCoc7lTAthkVyrg9tfpK+P61FU73f+Vkr2rQrCFBzneJpHr/90XfDtxw9EM8kdfdUGhvM/m/ZA+BgTygLqtWuBkAauuKeIkWY3UT9fw7FQATwTZPhz2JpB20I0KTqEP86avX4bS5HofVLwB7kfMx/RaPrroEHvd+EEsTsZf+3xVkQiyPzTmR8UwmHPLxo8K9DkCNSsR1BTeOWvizk/+WGkVye+d9b++XerhBbjSuv0o8LrK2VcX2kcX6e59otD23dE1dwYcH3H8Lw==
X-OriginatorOrg: ambarella.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR19MB7925.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8930fdb3-882e-4667-a80b-08defc2de929
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 07:05:24.7526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNH7YIPfWqEw4MzRJYHozMzZDjkPWs08TFgBkwrx1PLvyxcs14dppWNw2zrZihyZiCb2xNRTd2Idjw9R2HdfCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7902
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1MSBTYWx0ZWRfX/kRa0amjhpyL
 VzaH2XaXTIPYl9aFsenbfwxBp9auwAH4egpHRyUbuwu4Wim11G706HuMAVe1HEXIAxuBiBTeLor
 ymF9x1cHpCKNbl9HQh5exRDWjrSKC4rAR/w1zEOw8Bq6HOYaxJqH
X-Proofpoint-ORIG-GUID: Xkbf8JuZRqEisXVBm-G05uSwbrG9PDTh
X-Proofpoint-GUID: Xkbf8JuZRqEisXVBm-G05uSwbrG9PDTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1MSBTYWx0ZWRfX91s1y4rk3ry+
 9v1qanpj559eOXtEq2JnyEN2GNhhVgCFdJUhMIjAEmndn0vrF+7B0nyELOUAIqfXWwjnkccAHnY
 WswzszaKmP24gWBVhvl/4cYXhCSbkVh1IQwCVY3Ew/W4G6lOSx5MpOi30cKQtJs0mpfWjsi6ke1
 zedbtzrBGscDPuWReX/zUHpMoFkc/i/ErH97BOfZ8DJuXjtG71WWkFEz1/5oj8aDl4i0EvyPzOb
 J3DAmEg/JELqz7dhyL3+v+eqsP1X9Dr4/2Ms1rk1extWwhPThCeJ3oGaj/+hetJW1vyuWHo+ZXi
 bAMOEYLzWrssZWes0HwGitzrc6RsKIP6XxQp9JPHrTRuVr/qGJNUEqEgtpQ7XxVrnQrjr+le7q8
 i3z8PwoVM/zfSOe737MkYvGQgWfYtvZEx/64uTtp8gHgWuvVbnwmvWRYCJMfddNmEgD4k5VzKoc
 wYyIMzEQ6iP09lIiWkQ==
X-Authority-Analysis: v=2.4 cv=P8YKQCAu c=1 sm=1 tr=0 ts=6a82b2b9 cx=c_pps
 a=5EyciH11kPx6gLClVK4sKg==:117 a=fVfL832+mzDTHoFKNp42fb2xq0E=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=dkMdDuzY2HgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yXVIz-0bn9infC194UBj:22 a=KblO7da7ppA7TBl3N-nE:22
 a=VwQbUJbxAAAA:8 a=ppJngBeKAAAA:8 a=JfrnYn6hAAAA:8 a=xfu_c-B5EpSfxMbVdvsA:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170051
Content-Type: text/plain; charset="utf-8"

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuIA0KQWdyZWVkIOKAlCB0aGUg
cmVkdW5kYW50ICRyZWYgd2lsbCBiZSBkcm9wcGVkLg0KSSdsbCBmaXggdGhpcyBpbiB0aGUgdXBj
b21pbmcgdW5pZmllZCB2NSBzZXJpZXMuDQoNCkJlc3QgcmVnYXJkcywNCkxvbmcgWmhhbw0KDQpB
bWJhcmVsbGEgU2hhbmdoYWkgQ28uLCBMdGQNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IA0KU2VudDogTW9uZGF5
LCBBdWd1c3QgMTcsIDIwMjYgMTQ6NDQNClRvOiBMb25nIFpoYW8gPGxvbmd6aGFvQGFtYmFyZWxs
YS5jb20+DQpDYzogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+OyBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwu
b3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBrZXJuZWwub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFtFWFRdIFJlOiBbUEFU
Q0ggdjQgMS80XSBkdC1iaW5kaW5nczogcGluY3RybDogYWRkIEFtYmFyZWxsYSBDVjc1IHBpbmN0
cmwNCg0KT24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgMDI6MjU6NDFQTSArMDgwMCwgTG9uZyBaaGFv
IHdyb3RlOg0KPiArICAgICAgICAgIC0gdmluX21hc3Rlcl9zeW5jDQo+ICsgICAgICAgICAgLSB2
c3luYzANCj4gKyAgICAgICAgICAtIHZzeW5jMQ0KPiArICAgICAgICAgIC0gdnN5bmMyDQo+ICsg
ICAgICAgICAgLSB2c3luYzMNCj4gKyAgICAgICAgICAtIHdkdA0KPiArDQo+ICsgICAgICBncm91
cHM6DQo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0
cmluZy1hcnJheQ0KDQpXaHkgYXJlIHlvdSByZWRlZmluaW5nIGV4aXN0aW5nIHByb3BlcnR5IGZy
b20gcGluY2ZnIGJpbmRpbmdzPw0KDQpTaW5jZSB0aGlzIGNhbm5vdCBiZSB0ZXN0ZWQgYnkgYXV0
b21hdGlvbiwgSSB3aWxsIG5vdCBwcm92aWRlIGZpbmFsIHJldmlld3MuDQoNCkJlc3QgcmVnYXJk
cywNCktyenlzenRvZg0KDQoNCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNClRoaXMgRVhURVJOQUwgZW1haWwgaGFz
IGJlZW4gc2Nhbm5lZCBieSBQcm9vZnBvaW50IEVtYWlsIFByb3RlY3Qgc2VydmljZS4NCgoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqClRoaXMgZW1haWwgYW5kIGF0dGFjaG1lbnRzIGNvbnRhaW4gQW1iYXJlbGxhIFBy
b3ByaWV0YXJ5IGFuZC9vciBDb25maWRlbnRpYWwgSW5mb3JtYXRpb24gYW5kIGlzIGludGVuZGVk
IHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbChzKSB0byB3aG9tIGl0IGlzIGFk
ZHJlc3NlZC4gQW55IHVuYXV0aG9yaXplZCByZXZpZXcsIHVzZSwgZGlzY2xvc3VyZSwgZGlzdHJp
YnV0ZSwgY29weSwgb3IgcHJpbnQgaXMgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWls
IGFuZCBkZXN0cm95IGFsbCBjb3BpZXMgb2YgdGhlIG9yaWdpbmFsIG1lc3NhZ2UuIFRoYW5rIHlv
dS4K
