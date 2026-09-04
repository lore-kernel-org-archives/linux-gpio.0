Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021091.outbound.protection.outlook.com [52.101.65.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D39C37E5FF;
	Fri,  4 Sep 2026 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.91
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520462; cv=fail; b=r9MSveFWnSlTVjl2WHQiaEz3ElwzvQ5u7G91slZJQOp4MiH++jRwFO1cpUIusZ9Mo+ORBAm+HXpwNacXawr4o68ltDYdBnR7AnIOjmyM3wzpPTbBK26uG024RpzvWIrBVQc2SDeyXkPo0Uhfj6rk9QQ5/sDt0xszOmiqBGvxXOg=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520462; c=relaxed/simple;
	bh=68CT7KXO17fcETv0YM9NUJKKQxTcfMfpG+TsLsbai7w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uNUeiVro2HsQ7zMHOnEA9kUXdunLAFsve9SpBwnV1T/x1rRU2TLtCV+TW4IVYfgZ7CVdJDPDZ7yD0l62kgYmV5EYYa6s74Dj1HPtx1N6iri0SkyuHtDs+wexZ//sCfn6VX9pVCJtMnEeRhjvWrcz/J0Bjkmut9o5+cGKO1JZiDU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Q0/IA29F; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Q0/IA29F; arc=fail smtp.client-ip=52.101.65.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Q0/IA29F";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Q0/IA29F"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Gw2/fxI++rGjqL2Ud3lO7lfrKBRtmdGWgwA8CpA/Lw28ZB6YQB0wcxYtyAoxT2dVYwzeWIST/2ZtDqkPRivoEAKNW7AN33W7qOKbq5a+eP1bfwOTpdfBR+F1sfnnWxI/TtinqGATm5fVhQw48Tb0Aeoc2IjFhGCgRSLxmye1ERLf2QEdSilKbMzOQCidjYTMri1paCcO26XT3aOpYEuYdfnq2sX5JpK/qG0CNHt09oDCLtn791yCffajTOKlqIp7zJYPtZ+2okpIu++93LcMMEFMju1R9dBqkMT6a/flJQdpNVnRIgNITGGTtJmGAvIHaXE/sGi8TDQNsQ7/nt4W/Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68CT7KXO17fcETv0YM9NUJKKQxTcfMfpG+TsLsbai7w=;
 b=x7vtCzsQBIyb0ER3v3di1JKJ800hs92Uh9dzJFLl7Gr4hRa9DpTUGRW3MXYeCHOtQw/m76T4eYeDzW3VgVEpSLsNV9Q7mj9P5u8beb9rHlunZpVSEni1bA+KkVv81yxwIjiTqeQQ4Lh0i0RwwGO4ItOWDaptFRa3nwsRpRE7W4y0y9G4SlSKSkWlk0Tvl1i6UVLgOi/xFkvln17LoaDz1uyF63l20BzwqORMJw6yDAVAWV+H1PPznfDh9dLGi8DGfVG2Uyxpc16popGG1WFYrn/zph4DJ5jOIxUzQQZ9vrqRCfcvaZLMvcbMfv5ulPwweTC6ts0899SBMg+5myWdjA==
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
 bh=68CT7KXO17fcETv0YM9NUJKKQxTcfMfpG+TsLsbai7w=;
 b=Q0/IA29FiaBrOz4cHP0MVDLFOqBCqhZLVBWQc8r0XuwF9RCbpukB15PneB/GFbh4AsNaX6Gupq5IJyG4jQ1hAisd/yoD+tZ64Vym1yxcilH1eQc8k25dcHnfuINneMTo5ND12pT4Xb8U0212F8HZB1b4k3B/xR3q2V5fDxMboCKTHwZNxqNT4u4/pi6mSlj77IxmPBqDP1SCzBrs+EknSIwqI3Ku6RL2iKIm3Z5D9WnC+KnsjShRt2in7t3jZg9f3PZaNSawowZ6stn4YcVI9M2yChKlEyze6QQ6HktiHLELVpkSBQcfms3K5p2owjgNG7narr9agLNvPrC/wz5mKQ==
Received: from PA7P264CA0151.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36c::19)
 by DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:14:16 +0000
Received: from MAD0EPF000008B3.eurprd04.prod.outlook.com
 (2603:10a6:102:36c:cafe::ae) by PA7P264CA0151.outlook.office365.com
 (2603:10a6:102:36c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 11:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MAD0EPF000008B3.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:14:14 +0000
Received: from emails-2650530-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C1DE281DD0;
	Fri,  4 Sep 2026 11:14:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788520453;
 b=qP9YlU4s0N2Eg1BQr7dXRVoroC/wc6TXGzFaojkiy79jmP9aO7fIC0ax/PrnpDWxeJPQB
 UNJGZErfHpTBOQK0PpZiqEWF6QqyCU3m16undE/ToT2BYkJyp2UwYs6yzhM46eI0D0Nxkn9
 uHxSKc8UwwCkFnEus5GYEWcrirSZogc=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788520453; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=68CT7KXO17fcETv0YM9NUJKKQxTcfMfpG+TsLsbai7w=;
 b=OFzP44Y3wEY+l+nPPlPxdwW17in6sAwAQAgozhyC0LbnY70WJJltzzLMIeoLHfN+NfDKF
 A2tXITMDvAk+0YA5WNIACHla6VqGI+VNGyTmC5Z49ebaiR0z4YBPde1FYESoADI3cZg6+21
 xHLCvDE9UPYMtYUko3M+upPiCqKp0ps=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68CT7KXO17fcETv0YM9NUJKKQxTcfMfpG+TsLsbai7w=;
 b=Q0/IA29FiaBrOz4cHP0MVDLFOqBCqhZLVBWQc8r0XuwF9RCbpukB15PneB/GFbh4AsNaX6Gupq5IJyG4jQ1hAisd/yoD+tZ64Vym1yxcilH1eQc8k25dcHnfuINneMTo5ND12pT4Xb8U0212F8HZB1b4k3B/xR3q2V5fDxMboCKTHwZNxqNT4u4/pi6mSlj77IxmPBqDP1SCzBrs+EknSIwqI3Ku6RL2iKIm3Z5D9WnC+KnsjShRt2in7t3jZg9f3PZaNSawowZ6stn4YcVI9M2yChKlEyze6QQ6HktiHLELVpkSBQcfms3K5p2owjgNG7narr9agLNvPrC/wz5mKQ==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:14:03 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:14:02 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton
	<jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
Thread-Topic: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-enable pinconf
Thread-Index: AQHdOtE+gVzmYmXL+Ea9R+ytXkurZ7a7P8yAgAFWXACAAZ/tgIAAEUMA
Date: Fri, 4 Sep 2026 11:14:02 +0000
Message-ID: <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com>
 <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
 <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|DBBPR04MB7676:EE_|MAD0EPF000008B3:EE_|DU0PR04MB9372:EE_
X-MS-Office365-Filtering-Correlation-Id: 587940dd-76c7-485d-2279-08df0a75a738
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|3023799007|38070700021|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 dfMuctO/H+PHmv756vX47cyjQSqfxWT9PGB+vTWXErTqR0a1GI+g29FSnp8u8y2+OpgFu4sQBt7VmlDXDkJQYhXxgBMMQ++UXKRbfDjO+FtK49gnV0cSywLj+i40xQNktPL7v2/oGO5javgTCFkfigRrY6htWNJEru9XY0N0XB2ugYH028fhdGYcp4+2Ps64EZr/fLbAcMAjnP2F7E+kak5usx81y7dh02T7/sHJHLBNN0NwvJb4ObP7nt9bGbDv5yD5VjK7HO/3t3fnKin9RemvCRAUgshV/0AMjV0RjLzMDOERfW3zIJhGgNM+QcxsNkwD+BluyHsqyNsUwSJXiqthwo2QDj5B8f2PiZDaCzgac3aIGnCHusZH4oQzDtOStNoiDZzDsRDCiHrEfBfL3+3HEDf38qOZVnno2EsdEOKIqS2UPr5s7qPw4+jlKsYoJXkdnlYXNt5XMqVfuoKnk9YkiEF/Y2/A/ndS7XNSrDyWYjUgsY9yd/goUmUVLTZaIlq6k9rf/qxclOhnLcXIsmNIY3gxBVJx1jN43unN4hDQfNV4pi1aU9+NfV/Cj91gqYIFjz2tq05Y4B79bzyzgXfYJvP4O4ToOCLodx3coTZtFfLu2yxnpjUXjIK0cFN2BfwT65jVvhQHDQa4XQNpIlSbbq5p4fepW4ssC0kA0vF5ZLtpir9ZDN/C+3ztd1GvuG8bhlkGUxUyCSBx/FtMSv/ak04d7JwzNa5+XHXJNXo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(3023799007)(38070700021)(10067099003)(4143699003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3417D39F389D9418B0BE27EA3073F13@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 goPXzUvimfM99+i9WimQJ8QYqAoJUuyp4BIqHzD9RJ9o4Uc+BBDINvVXujiGe0zZA2xdCEj14a4fqKeX4wr0iDX+ipY2DY2HsbUolS4OzeqJS5jdZ5JpTjCR4IKyw4UMJPBGoNS+EOY3uz2Oa6ksUOMb2/d7VWnNo+FKHND6TYrHHHwlqF9VqNIYpmLSBlE7JPzkpTbL0sT2GQ/GO/LTw63tGx95TIhs2gVFTARWXD+i4lASuYjU/A0d1haowLNJAp3AFE5wjWCHNY015PaeEkpX8uJCoGYSBHw1b21ntO+KXy3zrulxNrNXbwh0hZv1O3xQdcx3AAPJtDoptphTgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 52e3bba7f17d4061bb253cf6b6477c08:solidrun,office365_emails,sent,inline:c8e7ae9b5f88038d8ddafba974ceae05
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai3BYn4lELlwV5EueLvE9DhSB+5DvUa3kupNoN5WHRYvr0JwuKhalLS7JqkvTU2KzxmXze71FW/zLK1iMtDB5/voGDQJW75nVljjPHv/VHha4XP6FKMD/F4B16icpiMRbH32jzEw7hu9L/P2nSIYU3bc+hlGVn0xU0+vZnewlra/9JX65kpzi+Ja9rejRaB7jFLNovMmZDREQc8ngiphgwxUSRHTY47yyjVG12dmgb47i/iMRFivc6Spj6aw32Y1NaAGV9U6BtHbwsEnpXcrW5S4DoDbZI8XnpecZuQi4nlhtgvbnu3cUTueitWs5jDtnejQBvvN+0tzgkk7ThcR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68CT7KXO17fcETv0YM9NUJKKQxTcfMfpG+TsLsbai7w=;
 b=dZxtojeqAhWbbHNkZvs5L2dqS0X+xoU6ah2Q1MS6M31tXKKxLDOI2UoOzYRwALbrh5nfY5mD4l9DK0ba+QYCBrd2nypOxX75AjYowsq5Xhzlf81m84zDyQ9OGyBdBdJIVRE/dakG5yCLVULi6+XTRgs7EDFSMoAdX7ZEUoraJh+uuVJzcxINfZ4YPTmg8Bi1G81eEoJOWeGTyyEjzcNtHXmS4NUkN2TqJy/NqOQ7jkUk0VsglpiybcPwsVI1NB21I3Zmfu/D2xwYLYbcOG7CzBI/rHqZVFw2vpyXGhcOv5et9oPKodGKQrMV0n6U8X2OrzkGv5DfrtC/Rq7mR389Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008B3.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a202ed43-5dd8-4aab-7815-08df0a75a065
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|7416014|82310400026|36860700016|23010399003|1800799024|14060799003|22082099003|56012099006|3023799007|18002099003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	3glO2AojRoyZ8DPS8fLUmMjXm2uxUo9BdMC/dkGP3qKCQ0IkCsTxyk4v/ZlFQJ2/gILKu9ne2Pw6CcanWsVdwt2kC6oc98vjbOFpCqbh2SyDuDDFByctsgjbNVf3S0ZDSp+HIjuHDfpr15/P52Q/dom2JXapOMx8erV3xD9ecDynPy6OxU0pGxIquulIE8/lPdVZjlEedBzYA8ij3jCJqW0nkRIYQu8nVpH5BdwbwHE8XEDenlEg+M1c15oJUJCvHrUOih6gzE9N70KT4cpKIBJURNcaU6JL5xu2Lj0NCXp/T+ap3haRy+yERkXrnpFRYzKFhUyRtQcstA0BOg2nxrSWPyl0KTNgsf94PgYWw0l3Iyhonw+kRgvoFz9JG6b+IVXagWAp/NezQOl9p/rfkeU7cxgSoAIdKoEBwGadRGuwd07dwbs1yE5/xnUkDZqpC29U+7f5FWJcVGztPYvuPC+WFTLyYeaxYoP25K3QAOTxvaee2BKpiZk8lvlXiQaO8xjMGRTF8JUT6heepIucxBxRtIJzLkTdV1O3W2c84ARrjJvp3rcmRCovUYS4XooQuO32CgTxvFhoH3Ov+6+gRpvV+o1fSCy+h4Pp3xp0g4MitqTSPrD3PHdlr1KsEaMuFL/vH3Ol8k0xWinE//s65hNMtO2IW1Si+NYi21sXVUA=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(14060799003)(22082099003)(56012099006)(3023799007)(18002099003)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6qHvUdloY9heDjLutKZCpUUeTHzdMDTL3P2vA0rCs/jLYJ/hcWM1Gukc6LjO4Xw5BPb42Zv3vDxcLmzVGlYWIPFlweiF1TQX4QNWqAr1MyEXCI2KWize03SoYVgLIJm5b/j8sUOTsJ+NQ6CmjOQfbLGIYwxXOdSofRGkCZw0ekw6lAWNhhcLLmSbW8djKzjcVygMKTYGAlmee1CDx7wpEgNKn/UMA7obW+uK4V85xYRUQVcAcfhx/3q+FxqJCW14FJIsxrxaoLQOqgqaGMkdc8E8R20n3M/0xXUphi6WABk4YHG9zTHh9SoD8zxWoYlPUGepF08u1ZS8h77BVqefjw0Wa4bLSBk5chuAJa/dQTFPjDrLv3ezFgUDE1hPshofnA0idV0eBUuzm5/he/LVijCxH92pwt1s1bTpTgdZcVZT2SAEAo25orM+PrJjBPDF
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:14:14.1462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 587940dd-76c7-485d-2279-08df0a75a738
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9372

SGkgR2VlcnQsDQoNCkFtIDA0LjA5LjI2IHVtIDEyOjEyIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9l
dmVuOg0KPiBIaSBKb3NodWEsDQo+DQo+IE9uIFRodSwgMyBTZXB0IDIwMjYgYXQgMTE6MjMsIEpv
c3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPiB3cm90ZToNCj4+IEFtIDAyLjA5LjI2IHVt
IDE0OjU4IHNjaHJpZWIgTGludXMgV2FsbGVpajoNCj4+PiBPbiBXZWQsIFNlcCAyLCAyMDI2IGF0
IDE6NTDigK9QTSBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4gd3JvdGU6DQo+Pj4+
IFRoZSBsaXN0IG9mIGFsbG93ZWQgcGluY29uZiBwcm9wZXJ0aWVzIGFscmVhZHkgaW5jbHVkZXMg
aW5wdXQtZW5hYmxlLA0KPj4+PiBidXQgaGFzIG9taXR0ZWQgaW5wdXQtZGlzYWJsZS4NCj4+Pj4N
Cj4+Pj4gQm90aCByZWZlciB0byB0aGUgc2FtZSBoYXJkd2FyZSBwcm9wZXJ0eSwgc2V0dGluZyBh
bmQgY2xlYXJpbmcgaW5wdXQtZW5hYmxlLg0KPj4+Pg0KPj4+PiBBZGQgaW5wdXQtZGlzYWJsZSB0
byB0aGUgbGlzdC4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3Vh
QHNvbGlkLXJ1bi5jb20+DQo+Pj4gKC4uLikNCj4+Pj4gKyAgICAgICAgaW5wdXQtZGlzYWJsZTog
dHJ1ZQ0KPj4+IFRoZSBTdWJqZWN0IG9mIHRoaXMgcGF0Y2ggaXMgICJBbGxvdyBpbnB1dC1lbmFi
bGUgcGluY29uZiIuDQo+Pj4NCj4+PiBCdXQgd2hhdCB5b3UgYXJlIGRvaW5nIGlzIGFsbG93aW5n
IGlucHV0LWRpc2FibGUuDQo+Pj4NCj4+PiBXaXRoIHRoZSBzdWJqZWN0IGZpeGVkOg0KPj4+IFJl
dmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4NCj4+IFRoYW5rcyEN
Cj4+IEknbGwgZml4IHRoZSBzdWJqZWN0IC4uLiAhDQo+Pg0KPj4gKCJkdC1iaW5kaW5nczogcGlu
Y3RybDogcmVuZXNhcyxyemcybC1waW5jdHJsOiBBbGxvdyBpbnB1dC1kaXNhYmxlIHBpbmNvbmYi
KQ0KPiBObyBuZWVkIHRvIHJlc2VuZCwgSSB3aWxsIGZpeCB0aGlzIHdoaWxlIGFwcGx5aW5nDQo+
IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
Pg0KPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1waW5jdHJsIGZvciB2Ny40Lg0KPg0KPiBJ
IHdpbGwgYWxzbyBhZGQgIm91dHB1dC1kaXNhYmxlIiwgd2hpY2ggaXMgbWlzc2luZywgdG9vLg0K
DQpUaGFua3MhDQoNCkhvd2V2ZXIgSSBhbSByZWFkeSB0byBzZW5kIHY4LiBJZiBJIGRyb3AgaXQg
bXkgc2VyaWVzIHdpbGwgZmFpbCBkdGJzX2NoZWNrLg0KSXMgaXQgb2theSBpZiBJIGRvIHJlc2Vu
ZCBpdCwgYW5kL29yIHNob3VsZCBJIHdhaXQgYW5kIGNoZXJyeS1waWNrIHlvdXIgDQp2ZXJzaW9u
DQpzbyB0aGF0IGl0IGlzIGVhc2lseSBkcm9wcGVkIHdoaWxlIGFwcGx5aW5nIHdpdGhvdXQgY29u
ZmxpY3Q/DQoNCk9yIGRyb3AgaXQgYW5kIGxpdmUgd2l0aCBmYWlsaW5nIGR0YnNfY2hlY2s/DQoN
Cg==
