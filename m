Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023119.outbound.protection.outlook.com [52.101.83.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA34E48380D;
	Fri,  4 Sep 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.119
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523021; cv=fail; b=YLKms4tsR+lYfZEFt8IuS1Hzk+CQwjrfWMLm/qby3uqNnrLMeV4OGc2tqCooTp575ps37qIMtm/bz492NSPqKMoLTP8cQNoMqmFhzwDT51NzHBe7Ks6fbSNLC24TZBH50QBwtAfdL+9dvNOQZR7NCCO/DsLycx9CUBiyuDkNw8c=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523021; c=relaxed/simple;
	bh=o8AshnPMbuhtT28slQtFkZa2QA1VQS6fNLEhWDjg5QE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UMygOlAb3h2EJkLxof3qjjVoC2tTbvpT1p7cV1rTmHLYKztGjLLTb61jyLgdG+RtOK17qv/B8AdKBSw238dgF2UFSlhokTe2pVUv7yhigg5q8aU5xrTKGqjfbAldLAIw1b9qZxEMRNhwG1T8RFUN7OtaR2KOiLywjEDQNmaSN5U=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Y2YxTFP3; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Y2YxTFP3; arc=fail smtp.client-ip=52.101.83.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Y2YxTFP3";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Y2YxTFP3"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yAlbLW/KCl1w5MU5h8aV3Sn4yLwoCyUr+4iG726o+8+ck3UWyN6BOtPlMOwAjO2SZpfl/AOIDqtmLGZiKcEg0i2b5R/5eYz7da0Zf3V9+vTIYFtvjc99KhD0lCa2wliNqHGKSPJ2m0tTzdztvf3fYC5xBoQ+H3wrrZm3FFuzP3rGXXvyT1Ut7Ks4m7hJl4sCvy/0ONywKEs2fseZ2I4GAjmaR0TrV2n+rpxTvQXlhCrZll2f+EpAkME+MTQVqS8Xd2FdsRnHWEmp5n/9GwnZPb7X3lsEW6J1Z2xoN/u+5RCjVmsS4EvhDHwbC7nrq0O1QkgnD2c+4s9hf9cLNIIw/g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm22z2BifBgW47QEZgA91DRyBPu6rY7Nu8SGkPKlym8=;
 b=LdQAbHTE+jd44I5aBGY1glDLDwmHYiRFpwytv9MliUUMU4VTj/t5AWfwg4CTpo/AN+riJ0PC+kHcEiUWfFkIRHeB9hPVZQY60aiTvWf/iK8ZmZNqxbneQYIV7aBT3AsvjNaFnABwLzESQroPM9c0oXGrBedn+odQRTtVzMOFwd9idxHRF/8fjBZrGrYqGEdzTSYST/oZOfFDSVj+PHd1jbBEENPBv6CF///utrgzkEjMXug2QlHjQwXol6uYbQ40XJwxFLanM8RfSF68B+ALF9OFJOnzGTvA2uUZAWTxnkC+e0Q4nB0bLyEa8R0Ta4gBJGJ0OgO57FUOKqWXXJ+G5A==
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
 bh=Sm22z2BifBgW47QEZgA91DRyBPu6rY7Nu8SGkPKlym8=;
 b=Y2YxTFP3GPfkXoVFihwWPibatWr6GS0iQKHrq8Q9yAFsAG105+QCk3MScm7ormM0StU+H6m8aRvQc1qdrDyq8DHs2/n/zM1C5i0dnTnTVNtiJNIECEAQvQPBP4M7TxZwJWAlUGhCa1Ps+Rx9SpxFcS9A8brOjSjsS8AKW9Oud2q5uDdRSbbwWsoih98+iTrfaAge7T1TIhwNQM02JgglGP0TR53mV27CaUNacBJ//6+WW8ILYJ/M0ByLKJ/rj1QLEGKtx5WXayp4t6Zw2stW5pQqQVfTvezY58k21mMfwYczq0dNRzeBpN5tfx+AFRqarBt0G5GHSiVmeQ+tEHzVrw==
Received: from AS4P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::16)
 by ZR6PR04MB390898.eurprd04.prod.outlook.com (2603:10a6:910:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:52 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::2b) by AS4P191CA0030.outlook.office365.com
 (2603:10a6:20b:5d9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 11:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:52 +0000
Received: from emails-7832044-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6283581CEE;
	Fri,  4 Sep 2026 11:56:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523012;
 b=OyQ2ABxMg9VJueMt0atUUO/3nHzpAzOcArSlW9guiVmZ4cztPfUey5732imbVxGGKWoZ3
 3dyMUqg2hSIwTFKgp5eyisyFXd2W945YL5Gf91883E2qMfpLnoRY104sdnoZsUsrdBafbMm
 0rsCKPCVRDHEZ6vph1bjY2EgoRClhOM=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523012; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Sm22z2BifBgW47QEZgA91DRyBPu6rY7Nu8SGkPKlym8=;
 b=a+jPO4rWLEYXAlTLcjxwV9UU9w2/gFS/j2QKLZdj2cawW/ebdMfx2zUAY+U+m3kaX9iOb
 j1GaycYk98ubVEVTuWAhLurQ1t/raKcf2qQ07S7h203q519W0bM9z56ZXd8vSxI3m7By8H6
 ikhcsv/49Q7JDudDvem4ojGOeX/be3A=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm22z2BifBgW47QEZgA91DRyBPu6rY7Nu8SGkPKlym8=;
 b=Y2YxTFP3GPfkXoVFihwWPibatWr6GS0iQKHrq8Q9yAFsAG105+QCk3MScm7ormM0StU+H6m8aRvQc1qdrDyq8DHs2/n/zM1C5i0dnTnTVNtiJNIECEAQvQPBP4M7TxZwJWAlUGhCa1Ps+Rx9SpxFcS9A8brOjSjsS8AKW9Oud2q5uDdRSbbwWsoih98+iTrfaAge7T1TIhwNQM02JgglGP0TR53mV27CaUNacBJ//6+WW8ILYJ/M0ByLKJ/rj1QLEGKtx5WXayp4t6Zw2stW5pQqQVfTvezY58k21mMfwYczq0dNRzeBpN5tfx+AFRqarBt0G5GHSiVmeQ+tEHzVrw==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:56:40 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:56:40 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 04 Sep 2026 13:56:28 +0200
Subject: [PATCH v8 09/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzv2l som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
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
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>
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
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|AM4PEPF00027A61:EE_|ZR6PR04MB390898:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf63ada-16b8-4126-2d18-08df0a7b9c24
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 HfBDzMNVIs/s7zJEFEvqQ/IaaPDHDQZQkSpyYhS77wavVwhjwFMyC58eRxaPSSPvZdLVrDGXVxr9pGrSRJS0lpTlbxJ9vBaROkV9Hh1oBKIOJ8SpGn0Gik3325mZWOjqw0Uf8Qx8tX5gsjhdgEgHUUEVQ3htY/bQRLTwjQoqOy1OoSZlCrGC6hVFWPcoc4gMk7Nq6OufkeMoN1FeDeLLXENWsZwuNTkqfnuO0LyNagoUsfi57UZz72TC1ibZsEpTnqmBFUhTdjPLInG+ZEQROmaaMKcwXUPXItdVNFng0rrrGfcUtCvm2eADteYLr9Y2BH1kzSpy8VFR6RmnlNsCon54twVZfIw5JG3AYGhMQOYRu9k4mO/cN4bVdZl8vX5cPJsu5i0Tels5ub6uQuJvA+dZz8h8MerqTL5PQZn84Hgc0nP4thBc7UX4yydx0fDrUv/9OYfsrumcUxCyXgSHO7Uj+p5ulNpJEa5E6/+sDqXwqLefzx4Bqxn0SQh03df+l3W90JUVC5tpBmlr6Ep1NQ/ACHJHJLwMWh9mCx46jn5z6ctT5OeFxWorJWGEWEn0f/w/+6DDICoWnM+opazH8oivgQRNvH6ZqpIgwAZHGcA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 5v9Vh52C9J2vUMHLWTflzlaTkM3FqNM27XaSihP7KHHdnW1DCVhTrhMUoirNuBD2cMrQQY3w0xIwgBEkjtXhOmpRjhKQGkgzjxtt77LKpfk5CNa3ZwUrwaIatXXkR/lKxWNLKstJt03weQyfk4wI2uWe+W8HtDXbIhHremT1Z+g8T2aZED7AqPUUWASlNHlCCqjcr54HsYb74OIRP7Gj1xmFBxlpdVhFi+TkO/hpagDoQBfqiwtaui0nTDsluKbQiVhVoLSAFRgsDSXss7Wl6STIHmKy9FcQlCrcv337tqFfc97ficlrcr48rC7Vd24jDHOlMwLxHzys4Se+duMHUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 39feb46207884ce286e8517c8f733ad9:solidrun,office365_emails,sent,inline:284ae8a1cf75927e32739ded676cd9cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coFuzJuCCRmlgY1RNyijIMg0m+9dDReKNNN9PklWnPv6bkAJVIB3ZKFpNgfxdZJKPxPd3QL3Vd1PsstnuVimBgEcJXiEVLSE64ZlBjbs0PhaZEtlPGklIjVaY6UjWbeOcxpGdC+hoSC/YE6g0cCtmqNEBDWux7HcCVTEg8hfHxhE2qfoGf/jRjLsZapVl7bMVbHRoYE4s5QUQr+WBmwcnGd2oOvRRM/lh1OJ20h7DqNuOevhfODJbJJSVnhxSj1pMfml/bveW/kfTYy734d6qWi+S84TmhtzMgwQQ7Btyal3LoLBGi0Hugf4SWi6gCGNkov85Y9L79bF+50CHGKrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm22z2BifBgW47QEZgA91DRyBPu6rY7Nu8SGkPKlym8=;
 b=SUkwbsJv7nQorwoVhiGNBF82hZoOM0+SGz5V9SHp+OBGeKfU12tcATIw0izCJm9WDEjwMqrLdafu7+6p3mp8Wk1C2S906KfOASmnoRf2UQuXKi08+DwJNwuOfjCO8aPvV6q4b0J78Xk5BppckLZUhV+SZ0i9X5uO/JhhY1525uL1A8oXmmzBQ3UctBPuRDMt98gf+J1Wkb2FNefcHY/1BT0zIgtEIDKYpk79L3QhK24AWAL/fT7gR58GUInjrD32A4eKNZPBqRBbCHsR6rXGY4EKg8WWyrWWYrMgkPX7TqcnygJjyD1TugYNiOQyaTgS9xjXSBfZYoE4C4XFLlTd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1628084d-affb-4e06-9e00-08df0a7b9389
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|23010399003|14060799003|36860700016|82310400026|1800799024|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gFINL1tWpvfz7etu1aVbj+Pa0kA47xbqezsYxNEORogwEj6G/gA6rBV/5wRxgsGjTcv/yIs0kM60KZw44Dvyf2nrLdPidE3RFxGyRKJEyzTFz6878LCq9iBKhTp6fTHsODGBvihdHf3OMWA7VXo7nxnlPGg96paPzHFTtEek7r2mdL+5kJFc2EZpbiF/24Qp2NOjDRpaDRHb7Ftipu4DWZBJbtAz4SaL/8ZBNflRIoeguD7XFkd6FJQGkppT4fJC6w8JWuBPf3ha1iFx25edfsu/Rx5Fn0wONbpyFUe0gBIhljXrbBQNv5NFfnLXOOZ+Mg2MpqXNMe4OJsRBz5S34YdmySPxuiBadFTaw7KTAeYFChpZziD+OEmLG3QZkqBQDEpf5h70UAgmzz/uXgW1nsX4UEFjOFX+8Nr/P0/RzMa21sFrWxpQGxscrssc9RyYrKzeP35wrhl1viA2gwyk0zQApaqNN/Q5l8CCSFkCQ2oKINWnMxmCDwR49gPZuM0fhbyzBrC33kX5gOOXRuKW8BC50PDQtk8ZHte/2liAfZHr4KCo15ZgUerBhZmQqI1amkUiAN8dRd443D/fcnSlVcFSYyhiO2pekBA+lxA7rdc=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(23010399003)(14060799003)(36860700016)(82310400026)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YL5ua8RzY9bMQu09XqdXNAkZzqEy91d6e4Dp6d54gnVsdTz8/tCNtAcrnqcS+GAeQrHhpQWdPY4cvi7cJlcSuBIIgQ4RFJ5RP1zNtS7fjDcMnTmB+JZMbiSq9UM20dm17QriB9Fa3PCNveglchlvbOz8Sn66Fjt97nSSU+R+KzJ4xjjz9rv3dEAa6mgYx1IFLij6esZhQGaejjWv8CU56ThJMBKmIJN8C3wjWnfMa5arCLCKF+Miq2LgI2K7YwiMnQqsJ3vycMSRET7QkUVwA14s1FGwOj6w/VhrwzagtdNp11pCBJOyQwLnpDKTmWcLtKypR88FrHCtdO4pS1gllIDYa90iLLIB78XZmpA8vkB9XVQvKJ7tFRGM/x+wMBNaXNz11nje8/pjBi1zhqhE7HgJwr5Qn+ld3Wmn8bXQm0Rh4DaTXnD9slI5kIHthyOH
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:52.5910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf63ada-16b8-4126-2d18-08df0a7b9c24
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB390898

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

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                     |  5 +++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

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
index 0000000000000..2c0d3f8b96b76
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
@@ -0,0 +1,16 @@
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
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-ripple", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard Ripple";
+};

-- 
2.51.0

