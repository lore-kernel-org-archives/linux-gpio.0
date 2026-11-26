Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795704914;
	b=yq+QFAgc3FKlrdj+lFqs4mNiSLi0tFRFZP5XyT/3vZqeeEeOklGJNvxF5EIn8tRbx1om
	 YsWqD+q5/vJ2mXBlDpvzbw5sMvomtDiLE34oNYV2QEyHi18jNX2tE0bJcCmarpEiQcfZO
	 YQyzjxh1TUO/ABAWCXsBol1r+EafvMkE6CyLe6nL6LeSfFJFRFdLJfa5D4LhkK4mXgKuI
	 ekAHeidj7jxiZkkVutx8Bwknlmk451VH+YBPpO7imJZe098yqRq89l4lB8xJY3MU0rWzo
	 UF3hDwYlTvduDWQAZh6OR5rQA6eLZe8CLYYxVcSpszccnzQfbezYUSKG43fc8aQ7Evg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704914;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=Cjfgi07lE5Q/Izx5/yFCFBHgShZS0yuWas0sD31J5lU=;
	b=ucUIrKwqmXkhcO++MjzGVA0mjv9ndGKxFEef7fpMxIo2OLph8prX7j+ztG2EWd/SDMcV
	 aH6mIvqVcU2SyGGKe65QUtvbW2FGkfullSMKPzS6E/s6mMc6Z86438RdKdKW7EmUXZqlD
	 8joXyOHunv0iDq4eXCT3yUcJQgJKr4LMyItBV10+pFEUsDDlrRN6skxwCbur45Xo2fBDV
	 KFiihI7+BAf2VmpLgWC+RjvjYKYrcoyM6ppRs6jZ9595ZDI9HPIQyCAu36wn6LfK5b3rj
	 h9nrk8NUWpvKC3zcPHbLlzE6Ki3uN9YlmMPSXKYD63VP4chum5WiUSg6sUU1iv7LQ4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=KalRREYy;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Kb6Hu39D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BE0606A31C;
	Thu, 26 Nov 2026 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2BE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=KalRREYy;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Kb6Hu39D
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEI0Q2154892;
	Thu, 26 Nov 2026 08:55:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Cjfgi07lE5Q/Izx5/yFCFBHgShZS0yuWas0sD31J5lU=; b=
	KalRREYyVwJdaL7wvZ+FmgehjctYQ/ilGVGii8rYv2DIYp2AhPl6FeVPnV0f5Y4c
	wHCH6XZKDWkAgE7Vsw6iOFQSsW99kAFC5WWvN323IakJfHbGx/SSFkUFxfrWu4WQ
	pwVEbHnEQzLh712YOBPN3o31ESVjrzCIlM3o5tP1civjNmuQHqRmzcO++2joASpm
	ICfQAZLcmjN/iirUve1jkNCgW4/mabwW3HfCEix5Wth6OL0nuVEr3Qy8egypZZqi
	Omy9tRt1MgbEaXSYKnWu6u5/cU5dPeqqxncSxVtyLd5X6hKD6DO+dE2UFRsG8f5X
	GGoeli8LXO7Fj7HCrQkhoQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021085.outbound.protection.outlook.com [40.93.194.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51884aw3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:55:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDIqRxqrXLzbfRRLEBlYQ9YYQC1JqaD6+72YFE+WB7suplCFa66g96OSGdSPIUVLZ405FjV9uZAeCOsvpd6L33TbfyfEN0oKoBlLf9qLDF9uQV2aW5KYgJ7yXJ/z/n0nHobJAx/sRvFHZDOW+2sve7BqGgnL2Byv/J5CrtXAD2z6+i+lz/m6+EPj5mLrnr+leMZ1Ln0lNheQuGJohscaLJ+IgbzOG+ag5akOui0izw9E0WtK24ckyuEFa8Dq+D5oCvUSxIj3mTn22Yenj08GIzmmsOiWIIy0L/0POgrXiLb86tGDrG1jsW7GI3Yv6RArvWhwrdjq7tqrynpnDZzI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cjfgi07lE5Q/Izx5/yFCFBHgShZS0yuWas0sD31J5lU=;
 b=bbFdBlKNSBcfVNpyUwfrVArIIMg2rI9MEcBkIE00Yg6bkFzD3J1KP2PwnEgbvic7TY7313xGSGeHTlGn4FcVh9eVzwedjh7j0hPX/Ak5AHU7742RmIFRkn3TJsgG4HgEhvFh5KC7iWvo5nRWhyyidvD4yOZ8ooNc11gNoW5sD6MmhPS6vMfN/e8RO68bOyfw6WFfgp238jPxunbf2lCPw7LeEM1dS/T6e4/NgqqLXzAHdpNVryydUg5bkziKyh+4rxuE76YlR202lnPk+TE0UGBgk/LfvNl6pf5asM2NtMCJpdiZ0wRC3rT1tQj5rnMoDGcP0bK/fW1xJItzeSXV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cjfgi07lE5Q/Izx5/yFCFBHgShZS0yuWas0sD31J5lU=;
 b=Kb6Hu39DfpqAtuox5eCSWFLGqXyPubfWeNzX4Zs+RM7bg2aj4l9vTQdFPvCxL7dkDjFJeRpRxKBZaO5gEDRZJZgd+4iNxZbHOgm67vOVn9UryIyWiOsKcUt3X7p8GSUhhbg5VD1WPLdmV3sBDR1Avl8zEeFzaCpQ4cqKfOiGI5c=
Received: from MW4PR04CA0054.namprd04.prod.outlook.com (2603:10b6:303:6a::29)
 by SN7PR19MB7353.namprd19.prod.outlook.com (2603:10b6:806:345::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 14:54:58 +0000
Received: from SJ1PEPF000037B7.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::71) by MW4PR04CA0054.outlook.office365.com
 (2603:10b6:303:6a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 14:54:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000037B7.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 14:54:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6278D406550;
	Thu, 26 Nov 2026 14:54:55 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.17])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 524C1822540;
	Thu, 26 Nov 2026 14:54:55 +0000 (UTC)
Message-ID: <2ca86476fafdaec37ebf27646167fa706866e285.camel@opensource.cirrus.com>
Subject: Re: [PATCH] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mika Westerberg
	 <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        brgl@kernel.org, patches@opensource.cirrus.com,
        linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 14:54:55 +0000
In-Reply-To: <awg9hXmlaX4zjmQH@ashevche-desk.local>
References: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
	 <CAD++jLmUNxbVBLXg1aGysRGCjcQFjo=JSwx4-=8TWa7bj-iXuA@mail.gmail.com>
	 <20261126073545.GM191152@black.igk.intel.com>
	 <awg9hXmlaX4zjmQH@ashevche-desk.local>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B7:EE_|SN7PR19MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 4680d52d-fd78-4b8e-3509-08df4bcd3cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|23010399003|36860700016|6133799003|18002099003|16102099003|22082099003|4143699003|56012099006|11063799006|261102123227099003|261022105027099003|261028144727099003|261021121427099003|261022075727099003|261026121527099003|261021123027099003|261022113327099003|261026130827099003|261022115727099003|261021135927099003|261021130227099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Wg4tcqTWWoUa26JAnK0VYmwPdnsta6rzHfJMWDuGbvKXSsYfSRCsIO7maR3/UDRd8dxg1l0uPS/YReBrh141XiQrIoLrkGE2QGrQBnHMW46UW6X/cfff9/HjgwAmuLkv8qUPhE4D0rv0EQOZvvqRrPIn2yoHJf0GY8PlsRuqU8i0FKC4fy8dokM40r18K9130o3oMtBGCnREeBffQreAZb5pDi80sdhResx1o3GA2m69rz1HX51WQ2QBHyu5iTvVaox3ofyZLUxTE9Y/VZjVY+TJStumFYu0cjl9H2XwMwun3p22PxSzXZPudwlO+gfQx960HF1VyaInucuDgVePfRHc2oGanZouRMf34heJyBH7fPQgA9oQSQ9tIDpsVokSQvK5Zh6ZYFyPJoDiKFvVVGxSZED2rHOfFqCOOAFTp6F8s7ZaatRoZvQhefCo/bsQ2rIYml0TpebtN0WAWAo/XQ3iOxLavUc02g9uY9qZwWHqEeMk/eHQK16d/kC4C0k5Q6HYa++KDekx8bWXFP2XWxkZBbEi7Nhj/yD5A3bg6Tjmd7sEnx1k+AOKZ1BKHPcDyc9drppWpnM4KOuG5va8HAfxrZCi8igLcu7BD4OzPZqL12AkBFzRq1aPseF1djrySQZwZaVK2u6YUead5XzJ/qcmFAWJ5qUwzrGfwsEet4QceYyNCjtKGGqM6CxrGRO/gXrKI5LVhP1Lwu05Upap1Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(23010399003)(36860700016)(6133799003)(18002099003)(16102099003)(22082099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261022075727099003)(261026121527099003)(261021123027099003)(261022113327099003)(261026130827099003)(261022115727099003)(261021135927099003)(261021130227099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CEJnjkrDuaw8N65iqk4hPxLKsLIPSou80UEclDIkIPH7h/oaVzxsGtrM4Mp/FMQ8PbDNAKq/irKj2sJmx7LSvDtyaE6lVqBU1tOnupvxu7rtKKSkauNBbjgAhVfcl+jRnX/wNl1LQOYDH/GwQi9DRugX00KpyQC7aCMLTDazqkrJAOT3M1zJngEvox7hqa7u7Mjlo8RBAW+J0pEUc94FRjOSt5Duiyw7HYI6vDcxqedOMpkisPVMf6G58g+5fFeuVF+0xu5jzXM5DfimfHGYEHXgTzeSAf2498bAZoqa2mW+99kFQxadTi5UqQ8apZwPV+1KL8twhOqhOI3j1JCQ1QTNPvsH42eozgFoAKAXnbwB8nD1iyIl6KXJqDQBcuRFGoA2T/tgcT4jsnmFfqEybhVDwEGMCkcIlsDbIA1xas8/tePTRjvvepn9PCusV9xF
X-Exchange-RoutingPolicyChecked:
	Sh0qIja2axT7fPcYSrb8whw9ZeJ8iVaFAWCbTe2KMLtK56WzsypMViCldzbny/dSHIHhkWuVsR6R1Qhn82ivg1yVlirmz3c1igD2HJ273fc+YGnZglBBn6SVW/A38R/VRQCoA8HDtJd+kG3a2NvJRLb33NA0/WAKOrAY5Q+q7i8ix2izic/6/aZ0hN7AN8j4mHG0ufE2g6Kii4sPYF391uh043mT5GL0OK0gTvaPoMhzpDofYl0MQyrFMiglICPRoiAAcsDCzbv3FGbD0603LQ2da4N06bddpfsDKmaWXLEL4RufrqMaM3t45fSErMsQUX8jbUKn/EcxqhDIVMY1Hw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:54:56.8166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4680d52d-fd78-4b8e-3509-08df4bcd3cdd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000037B7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7353
X-Proofpoint-ORIG-GUID: IqYe1CdH4XniYveXxrs0j8a62e2lq-W3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX859x32ej/pF8
 JEcM4TVVR8g6cHzTgY6JowK9xdi01t61aZzV1PKRts5DEbC5mnihTXiynj1C/fbjpehhXCcBi2/
 AUKsUNH5ax5PU/VyQwTcLuCrAkxlvNvsEjNZGf+Y8FZpC2RlGRxG1nhwmgPzSaQQz4a2hq4raEb
 pSW+w9LUtWAJTZHqsBX0/h+NrNQK+goDxDkcNcoU2upYaC2i7JpAGe6aKNBdWxWmrOKmDtAe/rr
 pQvRvKITUX/JexwliuIHMqDLZTgTLgd2TDGp8kU96qHOJjiJqBOF8KC69sPnjvpazdlKNjpi7LR
 YFz6Utf9Wz8pyuxWtqb705JLoMaOABAGRH5WDBfkbk5j2lE6TNalCYMoGzlKkv74J33ryJmE96N
 tijy5QdLnH9DACePUz4uBE0pwi0K4YbYosfa/UKwXfpoPa33aslIWd/6u7nyIuSpJ55csQBdvIk
 LST5fy3vmipsVXzJtrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXw1UuUdY0FFG+
 +kHKQY6rTImn9wkJxO/5snKIF5tzT6HKSKCu08s9dTNRL1akyErxiqqvcbSYHEqRw2pkDbe6LTF
 puWqZup37LF4ygx182ijfYCu1e2h22w=
X-Proofpoint-GUID: IqYe1CdH4XniYveXxrs0j8a62e2lq-W3
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b084846 cx=c_pps
 a=iGL7HXglQbQLghhqflXdXw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=UyaBMqvpDKnjaZITGHoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu czw, 26.11.2026 o=C2=A0godzinie 16=E2=88=B609=E2=80=89+0200, u=
=C5=BCytkownik Andy
Shevchenko napisa=C5=82:
> On Thu, Nov 26, 2026 at 08:35:45AM +0100, Mika Westerberg wrote:
> > On Wed, Nov 25, 2026 at 07:06:24PM +0100, Linus Walleij wrote:
> > > On Tue, Nov 10, 2026 at 3:21=E2=80=AFPM Maciej Strozek
> > > <mstrozek@opensource.cirrus.com> wrote:
>=20
> ...
>=20
> > > > Add ability to use cs42l43's GPIOs to drive speaker and
> > > > microphone mute
> > > > LEDs. The LEDs must be described using
> > > > 01fa-global-mute-led-(spk|mic)-mute-gpio ACPI property, which
> > > > tells
> > > > which of the 3 available cs42l43's GPIOs to use for the
> > > > respective
> > > > function.
> > > >=20
> > > > Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> > >=20
> > > ACPI property, so Andy and Mika need to decide if this is a
> > > reasonable
> > > way to go about this issue.
> >=20
> > I think the properties themselves are already "known" so that
> > should be
> > okay (but let's see if Andy has any comments), there is though a
> > tiny
> > observation below.
>=20
> Yeah, I think it's some kind of vendor/device specific MIPI
> properties.
> Would be nice to know if they are specified somewhere or is it just a
> vendor
> push.

It's only for Cirrus devices (it starts with the '01fa' cirrus vendor
code)

--=20
Regards,
Maciej
