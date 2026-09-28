Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023136.outbound.protection.outlook.com [40.107.159.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113EF4DD3D1;
	Mon, 28 Sep 2026 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.136
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616861; cv=fail; b=f+4cXDVaPHTKcGatOHHS5IvF+6qvwFd4H71NFui9sQMTyanCT7meHtKZdlVhgeBkYb5o3+h45y+EesZCmOCK+SZSTvIDPGCHh/MXkWU9iUTlbY2HBQbPbAv46g+1nlqpWoMkvEYiyaPVGO2+/BEPjQg3wmPpxqUbu2pysC+nmWI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616861; c=relaxed/simple;
	bh=prZYGN10toKjxYc9bnWnf0Xmk8UBAKjBN8pgF4BsNk0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hX3kV9fqnUMA4Y3+G2izvU2C+FnLQRmxHTQ+AxRKBbNYT3on+15fRTri3iWXZOyyBuOElP+7k/52iQWgfTQPmJgagFLqFCcnVyGs4VgisAFf+mUsOHDuNNFrUpi+UzIr1Tn1buSzcbraV0O+xhu+CXeMJdnVjmVXlyxPu27coqk=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Uuiyk/aI; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Uuiyk/aI; arc=fail smtp.client-ip=40.107.159.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Uuiyk/aI";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Uuiyk/aI"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s3AhvQ2dNm4ptY1P8DEd1ro4jmAuISxzVAE2C/NOUBo2NDfJly2hR7fZ1lm8+G3FrZ9NNCLj+6nUecH4jlu0UuacL4c681vzUKr3nIMX4f3CTf4Qc0pZx+SL/Ra2BMDcgHufuRoW2RJ7DbQg+JeC0NGgWQ3BjjkkLVqb35rHkVS4IVWvOBwwE9OmUUrOKL0kx8TnEmFV7JIPR8EeM5ETKtGcNisfqTOITOueTg5j3Zw1iFhmIEwu/e1p0KP9Dv4J/9dqmWXTcIlGnzBF66lHp6LFotkPKpP7ZAvaHexM9UBxl+MM62jjYBUicXhQTSxKZnai4pzbs7ZRZUH8Bk7RhQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=ySZJYzCMaQ4ANhEjyan4i1LuI4R9b5vFkcSwiBYzeEFdH5S12hZ9qtMlaIW6DAzadCwAA2hXvR/v8vFWjhZtX+snqHtYj+LA76C1h/vmm6y9QPi0VN9lHfd30PRycyHuTOd74a6QwOQzb5C2O1YXIIKty6FivONwIWyJECVUGxA+E1v6n7JaWwHCB29zUQqsdlfSO9hvSRszORah+va5vk3RBOITgkXZgea/6jd6Kgx/r4GRPJJll+fYCvFYWYiJY4Fy2hec8q44bb3tszC7U3XdB8/knOhE3TsCFOZCgs11uI34jHA6LdSHX/smKuDBEZY6H0WN3Cocw6yVyVyyrQ==
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
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=Uuiyk/aI3K20wPJQK8JprtVJasi3kJRsJA/Wh08g8RWLDvbIuy08jDk9iFcMPzc9ZLRIeinO0dzTsq/smudHagFCTOoE1yLiuZT6srr0esoJNl5cuY421B9E4bB6dzPZGJadldr3+bRv6Xrexq0m8YWi1nUpTEYXrNQRJfaJknDCSbk8sM8fYsKG09SGyn+VWnTVy015byTmTvZDFtBa863kFyHYBDig1qSMZ74iAAog6VepqL+ochRIrgMIX+i1YMvJwzX1m7pQbf46aV8iV/bohdZDyLnw3G2IaDbKwoneenJaayS54SQ5NmtSztfnHBxGVrro8cM/5zPsTEjuKA==
Received: from AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28)
 by DU4PR04MB10744.eurprd04.prod.outlook.com (2603:10a6:10:590::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:34:13 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::89) by AM0P190CA0018.outlook.office365.com
 (2603:10a6:208:190::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 17:34:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:13 +0000
Received: from emails-5343471-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 02EB7805F7;
	Mon, 28 Sep 2026 17:34:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616853;
 b=MlPrvTL/6CRgD/iZfFVp4oeNWxKCVgdZBUbAywxtuVa3xvFJ4hQAnBP1nEeizp+uSnbw2
 SZSJEsgH15mGjaraqNvjAs7T96p7SW/gP0hW36fm/zoYE8EgoUH7iwyex8lWtIQTq9EOw+I
 wrzIaPAnhz086J+Grz+WVgWL8xnQpa0=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616853; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=PJsaRrMyQnXRMkzkO2e9rEzW4Qp5KEU+Son79h5cSRX9HXDmbK430Q0cBAkRjeVfIkPr5
 6YYXYRfoPtHuLzu34xWMaL36VRt4x1LwwzOAw5+tdwrY9ZMaCtQy7Z5fYmxgpdxpt8mkaQg
 0BmY4XQ2OUr33TpGTVnbtkpBtxep41E=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=Uuiyk/aI3K20wPJQK8JprtVJasi3kJRsJA/Wh08g8RWLDvbIuy08jDk9iFcMPzc9ZLRIeinO0dzTsq/smudHagFCTOoE1yLiuZT6srr0esoJNl5cuY421B9E4bB6dzPZGJadldr3+bRv6Xrexq0m8YWi1nUpTEYXrNQRJfaJknDCSbk8sM8fYsKG09SGyn+VWnTVy015byTmTvZDFtBa863kFyHYBDig1qSMZ74iAAog6VepqL+ochRIrgMIX+i1YMvJwzX1m7pQbf46aV8iV/bohdZDyLnw3G2IaDbKwoneenJaayS54SQ5NmtSztfnHBxGVrro8cM/5zPsTEjuKA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 17:34:00 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:34:00 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 19:33:56 +0200
Subject: [PATCH v10 05/11] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-5-91752ea39cbc@solid-run.com>
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
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
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|GV1PR04MB9200:EE_|CPH1EPF0000052D:EE_|DU4PR04MB10744:EE_
X-MS-Office365-Filtering-Correlation-Id: 570b8dbd-2f25-4d33-80a8-08df1d86b691
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|23010399003|10070799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 0ixFWSkTKYySF34xf6b8jCveJ4ndl1OS4/0FE+FFVOgKHhd4TqkqaUHyRmysUF+Afvx0weyRVEaX3/W1xw3FeDSqYS+tLyfYKG4G+MBNnz2OouqgCjVOsMBpK74lDb8uJ8CBXhQO8Hl2LmMcOqan62zJN8DYP7S6PiKbSuWl5ptslcGcJcHalV8jKmQmt88eYJVK5ANHy5dxnzZ/pelkyvgkVdRjx/FqxRoTiKeyEaqT2npNa5Z4QjND29XQxeY9HYawS3DklWBxzWz/mrA8tajiLSKt4CCK+bOIuGuiteoWwB7IglInyoh5uyK+vGKr2IF4x8M+EWrvwBZP8T9yo1RmCfdeP5g6beOtqAip2Qf1KlAUfu8auF96tYTaANKallzof2IcqTNJQVONblUxYIGTwgStK6+3XQDMgFglhKAs4rzNQNJb4A908CIUdofZJBumXWFTAygbvnDyS1soqrB1OE6v/4YPu+2J8pm3naK7PqLyefQRIW3FpK3Y3gava2NArCKDlpBgEseohzN18a7xU0HYi1NUm+x14kWCw8hqVmS7HWpzZ29f5pl3E9G2wgixFa6QdGjYCi7nqhm8suznUIFwuGZHVzsLcr8kGFOKZ/P+pmnvUkaAapkrfr6R
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(23010399003)(10070799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 tnG0xenc3900wsja5w/XmyCm+3VLSJI8dYpBbSvoqXzPmSZhH+HQNchLdXxu2YbrVDex8bXobO2iX2PcSlU8Xwok9Y2CE13DiNm1pqHll6HADRy59mr8awVPGuxOaqVhEIZmXzSAOEt5Py8uUtuVpzprD4NrK4dQjQ8t2iq1QTvl3pzQYDNRDBpCkPihdwP61J3R9TZeKiS0QLR9Bk5b2/1H+D8n9Hjl1OrUkdNXhhfXXeVbp2T9Sp/LiclJzju0I5CNKGU2M4fNrcrO53TcYDEF/YOM6RRvVEexJh1Rdvoqo+jbeBkMM7H5z8O2uyLIjDCl7/2z9WjJj3OUO4Ugow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a126b8f94bba420c8aec8abe139bbf95:solidrun,office365_emails,sent,inline:87287daded720ae2bc7e73491d419f2c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1NUkeQku5Hqgp34RpsfJbcE0u6DAcRPGVm71QjDrvcVKejYSFwhHHiP+WoIt9zoBpMstVR2VWnyLMvsGWu5NjcUxNZIUB3r3GhDyPfj5qaLeSHysYbHoCK+hMyJkCiN2I10fCt7FTZ0wkxy0cYM6rJcbPplJD3r+wLkQyPbvacXVl/pdLAteIANEut/QS/yxyqrvhlJW8sB9Mm6YD2o+TErNSEQR+A1MLIRikQu6J78H5xEsQTeFnDttwnFEbZJMFOBFv4/DfOQFHwwxaMP5ur+34ZdOZDu8wWnRgheXJB0tXTeuK9/r7Ks1KDbeTg/zuVwto+khMnrzUJmUDbpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=jETxJvjkgC0d0vX1piRHOmtRAlKtun2V+eGjB4KMMP0vuPMD0tR1+ymUhntb7XnSKYfBH4RsOWT50ilclL2JxU7vlh1Md7dZttTDYXY1sMIFDQseUgY7GLmJOmvo3LpVP1u+a/kYLRmonBs/DaD2VFzKg2xMfJOoCyq9rbcM+nhABrovjooYJW1OnvDVJ7+H8mLlFpGNtbU8lSVDjv/Ii4ypuVpy5kpwh5X34VeecQ2XXMNyWOaS+4dMYItm2ipvqxnrA0rmf9j8iCgepG0yRCA3eTsWvdvWLlH4rWxw/CgqmqwN4SGN/4w/nvWicrBoXRJpzAjkagV8V5LpZ3QFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01574278-a794-4aaa-03d8-08df1d86adb2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|35042699022|82310400026|14060799003|23010399003|36860700016|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tuG++1uuvKQ7aV8t9OMJEyplgD7+/+a8qzwaMFjadoE3QUae5HkwdqcW2a9Cu17ETLKYZKD/PV7fdwD4hhl+Lo+fR98oAU6Sv92ldFo6C5bSAlK6dWPphwiTQ9RTFG+9km2mYhktuQmw7kTiVi8sMlYLnl5MXM8QMOUvaUjR4zEHslIn5WErkFN4x+pofcaULaZ+ZPF8ScF51XLjOobD6Z9Da8Pq6SGOc1vnYZ1hxrrLZrxO1FKThRsQB8idzS7MTXCdlS6xWtIcbzT9P9B6A8XchOhcWwYSBKv627i1sbhvqwL90LA9lLRBlkJLIaIeLI6Tjsgy3HELpUxlbiVJHWKCZOi9ltT64OG/FIdTU348CDDa6wq93zao1ub+upnAusUolEKZylH6fhfClmeTg6VD6N4U+z4cIjJtGtNbm2T2nqZjxioFJwWsIa3ETggfK162NNo67i/IO4V+jwYfG6R91dFgIcuSQDshuFBaSb+JTBC2y011wQb8U6XWPgP9UnFxwI2GtcnC08v5UAiDusOssXPLsw9J6FqRlOLCWiwB5rDMV7BJXBAa/3HucwX8jxRJHVweq7NBqV29hsUCmCfG0RJpXQN4F9e3LKBWbCczBLlSZ3rWGxHm7PZztdLJAEIlh3qCVyR3IU1bw007iazVO+S8+uLgelLAT42/L4o=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(23010399003)(36860700016)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7FjBOYdMPa9Z5QU490cixHYnBE7aHES3p+7RS/RmvqS3iGqw9DttzPOa/sBxrJDVOw1ouKO/XMP3ukAEuWkPJTFLPV84uCok2R56UF22pP8K4Eni7EADVT7bcvORlr86SRI7rh5OwTGnFnU7zCSprIKJuMtAYMcCCbVANg0LqFJUojl7pElPTsIq7SUItyvFPx20QMSjh3d5ISuIMPzjMAfYPmzj/JNGAwBS1iE3/Xbg5yn/pYvIlrJgouHi505+Jku5nCBBbAAVOgrEnNQ9w0ly9TTBjgmUXd2N16yoQ3gph0KTQdyRt5eXfr5pDeZVXaoiqmkLv7OXOTcsXk4Y88JLsnFrT5TDfeL4HBjjvtjPEo1E1Ye3nyIMakD6E/gGJpcVV46VFLGWUCG4IR/pD+DCxFVXh6GTJwiMRC6n+3QewBsBiB7ZtqfNnKVZ5M+w
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:13.4206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 570b8dbd-2f25-4d33-80a8-08df1d86b691
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10744

Add support for the SolidRun RZ/V2L [1] SoM on HummingBoard IIoT [2].

The SoM features:
- 2x 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities most code is shared, including DT overlays for
eMMC, microSD, and RS485.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                     | 13 +++++++++++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts   | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index e2af196e18bf6..4a0cde8cc3b7d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -189,6 +189,19 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-sr-som-emmc.dtbo
+r9a07g054l2-hummingboard-iiot-emmc-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-microsd.dtbo
+r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-b-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
 r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..d77a6ff163bea
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g054l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot.dtsi"
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-iiot", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard IIoT";
+};

-- 
2.51.0

