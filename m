Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021106.outbound.protection.outlook.com [40.107.130.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1467C4E0205;
	Mon, 28 Sep 2026 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.106
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616863; cv=fail; b=d3yqUOidQNcKplyCRq+4jnJHc+yz/YYI4wnEv0hYhTs6jrBhU9QwNtwGq5Ijd8wCj0n8olRUGwIHLbGLgJsDx117ZuvuZqV5bZa7GAXUvA4yK1b0LBxXA5q6XmDmdRuHhoN8ZohMjQvQcr69utYQMPkSt0ziRx4h1dttde9J6Ag=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616863; c=relaxed/simple;
	bh=uH0rrP0fNf4uXH6bD77iN8grmdsyC3xONM6M+U2R5cA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jFRzqCbmo4GvN5H6yUvwsVN0eaWZNigFUGDKv/UWhiREk0PpzQv/hvAUqp/qgpGPG+/PgO0HczXnQYoRk/3La+Qr6NPSSFwntR7C/TDX2px6icOYskKlIM5SN8ZRg1I3lygW6WFSsgVfGbDPiPl8SK81wfkxNQdkftsFQ9qR75E=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=gToNX6eI; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=gToNX6eI; arc=fail smtp.client-ip=40.107.130.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="gToNX6eI";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="gToNX6eI"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fXqALY5W0JXZSGORpHYztrNey97OmIzzbYz4yHqEjJlQZhdEZ7x5tiCseuGKoJuHLcV9SwWy3krXnDYwOSz31F2tUEkimlGtd7oas23J+Hn7qvPThGKC3FqgADUw1C4ROz9BdAccOVSR3gJZMcIcfSJ3UScLMpdvN7jxIzwbokNRR/2MLWwAwwvvnKx9lHSuOpkEqrbkeb7ncErT6V2LqfvAHtEYqXnT8dN7VQIhjMF6TGT0UIZs00BDfFyNvKdE2+k6fIR3EHXU7FJJRqPInSKV7b4UdXO7IwV/+ZYfKEYTMeaE3g8eAuPS+ywOap93GfUx/7nNNWsTr7YZSjYZsw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=MXFtPW+8FWwctDRAV2stDPhIV4mwZpJqntZPXOCCVO5PPIIIN1RQqm9gvqRFLjXO3fsLBj5OdMn1yxGj2zDXYWjW6XTgz+CtkhQKvXlhwKtlIkx1pVXdWpgKRGKUYQvr+PUS7QHeMW9W4br6RRHskr543m+w346SDGQL0z7I7JKU0Q+fsaBGIJWbEcEGUqW5CRM5wLED+ebyMFKrJDrSzerMOhnO+wqwfMzrx5MYsVx7PjcEFySExQpjwqOxF0uQ/9opL4Sav4fMdfDWYew2P7HkZeMbMLWLZ/KzGaHTZs4n2nqUhNkgdWnWjfpf6qV1JSk/5JU/ivnBd8uBkSYsjQ==
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
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=gToNX6eIA/2rtX+N8m69rvNEsbX+eZZ33t2mV8YYYYCl9PA5XSP3rHFVm01u2hK9rVKJ85cj7hLCx/g78Na9uMA92sRiwyHnQM2zkWB1r7soW4s/EdmN91i0G6dpw5Up7xfh8hu9yx4r+tXiD/xJizuVObdeI+Gynpms1sL7+PFlMK6nUegUPDLHljdrf4vXPpFAk4aN5NBuFdpLX2WgkeK2k41q5DLOJJeWKeK9tyjRchKsKkFO44d6arGsPi+F9hmyWyYUWzFdNadMmvpcrXKOpQEvjmMWngtfeRNdAdOMXyszmn6VWSsLUxEiPluPFPP3sKKRkGKl2PmDmH7Prw==
Received: from WA2PEPF0000089A.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d8::651)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:34:13 +0000
Received: from WA1PEPF00009B3B.eurprd05.prod.outlook.com (2603:10a6:1d8::119)
 by WA2PEPF0000089A.outlook.office365.com (2603:10a6:1d8::651) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12
 via Frontend Transport; Mon, 28 Sep 2026 17:34:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 WA1PEPF00009B3B.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:13 +0000
Received: from emails-9512233-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-272-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 97106805BC;
	Mon, 28 Sep 2026 17:34:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616852;
 b=Pg2joEEH/o6Nw8M7Pdg1/GVm+AujlL9zulikaWiM5mF9l4JdTITS3tgv5hEpR1Xhl9GYd
 sKpbXKcxyaxMChEys+kCmtQmfXLSk8xpz3nZ+sV1ZjB71fskGohFWvPGCzlFtcMVB/DfHGs
 VMo3n0a1eBGbnlK5OoCFyPR8O5wlWYg=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616852; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=mejE0+RewvJ/wWMSijHejAoP3HloaK8b4UfzFjRLpO2V38Ytp7tLX2sFqVsLlfkvnGvVR
 ZIPPLs1lU4t281pNYzhHA2pFuUE/5vvfWDGHHwCuX8nSMuVi/UQz9JUxzr+LkU2c8Ggxm13
 Z+QNbC0MuUyqUVe+gVnwDZEk7TGcj3o=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=gToNX6eIA/2rtX+N8m69rvNEsbX+eZZ33t2mV8YYYYCl9PA5XSP3rHFVm01u2hK9rVKJ85cj7hLCx/g78Na9uMA92sRiwyHnQM2zkWB1r7soW4s/EdmN91i0G6dpw5Up7xfh8hu9yx4r+tXiD/xJizuVObdeI+Gynpms1sL7+PFlMK6nUegUPDLHljdrf4vXPpFAk4aN5NBuFdpLX2WgkeK2k41q5DLOJJeWKeK9tyjRchKsKkFO44d6arGsPi+F9hmyWyYUWzFdNadMmvpcrXKOpQEvjmMWngtfeRNdAdOMXyszmn6VWSsLUxEiPluPFPP3sKKRkGKl2PmDmH7Prw==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:33:59 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:33:58 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 19:33:53 +0200
Subject: [PATCH v10 02/11] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-/output-disable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-2-91752ea39cbc@solid-run.com>
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
	MMZPR04MB400504:EE_|GVXPR04MB10045:EE_|WA1PEPF00009B3B:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 61dd079c-0125-4604-da40-08df1d86b66a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|7416014|376014|52116014|1800799024|10070799003|366016|18002099003|22082099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 nv1yy2ld1v5wetmrTPdCl+6W5ArpZMNxhU7cXDk7s9vWHyCxMOAvYbyfE7vJVxlRu6zIMKhg4Fr1N/b/Ynd38zYdUnjAcgU5SUPmmgoKwUWhZrFmZYVTKRNpmq3v3GZrShZ1p2gKv0sGMBPnhW2Uh34E8KfMhBz6QK+CxFSNV8j8kdGhVYmX3OBgZ+SJsBY9hyPGxp4lQIbap8zM8EYdgjrXEhKZLAj87aPzt5zHhZu7JAI1i1S/v0Ww819Rh8istJiBYsr4nULJGROCP7t/ulKEzBaqNhiuRKjtypGRAT+7A+3eXzH/nTPeMovTDkMmaNQTsLeQmy8PKT3TxQUW05B7NBebu9xTV1HGAVfzl5uIuQDvwAp/ajXHlrBA/lVpGDpAfTVrMBiL7EoNi/S2u8yhc8ZX0sUQaoOdoyr6h2hVxsr9f2VsRyPYwNqXCVQPvq5Dyc+YOsyIV6i3CWNLdH4bZ2/E0w3VZ6AMFAULcSNOTQ6TuFwJP0erw2CV6R5Xi+i8sXxvC4DaQoFD850/29/QDfYXlSfAced/JX/N865PPfmGgeAe4HRZzDntsi9hCewlkUKULyPdx7girEdJsAi5tCeDlYXrl0MKMM2sC5gxXbQFYty+dSPLoTjRRTjfXyQ71eeX8FpopbYT1DHawD1WqWR3F0fiDMo+W0JO79g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(52116014)(1800799024)(10070799003)(366016)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Bb2ys4ULVcMDGAB8iGeOzO9/yGCa/6gtbDStjoVPRBlbTWtfuWZ6bntT8A6Dq0+b4BHyXu6FvOkYJVzIvi2KltQele3a+c6zLUsZ3LoC9b9xO6SLuNjy+G81oE9gi/qEZ4DtMACOrPrXyFhnE6ZEq682iVze/kFWiImvMD+HlETliVmNaepbjzvBCWCrzLkCloMOVcAHZdfkx24CvOyIpe721G97yjQTu45kJ4VURGNsxMqP/bTA+ejH3h2LYsPh7f3FZsh3vD3IHvlONSqtNpM6pmMIR5LBNBERgc4W9BARFY5YXYdRF5ojVJ7RJbHAGwMx87W7Cu4ZOEi7ihFWZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: aee6453e172e4b97b353efdad0496b37:solidrun,office365_emails,sent,inline:87287daded720ae2bc7e73491d419f2c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsYrElcYxhKz1Ztin2gQaeUVtavt5Sl/dJkzX2ROtcXV3ttDvm/rCwPU7zv5D2T3YVCDHUrKzaT/XK/p9p6VqUHayHJO/CsBis0/bFgGuh+EsaV7vICCpXBi+rfB4du9sSlEsIZxMlKHXyiLsMxWD5AtDyRU50VmJuFkRP10phw/mtgU0Do/qcZLAlCCxv3cIjBvdDUwfyMCTqbNIdxDml0R9TaX/rctdhhBDMtPSvcbGK1+jx6JM/8pH9y+aagcRnf5QhMnCxwQgPkhIJ+nqSDkh48W0jF6XRazAgL0oYSbbQeK22RzAIukT7V/rA7TmgM5t2y7pJ78k55lAI0mqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=awvkdakSsMwxKExs26Sc8UzEAY9FrQmnVQgSYn1TuX+zXmYg58sVuodIeQxZH+xlTuggutaj2thgzynUpm0rZlN9mNaezz6XJegEqwDO8lLJ+lmuyvJywsjdOGSI93dtc0s1XRxN5whfKwhR4TphqGxjymhWsyN5ilhFdVRmf++4qkPRNbA/JgnkVnvd8vKZRhxGbLDI+lhz8z1hhH/QhAnwjQCX9UHVYv5T8kgNPegSb6ALixLxIo4AlGMTxLl5/6YVy2vvBJjeECD9VFCGk7wVl0fHOxMBX1jAFy5GTWceHo6uvdRhbUbSN+vyw0dBuOnQZY1HzqF45Eg3GWUMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 WA1PEPF00009B3B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	866bea68-552e-45b0-be88-08df1d86acdb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|23010399003|35042699022|376014|82310400026|7416014|1800799024|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	XQ/oP6dFzwmA4lCtjWEiFxV2QkdMl9Ymwxvx25dE7Oz93atLvc/R04m/Ar60Wxuh7Is6tVrNsnsgzjltA4rQ7D6sk5iQy6S85ZH4MbArNWP07BcgdaWrfZ2IYz/BrIbciS4/kaehHQnV1qyC5m74MAn2CPuCfX/1fkl1zLlJjtRakj8Nrffbeb8Hov0fNULjyGeUuy6IDJ6JH6AC/EKVsB1jV4uRhkY8QZwzsnrClyPU+INHuui+NK5d0rSntClHi1jM6uyp7OWTa4Rb/Q+rGettmZzW3hZhVKUlc8TrhpQxkLJuy2lgsutOxGMAe8zIIqluu/lzMvJkBqbF28gnrGaafVFbgAikTJsbaCXsyP5VaaQd8J1pj9cbyZdtgYsM0RGP0XuCR7R8vdXZRo597KMKxOLUxAARXYUtIl1JnlroNZS/z+sE3vx3HyUqaQRqOWhih4vHiwqcWxxS7uSGkTuZAaLQhUtUi34uN07IwBZIdPb35BF2QNGNa95ce9GbWEzW9bz3npKz9qjBWCm9kzwGnDkYixWHzSWqJhzNa/S4uCChyhtnOWOdKN9fCf2osIhNbwXNHkujEXX+i9Bz1ksW0EfVDWBYnR0gABATg4o2ZR2VJJ2TlCKx7UczVfa95up4XXFdseqwKoeBqVgGOoZnjw1SZcTpo/qibF8fF9kkKeqhRVigC+YSpeCoHGrQUrY5+WxwAFk8xDaCeV9czA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(23010399003)(35042699022)(376014)(82310400026)(7416014)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8Y7uD1iDCs05AytfL5ZCXShSQMffqQLjOhfhSRRJNKsX9RLxsJAfvWaoiZ4zgsCSbKfs5yfwuvIsVcASSRENrTsRmtjhkB3JjmxssOqS28Obbgrwh2a59pXiHDSZYUhAqTQ6NRVG35xTJXAw/4Oiy+sCh3x1nbfU8RDKIR8jekhjDB/eD//r1TKBiOXYXObxOehZLEDQqjzLBvjosAxqctAWnuyaGrdR9IGJ13iVymIADl7p1ULGhzPA4iMSEOVNlaO10ONvVnGh9t97VOnO1SEMliT4HNhlcV4lQbtlGlDCMasGBQKYQZWbwwvC0NdUUlmVmXqMG87JnPOXlUed0SLpKtNMUcA3Hj9i8Yp3GKTl7sw7SSLgCXQ/dmtuo6gDdT5GT9kHbrnkPhtWaTLN0+FTk5J1cZjD1Nco2rRt/44ypHS+Il3CdxO/P47+/bpm
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:13.1677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61dd079c-0125-4604-da40-08df1d86b66a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300

The list of allowed pinconf properties already includes input-enable and
output-enable, but omits their -disable counterparts.

Each pair controls the same bit. Where enable (set) is supported so is
disable (clear).

Add input-disable and output-disable to the list.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fb1fe1ea759fc..a551996623c04 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -135,7 +135,9 @@ additionalProperties:
         gpios: true
         input: true
         input-enable: true
+        input-disable: true
         output-enable: true
+        output-disable: true
         output-high: true
         output-low: true
         line-name: true

-- 
2.51.0

