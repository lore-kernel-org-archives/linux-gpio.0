Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023093.outbound.protection.outlook.com [40.107.162.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9F0456E10;
	Fri, 25 Sep 2026 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.93
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324962; cv=fail; b=Ge5+DT2qpaj47wykzqBhn6g091HW+S66mkxoD2Ez8YA2zYwyy8EQ0kOZZB9fT1pWwTcjY2YAPm4ckOXaZaanh4xR5PmyLEoM/MIZ5ljFTl4aYLYLVo/hH7rW/CFl57HANwTC4BU6tHUkvAgclboNTNmYKl1MbZoAmKtbw55Q0LE=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324962; c=relaxed/simple;
	bh=8CiziOQzFDOaLdfnifibFlXdA0mgflar2cGXGmPB12s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CsxLsY4QxiTMyNQTQdgTIh5Q8zjiODUL8UaqHXUZ/0iAUetQInB4taTG1UDMQC7M4tCUa06i0EvETAE8uVZPofEe2W4z3P3BhAcUpZnNc6K8HVghs8TYmpy51M8ybkcNeP34aRZ75EmuV1d/SdJa36Jt4HVA8fdBLHlxhk18c0o=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=IN33caQf; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=IN33caQf; arc=fail smtp.client-ip=40.107.162.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="IN33caQf";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="IN33caQf"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UTH9VFhzZa6ZwnDQIriF54B44aGX8PvawPNHTm/l4uURfQvGryTjY5MWz3SHrrS1p6e6vCMwqLpBwqDu59X2Mfy1CNzOV6BWM7M1GFufTZ0BFaXS3cl9dKWSoVv2UcpZT195BrQ9DORwKabnLpXD5RSpiSg8f+m57eFejpz/iCujzXtb+ALbRftmctHPUyj6nI2iJhhuhrpZ1iGGaFlq2Jq7k9a/93FXt1pMiUih8y9ZZquQ8dnSdmc5iNyIOhsFoCNz/ufmiLWBYjOXE99Io9DDCylqsC9LnjaIyzJaz0uGvc/QlrHBFnoUeiO1oCQo2HxNSlN017bTCNfVlhZw1A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CiziOQzFDOaLdfnifibFlXdA0mgflar2cGXGmPB12s=;
 b=R9cwYP+83puIGEfpvWbE1aEI9xtgbhU3oW6m+A9F31mpHqHF/nJeMFle9C5q/gJR24VZBVVU4mAeaF4dQZr9/yLNx9/kusBiZ8Ak38WJhyg9LugE+ypRe+SwpxP4DwZlkt9WfPrrooz9aaGBLE374G8iBQ72TZIocJElYHgj0nsQ7rMJzBhJzfDQyE1zSrneh2wunSypXXOBQtVpO/Pt83wH+T9SyaYhXRurOe1NauhnXQsiEpbGjCPoD/qyeRh0wOVH/HJ6ejP0vCycgd02Ny2RZFFXvJyz4d65rLxzUNNGtyUWY/RuEJc+jGzZ3k/pPe7r0mzNRnl983dgGi2NTA==
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
 bh=8CiziOQzFDOaLdfnifibFlXdA0mgflar2cGXGmPB12s=;
 b=IN33caQfgcoD6pTNY1ooHxaqSaHnxcEmPqLn4uppGmyfzWWswK0ZhPhabKEH/VnOkn2BZEfbpBe4XPaSCORH4qPjtUIvA5JASdx4He+Xl9O6F3YESN/fVNOVQoSukf8+QViDcBcxwoH7NtabpNYKyN7mA2mO0RKpairJDuPOikB8zIAZRpeH70Oj2kdydqdFBTdF40/+bH8r5RwXSq0f1R+zjjof8mTBgsPC7a923DmSum2S01nGZOjtURnfXdYZI5avtNslPBgMSFg3fmshS93VtUmEpLU3zRIVrn4J6E5ekbeOTwBC+5xYirQHbxKNEIB4Cwcx4TAajqZTzbOVsQ==
Received: from GV3PEPF0001DC23.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::11a) by GV2PR04MB11352.eurprd04.prod.outlook.com
 (2603:10a6:150:2a2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 08:29:12 +0000
Received: from WA1PEPF00009B38.eurprd05.prod.outlook.com (2603:10a6:1d8::115)
 by GV3PEPF0001DC23.outlook.office365.com (2603:10a6:158:400::11a) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.382.12 via Frontend Transport; Fri, 25 Sep 2026 08:29:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 WA1PEPF00009B38.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 25 Sep 2026 08:29:10 +0000
Received: from emails-576986-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-78.eu-west-1.compute.internal [10.20.5.78])
	by mta-outgoing-dlp-272-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BC2B1816EF;
	Fri, 25 Sep 2026 08:29:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790324949;
 b=n0BN5cbU78+S3Ddu0Z8HdszT2m5yP2rmR13/3wmte+eKxYBcgcUUwz1HxtBGLFeFWZ8C3
 tABIyftNLQXVd7tOn5VAsZtFg4jXLfMHTH0aW04Bt/VscUVOvLNRc1o9x1luH6yq3WoAdjY
 08eYAjSghe0Sb8A9xYjpL6Vs2XBH2mc=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790324949; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=8CiziOQzFDOaLdfnifibFlXdA0mgflar2cGXGmPB12s=;
 b=M+7iS1hKkEKJnOOo68iBMuB+FZuFOJjllkHfkSO9bD9WrshYG5xgZ4JGt3Nn5Up0HBjAc
 iQ82buXK7f1JrlD0chPVHplZ0DVu+li9HVMxd3zV/z/lNjL9/3rQVL+fnNqhYu0powPFRL8
 kZ/FEEmyeHaYSUl48NypYmzVxZRYvbM=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CiziOQzFDOaLdfnifibFlXdA0mgflar2cGXGmPB12s=;
 b=IN33caQfgcoD6pTNY1ooHxaqSaHnxcEmPqLn4uppGmyfzWWswK0ZhPhabKEH/VnOkn2BZEfbpBe4XPaSCORH4qPjtUIvA5JASdx4He+Xl9O6F3YESN/fVNOVQoSukf8+QViDcBcxwoH7NtabpNYKyN7mA2mO0RKpairJDuPOikB8zIAZRpeH70Oj2kdydqdFBTdF40/+bH8r5RwXSq0f1R+zjjof8mTBgsPC7a923DmSum2S01nGZOjtURnfXdYZI5avtNslPBgMSFg3fmshS93VtUmEpLU3zRIVrn4J6E5ekbeOTwBC+5xYirQHbxKNEIB4Cwcx4TAajqZTzbOVsQ==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GV2PR04MB12216.eurprd04.prod.outlook.com (2603:10a6:150:336::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 08:28:58 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 08:28:58 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara
	<benjamin.bara@skidata.com>, Linus Walleij <linusw@kernel.org>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Thread-Topic: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Thread-Index: AQHdPGRvVFtRJQvYPkeh2Ir6WjoJ9rbcSemAgALNHQA=
Date: Fri, 25 Sep 2026 08:28:58 +0000
Message-ID: <29a64d27-b19e-41e3-8d2f-768cfa8de2e6@solid-run.com>
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
 <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|GV2PR04MB12216:EE_|WA1PEPF00009B38:EE_|GV2PR04MB11352:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e61cc45-47bf-4418-b58c-08df1adf12a8
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|18002099003|56012099006|5023799004|22082099003|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 E4TxeLMNenUGohpQnB/vYHKmbhn1npQ/Zm1N1o+Dx52S2dXtDqiOneknVtdPdRwygcK2HWJz2vrEQMLauf8xURLAnz7L2qriKf5WTj8IqjsPI6UiqL8bSwyR89iCOOtnr7F/l+u3iNiN+JllJ2MyEbd2H4ORpaM0aFqjpktXM2yEh9vBH6G83HsyxApMA8gnxZxTnMoaC+9l08QhkaE8sVKSs/i4uPusulTUDCzAinbnojAxavRDWH4GQJvpsOFi7KWTshEvaHuY+jyLEhv2/2wPtSV1fqS1zBDmYzXlwFsTuS3QDd4g0WWatHbC7DY2Z5htS1+RWbk1Vk6uNmenvxlTnEPwuiXDmjzEh1Eu8CSR4jzi1uQFRQT8u3SGLUc7PjxX2k0rCC6X7003Tq4i0Ry2G8nJ2d8MLrooARpBNTGF4nvlCW8InjzP7NpdyoF1yso6+VMp6ZV/iu4X4+8jBBUrJ7meZnA1PJs1nhpjZFXQk+5LOje4ImUPxWMBlIheMNqnYzzYiXnkegQx5iB6kB4DiVqzErGrtXjEnPIeavAG7rRnySvSz8AkGUpDVwXvSlYYCHAJUzpm4jWEyb2RrsoMuLs0DDXiU9ylVE0wgtyeDlE7mwifI1AQryIPUNdHNsWrJA+sz0kYDuU8+AxXGKgW0jPk2xEXtuXahPM7UbM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(18002099003)(56012099006)(5023799004)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8335A2C2D50F8488AF9E1FF30E471F1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 XdXplkWzUfVC61fXJ3XRM/eRq1pfdlReQhUm8oQI3DMALY9KJkP6c9HfmC9K2XtYaOM3gZwLBfTwyUNXiMLd5gZsAV2aH1pCAdwtlqPUb8Repb/nIzXt5k713Gxtlli8kj9Tzh8KTAs73IOsSIaQf1tCBEeWbK0VtMAYZ+lwUi1/Ysk+EiMPHhtENlZfBNIzUL5gJ/AKDDKRgNc8brQ/+NA1XCKzLiOYNIctopSQaPoxb+Img/b1HNlEmlvyOkU3UaW/GWd3nBzBlIPLDMlSd3ls0Y2Bkun6044oDLdyjVKrcG7P2H1aIdEfKLtnQuJawdMb6TFbsOMLj8ifUFZncQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12216
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a08cac826f944c4181a3e4b02d68f60c:solidrun,office365_emails,sent,inline:46ad0575a168d9d0799c777d5bccb3b6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY1G6G7x5pM+o9nj7Y9wmm6PVn8w9D1KMahlDyEQH0BXI/rw67yK6Ti6ogidB0yZZ00PSyfefKE2923f73z4S1PG3Zm6LexFVYLVp+1vnOknPvmRrt4J7uhcYzIKp5nWdoqIX6TWH+uz3kaH97abrgelB+BGg/f3ACZcrAl2YuDy0yrZJuaMnSDyA/X5IhCM5e4eBHYSjJI0AX7XcY0E7PZRFcuyLxmq0DaKMrgOUrGFmR6RlvTdfS1icoG+ezmaZz8/5JEiD0C33fPJkjoD7Q6p4VR2w6cwTJsNdMnmSE8NB4zQYjpjtHJfagDKei/JUxIzfQMSJ+4kTXgJf+YPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CiziOQzFDOaLdfnifibFlXdA0mgflar2cGXGmPB12s=;
 b=ZejhwCw795/D4Nuz95AMNT2gOAI3qRBZU1n1dGh1Q6N07P6g1cRjLO7I9/NzL3ChajvUtTL6Wol9+34K4LzbkRZoLqPBX7jBnn7WzIuGbZK2qL1hb3pRHL5cGhfTX8hqhzBPPPh1DaMGXJdQ11xUdguvoB9dq3nnZmklZxRfluI3xlGNMxrFyHYOKC63wB0QcAhw7sM7PKoZJfxJV20yJa+3UUNQXZYYGOU46j/8b2GQVO+cZYYEWLaO1oMkPVq/0KVPSIsRv2GdZfFW+T2/SlmkUx6B56nxDDvTWov7Q5lKxFFyyXgBUnmmKnpwRxGYf95eyatOZIiYPOcHksjbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 WA1PEPF00009B38.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4e2eabd-6bf7-4bd4-35ef-08df1adf0b7b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|36860700016|35042699022|376014|7416014|23010399003|10067099003|56012099006|18002099003|22082099003|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	azqSrFdC8SF/JHIyMUD4+2IeE/+f12/se2T2BzmbuOA3JvwPgfa3nhtcZ8iQJhO9a5oe6tSUziGZP4XnrAonV4JbJbJ9oPCfjR3YFnh1tBtMB58WkG8EvcaYdAJV5Ln1YYoulFkvAsqKaVhYRqVIS/ZXMsmwcySYenUvjxt5uf2IfHNG9fI/P3J8mfv8ggNGkrCzjuoKbEARqbkJzGgr1MPBv4tOTaoJMKBEd4hEs/sS5qSPIV1NCJYO5TA6VRnqgpZ/qxkufwFnjAo6IHcibAlUcZakNolyxSNhmGTual5+mBx2ld0JitmquP1jkPpiJUmL6ROKWOeIvyAjweAMSl0HWYCfLLqqKXEks5PhaCMZjFR8KflY9rIPfJSwQwrMjkEKHlj2GJOX28UDOyonHFH/5VPRCdGQvyf0+itt2ATLJsSbhqOeErOcF9wbfIg4oxNGbksBxBViznBZw1Xaabi6tiYoqR1MF2IyhRgBwljkwZ70W6RbCy83eun8YTwjQbsKrpiIDu1qFQ3LAA/zWyqPhfERRTmF2AqCrqSAsYRzRuc9zmpcojzLklF9EvvwTAuhNzEyB8Y/bZ6+L2BEC/F6IKfBnhFxUgfARUXKvL7ZYr67sVwItDqXP+ha2FTvRQlZoMigLSQ/Dpsm+Vd9x+gV6lX+v90/i9mO5oAnIpY=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(36860700016)(35042699022)(376014)(7416014)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KkMhI6yIx0CVQkK/Q8UJyXuq3GhuZ48NSQhv1vqXxnnOUqAQnB1guWwcqjQGhOkZdS5PgT/SeMFnNgiSOUlVIwq5Bohcb14E9p/mOfV3mM5bU0zSSJM9v+rQfpCtY96zb08ZPQFuCC8bq0YkeO6Ibd70j+SbOa5kIuO7e0YNn0Lkc1i6mv6OGnpyGta9tp0PXn3A5E5n4TjVaztyRXpu203iTuQAcnGWHRrO1eoAniyE683jAtXbc/cbDDeC9Dy8vpNnl1Ii8+HfyE+F/Cbo77F+71x3O+Igfyz/lfSaRUox9i760hVupaAvWx/bhzS3WUU/1nb9PxJTK6d2fMHclNoXJ9WVSj40OwhzINGt0pFWEi9XuX0v00NxmnKKd+WkaP37oVej5kV3js5iiotNDxTVt/f4Ix+sv22htBFir2bj4VXH+6QQiaVja/ArI1yG
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 08:29:10.1449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e61cc45-47bf-4418-b58c-08df1adf12a8
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B38.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11352

SGkgR2VlcnQsDQoNCk9uIDkvMjMvMjAyNiAzOjQyIFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEhpIEpvc2h1YSwNCj4NCj4gT24gRnJpLCA0IFNlcHQgMjAyNiBhdCAxMzo1NiwgSm9z
dWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+IHdyb3RlOg0KPj4gQWRkIGJpbmRpbmdzIGZv
ciB2YXJpb3VzIFNvbGlkUnVuIGJvYXJkcyBhbmQgU3lzdGVtIG9uIE1vZHVsZSBidWlsdA0KPj4g
YXJvdW5kIFJlbmVzYXMgUlovRzIgZmFtaWx5IG9mIFNvQ3M6DQo+Pg0KPj4gLSBSWi9HMkwgU29N
IFsxXQ0KPj4gLSBSWi9WMkwgU29NIFsyXQ0KPj4gICAgKHNoYXJlcyBQQ0Igd2l0aCBHMkwgYW5k
IGhhcyB2ZXJ5IHNpbWlsYXIgcHJvZ3JhbW1pbmcgbW9kZWwpDQo+PiAtIFJaL0cyTEMgU29NIFsz
XQ0KPj4gLSBSWi9HMlVMIFNvTSBbNF0NCj4+ICAgIChzaGFyZXMgUENCIHdpdGggRzJMQyBidXQg
cHJvZ3JhbW1pbmcgbW9kZWwgZGlmZmVycyBsYXJnZWx5KQ0KPj4gLSBIdW1taW5nQm9hcmQgSUlv
VCBbNV0gKFJaL0cyTCwgUlovVjJMLCBSWi9HMkxDKQ0KPj4gLSBIdW1taW5nQm9hcmQgUHJvIFs2
XSAoUlovRzJMLCBSWi9WMkwpDQo+PiAtIEh1bW1pbmdCb2FyZCBCYXNlIChSaXBwbGUpIFs3XSAo
UlovRzJMLCBSWi9WMkwsIFJaL0cyTEMsIFJaL0cyVUwpDQo+Pg0KPj4gWzFdIGh0dHBzOi8vd3d3
LnNvbGlkLXJ1bi5jb20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVuZXNhcy1yei1mYW1pbHkv
cnotZzJsLXNvbS8NCj4+IFsyXSBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWlu
ZHVzdHJpYWwtaW90L3JlbmVzYXMtcnotZmFtaWx5L3J6LXYybC1zb20vDQo+PiBbM10gaHR0cHM6
Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZh
bWlseS9yei1nMmxjLXNvbS8NCj4+IFs0XSBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVk
ZGVkLWluZHVzdHJpYWwtaW90L3JlbmVzYXMtcnotZmFtaWx5L3J6LWcydWwtc29tLw0KPj4gWzVd
IGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5jb20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVuZXNh
cy1yei1mYW1pbHkvaHVtbWluZ2JvYXJkLXJ6LXNlcmllcy1zYmNzL2h1bW1pbmdib2FyZC1yei1n
MmwtaW90LXNiYy8NCj4+IFs2XSBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWlu
ZHVzdHJpYWwtaW90L3JlbmVzYXMtcnotZmFtaWx5L2h1bW1pbmdib2FyZC1yei1zZXJpZXMtc2Jj
cy9odW1taW5nYm9hcmQtcnotZzJsLXNiYy8NCj4+IFs3XSBodHRwczovL3d3dy5zb2xpZC1ydW4u
Y29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVzYXMtcnotZmFtaWx5L2h1bW1pbmdib2Fy
ZC1yei1zZXJpZXMtc2Jjcy9odW1taW5nYm9hcmQtcnotZzJsYy1iYXNlLw0KPj4NCj4+IEFja2Vk
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCENCj4NCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvcmVuZXNhcy9yZW5lc2FzLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb2MvcmVuZXNhcy9yZW5lc2FzLnlhbWwNCj4+IEBAIC01MDgsNiArNTA4
LDE0IEBAIHByb3BlcnRpZXM6DQo+PiAgICAgICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0
M3UxMiAjIFJaL0cyVUwgVHlwZS0yDQo+PiAgICAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI5
YTA3ZzA0Mw0KPj4NCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTb2xpZFJ1biBSWi9HMlVMIGJh
c2VkIGJvYXJkcw0KPj4gKyAgICAgICAgaXRlbXM6DQo+PiArICAgICAgICAgIC0gZW51bToNCj4+
ICsgICAgICAgICAgICAgIC0gc29saWRydW4scnpnMnVsLWh1bW1pbmdib2FyZC1yaXBwbGUgIyBT
b2xpZFJ1biBSWi9HMlVMIEh1bW1pbmdCb2FyZCBSaXBwbGUNCj4gQXMgUlovRzJVTCBpcyBwaW4t
Y29tcGF0aWJsZSB3aXRoIFJaL0cyTEMsDQpUaGUgU29NIGlzLCB0aGUgU29DIGlzIG1vcmUgY29t
cGxleC4NClNvbGlkUnVuIHVzZXMgdGhlIEcyTC9HMkxDIHBhY2thZ2UgMTV4MTVtbSB3aGlsZSBH
MlVMIGlzIDEzeDEzLg0KDQpZb3UgYXJlIGNvcnJlY3QgdG8gZXhwZWN0IEhCLUlJb1QsIGhvd2V2
ZXIgZHVlIHRvIHRoZSByZWR1Y2VkIHBpbiBjb3VudA0KYW5kIGZlYXR1cmUgc2V0IGl0IGlzIG5v
dCB1c2VmdWwgYW5kIHdpbGwgbGlrZWx5IG5ldmVyIGdldCBzdXBwb3J0ZWQgYnkgU1IuDQoNCj4g
SSBndWVzcyB5b3UgY291bGQgaGF2ZSBhbg0KPiBSWi9HMlVMLWJhc2VkIEh1bW1pbmdCb2FyZCBJ
SW9ULCB0b28/DQo+DQo+PiArICAgICAgICAgIC0gY29uc3Q6IHNvbGlkcnVuLHJ6ZzJ1bC1zci1z
b20NCj4gSXMgdGhlcmUgYW55IHNwZWNpYWwgbWVhbmluZyBvZiB0aGUgInNyIiBpbiB0aGUgbWlk
ZGxlIG9mIHRoaXMgYW5kIGFsbA0KPiBvdGhlciBTb00gY29tcGF0aWJsZSB2YWx1ZXM/DQo+IElm
IGl0IGp1c3QgbWVhbnMgIlNvbGlkUnVuIiwNCkl0IGRvZXMuDQo+IEkgdGhpbmsgaXQgY2FuIGJl
IGRyb3BwZWQuDQpUaGUgInNyIiBpcyBtZXJlbHkgdG8gYXZvaWQgbmFtZSBjb2xsaXNpb24gd2l0
aCBvdGhlciBTb00gdmVuZG9ycy4NCj4gSG93ZXZlciwNCj4geW91IGFscmVhZHkgaGF2ZSB0aGF0
IGZvciB2YXJpb3VzIFNvTXMgd2l0aCBub24tUmVuZXNhcyBTb0NzLg0KQ29ycmVjdC4NCj4NCj4+
ICsgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyOWEwN2cwNDN1MTIgIyBSWi9HMlVMIFR5cGUt
Mg0KPj4gKyAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA3ZzA0Mw0KPiBUaGUgcmVzdCBM
R1RNLCBzbw0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4NCg0KVGhhbmtzIQ0KDQo=
