Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021093.outbound.protection.outlook.com [52.101.65.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1145C4DDB53;
	Mon, 28 Sep 2026 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.93
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606430; cv=fail; b=XrG8ZfftoINAcpwDa39JqbxlbrmzkqSUh8B0C0QMjgI4+9l4A/ql6QI5hiCf5F+mxI1BN38alfPwSSgEt4ZKaW6W6sS9FWdocJzf1JnvhdG/lTmIkuvMsXFpPsG30DoPSqoUAUM6sRv1H5NIl5AAawkXhr6e+rA+DNND0RCDNcg=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606430; c=relaxed/simple;
	bh=reeuBiCHGEMFplbQ4g1GMSjtI8tczK4LfKKvHZ4EgKY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=X/Vrfz1sDNL7S6w5Xi9gs+SVufARI8SjwAvMmrByvQB9ncjALv5nTIwV7o43C4Q3x+jgDFUi2u9N9My7B4dVvE0bQrGHkDR3WqPlbzetsLbuR0P/aeLNF4X3P3chrS7E2D/6P9Ng+wcaOIcQuCFgHCawuoRFQF5/DKubjEPeH1s=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=vDBE2i1i; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=vDBE2i1i; arc=fail smtp.client-ip=52.101.65.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="vDBE2i1i";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="vDBE2i1i"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G1iIjoAkSmgyGxSDKDYkGJ9zHVRQ5hDaY25DLHIImT0RlKDDhY97E3WoogJH2b8RhyLbA6yH/NQDn1FBl20roerFy7aGBAcECI0Z0p71WcKcki56k4XxnTsZXNEx5CUXj2gOabMPP74WhPAbNxFRZ/ll5/RJNfZensZ+NNctKNdvLxRVdOgldhJwb1iQefqUZk+HZ3Jcq2nMa3pFPo36gf9+Fsqbe2+i20Dg7tP2SWApUv+X6qVP6RV3wjuXAr3sGgsWGdJ+20WsP/U6T+oe0s0SXEOeOwt3xtBRnRNuIB6SrZjBsQ2Yx9bkiDW7L2/oeKW5Et9+2wE2RAuwgDcZ2A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIexZdnwes0NOAIrvoWqVb2lfAiL7f/CsxEA8XMeRDo=;
 b=pk1QJo8j4yHErPktliZuHFTaomzn/Byz2VRdJNY7y+/VA8iDPA/pbjSj2HSRdq2womY4pMO2HSx7hJOMZWU80NRpJoUz2tazYz5V03SUN+VaVQe2blOfXn8f+jNVAKh5Jys3k/UcPbYhAmmyl8u3l0sQDNGAe6awfCWuFov7OWTWt5s4cnvA6F28EmXVMDqIm3Y25sIPHu8OHLHom7iGbc5obU5kHlTLdjFTIdCGY2yDSdieyNmlMMeBbHVBqy6OyJi4dli/WobWfBkSb6beYVBNMVngS8P03d1Jnwht/cbx4EoDgi2OMFPtrFsJKFH/sUsAcGVfxTbRVUYp4bNSLw==
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
 bh=EIexZdnwes0NOAIrvoWqVb2lfAiL7f/CsxEA8XMeRDo=;
 b=vDBE2i1inqnEQFRrwv7EaiDejNQeRC7wbwyiTQAQLWnQqny1LsQ4Py7nXopDtkJy+WtHKLGQRzM5Xzg2VnUEXqtbRXvs4LXpOlw7zFqKrHaHgr/2lcpKMwDlhA6EG8SkgzZkUXr6ue/cCSVmpBSqiVuCxti9WCqFCFcFDEVCdFyubrSs0de4OqSVfSg3KTRLbcXkDAjGEcHkG63D7vHfvc8ZBZGot5tJtkt1MhOXpIuVuT9RwzcFfAroUwp6LmiSxQsAHz/ZU6OTa8js/JCcj+GBlIrN18Ylum8vST1c1Dv9pUJ3JKIri4MXGYDULDOlzw4m30Vsoq5JaX3hPxAGYQ==
Received: from AS8PR04CA0155.eurprd04.prod.outlook.com (2603:10a6:20b:331::10)
 by DB9PR04MB9628.eurprd04.prod.outlook.com (2603:10a6:10:30b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:40:13 +0000
Received: from AMS1EPF00000097.eurprd02.prod.outlook.com
 (2603:10a6:20b:331:cafe::8e) by AS8PR04CA0155.outlook.office365.com
 (2603:10a6:20b:331::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 14:40:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000097.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:40:13 +0000
Received: from emails-9925093-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2562B80541;
	Mon, 28 Sep 2026 14:40:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606413;
 b=aoG7nRwpyC7zAazFtZeaAksCI5lvWwZeJiaMYXzVY8IQ1eyEr404Xa8ER5S/dOvtG0V4O
 SRuwzcGttJ32InThhpQqhLkvnFFV1xQOLGBuZzINHPWYWcLjI5+WKy0ogXhQ2ZVnDF1PyA0
 nnlHsQqetks88ZoZO3cIeUBv70lfRF8=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606413; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=EIexZdnwes0NOAIrvoWqVb2lfAiL7f/CsxEA8XMeRDo=;
 b=NpVTmoMkyKLlCDRMqygEUo4H2DwdUlTsmP9jfxCBq13GxmKJEjM9pIWZFPc4VWrYFPix3
 3jmE7r82b0oHO8zZ2Eca037GwSFjSHFQM93EInO7jBme1Xwejy/MSOJ+0gBMp10jkYDkqQZ
 /BpYIpvsJptRrVtyk8t4zQESmHdPeIc=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIexZdnwes0NOAIrvoWqVb2lfAiL7f/CsxEA8XMeRDo=;
 b=vDBE2i1inqnEQFRrwv7EaiDejNQeRC7wbwyiTQAQLWnQqny1LsQ4Py7nXopDtkJy+WtHKLGQRzM5Xzg2VnUEXqtbRXvs4LXpOlw7zFqKrHaHgr/2lcpKMwDlhA6EG8SkgzZkUXr6ue/cCSVmpBSqiVuCxti9WCqFCFcFDEVCdFyubrSs0de4OqSVfSg3KTRLbcXkDAjGEcHkG63D7vHfvc8ZBZGot5tJtkt1MhOXpIuVuT9RwzcFfAroUwp6LmiSxQsAHz/ZU6OTa8js/JCcj+GBlIrN18Ylum8vST1c1Dv9pUJ3JKIri4MXGYDULDOlzw4m30Vsoq5JaX3hPxAGYQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:54 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:54 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:36 +0200
Subject: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
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
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|AMS1EPF00000097:EE_|DB9PR04MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: 9613a778-e76b-4da8-a157-08df1d6e67c9
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 26hqLJuQ5i5QXQEgn0DjnIa16fl98lD+NP4CchD/ovtjAMtfaWWAkoWLcZshi10/Tp2grW2jVdjHCsCj5WfOea6Ea2FInIa+KHVxVd2rhdJ3HTkmirGDI1YFgJwdwBonKtlutqaweXg+mqnt6OAorOV2TUSVmXupjH7gns+RZByN8ARfS1xWyPzowgcf0fPHFCaS9+rksix6erBewN0FzxTc2e0L5YmOiH3uYf5fQihpisnzyvXMZ6k5PVChV3icsmqTiuiIkOSyQAVt4pX3erdWZxl31TpJxW6oGWDuWR97jUM7tPEa9eZo7jLjgpDRiBymXv8u2O9cJ7JpsjfvtEfI4QSvIHwnYIy6Ux8k+7ECwma5kvvBQPgIllNysWDCGtJFfGVwz95uOWgoQ8ik4RB9kstuVxYjvrbzU0TIZDfCZfdRFGEltLp5C1B3PvDVCmdY87X2ZJMTXYKXFoHM01kcan4gzmAasvZpYANyVFcosAyUwMVIrkYkLQxJjQv+J0VKtROYUy/s+KZtrYNokCCLTsj3xLwmkrd1NY93WuuTFpX4145gTjVPyBT3unIBgM2xhhBESrMsNAHXGVfaj3hOFIkZ/ZjbUcbl/ESzR1Pi248dDsrZw8pXHAn7Pdby
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 gCsSjze1A3nY5rtofKvFwgWrj6rPxR5x7ID8oxt4dK+l5FIgjaL4SgGnJK10H+qiekqrSpOIZyEWRbLk4B+1V0C32vZyfMvtx6zqDo/lENIVQQMvHfSN3qw+3eEnIFE5Pt5zCyvjLUHsBgHQxOXongfcBGH8nYn5DKWLuVWYoWM3Qoa9Vg6GkQOZscl6mcyDcjmSnlyitZ/GefWZ0aFQnFe469qw26WSvYYnxjed3n1jNr7Qlsz/gP+B8sZp08kl3xagnDgYu2HAFtqMaTz5MUvmxxNzsPFuO+2mI3mWei0eW7zz02ixFN7RO/NsDKcF+1IS9pqSMIOSHn7dKgHwEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: fc4237e0a60a45f3a8d14eed1103bb81:solidrun,office365_emails,sent,inline:ccac836d61caefcbefa3c2641c859a8b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5Mebti7haZqUEqXvt9rNzo4mFj575IfE+CIwyHLVZFYSrOLeYnOd37GmqMlwHc8JPpOOzvzHJT3tHiwDjP/ZOwUSK3xM3/8lIKZMT47wWNtj+vSXVS/9ZtcGdjicZoPez8YRQGMArTsHEI/jb3Dkrr4GCFLx4kiTTF3bYibXVKWNf+f2bs1ZhJqILwozy+CUNcVbDEjZebxcWBS6IV/Rwxh8HinUdm2laHz4vL/ub/EXh+h/cDPSXF+Q19kS7Sss7PG1diBp026mVJNkivRsfuNbK4nZjjUiQuR+2HePR4AnLM9a37bejxyqsXIbRPc8wt8zBBTQyt5kdu/FDz/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIexZdnwes0NOAIrvoWqVb2lfAiL7f/CsxEA8XMeRDo=;
 b=Kh58WkVowU1a4UYkifk/x5G18srNrBxHrNwv/MIT2BP0sAjIw0YJSFd98vQ+gpAN1LbORuvngN5ZIRDz2mwjuafDnMsoZF7XLNp7p/GpTjcVxPbCe9QAxkKCABPQ1UlqzOJXIuNHLoBp3rONtsoEWleryopNpr55s+SdphQd/HjTDfeWRRozxiuDLlAQuUIe91+/MIo18bmMAtSjmxg2ZTzhWSw2tEcPAXghV96qFu141DWjyLK1UNFtl5HjGPO7Cb4irvhFZzHvkUj8iHEjCc41RKMGnPqLNr9ZCmUoiaIRymkM6lG3T9ViKEBQ3O80/NED0ZgRJVDayU+paU9arg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000097.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fbf9908a-121d-4b87-d0f2-08df1d6e5c4c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|23010399003|35042699022|7416014|376014|36860700016|1800799024|22082099003|18002099003|13003099007|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	48W9+YHHDRvb0d91b77T6n6gWkFFbsGEC8mljTx79sH6ob/MYnXcpfOfRJBEa1NlqlB2pgU2oylJu6nw0k+M6u3JBsb1nrh/X/vIK+L0iH6hJtkOZsybDGqdUMj9Z4/2q3TktVu6xKSUpXQLSAzltc8O1xGdd1EVgRMdOFGqDzIrS3QKfcl+KM2o3A85MeYvsiBSs1iyiC3b3XOvSYQMa+XNGIxKgm6L5O0TcK4K6o3e69Obbcy/YKCy+MNOdTeje1Cs9DNp43YYCtiLriskjSHGHg0f2B2R6wQeflBRwZR3jpP9pSm4LhtZR4odBpTdcZaqyCQoOFld2xj1M2MZDgb5ucOWyVm4oMXaLFA75xUKnfje9W7HToxuBtuqOmj67Vgk+pQHrNlq3ossIio+2t74S1S8syruOn1U0o7ciGw2t/goGMDXJUmtHwZycseUVoIfyFyHsgCSf+Fq8Vi8ly7kbKK9jJ/kCWnNLgcTRMpTOtg3R0+v/CfsLqM/mLYYZnSbC4+xHHhwHG/JpEoHdXhovZGI4W/tKIxKfjNKxzN8QK4EBYdBdTJvJ5Iw0B7hrJpg1kVYbwNVX2SWlNFtrwrPiyVhSEpXMaWskrXTNZF6ITqEjRoOruPMatErWwugIRjIWinhtFVuBiL+q8+INEmjaB6KG/VCbs2SH8DijlM=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(23010399003)(35042699022)(7416014)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(13003099007)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f2JMJ/S5kViEB16DkOQmnbiXH2n7x/0ARw7ou0HvGNk5BrY0dS7iIdnnHuXQit7dVvclLAe3icRDupkFXoPxVi9Y2ADH6gVNDsNCl3nOHNKECcd44q3RpdJe7XRbXV1V1v7mW+0To/43rfbPUOOsO0gfv2xsnPBgXp4EcqKgEo6tSQGmdu+jG879L4egCH5FaOggiVjKgkA08dhIvWDffHagr1Gdv2e8stcidKsct0iJKLpfwXkZv+Zw8QK4a8Bp8sNK+HniCKs6COc+1h1WDpae8Nz39tKn2AsbouxNRUQc8MhxST3gTYbx1/FJyib85MqZCMeNNmQHEHP1xJS48mgHLCWHA7IP4aICGpcMs8uN2whUgKfFkZhPv0KbBrIK9d0hSRLzV/SiOz9tBHj+XXZ2qklbsykXZMxiCXBOfbbv+h7OBWAxGh0r0VMqQ+KE
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:13.3765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9613a778-e76b-4da8-a157-08df1d6e67c9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000097.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9628

Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
SoM [1].

The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
featuring:
- 2x USB-2.0 Type-A connector
- 1x 1Gbps RJ45 Ethernet
- micro-HDMI connector
- microSD connector
- mini-PCI-E connector with SIM slot supporting USB-2.0 interface
- MIPI-CSI Camera Connector (not described without specific camera)
- RTC with backup battery

The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].

While the variant being supported here is named "Ripple", shared include
files are still named according to the full board for consistency with
schematics, silk screen labels and other SoMs on same board.

Description for microSD is shared with HummingBoard IIoT.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   5 +
 .../renesas/r9a07g044l2-hummingboard-ripple.dts    |  17 +++
 .../renesas/rzg2l-hummingboard-pulse-common.dtsi   | 116 +++++++++++++++++++
 .../rzg2l-hummingboard-pulse-micro-hdmi.dtsi       |  79 +++++++++++++
 .../dts/renesas/rzg2l-hummingboard-ripple.dtsi     | 125 +++++++++++++++++++++
 5 files changed, 342 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 0bc2bbff9370f..077e8ebea0cff 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -197,6 +197,11 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-b.dtbo
 r9a07g044l2-hummingboard-iiot-rs485-b-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-b.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple.dtb
+r9a07g044l2-hummingboard-ripple-emmc-dtbs := r9a07g044l2-hummingboard-ripple.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple-emmc.dtb
+r9a07g044l2-hummingboard-ripple-microsd-dtbs := r9a07g044l2-hummingboard-ripple.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple-microsd.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-remi-pi.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..493a2b9b51d25
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-ripple.dtsi"
+#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2l-hummingboard-ripple", "solidrun,rzg2l-sr-som",
+		     "renesas,r9a07g044l2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2L HummingBoard Ripple";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
new file mode 100644
index 0000000000000..3fd49333ff195
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &pmic;
+	};
+
+	v_1_2: regulator-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-max-microvolt = <1200000>;
+		regulator-min-microvolt = <1200000>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		startup-delay-us = <250>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+
+	vmpcie: regulator-mpcie {
+		/* supplies mpcie and m2 connectors */
+		regulator-name = "vmpcie";
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+	};
+};
+
+&ehci1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		vdd2-supply = <&reg_pmic_buck4>;
+		vdd-supply = <&v_1_2>;
+	};
+};
+
+&i2c0 {
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&ohci0 {
+	dr_mode = "host";
+};
+
+&ohci1 {
+	dr_mode = "host";
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_ORANGE>;
+			default-state = "keep";
+			function = LED_FUNCTION_LAN;
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "keep";
+			function = LED_FUNCTION_LAN;
+		};
+	};
+};
+
+/* mikrobus uart */
+&scif1 {
+	pinctrl-0 = <&mikro_uart_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* mikrobus spi */
+&spi1 {
+	num-cs = <1>;
+	pinctrl-0 = <&spi1_pins>, <&spi1_cs_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_vbus_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi
new file mode 100644
index 0000000000000..80e43510142ab
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	vmipi: regulator-mipi-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vmipi";
+		regulator-always-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_from_dsim>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c0 {
+	hdmi: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		a2vdd-supply = <&vmipi>;
+		avdd-supply = <&vmipi>;
+		dvdd-supply = <&vmipi>;
+		pvdd-supply = <&vmipi>;
+		v3p3-supply = <&reg_pmic_buck4>;
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
new file mode 100644
index 0000000000000..d5bd9b7de4282
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include "rzg2l-hummingboard-pulse-common.dtsi"
+#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
+
+/ {
+	aliases {
+		/* this board does not use second phy / ethernet on SoM */
+		/delete-property/ ethernet1;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
+			label = "D30";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(47, 2) GPIO_ACTIVE_LOW>;
+			label = "D31";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(47, 1) GPIO_ACTIVE_LOW>;
+			label = "D32";
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(48, 2) GPIO_ACTIVE_LOW>;
+			label = "D33";
+		};
+
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(7, 2) GPIO_ACTIVE_LOW>;
+			label = "D34";
+		};
+	};
+
+	rfkill-mpcie {
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&pinctrl RZG2L_GPIO(14, 1) GPIO_ACTIVE_HIGH>;
+		label = "mpcie radio";
+		/*
+		 * The mpcie connector only has USB,
+		 * therefore this rfkill is for cellular radios only.
+		 */
+		radio-type = "wwan";
+		compatible = "rfkill-gpio";
+	};
+};
+
+&eth1 {
+	/* this board does not use second phy / ethernet on SoM */
+	status = "disabled";
+};
+
+&gpt {
+	/* mikrobus header pwm pin is pwm channel 6 */
+	pinctrl-0 = <&mikro_pwm_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&hdmi {
+	interrupts-extended = <&pinctrl RZG2L_GPIO(9, 1) IRQ_TYPE_EDGE_FALLING>;
+	pd-gpios = <&pinctrl RZG2L_GPIO(3, 0) GPIO_ACTIVE_LOW>;
+};
+
+&hub_2_0 {
+	reset-gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl {
+	mpcie_rst_hog: mpcie-reset-hog {
+		gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		line-name = "mpcie-reset";
+		output-low;
+	};
+
+	mikro_pwm_pins: pinctrl-mikro-pwm-grp {
+		pinmux = <RZG2L_PORT_PINMUX(41, 0, 4)>; /* GTIOC3A */
+	};
+
+	mikro_uart_pins: pinctrl-mikro-uart-grp {
+		pinmux = <RZG2L_PORT_PINMUX(40, 1, 1)>, /* SCIF1_RXD */
+			 <RZG2L_PORT_PINMUX(40, 0, 1)>; /* SCIF1_TXD */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+
+	usb1_vbus_pins: usb1-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>; /* USB1_VBUSEN */
+	};
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_vbus_pins>;
+	pinctrl-names = "default";
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(4, 1) GPIO_ACTIVE_LOW>;
+};
+
+&vmpcie {
+	gpios = <&pinctrl RZG2L_GPIO(17, 0) GPIO_ACTIVE_HIGH>;
+};

-- 
2.51.0

