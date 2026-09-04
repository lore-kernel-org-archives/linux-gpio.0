Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023089.outbound.protection.outlook.com [40.107.159.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859343B6C4;
	Fri,  4 Sep 2026 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.89
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523014; cv=fail; b=NajJSaf4gtuzan0cRg/qq/3zOHeOuj3JFb1AJHGAlrlC1BHXwS2acFQ5YP/Rs2Zl5a2xL0C3CWaZii/Go4oi3uL6n3vQTz4Jacdu0qKP4bOv8AEtHt9HRcZ5jtdu8r0UOe4NrHnSh3PsOlXQ88nWT0qpRGVIh8jWM3Ohv6fJNzI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523014; c=relaxed/simple;
	bh=DbAYcbvbhbo3GiLPgZRbQUmu+hx3IzJXAGHnC6by7ek=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jUlsxef5nyTHlNLYU7Yj+NIFJUNdfGwdLwr76YrI3AlwHPWusPDvqk62fpcKvvYF5cAV731+Lli29j8hvJVbslEKQARdczz+oZxCBLbWzQrMuxm3SGkHNfy67vaz/pCMVgkXth9bp3RC+JTd3ThoacPiY9iHPsqmwdw1XRljU/M=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=tD6Ls1i7; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=tD6Ls1i7; arc=fail smtp.client-ip=40.107.159.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="tD6Ls1i7";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="tD6Ls1i7"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KsyUwYR96KtRoqU+8WhqhZB4HY602H5KS61+rJfVNLzFm8sJ6MI1R4MTAkmm/KpO7JAtgKoBQuK+PeZi7A3Bl3ApQrYZkGXIP8foGQ4zFSWcYkd+gdU02MgVDje8xQwNqua/ZHFUN7JyqDXJ0NxDzdZvYnogvAiNxsBXN5lesM9HKjy5irvKSV8BzMpSLsikNJkZ0Yo95Uz//IIPwe4XmKCq2B83CsaOA3uRifCwJCAxDrpagAg/3g6OUuw/qzlIuhi+Mk3C7Nh8bAuT/AlmfRdBNttmmgPI2y1qW5ZPlImPWz9tQkAhGUEubw9rgEkcWuAiFdhVJDTUn/gIl4sh6A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=khLwr8riPwJYik45KmfofFX8HE3yK6P6r6s0RyDe4kJZNrPJssCVuku7W8lfIMh3Ia3Lnk1bo/YMwssVuBHipX4P/Fb/GnAIyIh29Agn1DEeDV2kfLVo2kP9OfaJ0rWO4OHAm8mJWACHT6sZzB0oQ23qAKlVebHw/aFThqjEx053f9oCmwGIJmOQIHYkhw8pldByo4jv7AWP0pJNaWNslRxugf/eNa1AOu4mmH6E6qOUXgeJMWbdMWsB+j7QNTSCRYg0Mf/n2L7nzbKbaKz6TgolNwOA1dZ35JnSAH4oM++DBEUTksAXcOwc6GHgHTO0l33M9NaICwyGsmMDN28GZg==
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
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=tD6Ls1i7Wue1QsnLeiVtyRivzLOAHOfNsUeAQJyRa8fa+Q5MWONCaHfERt+K3PmxIzfNYMjxsnh3R9HCN1IToE126frjjs6egOCTf2XZpoSmDcC/gtsOSPtr0ROlLLc1Her5u6p0/KJmFfOmMMys+Hx+2JyA6LxY1qccUnPCLrXktNA0kVMGWzPUCp6CASTO5x6Q+lCIb4p+Jy3+R9TgAUec45gulCj1JQ8MHAYiofLeAQCLV8dGW5RlO2nDzYJAnY65mQliQcPumHF0rS2Dn6Hq+n4+BV5J0BZEAqQ0sGzPLdGZ4ptBrPaXXdsUeIKCBV1jm/Lw+yMeKHBh53QsPg==
Received: from AS9PR05CA0121.eurprd05.prod.outlook.com (2603:10a6:20b:497::23)
 by PAXPR04MB9220.eurprd04.prod.outlook.com (2603:10a6:102:228::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:48 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:497:cafe::35) by AS9PR05CA0121.outlook.office365.com
 (2603:10a6:20b:497::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 11:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:47 +0000
Received: from emails-920408-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 85A2E7EB53;
	Fri,  4 Sep 2026 11:56:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523007;
 b=KplcMJLUhsNsrjadbTqOEpc0Jbv9Ho5nnB8ob8S7/GlTK1B/ueoK4D39i6f4hWWxNdydK
 TUCmhAnumrOnN3h4NUhunjh+Fnn6T9hOjFqrLuey2duObxHbhJQ9iWGYcMtQ9ZGesqdJkDE
 7TtPEQD8CEdB1/WGv5ZvNwhWEHsxbqc=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523007; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=k0cgM82ZLmUevDUYiI8Ir3Vsxm4ZUeqU0DcVF7roZEyecREJokVV2vbDTN5QtEg0x1/BF
 tlWz/YfAN7fg+qsiWZFXVLRfqIOX1Qrdm0QW30YoSivcf+i3dnvCdf59KVR+eXrVEmGCpBY
 hD/Vezmll9kMo5ROtj0LwgDqwv2xbmw=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=tD6Ls1i7Wue1QsnLeiVtyRivzLOAHOfNsUeAQJyRa8fa+Q5MWONCaHfERt+K3PmxIzfNYMjxsnh3R9HCN1IToE126frjjs6egOCTf2XZpoSmDcC/gtsOSPtr0ROlLLc1Her5u6p0/KJmFfOmMMys+Hx+2JyA6LxY1qccUnPCLrXktNA0kVMGWzPUCp6CASTO5x6Q+lCIb4p+Jy3+R9TgAUec45gulCj1JQ8MHAYiofLeAQCLV8dGW5RlO2nDzYJAnY65mQliQcPumHF0rS2Dn6Hq+n4+BV5J0BZEAqQ0sGzPLdGZ4ptBrPaXXdsUeIKCBV1jm/Lw+yMeKHBh53QsPg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:56:35 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:56:35 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 04 Sep 2026 13:56:22 +0200
Subject: [PATCH v8 03/11] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-3-94c4674927e8@solid-run.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|AM4PEPF00027A6B:EE_|PAXPR04MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: 42316bf9-2c57-41ef-6496-08df0a7b9949
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 AYWG9+nhr/pdsRexpRnckwJXTidG+SampA8S2LK1vSXBr9yL5GXiDnETNw7Ed7IlKPIbDMevMBBv6g8Liyh2jdantZwtHLLryyznE7BT9t0EjML2e7/bMbm3z6Ysm3Cfnw2BKm/Zlu/kp/giVlY02qFUBGBdoZnTPIf65V+4QV6+MEpXj/hg2FV/wt/aovIPeFlG6SqbptT1dntNNHb3xXIVVJsZ15XLQBEnSiLmIg5vR7HyIcQfYyTGHV2AqO0DEZ/4RxI1eifA5WhRqPe+Hrtgi1vhScRsqcKU+wZZVe/MtVWfEok0QA162hz+DIlvvEotPutTLT7+qr4YHgS39n/FLVPKznUzkYPq1jcRKN1eGCltJVqIYThY4yQgUyldLTuPwo0km/0iSoJ2WmnyLlCRuM7lKbsP8q2ZjRUbl1adWMk4E7GjIBf7WcTn745SV37tXx7KlLjrXKHCwkiq0INd3l+WexGJVjt5etuDkWVqEukHNJJwsNlpQAeKmbXGToClw7QdKCQQkQD/gjRxR8JfyP0GnrJ5LQpSqJkEgsN8Mu5+yvPd8PwBw279XhuMtBh/jOefqaHYmUc5r82HviOjpLAFOf4bxAw0yZDKbGhfOr57b4shGKwPuSvkUHFoWRVXVu8Ie7/i+LaRrDg11spzKpQ+t5uAG6s7W6vDqeE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 TF9akHmsKn2ccy/Mh+D6A7Wlh398MDM29iz8zBkCDqg6Ek0N7YOmbgvLfBE+0F28gfZKItTJ8f8tj1MqZyqFZ31fDSJL00TmHajFa6J9rA+s51XVmnyzMO6kuyMEOyyuoDsfR1+gGesgdUp+ZIIShfs4E/Y+MN433wrViDpip7STt2xfYfNq7jLY66F6sb+1tjJpOSm1OJjAteA3ey1+yY1w38mqtkWqTFlLE9dA9t/6G6dY/yUWwIlgtAB/p81JX1caoKVm25jLHYcetAC6zU4CbLcz9UsZM7oCNvvfuteokJM2jV8+YLD+s15F4Rnybg7om457fkIoSIX9HtRygg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8612e74281904783896d4769b1700970:solidrun,office365_emails,sent,inline:676952191a85b524adb71e3d2a1d6dd3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRJEWDfFlHjD6tpH/3e9SdQRwcCbsKd3FA9mij+xsCUlAGmKZ4VlPTwnc0tcb86LoP/ERW/ldnLBvm+ZPhRs2prhAu15mf6khlYbJw7tbO7sCit7yK7s7wI6vsOfRShHHNRUhoOfQDWfyFOoQXcZWFnufBgRB/JXAJ8nIUfORkbMP5Y4A2ul+oZSTtvDI7F/tONlPF8cGqFdOhYTNwEDFr9UVPW73cTEXfad9OVXi1iHeqMvOWPaVC5CVBSSPfgIaBUVhCp1slre3nBDieJzVsy0mnJyGXvr96bdSORfInTD3vrnr4NEm+nVs/i+fXv8Gl/E4YJ/Rkdfz2bzoaNFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=SWyR7AT2QJf79MD51uh/QgE8zNVbPtr8YUA6sttlkD63m0ekaIqfeauwq1QnLvN3SQ9bP528nVD5SMgecr2Nu/OL3cSe4LdvMsOXqo5B1ntQan2SDE/4lEmR1ZE9O4/zp98nXoBMq9ytxtlCNaL522iavi6wxpswcFgsJ97T80ts9OjF7LDvp9BCJVr6e6OupLJ2BfQDTCfrF38Etu3a5ZkXk9Rjo5hT/ccBd07G2iQyT+/DqS1dZGT0xEsgEttuQ2HDAEMxDgJxDGBu/W59b8ibN6eIc2t7+ZmcNUBilLWy08PvtPmGGwPxFbghS3URgEM8qeMQMwyPKyaEP37ZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	741ae363-902e-4890-b076-08df0a7b91fe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|35042699022|7416014|36860700016|23010399003|1800799024|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hRXW1Qq9SrDKFs5u1WrYpJPNQ9C/6ObzjfXEX0+sTAu02EE1GfedTmwCjUvLe00jB0Oob9YeuP/p/2TZJIpoiogMr7V/VIVVrZTawMWDILFxgFqQVA1OsSPvcRz/rtm4Z2zVE0ZDsRaVrseYyC1adaq9K7QZj63gUUuFFlBuEC9UagX5zxOJL7nyuh/QDTBkk9e1AY04wheNIk8tACE/RPCfRG6Cp1MJrgbM/AP8/LIKEvIwitwTIUMdv0aQwTFJ+BJiZFni1gYrC+bKe2jc9C5/b4Qj8GQj8nFZ9VKqVMLCDJi0fyoNa6gpYHW04lADv9SNV+NoP3zeEUJJ6eUXWajWhSO/WZwdpP9vu05nMlqbezq/YByu0Vk8I4xflvx1gpPkRDbXEsZwT30zFR+ixWUJsIUbfGXLfronGPZeEHnr1A3RpI7RWCbMJBhAmIthZDU75ot3qyGPxD2DKiEEzWU2PzkN+7o7bUUUjvmBr5zmceKkw9zMmxOugorhVXI1m2SN7TBZrbBTAf5/v4WkpUMWYNt5EsGKKpz44oS9yChZCwQEpDAdoMYA7zj91AAWlFaAlzgxPB2DWJ52U3W389+WXX0MaQ7Oql6xwXEAhAmNcTAAJipYMz1BbLF6e0hdOEqhyODG/aZGWUdmgZZVyp6zp7RGU/PxJco0btbNpTY=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(35042699022)(7416014)(36860700016)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1RuTL4KPS9QiHsQDmkfAxX77s2SaXRq6G3Pb7m/GSCQXO4mD/MpzEgkrvQmOt4Efwt6zGKVn5kExMDRVhCX1tduYaxPxoSS7LGlP/kRjekQn8P8vOnzg6AXnFUQ4GjrqoP68hlzKBtPk86wD94fpSIEkrcCV5EYMX3dUcIW2+cvXLv8WxRvfrY2JelpurcnDzOYt8z6bsGa4S5g+Yt6e8L0d4RfYH7nitoy1jmpt9vt/6vIsNh9KzZKxqIiM7LjhmKmBgceGdOYTGPezIcY071GzU527d8nPeHkhtByOt6GochHxt6la4w2CZx6Mfir4c9T8sLry/CQwJDTWcA94/qiMG+fwTJWFik1O//gfT//zhyPJoKYeIr2roFZVPlzfkLH8Q7bhwXIpDlVQqRG51ZQObWyrU/wdXJAxU/mys9tVpHDG9jzMAoZ4ZPvsD5AK
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:47.7864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42316bf9-2c57-41ef-6496-08df0a7b9949
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9220

Cypress HX3 Hubs are combined USB-2.0 and USB-3.0 devices, and should be
described by one node per speed and linked by peer-hub property.

It is however possible to install this Hub to a USB-2.0-only host, in
which case the USB-3.0 peer has no place in device-tree.

Remove peer-hub from required properties.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index d6eac1213228d..aca2fe796240f 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -53,7 +53,6 @@ properties:
 required:
   - compatible
   - reg
-  - peer-hub
   - vdd-supply
   - vdd2-supply
 

-- 
2.51.0

