Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684165;
	b=nWDQF80gIjBRYNy1bPx9WeFeEqJph+69o2LQM6tlXjDm95qyZ/BZ+URk7fIk/gIg1oPl
	 0E76vpHrXKMr7EZ1Njt0OYHvUxTCiQXM3JDj4tsv8dFoNkTu+rNQm0G/goSFtUonsjYqd
	 v+ZylZxnX+tizVx+/Duxgn176UWItULWUVfmgNU4S9UDk2imoJGMhNLQvBdfVCEKgHWfm
	 taDczuMgfhFk9ReZ5V5LtJk/TOBdWF+vZzJMrmdp30DKsx8QYPhMdzkZk75f3Copo+qN4
	 346HqxTBxGDknnWnAfiKzA7UKTee1CN7yQTQW6BTBUmoRkS4Mr2T8jCqj/nT1tW9+Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=lXdTp+HMBT5nWzJabXhLwufX3ZQgdm95hqIEBCaWtKc=;
	b=gMPN7xc9JceTf1klD8p06DUsLF2kaKkmVAbniuMwfm798uWq3pLPJQZgSwk/I9e0ugdr
	 1hZHHnoYY8l7jK4UCo0/xJ+KAO6FuJz2uVC+VlHN9wqpEaIidZYONybBMaZLGmuUl13k0
	 Q4Zi5BJFlU2fgNVTZRGWegyCxQMobQX39DCi+g5iNsdOG9szmS8CFLRlsrmlcf3eYK8Wv
	 J5tiydHgjDdYyfhAJpdmGpyFyfpK0E4wsvEnbMk/lnX704AiMp4zN5gIMiP+iaeWbHEEf
	 O4vdTUEctADc2SH8/fzVtS89SebyPyvVmLb3VwzSrWb54J9MdTw494HZl1VwGloBkRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EGiYzAHH;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=soBdwkkQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2CA606A31C;
	Thu, 26 Nov 2026 09:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EGiYzAHH;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=soBdwkkQ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8noFw2248936;
	Thu, 26 Nov 2026 03:09:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lXdTp+HMBT5nWzJabXhLwufX3ZQgdm95hqIEBCaWtKc=; b=
	EGiYzAHHi9NI+RJ+O3KVlZgl2rYEekw1ioUIx70Kj98cqWy5jO1NVltTOGQbnwwS
	Hp9ysWrOo3+u8joq40oghQhjW0TaBW+WRf2jH6pimMQOmhGw9c0lI4iU2rC/u8rl
	xMH3wnJGcZVWIUfuMYVsParcYaaArWEkgaShkSVwWkELjARiu0gvaCjCuBxbgOIK
	hyGhBabBwLPm5ikhHMz9aWcXFlKTk9mYC/hoWSqNf2Abf6/5ODlpmL/VYexoxSiF
	mL/GtHp394TogQG1Z9gz/rSb3+5qCOwbNCINvUggHSkUi6wdJz8hUvz4Xx2mOJ+l
	j3C9jn9eXZS/CLa0uJxwGA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021140.outbound.protection.outlook.com [40.107.208.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jc2b4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 03:09:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAHUPtB9op5ZU3/9caBW6Ku1gEtL8IzBOcuQffHkrCPn04QV/v8P7Xl//KGVQJxnvvi9/7SjT259ibZloy5d2ne104XkeT8SX9kP3h2SasTvbNWQvkVDV3WgJtnvVQfNDs9OP43x8tr9GUpKeJFDp+RJffXjJsv/G3nxKW1ScvzZHwLT1LTA4mqcvxarUshokhEf4ijnY0CNYKB7g//D/3oFJVeAn7PKf+BBaOggtKCPfeUFzbRG75UuTNPapfLsr7FrH3J2r3Ao5Q0P8UlJEFf5lE/YcF7wCAfeCv6l4k6WTgl3Qb/1KUUpQGv3T0kIQ7PdaNeF3w4X0xl2YMAALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXdTp+HMBT5nWzJabXhLwufX3ZQgdm95hqIEBCaWtKc=;
 b=ru9zgiw1dLzD2lylBmFrt1zevRLNmIx/zXKf+Vl+svilI+NSzl1ICVfmHfgylLX4I6ZkiBh7IA4+a03cDWljsb7DuD0cJTOXXfhR8i4o+LiBI78LPUcGGQt918EzGzleE7ZDmmMvi5w9SajOPozJu92FT2nqMa2rkK6YD+H2uOnQt27MVSKWWDKbtemLEu1iljAE+osaOeCPW4mJhzePJm3IObPITMqTGOF8RcZWnea7Tsf5O+K1dm0DS2Mz8ygv8ZrgxJzxXB/oNIliCjiCbPFdD0W1m5DrM7EtTWGgs3+haMvp3ib4sJrkO6yjEnszjZO6b1udK1r2kUw15sN1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXdTp+HMBT5nWzJabXhLwufX3ZQgdm95hqIEBCaWtKc=;
 b=soBdwkkQEYQnICVTArjMNa/jnScFxknAVBgB/qhkPfPXcrBzZfOKgYpJ+mnMKt82SpQSKVyjdMIznmuK2CYz6Dhhn6hxTd4BI9EFDZWD8h1QnozamPQ9hKEsI/op8DIoMa6eB7aGni9xZTovHK5/Q3q7X7lmuEg7PuKtLUpldYk=
Received: from SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19)
 by LV8PR19MB8369.namprd19.prod.outlook.com (2603:10b6:408:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:08:58 +0000
Received: from MWH0EPF000DD30E.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::57) by SJ0PR03CA0104.outlook.office365.com
 (2603:10b6:a03:333::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 26
 Nov 2026 09:08:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000DD30E.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 09:08:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 64250406550;
	Thu, 26 Nov 2026 09:08:55 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.17])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 562ED82024C;
	Thu, 26 Nov 2026 09:08:55 +0000 (UTC)
Message-ID: <6a80f55a1427295a375ac4f2bb5568b70a6839a0.camel@opensource.cirrus.com>
Subject: Re: [PATCH] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij
	 <linusw@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, brgl@kernel.org,
        patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 09:08:55 +0000
In-Reply-To: <20261126073545.GM191152@black.igk.intel.com>
References: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
	 <CAD++jLmUNxbVBLXg1aGysRGCjcQFjo=JSwx4-=8TWa7bj-iXuA@mail.gmail.com>
	 <20261126073545.GM191152@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD30E:EE_|LV8PR19MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 1556c075-d971-4043-a7d0-08df4b9ce6ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|23010399003|4143699003|6133799003|261009223027099003|18002099003|22082099003|16102099003|261026121527099003|261026140227099003|10067099003|11063799006|261102123227099003|56012099006|261026130827099003|261021135927099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261022115727099003|261021130227099003|261021121427099003|261022113327099003;
X-Microsoft-Antispam-Message-Info:
	CZ2a3vtFE6zZ6K27gDu9KEoXye3Z1k70cytWtauzZeqf1f4dAn1i26KvseGlkbxKGva3Z+2RmASCz5HgWjAi90+bi3F02uw+6A6iTOIINuj3ys/5rZ4lp1PkBL+DejZkcAKRNJqM87LQ6jjZmZdWe9iXiIoizns4kF36gbJio6RzCGmm6P2yfq1dNmT/xDO+azoshYTtstURCItwaiNU5c5MqkqGKNJEu/9q8fhZtJpuX/7oIbphW0yM+3wkUGDsJ0inz5IKWuVc3vgDr6KHfoWQD5/sXb1lBu/emxj4g8eQnPJIm6kbXXoSDiC1GgUU3UV3c3jmjurRQM8F0CDJM2k1zU8Rv62tNUZYpNYbUM1S9PaLkeNTMYM4MpJQPU9X04W03EVCVNbGTaF+CGV9TiorvgicO/RYC91BOghC69hV6I8p9BAjhAecE07W7WNde2U1pZ5Dqxky+pdQ+skQwNZy7KN796z6UBTlJhBY5sJ6UHgVu1ll7l3eU8LWM4sf6DpghrrMkRCiHQdDdMrFz62I0ptPzfVS/WbmYxx/NqwExmqVMMakJCM+CukhRJf/1cVG73cCG8VWQTGOhYiNIa0f1Halb3PVtWNbIE1lLUDJlBfCk5Wrsd41huzHoG/ov6QhhHMBOEvjhhmEpk61cbCzXLxagb2j6ipyCe1SkI7brBV39rrQVys943rbEOuoVo3JAic+4ZDoBRcnZqAzXw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(23010399003)(4143699003)(6133799003)(261009223027099003)(18002099003)(22082099003)(16102099003)(261026121527099003)(261026140227099003)(10067099003)(11063799006)(261102123227099003)(56012099006)(261026130827099003)(261021135927099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261022115727099003)(261021130227099003)(261021121427099003)(261022113327099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/OSSClerTrV8YNwoXSEyWwLLsdPSrJz5jAwKSLH3SFZJKo5utYapip8PEj2+41abRxUPI/A8pSGufsl7Bw/Sn9Bu7HVnfVwusRD98PD6sOFRHeNSdhY4+jR6gAa7G1FHjKw7bZ0Inf/TPw772ZwFc92Aze6wLcdqIacd8TYF4hWf24ieZq5FAv67+DF7p+1kyGuGWWPNNWb2Eqa/UoyNqdFHM5P2TiRUBS9pSLoFmrcOJDq6B8V16yHPUK26r7JVOJH+IiPQDEG1Kg9qdUQrkZqFpCPIuPXs8xI0iPI0OXpzPeYOb7cEZT7UUwxRGD7ANgDMZ5A9Wjb9It4xPtgr6JWieWzKz5TwTG0GA7Kba4uRzTaMN1MCzxtIKGLOXNlDIDhiK19g+5tmubJHwWK3wUGq+gaxkJ+d2K5jCG4ImLwDXCOG3UdbxUGk9xyTyT5A
X-Exchange-RoutingPolicyChecked:
	U4D29t17DJbHU63NiFNg8TouggcfioTLy+6U2E/4z75MxEel6OVxDB1sv8kb79DCpCNx5Gpj1Me/x7WIUg5UMQJoLd+UF6Q2lI/2nm7tatqzlmTPKwHilqwSZSstBu9GkoTLaLqA9RN4unHW5UY3X3JtEk/dt3Pii7raOar5Sll8ZJV080OEYG/Es/eBOLdFuPC87vbZnOrgfIrArc5uUSlZ3aByi4/gT0Nesk8zW0YajoYGI09x9MWvuTfJrUjMxua9UZtvZpFlvglKvEXmjUdHBwLJpXVh124mp28xJgmk0GboLYMPvBwPNH0VEeoFDpgrTBkqAHAdTRzTZNSDVQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:08:56.7872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1556c075-d971-4043-a7d0-08df4b9ce6ea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000DD30E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8369
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNSBTYWx0ZWRfX/TLnLSkVbCgv
 7aqV6ZBfJmphfHkD0q0NiXM+wLZqj2H9nBl93c3wAHoynxT1MHRb73r/7z8YWLV/fDfJZZnC0+r
 EalTcUvxk+CXIQ0/HTlEwfI7laCL6qYhdk/BfrD8zK8XYeZJwcuf8sP2vzkzv4XhwSyaUU0h4PI
 JWT/mt8sJELsHY9BrgV0iB370KEd2mco7Z9Dk4UUlBTP1jFT898gjln/ATFMLxM3LyYHSNsAXRV
 qIBcejUb/RCAT6mYVxgypxfkSjWZc7pEOQ0rq2DQOo1XVe1i7WMOQ9aFmdWsq0iSrQ9ri2EifDr
 TL37fCBVIIlKned5KKmSh+q6+L1xKHF+H95JbOHNB48lX1MFY3SU9YeDvOLPQra55E9IA9gI4my
 WXErxSOSacxzlvMGaffiMlYQYqJSJiOfmRKFp9Hu1OJPGhVqhU66Qdja++V3zeEaF/vF4gb+sZh
 he80Ev3lD6W3QsQ7eOQ==
X-Proofpoint-GUID: mEDe1tLOxsDfXjRgrH3BdOoVafFz-7bu
X-Proofpoint-ORIG-GUID: mEDe1tLOxsDfXjRgrH3BdOoVafFz-7bu
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b07f730 cx=c_pps
 a=oqYjYovRwutaw0NExYmD7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=64aEV3kFJIRuUcL5YwcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNSBTYWx0ZWRfX4ylbZLhbB2dK
 +WDJsbJAU7yUFC48FgJnm++lL5jX7eTQUq7A+VfgKN42dEh92NoWo0UsC6sC6N+0Skd+456GLcz
 j1lSDW0SmSxODJeQvfXjAjhF5rOvYfs=
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu czw, 26.11.2026 o=C2=A0godzinie 08=E2=88=B635=E2=80=89+0100, u=
=C5=BCytkownik Mika
Westerberg napisa=C5=82:
> >=20
> If you do this:
>=20
> #else
> static inline int cs42l43_mute_leds_register(struct cs42l43_pin
> *priv,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct fwnode_handle *fwnode)
> {
> =C2=A0return 0;
> }
> #endif
>=20
> > > +
> > > =C2=A0static int cs42l43_pin_probe(struct platform_device *pdev)
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cs42l43 *cs42l43 =
=3D dev_get_drvdata(pdev-
> > > >dev.parent);
> > > @@ -598,6 +748,12 @@ static int cs42l43_pin_probe(struct
> > > platform_device *pdev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(priv->dev, ret,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "F=
ailed to register
> > > gpiochip\n");
> > >=20
> > > +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D cs42l43_mute_leds_regis=
ter(priv,
> > > dev_fwnode(cs42l43->dev));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return ret;
> > > +#endif
>=20
> then this reads better:
>=20
> =C2=A0ret =3D cs42l43_mute_leds_register(priv, dev_fwnode(cs42l43->dev));
> =C2=A0if (ret)
> =C2=A0return ret;
>=20
> > > +
> > >=20

Yes, that looks nicer. Can send a v2 with that, but will wait if Andy
has any comments.

--=20
Regards,
Maciej
