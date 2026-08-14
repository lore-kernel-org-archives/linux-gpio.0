Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F63515D6;
	Fri, 14 Aug 2026 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786688949; cv=fail; b=D4U5IvgMhC/cN6bVcEght/8+rwJOZH21BnApSXHrUyyHFBkS0cZhlqCJ3/P3e6+fmcP+m9QItqrNDHViHyWrpmwnReZ8W1zUVQkyaSOpLFUGKMJaHMUszsO/0/RJQHYVxFgA8Fe98SULefAfdujf8PnrWzoCeaZeCGhg8kzE/zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786688949; c=relaxed/simple;
	bh=KelfP/n7xXCa8VnRzBwNcafX/g6arxtFZRX+l76fWVg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=KBmXph1YVD7habWPBzTBOleJ/2dIN/odR845jj8nc1kSWPwmAANoqXAN9QN7GBBYzpqJ8eckMld0RSFiQGgsQpBFc3Wx6OC2HDOMeYgD3RnFONdLm5VWKJnCew8WLcmCgeWOma+jiyM1nfpBEymA1cQMa2KI+Po0enmoGagVTJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=WiT8cu1z; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=nEPQtKCT reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="WiT8cu1z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="nEPQtKCT"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Vd7d3725968;
	Thu, 13 Aug 2026 23:28:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=KelfP/n7xXCa8VnRzBwNcafX/g6arxtFZRX+l76fWVg=; b=
	WiT8cu1zoiPrTL7fX98YeAzXs3pFKE3DG664k4GXp7pT5ItmKpOSwny9GmYooKSS
	ZM9w+iNDFq52kczk5foKPEwg3QPEqepX3YEYVOCMCsO913YsdtTjktMl9Y8r2us4
	wmarj/ODQniwCdL1RS5279dWSRWOqdK1WEhDXWBIuUoaifq6ykqfKBWxQblOju63
	a7o/ac9ZIQjPfom6DwvF50SkLsmdKjDCyPA/WtgTlL2ke37waLLDBE13iigb74V1
	VdS0e7lGNSsw6ADrkvKUmVPIt+OqA7bLhST/EWPBlOSGOA/gsXwxgBCtiqlp0O26
	brZpdCuyoGuu+fKdI1IEBw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021077.outbound.protection.outlook.com [40.107.208.77])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 4fysgd3svu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 23:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHKrFo7T2c9DCXX6oStRqlXMH/NKEe7vADGWg4GWCjR8eRR2WrbUwb4CaiLzyeWQYjj+ERHMr8eRgOp5EiMy8AdIYUzF/rv010GqrV9AEvgJ0py2GjmL0WJqU9oLbfO489WAFVXC7arM/OuqGXf7+d3dHxGhai53QZGwWynqxWwtUXc+aJRNJz49UNUIYWIwlogyRdH6+OQCB2kS3TNExB/IZ+jtBknXpWzBKmY9R++QPm8wP4J1Uj3cRtOgjIc1lHH1t2w31iz/VAdyjXo6pm9buWd6Tme3AP0DwWhpmh2mygH3hv7C6f6XU9hUH6m0abPZoTrZTpJ0UE6Wf3hqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxkHAyZUi2jxta/A9DIII8yXB4P5YJBFSRZ4xKkFZ4w=;
 b=CI/iU/685ossi9BkaIIDeAJN7yIvoEQQoGt41izP5g7hTbf1FwUlkEB7lqevpOKvmqFmQRhrkmre6Nax0zpXkqp4JvFRbSGhWQCS+96qpFqa2N0WmQcAPgDKucZBbODuOvwNatF8sENsMtI0Ki6TfOVv5+rXBqZABPEQcIjMU7Pmk5pq2O6mU870+BSKH1TDCFwKR2frJYdQOAaU2d2e2BQY7dbrvgO+pckLjXZPWExQIyKtKyQyK+eW40yxtEp2ca4ikEFl2q1+dok5fsG9x7hVHpEHZUTruzAYFkOP4VazOYY0Gro+Va+DhNAVCZQgu8R/mXa9P2jb4v6IPDSn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxkHAyZUi2jxta/A9DIII8yXB4P5YJBFSRZ4xKkFZ4w=;
 b=nEPQtKCTvWVHmZFSXVMb9dyXeGJ+OGYRRTSkbFV2VG3qIfuu2Wvbcg7wYyJcRfrdFj7Qx/z78jVC/AZlc36p/9qNgZf8u5EwCaZ/6h/og8efmTheY4v7N0JQNarZcEFnvRrBjzTl2dygrEg6ObG9NvL0qIAmLcvMlhyl6mAoXFezEjm/hjKYMVXg7aBU2QIuldJVJeEdHzem1eke03+EU6CfVRKu5AvqrBiZ3iq0atln1ZsTm+4Udjj4cKE9EgHnnSnQi2JSKib3g+HRIcOtg3Y4xls0o4cZw0uk1qxIc8TZVprDi02Mj8COanmBcYcvcHLhGRRysbMEEQAYJgIakA==
Received: from DS0PR19MB7925.namprd19.prod.outlook.com (2603:10b6:8:163::21)
 by SJ0PR19MB4637.namprd19.prod.outlook.com (2603:10b6:a03:286::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 06:28:47 +0000
Received: from DS0PR19MB7925.namprd19.prod.outlook.com
 ([fe80::dede:8f9c:d33e:6b8b]) by DS0PR19MB7925.namprd19.prod.outlook.com
 ([fe80::dede:8f9c:d33e:6b8b%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 06:28:46 +0000
From: Long Zhao <longzhao@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
Subject: RE: [EXT] Re: [PATCH v3 2/3] gpio: pl061: add Ambarella CV75 register
 layout variant
Thread-Topic: [EXT] Re: [PATCH v3 2/3] gpio: pl061: add Ambarella CV75
 register layout variant
Thread-Index: AQHdKyS3/dudwWBhAEqVTboBKYuNFLadFdSQ
Date: Fri, 14 Aug 2026 06:28:46 +0000
Message-ID:
 <DS0PR19MB79254E57F016D439AAE9ACE8DADA2@DS0PR19MB7925.namprd19.prod.outlook.com>
References: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com>
 <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
 <CAMRc=McWBqz3YyN8GUMLd6aZjvZ=wT2y6oUu81MgrpR-Dc4hWQ@mail.gmail.com>
In-Reply-To:
 <CAMRc=McWBqz3YyN8GUMLd6aZjvZ=wT2y6oUu81MgrpR-Dc4hWQ@mail.gmail.com>
Accept-Language: en-US, zh-CN, en-001
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR19MB7925:EE_|SJ0PR19MB4637:EE_
x-ms-office365-filtering-correlation-id: ee1a94ea-f3e0-4633-e056-08def9cd4bd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|18002099003|22082099003|38070700021|10067099003|6133799003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 shevtLulEmdBwuVmQtXSacFUVk+Q/psSwZoY/W9dLGETIM6r16eqPTv/iUs1bcLnSvw9Qp3Mu8smcr4DmrqFAldy3rWPFL3Q6LfxcXAoQLMaPbQCuiRnmg81DjxRtXjrcW9SNNcviHFbWEKzFa9E9ZaOFQK76QNyQQRHrrFmUKd5GyVrUjnI0H1g7+iiPNTN8ATpuOdbcH4FvXKVXPAyKYoPb1elNDEW2QOpQgIEKQ1fVO1Wti8ttLF8hMgzRabXss5bmMGfu5ud13a7cPB22kv26u4YvDXNIqOk2XOBjAwHh3YIT+J1DEjJ7i4VPcmAl9L8TBEbXt0wy+9WSfz5Cm7QVx065TXF167z1x20rnmqYyQNBUXEUROOs9LyWdm06lM1CHqxWqtniFAFeAJAK0mhL+kw9qciLc7NDo6n4q+tHoYX5cbzkn3vZd5DuBMNV6DYGvWx303SIrwkz28f0LHuq7v6ixpkIxFd4hiqqvVxJQ09OHuqBjPhnS4XS3YmURv89YYlSCr2SJ3+Q4DXIUYN2jH27mK91xJ2NyaYPvA9sBwLQShy8WdR1QoLHiAixBn4uxSkF7WE1dNsAHYxyF8YKVUzaVneA1jQjd1Db7tvRKwskgrtEGI5v2suyxxA2lvq/N5tzREpQO+jwujqNsaAUUGR7zCX2s10+x/lAzSTipYU/msRBn5U1ed/f0JuawGbhtpObOxOpsG8A4FL5UTi6/xC2GzY1UOgDbcpG3w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR19MB7925.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(10067099003)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akVZemRWYzJKZDVMc1FlZ09Rc1JoT29Rd3dwcWNKQ0EzbDNVUlZZR0tYTGNP?=
 =?utf-8?B?cFdZdmYyV2JZbklSaFlibUE3R01kZTBkUVZndWs0ZnFRb0pERDY4aUFteXhl?=
 =?utf-8?B?YzllTUJidkhsV3pzNWNBc1BueWNXQW1XR2xlaUw2RHNBSm1XRUU2VGM3R1po?=
 =?utf-8?B?bUR6b2lvT2JBN1FKRFhnZ1ducXJ0UTkzVGE5V2h4QU43dmlGOE9XSEYzTG9U?=
 =?utf-8?B?NlorMXozcXdlZUV1MWt6d0RxNDlFekxUTnorM0k5VE4rdVVoemZGdVM1eW9E?=
 =?utf-8?B?RHI1VmRPNEJXMllOTlFoWGw4eXJkaEdoNWtadlBmK2hyRzV3WnoyS1N3US9p?=
 =?utf-8?B?czNQWitnSzV0RkordzRqdThRZmprcUZqZ0FxSG42SHpYbVBRWGgxNkpLVjFn?=
 =?utf-8?B?YVY4MC9EZGJEMS9WbGFFVy8rd1NnQXJUY3ZPcEJVTitjYzhoM1hIZVlwbDFy?=
 =?utf-8?B?TGhhTDh4QlZ2dzFhTHI2WWNBTXNSV3dmYThWUDJXS0VCU0dtMzF5emZVUjY5?=
 =?utf-8?B?eGV0Tkw3M2R5Z0dyKzRoZnlBTEQzSVFqTEtoeVFBZTBvZHRGemdoV25aczZo?=
 =?utf-8?B?bC9BODJjWkFidlVMWFdWTW9ickVPbldqcCtPZVRsY0l0L3RNdkhQNFZuMVNv?=
 =?utf-8?B?dnc5U1E2M0FmcmFjSzBKZUh5M3BNcjFkeG8rcEhremFEVHMxbDVIWjFRcW1C?=
 =?utf-8?B?eSsvb3FXM1lxWktKY3Vac2crN2ZjalVqMXYzQmlIOGJHNmovVzlQenBveldL?=
 =?utf-8?B?aDN5WFFMd2Yyc1RFbWNFbisxOHNqMGQ3a1ovUzFMeVZvVkI1T1NOQWViY1RY?=
 =?utf-8?B?ck9JUmp4dUhIYTgyVWl6S1dIVjA3N1VCNnYzeCtObHc4bkdwcWNtVFZDakJR?=
 =?utf-8?B?dWN6bkNYMWdzT2w0R2YySndFUTBLdmNIbE9YbUVZMnNGUzBPM1dFU01SalJo?=
 =?utf-8?B?NnVNSm91Z0tud0dpcjNvSG0rNUpLVW9JLzRyRmdHRFhYRnFlODN5ZFpiZWhF?=
 =?utf-8?B?VWdMd05FcW5MZnUvWUwxUFZXQjNVZEtTY2VZYkZ2VEd5L09PRGtFVENqeDdC?=
 =?utf-8?B?QXBSMFo2M0ZzdGJtQXczaUgrbVFJMGI2STVyRHV1VlZwa3FwMzhGbzdua0h5?=
 =?utf-8?B?dnAreEJnekk0QW9GRjM2dlVSdExRTVovOHl2YmU1QkNOWUw1Q0JDeXZoWU9O?=
 =?utf-8?B?cTBrQk0xYXhCMFpjUUt4eFp2YllWdk53Z29VbnN1dFFNbVdPc3RZZVRjSTFK?=
 =?utf-8?B?M2wyYTZ4L0VFelhSeUJJM21KNUtNSXNoRm44b2xhTy9ldWMyVXN2UVBpVXg2?=
 =?utf-8?B?QVBFam1qVTZSSEViUUNqRW9HQ1Ruekh2VzJjc28rN2M4alA1NkFPbWl0Y0hn?=
 =?utf-8?B?Ylcyb1hxaXgvS0NxcXdOZWVIZUFkZGxWd0N2NTg1NG9Ma1VpSDJNeHpuTzMv?=
 =?utf-8?B?MkJDbm9uQWxvZTdvbHpOeW1HTi9BNmNJM2poTEFjS0lFRG9BOG1HcmxyOHFF?=
 =?utf-8?B?aGNoU084aUpWSW1LOFl1cU4yUGF1bHJoMWIzNE1ZNDJ1clM3UHZiOEF1SWI1?=
 =?utf-8?B?RFRzS1dkOU9MYjFWVFp5K2V5TU9UaWVYc2JvRklpVVB3NXFGSndxQS9aa0dK?=
 =?utf-8?B?a3p3cVB4TEhsanlyUkZkekpQeDVYMDFiUnJlZ1hFcmtBc2RDMG5sL3M2MWpo?=
 =?utf-8?B?dXk4VnpadkVEVnVxV3NmRU5mWXpyTGo0YUxaOTFEaU5pN3RZYkYvbk0yQWRQ?=
 =?utf-8?B?VVNJRm1URExHK1RZSTN5NldoVU1raEYyVDlQQ2k1SUtvY1RSQk5nU2lNeUFt?=
 =?utf-8?B?SnIySzV3SE5SWjhBVHpySmdhcDljbWxUTkh2M2Y2TUFCOUl1MVVDclYzb3BI?=
 =?utf-8?B?SkFtRzNOMVZmN0ovVmpMcmplNWtGYXZGMk9TdjdZbzFWNnF5eWtpM1ZCYXov?=
 =?utf-8?B?WC9hVDlGaldWZFlpVHZ5M28vMTFSNW55REptOTBaeXBtRllVRWNuWldsUC90?=
 =?utf-8?B?UXpTWDZISjNDa1VNNk1QMzFobTdvTVpUZmwwL0VYc3hkY1dEOWRZK1gyRFFX?=
 =?utf-8?B?OWRzMkIxYzkwUTVYa0x4TlkyRkZBSDN6M1dYR0hHdjdlTUU0cnd4VVVMeGhz?=
 =?utf-8?B?SjArWVBxVEN4ZDlFNlR0NEprQXN0Q0ZSSXc4K2FDc2YyaUEzN1krTk1zMStW?=
 =?utf-8?B?TzBVMmRmT3J0aW1SKzR5M1JkUTB1eU5vSkh6VWZWc3AxbE5BanZaTFpIenpF?=
 =?utf-8?B?RkxxcDZvcG5KL24zSk9yWHk1UENYUE9Qa1JxOFdEUkVzV3A5amtFSGZlR281?=
 =?utf-8?B?dGhzTDlKVlZYMmVIdU1vVXBySExIZmxBOFlaSzlZSzBKOUFndTFnUT09?=
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Xnm283tpEW2WSQKILyaHPv3Ns9joayFPLmBdk9BiUGvc2tQYM8lHGWDFLJDYhktATzVFxtAPF0slBaCGOKN6CsMR5Ma0CMU30R/88NHPSyzeesS2I5AxtpA5t78q5T1sCBLBjs9J4ThuBfX8xzIumx7ZG819E5qjuZtDEu2T05lhSTYsfsovoyYHrw2g3bccjiqdrX86SBt6SKnDyKVLXZQ/ynZ1vlvDjTaby3KSD+Ro6auFhXQUxfxIOw2Jm1QDJ632juRkwM7QbZgbFyNw/eoubV5bt7tFIRskApN7wmQXLTMnI7NivJq1osbPHDAjV6YTOuADCWWACjT5pZULPQ==
X-OriginatorOrg: ambarella.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR19MB7925.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1a94ea-f3e0-4633-e056-08def9cd4bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 06:28:46.9120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xArcPcz28H+xyWMKAVpkw5qDRaQ3mG/A6efojauG12QpTHYaJpNPwSFzDSRxWfMsbqpYhGI5UpzWkZI8sPtAIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4637
X-Authority-Analysis: v=2.4 cv=PIo/P/qC c=1 sm=1 tr=0 ts=6a7eb5a2 cx=c_pps
 a=56BXxs5GTVekWDSCh43ZEQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=dkMdDuzY2HgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yXVIz-0bn9infC194UBj:22 a=pzaFphlX3Qn9zwH3AKfV:22 a=VwQbUJbxAAAA:8
 a=ppJngBeKAAAA:8 a=JfrnYn6hAAAA:8 a=P5ujsh5Thvg7VOFk9gwA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA0OSBTYWx0ZWRfX/HztSKOkMQrX
 +ljfK1+wCFn6PfmU9z6AQqMjlZKIgklr0bd55LFCLYPZ1FLzaUbhX0xxlcI9yahRSgFWCEEdttp
 1El9ava7AeAaTADZDepHH6iuHP8IGAR1U3MsSaPQduM/frS9cslD0IKhd9/PWpClFwVDOrMSLRz
 W5RloWBGAEi24+llB1H7/rRp6feHOhuEY84v1xv6EDJeuDBnE9E5+Rs3fI7Hd5NJzixrVMnqwgM
 kLaG4cbY4VbYuhgeb+gZHzlNu/w+p1HXGMDl73lfIQnJqop+Ly8KSfQoLNQaZv7lQl8hTonOLb/
 YFdd1P9Fmu34LOPpdEKzxXaCAWuZA1mw3xYdZuV/+oCNfbVJJ3EdaCOkCJu9mEUz6HeL44qt9SZ
 QoLGHerHQyGNOYcPFlgLNbOZFmjYK8iP7uQX9MMVDF5S18Ed3DjwoA0IPz3k8pIEpz+GP3Kd02M
 JziYb97rLsdS68JOKTQ==
X-Proofpoint-GUID: CIHxFafKJlbQOtgr9ERnoSnGy_g4Fo3-
X-Proofpoint-ORIG-GUID: CIHxFafKJlbQOtgr9ERnoSnGy_g4Fo3-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA0OSBTYWx0ZWRfX6yTd0OzmPdB1
 jKXNSgUKCsFO2T+vRqbBhGA/3O/WTGRJjukq7A97gYRwi5jPPiesOf9F2kySujlqUFsW46c7SYf
 tw25xlccURoTToSiZt4WQq5ko79tArT5RT+HN2kthS5y03vR5BGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140049
Content-Type: text/plain; charset="utf-8"

SGkgQmFydG9zeiwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBJJ3ZlIHNwbGl0IHRoZSBEVCBi
aW5kaW5nIGFuZCB0aGUgZHJpdmVyIGludG8NCnNlcGFyYXRlIHBhdGNoZXMgaW4gdjQ6DQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwODE0LWN2NzUtdjQtYi12NC0wLWVmMmU4M2VjMGVh
Y0BhbWJhcmVsbGEuY29tDQoNCkJlc3QgcmVnYXJkcyENCkxvbmcgWmhhbw0KDQpBbWJhcmVsbGEg
U2hhbmdoYWkgQ28uLCBMdGQNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCYXJ0
b3N6IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+IA0KU2VudDogVGh1cnNkYXksIEF1Z3Vz
dCAxMywgMjAyNiAyMTowNw0KVG86IExvbmcgWmhhbyA8bG9uZ3poYW9AYW1iYXJlbGxhLmNvbT4N
CkNjOiBMb25nIFpoYW8gdmlhIEI0IFJlbGF5IDxkZXZudWxsK2xvbmd6aGFvLmFtYmFyZWxsYS5j
b21Aa2VybmVsLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9y
Zz47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+DQpTdWJqZWN0OiBbRVhUXSBSZTog
W1BBVENIIHYzIDIvM10gZ3BpbzogcGwwNjE6IGFkZCBBbWJhcmVsbGEgQ1Y3NSByZWdpc3RlciBs
YXlvdXQgdmFyaWFudA0KDQpPbiBUaHUsIDEzIEF1ZyAyMDI2IDEyOjE5OjM3ICswMjAwLCBMb25n
IFpoYW8gdmlhIEI0IFJlbGF5IDxkZXZudWxsK2xvbmd6aGFvLmFtYmFyZWxsYS5jb21Aa2VybmVs
Lm9yZz4gc2FpZDoNCj4gRnJvbTogTG9uZyBaaGFvIDxsb25nemhhb0BhbWJhcmVsbGEuY29tPg0K
Pg0KPiBFeHRlbmQgZ3Bpby1wbDA2MSB3aXRoIGEgcGVyLXZhcmlhbnQgcmVnaXN0ZXIgbGF5b3V0
IHNvIHRoZSBBbWJhcmVsbGENCj4gQ1Y3NSBHUElPIGJhbmtzIGNhbiByZXVzZSB0aGUgUEwwNjEg
ZHJpdmVyIGluc3RlYWQgb2YgYSBkdXBsaWNhdGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IExvbmcg
WmhhbyA8bG9uZ3poYW9AYW1iYXJlbGxhLmNvbT4NCj4gLS0tDQoNCkRldmljZXRyZWUgYmluZGlu
Z3MgYW5kIGRyaXZlciBjb2RlIHNob3VsZCBiZSBtb2RpZmllZCBpbiBzZXBhcmF0ZSBwYXRjaGVz
Lg0KDQpCYXJ0b3N6DQoNCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNClRoaXMgRVhURVJOQUwgZW1haWwgaGFzIGJl
ZW4gc2Nhbm5lZCBieSBQcm9vZnBvaW50IEVtYWlsIFByb3RlY3Qgc2VydmljZS4NCgoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqClRoaXMgZW1haWwgYW5kIGF0dGFjaG1lbnRzIGNvbnRhaW4gQW1iYXJlbGxhIFByb3By
aWV0YXJ5IGFuZC9vciBDb25maWRlbnRpYWwgSW5mb3JtYXRpb24gYW5kIGlzIGludGVuZGVkIHNv
bGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbChzKSB0byB3aG9tIGl0IGlzIGFkZHJl
c3NlZC4gQW55IHVuYXV0aG9yaXplZCByZXZpZXcsIHVzZSwgZGlzY2xvc3VyZSwgZGlzdHJpYnV0
ZSwgY29weSwgb3IgcHJpbnQgaXMgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWlsIGFu
ZCBkZXN0cm95IGFsbCBjb3BpZXMgb2YgdGhlIG9yaWdpbmFsIG1lc3NhZ2UuIFRoYW5rIHlvdS4K
