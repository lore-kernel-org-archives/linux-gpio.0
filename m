Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021113.outbound.protection.outlook.com [52.101.65.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AEE4D9557;
	Mon, 28 Sep 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.113
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604673; cv=fail; b=R4/r5hXSGaQc/J31bvayknvmOhiVioLzkX/4fQHLqzOfL/PX0ZsUh3iMDoRBopgwnOkL2O8xvphzus31/+QeQ1u72BUPH+mV0w4+Tq1OW37Pr5K5Q6TYg90AfDsO0yE9/AS19QcGlyqHzYxbgFtureliBSSyo3tgzQXrPZjL/K8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604673; c=relaxed/simple;
	bh=favqSkzCHAsqp+YMyQUvghyg+IzclXeXjlKr6ZwQdrY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iqMj1TrSajB/p07fQ1V6kSd7ZYhU9n0jU7bqreIHk5L3nW+wA8EGgS5CunN/1957U+7dTrRu7Sd9V6BBQSreDSdJCtjNl/hwmPtJ49wC5dA06cB/mGydZrjhlSvheu95eDobClJkOC/no2qeVFnTDyFGayZFeiIjNOKs4sEGnQ4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=gMRDjqzN; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=gMRDjqzN; arc=fail smtp.client-ip=52.101.65.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="gMRDjqzN";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="gMRDjqzN"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cqObWM3HqHtVE3Iotcz3rG+47U2NCFXvfCwCJsaINzcslCiZHFXqehL1hZSQ670s6IrbGLlc7dQlmZYhd61b0PqvNB4ejIduQdZy0bWAQuEHnW7p5FgcoU4JVPlfjnaBPjMntn/KKTpTRaO2ydMYENKe+guBnBDc0vsK90s1s9CRUb0thhI/NKoAQK6AXskNehG0JClGLdMXBxFPOQmrZYNUy/NbYqE2+Pq7ZOlztaiLPi0VimXrWg+Fb1ImDZMP8EWKWPbkuWJJ9nerLs0iF/kNhM2q5gqC3Wkh46GyRf1fWaOYH7CmWMnMAtBxob/bILbzZJ8OzE2HRDm1069qdA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=favqSkzCHAsqp+YMyQUvghyg+IzclXeXjlKr6ZwQdrY=;
 b=k8z6owB+a2RBX1Jm03JghKIt/r46i+0ZWKEk65lz7GSB6J01Tr4JJHvy2HOGbYCGSCdoJX5XzUXM8PgsyJcWxau8bizFRjaDk03OvhYOYBi4lGeqnPBxJkO214F1BlP5GVNMZ1Q/4TEcjeR+h7TFxsfPMcmBO6pXn3s2xTWVEuM+C8grxGZPMvwo4rvvEq/s3PQkY93YOyrnyRusDpkZ3CpKRqNaYfCP4zd9gTxMun7vD7c4mqzlgrUvUAQKb6P4b7vif7xs2paxiOWQa+/C1bmHaJQsZsE2XQ6298SPZomLP4av2CjP+hUwV3nWehqdjyowDlG6jebqxAAKrvUAqw==
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
 bh=favqSkzCHAsqp+YMyQUvghyg+IzclXeXjlKr6ZwQdrY=;
 b=gMRDjqzNgkihrI3fzGlrdaA2op+btjCExM6zbfe2hadHslgwab+n6z2M31RrDhUF/Zv+6K8zttrjfkpIvWMKoPTY0IutJnMp4TyCTnRJN4mcIc57TE9PrVWKNpTiJn5zqrlOJ7gL2GP2Mc8PBYkx1imworOyUnFjgLHYfbeNCtgrJDIDm6fuGNGfw+iyP9JNQiRwduHocmvGeWr3FJmMfTS9Q4bSaFUp8/V6LP6fQ6pI8amxd15i6hp4FTVj+9jrbLeGd/ALSwjyYQByi6GXbrW2u+QUDfh7rUbJ3b+HmqON2BNyCZ3oJRYpMybs+ZQefD62tNLoMjDbIntljxmGNg==
Received: from DB9PR06CA0027.eurprd06.prod.outlook.com (2603:10a6:10:1db::32)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:11:04 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::81) by DB9PR06CA0027.outlook.office365.com
 (2603:10a6:10:1db::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 14:11:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:11:03 +0000
Received: from emails-4578647-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BAC6A804E6;
	Mon, 28 Sep 2026 14:11:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790604663;
 b=Md1/xS7s8cL6BFe0vqKXO3hIkErkpxhU2/UeSXG3GJoEj2TEz13WlRnjRm7qwtATjmbGS
 +ghMC04zbPfohy3Uv4Voq7VvzaAk+SOJ9H/uw4mG+meccKwxBr6HKWiGB846X9/SA6SgLuo
 KMd3NmzEP+xIBKTz+VyrigYdA+V/kBo=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790604663; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=favqSkzCHAsqp+YMyQUvghyg+IzclXeXjlKr6ZwQdrY=;
 b=SzekEuFktlTYtJozh9T2lGGFKIEQVEobA/rXLFyyE7rCU3EX9JVe0CTxC67E0mbm/ERcL
 qxeqFLGKs2kf8INDbcsmkS0e8+I9CEetvS7O+wdBnb/OofW9RwtegagVZFcWa+xuEKCobZJ
 pZ84R7kHuQkAf5AKa4YZoJhuj8YgDrY=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=favqSkzCHAsqp+YMyQUvghyg+IzclXeXjlKr6ZwQdrY=;
 b=gMRDjqzNgkihrI3fzGlrdaA2op+btjCExM6zbfe2hadHslgwab+n6z2M31RrDhUF/Zv+6K8zttrjfkpIvWMKoPTY0IutJnMp4TyCTnRJN4mcIc57TE9PrVWKNpTiJn5zqrlOJ7gL2GP2Mc8PBYkx1imworOyUnFjgLHYfbeNCtgrJDIDm6fuGNGfw+iyP9JNQiRwduHocmvGeWr3FJmMfTS9Q4bSaFUp8/V6LP6fQ6pI8amxd15i6hp4FTVj+9jrbLeGd/ALSwjyYQByi6GXbrW2u+QUDfh7rUbJ3b+HmqON2BNyCZ3oJRYpMybs+ZQefD62tNLoMjDbIntljxmGNg==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GV1PR04MB10943.eurprd04.prod.outlook.com (2603:10a6:150:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:10:53 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:10:53 +0000
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
Thread-Index: AQHdPGRvvl5HIwf1q0aLlPqTxmg9drbcWVeAgAfUOIA=
Date: Mon, 28 Sep 2026 14:10:53 +0000
Message-ID: <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com>
 <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|GV1PR04MB10943:EE_|DU2PEPF00028D02:EE_|VE1PR04MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c109654-4015-46cc-4688-08df1d6a54f0
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|23010399003|18002099003|22082099003|3023799007|38070700021|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 kabQ8K3bl91PncHyG2l+9lKcWt1KGcae65CuqR1OiMf7HZqQ7e6zwpRHIMOeI67qYAo0dy1DCA4m2Psjr+Glg1jbMBQB+Cj63d4X8k3CzsYnIfu7weiaTBHJ0AJGj/m+OKo8QOA52CASZRUGAyuJeTJXTt/zT5n2P2J0m69epa57wIvj+AEIgXWShLmr/44pDB//45XTadTkuRTtaI+mR52SVo+W6HYswV/ZCeXkgI1U91F86jpnASwbhe6+hWbALptTGGTvy0tux+VKCLIOjSHwZ0NoAnKdORRt04wCZw+7vsEY33bV7+mnwr++E6Cbv9vCvBs8LESsGqoko3ZFw2mVG8Ud7kcFhhyJMrDAVJe1dd7g2CZ22PSCDqa4wuvULJGbk8kBZhMNPqyMEhphzEn4YMQy7gZB1NN2rKHBiI2BBBZQIqlr7x2gZgA02zP/f6tkwKqUgberHPXAAPSBKFl1cLpnbnOPnyed9yEv+KhFkV3XxNAUqV6A8hZrChL56SSFboP1zf0C3MsWx4UOHH/PuR7vUaZMdsRYJ8XChLKj3wArHJA1Odx8E+X18Zb9szZa8p811vRGD75y8eeMgvEXwhGfyHaoLJr3lKL1iLEDYOHwpaxRpVTvr+yiZsiyLej/imJmS4xfgJ2ntggjyon62Xcmh4GhJlwIPO3u5xI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(23010399003)(18002099003)(22082099003)(3023799007)(38070700021)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2C241C7D6D91F47AE502CF5935A6D2C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 QPZi1+G5YS/WlJ4Bijut7krnT6mg3AEnUG+wKU76aILJI+0ZkLlTB1JUD82fsUCFQ4ulcjJIFtNmQ8j6PFU5J1bJXxhwwYWYNfkGDhlmzUqgTs53V3r1mwyec8S3fCsEW+x7hfsmAheCMM0eVQd+/1121Tqnd385CdsG6Kl+7thzT9C4vVPqa1avDLDEkk+tkYGIkQ8IeOjbPoAmLGT5QwWU/TEHYJp0rkPSTNQQFlBwKQRVgG4G/Rud7TU7HhD8dGfs+YfMdNngHjO+TCqbLPH1D5fcM/aM++bs1cpe4zvq6sCeE6Jjc4I0mr/MzJG45WkXH066AYwB5esDnBqFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10943
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: cf867ea5c08744fea8f2cc2a320bf61c:solidrun,office365_emails,sent,inline:3e0610331c603246cba0de88078a76e6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9HD341fomF8eWjzFgTeGo2iDSgLjoSlKpMz836sBcROvEho6ifdNZCgtSIWaFKtplHUO/SF4Kvex7/hIBPwxYQcfhzv36szIeHA/qGrn9ORusajkRmucD1fFrEGs/MJzRNalqOgXg0wauW3UYIXP3QhHZaQ8UKTjqO3bdnlSIyaSwnlZ7jknbmXmk7Q2/rxa0RnoYzgi0XVIrvlH8r/0ztwNpAd+XV0/9YY2OPIoOTImJaMX9AylNnGJucqZUmWmJvyKVDtL8iFXwgicnpfUvnHdOLAIec7q9S7tro7wbkVmapJzKmYCLTvp/KdsP9JDVDjyvOoSNe8QKWx4jNpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=favqSkzCHAsqp+YMyQUvghyg+IzclXeXjlKr6ZwQdrY=;
 b=Q3JEBb+TpK/IHH7J7UE5FgNZRMugtqkY5BZK2o7qdfWrqK2V49Gk+sh1+Q7dixehrZ+bKnWKbDhcoQLY7jedif+SOr9W1ohRAmD8n0XoYnPLxjwHXXLBiXo6zK/JwbXenEwNlF8X2QWuKqZYO0jy83iYIh9v8e88NcXnMVxwo4sjOtNwooVjqvOdzl3qReWDnh1lNgIYGDE0MPSXmyczKllzJwgYDXdUwg16yVi5IhWkUea4K0uxANywPFbLs8PPY50RUhl6833Qld3rJOJmUfURGYtPpLjJyku3AwUNgtotop1Cdco4HYndYJs9awH3xCjcx5Fi8xOFK4Bp19SfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dadfef49-1358-4049-83f4-08df1d6a4e9a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|23010399003|36860700016|14060799003|7416014|376014|82310400026|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VqypTAQD/UdWp8l6qkJdiza0bZOkh+u/3PP3wbKkOzLdLGLuIs7JjHQu2es+rEYb/WLIH6D44LpTY6dh833z/qwiL0IN05wR8YkhtEc+Kqf6VJgCxh9i0dPGJK6O4/r5NK+9Y7tVYZ4CMONcagLFNklBKLI86gXVVMnZ76DGo4qyUjhScow3r4/RG4LOS8+CcsqeLQ/fDZ0KvEtlXBGYUw7ZxDlmbxN8REASg6YqKO4OmxrnUAcXQJjZQVHXd9KAnb7y+6qvBHwaSoLHSfD6VUjVEKmbO7+826ThP+KhInRL5tb6xS+vxvLmAF4nbBQInrjY8UR3nwmUtl6biamksA4d0WNxziy2y2OdgDdUgEKKOm64L1FMncoSo4ItBRrP3eRTwpD+Q7oRXTNRKr4QInG09BV3YkJxdT9VUfsKWfDVWfAPIBALbhEql0ZJl7lU5mWmCoOOHckZPeCj2bfVL84Kde6bdguUtSwqpSjDnIoxmG5GFU/tMl46DKU77IoR8zylJrb1SXohLQlzGSMoDlpz7pmD6zpIACFxLnHgNjsFSO9+q+CocjYT9B4iAiOfI00BjPcSbGElJT10WF1Z2xABNcgmVrnzmK0CXfysjPZiOSUCif3cIU7O4UH620og6H0x0D3evUIf9D9bX6LH7w1rrB/ZcrmQzw5vJ1zbTz0=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(23010399003)(36860700016)(14060799003)(7416014)(376014)(82310400026)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3HUf6yxryHXHrLVeIGW7JE6FN50VmyyJzMi9/mJ3CERv9ZMO14HHBgOwioPtNgD62UFnoHJip7usJZqXGf6td508vlsVE4QUXL6EDh6HuQbJvIPa/F/v821x1pCSXJYmGSOI/k98CadGRa8CJwpB8yqqtXUM2b2ihXDJ4MN3pCGiPQqZeQSSjursYkeCRXf62JmB/sL1eZnJ/HEmCi/1c7H3jivkkdlJg3stdGCpU1ftz8VtEQlIrwHS3A/2spQztvIePBHmo3juAo8gWbpANiyFalyAFpdJXWSh62g6P6Z8VOfwJZoEL9PneMZLHhAHl2J9Sc+3ztpIPUfDo4xo6j1DUJq9E5w7QA/gh7+uRuNei2Fj1TlTLKtidrHfLytdpU/ObtbQ81jmqZE6oTpwwayug2vZ4Hwv2E/95hIewaBjH4w6qTDAgA5UJT5QdkU4
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:11:03.8228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c109654-4015-46cc-4688-08df1d6a54f0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280

SGkgR2VlcnQsDQoNCkFtIDIzLjA5LjI2IHVtIDE2OjM3IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9l
dmVuOg0KPiBPbiBGcmksIDQgU2VwdCAyMDI2IGF0IDEzOjU2LCBKb3N1YSBNYXllciA8am9zdWFA
c29saWQtcnVuLmNvbT4gd3JvdGU6DQo+PiBBZGQgc3VwcG9ydCBmb3IgdGhlIFNvbGlkUnVuIFJa
L0cyTCBTb00gWzFdIG9uIEh1bW1pbmdCb2FyZCBJSW9UIFsyXS4NCj4+DQo+PiBUaGUgU29NIGZl
YXR1cmVzOg0KPj4gLSAyeCAxR2JwcyBFdGhlcm5ldCB3aXRoIFBIWQ0KPj4gLSBlTU1DDQo+PiAt
IDEvMkdCIEREUg0KPj4gLSBXaUZpICsgQmx1ZXRvb3RoDQo+PiAtIFNESEkgTXV4IHN3aXRjaGlu
ZyBiZXR3ZWVuIGVNTUMgYW5kIENhcnJpZXIgQm9hcmQNCj4+DQo+PiBUaGUgSHVtbWluZ0JvYXJk
IElJb1QgZmVhdHVyZXM6DQo+PiAtIDN4IFVTQi0yLjAgVHlwZSBBIGNvbm5lY3Rvcg0KPj4gLSAy
eCAxR2JwcyBSSjQ1IEV0aGVybmV0DQo+PiAtIFVTQiBUeXBlLUMgQ29uc29sZSBQb3J0DQo+PiAt
IG1pY3JvU0QgY29ubmVjdG9yDQo+PiAtIFJUQyB3aXRoIGJhY2t1cCBiYXR0ZXJ5DQo+PiAtIFJH
QiBTdGF0dXMgTEVEDQo+PiAtIDF4IE0uMiBCLUtleSBjb25uZWN0b3Igd2l0aCBVU0ItMi4wICsg
U0lNIGNhcmQgaG9sZGVyDQo+PiAtIDF4IERTSSBEaXNwbGF5IENvbm5lY3Rvcg0KPj4gLSBHUElP
IGhlYWRlcg0KPj4gLSAyeCBSUzIzMi9SUzQ4NSBwb3J0cyAoY29uZmlndXJhYmxlKQ0KPj4gLSAy
eCBDQU4NCj4+DQo+PiBEZXNjcmlwdGlvbnMgZm9yIGVNTUMsIG1pY3JvU0QgYW5kIFJTNDg1IGFy
ZSBwcm92aWRlZCBhcyBvdmVybGF5cyBkdWUgdG8NCj4+IHRoZWlyIGRlcGVuZGVuY3kgb24gY29u
ZmlndXJhYmxlIG11eCBzdGF0ZXMuDQo+Pg0KPj4gWzFdIGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5j
b20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVuZXNhcy1yei1mYW1pbHkvcnotZzJsLXNvbS8N
Cj4+IFsyXSBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90
L3JlbmVzYXMtcnotZmFtaWx5L2h1bW1pbmdib2FyZC1yei1zZXJpZXMtc2Jjcy9odW1taW5nYm9h
cmQtcnotZzJsLWlvdC1zYmMvDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpv
c3VhQHNvbGlkLXJ1bi5jb20+DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4NCj4+IC0tLSAv
ZGV2L251bGwNCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1odW1t
aW5nYm9hcmQtaWlvdC1jb21tb24uZHRzaQ0KPj4gKyAgICAgICBhbGlhc2VzIHsNCj4+ICsgICAg
ICAgICAgICAgICBncGlvMSA9ICZ0Y2E2NDA4X3U0ODsNCj4+ICsgICAgICAgICAgICAgICBncGlv
MiA9ICZ0Y2E2NDA4X3UzNzsNCj4+ICsgICAgICAgICAgICAgICBncGlvMyA9ICZ0Y2E2NDE2X3Uy
MDsNCj4+ICsgICAgICAgICAgICAgICBncGlvNCA9ICZ0Y2E2NDE2X3UyMTsNCj4gVGhlIFRDQTY0
eHggZHJpdmVyIGRvZXMgbm90IHNlZW0gdG8gc3VwcG9ydCBncGlvIGFsaWFzZXMsDQpJIGhhdmUg
Y29uZmlybWVkIHRoaXMgbm93LiBNeSBleHBlY3RhdGlvbiB3YXMgdGhhdCBzZXR0aW5nIGdwaW8g
YWxpYXNlcw0KaGVscHMgbWFrZSAvZGV2L2dwaW9jaGlwIG51bWJlcmluZyBwcmVkaWN0YWJsZSwg
aG93ZXZlciB0aGlzIGRvZXMNCm5vdCBjdXJyZW50bHkgd29yay4NCj4gc28gcGxlYXNlDQo+IGRy
b3AgdGhlc2UuDQpJcyB0aGlzIGEgZ29vZCByZWFzb24gdG8gZHJvcCB0aGUgYWxpYXNlcywgb3Ig
YmV0dGVyIHRvIGRlZmluZSB0aGVtIA0KcmVnYXJkbGVzcz8NCj4NCj4+ICsgICAgICAgICAgICAg
ICBpMmMzID0gJmkyY19leHA7DQo+PiArICAgICAgICAgICAgICAgaTJjNCA9ICZpMmNfY3NpOw0K
Pj4gKyAgICAgICAgICAgICAgIGkyYzUgPSAmaTJjX2RzaTsNCj4+ICsgICAgICAgICAgICAgICBp
MmM2ID0gJmkyY19sdmRzOw0KPj4gKyAgICAgICAgICAgICAgIHJ0YzAgPSAmY2Fycmllcl9ydGM7
DQo+PiArICAgICAgICAgICAgICAgcnRjMSA9ICZwbWljOw0KPj4gKyAgICAgICAgICAgICAgIHNl
cmlhbDMgPSAmc2NpZjM7DQo+PiArICAgICAgIH07DQo+PiArICAgICAgIHZfMV8yOiByZWd1bGF0
b3ItMS0yIHsNCj4gUHJlZmVycmVkIG5vZGUgbmFtZSBpcyAicmVndWxhdG9yLTF2MiIuLi4NCkFj
aywgd2lsbCBjaGFuZ2Ugd2l0aCB2OSwgc2FtZSBmb3IgcnpnMmwtaHVtbWluZ2JvYXJkLXB1bHNl
LWNvbW1vbi5kdHNpLg0KPg0KPj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxh
dG9yLWZpeGVkIjsNCj4+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICIxdjIiOw0K
Pj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEyMDAwMDA+Ow0K
Pj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDEyMDAwMDA+Ow0K
Pj4gKyAgICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgICB2XzNfMzogcmVndWxhdG9yLTMtMyB7DQo+
IC4uLiAicmVndWxhdG9yLTN2MyIuDQpBY2ssIHdpbGwgY2hhbmdlIHdpdGggdjkuDQo+DQo+PiAr
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOw0KPj4gKyAgICAg
ICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gIjN2MyI7DQo+PiArICAgICAgICAgICAgICAgcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+PiArICAgICAgICAgICAgICAgcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+PiArICAgICAgIH07DQo+PiArJmky
YzAgew0KPj4gKyAgICAgICAvKiBoaWdoZXN0IGkyYyBjbG9jayBzdXBwb3J0ZWQgYnkgYWxsIHBl
cmlwaGVyYWxzIGlzIDQwMGtIeiAqLw0KPiBXZSBoYXZlIGEgRFQgcHJvcGVyeSBmb3IgdGhhdCA7
LSkNCj4NCj4gICAgICBjbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsNCj4NCj4gU2FtZSBmb3Ig
aTJjMS4NCg0KSW5kZWVkOg0KDQphcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc3It
c29tLmR0c2ktJmkyYzAgew0KYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNyLXNv
bS5kdHNpOmNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3J6ZzJsLXNyLXNvbS5kdHNpLXBpbmN0cmwtMCA9IDwmaTJjMF9waW5zPjsNCg0KYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNyLXNvbS5kdHNpLSZpMmMxIHsNCmFyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zci1zb20uZHRzaTpjbG9jay1mcmVxdWVuY3kg
PSA8NDAwMDAwPjsNCmFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zci1zb20uZHRz
aS1waW5jdHJsLTAgPSA8JmkyYzFfcGlucz47DQoNClRoZSBidXMgaXMgZGVzY3JpYmVkIGluIFNv
TSBkdHNpLCB3aGVyZSBHMkxDIGhhcyBhbiBlZXByb20gb24gaTJjMCwgYW5kDQpHMkwgaGFzIG9u
ZSBvbiBpMmMxLg0KDQpUaGUgY2FycmllciBkdHNpIHRoZW4gZXh0ZW5kcyBlYWNoIGJ1cyB3aXRo
IGFkZGl0aW9uYWwgZGV2aWNlcy4NCkkgZm91bmQgaXQgd29ydGggcmVzdGF0aW5nIHRoZSBjb25j
bHVzaXZlIHJhdGUgaW4gY2FycmllciBhcyBhIGNvbW1lbnQuDQoNClNvIEkgd2lsbCBrZWVwIGNs
b2NrLWZyZXF1ZW5jeSBpbiB0aGUgc29tIGR0c2kuDQoNCj4NCj4+IC0tLSAvZGV2L251bGwNCj4+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zci1zb20uZHRzaQ0KPj4g
QEAgLTAsMCArMSw0ODAgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArLyoNCj4+ICsgKiBEZXZpY2UgVHJlZSBTb3Vy
Y2UgZm9yIHRoZSBSWi9HMkwgU29saWRydW4gU29NDQo+PiArICoNCj4+ICsgKiBDb3B5cmlnaHQg
MjAyMyBTb2xpZFJ1biBMdGQuDQo+PiArICogQ29weXJpZ2h0IDIwMjUgSm9zdWEgTWF5ZXIgPGpv
c3VhQHNvbGlkLXJ1bi5jb20+DQo+PiArICovDQo+PiArDQo+PiArI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2dwaW8vZ3Bpby5oPg0KPj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJs
LXBpbmN0cmwuaD4NCj4+ICsNCj4+ICsvIHsNCj4+ICsgICAgICAgYWxpYXNlcyB7DQo+PiArICAg
ICAgICAgICAgICAgZXRoZXJuZXQwID0gJmV0aDA7DQo+PiArICAgICAgICAgICAgICAgZXRoZXJu
ZXQxID0gJmV0aDE7DQo+PiArICAgICAgICAgICAgICAgZ3BpbzAgPSAmcGluY3RybDsNCj4gVGhl
IHBpbiBjb250cm9sIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IGdwaW8gYWxpYXNlcywgc28gcGxl
YXNlDQo+IGRyb3AgdGhpcy4NCj4NCj4+ICsgICAgICAgICAgICAgICBpMmMwID0gJmkyYzA7DQo+
PiArICAgICAgICAgICAgICAgaTJjMSA9ICZpMmMxOw0KPj4gKyAgICAgICAgICAgICAgIGkyYzIg
PSAmaTJjMzsNCj4+ICsgICAgICAgICAgICAgICBtbWMwID0gJnNkaGkwOw0KPj4gKyAgICAgICAg
ICAgICAgIG1tYzEgPSAmc2RoaTE7DQo+PiArICAgICAgICAgICAgICAgcnRjMCA9ICZwbWljOw0K
Pj4gKyAgICAgICAgICAgICAgIHNlcmlhbDAgPSAmc2NpZjA7DQo+PiArICAgICAgICAgICAgICAg
c2VyaWFsMSA9ICZzY2lmMTsNCj4+ICsgICAgICAgICAgICAgICBzZXJpYWwyID0gJnNjaWYyOw0K
Pj4gKyAgICAgICB9Ow0KPiBJIGRpZG4ndCBjb21wYXJlIHdpdGggdGhlIGJvYXJkIHNjaGVtYXRp
Y3MsIGJ1dCB0aGUgcmVzdCBMR1RNLg0KDQpUaGFua3MhDQoNCg==
