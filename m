Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022105.outbound.protection.outlook.com [52.101.66.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2872947F773;
	Wed,  2 Sep 2026 11:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.105
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349872; cv=fail; b=I6mvQXrD3sUcoTBjeiS1vue07F21mI8bLomMWSMzN+aWRoHONa+LhV6wu8OPbQqDh0rqZa4qidlmLqQGstP2OpIBHUHUGIhzhVFZF30hVwteAQj6+KNIkxFGD9yiKijyKFS6ku+aDLS4KL7MifL9cJ94fkMoTrCou5C/fiNRVYI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349872; c=relaxed/simple;
	bh=0MhtHM4ByyIEcg7vGkIj+aWx12k9VD9CyuRY/1npoKs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tXCLIbfN7T+ANNc6MsKxeNoklwcczuwKDGygiVq3Of+tTK6bS7+TTVShFFRAS561L3PPXc7txjjZ9rs3D81EuFKJPXghWxmCEgAvpEbsK8DOJKSEzooW9Q+OxKjbV6EK6Lzj4zRPiQKc0hjTF4v0je7sKjet5RPsCrKhTKuM23Y=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=hDDhABiq; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=hDDhABiq; arc=fail smtp.client-ip=52.101.66.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="hDDhABiq";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="hDDhABiq"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P6BmUMzVXDIhetjpGhIMBJURlgNyqdwaQKoJEcLihP7piMDPRHEr/ZnC40zzuDz3ypkkLmNf5KmaK+j7OXiCxCzhqXVPSx/LP+NpCpAGjXYSCVEtC3JF9rS72QR0SU0AvNhsZbhckB3SFl3BjsTyvm9mPPYKVbxEA3GDyGuIT+pxHt0gli5+44oVW1XQXWmZ+WX9wuxLv0+l6IdL/vw64Q4DD3MUo0BMA0MmbpG86VS/K40bBNQgqGqwaSq+aBLsN3RF7pn8t/Wzru6hR5ux74n2qvxilcKPOhtoLzISo2jTEhY8C+L2cmJEaO9bq/BNvVxCLmSrN7vL6bdbkicS5w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqTQcCQEVeRxxEM81vetsa5IBWC+F2YRIIvqXrTJFcU=;
 b=wcipUdt4Tcpp/WaojrmFsIXqOZlRo8j7X+P7+0I9G01hk6BYo8kqdrhVLE/VAPWAvh8+QlRP9iZw0SM/HY2Y7S/M9jZI9ym+1CHxjzIQtv1NJ1Q3t1KfASLmXSimlPSBhxXYTbGsha03cdQlvM1sNgXlYbfeTSPcoZ10YkpYUDaCnIq4p5VxLVz7cGNWmzuJpbZ7Jk0TMFprxLhyB9i+E+SbMHSIx4bXg/bf0LJDX/7bY8Jfd935gLZAblINREeK29mkWezp5T5D1TO8ZyuYNU8AxxsFf71bM7AzMWKtyJ2VldVECqiSUc6LxivfRux2MXVsDzOjLbNJec9CzXjJmQ==
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
 bh=KqTQcCQEVeRxxEM81vetsa5IBWC+F2YRIIvqXrTJFcU=;
 b=hDDhABiqyASGsCTNdC/lZIcSx+zpJ5NLseEHuH4TZLjAvSlBAq+j4PYBKiwnbFvMJ6CCVOyYjL3OuP1DHi5/a1uoqIkpL3M4v+glzszeIlNKgqC+RBJSUxD0Hk+homlW1XVOfbqodd+DpLxvCxo12gDVWqJYkVMXC5CccLGkruQkT6FrA9S2Jh4+8RuZ56VvDRuIkJbsyKp+6n+Ysam6Qu4k7MEIcvUwYbNIC1SFs8GgdQKw+EHU1g+YTiPDgP7XJLCYApnoockGo8XdjtkNQq2YOQmIpTL0StuJsi5Vuu0VGAay95arHMDcDWyv+6/r6Ro4iY63yzMrDGicqrOIXw==
Received: from DUZP191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::17)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:50:42 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::69) by DUZP191CA0009.outlook.office365.com
 (2603:10a6:10:4f9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 11:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Wed, 2 Sep 2026 11:50:42 +0000
Received: from emails-4589615-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 230B281189;
	Wed,  2 Sep 2026 11:50:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788349842;
 b=gyeZfIH2BHQ0A8ZGp3EOsmn/qKSefVWNi4JITbdoW3BaGqPB06GX1J3icTGyMtailgCox
 ETImwaEJwsXTir9AUkJ7OsyT3KLMdHIdmUyunFeBZRO0UOupqjKCkYHsWFlMuH+U+W2fVEY
 gWSaVYaLxH02iqp45UivAvghtM0QNNI=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788349842; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=KqTQcCQEVeRxxEM81vetsa5IBWC+F2YRIIvqXrTJFcU=;
 b=gyL/1DaYmbgSyKfkFz8XEvlXSCOKcHX//ax4CkifJ4P5Uh3v4FEViZAGUel8piC2d3L9e
 V1bzDpmbiGZQUGa8M/Y3mrUBHziOok+sGu5sC3J7dBdPQicMBLzAmL830ydlamXJzLLd66v
 vkMEzdiVXX0iE/x0iVVO0PYuyloPDT4=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqTQcCQEVeRxxEM81vetsa5IBWC+F2YRIIvqXrTJFcU=;
 b=hDDhABiqyASGsCTNdC/lZIcSx+zpJ5NLseEHuH4TZLjAvSlBAq+j4PYBKiwnbFvMJ6CCVOyYjL3OuP1DHi5/a1uoqIkpL3M4v+glzszeIlNKgqC+RBJSUxD0Hk+homlW1XVOfbqodd+DpLxvCxo12gDVWqJYkVMXC5CccLGkruQkT6FrA9S2Jh4+8RuZ56VvDRuIkJbsyKp+6n+Ysam6Qu4k7MEIcvUwYbNIC1SFs8GgdQKw+EHU1g+YTiPDgP7XJLCYApnoockGo8XdjtkNQq2YOQmIpTL0StuJsi5Vuu0VGAay95arHMDcDWyv+6/r6Ro4iY63yzMrDGicqrOIXw==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by PAXPR02MB8248.eurprd04.prod.outlook.com (2603:10a6:102:247::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 11:50:28 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:50:28 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 02 Sep 2026 13:50:14 +0200
Subject: [PATCH v4 6/7] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rzg2-sr-boards-v4-6-4a456a422fee@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::20) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|PAXPR02MB8248:EE_|DB1PEPF000509F0:EE_|VE1PR04MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 231ac47c-9a7f-4cc0-b265-08df08e86a88
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|52116014|376014|3023799007|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 sPCUJOZXLKZTxPYpnRDBTngeMIYkTWYXquzbjqJTgrRU1BjKUSTDnuc/EOeQQ4yjo0hUjzwhO3dhkVi7L6zuufv2Aa2cGcpfbLrxIZUGJ2kHblwru3G8MoWkSEA9p+wA6u26cidJFPcpx9Ha8eU7TLfYPuJCfeK6Zm+6ee18i5menvOoRHeGYAiodIHzfi/YXUrucDVO8Qid559qP6eZ2AQfJsVEiCZS6S6mtMVW8tmldKWxnLz1diEG4FQfA6bOcm57DGGNd5bfnaIqdipJ1E/20msdR/zSfqAAiKkJrfWjRj8QrbcqFqoIK6FHIg/rTHWh8CsXnV8fFy71DRHUe+o1hgGZZjl5R4qLzs7E37b0uwDIvbbvsHyy7Y8pHLXvhaUvMK1EqL+MFxWvAopUdTwgsTQ2xo6QauosZme/SuYU88ITgeKOmfYCm78YYJnBme5UZ5i4O5wX0HEPpz37V1IXktE1wnwmEAnbGgf1CNEucOjUqzkWVe/6DrgLOzCJAAYixM/qgvlryaMg6v+sseOmUT+wsTnUdd9m/T3rg18wUSKtS0jBR8U65G9E7DItrDVgz/49swYHZ0y/6xb+6TQmF/peBaZyNlIsXt6YCoE6UGClZERSLqMMXUrB8QwO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(52116014)(376014)(3023799007)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 iXENw1PYW1x5jgmqTnWca60GaBxZkxRcLSsIqR+7TH9lYOrwET8Fy81Iz6wxvi1Z8tYJjVq/zWb0vCrmiXDT4FQSZD9C9nkEFGBR5/O6i3Nb/0mvF6VWRjD9Hbz2T47Pfua2blao6xqfFAzIeeDiuUvpmoNMrH+okcPulJmLjsPI7TlXGjl3iAGXkPHb+zDQwtXtg6DjESqRJOGpMaabt98TutMB6uyYkXfcapGfLPDq952KFi5wHGhiaMwXUm9fEf/89pMfwHwNr98hMSV4LrIrRkinU6xxNgsIAfv5VjhpcMSga3Pyu4u7X2blSIElehkbPaZN0AuJL383p8ot4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8248
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8303a2a4df5a494380660e89db1a251e:solidrun,office365_emails,sent,inline:578e1e4ddf8b6fd6dadbc07d47737aab
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4t3siDWC6LqtWdyA1252cJWlRHA9qxBzgoMR2laAmk2ZtP9eGoErwNv4g/DoaEE0YMNbFTovEj0wkhuqo1ZhPR72pFkM9sgqYdhqrRIuvWeRlzBJk+3SerJQv7E7GdDHg3G240CrPoRL2y40qw89br2LPaP03CXKro/jzVfeFOFiXJMjEevbhilXJy65nuvB5z0FKep5QzSAOxfWSLaLbWY1KW7q5XhCBugnmMBc7zIdT1mm/1JKyXQaCG48Ly6ECGZXwIuY/dgTOgYB9iQSv0RLy4f27ywRRl+DtAjPn2JYE//RfXkVGCh5yhEhayKPiRZ0tAIydL6UrEFgxcgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqTQcCQEVeRxxEM81vetsa5IBWC+F2YRIIvqXrTJFcU=;
 b=FoC+fd4tp4spjnBN5uwgXy5vspNqduCykqbGPzJ1u5NsDOBAJV2IPgZilBfgm05VWJXPqCOS2yahveCDApDEgwi4Y/S6wkO9gRvGL9Rc07r70y04k638Rf8WBXD7MDYnQxm4ufLlE1Z5fRUm8wMBPnC8iOMqui2ADQeKB1xkCemoLSGPjXjOYNPmpoMfcg7HaDbwT1gzL9vhn0DDB80I3SlnpLUiW+sw+eARlfIX7AY60IOu1nDj1+lCcEXV4E+L//Tnqr0n2AjIrDzmG7UWntzlDkOImoGkQQMwTkk0H1+OdBJH9NinZhnPAbM1caKwhDR5HIqlA5Jw7EFM9RxAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4481a697-8915-4e4b-b32b-08df08e861fc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|35042699022|23010399003|1800799024|14060799003|18002099003|22082099003|3023799007|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	zc3FL7+Z5ZW4ZV1q/Vutd/15cpIx4sKXUVAF8RkDmvEd/5L9uK7jWw3QbOCPRVwcEcuAQpbU0Jx+6Ql+1JPMU/yXTTxB2uxplw8Cspivu5vG4nWJRBWrPZqxOl6n44Y+SNKWNuz9ksdaakrrKvE0SIIS904BsmAniF8/qBRhIXapacxR0q1ZFKLjzC/h/qDZTpZqUAbXIWVgT9uJI1mQzQQ83TiVr+WMPV6lLJyoStOoA9AtWlpK1nknDK9grlNJ9zg+H65aRURtvbcG8B8UnHnMHlksvO/Cxu3blADBIBejhta5CDMqcshYDUMCFbZ/fsdaQ8TO0kyiEfhBUpjA0iUBl4XmlKbO+FV4GifCHkMwKwPLFsg6ZY2/ss61EJUYaJoL1Y6oT+jnxSsHitsihkWHDPgLESHMuk2XMCx//xQOcClNNHpdZpw/y1TxzqpHcEqG+A5E2NRNUFz22M5HUwsAYlq5WNhJOghKd/PvrMSMocdj6GRat369yOUxAL9pZ250U3qFJj8sl/lYbTrVle78xtQw5Un83MT7ezYG7KBy+hiBRnfkCyGdjUpcJ4tDmpcDFIBkIpKpphlkwy9puyb3nIrootli4KyTxDrzW110RzAvHU96tppxbM+Etou8K8maDWsS50+yfzDnQ24K/i/PceOw4PJVoiHYQAz4ZQY=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(35042699022)(23010399003)(1800799024)(14060799003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	thWjqbN4b6LR63LoNYmkBdbnMp3lK1KvlOXfNhRkj4b/I2Zsfn5TqyGeOLAXbn+z08sSNVPDTSUc6RrMFfFii9RMl6XNexzXekjhIBDt50gVrCpBKmAsftx7guVuEbQQa72GuUoENAEz1AI4zTLHo22y1Jsu8m74ILQ5k2k9Ja/D3CUdpjMzxoIrxAElhshawmt01qUdP1J+fOnjIXag6HrQNEvxwMIVPBriNw2+jcPV/khCk7iLp1RzHKdii+EpxFPhZVlqgKF8EhQ0AU26B6IA/wFP8vWrzgyUFLbi4jotm0AFqU8Lde2zLyx76WVljrXc/uNF+Qh3T8YfV1IbU7b/aI0UodpiRgNN/MRgn6XveB51sKZH6PKNXAp4qDpikcBmCvFclZbz4jERCESB/xKLnJyk/VgPrDhiOY/uYfkU1jVO2JvWKGZGUhml8W3J
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:50:42.2248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 231ac47c-9a7f-4cc0-b265-08df08e86a88
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

Add support for the SolidRun RZ/G2LC SoM [1] on Hummingboard IIoT [2].

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 1x 1Gbps RJ45 Ethernet
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
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 416 +++++++++++++++++++++
 3 files changed, 445 insertions(+)

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
index 0000000000000..468304bdd47b4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,416 @@
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
+		mmp_reserved: linux,multimedia@68000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x68000000 0x0 0x8000000>;
+			reusable;
+		};
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
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
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0x0 0x40000000>;
+		device_type = "memory";
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
+	sdhi0_8bit_uhs_pins: sdhi0-8bit-uhs {
+		input-enable;
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <1800>;
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
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* RSPI1_MOSI# */
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>; /* RSPI1_CK# */
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

