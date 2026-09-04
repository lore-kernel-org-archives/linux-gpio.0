Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023132.outbound.protection.outlook.com [52.101.83.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E760D48165B;
	Fri,  4 Sep 2026 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.132
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523020; cv=fail; b=SWzMrwRZ8ssR3qjcdnzA5685u1kuXg7Kg/seH1Sab3OLVZzsABou/hL828o/HfUJm9PvMaw1MPki/0SmU/4KErPcLOaweseR0lGPa/c+q0Lb4WYfsTATHzRreV3waE3/usSfc7pAm2AYnszwArxRk1R0ZElAot/JLmO2gXmJfcE=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523020; c=relaxed/simple;
	bh=g4TeWK27bv9BYFYSRS6V/BEgw6UYT+LKFn5dptHxrXc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L2RZM5CCRIhJmUKqS8OvR3a4UhqHU3a4y3zwjeFoO1PJ9liWsOSIONAO0m0SrFCC9BLqvjeXnbqxQHyLnIwHq66jxYjKtRxFFcd8haRpktgrAekMyywRx1co+yLpkR7dad7+yKIfu13bFWSCn4x8ezalE5kDwOVMVSEWejh7ek4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DboJcPTo; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DboJcPTo; arc=fail smtp.client-ip=52.101.83.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DboJcPTo";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DboJcPTo"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cSl/9cYN1qvBSx2GaafQ0DrqAqmiUxAB0T5ZAgeVDEBI3tnVmB6SOoTHnCIfn7R9z5d4d0xOUn0kCPrRmVqK4WS/W3VqRPUxdiZnA0jE3AqTxlRaWXoS8QPDxiQ6wjUE5pA6o2n531tGBoz4/WcRUNPs9JUI4QZRP1zqvsxCCwNgFbsD7Cxo3xJkAZjPFTxNaytUe0iA2CceXDYXXPUVQ9LLxlj7HMKBgT3LRF01U5Y3Yc7QJH2CeFccQOlXjibUoNUmfnr4c6gRs3mBe2nx+OZ89fZw4TgQjO6pbmD0MLjlHJYqn/C3aM60n9LYY7oxYLzphz9HBemR/X0dqQTUVA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3wquu1w4rbqunJ3ZWD9XRZgGTe690nnYXlQzxVFIfI=;
 b=iwm8TR1vuYBb89/NDqcV9wxxsRzunYoBnHV5dwU0fmccID0nJMOE2QBh98Y3+IAFA7u9aaQ+GPNvqMN4kL+Ks/JbSjYJbuoJWYOnZPAu7ckersXNuGydN2rTy/xVb5KLdxh0fDzqr+CqM5ilgveu0m9N8Ict3he8RHvXBo/YnRdwgS8/7rncP1lYTrqM2BWzJ2HFFjMv8S+2o9fFdTGNAZgvhg/YWCo20Y5lcduUutO9xtThsYQQADg7g1vDj8R1fUz5RGWAjIwRnZ8Xi4TQE+q0REyK3wQcF6K/NrQzexqTMcGkH7yeNufX77ytHsN5uabrhKTf+mAU2f1/TXRbmw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3wquu1w4rbqunJ3ZWD9XRZgGTe690nnYXlQzxVFIfI=;
 b=DboJcPTowUU8+7wosJp484JOidm+iG8jCJGxridty4Tib7onyRNgQ+aZ3I9RuQPtoWUT+iPQeO7X7qKrE3FJV8lELs2NmKXCyXm3HZOw9gI7D9UGZ5M5UWNdljQYWtckTspbuY1iti6eQKNZIeAkOyuq4yXwMljMzKo5P7nvWioeJaU//WswCvpp9B1svwiYh8axhP1S+twjcHtAFYpzOwVtD6xaJUZ4VYlQsi2SQlt7ttpYqcBug4Wfqk7IHk+07I2F5DGvgYETE0zeB+nAeomfSULhNV5l40yAkVZf/WLET4QrTdR98ISJzfyXZQlaMp+UyrZ7d3jDSSVw2FeKDg==
Received: from MA3P292CA0056.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:48::14)
 by AS8PR04MB7989.eurprd04.prod.outlook.com (2603:10a6:20b:28b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:50 +0000
Received: from MAD0EPF000008B0.eurprd04.prod.outlook.com
 (2603:10a6:250:48:cafe::82) by MA3P292CA0056.outlook.office365.com
 (2603:10a6:250:48::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 11:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MAD0EPF000008B0.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:50 +0000
Received: from emails-920408-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B1EC681D4A;
	Fri,  4 Sep 2026 11:56:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523009;
 b=GyGp4kQ6W6p2Vcz83zz3rBfTgRoY6eDWozKX9TFnnL691fN5e6MPdJl2Ndjo0bNfR2rRK
 Tpx2ZKwBN0BGEhi/R1FLujTIw6ONWz6zAoOEvLnjRB8DvSm7yDITHhI8JbSE9c24eglOH35
 JIwWwh//iMNs3uh8vtDW4JuwXice2dQ=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523009; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=l3wquu1w4rbqunJ3ZWD9XRZgGTe690nnYXlQzxVFIfI=;
 b=Br/5NkUYEuF4uRFkptCWpBaNIYFkLXB44qBqMJ6QESzcr2wVCfRT87V/SrwpZaM0RhLZK
 haMcUJ2yqY72Nneg3PbPi8jel2HBwvSWL17wRs/32KymmibgJjM58MoMzr95I3/v4ZBaIYk
 w7dn6R9tMIJ0rYwdRDf6XEWV+bMU3dE=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3wquu1w4rbqunJ3ZWD9XRZgGTe690nnYXlQzxVFIfI=;
 b=DboJcPTowUU8+7wosJp484JOidm+iG8jCJGxridty4Tib7onyRNgQ+aZ3I9RuQPtoWUT+iPQeO7X7qKrE3FJV8lELs2NmKXCyXm3HZOw9gI7D9UGZ5M5UWNdljQYWtckTspbuY1iti6eQKNZIeAkOyuq4yXwMljMzKo5P7nvWioeJaU//WswCvpp9B1svwiYh8axhP1S+twjcHtAFYpzOwVtD6xaJUZ4VYlQsi2SQlt7ttpYqcBug4Wfqk7IHk+07I2F5DGvgYETE0zeB+nAeomfSULhNV5l40yAkVZf/WLET4QrTdR98ISJzfyXZQlaMp+UyrZ7d3jDSSVw2FeKDg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:56:39 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:56:39 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 04 Sep 2026 13:56:25 +0200
Subject: [PATCH v8 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
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
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|MAD0EPF000008B0:EE_|AS8PR04MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: e535823a-2061-4025-db45-08df0a7b9ab2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|6133799003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 LuRe1kWtFOZsnW+5F3GuO3ce1x5Fkqm5PWZritN5RM6Ps/Mga1Dgc3ls6u0X2oxE1s3o8aE1UEDTtbBTPl1BlJnELMkRytfsGdPrPZi7gKL23ky7Q37TiPIUTN6pw04PJe1QchGusXOHzSOZPAFXK2KUHXEmSlPIGrVxOf1BlISdkU4DmDmI+cPkr8mdrcILMlIF2pJpWDwowINnofuA1EbK03bjR/vaH591wBTCVlrvKcAHK0FkPha7ccLz1v4nrLp/8QDH5k/I9oUC04TDdKN+uJVXFcH80hiBd1B0pDQIFEuWE/URQIiYJp4jUBBRVuRDjq8p8sOjEPTi6ao6q8C972eR3bm20qnGQQM0aLyht306XooW/x6AtxivAgBwdLPVMt32KT4Pm9a5jofRRG1wszy8CPL7WRrxHmjUJNyaSn3Gi6aHmzYp5h7a4SMHoI+SYTj8V0Ta1ep0mpI363AGPFNPvEGexdCwFDQ1HgCnU3YlEwZydPnu3oXgzeKvZR9oFFyAMg8KFCMczrIl5PIF7fh/BaHkBPh13uqqP2gLYx7q2Iz0oX0mfJSaoUGADlguBsWOAvfu5GzSBHP+ReQemm9GbfUYCRLKguYYRNB8Q5XBtZ72Uo35VGI/6INg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 oIenx3M8t+vr5OcO+bVB8yxoeD/rHN14tBVikSJH/axGYvelPG+VTEiIC6MVzL+//6dUVXnGHXSplxKpWlWhdXZb5T2v31rh8EYv712UtWDlX0dfCCWD8FFArKGuoRAiP1UAvLYiSS7xjkZDzDoOaszK5va4CqCkZ6M/4CtkP380ZUxmioN3I2ADe4QmqTzRzLUsWskcsEscK+Zraktin43iC2yVP0nMolmnuqcuttiIXFN2McPw2xSE6ZfQcCLRuuhcPPGpMd1W5+KxxKeq1mhqEhfVvMUANqVm9vLwAbogs4m7gQPDncn890/dyeh6mVXQTXpxspKQXVi58mRNKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e7596b9e48404b1b8426056a78e259a4:solidrun,office365_emails,sent,inline:284ae8a1cf75927e32739ded676cd9cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPu11Ys5bDSvJo+wmbc0cVhDxDVP+1emzgf6YrQv3/of6Oz4J849dUcorf8NQeJNJHbOpXci8ggN+VdxKOwy41jDUm9yyi5p21lzdL6D+e87avQhCaEDruYEIC9Bh6tl9qyQcCdxmtpLlWhDC/6ZO8w2AJaIlGGVK0ZzixsmBzQkidJAH05N2jFDWwesO8ZSd3chaRhdX/YEyATJ/s5BQ52dmJ80AInzf9WQYnsT/IMyXBspoWMkwT+DcdW7EjYmyX9X+t9sSSZwZ6BgRz+rck14FIqBqI1cmOlSx/BgzqF6Y+Ot/7G6OCBOTQ0zko0xViRsXSfoEgt8e6AI+MRnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3wquu1w4rbqunJ3ZWD9XRZgGTe690nnYXlQzxVFIfI=;
 b=FwVnOo5RpmY+fUIq4M3CGU1jpp7uNNIp4aiJp2VYCVoEThJJjlb4uIkOSmLrX8GV1l3n9+hZe8ccdFdzxIflh6AyLNaPwmZNVFlxc77aCkYaFoax4+f+XrU+sYufvWsKdPgRKMRHvINp0D8XVRfKBEJWfIuJvwElWSpWDdQAQu3fdleUOoJVTludWLJbnjFQBCsIlPs1Uwj1RaBO9ijUgBr5XJqa3mlHnUT0k/3rU8KKX9P2vlKHp2L33Vwh58KQx/aTRLVp8MiJaJECjKeIXXTkokpOb5wpO/gCyEbI4QouUBe5/fiFWIUMU6p5iRDYvkOQ3Au6lYUnujQZddiI/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008B0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ce98e78-f717-4b9f-1616-08df0a7b92c7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|36860700016|82310400026|376014|7416014|35042699022|1800799024|6133799003|10067099003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nAKBth23g3YJlwpZayw86a7IvK9vk2Y5d3oDRAWZy9/kwCjVvgR7+zKLnjSyn04Ns/YNgB4z7wGZ8fOc6KKzCaadYQJdDXTmaT9oZcPjMbR+4SVOxkVdwO7Wa54/aiY5IG4aMjguwz8589nc8gaROfYMBjHs/aLk56A0GdFG/9sHTwkrx6e2/kG8H5Zipdb266Gfvo2MNcJ2BFZgrPeP1m4a44TnJiiMT7caf3QVIPmgTYOD9+kM7tZv7IpjzNHuFAOSEtrtWspfC7QgDI7qaUNV34xYEpOkJaE8ZCZk4Bfms7bkjnKVuZf517TWG1K1xUlYp3JouEftxaAnmULUPlIq9PZHivqrgke+IuInmaF/nNOlqW3ayAbSS69ZUw3GOfoRmUfJl4erbcN7wl+mPxAzJlfNi7g23dKBzOPEXX74wN7o+V4XjKrpoBYEDWoqJy+uUe96ma37LH169LmDSwOt6/wteFnjCNL/ZKnPZ6Y4vrz6t2uFLy3dRFz83bEaLxfdKuayZiWn6PrZflfDQd9+Olp/1xp5+LazF8gqZjMu6au3ISUiiSPa2NVLyOwP//w73OIq5tyZs1OCgJf3PIKgTwZb5i2rOtdDPjQZXnZW8oNgERN4xZLiSYXHv/zp
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(36860700016)(82310400026)(376014)(7416014)(35042699022)(1800799024)(6133799003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lmYteNT7atKb58joXSNoR9ZldASi5WsZtb/lQt/L2FiZJl/Fy/Uj2TKUMmREM9zq6+CF3lrn92MvPFtQC+J7OKcudIBZJXqMONQiZbL5weUT7PacPau1mbXgaBAiGW6P7zMP+WXMtYjWI/1m7/66daJ+mOWyrLmDmonQHGBFbrOymkYZIw4nxLqaS/Prju+dkEzQ8pIyfSlq8z8VZhOFOt+f0O8u1ujTU73xAXLkANucDtRQ0I6MaXtMN1NKUCldQwzyHPMToFC/EHZX1YQjP9hTq9p+SdeBSaapRuoZLwrDvSqrOjxdQ3OSenF86tlGeCXyrnIRTSQOSZ8TfP8WAq66DQ9jvXsDhog98UjMWRW7LbRTzVPbVbylqIG5KNetSKK0PDwm7OvXwDHfKrNBD1M0Kd21iILhmDte6/xEaCGfWjKEIFACUlwKbek6M+Sd
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:50.1215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e535823a-2061-4025-db45-08df0a7b9ab2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7989

Add support for the SolidRun RZ/G2LC SoM [1] on HummingBoard IIoT [2].

The SoM features:
- 100Mbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 1x 100Mbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)

The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
slightly reduced feature set.

Descriptions for eMMC, microSD, and RS485 are shared with G2L.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   9 +
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 442 +++++++++++++++++++++
 3 files changed, 471 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 4a0cde8cc3b7d..69b1f75156016 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -165,6 +165,15 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot.dtb
+r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
+r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
+r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..9cc21ae32ed4d
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-iiot", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard IIoT";
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
new file mode 100644
index 0000000000000..18dfdeeb1d663
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC Solidrun SOM
+ *
+ * Copyright 2023 SolidRun Ltd.
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		rtc0 = &pmic;
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		/*
+		 * Physical RAM starts at 0x40000000, but Renesas RZ/G2 BSPs
+		 * reserve and hide the first 128MB for TrustZone by default.
+		 *
+		 * Minimum size for this SoM is 1GB, and the bootloader patches
+		 * the dtb according to the actual RAM size and reservations.
+		 */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+		device_type = "memory";
+	};
+
+	sdhi0_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
+		 * on-SoM eMMC and board-to-board connector using one gpio:
+		 * High = connector, Low = eMMC.
+		 * Define active-high for logical mux state 0 = eMMC, 1 = connector.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pmic_buck1: regulator-pmic-buck1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+	};
+
+	reg_pmic_buck3: regulator-pmic-buck3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_pmic_buck4: regulator-pmic-buck4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck4";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_pmic_ldo1: regulator-pmic-ldo1 {
+		compatible = "regulator-gpio";
+		regulator-name = "pmic-ldo1";
+		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	reg_pmic_ldo2: regulator-pmic-ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-ldo2";
+		/*
+		 * This ldo can switch mmc host controller io voltage between
+		 * 1.8V and 3.3V by assembly option of pull-up / pull-dow.
+		 * Default assembly is 3.3V.
+		 */
+		regulator-min-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
+		};
+
+		mmp_reserved: linux,multimedia@68000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x68000000 0x0 0x8000000>;
+			reusable;
+		};
+	};
+
+	sdhi1_pwrseq: sdhi1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&phy0>;
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the ADIN1200 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		/* Level interrupts are typical for phy but not supported on rz/g2l gpios. */
+		interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&gpu {
+	mali-supply = <&reg_pmic_buck1>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+	};
+
+	i2c0_pins: i2c0 {
+		input-enable;
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+	};
+
+	i2c1_pins: i2c1 {
+		input-enable;
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 3, 1)>, /* RIIC2_SDA */
+			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* RIIC2_SCL */
+	};
+
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* SCIF0_TXD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>; /* SCIF0_RXD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 4)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(42, 1, 4)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(5, 1, 2)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(5, 2, 2)>; /* SCIF2_RTS# */
+	};
+
+	sdhi0_4bit_pins: sdhi0-4bit {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <3300>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * These pins are fixed-function lacking independently configurable
+		 * pull-up, pull-down or output-disable.
+		 *
+		 * While unused, disable the input buffers to avoid sampling the still
+		 * physically connected but unused eMMC lines.
+		 * For output direction rely on correct controller bus-width configuration
+		 * to avoid over-voltage to eMMC e.g. when operating at 3.3V for a 4-bit microSD.
+		 */
+		sd0_dat47 {
+			input-disable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_4bit_uhs_pins: sdhi0-4bit-uhs {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * These pins are fixed-function, lacking configurable pull-up, pull-down or
+		 * output-disable, while sharing the voltage domain with all SD0_* pins.
+		 *
+		 * While unused, disable the input buffers to avoid sampling the still
+		 * physically connected but unused eMMC lines.
+		 * For output direction rely on correct controller bus-width configuration
+		 * to avoid over-voltage to eMMC e.g. when operating at 3.3V for a 4-bit microSD.
+		 */
+		sd0_dat47 {
+			input-disable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_8bit_uhs_pins: sdhi0-8bit-uhs {
+		sd0_ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0_dat {
+			input-enable;
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_cd_pins: sdhi0-cd {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
+	};
+
+	/* SD0_RST is only routed to eMMC which uses fixed 1.8V IO voltage */
+	sdhi0_rst_pins: sdhi0-rst {
+		pins = "SD0_RST#";
+		power-source = <1800>;
+	};
+
+	sdhi1_pins: sdhi1 {
+		pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3",
+		       "SD1_CLK", "SD1_CMD";
+		power-source = <3300>;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 2, 1)>, /* RSPI1_MISO */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* RSPI1_MOSI */
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>; /* RSPI1_CK */
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+};
+
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q80bl", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		/*
+		 * The BT is based on BCM4343A2. Murata 1YN variant seems to
+		 * require driving RTS on open.
+		 * Use compatible bcm43438 to accomplish this.
+		 */
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <115200>;
+		shutdown-gpios = <&pinctrl RZG2L_GPIO(23, 1) GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_pmic_buck4>;
+		vddio-supply = <&reg_pmic_buck4>;
+	};
+};
+
+/* WiFi */
+&sdhi1 {
+	/* Murata 1YN max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	cap-sdio-irq;
+	mmc-pwrseq = <&sdhi1_pwrseq>;
+	non-removable;
+	no-1-8-v;
+	no-sd;
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/*
+	 * Host controller IO voltage is provided from reg_pmic_ldo2,
+	 * WiFi module IO voltage from reg_pmic_buck4.
+	 * Neither is configurable at run-time so either can be set here.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo2>;
+	status = "okay";
+};
+
+&usb2_phy0 {
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};

-- 
2.51.0

