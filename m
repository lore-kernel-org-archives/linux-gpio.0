Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022133.outbound.protection.outlook.com [52.101.66.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BF147F2E3;
	Fri,  2 Oct 2026 11:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.133
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940495; cv=fail; b=hScFWI73pp+2+gmaotw4w5cToHqe3ts9PymTro8iwWQWqYncGyM7/M9ZTWK6k5+BtdROHhxlE/TF6ZUB/WQ8nuhMXLTfYDGodLzM5Bneo6mR7L4aBbhXSxXcOko5hKM8qI2y+sgKwwx9VBE0gZ3QTLGP8KNB/CCgvw+p5eWewqY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940495; c=relaxed/simple;
	bh=T63aieuRDaP2UA/fg4iPaFf4hYZEYvjKeQgc+My5wYo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jxa6NTjdG9smBurLfBgBR0bhPGD5xE95lXbWU3XLZ4WSMxTumT1xK6T61p+c04dw8v8FDntN77xIIwDvT+MYP7rmmeNnjiTEVhjbstBM1DdmQmLdut9KXQc4LPM/PskSIWgPt/Pb67ryHsYiHIJrFUdXo3JSXSZ31pVfAmkeFz8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WFSzDeps; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WFSzDeps; arc=fail smtp.client-ip=52.101.66.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WFSzDeps";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WFSzDeps"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ruy1Xn+DBLpQkLnJiZAeFwQUcA5GFuAg4jfnmHYzxmhR8zq+soN+3WUyQVlM+ey+R+4ONLNrR2j8Y7+qYKuvLKq7ks6dy6f34Q1WOEFnJfi2wYWnN3EOJebXekuy+WikNmCpM3ehoeWaCMNPDq+XprgMvYVZ+/8py0zSzypTqye1En+vmcsBhO+2TxbfnWoygh3j7Dx0l+gj9fRg2fAnoJKtWrkCtGWMGrpptVD81q+zoNr9U6v7YXcXvZwN5WKMwHJi8D5B6G6yUXUiCZg6IHfVUbosPYfRxhAOoF3PVwWRaiEOJqwAGuR7Y1/Vtt4HwyBCbCXzRxDQBwVA1sWcpw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T63aieuRDaP2UA/fg4iPaFf4hYZEYvjKeQgc+My5wYo=;
 b=gEI6k5N8yRIzx++iluJuvYmK6EX52T47GvTsNp9+bT1NisvXpkwqoWRoVn78oA74t1OLux2B5Gnhc5oklSMv6Pduyv4Ju1l5uSzm6vdrluRp7LeFkMe+3VSlBbmSyuFvi/w2WJ38n0+UBjcKkN987yaz4q2gU0Me8w0JJOflhnTRLqGDECsUWySb0CQ41huqCTpf4jVQNZ0LpwednVsXOJNQnxlTna7oVesNESroxLTmpar3oH4X+Q2zJkcI4PM8mWqhu14INagePCThA7WIcTGpVTu9sXK7SjIYhZX5NhiJIHJZBLEXqiXGacHULxRkKFj76sy5H/cArR9DNtKS/g==
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
 bh=T63aieuRDaP2UA/fg4iPaFf4hYZEYvjKeQgc+My5wYo=;
 b=WFSzDepszfQalVE7ZGDW8z2uvJxJiPo3woCz3MMUIcqhR4ul/z9dTyK2pj2twMJ42OJQWTTstcka0HnLlRqMfsCr4xYVrxhGCv1DZLQQzhqpIkxWGn1iYrryr8GxUu55BjAprLLibmtYyk0Xaf0vUjxDiB+ht8rLRBPY1AN+7hPDW13BKnzYh56PZxXCwUvGpmfI2HRFL4VoBOptli+aGa8lHPJjKy/5H5VHmCtIwW6II0oF3JGlArgH7Y2byqjD8n5yHTl5W/uHxtP2TFu+GRCL5Izhcwq17nWEU5vjAYUCsUKncXu9/+lxYslGlXlUbSKSZotpyLjyTRtPSmufvQ==
Received: from DUZPR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::13) by AM9PR04MB7650.eurprd04.prod.outlook.com
 (2603:10a6:20b:281::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 11:28:10 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::54) by DUZPR01CA0006.outlook.office365.com
 (2603:10a6:10:3c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 11:28:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Fri, 2 Oct 2026 11:28:10 +0000
Received: from emails-8190067-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E25F081824;
	Fri,  2 Oct 2026 11:28:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790940489;
 b=kq3jeeGnShZa6KtMUJicnsr4tjQq650VqZSqsj1DS1KTydY/KteHecdyryoHEx9eTEnLQ
 dVaem+lFnZnol10k/f8ksEcoGidPRV/ncodOwzFfW3UtHfQ4VOhxrI0QeodV1vUaocSqVHl
 BrDnPJH31w82DdUMz3J1CczaAO3GOAU=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790940489; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=T63aieuRDaP2UA/fg4iPaFf4hYZEYvjKeQgc+My5wYo=;
 b=WhPN0gNNh9I4I4/N+MZXf72nnDDkTOU8CYcMwW1YhuQjBuu9iw4vzwZ2Z1fsH4PXl+nby
 SSVMNvDyS12f7EHpkW5IOFTXVXw0V07xiaD3FqTRWEmyp1d3lC0xbQbxbi8V/bcjowp0jpJ
 BrM0k8eI4f2DdBQsXPyQTjUOo65AIu8=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T63aieuRDaP2UA/fg4iPaFf4hYZEYvjKeQgc+My5wYo=;
 b=WFSzDepszfQalVE7ZGDW8z2uvJxJiPo3woCz3MMUIcqhR4ul/z9dTyK2pj2twMJ42OJQWTTstcka0HnLlRqMfsCr4xYVrxhGCv1DZLQQzhqpIkxWGn1iYrryr8GxUu55BjAprLLibmtYyk0Xaf0vUjxDiB+ht8rLRBPY1AN+7hPDW13BKnzYh56PZxXCwUvGpmfI2HRFL4VoBOptli+aGa8lHPJjKy/5H5VHmCtIwW6II0oF3JGlArgH7Y2byqjD8n5yHTl5W/uHxtP2TFu+GRCL5Izhcwq17nWEU5vjAYUCsUKncXu9/+lxYslGlXlUbSKSZotpyLjyTRtPSmufvQ==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by VI2PR04MB10884.eurprd04.prod.outlook.com (2603:10a6:800:270::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 11:27:52 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 11:27:52 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>,
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v10 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Thread-Topic: [PATCH v10 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Thread-Index: AQHdT2+KdL/p0OdQakaftfs7nVPGSrbqCTMAgAAZ+YA=
Date: Fri, 2 Oct 2026 11:27:52 +0000
Message-ID: <78f19a24-7f57-4a87-9adb-ed2a433e28e1@solid-run.com>
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
 <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
 <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|VI2PR04MB10884:EE_|DB1PEPF000509E4:EE_|AM9PR04MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b43a229-51c0-4394-4a06-08df20783cf3
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|38070700021|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 2Zb2q6i+d6gY2DjgSYXV1fqD9ee0jLIqzqpz+rBGeaBKX6shnUFV/Tyc+jwye5XLffpO7YuymwJUMDgvItjcBiAAUNPwIfEfMZesqe5iAES1fgiG5+ofIsfYo8jFKdHxCuogZWTXK1ICG6+LT/uHg49dNIXqhk7EEnHMV4q51Hqs8EmX7f81RjYh8sX51hOvaTzIcZXUlfnq88E6UDrAej2FRJ+UYbMOv1/PuQk4f5J1M4+VFrBzF6bO1YGfT1RSoHzkcrhpATEBX00qIRlHWGDp0O65gkp3VE5uc0RZa95AbMcejQ8Tf268mIZYRz8GX4uXpUxhn6uAkSwIFATReZ4AslIdSO7wbfeCV/mqowbamIqxJRaxeuUbZaxaIoRsNg5Mn4kWluiRhsA6K4588VDIaH93g7tVF4Mn+gyVXfh36SvB6D+jTSWIaluqCvEaWS6u5kARafCA8S/nkbRTOJuoNzt1co1o4+/v2M4cyvB/kjpN4lQQQzvSEn3AQTBKXrGE8s/3775GzAfpIbrn0QECsUS7zeTZhKX6E7f+s6sP+bRai7+o+x+j0fWFtA+x97ES5jlhDPlhdwhO5KLiPxxTTRLSe1XgfJtqTC4qJ0aaDAJeRIZbppt3LYoKtRqiNu1L7F8KfKtTqXTjW30132YM2pmWt6om80bRfxt27pA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(38070700021)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BB06D2159D62A449C91757F3E3CE36B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 WBYMYza73IO0KoP/hv3XpwBnuLS7zIKoAfiza/P7XcItFxSuRn2wUl/X/iKr8+CaKC9qP0SvVG0sILO/1oQuxzQsVTs6bbI/iOldiULDOT1DSFLnwr2ObSJ+2eioB6BhnERwoikdtSnzSkRDootDm+GQwrBHLs03m+qlyz7QjlapMFheELQQbWf32ZVa5nuuZHMcb/X0lD/z85jJw0UuajGS2XR7rJyBbVXDoSRHjpJaj+1JgV3xla5fzeZtPZf5Bb5qTIoj5dyidgXjHrltlVn94xjknKHxOwsl6PY7iVnAO8ALISS2HsUtZy0Z0K5/aadJ5LVb4UBwD/P3jHoBHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10884
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2259c97fd0c74c7a9c801e973d8529dc:solidrun,office365_emails,sent,inline:e21c5537509ce39c09ddb7472dc08179
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6u1W3TxOJCcINOaqSnd/B2Afmh/ZkNzG7ChF3kgoEpnTkXjwO1ibxSEH0dmFY9B6SrdqFCM4LqkgUOV/91qrmzlW8AxJ/+8JWKwk4EyVWqPzweoY1V+35mBKqmxA6fQRU2sX/JsCuYFOhpvd4L86Rtg1aW6Hpcxqi7Xyj/qE0lWWpvBOx9wgL8PWhUv28m/OPyb0yREkxQSVZIGBRF2rHhVIg3nLTyXBluKaKWI8GPrbsOKpbKFObfx+Tf3lX+zCEwBHN4n64vXClsP7/EBgHDqopSls8Mli1Oz81QPsFpbYcu7X7JtvGOCA5RrMPbTEm8nHzq6vM8fYTbO5g3liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T63aieuRDaP2UA/fg4iPaFf4hYZEYvjKeQgc+My5wYo=;
 b=m+Yw4zRXi9OkcRCvjpIRaGvnH0oiUqvm8WfWGviW6JBiwapKPqG4shZdN352zjp//tRKuTa31YNgkclMic+vkezTs34DqMYZHUmAD3f2Jt/SEwQR8oDSCyqQjW6FDWE3aKU8WIRtD9gtL7tDpLNyVWbkO10isl9jHtWdE/uy4c07QVjXAlz5CQgNYp+uB8HSTpU22TUzsrVj/i8eiQFTOVmibT/569iAYvix9VfLqPh/danc1TZX8tOvDqwqCSX5bBxU/k1VmaKmlXy+3G0+oZYhoy7cY6DJuNtnoXWTaWqQBKGlkJhaSwgbJ74wJJ4yOFhNDwjx4ABXlLdiVe5PHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9d86efe-fc51-441c-7d83-08df2078326d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|35042699022|14060799003|22082099003|56012099006|18002099003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	LrLzW2G3fEZYSd6eTmpSwSOXfuutIKFJ+sQE7DwFdy17caRddXHf0UygQQjjPMGdaq4M3Mkw1VGJE0FH3BfOMnfAkoq/hbB94j0vDogEadjV/z6BfTKHaaBUoKgln82H5SrSrggqc4zi52WaX4X3QSBOwlP5eWeIUk+Kse/rvSdq38oWgyQJW69rXmHM+3qbXgPCYi06iCLLUI19w0uXhtKx8Oi6GvZW9vghxDdipO+N00ph+UMAnwc+v/D71+TKIiND1NGgPXnkqZ0FgzsbDTRAXPhotktHEyaDaHqdIj0yUqQvDWm+liSXZLggWZt7912+bkRlvqTmJS2f3ciP+K5/JVDEoP0w/fkPW2Q/ovrm9VhN7wRfXi0s2QeZY3eKjiAFgCR1ECWQI3oGtTGj4/pOem9xVCsJNcWduf89DfelSSCbfvfDOjulbcdz6Emlich8Cgau+jjjHuiQBbxvLDiEmBxA8ToED1DVorBLi0k4iL7coTnwXMRlptAHQB2Vr9e68fRGfyzg72zUomqqWGmffPQxKo3S9QXMcAm5q9P3xzGxQe4ZQOZN+z6MXOunlozcv9ZUXT9GtImxmnlk1vN9QZ3vw0/eZZ1XFDgAdcZDW0wmOdhmCuApZ6RM8rKGixRFc3zE5Hbd90aA+MvsXkRXxQfa3gYdc5WTqiL5Urc=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(35042699022)(14060799003)(22082099003)(56012099006)(18002099003)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y3oJM/+sjsRJ0J62YNqbV4mY0B2vB4gVf9nbNDbxiyiqZWY4hOBW50doxmjOOAJjTv2Xgsk0+y1HpCmW1AiGz4YtobuDDzHaCunN3muNEwjOWAhDn6nFcx52tAFxkBpdWD2JBYQbcNiinVgEMZyHLv9oCScwggpkoRtczeRWN7PtuG4H+ziNlPsg0fYYL+TqFY+3DGCaxF0hb3ey6XlbsikTCMSPw1yj1hCBOg9eu4o61WG5QXtcaCeTrT9fqo/VSjR1sXfAqrFBB53mAZq9y9lgsjSHaHlhapFEnGGTbjWPkvoSCo/3v+cdYPciLdKg6IDSfuiAz6F2oOXW6QSfxHA15ay7o+vs8PULgZYEEs/BzD0qospHNYg10IIFI2Iv2iJKK1sejO1n0rzHmqtVf4Fnfg1fKRadXvVGrTJ6YRX0BxxTTax2BsmQEOCRkYFp
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:28:10.0197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b43a229-51c0-4394-4a06-08df20783cf3
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7650

QW0gMDIuMTAuMjYgdW0gMTE6NTQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+IEhpIEpv
c3VhLA0KPg0KPiBPbiBNb24sIDI4IFNlcHQgMjAyNiBhdCAxOTozNCwgSm9zdWEgTWF5ZXIgPGpv
c3VhQHNvbGlkLXJ1bi5jb20+IHdyb3RlOg0KPj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1
biBSWi9HMkwgU29NIFsxXSBvbiBIdW1taW5nQm9hcmQgSUlvVCBbMl0uDQo+Pg0KPj4gVGhlIFNv
TSBmZWF0dXJlczoNCj4+IC0gMnggMUdicHMgRXRoZXJuZXQgd2l0aCBQSFkNCj4+IC0gZU1NQw0K
Pj4gLSAxLzJHQiBERFINCj4+IC0gV2lGaSArIEJsdWV0b290aA0KPj4gLSBTREhJIE11eCBzd2l0
Y2hpbmcgYmV0d2VlbiBlTU1DIGFuZCBDYXJyaWVyIEJvYXJkDQo+Pg0KPj4gVGhlIEh1bW1pbmdC
b2FyZCBJSW9UIGZlYXR1cmVzOg0KPj4gLSAzeCBVU0ItMi4wIFR5cGUgQSBjb25uZWN0b3INCj4+
IC0gMnggMUdicHMgUko0NSBFdGhlcm5ldA0KPj4gLSBVU0IgVHlwZS1DIENvbnNvbGUgUG9ydA0K
Pj4gLSBtaWNyb1NEIGNvbm5lY3Rvcg0KPj4gLSBSVEMgd2l0aCBiYWNrdXAgYmF0dGVyeQ0KPj4g
LSBSR0IgU3RhdHVzIExFRA0KPj4gLSAxeCBNLjIgQi1LZXkgY29ubmVjdG9yIHdpdGggVVNCLTIu
MCArIFNJTSBjYXJkIGhvbGRlcg0KPj4gLSAxeCBEU0kgRGlzcGxheSBDb25uZWN0b3INCj4+IC0g
R1BJTyBoZWFkZXINCj4+IC0gMnggUlMyMzIvUlM0ODUgcG9ydHMgKGNvbmZpZ3VyYWJsZSkNCj4+
IC0gMnggQ0FODQo+Pg0KPj4gRGVzY3JpcHRpb25zIGZvciBlTU1DLCBtaWNyb1NEIGFuZCBSUzQ4
NSBhcmUgcHJvdmlkZWQgYXMgb3ZlcmxheXMgZHVlIHRvDQo+PiB0aGVpciBkZXBlbmRlbmN5IG9u
IGNvbmZpZ3VyYWJsZSBtdXggc3RhdGVzLg0KPj4NCj4+IFsxXSBodHRwczovL3d3dy5zb2xpZC1y
dW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVzYXMtcnotZmFtaWx5L3J6LWcybC1z
b20vDQo+PiBbMl0gaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFs
LWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9odW1taW5nYm9hcmQtcnotc2VyaWVzLXNiY3MvaHVtbWlu
Z2JvYXJkLXJ6LWcybC1pb3Qtc2JjLw0KPj4NCj4+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEg
TWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc3Itc29tLmR0c2kNCj4+ICsgICAgICAg
c2RoaTBfNGJpdF9waW5zOiBzZGhpMC00Yml0IHsNCj4+ICsgICAgICAgICAgICAgICBzZDBfY3Ry
bF9kYXQwMyB7DQo+PiArICAgICAgICAgICAgICAgc2QwX2RhdDQ3IHsNCj4gTm9kZSBuYW1lcyBz
aG91bGQgbm90IHVzZSB1bmRlcnNjb3Jlcy4gIEkgIHdpbGwgcmVwbGFjZSB0aGVtIGJ5DQo+IGRh
c2hlcy4NCkFja25vd2xlZGdlZCwgdGhhbmtzIGZvciBmaWd1cmluZyB0aGlzIG91dCENCkl0IGRp
ZG4ndCBzaG93IHVwIGluIG15IGxvY2FsIHRyZWUgYmVmb3JlIGdvaW5nIHRvIG5leHQgd2l0aCBk
dGJzX2NoZWNrIC4uLg0KPg0KPj4gKyAgICAgICB9Ow0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4N
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+DQoNCg==
