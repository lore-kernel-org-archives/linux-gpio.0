Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020115.outbound.protection.outlook.com [52.101.84.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D66481FC8;
	Fri,  4 Sep 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.115
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523022; cv=fail; b=RDkaHDceoM207d0G44OfFRF0R1kP88Rt2ptcrMGRskX+vHmRsoL1kckbReYCOoQQ4Mm6ZSYp5V3dpxMWo4oFHVmheY4HlG/XOwx3HL1/yXTqU5jVgt6FSFyjqU9+v+eYwcxVuej9Xenra/gz2eW73aM/T5coQbWJGmz7ZGW8f84=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523022; c=relaxed/simple;
	bh=A8kz2CEkdUZIucfeDow35LTSLjIXCNnT6RBIO0+sm0c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=urgw4xEkaqlQI3iRU+LQlCS7VXcUe2CvlHiD4skd4hZ4zKbTlYpfUNncO/MIVJ6h1bFOaAMa0cJLWVk+imA0PCp+PrSIkmd8np3a4D4offnEwF4qe8F2fXfKFeEWe1hbRU11KEEi7Lt+yJ2Sl93MTo2I1MsmdTfR/aMUYyB4Ssc=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=IZtiKUGs; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=IZtiKUGs; arc=fail smtp.client-ip=52.101.84.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="IZtiKUGs";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="IZtiKUGs"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OigmnZyEuhcajyYgCMv5n9HY2wmmok6ePZc5+4jlO03yXkn0uQW2KOdBfYWxtMzsARrUKUiW+2PQpCbmUWnN+35BqmaBODS/g5iUhiEFD5O04/Fmxf6qAn7AnR+klY0fwHetOrD7oAXAIXkxUjGuxh7AZ33Zk0Qr9DO2RnEqhzqj3OuCN+6D/NhENKgpyootvrfqcRNf4jr/wLIsSm9v/YIXE7avOIyeWP+v6Ivs+avWWHVC77ShTo7B+VYUMBMQ0PoGxk55ITxOb+DbcC8t6FMzGEVBDNfHT8ZXGy35EFLEg97IyCvBnUeDN/FbbHH7M0U+mSFVU8lw7EDE2wQCIw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=GLkI7MxaBXiBe92SKBcSQtnGWIHz7IzmPBHyS568+mVwuV1ELOHi2L0kPLBUQv5A5oljM+aZikMjzKwe6sexUBJyp3gAy3pOgmPLiXmqz8IjY8i8ATa0nCXCu1mP1IHMTPyqLkApX4yb9ssiDQZsyqbMMjh9C2X5mrVPDSmS9xBgkSZJcLUsjPCuIXj8paTBgIHy3eU3MQEsGHqcCBtyvYfW+lCQ9LlCDkiTYuuKuWkqUtQ8DJHgN7hpP+R18N1UCv2S26KQBnn8IW53JmkI2cXiXn6YZ0jXubsBPRUn4aZWWPdGOcj2tN4Wt4BDeBiw2WxDhE0iAHKT16KcrUxUig==
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
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=IZtiKUGsy+cD4eUu03VyAlcul6T720Rdz4O7AWPHK6Pgz9//wopaTLzL+N3gifX/1qjcUGvarNpdy8+O1QcFqz/r8gFXD49wzBxDPNAQJVMoHOhExzIONBQq7Fo8ut793QRjG+J1ftjDbPAgLkjIMrQCt+15JI9MvOcIVFanRqb2oGpcG1GNwUQgJnR1K9EY9w7f9RBKTH+P6QNaMPAQHrcEl27tcNp0hdACvGMSoz1D6nZL/rxNQoG5kL/eF6SLe/RYvDzCCZL/yL5cu1pCnvsdTyAhsX8RjKr2K3JGhvG3ZnpR+PcePBmSVTBmwWhWN3vCytOC9Nf+AaOXpl5WrA==
Received: from AM8P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::28)
 by VI0PR04MB11953.eurprd04.prod.outlook.com (2603:10a6:800:31f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:50 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::4a) by AM8P251CA0023.outlook.office365.com
 (2603:10a6:20b:21b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 11:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:47 +0000
Received: from emails-920408-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 862F57EB5D;
	Fri,  4 Sep 2026 11:56:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523007;
 b=OKPfkEh9hKpekfK4L0EfVDzlp/TjXRGyxFMR9UOUkSCuUB+5pr3yA7dtKlWz06/IsxvcO
 nctegdzE68xu4e94+b79zr1bPXC4ODPpQBhOXjOY4K41KulFCZ4vyS3u8S6sPosp4YQXxX4
 lfHTcFz9zF7rwpEOTaDvxVQQW3qFytk=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523007; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=hXZYnVTrcjmRkgPO1tt6xqAyU1T1Hk0TphmRwLrNw6KWfmIR93KhEcByuYnkrTReGT67d
 jknvrAEpOOhD6+OEOqTeBnKi7CbJadN1HkFkX1kHK7HrzD/6Z1XeM/hbsWw7qy3z6750tS2
 6i8Xzz6hvSdv5ALEDCi9D53Jzpry1ls=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=IZtiKUGsy+cD4eUu03VyAlcul6T720Rdz4O7AWPHK6Pgz9//wopaTLzL+N3gifX/1qjcUGvarNpdy8+O1QcFqz/r8gFXD49wzBxDPNAQJVMoHOhExzIONBQq7Fo8ut793QRjG+J1ftjDbPAgLkjIMrQCt+15JI9MvOcIVFanRqb2oGpcG1GNwUQgJnR1K9EY9w7f9RBKTH+P6QNaMPAQHrcEl27tcNp0hdACvGMSoz1D6nZL/rxNQoG5kL/eF6SLe/RYvDzCCZL/yL5cu1pCnvsdTyAhsX8RjKr2K3JGhvG3ZnpR+PcePBmSVTBmwWhWN3vCytOC9Nf+AaOXpl5WrA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:56:34 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:56:34 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 04 Sep 2026 13:56:20 +0200
Subject: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
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
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>, 
 Conor Dooley <conor.dooley@microchip.com>
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
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|AM3PEPF00009B9E:EE_|VI0PR04MB11953:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4ffed7-4aed-44a4-beb8-08df0a7b994f
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 XwDCFmFucSeCMfALsh3wg8vzz6ejFP3tYyZOSY5E1zna/NVvgljOzQnj4VFS8XLCF+ouRlyXBCY1zSkMsPLL7Vhe06lvPBofbv5VPNzlsM2IiFOWhX+gMepb6hmqAdLfaL2tuJ/D7r/nE2a8SppRzBUuEhUqRNZ6gx8ytqKetOo96r68rrg8C+ayNutR5+CSg0T1uP1oH9LnsW3lLTCHbUD1O1Y+Q/560wjMSPzj7aHY7oQSqgSSVW+tIt3QaNCvJwO27NKfjSpVLHuqaaI4uDBN7tC8Vw1F2WeMROv+M3B+cV0vIQolbfY3gDmOs+rVyOnVEFJj6mn15TdSRstPN+sNVicsqchADtpEwBE05xJu3WFC7xIOAhQOud/+kC167Shtu+gWsFu9I3AG9LTnQGFf7g52J/G4UM3xs6m4+F2FpC39t6z8hppJVbDS8a/2JhwCoaAko7wf+StCCE6xx8Fsyp0Kwd4GQ7OE7KEUzaSbJ7j7korAEWVCXK3kE+a4aXYCnd+DuJfrxHUJ5q7gSvOsS2fYeeoTA5jvhrU8wNQaKmFJPTCrTXapwMQtdcuczuk0WA/6zT1l0BXVPipY6NI3ju90+L9lH5Rw0mYre5Swml//OdwSFHIxIk0E0V3j
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 cZ/O5fBz8roU1/KgrkKbuZmhUWaPvLpv0JwpZy+Ye4EtzibbAKJB8a7tIf5iBnUhbvnmASMXAsVEG1WHj1cW04Ljq43vNKnk1/zccKGJ3322Kr3RqN2zNIuvYgQTQdQ8IpovJeiPAXB1g2av1EP+6C5WG4mP84NJVVy2jFe2RQeq2QWX5yrFYgjjmTcYsp6rpx9pySHwJToIoC8AGFCAz7ZHK3JcertWeg5il47fv+Kcbvsj9bUzNaKaUDZXC0+Q1Cs14QuwhX6lPKtfeZIyzM4Jhg/XQsWO0pMdEmt10NYO8EX/79MSTilQqN1d/6cj9PSmgwBRv7QRfLtD4FkCrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b461b052693e48cab9532c2a7f820a8d:solidrun,office365_emails,sent,inline:ef287dbd44ae3e82555b579881cb5fba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQ3oe7dNgu3MZzvZ6CzNNG+R0jEenihG9IByHBWmD2BVbgd6eQFFGHpx6SvfRkfQx8IP0taTeVrL4SvCsthZPeLdvGyhO7jQ1Fqf4EZf2Bw6IUtqQUUnaRmkW53cQUZjvUxcy+4Un1yWrTLIi1XzLuPRaep6KRdkER2JD5BtqOSFIygLuBPxuQtNpX7lqj/5qEF5xbH0yxFp3QbL5EVOthbQTHJavJiYckroKN5NttKpECbCqdThWLudq1waiJDgkw/eMJJPd6V0U/8yBHObf/66kUoyicNr83OaVLaRHRDmzyU4aq73BnZ/nI3H2Z6LYiPvEj1LEpoWPuV/6awQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=CxQzsPDKmivn74xfj+Ht2HK/NzEvchmfsKcvdq9fdlkQ4KDAHXjryETW6MYx48ndNr59GPy5rqsgcQdJBigmZOLHoKyCeEu2/nrGPu/NteFO/uwci4ekPWJADBtqYb1K5u9PUEh56adGW5OMav2I2tA/L51+PC/Z5hlL553RBTXilJ8xP6Tqb954cv2TGSJ0xbKu7XMXjbUv0HDRbF7HRXLTcip4MUwZOHIyAcKAv8ovhhiztBWSdVJRCjlNugAxkWU0xEy8t2qt+gXIQ4Wqb4SyLbvgn0tRBVOlcXZcntmrcfi1bwnIibXQUYRHoqeLMS0pI7R7o/66fCE2vJlmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c1f5b01-be84-4c57-c5a2-08df0a7b9177
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|82310400026|23010399003|1800799024|7416014|376014|14060799003|56012099006|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ss9K9BF35hbyjUUcXSOZj2XacEplYOlqFAyDAeivQGwW/iKZAROIXa20VZP3dByCi/OYJSGv+BU3zWdhP2MYqV1bns0xgXSH9Iv5H07xOmgM345hSoU35SS2xJPzgC27duIA+GqDhy9kYqVQhRWMPLAwvroIciMxoWGwUJ8m6Fjz0duJH0O/gKw/A9QMKujjKDshNjZ9kNB/fP/O2Tmmanka9DNXUx7mHUnVRag0xGAMwxQUBJkdPPW4Pz2LRa7ZAsxCgzsYAlH5pa3cfNrgqzdbtGhM0+P0S/QomZRC4LeE8ACAW3bwbaci+1jaNvlOdt2K7Z+OKF14yQdd3lpXvrDy3Zaj8RMmOjKtQyUzP04MWqpmpWLz53U3UVsni7Ty4K+biZaNVTdqgWuh+HFMkiNIrqQZzEOJrX63vG5Ag6fS5SaPby2vFc7Dx5xZd8GJ5SjRoFg5iJidN8GwumHJrgoM2V9AXLutC7c4aN4kqRhaD9atbf2EgA4jE2snXESRYykyE2ua8w91tJvNmBqy8csrbbP+vvZ/XfV3dB+QfKbtjeGcipk/TQRgXMfItuThjtyuCDeApw7VLbKwu47Anj23YGBYFmaYzVZIAaxtPeFrUbgrOyjNnYxCvG1jOOIm
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(82310400026)(23010399003)(1800799024)(7416014)(376014)(14060799003)(56012099006)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d3Ewflmvjc7EzfE5CdO8W2Tmbr1As49XO8DeqOLrxjp5MGopqhxnYOT5/uTf4qh3uKItwmSy3hjrpvpGeA+aZipxjmW/3+0yK4viSUPJVzsHNqy5CzZzGEzing+/eHNQl5fTfntAe1raf4pyyDINfsCyuPeJsEF9Nu1qPm7+Mn0+1ayp93zfsuTFfS0Bvip0OH7bRUNRUWROHfjzNezCjmKLhJtuFIBbOpYPQRJS1q6W+UYRy/poqilRg6Ll01Vx5cuzKk/0dEdS3eXOSy8546VUnzXbQq08q64hmq/lbNf6jWqhisGZqkE0X8tzgbxvCwInxW4d3FPiFvC7iaaDGBNrXv6NsWqSlppbTKxbfNTOhG0zeFO7k/aQUG9Pzl5JkdX/g2/Rr4i52o+3g8bLm2qsSa7xQ+rdd+LW/PJ3qzJk8ZkAwpCEkP0xcoqRbdJD
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:47.8302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4ffed7-4aed-44a4-beb8-08df0a7b994f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11953

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

