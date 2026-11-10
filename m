Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794320501;
	b=H5K3ZK0uL/srRCax81isstUo4s2wC5PwRpcHKHWT/V27If7cVDG3bF8CHspe/CkRFzAF
	 9gbdxkwDcALi3PURx3D7aoKK7tDrObTj79mg61oPDtwH7WytUhpV/3zX1s7OTA9s0jQF+
	 d3Gf/mWQSZiNEtm1IHXTpTBW7H/X7RXAdaxIZbm5fj9a6NrIdM3Cf3qmTMDzIEdzCLCYh
	 x7Ddti7Rtheltao6kxy2ZKMnTGiJD/sAmBU3PgIRfX8JcqRKiNUa2jO+CqbYoh5NX0mj3
	 IsTH0PLGjMH6Wtd749Y2VbIbtY8cJr5bujw+eZxGUOsXjHWMxXDv98UupB/gLlq47tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=uV18sZPI6gL44ed8Qs7ZvPvuSXYI8qtysoJzt9DB7Zc=;
	b=NdUTZnRF/PsuW1LwTWg1MPjJFjDH6/zeHJP+eJqpHatiGD5azIihM6Kas+iWrQEXuy3V
	 WyRKV2YhL6v5E0NIniUhTV6F0dE1sLKVJNLUFLar4pe7C20V89PvdC08QtgjhWCYj6bov
	 6JYyPjuOiUr2gmJl4tvVGqF/JHEFcSj9qFrDgVggthTITw0Ga+ELDAVeFblK69JPPD1d3
	 9u/OEbOZ8gXUykScX3U4K4hs9KVRWA15S0kJH+fdXy82if3WYPDUVBTXgEsKWc1NVMS7W
	 RZyeVeYyqQNDePYvbDRQIPg79jTQW1perNkjcrJZKnIeDZcI63oWZ2SnV/r64CHaofQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bKclH2ys;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=O8ZHVkwy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6330360A382D;
	Tue, 10 Nov 2026 14:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6330360A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bKclH2ys;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=O8ZHVkwy
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAEG8LV651075;
	Tue, 10 Nov 2026 08:21:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=uV18sZPI6gL44ed8
	Qs7ZvPvuSXYI8qtysoJzt9DB7Zc=; b=bKclH2ys9G0zYxySUgL86AP25RSBjPAT
	kia1bcsDiglmYVHX+XVaxMrPKqXRuOk3hXrLHM7zbTBof8FDBSwuEajBF3b3V//B
	n5+oVcdEzc/3WUWq1f7UKikVjUbly1NXjahyhXwMa3/e0oziqMM1b0igBT2XKoVK
	w2fMSXpBgYfzgPVuyB8VsnjUCV94E3OUDvLEzdSaMuYWQDCllPJsk7kYAbwV+bur
	2QS4as0nPxDaGvhBScORHmlEi42FaMIGBz8NkdOcQP61l37PxgugHUM73jW7/L1A
	j+kxiCiysa/YJZpDJ6MHCunX8s7QPyvpCZ2WH2IMLt3uMG9HM1gUsw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020127.outbound.protection.outlook.com [52.101.46.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hbq6t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 08:21:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ6ZLmDBJovSGIQiD0lCs1XstqVZgZ1Y1TIX/GHcb3bZ2rCQHVnqpJW6+nJoe3gJIqKto88k+HvG6XMSwjyT3M0OV0bY/Vbi6+WNJqlJgiFj325UaEBpi9tZEC0eZAWdBrtKBywsqzpqCp6xQCi0SySfnP83xJnP9RgopPX9Ce1q0gT6XC6+YPCzYVidlnxEAHUW1ee+uNKpieIaQaFBbF7IO7WwnGYpqggnSxFqXijWeT0zoSYHYWyTdVqWx3tPoRLvz9fwuOiHFOotRNwyEwtbkTg7KZ8mxaYWir/S7a+y7mSsdz+gGQXD5HuVui0+bJ/8CtU6QihtS/uGRjOpFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV18sZPI6gL44ed8Qs7ZvPvuSXYI8qtysoJzt9DB7Zc=;
 b=tE/i/VUAgc0xKr7atmeoJG+Vy1/Txzikd3obfu2DyiVd+qlPALeVPOcQ55d0CPcnzp1YbUbJS+59/ljAPCJu3ixmBBFbrmgepD7BWxHImMcE3E05MwDHmyIT4+1PKQSx5CZX6ciwuwrNA/a52QCluei8V6n4cAYr1vVsLhxyGx2gSoJUV+RIxz+Hl/6LE7Sq5fe3ag8FZf/u/g0BnPZR55VuyHCdtfEXKeUWOslgGLPEGn334AUVIMIho+dD7M6ffRVcZKILMLWPoMGQaNx9Z/yvvHcKQxKh8C9h4WMy0eonB4v78T/cAWjOEq6lW17xAseAxVXchnBLyGO0Q+pFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV18sZPI6gL44ed8Qs7ZvPvuSXYI8qtysoJzt9DB7Zc=;
 b=O8ZHVkwyg9Z0dnHsSF4PqwGFrBxqr8BquR9mtteQZmP9qv8T5CLIVA62e6/wdF1hyUSW5eu7N5E6QGezW56shrOLFG5A+fLoa2qT+Cqhf9mikBxbaqqoQvIOa2xNPv/O7SsX7o4x5gt8kgTsi0N1HJ6rcXKTxLoUSSZCEIEpYbQ=
Received: from CH2PR02CA0004.namprd02.prod.outlook.com (2603:10b6:610:4e::14)
 by CYYPR19MB8120.namprd19.prod.outlook.com (2603:10b6:930:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 14:21:32 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::9a) by CH2PR02CA0004.outlook.office365.com
 (2603:10b6:610:4e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 14:21:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 14:21:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B63EC406559;
	Tue, 10 Nov 2026 14:21:30 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.17])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A73A6820273;
	Tue, 10 Nov 2026 14:21:30 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: linusw@kernel.org
Cc: brgl@kernel.org, patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
Date: Tue, 10 Nov 2026 14:20:58 +0000
Message-ID: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|CYYPR19MB8120:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 815d1e66-42dd-4437-e286-08df3f35eb24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|56012099006|261009223027099003|11063799006|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|16102099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	c8fGashxG/ziSU7Tg9A4VLxowbtHzvNQWWFusI6xMU19OOj555SChBQ+H7s8DQhh6n6+4shemuHvxf85jpnfwTMicooN5C6Xc8GlCbbNrr9EJPqg3BOlabM3km1yPa+rWCUqJgbcBq/7mgI6eoKgoFBOCZxDQx25hfMzo8GzYLL//AiExAcmD9bbXTLeizDc8a4CEcAFYWWYqsupB6iU7opDzRze6m+fD3iY4yqveKAsq/WTxEGQgYh9lnq0XNk82vwOXQ1REtYj5tkzDbJkl99BwlQUerpu+tAvsAdGAIh0xTTCtqDemEXInFtTwRVep2NQ4EAVclC+NkcGk+PLuwsjl7p0KKhVPRqY0qdfctxYzh6BaKyGvNFVdiy5vVeIBffxB0QNw+cOS3yhI9N+Jvk/tTyoWDazOUMerRJA0dk6uTdhyg1CHJeq7rexBend4xL1M0vZShxrdZmSzhObDnnjtnjU3k502UpXwH21mfrnfKHFCXNyrSdAZWSxEFmpgzngyI044VVi9uXFJZG50z2h0SQ/AlJC8MQbDC3Us/6gcSDyJN/SOaEvnESKLR+kIUckvBX7i5b37HebbxQNlnJ28LYu2TnUHcy+q7RPeRh0V8ULzpfyhqqCMCuTORhbPwYcVQsBt137XXTv8LutR/Xbn0Y/3IG4XGNfCEI9SW4yNheVx1Vh7Z5/sTWlMGZAlOnYsE5E+E6XJQUvIaPiJg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(56012099006)(261009223027099003)(11063799006)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(16102099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	og8CtVv9CrhbWa5k3BjM3nNKuYV3tWKrDmHbwsjgkGrO1FGpsAYa0uU/RS32kYx/uOjSPRammtKDTuGEXbWb5TNUuXax5WASoYBV6HUf3SPOY+djChd5dmxVr/pVdbjN/0J3Gw7HEjsvI8WFhXWC+/TQ8bqLwusA5aCE+M5v56yOn+fmrfYlH+1bXU8bCKfNYyqfrb684mWCUzYKUM6WEVSfFmyD+5w/Cu971rKc/DMxlKdLoshHKw3nB2spbqTnb/Oieug+UuW4jIQ+7ibFvub64sal+QF5IqJ4r9qQ9L/9K2dRlrdcZeU0pInW7p3+o8SpTJbi35CUu0UCFv9qkGwdb6cGZzbsEtvAIBveE7GDS4ryWTIfbWWN1nqYs4sO17PU+CQi6QLBguZAQ85rOFl/OchK/vcPV0wHUjIm44CeyqABSQBpVXKmMbLs7+Wt
X-Exchange-RoutingPolicyChecked:
	UnCf8ArIShNaemCVSeBFAXBmd+4+TU3SPjU/0fJ86ArrODldjMyvkellMyqPxPmjThN+1voCVpLQrM7M4F8iEFdDhm5rv6TimFTTCiPgMX1Ni55SckP/qXALpQ3WbLp96wY/sssWMu4+ZTLyA4ZDpILb5JhJpGgmRw99XSfW2qowyv22veciIKPc3goE3p83wT8jjZr1MldGDQ9UGHIHGH2XG6xtyyWPGj77fL63SwVSOSwEZ+z+FCCDJgxCPRkqU7nbCvht4Cj0FOR0G3Dxmd390nDyWq+kwEz7gUOeJTUlJ5fFVUxB15gcQjMUzJO6YfVKR7rMY6pZ9cItSmRaNA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:21:31.8426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 815d1e66-42dd-4437-e286-08df3f35eb24
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR19MB8120
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af32871 cx=c_pps
 a=Q2wBRf3htqysZkxgPItK6Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=-3pygNphPONx1QL_RWsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfX8aaR73CQfxiW
 ArMjMbyxq44Zz7bIT9rss0IgyMDP9gdjO1Nsi8qjKfUoprlil5JAzPrB5AeMvPbrvHRSZ8rv/Os
 oTqA6b/ZXLYnHcyF81GdwzcnVdpLwxI=
X-Proofpoint-GUID: TEHmMtrxRyd-aZq2wKEzDd3GtElctFvH
X-Proofpoint-ORIG-GUID: TEHmMtrxRyd-aZq2wKEzDd3GtElctFvH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfX4uFea36y+qG5
 JR6jxgFujI2ekbbf5H7F41OVUGVoCMdwd0aRfqSpPrO9/5agCNWIGyXuZGrD+p+FwzhEW6OjOSC
 fhWo6oMu/3LaxJlFIw2aiT1RNp4g3RdCcrFte/xeSST5aVpHGZAX5+2VGyOEWtdEuvTpsHiqawj
 QA1QztogSaZQHx95ZmgWglE/fT0mPrYl+qmztEPoi9GSZry8+Kc8iEavzrNbIM0xX/yV+8xnrSH
 MQV59aJLrHyWLudgTx3rbea8rJgw8hDjEx4OmHxuTy0PlO48VQRkAURBj8maYJOGgeDf8DAYk9y
 y9FLMgT5OmzUM4WEnAKMDpARmLfNXl/k2ojJk/n/vtqnsyTx+F6zZ3VWvmlWG/mpJ/AhIxKZofF
 DlT7MvLH0M4E58EBw2ujyEqbmb5q2tL3n+48dBImtz2sbE8VfeDQaKYgBGGcx/HTXm1DOqG1XFa
 KI42///8G6xAxlfkHsQ==
X-Proofpoint-Spam-Reason: safe

Add ability to use cs42l43's GPIOs to drive speaker and microphone mute
LEDs. The LEDs must be described using
01fa-global-mute-led-(spk|mic)-mute-gpio ACPI property, which tells
which of the 3 available cs42l43's GPIOs to use for the respective
function.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 156 +++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 8990fab0446cf..7e4e43783ef14 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -5,11 +5,15 @@
 // Copyright (c) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/leds.h>
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
 #include <linux/module.h>
@@ -29,9 +33,18 @@
 
 #define CS42L43_NUM_GPIOS 3
 
+struct cs42l43_mute_led {
+	struct led_classdev cdev;
+	struct gpio_desc *gpio;
+	u32 gpio_num;
+};
+
 struct cs42l43_pin {
 	struct gpio_chip gpio_chip;
 
+	struct cs42l43_mute_led spk_mute_led;
+	struct cs42l43_mute_led mic_mute_led;
+
 	struct device *dev;
 	struct regmap *regmap;
 	bool shutters_locked;
@@ -535,6 +548,143 @@ static void cs42l43_fwnode_put(void *data)
 	fwnode_handle_put(data);
 }
 
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+static int cs42l43_find_mute_gpios(struct cs42l43_pin *priv, struct fwnode_handle *fwnode)
+{
+	struct cs42l43_mute_led *mic = &priv->mic_mute_led;
+	struct cs42l43_mute_led *spk = &priv->spk_mute_led;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, child_fwnode) {
+		struct fwnode_handle *ext_fwnode __free(fwnode_handle) =
+			fwnode_get_named_child_node(child_fwnode,
+						    "mipi-sdca-function-expansion-subproperties");
+		bool mic_present, spk_present;
+
+		if (!ext_fwnode)
+			continue;
+
+		mic_present = fwnode_property_present(ext_fwnode,
+						      "01fa-global-mute-led-mic-mute-gpio");
+		spk_present = fwnode_property_present(ext_fwnode,
+						      "01fa-global-mute-led-spk-mute-gpio");
+		if (!mic_present && !spk_present)
+			continue;
+
+		if (mic_present) {
+			ret = fwnode_property_read_u32(ext_fwnode,
+						       "01fa-global-mute-led-mic-mute-gpio",
+						       &mic->gpio_num);
+			if (ret)
+				return dev_err_probe(priv->dev, ret,
+						     "Invalid mic-mute LED GPIO property\n");
+		}
+
+		if (spk_present) {
+			ret = fwnode_property_read_u32(ext_fwnode,
+						       "01fa-global-mute-led-spk-mute-gpio",
+						       &spk->gpio_num);
+			if (ret)
+				return dev_err_probe(priv->dev, ret,
+						     "Invalid spk-mute LED GPIO property\n");
+		}
+
+		return 0;
+	}
+
+	return 0;
+}
+
+static int cs42l43_mute_led_set(struct led_classdev *cdev, enum led_brightness value)
+{
+	struct cs42l43_mute_led *led = container_of(cdev, struct cs42l43_mute_led, cdev);
+
+	return gpiod_set_value_cansleep(led->gpio, value != LED_OFF);
+}
+
+static void cs42l43_mute_led_gpio_free(void *data)
+{
+	struct cs42l43_mute_led *led = data;
+
+	gpiochip_free_own_desc(led->gpio);
+}
+
+static int cs42l43_mute_led_register(struct cs42l43_pin *priv,
+				     struct cs42l43_mute_led *led,
+				     const char *function, const char *trigger)
+{
+	int ret;
+
+	led->gpio = gpiochip_request_own_desc(&priv->gpio_chip, led->gpio_num - 1,
+					      trigger, GPIO_ACTIVE_HIGH,
+					      GPIOD_OUT_LOW);
+	if (IS_ERR(led->gpio))
+		return dev_err_probe(priv->dev, PTR_ERR(led->gpio),
+				     "Failed to request GPIO%u for %s LED\n",
+				     led->gpio_num, trigger);
+
+	ret = devm_add_action_or_reset(priv->dev, cs42l43_mute_led_gpio_free, led);
+	if (ret)
+		return ret;
+
+	led->cdev.name = devm_kasprintf(priv->dev, GFP_KERNEL, "%s::%s",
+					dev_name(priv->dev), function);
+	if (!led->cdev.name)
+		return -ENOMEM;
+
+	led->cdev.default_trigger = trigger;
+	led->cdev.brightness_set_blocking = cs42l43_mute_led_set;
+	led->cdev.max_brightness = 1;
+
+	ret = devm_led_classdev_register(priv->dev, &led->cdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "Failed to register %s LED\n",
+				     trigger);
+
+	dev_dbg(priv->dev, "%s LED uses codec GPIO%u\n", trigger, led->gpio_num);
+
+	return 0;
+}
+
+static int cs42l43_mute_leds_register(struct cs42l43_pin *priv,
+				      struct fwnode_handle *fwnode)
+{
+	struct cs42l43_mute_led *mic = &priv->mic_mute_led;
+	struct cs42l43_mute_led *spk = &priv->spk_mute_led;
+	int ret;
+
+	if (!is_acpi_node(fwnode))
+		return 0;
+
+	ret = cs42l43_find_mute_gpios(priv, fwnode);
+	if (ret)
+		return ret;
+
+	if (mic->gpio_num > CS42L43_NUM_GPIOS ||
+	    spk->gpio_num > CS42L43_NUM_GPIOS ||
+	    (mic->gpio_num && mic->gpio_num == spk->gpio_num))
+		return dev_err_probe(priv->dev, -EINVAL,
+				     "Invalid or shared mute LED GPIOs: mic=%u, spk=%u\n",
+				     mic->gpio_num, spk->gpio_num);
+
+	if (mic->gpio_num) {
+		ret = cs42l43_mute_led_register(priv, mic, LED_FUNCTION_MICMUTE,
+						"audio-micmute");
+		if (ret)
+			return ret;
+	}
+
+	if (spk->gpio_num) {
+		ret = cs42l43_mute_led_register(priv, spk, LED_FUNCTION_MUTE,
+						"audio-mute");
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+#endif
+
 static int cs42l43_pin_probe(struct platform_device *pdev)
 {
 	struct cs42l43 *cs42l43 = dev_get_drvdata(pdev->dev.parent);
@@ -598,6 +748,12 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to register gpiochip\n");
 
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+	ret = cs42l43_mute_leds_register(priv, dev_fwnode(cs42l43->dev));
+	if (ret)
+		return ret;
+#endif
+
 	return 0;
 }
 
-- 
2.47.3

