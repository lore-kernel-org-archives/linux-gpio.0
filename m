Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021126.outbound.protection.outlook.com [40.107.130.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E434DE731;
	Mon, 28 Sep 2026 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.126
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606373; cv=fail; b=qi3gMWXJrnpVEMkNtw5LUwawf9X/WpIAoRzzxdo1v2IG/rBFm3B75qA2scH9O81LqiUnOZYjcc0F4pxEHSkqsNuFaZgAUaXt1levW9klsfyD2gEuS28mM7tPrUb47iH/XNRgzWy6cfH1MRGcVydT4HYYbENUtudx30TNTyYO6A4=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606373; c=relaxed/simple;
	bh=G9SKCX7dEIETOJVSqfAjAsTD6H1nRzTTekF3YsgaVe4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rNDzOSS5ZdF3wBSWbi8O4y2AMF4u6mDSx4lUIHnGwgOuVmiAXlu0iyEl5KGkcknWSeiL+DaNVxcflR2s21mPiaA1gJbWHO+x4PoGetfbCpycGt9YshqJUOwQqyGTQE9rfZqsHF76NKPhkZWLDSkpPMGLkLsRD51E+h4LlwlESyQ=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WOJeQOPp; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WOJeQOPp; arc=fail smtp.client-ip=40.107.130.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WOJeQOPp";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WOJeQOPp"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NO28uEmO0D6bEKexsIJi4M35P0jTVhZW4sA4mAoR5NbzbuK4DlWhceYYQh16TN+pknCuRgBOtUTmmXh9bPlySiFeV1ZTZ9xeLS0hNJVfQK4wta5EqyzNHUifh7WL0mJTDjfzjwIL6CRSjyOrG71X/vIqzhvOIdjUD5Vse7ZtPVDC0HHdqvErhrt5s6dZeCTDeQCUE8Wwz1vnbEiJAtpiktyyfY+ReoHbEVu3yluiYzynUuXYUPm1tky1c/OAeFTRAdXUBVUPoQ9ko74cxa/9eXknMxHcZ6pDdgjyn2du+u/N3kCURWFbLnmuFnlYpYYfiKxhO55hkOGBcbHaSZbAaw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9SKCX7dEIETOJVSqfAjAsTD6H1nRzTTekF3YsgaVe4=;
 b=tPacUYgQ9Yy/k9oR3neeFoDjV0/4xksTCbJuDV13rxCF/mpgcxP1TRawTSktp0QWtkk+WVz1xMrkqK47wi1EdRVtAe6IaxU2xXn7/TseFCIWiSv4rZWqalh1RjLabJbV2tqx0jdMaSUgv1Np97WGiLoQBRhjVBUylIPbqVjWweLkE/UD1yRdB7/ICUbEvCBLb4ulXY1gMLQqacur/cAtkEU+OGx5QI9JIUVkKMoRljvg8B6j5Z8M+EGP4g//eydh6TtFOEpOnyYU8GuuXEM4tpovzRarTQMtJDIVbwaNeUnt3uA2oHDPreQfJKVhL3lULSV5j+4oEvw0X4EONOvAUQ==
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
 bh=G9SKCX7dEIETOJVSqfAjAsTD6H1nRzTTekF3YsgaVe4=;
 b=WOJeQOPpVctmJufF19uO2tyvn+jSOVJeR/cwhSLkgeY/lJA81eUvsB4QFl67k2ouiIKO5w/plfiwNYLGbngtELSDlaxlXXKNrK6zOtxUQOPxEI7AUhaCcsirTWVi/kHBe1hBqzWwzaU+Lwy3MLwFGeD6tm4psGX4TKqapnbQtuXwW6H8u1Du2rwvIQa3MhT7LC79UuocXgOoZBaUQ+e7T7AO76aYIk/CSN4hXKVW1qFPTERWcSf5bxIJiIHOGJgXhZ4OcuF2odNoHZ+xBb9nJC+YbZCYBlSD/g3bOYGyf97xigbAd5GLIe8CiD8YTQHeg84DDJbaD+YT+MUwULsQvA==
Received: from PR3P191CA0034.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::9) by
 AM7PR04MB7158.eurprd04.prod.outlook.com (2603:10a6:20b:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:39:16 +0000
Received: from MI3PEPF0000855F.eurprd05.prod.outlook.com
 (2603:10a6:102:55:cafe::94) by PR3P191CA0034.outlook.office365.com
 (2603:10a6:102:55::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 14:39:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MI3PEPF0000855F.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:39:15 +0000
Received: from emails-268501-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 244FB80512;
	Mon, 28 Sep 2026 14:39:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606355;
 b=FN7/auPHCvgfKIer4fK8Zv34et3VA29pYH97aBRwSOyXKNjJt04vHHonsVJEebKbUcaQ1
 Oioc+KGE4hlZXNXu1//770RVZnoQ3KWu7HWezPKBKTEnkK67JLMtllKsX9xrDbQykvWM1qz
 wlncPE2CQjCwtYvzhbxcuTxLjYARq0A=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606355; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=G9SKCX7dEIETOJVSqfAjAsTD6H1nRzTTekF3YsgaVe4=;
 b=jlxoJgJ0LtOifBYdAr43DzWACDnVB18HMaUwGjw4Raq6FBDou3X8B2cSJXViUxpZKwUjT
 YOdu//ZqevCgj9H/Rz3tijkI+K/DqCn8NzgipHbIx9tDQrp8iJskdqHiNQSs0LYBLGvRJgg
 czh1qPl0+3lyDC/2ZiCISQt4XyFjDUE=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9SKCX7dEIETOJVSqfAjAsTD6H1nRzTTekF3YsgaVe4=;
 b=WOJeQOPpVctmJufF19uO2tyvn+jSOVJeR/cwhSLkgeY/lJA81eUvsB4QFl67k2ouiIKO5w/plfiwNYLGbngtELSDlaxlXXKNrK6zOtxUQOPxEI7AUhaCcsirTWVi/kHBe1hBqzWwzaU+Lwy3MLwFGeD6tm4psGX4TKqapnbQtuXwW6H8u1Du2rwvIQa3MhT7LC79UuocXgOoZBaUQ+e7T7AO76aYIk/CSN4hXKVW1qFPTERWcSf5bxIJiIHOGJgXhZ4OcuF2odNoHZ+xBb9nJC+YbZCYBlSD/g3bOYGyf97xigbAd5GLIe8CiD8YTQHeg84DDJbaD+YT+MUwULsQvA==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by ZR6PR04MB440728.eurprd04.prod.outlook.com (2603:10a6:910:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:39:05 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:05 +0000
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
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Thread-Topic: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Thread-Index: AQHdPGRvvl5HIwf1q0aLlPqTxmg9drbcWVeAgAfUOICAAAXDgIAAAhwA
Date: Mon, 28 Sep 2026 14:39:05 +0000
Message-ID: <16fd1df6-f3eb-49d7-98fb-d9501d966470@solid-run.com>
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com>
 <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
 <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
 <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|ZR6PR04MB440728:EE_|MI3PEPF0000855F:EE_|AM7PR04MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3c8289-93b6-4fca-a1f9-08df1d6e4552
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10070799003|38070700021|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 B3ULNsPq0EcJOzE4RCC4ZMeckK6HpiXL3GqgEeSWbKpMMAv46LQQI4ADj3HLxgRX2uAaWvFAOgVXw3fvy2i5fhobU/kzV7fAVjAuVmcys/MY5nJFNZihehll91xrphRRXllOq8G7hwBe2Ejbh25JX6ya6cOTs1XOTK304Hf5foXsZK87/DKYixGrRrpIXhh0isfkBKahHoDAwlEGtTiUrqPEZiPlwwTIl3TH2pBtLN05F6FJ9EQmqDmX4VzLzWZPS53N9nfl6nl3UCLRpMKuXBysbOX/wwBtr7Ll3AiDBb2y53uOu590Ae0lw2gAaWHEflPwfQZSi+yd8KukBacEm6b7O6BOE1WuLSYFeD+tYdVEGXcUHPAQgAuxPWU5BnTf6leEcsOR2VextAXxWCt6DR1LsUnK5vLPHvqsYdtZbaS9AOgzYYdbcc7Ls5P07w4O9FdgtvfnR3bPpWUvLWjLUK9mo/jPjYms/suAiR2Bv8GB7T3eXYw5tlPP+LpbfXc2lL4eYyFfO5lJ2owFke4IsxLoxi+jPOkTw+XP+mWGrgBdop8nJgjKjU0NojUvD8XOsTDTrEqv7484fTGnhGnI43Sri7XnLVHfwYkEC+6GQVx6fi3uKgxknaCUMaRLGUgbwPPR/Fwp5GsaurtKBJYjZww0pT+C0wWR0Bv0FTvzjwg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10070799003)(38070700021)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDBD17022E81F046826CE4C60660B0CD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ZKAomZCkWn8dBA3H2IllDWk5IDg35JI026h1k8WwWIGqj93d5pJ9jLjDTTxA+Jb9kz5hZ+C9RyEXoZsNkzks9IN/GAapSzmnU1yR+b+E6OfuRlbfrlHreaiPgprVvceX83KECyUrwo4Rwrr6jbzj5bc2wu6bMTiZ9oxhP3Ex0F5JwCV8w6ig66Bo68TbsHuegdSvTLLeitKPTixWm4dyz6B+oEAtgJDXblHglmwCtw+Db4HDSyV7nofxl5A8alFlOtRtP2jxwwunhXzb4+510xcfWILmuaEBzF76jbGYE669FzKDLekKc5I4USpzW1/JQPICy1mQ6zaWu05GgZjFSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB440728
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8933179553964605860cecedd61d7d86:solidrun,office365_emails,sent,inline:3e0610331c603246cba0de88078a76e6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haob7CYCGF1n7A3GdAPkluIM3gXXP/mhbkMDC01cCxgU0WGjLW2T0T1FvXXKssAcbFq7i+JEEo2W2q5dhuiWmhTSMZ/ED8E0ayMvG+EAdDmAMGsK9Eg9bx8NfyMOdYjPI9FhMkz6dy+LyCYqPf8txxqQ/vsygqLZ8uUZYLuiDXrQQNlwii7Ia7WEz1+bT5pB02aRW1WRcmw8F4OuGBKXfiULiCRvXOC8gLlQ+YFr73KPIh8xZ/0ekPJe+57EvhCY+kZ7X/7Injs7bobr8fZTmohsyGCJ/FN6x/s4ZA+QweV4iw6GyCuB39U2oy0L9+5ZM2LS38Kg8/jYr8yIw0YBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9SKCX7dEIETOJVSqfAjAsTD6H1nRzTTekF3YsgaVe4=;
 b=mNUZOwp/If2xiLktlIm1EehqRpn1nhi8WHRJHJSXeghWIW9tSiP0YBK4wPwDwB4RlSUA0icU9jN4AybJ1bh86xP2kDu7JSmZ5rvV0/GpWkLckzzZnsU4FvnwuzHUmm8BG2MWPakIZpKnxEelsIGtbmYn4Kdg2bIHYBdC2NFeG2+nNjqvq2Q6uOKC2pxneNZ6p719aoyEgyqAuwI7ylwZfUAfNgZxMrsFY2tjW/ZjvcI1BKR4cnSiT43D00v7+RQCX6DWpByz7s/DMQkPyabZhfWfkY301f54lDknhNOHi7lzl8gP1r7S79dzjXsCiE2GoBV3puagE+DhzGCRki/ukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF0000855F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f54cb56-6ddd-4265-c73d-08df1d6e3f07
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|35042699022|14060799003|82310400026|23010399003|36860700016|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uSWDNxmY0kmArR/Lq4xrYyg9olDIQpNRU+gaCa6dp6EEvCVTdPfE26+jOZQPTkwA5VZXybdQsbLeNK8YRa2d+DyvnHo1UPVcf3hfnfZyY9ElN/C5s+nj5SV9hPHJJY7gOwzTGZc8j/N5yhUi3uJqHvhmSWLkA+axQJ33paq9GhhYwp7OyX0/d0yAozvUz3/niVrslmmBNgcP/DQicXg6t/+KWXM+2JPk1TeOtMeDOFKkGZWT0w/2ONIDfOjxl84HOT4Ue4rprUUbgZOXXT0JM0Z1JGuGvy23L/6tLdHyHi4wKXTqcORIUgTgZstfXoABxz9Qzcs8ZIjQWOa5Qk0/VVnAUM1z97P5+vZSNjWxnDb8VQz/pXdBLX9wkLT7Z0ECDvY9x+Syzcy1TyjYlhFKSld9eZHA9Q8l9bQ2+gv8MiJju3lVHcDMCy9I0ckHQEMfTN9/bfwKdm92nSxI+L+zKkEGBja5HacyVBdM8SSbCZPCfMIMm2S/rgGzLYUmcTnnrn3AnBJLYFRTuwmYUDqHoG9ny4ot2iagcdc0w6zM8wOeRWXuntXgFiuG6R0L3GYh7SmnfM+j3QGgTO0i4Tfe0aGVvwe2Q+UicdCg4WDzLTYRdBmcCiOg2YXLKQPp2TIpp/qLtzadM7XNvccZ/AiTVA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(35042699022)(14060799003)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PCa/IIsnjnMCmthuYxw2SLSjjeDT26Sv7ApxG1f778rel7SYYm60SUvuViDT6ObQ6585n9IPgbB7LVZyRHQ1sJEONO5sEKs3gKBZEJRDRBUQ9EebWwjXYymegNnFl4JbFurofD19efsWIPDLuiwu8mbr+ZNL+Ato/MsP9zVTjRi0ZHbesg4J6qraF19+N7tJRhP8foP1UTVejc+r5vD2IFbI4Cu5+EhVF8TwcFMHlGCoHoVjDwxVqTxEpOWvWUUr4OacEnyhE9w9kdWpCDwAE3OLlOe7LcS/sv3wSDgMDnc++RxYWwQYCgPb+QdzZ5VJq9oIowd2qoO+6zvnlbtj6DztCeh3nTLGvJ0wlhTg/zPpii9xYRDD+99QB0d3L+26tndR2rElDCcNyWN4X//osMvswY0vFbe0XIBBfXCXFOeceNAYsvN4RYSHYQS+t6h6
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:39:15.5210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3c8289-93b6-4fca-a1f9-08df1d6e4552
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7158

QW0gMjguMDkuMjYgdW0gMTY6MzEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+IEhpIEpv
c3VhLA0KPg0KPiBPbiBNb24sIDI4IFNlcHQgMjAyNiBhdCAxNjoxMSwgSm9zdWEgTWF5ZXIgPGpv
c3VhQHNvbGlkLXJ1bi5jb20+IHdyb3RlOg0KPj4gQW0gMjMuMDkuMjYgdW0gMTY6Mzcgc2Nocmll
YiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+Pj4gT24gRnJpLCA0IFNlcHQgMjAyNiBhdCAxMzo1Niwg
Sm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+IHdyb3RlOg0KPj4+PiBBZGQgc3VwcG9y
dCBmb3IgdGhlIFNvbGlkUnVuIFJaL0cyTCBTb00gWzFdIG9uIEh1bW1pbmdCb2FyZCBJSW9UIFsy
XS4NCj4+Pj4NCj4+Pj4gVGhlIFNvTSBmZWF0dXJlczoNCj4+Pj4gLSAyeCAxR2JwcyBFdGhlcm5l
dCB3aXRoIFBIWQ0KPj4+PiAtIGVNTUMNCj4+Pj4gLSAxLzJHQiBERFINCj4+Pj4gLSBXaUZpICsg
Qmx1ZXRvb3RoDQo+Pj4+IC0gU0RISSBNdXggc3dpdGNoaW5nIGJldHdlZW4gZU1NQyBhbmQgQ2Fy
cmllciBCb2FyZA0KPj4+Pg0KPj4+PiBUaGUgSHVtbWluZ0JvYXJkIElJb1QgZmVhdHVyZXM6DQo+
Pj4+IC0gM3ggVVNCLTIuMCBUeXBlIEEgY29ubmVjdG9yDQo+Pj4+IC0gMnggMUdicHMgUko0NSBF
dGhlcm5ldA0KPj4+PiAtIFVTQiBUeXBlLUMgQ29uc29sZSBQb3J0DQo+Pj4+IC0gbWljcm9TRCBj
b25uZWN0b3INCj4+Pj4gLSBSVEMgd2l0aCBiYWNrdXAgYmF0dGVyeQ0KPj4+PiAtIFJHQiBTdGF0
dXMgTEVEDQo+Pj4+IC0gMXggTS4yIEItS2V5IGNvbm5lY3RvciB3aXRoIFVTQi0yLjAgKyBTSU0g
Y2FyZCBob2xkZXINCj4+Pj4gLSAxeCBEU0kgRGlzcGxheSBDb25uZWN0b3INCj4+Pj4gLSBHUElP
IGhlYWRlcg0KPj4+PiAtIDJ4IFJTMjMyL1JTNDg1IHBvcnRzIChjb25maWd1cmFibGUpDQo+Pj4+
IC0gMnggQ0FODQo+Pj4+DQo+Pj4+IERlc2NyaXB0aW9ucyBmb3IgZU1NQywgbWljcm9TRCBhbmQg
UlM0ODUgYXJlIHByb3ZpZGVkIGFzIG92ZXJsYXlzIGR1ZSB0bw0KPj4+PiB0aGVpciBkZXBlbmRl
bmN5IG9uIGNvbmZpZ3VyYWJsZSBtdXggc3RhdGVzLg0KPj4+Pg0KPj4+PiBbMV0gaHR0cHM6Ly93
d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWls
eS9yei1nMmwtc29tLw0KPj4+PiBbMl0gaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRl
ZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9odW1taW5nYm9hcmQtcnotc2VyaWVz
LXNiY3MvaHVtbWluZ2JvYXJkLXJ6LWcybC1pb3Qtc2JjLw0KPj4+Pg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4+PiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+Pj4NCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+PiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtY29tbW9uLmR0c2kNCj4+
Pj4gKyAgICAgICBhbGlhc2VzIHsNCj4+Pj4gKyAgICAgICAgICAgICAgIGdwaW8xID0gJnRjYTY0
MDhfdTQ4Ow0KPj4+PiArICAgICAgICAgICAgICAgZ3BpbzIgPSAmdGNhNjQwOF91Mzc7DQo+Pj4+
ICsgICAgICAgICAgICAgICBncGlvMyA9ICZ0Y2E2NDE2X3UyMDsNCj4+Pj4gKyAgICAgICAgICAg
ICAgIGdwaW80ID0gJnRjYTY0MTZfdTIxOw0KPj4+IFRoZSBUQ0E2NHh4IGRyaXZlciBkb2VzIG5v
dCBzZWVtIHRvIHN1cHBvcnQgZ3BpbyBhbGlhc2VzLA0KPj4gSSBoYXZlIGNvbmZpcm1lZCB0aGlz
IG5vdy4gTXkgZXhwZWN0YXRpb24gd2FzIHRoYXQgc2V0dGluZyBncGlvIGFsaWFzZXMNCj4+IGhl
bHBzIG1ha2UgL2Rldi9ncGlvY2hpcCBudW1iZXJpbmcgcHJlZGljdGFibGUsIGhvd2V2ZXIgdGhp
cyBkb2VzDQo+PiBub3QgY3VycmVudGx5IHdvcmsuDQo+Pj4gc28gcGxlYXNlDQo+Pj4gZHJvcCB0
aGVzZS4NCj4+IElzIHRoaXMgYSBnb29kIHJlYXNvbiB0byBkcm9wIHRoZSBhbGlhc2VzLCBvciBi
ZXR0ZXIgdG8gZGVmaW5lIHRoZW0NCj4+IHJlZ2FyZGxlc3M/DQo+IFllcyBwbGVhc2UuICBBbGlh
c2VzIGFyZSBtZWFudCB0byBpZGVudGlmeSBsYWJlbGVkIChudW1iZXJlZCkgY29ubmVjdG9ycw0K
PiBvbiBhIGRldmljZSwgZS5nLiBmaXJzdCBzZXJpYWwgcG9ydCBpcyBzZXJpYWwwLg0KPiBBIEdQ
SU8gZXhwYW5kZXIgdXN1YWxseSBkb2Vzbid0IGhhdmUgc3VjaCBhIGNvbm5lY3RvciwgYW5kIHRo
ZSB2YXJpb3VzDQo+IEdQSU9zIGFyZSB0eXBpY2FsbHkgcm91dGVkIHRvIGEgdmFyaWV0eSBvZiBw
bGFjZXMuDQpBY2tub3dsZWRnZWQsIHRoYW5rcyBmb3IgY2xhcmlmaWNhdGlvbiENCg==
