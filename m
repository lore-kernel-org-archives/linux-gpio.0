Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023113.outbound.protection.outlook.com [52.101.72.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD844E36DF;
	Mon, 28 Sep 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.113
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606425; cv=fail; b=tKH1XtBXdXycNCfm7AEkDaYNY07g8LR5KU8ZyBNZXpHnBC/fOXdxsa9tywWKHypBcRU0n9K/5+7G6EtLYgKpiP27SenQpopdHi56fcPitWa8Lw0jkmNMFG0v14+HWN+vXFm1dAoWHW0P64T+ksCncyWc8EbOsT16rMFOoOAc+Wc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606425; c=relaxed/simple;
	bh=5jGoNYUWIz27KBbhO/ZCli0jMLasroOl57IFArc46Yo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UxYj6oZQQhfUTb3GywKGxx9rp2u8jooCyboM2nH4BGElIr61+nna1X/+xoumNenSnyxXxUqzfUPsfUZIJcMBusTRrM4E8vglj/c8+/RzvnHNSzwC2ZqAEZaDbiM/HL4rztwJD6B/Z7SNYnuH+H7ORXYvTFz7mz+aG0ZEvVHUx5s=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=OzKrNpum; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=OzKrNpum; arc=fail smtp.client-ip=52.101.72.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="OzKrNpum";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="OzKrNpum"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qDjrSDc0pp9EfJ39Xy7Thx/oy9vZq1WMBeMtN3I0hAFq29hirXCAgdjlqWg2nwJh5X3NHEwqyqBAykgo/DTL45Z4bZBTMcmwihX1AythB7yTjDlYUGmh6Amdst0s+8ikWwWTvCpHy+dS6b2jik5xpHGTGe1N+2yc5lFv3J0onF5q3kVD6taq81O7crr1wihA0XDskKMD91a3iPUEemGzme3mG+0w6B76W9BL2Y1e/qovqlQJRei5svvrBV7mVH1z0r7Rz49/MnCtgEc9iA4etgtaR9PD0IRZhQnYNWewb8+xJtI3CLPnOBZi253a+LlKkh/jfOcZgmPOUtYlTBagaw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=g7Cfl3WOTUFMAqzdpTmzdCZCIhRkHrFupOySiGJBnVhBtG8WV9kOc9n9r79/r6PNdSK6OH/Qwe8N9sxjye9wQeSG3zgUl6ZH3ZotUqacinborrn5TJFoA67zDbJHCg767c4xH/maQe+vCsQXC6mkJc8W68UX3Djq5D0yjO8N/eCKDgqVCrUIhIK2VjmsEHWrsfbr5dQbxGbPMGLv4W6RFkbzsJRXBycjJ5y2NNB3yv0torNVxpGD2znn+oB4yGWzs4xI8AVukpWnZftzcSEc6qvrzpGfaA7k58ttrIiv9v+X9skKxN7KX7m4P8t+qGZrb6JbBJZHqvFZfQAUBcVGwA==
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
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=OzKrNpummmb/bCY3nnjpzJsZpduUhfqXgdSwqUV/Ut+f+dLAkD0woAYbgOQTDKZRgXlIc8JVJ/aApUfnN/AfocI8zdZpR/De+B6MzXjUZ5zd0A3tsHaRPDrzcDmBoylLihf7sI13pi47xP4JI1u6XgFDvGqgfC/hz4YotXbodBqfPTRiiIFg4cyd7rGA/zP259kaf7EoW5RFQGonJUA4mcBvHDBB+204sxnIgTbqgxw9CcBI4lXhNYoD6plOf9LxQlv5Q8mlUznhrCmhVbaT1RyBQUy+/3kYWjcNqhD6Kd3tKVbY/HkWkcCIvobGz6acHUWEHLnbvO5B6jPe1E5zbA==
Received: from AS9PR06CA0032.eurprd06.prod.outlook.com (2603:10a6:20b:463::8)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:40:08 +0000
Received: from AM7PEPF00000056.EURPRD83.prod.outlook.com
 (2603:10a6:20b:463:cafe::86) by AS9PR06CA0032.outlook.office365.com
 (2603:10a6:20b:463::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 14:40:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM7PEPF00000056.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.3
 via Frontend Transport; Mon, 28 Sep 2026 14:40:08 +0000
Received: from emails-5788339-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2115F7E90F;
	Mon, 28 Sep 2026 14:40:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606408;
 b=oKVkaAoZieLggnhZNJ+xSCXdsbmIzy5YMka9xuzvENoS4L6NhSsEuqkKBmSXIZjFeTGE6
 evGEcPfr/DA+5S4GFpy6d0/9QuCnAwkaULObXryWlFM3qG/yUhZbFUBsFPf+HTBGxeIvadM
 zpEIuW8mejPytAGg9uExOdhjolvEUWA=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606408; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=pFr9p56lDDLctOgk1ULAgt0iSobXZwc7UQF7TID84ypABZ2KXPJsgFapfY6aKFmV+pUL5
 FcmgYId2+nnsgG7WjvxUlhi/uSr4Yrj/kZfEecvj/RBWOIwB4tPh9s2Q2VClbO39fn2NfZi
 s/znaE084CMXsQYajMTOGg24gbfVFY0=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=OzKrNpummmb/bCY3nnjpzJsZpduUhfqXgdSwqUV/Ut+f+dLAkD0woAYbgOQTDKZRgXlIc8JVJ/aApUfnN/AfocI8zdZpR/De+B6MzXjUZ5zd0A3tsHaRPDrzcDmBoylLihf7sI13pi47xP4JI1u6XgFDvGqgfC/hz4YotXbodBqfPTRiiIFg4cyd7rGA/zP259kaf7EoW5RFQGonJUA4mcBvHDBB+204sxnIgTbqgxw9CcBI4lXhNYoD6plOf9LxQlv5Q8mlUznhrCmhVbaT1RyBQUy+/3kYWjcNqhD6Kd3tKVbY/HkWkcCIvobGz6acHUWEHLnbvO5B6jPe1E5zbA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:51 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:50 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:29 +0200
Subject: [PATCH v9 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-1-5901e0fc9e44@solid-run.com>
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
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>, 
 Conor Dooley <conor.dooley@microchip.com>
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
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|AM7PEPF00000056:EE_|DB9PR04MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 62baf9be-85b9-479f-334c-08df1d6e64d0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 t6Ta70FN25FUNVH/boJkm74L/b5aBumG2SzwUlOp2fVNMgEBKibkCANYbNvZfgFYY7Nrwq5p5ms3lX2PL8Y+wp5d9+qBPnm+r7wU3QvBlJ0t5OaeMuI62oBt3TYAYaIEpgGEESD03LBtHG2zpNiO5u1MTLM2vbix9ug8BixY+Ktqq4zOfNNV2WgBbRVfzsXnSutP1tOpkRWl+Q19zJ/AsitRwEuO9mW7jric5tRg+/vTxjM1MRSXOU66Nb6yETkRcOYfKcbLFQMh8ImN4YvpBTM2QIQmhzaAm0fal4DMakCLRScN9oVS7LQczMryk0z0Z5FS5vynX+3No9QVg45HBcRhrc6lxOuaBOoqiZcSBdOSnLYLBmctg0zUe+CX9DSD9HFE8IlJtPgyWors8ZwHXeyy4H6pq4xlAk9qlAT1b/TzTtvxUkc8Ojnv0v/UZdZqhLSh4Pfx10bcTWPobMNhRa2RvjvBbrbDaZKAlELKbaYgK2UTvMuaqXbKF2ktWKY4egLeNs0wc2OckKzrant7o+Vy3WNy4JSay75qeqK5RadNn9Y73YyuLF5ntsh+yITB7HompowKvodS+NIx7OkMqshFPnHmRXwM5lubG73eLmvB10u4tMzj8lbY1/ETAyEY
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 D5kHV4xvpVxF20A2Y5d1IpbxUH00CtF/tArcO6lSYVwCVVAXri59vrxZdgjdDv4ZUH+cJVKtFQJz1/nQ3J4DbMfnmwpHH+oA0ywAm9NK7tbEAKT8v3OHZLI5bK6uhy/PTXprzYeYAQ0ftfd0rWl5cFoBOc533oM3OP3yfNnkz/HFM4Sk0Zx45bh1X9x6lu+Ct3Z0cf0c1pUlWibCVL7os+j5gv/yG6nbwSQSH4ircPT/fUj8PtT5r4a7iFHnb2nG6KB5CtEvEK9Faj3E92FqN+ECs9yVFENf2aJ6FdjRP9By0Fyr3rWArJQ4jtktFQbIDvxm3eegdFPmUfdjiWTxLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 28d74cd05ccd45d4ba927aeab1d74f07:solidrun,office365_emails,sent,inline:d428041852016bcc33a44df791ee9f08
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUl+UOOyWt1bxH+jm+uvyuqHGqseLRcqIoekvXcreCcmnY6ShEPIaBIyMABftrsndCRer25omcIWu5R7IrhsX/3eAppPEQUt6oEFSolSFirWW4D47/AVbDuGZ0jJPIIEcaQuJNfdZhkkoRD/nUqw1R52S9U5Vv4gJEjB8qwGLE2SisMMMe53qhJWc/TFPidQ3bx13ss7KXwuwjscrZ0caaBB5v7mt9UjHMbtzuIGeIrFS1S5zTijPj7FZuoZtHeCqbZB6rAbzSxYSMogfmeCkdRV5SkBfpvPFOl9N0P/Wt4RBCm7Ti3PUvr7y5AfQWda9VkjVCgx4GvKtf+hqlopxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=ogRF5xC9m/UqZ2vwbOovR8KkboBV9bIN/y7F/alyzA1B8gAqOEyCXQjw3kxvVffHv3YokP4MAGhtESEbLWGr9exDn92Eim1Rf8sIaIGtU+7JxeX8PuMBXYal1jpE0snz74vCEQgdjqxqSu6xag83pumBxpa4l91lXIgSdn2dj058owMlBanhMfsCYGPiSiTcPlwwelCSqy4+527g85rKrouJeYBPsGGLYcNegfJv0OgcgtWQNuxGAbEbERUG2pBhJ4+WcO1XEsKCvWKFQiirDsK+HLpHLgEE7BJNt24DEK29mW5NmzkIY+4PEOCidyueaTe2rprUT5c4x+NGMhncZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7PEPF00000056.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57d6fbab-d715-4e30-5da6-08df1d6e5a4b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|36860700016|1800799024|35042699022|376014|7416014|82310400026|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KvuIAMjdz0mJjl9rr5NQ5blOUEdI11DAVSgCRCIgXynRftW1TdBs+/OG1VTue7sCfN8cd9ED2dJD8/ZbG2bj6yKKgn3VAJTGj5tk4G77iHqXBwo8yk+wI+8Fd+1aMMTAtKe2koW+utTHGsDrwsyJiGbwR3k7njlZ2ifDix9wY3FIfmmCRlIDKlfry8AxEZIYyuaytYp9oJqiCrD9B1RvdBmNfb3zKuAzyUbtWEH+dVEmBWAPXvcOvlPXAss6chzD8hvBKQ98gETc3ZnK+5qpCKCS4VwpaiYalJnSpPVilDZi4+ZALU7ARWOLXgGxE59/v8XEbCpDNyGpX5OAO5tpxuX6pCDJWifxrBulbe7BIBxVVpXicBan0zSFx2Af5Q9EEDOqqg4PHObsEY/bUMNXEwb1PAyI+V/29ld46otr6v3bfInhgM/4TvqHDKyoDVQIuDH5NCHA0ItbvldIbvJ9q1PnARZZV8cTO22E0W5GycahWGwaoH+0CHeAo6EGTN57js1rhjk96GynYjLt2XE6lZ9tYNKMEeoRD0qXvgUgUcd7pyFpwGwC32K1IRbLfvj2ATqa1kGbefwadx0VNCUgvLcW1SRblk+kvxLA/FbHWucHW2d8IRP52j6FEdjOofcCDxT2iX4DiAhcWWGmK+3TAAEX1uKUBVWBYyqpLSZYTPs=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(36860700016)(1800799024)(35042699022)(376014)(7416014)(82310400026)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cRUiShsD58bvUavHey4mR1bxTN3i7i6Iek9b9e8SONfTzgMkSHb0uEsBFdyGKzCym5+Io3YXlsXMU9JQ38M8UDQGuZaYTCuFR29BxHsUfLliHMcDBOFxn7X4Exfedcn/6OBW1sfLCZf2lIhv81NuJv3bQg15DDsIrCF0Hlr0T+m98OEktMZd1wNGZSc2immjbRNuinETszAupQBiDoju9YJvSoDvl+wq1p2T7yD0K7LB3ngrxxzVcLN4CHFrmoK2T7ZXUS0P26qMBGbz/7xTcsaiqmgDqVsAr4tgq2/zNif6/cPGxAXdG7WctTxA9tSJTjWuAtGQw+3PL33qaPLWhCR8GqsqaEqExiPjm1yFnPs4eznoN0R3fsMQt8X11R+vQPJAIk+X+0Piex4BT2utNuajzvIWa8+2OIbpUxB3dfFVa3O8/joUezhlsZtAN+0E
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:08.3849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62baf9be-85b9-479f-334c-08df1d6e64d0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000056.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs:

- RZ/G2L SoM [1]
- RZ/V2L SoM [2]
  (shares PCB with G2L and has very similar programming model)
- RZ/G2LC SoM [3]
- RZ/G2UL SoM [4]
  (shares PCB with G2LC but programming model differs largely)
- HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
- HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
- HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
[5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
[6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
[7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index eeef34e3d7d07..1673005a3d930 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -508,6 +508,14 @@ properties:
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
 
+      - description: SolidRun RZ/G2UL based boards
+        items:
+          - enum:
+              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
+          - const: solidrun,rzg2ul-sr-som
+          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
+          - const: renesas,r9a07g043
+
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
           - enum:
@@ -519,6 +527,25 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - description: SolidRun RZ/G2L based boards
+        items:
+          - enum:
+              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L HummingBoard IIoT
+              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L HummingBoard Pro
+              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L HummingBoard Ripple
+          - const: solidrun,rzg2l-sr-som
+          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
+          - const: renesas,r9a07g044
+
+      - description: SolidRun RZ/G2LC based boards
+        items:
+          - enum:
+              - solidrun,rzg2lc-hummingboard-iiot   # SolidRun RZ/G2LC HummingBoard IIoT
+              - solidrun,rzg2lc-hummingboard-ripple # SolidRun RZ/G2LC HummingBoard Ripple
+          - const: solidrun,rzg2lc-sr-som
+          - const: renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
+          - const: renesas,r9a07g044
+
       - items:
           - enum:
               # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
@@ -535,6 +562,16 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: SolidRun RZ/V2L based boards
+        items:
+          - enum:
+              - solidrun,rzv2l-hummingboard-iiot   # SolidRun RZ/V2L HummingBoard IIoT
+              - solidrun,rzv2l-hummingboard-pro    # SolidRun RZ/V2L HummingBoard Pro
+              - solidrun,rzv2l-hummingboard-ripple # SolidRun RZ/V2L HummingBoard Ripple
+          - const: solidrun,rzv2l-sr-som
+          - const: renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
+          - const: renesas,r9a07g054
+
       - description: RZ/G3S (R9A08G045)
         items:
           - enum:

-- 
2.51.0

