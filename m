Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A7B63B9;
	Mon, 27 Jul 2026 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785128902; cv=fail; b=sDJgStFQXu4zVyZI0Juw5sLGX5tV77nsz4iFanELiwQdrbm7YySmOq8XRwFztWiegAfliG2okkQ4Rw2p2J1hX0J1XsHgO2HSyi49iTXm52WLa38ugg83bi51PyQ/l/7jiFQXZK03KqH0rnZ/fXG0JqKo6izfmJMzGG+vGFtirbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785128902; c=relaxed/simple;
	bh=27vi/WQ6JidfSX3zxTpD/w1iw6RVKd1mAU/8BPFYzes=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pEJBrwaE7vj95bKWT6mPdio0Uo+OQfiwwBHpfqH8zIFUgRlOq+NkOcYZox2yJlQdNDn8lQN8fi38bq6aB5AKGAQRQzOqqnpTwtk5h9GDOPS8Xt2vMzLYIoDChmIgvURMbLaX/sa2OyHtSP/qlUeWYT7xKHBnW/+5gKlNAVDqtP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LywylT1E; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=J97aYz0O; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LywylT1E";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="J97aYz0O"
X-UUID: 2b59cc86897911f18dc8c9802ae25ab1-20260727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=27vi/WQ6JidfSX3zxTpD/w1iw6RVKd1mAU/8BPFYzes=;
	b=LywylT1EBhxkK6Dwo3Dh3FGCjs7c7mWfPux9V7mq3h4WL9SZwCf3easwcTFNE7k3KTRi5ogRuoDlBj5bHwziEcjz+l9o4G47qyzEvkTgSPy7Gex86vtXKxytGHrZfMMFJefgR3wEicAweAH5ydr5dY+LK9o7/PeiV/jRvsYFm5s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:e42e3b7f-1c7a-49e7-a4e2-2fd00b9c57cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:b8b739f1-0685-46a3-9cac-19d8f3a05ae7,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2b59cc86897911f18dc8c9802ae25ab1-20260727
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 426554636; Mon, 27 Jul 2026 13:08:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Jul 2026 13:08:12 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Jul 2026 13:08:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3F6D11ehdpDnDm47EysJLTneXFQrGRwvpEpLlRQfO6olAAddb59hGbP6KktdrWpCHVnEZCBYjaOHS5Jx7MTUbclJSOli/H7qztc02KZ60eDHdVnpxgEv0VVwGKJTJdS7BNDM4mt+41K74MMQpMl+9HkVkCfBrIsVoIusuOzgUao9P5C0JhgRiS4piywV++3nwavah3fwcrMNGi/RLaC6EHoy/2WQEPQKX72aH2jz7xkc49vkAz+CcJFPwRFRxZxCrpKAZN3QVeQgu9rH0uSePHDzsTcZSskqYTnVWTd6d2nB2lqui5/7cRS1Uxvxlf0n3UCW8tcMYKytnxpoF4bnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27vi/WQ6JidfSX3zxTpD/w1iw6RVKd1mAU/8BPFYzes=;
 b=KhgDk+PzAWHMKpMNLMM/AJLdsOy7phXN4vZfkWjtxbqxfvjDzxgkRZKwTamnIondnubPpsToRj5i2p/LkJMYfDoPyl/QPLJi7a8YT+0sarWWKvRyPKzybj8B6ee3SzQ7YKkJH8GvfF/zDUIC3taMu0+85ZZvIw3pP8MDjp9Y126yOYItB93xh5fEHQVNPoSBmAb/oj9kyzSP0dmTkolVzopPHSs/eOoEzw1q8kaNMdKdnBnx7C/uTj3V9fNhp1Kx6QT2WgLi7o3j+D6s9nSQM+ChKs+H4xzEX2vvu7QtH+NrybLsvJM1jDsb+dqFVFLM6eaUv5lzJl5s/XPrM3jjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27vi/WQ6JidfSX3zxTpD/w1iw6RVKd1mAU/8BPFYzes=;
 b=J97aYz0OJnd8PSn4HJOJud+fxqidrH/Nf+58k0DK7pMUYgPgX6XRCTRqFALzBvr4Wm/L+cAQ/vBXNiR9FoExYyk1IN+TY6l8E/1tT2VhvBkRPpNVvEgIr14X4891cwNEmjfZWMA7tqVvFdkc+4H0p/v1lXgTCp/XC1N3L8DsHiE=
Received: from TYZPR03MB8241.apcprd03.prod.outlook.com (2603:1096:405:1f::7)
 by KUZPR03MB9638.apcprd03.prod.outlook.com (2603:1096:d10:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 05:08:09 +0000
Received: from TYZPR03MB8241.apcprd03.prod.outlook.com
 ([fe80::f4e8:fd5b:ddb:ddf8]) by TYZPR03MB8241.apcprd03.prod.outlook.com
 ([fe80::f4e8:fd5b:ddb:ddf8%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 05:08:09 +0000
From: =?utf-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>
To: "linusw@kernel.org" <linusw@kernel.org>
CC: "sean.wang@kernel.org" <sean.wang@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 0/5] pinctrl: mediatek: Enable module build support
Thread-Topic: [PATCH v7 0/5] pinctrl: mediatek: Enable module build support
Thread-Index: AQHdGleH6jILa0LDQ0WSuwB9R34TprZ+NvwAgAACT4CAAp3ZAA==
Date: Mon, 27 Jul 2026 05:08:09 +0000
Message-ID: <9ca0e2e8a27262aa2c60b10b1ceec6b40a5dfa7c.camel@mediatek.com>
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
	 <CAD++jL=fy+0ZZhg_eH_BGLUZfpK69zCcOaTp_LQ93yvSxUiS3w@mail.gmail.com>
	 <CAD++jLmDKxCwSWZbKcpawjRotMgEFxaoCjcKiq8H87A39tnQqA@mail.gmail.com>
In-Reply-To: <CAD++jLmDKxCwSWZbKcpawjRotMgEFxaoCjcKiq8H87A39tnQqA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB8241:EE_|KUZPR03MB9638:EE_
x-ms-office365-filtering-correlation-id: dd0b7ca3-7aa3-4469-340f-08deeb9d0cfb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: eURRD+wcyFjVdp81wIGtxiTjd3aWQvxUXEuxFFr9hssj7/lv6+XKTvSL3A0VmkTjzf0KeFEDKuqsq0P45jyA6FX/umQWKYHmPkfHl4UD7FiTD1DGacSEoSByYqXdkzxxyrXMlaiqjVwavdztY36ColzpTRLAbTD7E5JbEKaEYnjyQokMceMAHLH/RUa1CY6nROvg7rkMSovy8+OFF+3OOAPOKPYnfjn8MMDoi3IiNvRujQS3O4o3Sr1mla6nYW2LmUcAcA92vrxUm5XewCyGJ4xJKZg8pt4EYurifLe394nrnoK3tNmUeo5XoNVwL1rlyMYY+JD1VyXwuWB0C3QTNcvTe9dQSYx/S6K1SFz+DbpJ591XXyFwF2e4zxxHbL5zAN/fp2WpnxcCChUNa6RCIChhLju/UF6fAvHHyUKgkifOnmGOizVHs1yCh1NdBRSh8yfoH3oZYw69z7kBxFw48mF8RViUnEKeWSTvjHKnLcKEpWkihkwKgOFzKvNj5mNoHG+qT4mSNNTwhisiPbilkJXcf8eSRsNoQlIPzPhnPzT/aiI3wppIDCsgQhq9pL8/hdqjK7/LYC+UIRTw6fDBk8w+N11LCbfLk+tUi24dnrqr+jH4n7VgTf3HfDeYN3fk+//HSfAnNC+9V719aSvsOz4nzr8hkehut7ivfCGu1WXxw9JdWo7FPizl7Tc4IQI6xuwzEMH0TUwGVPnnSLOoffiidK+yCO7kPfWBxM2MEhE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB8241.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHJ0eExBMHZ5SERMYXo0Sks5aEpWSzl0emtUTW1RYzQ3SUVWdEVOZXYzN2dH?=
 =?utf-8?B?SkgwRVl5SVhHMjNZT2xEd05WVUc0c3lNSDljWFBORFBQOU9UaWpURDhGd0Jz?=
 =?utf-8?B?UVFWTE5tRDFDMmxudytWZFRYZHJyRWZnV3NMWkIyWTIvbmhJSjFLUG1mUFJx?=
 =?utf-8?B?cm03cWpkZHhHSnZKdnhaYytwUmxLZVFtNEJNUkxIWHIzNzVwU2VIMU52cmNR?=
 =?utf-8?B?dThXVHpWbDc1SnFGN3pKYk5MRVZYNVhXTklqMGM5N3RiT3J3ell3V21VS0JJ?=
 =?utf-8?B?QlZKTnZWMkkvUUtWRXlwTlg0UFBHdkdybFNpN1g1dGtQMVhQcDlINVpFMFZv?=
 =?utf-8?B?cExGZU1QNjUvZkdyZlY3Rmx0SUxPclJvMGkvNGxicFplVFRQWEVLOVhXOVV2?=
 =?utf-8?B?OFpGUjQzN1RPTDYxQWhjZ09BSjV6aUEzQ3J6SEgrb2FiN0ljSURuUXQ5dGhz?=
 =?utf-8?B?Q0tMVzB4amtnaGloK2FGQmN5OGxiS0Vqa21BTmljQjVxck9YL080aW1heWVO?=
 =?utf-8?B?K3BhLzBET21qWlFhRjJpVUJkU2YyOFhwSTVhLzJXcnRzR0dIcytHMEIwNkRS?=
 =?utf-8?B?N0NLVUd3WXZSQ1U2WW1mREVFZEx1TDBzY3NuTnRiWkczK2JlTHdvV2pmU3RM?=
 =?utf-8?B?bCtseVVJVy9jVTJXaFNHNURqdmxoMThkUDNIY1Q4OWZTYkloR1lqZGlud1N1?=
 =?utf-8?B?U2hEMmNua0tFQmx0YnNXdkZ1VG1QNiswVXJieThIUTBtOVloK2JqNzBCRWlp?=
 =?utf-8?B?VTNiTUdHd3o3QWttMFVpNGkvZzF3MFFpMzJFdG05bGw5TEMyc0tlMExTaXRB?=
 =?utf-8?B?dEdaemZBb2lPa3Z4SHRyblhDWVhGbG8zM2dvL25JeFBURHJYZlFwNGdLb2Y5?=
 =?utf-8?B?OXpJK0lWMi85aUEzK3JNVnE3SUFiZS9HUTlXbEFSOURzWDU0dUhGcVNub29o?=
 =?utf-8?B?ODhuV1VRM091aWxBaXpTZ05ENEducTZycCtqRUEvVlVLakNEeURjZ000UkdQ?=
 =?utf-8?B?alY1ZUhUZHViTUgwSGdXUk9idkp1MG9JUmJVenFpUEtCVXpMcUw5QXMvU3l6?=
 =?utf-8?B?UzRldnR1T2RCVkZMMnJEeVBhcGhyZld1enN5aGRZWUtUNFd6RE9LZWdjOUVn?=
 =?utf-8?B?a2czRGRZTTBGTllzL2dycGJ4b0Fsa1NUSDFQSkl3YVBTYjZsdDlEYTVWbnQv?=
 =?utf-8?B?UXBJb1lUNndZa01BbmxPZGNMc0FvYVh1ajk5N2FBMWd3VWM5Rk81N1hXNDVt?=
 =?utf-8?B?bVhPUWJSWitvL3A5WlIySkZoYTJ4Vkg0Y29VREF5WjN4SXNmeUw2bkVkZUNV?=
 =?utf-8?B?Y012SGlCU1V5L3VIeWQrc3RxU3dWakFyM1JGbmJwa0tnZmFhRjZZMWtxOUlJ?=
 =?utf-8?B?L0UwYVVHNjZERVNFOUhwRU9sc09IZ20wWlNJMUtWRk9TRjJSUEU3QU1LYUdQ?=
 =?utf-8?B?b1JIbjFUSldHQXY2NGlBVHgzUzRVdGdMUWZFS2RYR0hFdVlxUWp4VEVGTllv?=
 =?utf-8?B?TWRBZTZPMW81N1dFSTRiZmFYMnRDSWtqUERJemhXZlBXTjdYWGNhZG51NkEv?=
 =?utf-8?B?K0d2SXVKSzQ4c1NIaVpOWkxIRlVjaWRNNHl2RlYwSm9YYnpCbjlHSGsvdmdG?=
 =?utf-8?B?NnQxVWtrVDZ4NFJCY0Q0dld3SHVhQitlclBsdGVtWUVydFZySmlFdkVNMEtq?=
 =?utf-8?B?Ti81VDhrRzFJVmRxZVhtOXZzUjhrNnNZcXdvaitlMUlpVmlDMWVmemlxSGEw?=
 =?utf-8?B?amovUUNCV3JSNmhGM0UxS2RiVEhvWHJXWEg5WVJscWp4eklMWjlYdklub3NM?=
 =?utf-8?B?UUlKeEFpWm52Ujg3T210WGM5RkcwTmFYU3ZIOUc1TmtCVEMzU3B3L24wY0Fv?=
 =?utf-8?B?MG00bjd0N01hRTVnWUVVd1RTaVl0aEIyUTZpWFY1Z211MFVQR1Q0RTkyZHB4?=
 =?utf-8?B?Z0F2d1l5dkZ0ZVU1SEtFSVJzRUkwTlRlamJaNTltMFV0cWNpRzNFby9tRkRy?=
 =?utf-8?B?bktUYjUwUHByT3RXTERxUnhRK2dXL1NYQVNOODhzTWRCWkF0TXNXL2lNMGJr?=
 =?utf-8?B?NXkrN3dpTlYwbkFnZ1dvR3NIQ3owd202TTlJRVUxVTVNZWwyS3hwbDFmbmla?=
 =?utf-8?B?MFJFRnFFdnV4YW80MEhDcVNDMGdXZDVoYkdEN3pZaXpEdlJibThQUmJZRzVX?=
 =?utf-8?B?OGh4cWQwOEU0U2lkUTNqNjRQcXhUbUZLZ3hESGdEQmRpNThwR0RaOTQwNzQy?=
 =?utf-8?B?TXpuTGRVdEhpR0R0c25BRnpMQlBjK1cyRGpTajJYQjhibElCbi9hdGNVdXp2?=
 =?utf-8?B?OGhtb0p4OEUrNFFXTnZmeXhFQXpXMG01ZW9RRUM1Mk85bGFyaXFiOHJSM24y?=
 =?utf-8?Q?GBBN+DooNWvVudlI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4D89C1FA63F3B469C5A8382CFA1F605@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pM8d3RsLO0BVzj0YOpeZivL++9ZZI7LiPkUp0a+c/+ZN1XNpWIWgFddVO4XaBw/JUykFEM1y+h7RH80Ug76f4jWy4WDYO8m86FlpBnKsYmoQULJABySnf827g0KcT4TriYzNz7Xd9YMSaCQYo+M61Nf7udNQPEdnVdkHAS0dhLwrjgn+GuHDZqyxDsEzvKnZ3STRWuZEs7bgwNIzNuxdO+1J4ePTzBbl3xtoiYJOUkEacCg04E/zoyCOezIv5vQfRnVnlJZPsygBbjJgdvJS8VxofCrn7inUDVwU9JO/I1Imv7donZwbOho0s4FmEEPzjDzz0elSbaZWp1KAp/pxNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB8241.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0b7ca3-7aa3-4469-340f-08deeb9d0cfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 05:08:09.2978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pk4mNEUuSz8Sdd2HN8pKDlPnYOtEafs/XEl0FWWKrRQO3/WGwu0vv3OWiJuSz7FGOZHZDj9bW3rIfnHzXyX67w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9638
X-MTK: N

T24gU2F0LCAyMDI2LTA3LTI1IGF0IDE1OjEwICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBTYXQsIEp1bCAyNSwgMjAyNiBhdCAzOjAy4oCvUE0gTGludXMgV2FsbGVpaiA8bGludXN3
QGtlcm5lbC5vcmc+DQo+IHdyb3RlOg0KPiANCj4gPiBBbGwgcGF0Y2hlcyBhcHBsaWVkLCBJIGhh
ZCB0byByZWJhc2UgcGF0Y2ggNS81LCBwbGVhc2UgY2hlY2sgdGhlDQo+ID4gcmVzdWx0IQ0KPiAN
Cj4gTm90YWJseSBJIGhhZCB0byBhZGQgc29tZSBsaW5lcyBmb3IgTVQ2ODU4Lg0KPiANCj4gWW91
cnMsDQo+IExpbnVzIFdhbGxlaWoNClRoYW5rcyBmb3IgcGlja2luZyB1cCB0aGUgc2VyaWVzLCBh
bmQgZm9yIGNvdmVyaW5nIE1UNjg1OCBpbiB0aGUNCnJlYmFzZS4NCg0KSSB3ZW50IG92ZXIgeW91
ciBNVDY4NTggYWRkaXRpb25zOiB0aGUgS2NvbmZpZyBlbnRyeSBtYXRjaGVzIHRoZSBvdGhlcg0K
UEFSSVMtYmFzZWQgb25lcywgYW5kIE1PRFVMRV9MSUNFTlNFKCkvTU9EVUxFX0RFU0NSSVBUSU9O
KCkvDQpNT0RVTEVfREVWSUNFX1RBQkxFKCkgYXJlIGFsbCBpbiBwbGFjZS4gTm8gTU9EVUxFX0lN
UE9SVF9OUygpIGlzIG5lZWRlZA0KdGhlcmUgLSBwaW5jdHJsLXBhcmlzLmMgZXhwb3J0cyBpdHMg
ZW50cnkgcG9pbnRzIHdpdGhvdXQgYSBuYW1lc3BhY2UsDQphbmQgbXQ2ODU4IHJlZmVyZW5jZXMg
bm8gbmFtZXNwYWNlZCBzeW1ib2wsIHNhbWUgYXMgdGhlIG90aGVyIDEzDQpQQVJJUy1iYXNlZCBk
cml2ZXJzLg0KDQpCdWlsZC10ZXN0ZWQgZGV2ZWwgd2l0aCBhcm02NCBhbGxtb2Rjb25maWcgKENP
TkZJR19QSU5DVFJMX01UNjg1OD1tKToNCmRyaXZlcnMvcGluY3RybC9tZWRpYXRlay8gYnVpbGRz
IHdhcm5pbmctZnJlZSwgYW5kIG1vZHBvc3QgaXMgaGFwcHkgLQ0Kbm8gbWlzc2luZy1saWNlbmNl
IG9yIG5hbWVzcGFjZSBjb21wbGFpbnRzLCBhbmQgdGhlIE9GIGFsaWFzZXMgZm9yDQptdDY4NTgg
YXJlIGdlbmVyYXRlZCBhcyBleHBlY3RlZC4NCg0KT25lIHRyaXZpYWwgbml0LCBpbiBjYXNlIHlv
dSByZWJhc2UgZGV2ZWwgYWdhaW46IHRoZSBhdHRyaWJ1dGlvbiBsaW5lDQppbg0KNS81IHJlYWRz
DQoNCiAgW2xpbnVzd0BrZXJuZWwub3JnOiBSZWJhc2VkIGFuZCBhZGRlZCBNVDY4NTh9DQoNCndp
dGggYSBjbG9zaW5nIGJyYWNlIGluc3RlYWQgb2YgYSBicmFja2V0Lg0KDQpUaGFua3MsDQpKdXN0
aW4NCg==
