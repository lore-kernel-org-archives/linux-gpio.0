Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022130.outbound.protection.outlook.com [52.101.66.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60F14DEC1F;
	Mon, 28 Sep 2026 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.130
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606487; cv=fail; b=fOEFgpYjIRFYADh9wr9ym7dnfi0pPp2+JBY5FiBOdUu6X7tEVecMQyltx7wRhiwqkj1rT79Rdq0tEQ+KmjRTndSePKxpIETVANTEdXopswlGqf2yZbjZFmv5lEfk5aq5SGqouCCcSaTXOrndFkF/11c2Fosv89YW1diB/TG1fbo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606487; c=relaxed/simple;
	bh=9s4xYP4Hi/j1le7Faa19aJfrQ7593s3Bq+QF/lfJGTc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WbectAGiWb+J7n1a9lB/C9iSBCNppAmcSMjXpobB8caZFHpI28xpHokMK2AA5ZONQI16YV+kVDyU63XjXbk/TQkK8RISHFshiO5xZITu0Mj4rQ0Ib1KQoXP+1etbD7/pfM5UhbeQYsYPXXR6xFL8kTCkreQPUn3C6+fHWNh8HbM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=RNSokgRT; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=RNSokgRT; arc=fail smtp.client-ip=52.101.66.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="RNSokgRT";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="RNSokgRT"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yV8kSxYDx5vkJ8owhSiRIsbkhL243Rymqse85WAhsNbDyUfJX+/6G4JaaL2AluF3G4P1fGDdJre3PwJoA/Oqih7ONrDowcuyWQKRGriD4axwarOgELo8lXQXh9tXErKenVIBUeydx7aTtBAAhCnWnySYlp59SnC1pRloYwHnof43/aAXB2y5/uxzvsAQkk2Zy8V9l5RuasNQq1lgQNHG56QT19OtlAeDcTPfiuqBkJ29CaReKzECkod2ux1zQWKiZGlRVPfPhhw0i7EV24f/rC/08CGLQFWWULf4vd28+4cPvK1s7S0xzy2YRnLCgTsOz32raA6GL4Iipt4FRbLv3Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9LqKLnAhqkN3snDNYYsA2xURrxY9nyVXuh6f0hoj3Y=;
 b=pfcMytLsWYZjkHns4kBzEr1IFhL/SRoO0Se1jTEJeTH6jsm1QUuosNigVckM3/CtB5rCOoQFuOVtgVwsUW3tiMcv+2hbRiejXzp4XH29oX1qOIPgg67/QupydOLvidNb5D9s9RBPnZ6gyX1p0iYSQ3pXdF+ooe2INsGQCHGhPTT5kALL/lQDszktYQruImfgwjs7Pj7FRYtD5aMREFPcGJrzAEGtVztJ8meoQTv1vNoeoL0QPjDHdKMzjSDOwOyjyTMGY0JyL4CER8W9Qr+4eQbSl1JK8EkdvyCQHcjWRam8M+hMuOrmRkB+YFUGtEc2uStALX78KoOIaR/T8N/n9g==
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
 bh=Y9LqKLnAhqkN3snDNYYsA2xURrxY9nyVXuh6f0hoj3Y=;
 b=RNSokgRTXQhX6ZpKcHpDi/Yb616eEmkm0l4JuHW7h286BZMbmRy5/DJkuWCz97I9BLHbzeI/n9efj1f1DtqXPk1t11RjB/hj00JeUilJcA8yT43zFjyNlJ6faa0YQXhFGLzQY0nJ4z2rqYIQBKHyGnqEXiqQd1yRrF364+3CFrPwMZgjZ7YRTqFLT1abJ8Sv+ncnscsG8zgjtEdGvR1J1841bnEhPEWYHqwbwpPUCKLU3yqOULATfAHrpDA6REPWBRkc+kUgZ8vZXIMXciNxcJ9Dp2vKtBtEuryJcGJi2aqJA8GoD7d8McRK/e4y1jC8qQx+j7ldA+OVgfgamM21ZQ==
Received: from AS4P190CA0061.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::22)
 by VI0PR04MB10462.eurprd04.prod.outlook.com (2603:10a6:800:231::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:41:12 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:20b:656:cafe::88) by AS4P190CA0061.outlook.office365.com
 (2603:10a6:20b:656::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 14:41:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:41:12 +0000
Received: from emails-3049601-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 48C0180558;
	Mon, 28 Sep 2026 14:41:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606472;
 b=ISeOA/Yut92Iw9TvwcoY23BJmyFPgv4H+5SVVgzQA16kfpHmKwfynwTAv1PIWHNUWyt91
 kSKFQZcIQ7iEBkN0BbL6SAsXEnI4OqTUjwtywVhcng0kyKheJlfU04OI5Vl0+rboOHDsiKx
 hhMzGdnjalvTexskPjZBkAMHe2+TNlE=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606472; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Y9LqKLnAhqkN3snDNYYsA2xURrxY9nyVXuh6f0hoj3Y=;
 b=UfgnimXT1rXqfA3ZTbCo0FB/O2DE5fGgpyd4jPQZbJlrkGIxEIwrbnjoa2aNws9aai1Vz
 pqpy2XkxN9bLmTYS187VGyvdTAzN/IawE/Jnf5xhglZo2TSkVOqG3isngM1ufKy4vILZIiH
 TmGUSocUcd42E4CST4ieczC/eVbFIxo=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9LqKLnAhqkN3snDNYYsA2xURrxY9nyVXuh6f0hoj3Y=;
 b=RNSokgRTXQhX6ZpKcHpDi/Yb616eEmkm0l4JuHW7h286BZMbmRy5/DJkuWCz97I9BLHbzeI/n9efj1f1DtqXPk1t11RjB/hj00JeUilJcA8yT43zFjyNlJ6faa0YQXhFGLzQY0nJ4z2rqYIQBKHyGnqEXiqQd1yRrF364+3CFrPwMZgjZ7YRTqFLT1abJ8Sv+ncnscsG8zgjtEdGvR1J1841bnEhPEWYHqwbwpPUCKLU3yqOULATfAHrpDA6REPWBRkc+kUgZ8vZXIMXciNxcJ9Dp2vKtBtEuryJcGJi2aqJA8GoD7d8McRK/e4y1jC8qQx+j7ldA+OVgfgamM21ZQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:54 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:54 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:37 +0200
Subject: [PATCH v9 09/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzv2l som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-9-5901e0fc9e44@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|DB1PEPF000509F2:EE_|VI0PR04MB10462:EE_
X-MS-Office365-Filtering-Correlation-Id: 41096a2f-d330-41f3-fec4-08df1d6e8ae8
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 yLn6Yz0/5jO+RrR7LH3ZrPT4xOps9KE5M4YJv/roQNEV97l48dRa45qs53sT+GRTJdq9LKNZiIR21QXTkRc91+1flz7sxd80Ur56BCDX8FFSiCeWFVfR/bi6FwOBn1zeA9B7lJU2Bwch9yHLFtr9xIs/HqnjqCr2hNM/rBru2jVcBibASDsGdPd+T+d+tjNr9B8lDe8i6qyEIl3KuOszoZmDuKox7W6OnfFeBigHtKUawUosWY8v4DgWs1uK7d0d8ytQ+Hfif8TCi3Cor7cJGZgbdy3f4mOEVjyRDisfUdMZrhFwS18X1LsEj861TkK4cPSeoYiz2zQq6c3bDXuQ1OzJNcfY31n/XGw44ewlAHsmU3iKn8ZBJKWtIXyigyeZu0LmnhKehrkUQnDeQ1cTCTYG6TEC5tdq9hEcFakmjcVRVKuXOmAqXrB0u5xgu897rFslj/6+y4TQD536hTEokE4nBoQcx3YXzYEmYrGZduxXtEoSWTvWwUfpUYrkRhTImbOa+RmHR3biBYi+zwUWuCMxIplLqKKXJWLHC3u9O9QfjfsDwRa7qhWCmXjsDICIBE9a9EYvYhIRUrZs/PEaQbBxif1cJnSIKv2I73L3Pc0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 PJYANsevPtKJYbIBLeeNnJWL+fvrNrMks7MHv3yHMu2WGHHDTmEKY0cN9jD1YfY4BirVI5TXctPAogiC4lbmkOf4uhXH3GPd3Yfj8+j5+B2xJZ+UcAPabSQJuLK/5GVLA9RqdznZTtaDYbGvTxrUHva+rWeFtUCLI3m8us1mpODL2bxXF0eook4yxF0DxT49geMmlZy65MUHvoEWPwhCI25I/FYSbEYnbJJUOfBRL1MWtlY0SZYRZeV5ylJU9KA2XpHZqBDBcGCg26222J163Id3PXjetXHK2gIqCxwF77OnSWnM85IfRNln8OLwHWHcac7xZI+SlJOChdJBTdEk+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e806a394220c4a3d9ea651376bb4f578:solidrun,office365_emails,sent,inline:ccac836d61caefcbefa3c2641c859a8b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTkXdkzgdUh4Ww3XecABIf300NpvKrtviL+FeQg39xnGEM+b9V46WAQnAxbfoD2RCywSTeD86jY8+HZtMStLrkZK/JBXMtDscEjm1t3zeX8Wieap5p1nvdZaTRM6D1pL+QYa79d7tSGvOLWr84PsOppOKGH8Hs7a8Qf3Vjnpiqd2vWI3hih67y4Z/LHhqzMZvj1tfRY9W5LQFRM+tFzZztSstVxcu6pOcZ1BVYiUqjTN6WeEthBjN3VagmepfHmN6ssLQTLajrpGmKnLrTWEA21Xc0lMc97gjwobokAQ6c0ILEz5iFOpiGJf41XQZSvZjiGsRK3WsY0W+yDA3EN8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9LqKLnAhqkN3snDNYYsA2xURrxY9nyVXuh6f0hoj3Y=;
 b=qUgxDujBWKAp+4ELOciqYBZEVSO8mano0MTLw+/7Orwo6LVrj9DiMV/HXkfbSHKDO4XkJGjI69ze8SN2GRe4XW3mOwgz86WBCj7o57WbwvR6uxmroD12ps/Unv81lONB2O7yHzo8JZZ5I/SDK4AFIcxdLUjpFwZBxeOF5zNtpFrKHUHwdalmjCW5mqL/JbTUF3xKF7Xg5GroBpXTrY0gkZ52AWS0Pi9NGwVDu6kCSK5qaNR1N0QIjvIOviNp8gg2DrpoTUrZ+kkh+IRntjdZECuuZjNsgBNzVsLjxGUDepo3NC+vjBSk6n/AB5hF36bBha6sN9jxbCLIyLDmtc6p/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fe258dd-6ad6-498d-ace0-08df1d6e5c96
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|35042699022|14060799003|82310400026|23010399003|36860700016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YpjzppQZXmdNDsI09mYvj0sTGO9/2JUZMTR8Fuha4fP6Bp3vjlffkwU933XSm6O22jQwjcnqB+Hd/MXhqQzeu5zsWkLpKTGBbeo7TbelKCsqnN6YvkqVV9XzAT4ok40pxaHkmSGGGwfOApFT8a2oM/Vbo/x2tYUDF6N3C1drGp28M7R0JhVmmbXdl+0SC02kIyLqJyuhr3pAiTb93et94YGJs6Jk79Pm0WTSot6Ze6T6qPMlEQUa8aUtGtZRGPP/s9H9zXc5Q6yLNroginsc4jVwQCu2b4BkoAcPvPrXioUJNOoQg2IlQTKbEjQ3aWAkIVn9PB5kn19wRBz7jaCKO1eTOHZzxLRe0W1apTx7vycIvS0x3Fs/2EwWiNNK2bybryY+76yt82VRa96jyU6Bp6mae9NYoFVRWkl3ZFDAHrgRsFqe0/Q3O8SDvTEvHbV1utyXIwDQuh0AZ9fhWxTsziDShsuPY15MhF8C0KKw92OOmS1+uonIaS6fOBpVAHawk6iIJxVHZY4XN6AFnSdYbTZz/WOAgHbvg0bz0jM0O1u96f27aDw8bmxDmjz86dApLnoWPsH+OLFBdu9Vou8h/lXuT6YEZBAbKqlvpuazVY39T0yuWcQm0MwH/GD13rqHVuyFw+fDehyJhXzn7CbAPQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(35042699022)(14060799003)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k9HXnDzyfNTQCv9bpwJoKOaAkmv/Ey1BJblNJ/rX3qGoDXA1Eq0mJpzEc/l4WhXVOj15u3zEt0/gGj8yQpSW+gCd/C3Fuz9Zc4f2UfRzhw+kHwKRWs8TRRnOAmxAPP4bTTVA4by+ZXDp++b+w80BtTS05U0QP4ruSKiLnGAP65YtmOlnEeThE1QviuBHNedWLHGFBPCFvK+c9TmPVvzPylGydEBq1RpJlAjidvCwcaFMm9CU93vTnGz73U8MI32MXkj8n4PEOYML25HsB5vHmFMEHyb0970oxCunLyudjD4a4h+CoEon3a8wliz3EIeFKLCWbvVPGV5Hd+OwHq4+UIuARSbCsbrXkaDE0fcZu4nAFJD1duwdofxyMiZPYDRuUCxRfprlLf0lxqT/L9EmrXZRkRBllhsvM6av6TAwuqv7dpzLx1InhJbqb3mYPS/J
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:41:12.3589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41096a2f-d330-41f3-fec4-08df1d6e8ae8
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10462

Add support for the SolidRun HummingBoard Ripple [2] with RZ/V2L
SoM [1].

The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
featuring:
- 2x USB-2.0 Type-A connector
- 1x 1Gbps RJ45 Ethernet
- micro-HDMI connector
- microSD connector
- mini-PCI-E connector with SIM slot supporting USB-2.0 interface
- MIPI-CSI Camera Connector (not described without specific camera)
- RTC with backup battery

The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].

The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities, all descriptions except SoC are shared with
RZ/G2L.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                    |  5 +++++
 .../dts/renesas/r9a07g054l2-hummingboard-ripple.dts     | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 077e8ebea0cff..625093995c521 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -224,6 +224,11 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-b.dtbo
 r9a07g054l2-hummingboard-iiot-rs485-b-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-b.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-ripple.dtb
+r9a07g054l2-hummingboard-ripple-emmc-dtbs := r9a07g054l2-hummingboard-ripple.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-ripple-emmc.dtb
+r9a07g054l2-hummingboard-ripple-microsd-dtbs := r9a07g054l2-hummingboard-ripple.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-ripple-microsd.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
 r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..3df7c67d75a25
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g054l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-ripple.dtsi"
+#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-ripple", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard Ripple";
+};

-- 
2.51.0

