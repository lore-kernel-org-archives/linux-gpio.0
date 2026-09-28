Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022125.outbound.protection.outlook.com [52.101.66.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA24E4C2D;
	Mon, 28 Sep 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.125
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606441; cv=fail; b=XQrYjsmx5yfGvy45ZYO2sLwLDnfVtSh1LOlQd7ozEhGygX2iJxZChPqmkORQMbsvUP6+Q35ZG+nUcdB4riwFl3WV0Oe1umKdRd8Exq35W06IaKwxj3eMHq5UnVAzIidRNWjLO7iwHysnbHarXiew759T78yXnKmXjXB/zmRs3Ho=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606441; c=relaxed/simple;
	bh=n8l/MTty1nAWCEqcS8pAYfReeAv1qZvWiMBgArv7PSs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NZBfm4vm3qS9THlXVC0wm9dmBoNwwxf4BHY7TG/oA9TdqJhd5GdcXSHrhYJEwbIpThovrn3CP2slPxKGSJQKGb0rCWjz2eC28fA8otAe1jdT6aLLk9YLf4IoT3rjm14FSZnAkaMO8kQqyx5B9HpmvGihxNvh/X78+4PgTXhVUgU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=XbEv96to; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=XbEv96to; arc=fail smtp.client-ip=52.101.66.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="XbEv96to";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="XbEv96to"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=arZJ1j4UhnpbeJGPjFjAPTrXIKcicEDQhwPzE+CpGTVwwOXyPcrrDz0X0ai0xZ4vjxhbLsGNc1RUrY3KnaM8efgBQnCYY59FnCQYqW/PsHYr9rwfAXsSR1g8IKpvNLCAVq8gA8SSLGKUbgJDxhctUgZ2MfafNsI20XYDB7b2XrEceBM4ATNJKai4dJGGv5zNRVpFuG0bwcH9rz0UEIscA90S5gj2xsyyanJHtB2ByhCwHC81jXUOtL29Da4KjdM3Y3ObTSmw8uAYQDw/TEZaviyPQARSbgSYy7eXi19JOT376RQx4/16XrH1VxNScsio44LRjiA4gRtehkI0HQb8TA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=v9RammWoxq6u9Q3ljd++W/N3u9tZIhnYfKoULM8G/sbvITVd9MiNGBzsUHiXKHkFUneBPne0ONoe2wtmOIYo8XlXiSmzyZNTdQQnFm1nWhEbJ5/8ArvJGHfUDZ2uS69E/cVBVwrxhuttMjBc63SPB2bD3DsWeLAh9MGfd0XQL6DgtLE8AuQPfEDG1hV2cpH5Kp3YK8TNZC910UPOSWKpMOGPG9DPGsaUnhiJNB3lOQ08JUBiMtkCH/flt44D07KFY14M+MYdcJ6s0YoedRSoAt66iITqPbeQfuSfQKw1Wm1qN/BbwpRGYnEk2BK5XtPs7hlrK9QnBLLSYiApn87NLw==
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
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=XbEv96top2Ic9ed6LCVjZpQ8hiP5eb8tdoTHCuzD47Fp/juj+jl7vm46DTq8VVAX0qO2HSRDbBUOPuFLW/Fbq2+dE6D5dkuErYq6VrITATCCrA/93vemVhzvVweE4w4O26ChGnmwII15JvNnlmcVX/4vfAEooMw+vTq+DpJOb61WB/lrf68yNWTy0EOlJrvwdaVl83BNBNSlbzI3U/GJwj5QVz2TaPX4iOfQfcuwN03VD2A3cUxFhR+A7owPHzm6JoO6l1HMejww/pcnhXmO/DX/SFqip+8Zk0plY2NrvO647c1dAJ5QUAnfa6N9uH4SCEudYc545UQl+IsIa74heg==
Received: from DUZPR01CA0209.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::22) by GVXPR04MB10520.eurprd04.prod.outlook.com
 (2603:10a6:150:1df::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:40:14 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:4b6:cafe::95) by DUZPR01CA0209.outlook.office365.com
 (2603:10a6:10:4b6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 14:40:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:40:13 +0000
Received: from emails-6757861-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8634980558;
	Mon, 28 Sep 2026 14:40:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606413;
 b=ioyD6aufJyt9G8YCeNtpcBtnvKb/ff8ZvNgbR0GKr+z0qpZkdEtRRuOBcOatsWithzja+
 ODABjCwHmelfyZoYcAVbaXnbqDA8mfJWq40OjX7fEiYic9qBpUvsWbROoEfD9X56eg7J+XX
 rYE+btpOvsMxMDgzpNEcvUAQZykGI7M=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606413; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=Ea/qQdynl6/rutkfhk5UyxmpnnUGGraPqtk2jNUuwRtPhastRtDU6dhkoKU/SYmzxBoRj
 vOYXIwq624OCjdBWq3qTu7Bhr6vj9m8meHMjaPDuxk+VhElZ/6EPQcOSr84xKllJa1CQwSI
 6htX7+7pOn6o9GXrsbaoz23JMs6hoYQ=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=XbEv96top2Ic9ed6LCVjZpQ8hiP5eb8tdoTHCuzD47Fp/juj+jl7vm46DTq8VVAX0qO2HSRDbBUOPuFLW/Fbq2+dE6D5dkuErYq6VrITATCCrA/93vemVhzvVweE4w4O26ChGnmwII15JvNnlmcVX/4vfAEooMw+vTq+DpJOb61WB/lrf68yNWTy0EOlJrvwdaVl83BNBNSlbzI3U/GJwj5QVz2TaPX4iOfQfcuwN03VD2A3cUxFhR+A7owPHzm6JoO6l1HMejww/pcnhXmO/DX/SFqip+8Zk0plY2NrvO647c1dAJ5QUAnfa6N9uH4SCEudYc545UQl+IsIa74heg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:55 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:55 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:38 +0200
Subject: [PATCH v9 10/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2lc som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-10-5901e0fc9e44@solid-run.com>
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
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|MA3PEPF00000406:EE_|GVXPR04MB10520:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b0691d-dacd-4e60-3dde-08df1d6e6823
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 zpWQ8OflsTGoqyc9fk++6gOjOER5PgNu+fHWwCR+OKUlIqWwzMDXShMQHQPv0v3ojDqlUQmfsoDAUyeC3d88r7v7oe1zY0+eVF1UbzRuE1oCMJUf7ce1ccdKTdGmS4D193n7HF5bGUi9CJsakETJxe/0i6Y0NvId8dxg64fcgYvnAb5DAHUXyoBRLBI6jxcP4e/0k9yGc3VezE1tTK/JgHZ+5Rl8y+3I4pHSBFLZtClb8Oxu5PMLyR9iLcGspoleGQAE3zDnFNR47Cy5AVxbPIENt8qapFQtLoYMxegkh/txftAHwjrMf7B6SoQ5AJhwT83Xs58WuzuZjSJoK/pIdYrUQw+bWKKpv5NRoFU10BgCXtGarzTWwjd6ZbLaeBi6mBDpoxtCm1j3bJ+5Yfaky+nGOQreYAN0B4vsxe49oUyuXZSNffDPZPiCcIbXUgE+vSI8vYD6nkzuj8oCHPdbS8i6VLkbmRqtv48Cai5egI3NV+if4K9PCxPl/ulUmC4ha3gtG4fu4fuu68MEaNLLsSKnXr+BhpwOsWL+zQ1//szQMa4Z8wXqcKIokMiEGjS6dyZb28513iocCDnainUNsecApkzf6LAKUuY4Ywgtd6ChQOnIgQ07DpMy+HzDOo8A
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Pxv4ohNHXoyMlPgoUO0+l0rw1IFz4JaWacDkj4mLCyRksM0Kav5Tx8EqsH4m1fNIDYQY/XD/tf/B7ToAOMxG9r7G70giv9T/xp0BBLSUkXu1hPeDGPkJ9DkpePLL0atdIPiCLZ8j6ALRmM1LM6WI8QA8SctzIcqhEKOoMY1t9q9lsa6AqAyKAB5dwyHC1EztgWAhZ04kl80PUEN8Et7tSGfGs53FF7NHxXO3Qy6AUByIsK0oE57+L/3vxM/I/3pLkphyNbIJtEVoZFzw1GD58IKX7F4Y1wY6cU67oDwarL1he5GUHEcQCQOO8QtfvJqVDuh740YzwS1GxMyJguPLbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 56f983865ae1447b8f618aee860cf2f7:solidrun,office365_emails,sent,inline:ccac836d61caefcbefa3c2641c859a8b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cILaNbxMK/l+57TVsNH2B4tVS2Sxz1SiIcfMrCwkqtExV2ULKx45kMJma0+krXkUKUrPgYiJQzH6Eagzuzw5eNMH3+/CHwVG6NG24WSfcayL9LJjhYMIC/YtgmAZkAVF/bcRc9aA7CuLrzm0JoqLhlp2UMWKtgxGfQPf0eL7HnWgnuofg+ZK6O7017hunlPIpK9NKlqIzoehndZZtmz91XaILkGQxfEG5cmwM5ZqXVib58jb6tBrah742uvkJZ3Rm711V1VKK3O+OUblBe+9l3jwP2NsmANdeuvX1uFNAna7tQeGA8khOPhENaPc9ETOiH7myj/QsnSKJLQjbdJU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=jr60T7eG1FIEg4F9PwTp25KwhWs/JxVq8Od0/V+jt9lPYRLjTB5pnHegHcJiDwuUYKH2FrT2YfxehgLJtAMPG8aJyFESPlHVpHRsQJjnTBTtef4D/eZogjSWXaoDGYWuNr6PZZVQtXYuNb0pj/rRBQOHPjpcxgXxnSGtzj8yF/DGB+dGeuYNLr1DEnWcj+TAYgQTZq0t2KKjEvjU62nHBk1Zi2W3FDrFQ8CRBZeGqGQMBlSgi0XQ34ZmthfS6+hkQJs76pQ7+2DrmK6upFQF1Yc2H4eyvmfDOcZqsMvWAP0VIfz4G4+GlcofqWDJtyA4YRvjfWppDNcCfnCK4Lrp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	90aaff70-d9b1-49ed-c99b-08df1d6e5cdf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|14060799003|1800799024|23010399003|35042699022|82310400026|13003099007|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a5rDfMiPy0YIhkVQAhWNJv3MzFHu0N4YBOM7XAhFlOEMXMr3JU4J9GWXQoYvsjs6mVR3tKi13eod5Qu5oFxDzq1NDghlS8YMbR6BL7KhzFhaaTFvHxNV5NrLif5FiS1g0IqIIAHJV1F2yM73ZmjukSOiW4CwDHoMXwHsszqYsJU3fZjVc+hM8dp4TETqzNkaCIi0h/jM/ZDJ1bU0ThvQQctkp1Ssbs8BzTogHJcRmH9ZUkcor74aPN0rDMZYT6qKN3P1o6Aes/FWYviDn5XiZqE9z1DczTqDJ6ior9ckrKqIEr1tIP8BvNmEGt/CFmD4nzl6JptfOyCCWUOLOn2prTkoev4CF+ILKP33cdb8/PFirxDgJ4hQbof2KEA3Ju83VrTjJpyCBc4WHUBkAMI0oSbsbFTSRZHJ5u5yOXi2eNaik7veMo3wQ7KD+gQ7eb1UQtZ4Fm6+ZPg3JaqCI/Ro2EuX+YtVMWQqUNjGgK/M6AYqI9LBjTK+9Tj8u/HviW75XyHa645fUOmzn/EekKcHA7R8UreB2Q5yvy20E3k8+aJATmG3r8+zhrbGoS9fej78MlNpVUhuE1EJys87mL2s2fONpB0PjkfHIUPPYR4YO/rbXDB2HWi974TsFXEUMB6apVrzv8qBi64fyoRfEeUsFA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(14060799003)(1800799024)(23010399003)(35042699022)(82310400026)(13003099007)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PudYhU4kjtIHTTSnz8RJoigLDrJN4BhjtQU7ny9I/0136JRUAGaQo1GadGI2EfagjEJllwnbiaY/AxWk0QV+khlXoYNlIOb1nl7/c80Top843p9E8pYG+HmyJo9KhTtZPT6tu+BSjh64YlUBE4wey7phs1S3yVxD5NC+IR5wGZtlZBQC0oKHV1F8oSvMeOQVVCIBypuh1rD3LYSCQ5ktdsVIwe6suYdnLrqCcgNYOYFPhqPrVfNsPhbvyfiGysqFWhuciKvG1zW2GDGzfcXqHEb5ANYw4PmHCzkMI7GYPd7KpseKdx/3VC1mwq993Wh4KcXKRTGjhyR0Jp/WF4RPMNdItlQz9hRC9zgnckAeWjEafyWEANOgIDKB9rJg0zwB10E8WhF/u9RomNl1FEx7VTIDSYH1Zx3nYmfOlKdBvPXoT/yBtiBq2IuvkPzkj1LY
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:13.9297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b0691d-dacd-4e60-3dde-08df1d6e6823
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10520

Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2LC
SoM [1].

The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
featuring:
- 2x USB-2.0 Type-A connector
- 1x 100Mbps RJ45 Ethernet
- micro-HDMI connector
- microSD connector
- mini-PCI-E connector with SIM slot supporting USB-2.0 interface
- MIPI-CSI Camera Connector (not described without specific camera)
- RTC with backup battery

The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].

RZ/G2LC SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
board. Provide dt overlay changing pin function from uart to gpio led
control.

While the variant being supported here is named "Ripple", the overlay
still carries the "pulse" suffix as it would fit all its variants.

Descriptions for eMMC and microSD are shared with G2L SoM and
HummingBoard IIoT.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  8 ++
 .../renesas/r9a07g044c2-hummingboard-ripple.dts    | 93 ++++++++++++++++++++++
 .../renesas/rzg2lc-hummingboard-pulse-leds.dtso    | 48 +++++++++++
 3 files changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 625093995c521..83519d459ae80 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -176,6 +176,14 @@ r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
 r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-ripple.dtb
+r9a07g044c2-hummingboard-ripple-emmc-dtbs := r9a07g044c2-hummingboard-ripple.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-ripple-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2lc-hummingboard-pulse-leds.dtbo
+r9a07g044c2-hummingboard-ripple-leds-dtbs := r9a07g044c2-hummingboard-ripple.dtb rzg2lc-hummingboard-pulse-leds.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-ripple-leds.dtb
+r9a07g044c2-hummingboard-ripple-microsd-dtbs := r9a07g044c2-hummingboard-ripple.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-ripple-microsd.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..ef8e2f62b6827
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-pulse-common.dtsi"
+#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-ripple", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard Ripple";
+
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
+			label = "D30";
+		};
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&gpt {
+	/* mikrobus header pwm pin is pwm channel 6 */
+	pinctrl-0 = <&mikro_pwm_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&hdmi {
+	interrupts-extended = <&pinctrl RZG2L_GPIO(42, 2) IRQ_TYPE_EDGE_FALLING>;
+	pd-gpios = <&pinctrl RZG2L_GPIO(40, 2) GPIO_ACTIVE_LOW>;
+};
+
+&hub_2_0 {
+	reset-gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl {
+	mpcie_rst_hog: mpcie-reset-hog {
+		gpios = <RZG2L_GPIO(19, 1) GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		line-name = "mpcie-reset";
+		output-low;
+	};
+
+	mikro_pwm_pins: pinctrl-mikro-pwm-grp {
+		pinmux = <RZG2L_PORT_PINMUX(41, 0, 4)>; /* GTIOC3A */
+	};
+
+	mikro_uart_pins: pinctrl-mikro-uart-grp {
+		pinmux = <RZG2L_PORT_PINMUX(40, 1, 1)>, /* SCIF1_RXD */
+			 <RZG2L_PORT_PINMUX(40, 0, 1)>; /* SCIF1_TXD */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+};
+
+&usb2_phy1 {
+	vbus-supply = <&vbus1>;
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+};
+
+&vmpcie {
+	/*
+	 * G2LC SoM v1.2 moved this IO from J7-28 (CON4-12)
+	 * to J7-18 (this regulator).
+	 * There are no known users of CON4-12 and thus no need
+	 * to differentiate here between SoM v1.1 and v1.2.
+	 */
+	gpios = <&pinctrl RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-hummingboard-pulse-leds.dtso b/arch/arm64/boot/dts/renesas/rzg2lc-hummingboard-pulse-leds.dtso
new file mode 100644
index 0000000000000..a2572718fa87c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-hummingboard-pulse-leds.dtso
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Overlay for SolidRun RZ/G2LC HummingBoard Pulse
+ * enabling LEDs D31-34 in exchange for on-SoM Bluetooth.
+ *
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&leds {
+	led-1 {
+		label = "D31";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 2) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-2 {
+		label = "D32";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 1) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-3 {
+		label = "D33";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(42, 0) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-4 {
+		label = "D34";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(42, 1) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+};
+
+&scif2 {
+	status = "disabled";
+};

-- 
2.51.0

