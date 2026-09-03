Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023096.outbound.protection.outlook.com [52.101.72.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20D38A725;
	Thu,  3 Sep 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.96
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430032; cv=fail; b=gYeGDsb2VcFBKo7BvIXANanc8nN9K6IJAHfsEZh/8vJUW2jz6+DzHEw9l4KtjkD39/bgxH5nmo3t290hFuxR40vdRgRz7565bRbDnwLkEc/bMCr949EFGIXlaBjgB5KaETesgm0yAQy2UBr55ywOUf6/CtAjxFrC/pLMDIbeo5E=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430032; c=relaxed/simple;
	bh=K7Phv1Ezyw7pk/g7v/f1FMhLUePQw8dDdvAuH/uRzVo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WHsdC2Lz355IewqmlrPk3cnAXymv4H3sdJ372VdzLpGIq4NJ25MolAjxNb3pZC8jyXUJAYf+Ghvhu1cy6lu0ISOjm7PmfAzo5HVEkVxnPiLcCItlXhc6OLUF2XKc2g7XAvFfIM5ANwieq6BFixESGLBxYFAOZjXNR64bVVcTEZU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=rGL9BBwK; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=rGL9BBwK; arc=fail smtp.client-ip=52.101.72.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="rGL9BBwK";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="rGL9BBwK"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XHhcfKfmQXnS2K98jDQGsuKFkUMojYko4q9QMtB/gXabkF7pyKivGHaOaiU/YvBxjvDTkXtD78W6fTMQ+lRNJFZCX6Qv5j+oVfH4ipnLsNt7CrNnL4TlnU14cfzQ3UPESIvjlXJYTxug9JEi77BVFtR+ZzuY22lQ+YNSXHPRfCFBlP25C+bEVjO4iRzTgCy0k7A0s6k6fSe4bQmwiWV/HAd9qbYvHBxi3E4nOa9R9Mon7R28SpmMP56YtZEsB81or/93PVGqv5YC59UhXFqz20hu8i1NTeyYdyDS6kDNbqjRdgIe1HcYaHAAQvWNIvfrGBJ86pBjwfruA+2PxGYGVA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7Phv1Ezyw7pk/g7v/f1FMhLUePQw8dDdvAuH/uRzVo=;
 b=RDhNjIfw9DPQcXqHmGvbOPLta1rhMadqinO06Y9R4s97c/9aoeDUAqoYuvAFGCg6a62SSUGhg5gStX1YKUT4CM+CoIbPsXuDCPczJk9RwpQ3aA/lNsYl+Ck78PonKnnNT5juO9vw7b2iDfSO27l9PRGimyh14WUtdv5bODLU3jeCXztzdTTnDE8C55FXDMke6bvprw8F+JnpKJ7Rc+7A5pBF9w3ifU6YECKv38KGb+TPRqWMYDoSBeBn9zHxTxIqnoiWk76kMWt4xhWwwtq58l5CEl1ZiXEhuJflIEYar0eL5o4NuUjic18JWhl/nwBwpdM7YcEEIHPSqdjp/n2DIg==
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
 bh=K7Phv1Ezyw7pk/g7v/f1FMhLUePQw8dDdvAuH/uRzVo=;
 b=rGL9BBwKq2ls/NzJ5Hsnub1uD2fTX3W027si/MZjeKSr2DFr8jY49UdWc3aLkXPj1W6hl9cPOKKMuQfxh2K6zUWr0IQr6eSmcNP2ACLiMYU4o0TuruPRSRzkR5o4051+an5+C+nGE3dpnP9BiXZbb3zsxthqgMb0YoPhPnpOzSS45SAw5KkCo1Skqrp0Dp0/5utawvq3BLLiWhtIPkkkH9yGT3ybbD5a44IQBr0N1gbBs/+ht0Fp6Z0IYWhGEOTTVwSDD0ByWmhND5UeB9ecRP/MmIr34qS1vdm2//q62gtR1WPwDXU2e7TpIUZ+Yp1jwfFZ+6+xxNCBDTRW4E6Z7g==
Received: from AS9P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::18)
 by AM9PR04MB8681.eurprd04.prod.outlook.com (2603:10a6:20b:43c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:07:07 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:50f:cafe::7d) by AS9P251CA0014.outlook.office365.com
 (2603:10a6:20b:50f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 10:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 10:07:07 +0000
Received: from emails-2220808-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-87.eu-west-1.compute.internal [10.20.6.87])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id CE5ED81761;
	Thu,  3 Sep 2026 10:07:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788430026;
 b=YGRAnVRy2VCd6dL5FOAfTCG4SKJ6DLvyO/tV8TcSmDUhpd7XnTrSsPCG8upebZyn72sO7
 iXksA4x307Ecxf0b9D4MJCreXGaMpykXZM/IwjW3HQoiMJLofitOSYJ+LbxIxSz9hLzdz1+
 LznSXPHqRRGNorJFjupQ0wFscU/UniA=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788430026; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=K7Phv1Ezyw7pk/g7v/f1FMhLUePQw8dDdvAuH/uRzVo=;
 b=XPXGO6g7uDr6oM89JUC/LnFIA3I/LLSjwxAugp3gioQXusrUzcIdKZnmTIUum83C7Izq5
 F6+0twZKSixok92c/roSYOx6Kn1v4U5D6tG/+KVVenSS8oykOHPZOkiuswHX05N1h5uCu80
 RKimlPPgFWk8NVUfUxvIhztPlfhRB2I=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7Phv1Ezyw7pk/g7v/f1FMhLUePQw8dDdvAuH/uRzVo=;
 b=rGL9BBwKq2ls/NzJ5Hsnub1uD2fTX3W027si/MZjeKSr2DFr8jY49UdWc3aLkXPj1W6hl9cPOKKMuQfxh2K6zUWr0IQr6eSmcNP2ACLiMYU4o0TuruPRSRzkR5o4051+an5+C+nGE3dpnP9BiXZbb3zsxthqgMb0YoPhPnpOzSS45SAw5KkCo1Skqrp0Dp0/5utawvq3BLLiWhtIPkkkH9yGT3ybbD5a44IQBr0N1gbBs/+ht0Fp6Z0IYWhGEOTTVwSDD0ByWmhND5UeB9ecRP/MmIr34qS1vdm2//q62gtR1WPwDXU2e7TpIUZ+Yp1jwfFZ+6+xxNCBDTRW4E6Z7g==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GVXPR04MB9851.eurprd04.prod.outlook.com (2603:10a6:150:118::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Thu, 3 Sep
 2026 10:06:55 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 10:06:54 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>,
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
Thread-Topic: [PATCH v4 7/7] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
Thread-Index: AQHdOtE/GB4y7q1zyEOruLngHiMyNra8odKA
Date: Thu, 3 Sep 2026 10:06:54 +0000
Message-ID: <01ac5b83-03b4-4512-aa5e-9b19f1ebe4f0@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-7-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-7-4a456a422fee@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|GVXPR04MB9851:EE_|AMS1EPF00000049:EE_|AM9PR04MB8681:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bf66a4-1090-452e-07d7-08df09a31c78
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|10070799003|376014|10067099003|56012099006|22082099003|6133799003|4143699003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 SOVClRANSoIemyn18/knXw86qrIAo0+xVBXISayo8zQR7ExDBFWtd21C+EVlt1ZfB2xn41zjVzdBJExpwqM5b4zQVFDi/UiYiH6hkwCFvtva3oCLQxa35w2VCzTNlMiUf4gZTAPCwMSmKm6QFoiBOhSoIf0+Ht46J3+4VCPlrRVb/Zezm2eE3qq8gKyI7L5iq5zlWO0GR1kshcH6lEOkAxC5RETwf4mMeQHt2LFCZczI4B5kk1XyA4vPk+625NjiTFMrMwW8sRP0GDRx/he7Kp1vNLK662YSnCYGYwFCD1FcN3++2g5LsoOpxHemMyf7LamxKd3YRUsCau9ZSS3cbb/W6lHYpsOOfZpgSCM1ZzGMdMXiS29IGz3WlctXgIYkTqbaww4iEtdssP4pYuJaJ3RFoXPHjqxC4iNVbFHp3dvCrFeJuuGr5uVQv8ZOcv2gY1OTTP+KvuH6sSdm1S/eK0656CkMJdLu9S/7uH9+N0VWhdm8B7Xhc9DEwrcFOeO0Tm5LPHZda+mFwn+I0Cqmz8o8GuFbFxussu/4QynFI4M83AVNy/Agm5ok23FPybgJkjup5bbuWtCBxM1qqoDfipwYNlIE+uoZtWfT1eYh9pmHEwtQm9RHEPWEQgQmYtEAxwH9qVh1TRqKOAvW/N9zcAq+kYL9zW7Vei+5qHPdo3Rp8h8mS0wzn2C38G+NDm/Bnb3HauAZfvPDsEF5DqfT/pjchtAxb72iO9xr1ZKYFP8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(10070799003)(376014)(10067099003)(56012099006)(22082099003)(6133799003)(4143699003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <426A8B9F1A66FA45974B875318E44FD8@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 wCA0xutdNMFCOo1BiUbwD7l1z5frpidWEw382Wm6MOnIeBw4PDY/IQrMSK/BUJILCTSTCWLrYkqXM2pQDN7gOgSwU2A3EMbG0hEwmuY5QjDJQUi6USnI9nacRArMN0ATi7+ScAb/F5POQX7q7RR5IPQEglEI1E4+RuiIWyxR3PzxEb61dqTs4I16c9nUBQab42bl3M3ivv0Caaz4B2xMUC0wD+ZqZkg0OWWWFeFkWtjHZFUwXxIoSfwU2r8oTBHlY/t16ddF2QR8F63AIsN1qKWH9zjEaCZh67e6SGc4HIsN1tpVe8DLimoB4W/g1Uit4FDyclspy37qgKZnQrw24A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9851
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: bd5964cd90cc4f4eacbefa87582d64c4:solidrun,office365_emails,sent,inline:1b136161185056ca29bd952597636d63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xU9GwUekTJoBEOt0o2y9xzi3zF0I+XEGmwJ7O0lwXMJDFjjzbPWB6we75J8C6UlHzcGXqXG9UVPx2NfkmZKG3RVjb74RZAaP7StTsqz57eHcdjBe+tsz+57W1xMVo5BDNpWYz0WV504Jfd0MEtHAj1JLYuQ0P3z0qEpGkcQVAHQ2aZsK2TjCCvvxCVnUeT5n4ZA3wpwq1S+VyfgKXIUD7c8EbO58k3DuiJ5ubYqKZ2yLJ20YjQW9mLy0fgFVvwg7P8S+MaOZMMEr9sL6WAXSgKQl/vdwAn9wasYmTDBWEngfZEOin1EyBXeElTERH188mH9Rd1Ul3phjlKeNqDik8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7Phv1Ezyw7pk/g7v/f1FMhLUePQw8dDdvAuH/uRzVo=;
 b=Igc7TWSBUeP1vrCnpleJRvfN2Adv2QVcZ90dmvNH0YdvOZkFzkPH++YMAxN72BgcXhWlot0kEyAqE+20YBBL9poPEmDirFSLZPw/yW0zTArE4k6qJ1zghSB/bbtjsrhCFO5ET1ZB+fEJjjWG9hLmWuiFt+3mK+aQXbUlXI6UDOyVgHxdNtL67OajapUyxR2g6NIXPsuu4hT1KiWEociYEfGfmFq2osM3/IiItdPmlr02x3BfTGAumoHvOgX2QKLZuTplQn2/0y32Ye5sVGFRCYew8hiRl8N2vhRRRRpcW2wsMPh2xtY0yyRBswv/zE9nhpsB5RRmZIQfbpZoZMsFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2012ab5-e11c-4e4b-afd6-08df09a314b4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|35042699022|1800799024|14060799003|6133799003|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	woaDud6lWnQBKK39XwBg5ynkTtPtTXiOSyPvlLRQ5vtfKidLjXyy08FST0GdoPsxLkKrY4XDRmOWn5WsqCPuH63LpR+xsjnFi5SKuE2qAHGxFiLpBEcGfb3KXGGEMMWr8xhVc8lMQcVemG1twSeag0lSB/2LF46E1irFOt9G3wJJ9RkoOn+yMG2bCycpAACDdLbRqr3RhyODGw5wJYlZN9frnn2djUuL3DjuEmEV5s2Q7aDj/2JiEnBC4JGUrEkMucL0UqDIeen3mlnt8tf2acH2qheM6vDrZTqCTzDY/OT5An4grN2/b3ifDj3aVPAbvjBfZsuNAHzjq65R+mFEbpsfCz7ivIAJtE/2mPHsyVfG61hz1wMoYCMpd02d+TSf0udP59wDRvC0ZgXXAV0I2M/GEakCOPdxlzGvAgDLarizrDZruAJM1lie0oxdFzA0VJUrG4N4yjSDmRtJnfOweWtimg0NcTheMInj/9uuGFfzFVppCziiC7iZEb3yHDhafHrJyBeRAuqt0reZPQbCdNvVoBEUbBEMLZPHdHbWU/kBdmqqICmsMmbh1jBjwbf5j4czlyY1LLqlH6LEaQk9YZpush0Q6hD2d9cutfKFFieoylyELP5ZoCqCQqzXm9jpkR02JyWp1ps0srTwmjC162ttDLxF69WynvyW1F65/sIGC6IlYsiLeYtEoxva6tFKSWVPTqAP+jXvtbX+vt0MfQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(35042699022)(1800799024)(14060799003)(6133799003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5pd2fWDhi8wHawhkzoDj+Ux6TEyiPpawFHOw1hK+cMRF9OAv1nhi57flgYt3BmkoYxCHQuK46vkW06+jCFHtbHM5q1CEC+sOvhao47Kyw+TO5kNS3akKOKaE8tPUCQoVRN/fyaajrIRX3EurA+NxbCUgzghFVE1UUCM0Oj3Wu+CsKW3IP67cJP7n0n55nMVPilAzS60zXmGxoPSGK6xQvHrovMcXRotyxbzJ0tYFYq6RyoDSrWE6P3zRvzmAjswjYsQnm0qUXuqRVuBKVhCMiPFTK3O6f2JN8zMKDJzhUt43Nus4LcE9WdMaqjrPSdjv3aqQBL7R+lHCRvxWxUcGxrhXuF3nFbF9/KuwI8sz0QpK1tkJA0osMbYeyhRPwNztY0Bu2nPlu76txE1chW0yAbZy4Ig/f5MkdsRNINRcmpzYpHl8dKXtaMGbgv4Wc84J
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:07:07.0848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bf66a4-1090-452e-07d7-08df09a31c78
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8681

QW0gMDIuMDkuMjYgdW0gMTM6NTAgc2NocmllYiBKb3N1YSBNYXllcjoNCj4gVGhlIFNvbGlkUnVu
IEh1bW1pbmdib2FyZCBJSW9UIGZlYXR1cmVzIGEgRFNJIGNvbm5lY3RvciBzdXBwb3J0aW5nDQo+
IHRvdWNoLXNjcmVlbiBkaXNwbGF5cyBhbmQgaXMgdXNhYmxlIHdpdGggUlovRzJMLCBSWi9HMkxD
IGFuZCBSWi9WMkwNCj4gU29Ncy4NCj4NCj4gUHJvdmlkZSBhZGRvbiBmb3IgdGhlIFdpbnN0YXIg
V0o3ME4zVFlKSE1ORzAgMTAyNHg2MDAgZHNpIHBhbmVsLg0KPg0KPiBBZGQgdGhlIGFkZG9uIGlu
IE1ha2VmaWxlIGZvciBhbGwgc3VwcG9ydGVkIFNvTXMgU29DIHRhcmdldHMuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPiAtLS0NCj4gICBh
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICA4ICsr
Kw0KPiAgIC4uLmh1bW1pbmdib2FyZC1paW90LXBhbmVsLWRzaS1XSjcwTjNUWUpITU5HMC5kdHNv
IHwgNzQgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgODIgaW5z
ZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlDQo+IGluZGV4
IDY5YjFmNzUxNTYwMTYuLjBiYzJiYmZmOTM3MGYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvTWFrZWZpbGUNCj4gQEAgLTE3MCw2ICsxNzAsOCBAQCByOWEwN2cwNDRjMi1odW1taW5n
Ym9hcmQtaWlvdC1lbW1jLWR0YnMgOj0gcjlhMDdnMDQ0YzItaHVtbWluZ2JvYXJkLWlpb3QuZHRi
IHJ6Zw0KPiAgIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0NCkgKz0gcjlhMDdnMDQ0YzItaHVt
bWluZ2JvYXJkLWlpb3QtZW1tYy5kdGINCj4gICByOWEwN2cwNDRjMi1odW1taW5nYm9hcmQtaWlv
dC1taWNyb3NkLWR0YnMgOj0gcjlhMDdnMDQ0YzItaHVtbWluZ2JvYXJkLWlpb3QuZHRiIHJ6ZzJs
LWh1bW1pbmdib2FyZC1paW90LW1pY3Jvc2QuZHRibw0KPiAgIGR0Yi0kKENPTkZJR19BUkNIX1I5
QTA3RzA0NCkgKz0gcjlhMDdnMDQ0YzItaHVtbWluZ2JvYXJkLWlpb3QtbWljcm9zZC5kdGINCj4g
K3I5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LXBhbmVsLWRzaS1XSjcwTjNUWUpITU5HMC1k
dGJzIDo9IHI5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LmR0YiByemcybC1odW1taW5nYm9h
cmQtaWlvdC1wYW5lbC1kc2ktV0o3ME4zVFlKSE1ORzAuZHRibw0KPiArZHRiLSQoQ09ORklHX0FS
Q0hfUjlBMDdHMDQ0KSArPSByOWEwN2cwNDRjMi1odW1taW5nYm9hcmQtaWlvdC1wYW5lbC1kc2kt
V0o3ME4zVFlKSE1ORzAuZHRiDQo+ICAgcjlhMDdnMDQ0YzItaHVtbWluZ2JvYXJkLWlpb3QtcnM0
ODUtYS1kdGJzIDo9IHI5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LmR0YiByemcybC1odW1t
aW5nYm9hcmQtaWlvdC1yczQ4NS1hLmR0Ym8NCj4gICBkdGItJChDT05GSUdfQVJDSF9SOUEwN0cw
NDQpICs9IHI5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LXJzNDg1LWEuZHRiDQo+ICAgcjlh
MDdnMDQ0YzItaHVtbWluZ2JvYXJkLWlpb3QtcnM0ODUtYi1kdGJzIDo9IHI5YTA3ZzA0NGMyLWh1
bW1pbmdib2FyZC1paW90LmR0YiByemcybC1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1iLmR0Ym8N
Cj4gQEAgLTE4Niw2ICsxODgsOSBAQCBkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNDQpICs9IHI5
YTA3ZzA0NGwyLWh1bW1pbmdib2FyZC1paW90LWVtbWMuZHRiDQo+ICAgZHRiLSQoQ09ORklHX0FS
Q0hfUjlBMDdHMDQ0KSArPSByemcybC1odW1taW5nYm9hcmQtaWlvdC1taWNyb3NkLmR0Ym8NCj4g
ICByOWEwN2cwNDRsMi1odW1taW5nYm9hcmQtaWlvdC1taWNyb3NkLWR0YnMgOj0gcjlhMDdnMDQ0
bDItaHVtbWluZ2JvYXJkLWlpb3QuZHRiIHJ6ZzJsLWh1bW1pbmdib2FyZC1paW90LW1pY3Jvc2Qu
ZHRibw0KPiAgIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0NCkgKz0gcjlhMDdnMDQ0bDItaHVt
bWluZ2JvYXJkLWlpb3QtbWljcm9zZC5kdGINCj4gK2R0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0
NCkgKz0gcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtcGFuZWwtZHNpLVdKNzBOM1RZSkhNTkcwLmR0
Ym8NCj4gK3I5YTA3ZzA0NGwyLWh1bW1pbmdib2FyZC1paW90LXBhbmVsLWRzaS1XSjcwTjNUWUpI
TU5HMC1kdGJzIDo9IHI5YTA3ZzA0NGwyLWh1bW1pbmdib2FyZC1paW90LmR0YiByemcybC1odW1t
aW5nYm9hcmQtaWlvdC1wYW5lbC1kc2ktV0o3ME4zVFlKSE1ORzAuZHRibw0KPiArZHRiLSQoQ09O
RklHX0FSQ0hfUjlBMDdHMDQ0KSArPSByOWEwN2cwNDRsMi1odW1taW5nYm9hcmQtaWlvdC1wYW5l
bC1kc2ktV0o3ME4zVFlKSE1ORzAuZHRiDQo+ICAgZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDQ0
KSArPSByemcybC1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1hLmR0Ym8NCj4gICByOWEwN2cwNDRs
Mi1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1hLWR0YnMgOj0gcjlhMDdnMDQ0bDItaHVtbWluZ2Jv
YXJkLWlpb3QuZHRiIHJ6ZzJsLWh1bW1pbmdib2FyZC1paW90LXJzNDg1LWEuZHRibw0KPiAgIGR0
Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0NCkgKz0gcjlhMDdnMDQ0bDItaHVtbWluZ2JvYXJkLWlp
b3QtcnM0ODUtYS5kdGINCj4gQEAgLTIwNSw2ICsyMTAsOSBAQCBkdGItJChDT05GSUdfQVJDSF9S
OUEwN0cwNTQpICs9IHI5YTA3ZzA1NGwyLWh1bW1pbmdib2FyZC1paW90LWVtbWMuZHRiDQo+ICAg
ZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDU0KSArPSByemcybC1odW1taW5nYm9hcmQtaWlvdC1t
aWNyb3NkLmR0Ym8NCj4gICByOWEwN2cwNTRsMi1odW1taW5nYm9hcmQtaWlvdC1taWNyb3NkLWR0
YnMgOj0gcjlhMDdnMDU0bDItaHVtbWluZ2JvYXJkLWlpb3QuZHRiIHJ6ZzJsLWh1bW1pbmdib2Fy
ZC1paW90LW1pY3Jvc2QuZHRibw0KPiAgIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA1NCkgKz0g
cjlhMDdnMDU0bDItaHVtbWluZ2JvYXJkLWlpb3QtbWljcm9zZC5kdGINCj4gK2R0Yi0kKENPTkZJ
R19BUkNIX1I5QTA3RzA1NCkgKz0gcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtcGFuZWwtZHNpLVdK
NzBOM1RZSkhNTkcwLmR0Ym8NCj4gK3I5YTA3ZzA1NGwyLWh1bW1pbmdib2FyZC1paW90LXBhbmVs
LWRzaS1XSjcwTjNUWUpITU5HMC1kdGJzIDo9IHI5YTA3ZzA1NGwyLWh1bW1pbmdib2FyZC1paW90
LmR0YiByemcybC1odW1taW5nYm9hcmQtaWlvdC1wYW5lbC1kc2ktV0o3ME4zVFlKSE1ORzAuZHRi
bw0KPiArZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDU0KSArPSByOWEwN2cwNTRsMi1odW1taW5n
Ym9hcmQtaWlvdC1wYW5lbC1kc2ktV0o3ME4zVFlKSE1ORzAuZHRiDQo+ICAgZHRiLSQoQ09ORklH
X0FSQ0hfUjlBMDdHMDU0KSArPSByemcybC1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1hLmR0Ym8N
Cj4gICByOWEwN2cwNTRsMi1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1hLWR0YnMgOj0gcjlhMDdn
MDU0bDItaHVtbWluZ2JvYXJkLWlpb3QuZHRiIHJ6ZzJsLWh1bW1pbmdib2FyZC1paW90LXJzNDg1
LWEuZHRibw0KPiAgIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA1NCkgKz0gcjlhMDdnMDU0bDIt
aHVtbWluZ2JvYXJkLWlpb3QtcnM0ODUtYS5kdGINCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yemcybC1odW1taW5nYm9hcmQtaWlvdC1wYW5lbC1kc2ktV0o3ME4z
VFlKSE1ORzAuZHRzbyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1odW1taW5n
Ym9hcmQtaWlvdC1wYW5lbC1kc2ktV0o3ME4zVFlKSE1ORzAuZHRzbw0KPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5lNDNhMzhkNTMzMGU2DQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLWh1bW1pbmdi
b2FyZC1paW90LXBhbmVsLWRzaS1XSjcwTjNUWUpITU5HMC5kdHNvDQo+IEBAIC0wLDAgKzEsNzQg
QEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgMjAyNSBKb3N1YSBNYXllciA8am9zdWFA
c29saWQtcnVuLmNvbT4NCj4gKyAqDQo+ICsgKiBPdmVybGF5IGZvciBlbmFibGluZyBIdW1taW5n
Qm9hcmQgSUlvVCBNSVBJLURTSSBjb25uZWN0b3INCj4gKyAqIHdpdGggV2luc3RhciBXSjcwTjNU
WUpITU5HMCBwYW5lbC4NCj4gKyAqLw0KPiArDQo+ICsvZHRzLXYxLzsNCj4gKy9wbHVnaW4vOw0K
PiArDQo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+ICsjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+ICsNCj4gKyZ7L30gew0K
PiArCWRzaV9iYWNrbGlnaHQ6IGRzaS1iYWNrbGlnaHQgew0KPiArCQljb21wYXRpYmxlID0gImdw
aW8tYmFja2xpZ2h0IjsNCj4gKwkJZ3Bpb3MgPSA8JnRjYTY0MDhfdTQ4IDMgR1BJT19BQ1RJVkVf
TE9XPjsNCj4gKwl9Ow0KPiArfTsNCj4gKw0KPiArJmkyY19kc2kgew0KPiArCSNhZGRyZXNzLWNl
bGxzID0gPDE+Ow0KPiArCSNzaXplLWNlbGxzID0gPDA+Ow0KPiArDQo+ICsJdG91Y2hzY3JlZW5A
NDEgew0KPiArCQljb21wYXRpYmxlID0gImlsaXRlayxpbGkyMTMwIjsNCj4gKwkJcmVnID0gPDB4
NDE+Ow0KPiArCQkvKg0KPiArCQkgKiBUb3VjaHNjcmVlbiBmaXJlcyBzaG9ydCBhY3RpdmUtbG93
IHB1bHNlcyB3aGljaCBsZXZlbCB0cmlnZ2VyDQo+ICsJCSAqIG9uIGkyYyBncGlvIGV4cGFuZGVy
IGNhbiBtaXNzLiBUcmlnZ2VyIG9uIGZhbGxpbmcgZWRnZSBpbnN0ZWFkLg0KPiArCQkgKi8NCj4g
KwkJaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmdGNhNjQxNl91MjEgMTMgSVJRX1RZUEVfRURHRV9G
QUxMSU5HPjsNCj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JnRjYTY0MDhfdTQ4IDYgR1BJT19BQ1RJVkVf
TE9XPjsNCj4gKwl9Ow0KPiArfTsNCj4gKw0KPiArJmRzaSB7DQo+ICsJI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+ICsJI3NpemUtY2VsbHMgPSA8MD47DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiAr
DQo+ICsJcGFuZWxAMCB7DQo+ICsJCS8qIFRoaXMgaXMgYSBXaW5zdGFyIHBhbmVsLCBidXQgdGhl
IHJvbmJvIHBhbmVsIHVzZXMgc2FtZSBjb250cm9scy4gKi8NCj4gKwkJY29tcGF0aWJsZSA9ICJy
b25ibyxyYjA3MGQzMCI7DQpTYXNoaWtvIGZsYWdnZWQgdGhlIGNvbXBhdGlibGUgc3RyaW5nLCBz
dWdnZXN0aW5nIGEgd2luc3Rhci1zcGVjaWZpYyBvbmUuDQoNCkkgZGlzYWdyZWUgaXQgZG9lcyBu
b3Qgc2VlbSB3b3J0aCBpdCwgYXMgdGhlIHBhbmVscyBhcmUgdmVyeSBzaW1pbGFyIGluDQpzcGVj
cyBhbmQgYmVoYXZpb3VyLg0KRnVydGhlciByb25ibyBwYW5lbCBjdXJyZW50bHkgaGFzIGEgc2lu
Z2xlIGluLXRyZWUgdXNlciwgYW5kIG5vdyBnZXRzDQpvbmUgbW9yZToNCg0KYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1bW1pbmdib2FyZC1paW90LXBhbmVsLWRzaS1XSjcw
TjNUWUpITU5HMC5kdHNvOiAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyb25ibyxyYjA3MGQzMCI7
DQphcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtcGFu
ZWwtZHNpLVdKNzBOM1RZSkhNTkcwLmR0c286ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJv
bmJvLHJiMDcwZDMwIjsNCg0KQW55IG9waW5pb25zIG9uIGFkZGluZyB3aW5zdGFyIGNvbXBhdGli
bGUgc3RyaW5nIHRvIGJpbmRpbmdzPw0KDQo+ICsJCXJlZyA9IDwwPjsNCj4gKwkJLyogcmVzZXQg
aXMgYWN0aXZlLWxvdyBidXQgZHJpdmVyIGludmVydHMgaXQgaW50ZXJuYWxseSAqLw0KPiArCQly
ZXNldC1ncGlvcyA9IDwmdGNhNjQwOF91NDggMSBHUElPX0FDVElWRV9ISUdIPjsNCj4gKwkJYmFj
a2xpZ2h0ID0gPCZkc2lfYmFja2xpZ2h0PjsNCj4gKwkJcG93ZXItZ3Bpb3MgPSA8JnRjYTY0MDhf
dTQ4IDIgR1BJT19BQ1RJVkVfSElHSD47DQo+ICsJCXNobHItZ3Bpb3MgPSA8JnRjYTY0MDhfdTQ4
IDQgR1BJT19BQ1RJVkVfTE9XPjsNCj4gKwkJdXBkbi1ncGlvcyA9IDwmdGNhNjQwOF91NDggNSBH
UElPX0FDVElWRV9ISUdIPjsNCj4gKwkJdmNjLWxjZC1zdXBwbHkgPSA8JnJlZ19kc2lfcGFuZWw+
Ow0KPiArDQo+ICsJCXBvcnQgew0KPiArCQkJZHNpX2luX3BhbmVsOiBlbmRwb2ludCB7DQo+ICsJ
CQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2RzaV9vdXQ+Ow0KPiArCQkJfTsNCj4gKwkJfTsN
Cj4gKwl9Ow0KPiArDQo+ICsJcG9ydHMgew0KPiArCQlwb3J0QDEgew0KPiArCQkJbWlwaV9kc2lf
b3V0OiBlbmRwb2ludCB7DQo+ICsJCQkJZGF0YS1sYW5lcyA9IDwxIDIgMyA0PjsNCj4gKwkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9pbl9wYW5lbD47DQo+ICsJCQl9Ow0KDQpTYXNoaWtvIGZs
YWdnZWQgdGhhdCBwb3J0QDEgaXMgbWlzc2luZyBhIHJlZyBwcm9wZXJ0eS4NClNpbmNlIHRoaXMg
aXMgYSBkdCBhZGRvbiBhbmQgdGhlIGJhc2UgYWxyZWFkeSBzZXRzIHJlZyBJIG9taXR0ZWQgaXQu
DQoNCkhvd2V2ZXIgb3RoZXIgcHJvcGVydGllcyBlLmcuICNhZGRyZXNzLWNlbGxzIGFyZSBhZGRl
ZCBldmVuIHdoZW4gdGhlIGJhc2UNCmFscmVhZHkgaGFzIHRoZW0uDQoNCkFueSBvcGluaW9ucyBv
biBkdXBsaWNhdGluZyByZWcgdG9vPw0KDQo+ICsJCX07DQo+ICsJfTsNCj4gK307DQo+ICsNCj4g
KyZkdSB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArfTsNCj4NCg0K
