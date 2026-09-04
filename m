Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023072.outbound.protection.outlook.com [40.107.162.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372BF480953;
	Fri,  4 Sep 2026 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.72
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523020; cv=fail; b=GbgfbGlO0q3iUM5czhAdm14eK2dx72cZi3nClxBTvpDsdky3G/pAEzSy+vZsUgHMNHNnkCI8/xcerCqfs6xT3iws+pzQ1qC2UnlPMmrw5SW+dDIXIDmLkqyI4642r2qXa0NHLWKi9hncV8n9mU9KGAfYOtV4IAqGgn+XRrH9jsY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523020; c=relaxed/simple;
	bh=UJGPym/un3mcgLRYeqPp3BvM6otxGpyeT72N2xa9ewU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GEEa4qSTJGjEMzl6wfJYcIlOJ9gYL9S4wjng5oGp3rq9nrBKpL4+mMOJ7cYotY8cThPqtyPKMVU52P0ipWnxQ+Xzy70zs6y793LB12XtC6mZre276Z4z89iFNIfVNso3I79oLi2nCyHTDSF8JFfroTvWwNv1LMi1cxcarA54pF4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=dIxcr0f4; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=dIxcr0f4; arc=fail smtp.client-ip=40.107.162.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="dIxcr0f4";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="dIxcr0f4"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MK8HnmaGUKAQxyMQ14B6f98Mu5JlDwbQpManvoSW83frgcpRK+b0DijbNF/1Q2Rh1k3BK2xFWQtmeOCsp+FbpTr+Xzi5D0qRYejg6xkFnXbOEzfUng9hzN+/FjsEnGE9EkDEYwcLujrAmqEs1ir74w8x6tevIvevNk9h3x5EzDhKwYHYLkkgCcC38a641kVV0GboXl2K9zLLXwBkmg71mrsf+H+v7Eh9Exm4sv0hUA/uCbRTypuuybu3aqOypVTEfg6T2v5UTVw1ZL4ajGWWcTmdA4fK+u5FaiLZS3wawdzZzI9NQBx6PCmjk95T44aFi11VfNEoiH/owzqkTPzcFw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugRowYW5dFUme0PdE+T/rsrfK1dtUotI2kEN6lN4Fe4=;
 b=w3sjbn9QeFtjI0qAbpzUC2vFlpo8Mg4qKQeAiTe5J2J0R4hqoKswErnSKYwFnRzNxdTdNJ363kfJP1bQY0OIX5Dad09yUH3SyDq9RrpbZKlkrpuenWbYijlHYMG2SSjbN27hXQTwqkUOR0lmVgo38StXCNJpxUqhgHObKDZGvTQvDx288g0jdPSZCxx//Xvjp6O1DK3/s5MFwHUevO4AbpL51FmYr1oNZAFZpX4RAXvAyaDbHoYYh2UDg8TKqwKRH8IQIpzLExp9Nsnf+lNcHfExkoSA1H7Hc90C266AMVoRQOdSpYFNKCEcEu32iQxr4VYdrXflwUzSW84YxN8d/g==
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
 bh=ugRowYW5dFUme0PdE+T/rsrfK1dtUotI2kEN6lN4Fe4=;
 b=dIxcr0f4lf6jFMdSmBeAAS9gAUlT5Hg35pt0OmkMjCRMeSuSEg7ASz5N1eafoBAyxVjI4X9cDJp42/bX7huluzNvvfWYh0ARrwqRDK+X9/4+jUa2r9ULXJTRlzP8pS8B8Kzaa/ypsxU6KX0O8e5BmaUIocGoHVTIHY6EPjOI/ScJJf7r3BVGJfWivVT1ubnzaFlecwYpAlGfOhRCg/nBmct1/0LhqbnGm7WDXXSosfMPeZKK2Aen770RS83B2Aj15sSOsVruvslkwoz7slAJ08haE4IQbDNUuYXpQmuqj+pb+S8ZpBaZZo4+RTJPNATb4qBV8mT2sLdcYCJdqVdbvQ==
Received: from PR1P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::6)
 by AS8PR04MB7495.eurprd04.prod.outlook.com (2603:10a6:20b:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:53 +0000
Received: from MI3PEPF0000847F.eurprd02.prod.outlook.com
 (2603:10a6:102:19e:cafe::2a) by PR1P264CA0001.outlook.office365.com
 (2603:10a6:102:19e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 11:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MI3PEPF0000847F.mail.protection.outlook.com (10.167.240.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:52 +0000
Received: from emails-1923960-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-87.eu-west-1.compute.internal [10.20.6.87])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id DE00781D54;
	Fri,  4 Sep 2026 11:56:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523011;
 b=Z9zvTHCvo1NXJLxhvXaPUII/teIh+Q8n+7FFaa9jnG13Jy2L0A9DNlUB/2od0l6ntzgVM
 EZfWXwTyliDOVxJRWvDi/F2DMgfsWSof3waaZwP0X2WMw4XEmoUrnAuz79cIl11ufoApW30
 mMFR6K/J/fWzAoAVN+dSawyZJ9LLO34=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523011; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ugRowYW5dFUme0PdE+T/rsrfK1dtUotI2kEN6lN4Fe4=;
 b=Sj2HdLO5xsEpGUQmYrQmWvy3K7yomCPCu8FKwFqYaK8gSn57VhELhpOy9+cAcZvQgum2Q
 Nn/JywEDPv0yKrokwWQjSbTQZ2hUKHcS6RX+BGeOy4suJG5TODw/2XAZbB5LAjdiXHFN7Nf
 wcU0mTZ2H71mrbfrDTm8uDeaVonlEZI=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugRowYW5dFUme0PdE+T/rsrfK1dtUotI2kEN6lN4Fe4=;
 b=dIxcr0f4lf6jFMdSmBeAAS9gAUlT5Hg35pt0OmkMjCRMeSuSEg7ASz5N1eafoBAyxVjI4X9cDJp42/bX7huluzNvvfWYh0ARrwqRDK+X9/4+jUa2r9ULXJTRlzP8pS8B8Kzaa/ypsxU6KX0O8e5BmaUIocGoHVTIHY6EPjOI/ScJJf7r3BVGJfWivVT1ubnzaFlecwYpAlGfOhRCg/nBmct1/0LhqbnGm7WDXXSosfMPeZKK2Aen770RS83B2Aj15sSOsVruvslkwoz7slAJ08haE4IQbDNUuYXpQmuqj+pb+S8ZpBaZZo4+RTJPNATb4qBV8mT2sLdcYCJdqVdbvQ==
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
Date: Fri, 04 Sep 2026 13:56:24 +0200
Subject: [PATCH v8 05/11] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
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
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|MI3PEPF0000847F:EE_|AS8PR04MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 73afcc69-30c4-4120-8672-08df0a7b9c04
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 WKS7jU0ee9XOjmRhiZ4oy20dnQMe+OW06uCbG+kjhG1npnoa41FR61mVRbhFroQYjO0jgEGJe0FMVimp8WmhN/mpeUYcxCEHeVKfWCh8n6geCvuW8zClt+KlmVnQQ8xfdPN2BZ0w7+LouEcdYReBl5tt1P79uy4clsnvNPkmsvlo/UTPk/tbb1vCwjCGbMSSFLDRCD1Sk9tgQO4dJl0ydapC4dlQCnZiz0Pfj45Wviw6jhTOKYvGrZpJcecnhPtOtTQ5PjiYn5fLnG7rWZkRMnXrnSGoGlMp8vQDSEahLtnFvXpGHijBJiGs5t+LNq4EXESVSwdRc5blCCUISo0TVZhc2/XARlcWYGrCogA0rmqvMbfd/u7MiVOvgnkkuAKl5UT0guy+ySzaWrWHvR5v0jeuEdCvW6oRr6WlZXikJGWzscJCghceyJK/AKIj8UDBLejTlTEAZjMLqvib2U96eHuy4rNPgrLQ+55DKogzOIyYlR8w+aoUISzWKYGh6incNhOwQJmftMgUslFm24OzhY8u8NkLj9BI9sYO/RBP1gXN1alcLHo5XzCdBSvCGpJWcaLiGZuxnFdQYWWJOaektiKYiD9rocQweGW8gewo4EiH9nYgKsD0M8D8IijTxmP0
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Rkg+kvWx25vYRD7BkmgWF30H62BTqiGpDTOI0gXkogBqw5+c2a9x2Puy0BGPYCUSOy0qZD34LhtryF+rAu9S4pE13QbEtJ9VcueEexQDr/nMR2/Q+Dxu5ifDGuwY2QtWz5iV8sLTAK2nuzcKT3BAJrZujV2IH4knsbjC1+WPUxgPFNhJ35Z6qjr0p2ZGm7cLBRvNBDWJj7SzyadX3Uwg7JH944kTKSM/a2NnsziilKn8rGUY5llDclUkd0Kv2GVewihZoWH8hZDgo0n6Ui+kxrDzsiYFYj4me84fPg9aFMpKNrcBCwHoeeWQmpQoW6U8nJJDoZEBTr51CYTK+Dnp5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 254777c9d2764944aee00a76f58e15c2:solidrun,office365_emails,sent,inline:284ae8a1cf75927e32739ded676cd9cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arXg2k7cC9s6oH+/iGAyi7HXmwQEqv0hYQI9flpFVD5nHcc81qP2ZwqKPJTsdJzInNskBCgucHgOhpNau01PhqcAjykgwTpBQc8MkJObTXeRw70HxHBKQGHc31frP2uru/juVWOBvBYwmjD1RKJDapStMmT1Ra8D2h+g5EkRqTJAkgTvCGzcdCy15AEx56ufsOgErLwJg9P9e6Dk2rdFfqapCx10TCJyphvvWf4nsj3DmCxJvlEuNi4pEKLOzopna+0s3PrEIpACU/jx+UyT/DyvmEfJq1FpOswnd41n24u6Jp81lczQMMGZqYJYxYSqc2nN1ctIVWAnHFFoT37NXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugRowYW5dFUme0PdE+T/rsrfK1dtUotI2kEN6lN4Fe4=;
 b=kmfBPx21F3SZPwKUmgrL8Y1BbM/FxXTGQ2GmyFC8PKOlpqSIrL5BNf0DjR9B4o409IGHU91CtmZxOzP31HxS0gfIk6+ujp6EzbrF+aG8jfCR155XCv0QnAir324JS86/ePyvJpo9ltBczj1tnAJWKcf68qBDcKq19GTzWBXZtjWRS9/0Uz2+jXwsGo/ZFxQT+l8Ke0OSJMZ63CXpWFmaT710xv+vIoHXHwyEDzrAzlLJ4JCR2Hohu28EDEvK/tqRXYjEe97i6u/i2g8BnhIt9t0FPe7+DGyeMfXdCCz5BKJXnUqLHix16atGxXqWawGR/duy2pZDvHZ+6I0QNQelsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF0000847F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ffb673da-b0ff-4c5c-1ad0-08df0a7b9286
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|23010399003|14060799003|36860700016|82310400026|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cAeiJVh+EvJiHk73R3WG0Heq/tAbA2XqGZeWjBO1noeQUfnxQzZ3IEOQMWf/8MkMZ1mzNFseEjkd+vsZVKwUQsSF4uny4JauKTISB724ZPXCG5P3UPp0uMw7wi4Mca3gm9RPq1pPLiQ+HnAQcFOlnTKSKCtt6xM/xz+1n0hAglEqm8YLn/X8EfmMaqWUCT0o9V2SG6cmlk/eLIr0Wjx0VawH9+XlcQ0a+fYJJERrlSyaq4NNvwn73GRVktYPsawKLNDj0xwB80BLpmpSqEZ/z/00I6LNlfmA4GieZQr6ixnOzn9CkcnT+DvKw6jC27jh79Mbw/lgiTpgsVLopWkfsQ5vZqQOTe5PD4jxMqMGpnpZKqdSVCVnj6cYSU4Ahi5eETV3dx5GFLbPPJaVzfAEPqx3R6heeqGoIvCt8+1jlyL1nbrwOkUBe60ZG7cUh2jNz+jXkVLEOXHqmmM7ip9uSDWECNHMDcDBpADRqe7NFeRB0teLY6jyM8soZCl+eBTNNPlGprRev51MG+Usv3NNPVjF/5yUEXbW6ddJTZ4o/rtHtJtQPcVxtGay1yIyio7KOQXEp2vgP0Ylq+oLDAvXGaKsD8dWcHslV2QqLH/1CuWrsRFj7B8iRzgTGgjbxFCg
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(23010399003)(14060799003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mYuSEZkHy+mLHCsMp7rDhyI7jSGcs+BgbNOitqHgNtwljGAj5hbBa5DEk7kKTs7Wk1nrm72o+dwuy7nQCXS8ArL+o8OMZaz0nA8tbsM9y6D6NoQ/q4zqKHf0H3p5mMwMKoC9e/u8fdV4uWbERzDoq00wIRF6SdAFnCGOJ6Cf/W+Qbim185sVbPtcDfZWEdsmvotMDvluvkwIJOl6rnFoWTWz25SxrCoHE+zr4jTHvcq7cf63JMpwTZ/TNhIKRgZqakwYTENkSzTNNPjnqrwB6X4oaG+OXbTwppD5vB2vfQ556mXQh5YK2jBaOTve9Np68HzIG2QbqLXSMf+1fl1EK4qnK/8PSCfq/nl+T7itTdUrvunLwZr92cd0yNZmuEp5kOzyJVtgv/7rvjXkSfD2xBbSsJe0mkKiC/DLFYcvUosvGwXkSQjf5khNVxucLebN
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:52.3406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73afcc69-30c4-4120-8672-08df0a7b9c04
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000847F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7495

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

