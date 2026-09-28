Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020127.outbound.protection.outlook.com [52.101.69.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F1C4E36E9;
	Mon, 28 Sep 2026 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.127
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606428; cv=fail; b=Y4qMNYA7ae/Kc0srvzQ2T48HewuR5+CejGKHq1QkuRYSWuyQiMKkOa1fQ8Xm6JHvE14vyMl464eBLm+igbiwX+ePPgOFbi68SDSddXYU9p1tLBU7dmJ1kMgfhjqW3r0ViXixeisas9AuIRIgQAaYpv3AnczzRCIne6EZUH0IlAo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606428; c=relaxed/simple;
	bh=/EuEBOVLqQhOIAN8r3KDWBwYjyo/TsV+kutweUCj4sE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eVqaoR2u7QiGIjgLMyMhTaQdsZLe/foDRLye4lJSXUQ0+goyWsSkyK4jVSmqTTud10FdsqbH/Le9cj/7SjFOkxEMk6Dk7f8u+x+V2vcmJRFyJNDKXgdUPgcppXzHkmNcFutNq/Fy/yynX1IJhQM0399e7PcjX45D5N/Supj3Hx0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=uQEX43vV; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=uQEX43vV; arc=fail smtp.client-ip=52.101.69.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="uQEX43vV";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="uQEX43vV"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GmDYTuubAH5w/cuwF7pzS7xImHKZWrrOx5tAz4CvdqUPb954mckmr4Ot8DxykSSoqMqHY6my2xsZVen8SR+9TVCy1oTh1khcH1ochtLMNO6CdydIvnCTz9pBO+d138lSSVD0iSSaDfSdGVKtqtY7RWi1rZHGCby8AdvjvrfabWqaupVjixR9lHY4HW1VQx2Oh1vKG2qm5tFK4178VLi53My12Wd7jnMd1/BledPhJNhBgnBTZGwTNxdwmod1Lgj1imBFFO0uXiGFDoq60V4dz8DJ2QafCGCXmpEolw5a/Lsti38A0HMkLiBNSo+t3fFJXkDy9JVvy4qkefR7L1C+jg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=NOeBAompG5lvHEeTSqfx1sE6+p/GMwaOE0FhaoU8vVtgaSYUhjl/GkieitaUupgshLdeb+S4DC1oF9NIvbr9Wd6IQSaOWVWGlW71QSJDLQjgqYaswPIq70uajuvxLoBAxIGNL6IZhw/sMPncc/JhuXxG7vR/hQ7UJViO+A55lL9YJbFAzVtFzjaU49vb6xpxpjPYMQe/kTZV6cArQMotSYjWp4SCCcPKrFTPhN6fkyR7r/aF2CWbGOyfq+9MA4LHNHsSuG2PSAlFooQlGxuXVIRPXOPFDoj2C65L4hvFKzqIvtqWFdycDmw5oHgz01wCTCCeXAZSxywzOF0tk7DTpg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,2,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=uQEX43vVs9CAozn134ZPpmyP6ElBi6x6otd7a7JXARCr4JQUnRt3o6kFh76vDvrw9rISzztMu81LAt2/SAzk+zDxBybZpy0RTM0bXEnk4K/BjrRT2gNZ2JTOKVLrrsUVTdSZIpgvVvARfOfa/5QsQLoEYspUgdaS4179rzoJDm+AD2eksSUM2ooSYMOADI9fmj681h4CoIi59l8PApQWw+Gqb1xnEZRPb+yWeosI39JI+79AplwIV6kcmsmKaQRQy1qAXmq36aSLsdvGn8KLu15v4Yd+2LMxE15Xg6g2ghRnF9TOxBpSQvGYVLGbWv5noORKK3Vz4Pu4+EQM6U5BiQ==
Received: from AM7PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:20b:100::30)
 by DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 14:40:12 +0000
Received: from AMS1EPF00000098.eurprd02.prod.outlook.com
 (2603:10a6:20b:100:cafe::70) by AM7PR02CA0020.outlook.office365.com
 (2603:10a6:20b:100::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 14:40:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000098.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:40:12 +0000
Received: from emails-9661726-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 324E57E91E;
	Mon, 28 Sep 2026 14:40:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606412;
 b=pz6bHctzwxdfc3IMeN2hRbCnkc0QkGa/uoF31UZowVgmYKc36cX14pyNlZNgUSGLIVlkz
 YLAeNVjapklRkB17PzfTIBPP88w2Wz3zrb3DRApCxLMevvYPr2yT98owOJ4gShQMlP3IgYK
 UJVbenO67HRCDMic0dVJp/JJffnnDR8=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606412; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=esO8n8M5eOnjmyql9et4/iOsaguyrkgcZ7gPSf9mPFKNgV2Jcb1BqcoB/KkG8OjPkyeQa
 P7U1iTkvnZuERSFnHOjvi+W6VIVU9lyfWRMTV2yXXWiCCgexSVjyRKGN0YNFNqGqlVuaZiP
 RxuWk5F+hT/t2moqxN9nlgh0oagcbgc=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=uQEX43vVs9CAozn134ZPpmyP6ElBi6x6otd7a7JXARCr4JQUnRt3o6kFh76vDvrw9rISzztMu81LAt2/SAzk+zDxBybZpy0RTM0bXEnk4K/BjrRT2gNZ2JTOKVLrrsUVTdSZIpgvVvARfOfa/5QsQLoEYspUgdaS4179rzoJDm+AD2eksSUM2ooSYMOADI9fmj681h4CoIi59l8PApQWw+Gqb1xnEZRPb+yWeosI39JI+79AplwIV6kcmsmKaQRQy1qAXmq36aSLsdvGn8KLu15v4Yd+2LMxE15Xg6g2ghRnF9TOxBpSQvGYVLGbWv5noORKK3Vz4Pu4+EQM6U5BiQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:53 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:53 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:35 +0200
Subject: [PATCH v9 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-7-5901e0fc9e44@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|AMS1EPF00000098:EE_|DU4PR04MB12026:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6ce88b-fb3e-4f00-07de-08df1d6e672e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 4iktvX0jjxXa07ceph+9SdMAHbgnl6MfWzrzkR09aOaZXPKvXGB8C8llCwA1X5RBR0f48UAewqPKKpZr5HbgxXcAj3+8kQizchLJZKVmUjJ0Vy9sRo/KRDZTw+47cpFrV9XYi7F4WN9E8ENJTVr2cwiuRGnX62Vo5m79F1+ABr1DCLTtMxgSnwmFF4y/3msWAQJrdyKUfF7K+0Q3R/GdHjDWku7JzewqyvjzqGowRJezLifKe3LYGr1jDFZExxDVomf8LJM/YQLSLLDQ0+MXovfr9ii7B8XLk6MQMZGCqf0UI6xtLD7OoETrOO0Ri5YJ5Qt5nGApOdUBJLpGDeDx8Si8dqaxy5bZbZuhKY3cfKAAZy7bchlzlG9yJqFtti2vBT78bQn/qwmAJtlO54qtXsuTjP4/6h7xm5oKXUz3J5mllW6xtDe98YgB1sPc/nYe0dPO+sP5X/xNPLwqHn0JBAKfV8GOM1dG4SKKvu+b62jR50rlRisH1s2zczCUpKf1I1xQIrk2zDjrJ719wti+4L6Fu/5IQFJ/KcxygfMeuYVErUvQBWIWwJ5ckipPxxonH1QpIVkCLqDO905oNYUb6oE8gWNCoqI7R7d7cRBNHsyBMaUHk+yXKqlpZr76jwJY9JRHJmet17Rcn2rj4U+R0EGeoOYESULDdajxAh0BpiU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 n2s/7VJGc7tm/r8bCiW2L9vahxD3gVx+BoXrwuBLJn06oOFa2NUeNmyiYOX/r96bV9NGfFrOOSJZKqrfAYXtah5I8dCTTh1uGoh07LTvSQeO3JnIq7vmhaNW6D2hBaBY6vtZ28pomntgxb5udDwEqNbG2s3brarpKZXHTCEMwNaJD1ET+FhTEONHhtdb+WdaGcmYpYjL9qt7KnUIk7eYw1QfYvKB8Z0lJESV12wcI0Db/+kzhRSu772CHlnGysBdSML+0zmg5N9GM6jq1SkuU6Uz0K52oN+t+cXSMMdIbRPKAL/3AeXZVHhgNjtTy070Aeawr8/uURZ3DqGRqC0Tog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b29997388c8945c9a34416a7f534dba5:solidrun,office365_emails,sent,inline:ccac836d61caefcbefa3c2641c859a8b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuZzYImPM+hKCt0Ud6CfBKISblXid/ajYv7wgRYbZcFumBH+h+tGVjFmn3xNY2pSFX7b7ZQaAxey8be2fMXzEEwdMOAx8CUZBbKMuHkM3imolBpn81rM8EPOrRXwLKL1Cv+uMCsP7SwUXf5r5nvD9/rG/4FaKr+varMX6HWbLjLuGQvS899VcYjHPPV4Q2SdrJur9PvfKBAbVz3jx1BxG8X1OC8JdnkywtnbkB4lKAU/w+2vrDSJim9D+4TziBbtw6nYG/8qKXTW5btmqEoFcYFydrmpEdU9Aw79wZAmg3QV58yAsdcCU50f5IAtiXInro1iFm+4NHGxU4MQ+jwXdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=BAZAFpu0kFhK6i5rIDu3z1eADZXIL2q1HaAwk8SX4ciuWKGf2J0+OzBrKvrLgcl2Lq15jd0DQpsDLFElZCI/5A8EdSLn8qJdNZQrrpu/ue1UOSMpPGGezjO/4BWGYb5I9d/ojUfBgZULd/E1MtY9FHR/ZvU9Py1T1rU94N5w6HuOdyYKdnb3qTUqMRblKn/xpO7+qbjGNMW/NwLB/S0C0covd6vW1cXe0cAerI9hwFbN/WKb9J0dgalRqpoEKGu+d8yBeZYyDomuO3POH23QaGhHoOlFzWatR9HbysOcmfAVJcZJgcoe0+6FqOEk/DxKtvUQu5fZO2xleUZrmMGOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000098.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f913f26-9a60-4de2-4f70-08df1d6e5c02
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|35042699022|7416014|376014|14060799003|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZRH6mbvoIC2Or6VZUQwR1P4qbpJk2NAe0OKlkXO/LcHU7i/NDZKkWAUQBu3gzo9/IM25AlbzhgH6YF4RQ1GjxVQAr7iBeORIzn9Vx2vG/JYNGSk7rfMv782GQa7PHbgT+xXMFEbk1eMNXulm6qjkE7sMtayCrYxAYn9iGsYWcPL/vQYy8FkKxzB7rwU9vTgXnPMu1sJZGIGmdjA+tOe5SbYe49GhUY3gVb0eZscXCY4oaS9xUYBUQOCyM4wZIqPmqyPcGqADHPEcmOCk8Wugu4JHcw7jCOKfqPq4f9P3bw7AiRSJo8M6ORMXANlM9JTZsiyHqkBeR7+TIYn4SbW1p5G5he0AKfP4PDZIJaeKPq3bjPIsHnlxFIndY6TkxMzzR6V0wJdwMTBoefSmwkcB/fD81rCMbS+NNnNRuIJJithpmoDEBjxf44B7ouTG/BpWLbre2ml725O/oj8EM/+wvr9Lix27xhfFNxLkvNlAsF/m+d8Sm7yEJ6GbjXAZDQfTy6AklaclEoHcB6uuA5v5gnOxPrMl8LU9qPJyt2GXbKpJ/RZO465hu86dvPF3ksWGxs6BC9XOw2UnWA7p29K4gWMVsv8Lah5FK94bqNky91lskAvpkpFrupmtj5uxAenn1ZmUt0p/v3boVzGG9sjwcFnAlzxxMPKaR/9s/C2VJr3sH8WDUF9//nv0r0XQot/EQEX8CSgDuacXBnOE8nJ/lA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(35042699022)(7416014)(376014)(14060799003)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PTQ5F0NZnKBFev3T/MyVc08mce7SGvxmPfn3IB1/Y+MdzRyXNXe8Vm8NqtysXsiuYsxyp+MJ2ewFQdvjbkuc7fN4pFXVpW/GX61OefVhPz98OKN2cbHEVp2U1/udEhWwkoDQixR3XjAElX2OelcCGMiqy0eIGG6dz1V/RaOvR7/Z803YJEQIFmigs/4LeaixJ6PiZ0rEODKCcCg/dFiqkbQpTi52gpNg1hx+5mDKGhXCAVFsKpUCyTafZu90gGDd9p6x01YEUAAAIGYZdkc5P1pccPm0UVNNPybgtdwk5/jdYVoXDMHrR4+d4Y7QWDOl5SVcgYrbIc/kBOwZHxPuGDiqA6ff3vmlWBIw/hVQUpgmN+OHhoa/JxVX4auiw2IxYZkGqYt7tmV9MGrlJlHMzjoP/PO99PYPRVliw9a046VH/BlcHn9s8767CWV5pztn
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:12.3726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6ce88b-fb3e-4f00-07de-08df1d6e672e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000098.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12026

The SolidRun HummingBoard IIoT features a DSI connector supporting
touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
SoMs.

Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.

Add the addon in Makefile for all supported SoMs SoC targets.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  8 +++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso | 79 ++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 69b1f75156016..0bc2bbff9370f 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -170,6 +170,8 @@ r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
 r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
 r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
@@ -186,6 +188,9 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-emmc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-microsd.dtbo
 r9a07g044l2-hummingboard-iiot-microsd-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-a.dtbo
 r9a07g044l2-hummingboard-iiot-rs485-a-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
@@ -205,6 +210,9 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-microsd.dtbo
 r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
 r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 0000000000000..f8584c473fafe
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		/*
+		 * Touchscreen fires short active-low pulses which level trigger
+		 * on i2c gpio expander can miss. Trigger on falling edge instead.
+		 */
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&dsi_backlight>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+
+		port {
+			dsi_in_panel: endpoint {
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&dsi_in_panel>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};

-- 
2.51.0

