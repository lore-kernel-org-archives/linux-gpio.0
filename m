Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021077.outbound.protection.outlook.com [52.101.70.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFA547FB14;
	Wed,  2 Sep 2026 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.77
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349866; cv=fail; b=m4uZevYWjv/GZ3BjJdgfiHYOpUg1jYjJaDZ4EF9ZJM3NgBFqiU7jgayOSYVosKNN3hswTG3CEzFbC8taAFL/nFTIL6gAOniupoWxGB+RmNvZsoXKa4pHIfId8NyuVMutMjEbPlIkiymrLUmqitFEEyNg5/rtlDZf0uzakbttG5o=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349866; c=relaxed/simple;
	bh=kScNzKxlv9hiB6X4RXmIIdVKo6c+4aENfoxncyMB3uw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GO2v+K7zO4GEOlne3mxU5fsnZ7QdtbpkotIxWPOh8hk7tNhzJYKuLLOpwIPZk7F6iDKVOf++1rcAoouuk5lmKFbB7B8eUvIT0imu3H+BdgjNvUGGKN/xKaD7EOAx8rzDf4MxT2vkP659+XsnZPWBbr1Z+iWRDl032hMdNCKiN44=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=gD876xf5; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=gD876xf5; arc=fail smtp.client-ip=52.101.70.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="gD876xf5";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="gD876xf5"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qtxpnzyCHd8QCy9XMG3Qi3bZhArqRAxLHOCaFFF1tUVnXBHSVyRBsV+Yx/00raVb7IZSrbs93ydDOYGepA6/EGGq81jLtbwb24eK1PniKlJOPbDG1PSN9494gXIKbTgX6ga02Y0g+yZ8PLasFBQ0eViSv59EKi3ZV2S4tMOFQBB+q1EgJqWhtJMk6KULFMs3vxTcze2YNItGj2LR7ZCVZxIOYC0TU4EOsy0INrxVFdU2ZPJBjcA61E/GGbHvpQOsQF70Hnop3Bcu9g6+rNH+0v7mn0hWzU8YsLtgv5UHMdJOGNOLDaM3NsT7p3uAEosIG3Va5kuRBdwcAILn6hkdMQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYWJ+4aFX/s9F1JuHXs1dzrNw2NojUpw9O3OQGJ/wGw=;
 b=NzIpiCkMKihAzLpSDhw4y5mmjcJcHkpTR8lTYHkLemZZWMlKlYHmGNJBClx4uyt+qR0vdrKaU3wRFc5LVAq6iNrp8vjHcGc3Z0HpbW9xKUuThRf+iqKaNFisD2fsvlEX2tsiX0G296cp9Md4SBljTE4HqViUDoaSbcGicksSvFfMcu0Ww17JA6a6uMnj/LiQyruw9tyOjyVKbSj951MxApD9rjHo/7qEi+6NY+cyXB7fTYn1q/JLhoexooW5I8b4mRlFBY8+oDU7JjzwfFaX4bkL5T4l4QSdVZH8u+mYRa9wiBgEIS8sLeeldMlQOgQY00HeNCiU+4UR3wyZbvHWYw==
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
 bh=aYWJ+4aFX/s9F1JuHXs1dzrNw2NojUpw9O3OQGJ/wGw=;
 b=gD876xf5IVQqEMbNkjTVZYJQlzdKCfh/vu4rsC/Cql/+/0f1yW5EIKRcqeq+F0a3WWMQszZNoMHbi9ji2UEgrmQ9EhYsYK491nOuBgEjOuu4l5N8aPob9TtHbsIL3hYRX7v6wxRv4duuV2ZO3XgHQqU5Tk7A5+uNOa4H+ZGft2/GHNdZhatc9E7hDprPGkCKtY15NkckOFNO3mVHx4qODj5oSCKI7aBVb1AxobMLAPAEo0dgzP1zNwxOBeCnLxdTsaSvjhi2x73YkciTWuIc38iMJZ4RjIpf5iRGq4Dg68KQKCtDdKA3yvbSUpf2/iXvHAa9PHdk+lvvFURFnxMCVw==
Received: from DB9PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:10:1d9::16)
 by AS5PR04MB9731.eurprd04.prod.outlook.com (2603:10a6:20b:654::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 2 Sep 2026
 11:50:42 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::95) by DB9PR02CA0011.outlook.office365.com
 (2603:10a6:10:1d9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 11:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 11:50:41 +0000
Received: from emails-225442-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D610A8129A;
	Wed,  2 Sep 2026 11:50:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788349841;
 b=I0bDueSJdtNsF6vZ2v846TUK8ILNlS01TMcdPHpN2M2zK/DVDEH0G8qvbAp4FPIARVjWp
 2rgPz2R7n12Gs4AKRXV5FGVAGm7PF2VOR5/eS3vfegJ2XLRoNdgbgA9EGv98b8VZ+gmOqd8
 DWgKIwmwCZvhKFTX5IFasSZ28+K6xIg=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788349841; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=aYWJ+4aFX/s9F1JuHXs1dzrNw2NojUpw9O3OQGJ/wGw=;
 b=QI1bvPvNmgNe6ynuUeXVpM4baqZWiUiFAyRhX0AFpQiIeE60b2GWwUjVk2z8we5yQRHma
 CPpp1MZlQ1iLV4DFprIV+n8Af324ly7HCwZxPYbqSrkIdL5B1e+m99LA8AdvpTnG3Zeavvn
 tYwZUZaXjHiPWhltQOaOsqobI+Xb3wg=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYWJ+4aFX/s9F1JuHXs1dzrNw2NojUpw9O3OQGJ/wGw=;
 b=gD876xf5IVQqEMbNkjTVZYJQlzdKCfh/vu4rsC/Cql/+/0f1yW5EIKRcqeq+F0a3WWMQszZNoMHbi9ji2UEgrmQ9EhYsYK491nOuBgEjOuu4l5N8aPob9TtHbsIL3hYRX7v6wxRv4duuV2ZO3XgHQqU5Tk7A5+uNOa4H+ZGft2/GHNdZhatc9E7hDprPGkCKtY15NkckOFNO3mVHx4qODj5oSCKI7aBVb1AxobMLAPAEo0dgzP1zNwxOBeCnLxdTsaSvjhi2x73YkciTWuIc38iMJZ4RjIpf5iRGq4Dg68KQKCtDdKA3yvbSUpf2/iXvHAa9PHdk+lvvFURFnxMCVw==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by PAXPR02MB8248.eurprd04.prod.outlook.com (2603:10a6:102:247::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 11:50:28 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:50:28 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 02 Sep 2026 13:50:15 +0200
Subject: [PATCH v4 7/7] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rzg2-sr-boards-v4-7-4a456a422fee@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::20) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|PAXPR02MB8248:EE_|DB1PEPF000509F1:EE_|AS5PR04MB9731:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b68d34-3d3b-4a1e-ad60-08df08e86a65
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|52116014|376014|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 6XBZZZrrqgFvKnI7V/aIhvjmv83Y+F2Sc56u27RpvCeSoMnSLGAzpJ93tN+1XBGOBO01vhjZWrwU/fO8jjce5VhyMM/hnTRdIetL24kyYnZRoJXYMpSmArerz5oxWqPcmwVxZ96JOAwRt12B0ECoazCJuN/4tDviYtpsdj5BNLcCw+LqfCeFTxqeCXi/EQ4m6o6fL8aEEQ0z14eqA6vJIk/pmHOqdUeKx8AJniQN5lXEjt0FGEpeqbPT/BboPMjz3uXdCXM9bJS8wjbnL1CBNq7RziITLGUMhQP6bTgNSTSxzA1cvbO0ZCPb0LkLNm9g83Bv5L5YJzDpPUUi+AqEFtTe11G47uxhqzWXvruyt1MbEybH4ab1CTykCIGdsBSIFJ07FcH1gKWe8PCbmU4s5mwHKhcH9n55OS5RkCDFDw+kkQV/wbWv5XtmowU56rSLobJ4x+dM4ZbEYYlv9fkDZLzfl/1nN5VuqPlhh7wwbdkpECT8Ms9xkMBkvpWDM9Xke2wjxAWfF8U3J3Hcz2oxin7YRjVwRzO3hZ98MbpIN9X3bKoHEEL4684x812twunxG8j6DhsYywKJU3ewnutuOjbSMJEzFtLBlLjoUfpoqvLyyLudS3l6E6kuncfI7GcWFFd2VoFNIdeoisRv6usqOlknqw5tekztpAnStbyv55E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(52116014)(376014)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 d2iFNsCnTyu+GBLgz1Lp33SLb8sgx7XFn9d5CjQF/gveYdCTvJaM24EPsss0nKs8Xb1RWf8lG4aXeTmGu54XvAV7DQNaWaZDtHmmR8YZMCsX2nl2Tg8nOGgonU00XsY/Ley6qAz45EDfT5RDffCZ3yQUsNA0WeIZdfCVKiqmYUvL8qiDC8/Dy6YHnBX0FzqZ6sEHsXQ6uQOT4kXYjOgzk4hRgO7/bn4yBnJuMS9H58ztlTdwJRx9Ca/ltzzuxgSJAgPw0DZ3Drc2b0azX0RpQIcs1HB+xcPfkNdFuRbAp04WqCOMmdypxun+vQMurpHjCYoTejLje6GDTD5OOKNoAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8248
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2840fa3b32584520ab2cbff1c7b06d3d:solidrun,office365_emails,sent,inline:578e1e4ddf8b6fd6dadbc07d47737aab
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prsXY2FJqCGcZb52+GvlZ1uyW/FMXFGbbbkihxFy+uIdfADZnLLwRG5yvQxIgZvVMONARvbcHFKcRL93W/B+8GiVrzkNbeDlU6O5G/jI3jyQXabDRTvV9f9ZF3AjXluoE0UQ8i7p/CUvaXRSRq6xv0D5DSMe3WwcQcQ8N4p818t4LlZn7ILfwERxniQtqVBT1mgYfntCJ87URP4SS4nQGAJr7fzv5BvVzJ+SJf7FIPvzPFWA2htdu1/6qwqJ1iAlMzGH+/w5y7motfPC543s6meA/icadLOt78tCgmCQMEGWBEYkaN+nN8tWF3hCSQNMtWF3FiW+5HbK0hQDR3xjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYWJ+4aFX/s9F1JuHXs1dzrNw2NojUpw9O3OQGJ/wGw=;
 b=rXTWkzjkY2VwRQ/pN2X0jBr9jvY8xJNQ0cc8oirpWWpCkGPza7ltvS0C3UH9ddGwsbIUyPTW/SMGR/+QDaYZbP6Zcn6t6UVOaR5jQIHSqrVojnWno6CyNaG0NAitm/j23dpP5Xe/o2+171giSuIXwPVcbphLSorqETZ3W72GfG9/+bAU+zbYE22AvXaVCzbme0dW8DZW+BxeMuuVCgur0sF3MlxfDPzA8vb/87JsiEOey+hW806+FP0VAK5NcEnmtNvZ+H0hPdD/U1qRwdvVbt6nJnDoTnCNAke8Tu5mOJb0dvaBkTDXqPOJp7kTFV6rG35rVJGJCfnYDoiKYMadnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e4aa898-a674-442e-5802-08df08e86247
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|7416014|376014|36860700016|23010399003|1800799024|82310400026|14060799003|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uF14my6sXsBbyQrdujjpd0vEniO0OexJzYDIghOp2FnIAd0TvsNI0E9BGLj39WWKxn3M059fvELDdkrGnZfDmxI97J16orlDe09/5P8KWWydWTDWO2xDoI6VjaCoyjs7hZppULgS0mFZQ206U+sjKbGKjcg2eG8b/MP32hlORDm1eZUc0xvOKAs/nyR3eKWfwLvo6uVlmpM+Mrwn6U2Mg+E6BdZNg6T5uz/GPEtTPqMu1IAll1mXVCqjGawaGJ2UiXToYDoS/qOCa9JEIXyYu3PrpLB00kFn0BVDySuYlt3XoLMVV0hAXV51pPrDhrS2SckRkOF/fGGBhKdU/08kQ0DBVEkEESBcidbXWZ3uajbeH1MzFoV9auuMQcJXj42TBwMivNWDVZhBZhtb37PfT8K7J5YOjuSOHOhliKLjYPDMeFvyEdcn4S3FY727iIw1Qgjb5RpFyoThYEwSkV3qo+B2TxV+lUIXE8ESWLMNpKXEdlHhYuvOcDpBe2J3+KvZ/2mBKwA+9LhEzb/uJfEZMyRNk7IvpQd+uSNFHm5qP+sYtzblcC0j6eIfelLzZwJkTB8OIFcEUA+VZasYLS5tOw3HjrUZIe4AtCk1T6JHdsievziAg4LotUhA9c6T6nspws573KvT1D7wJwfcWns+bUGmoGOtGZzPLCA7fkn54KgsWtnYtp6EbqOvAEBIHZ4zknk+uG+BwJ4kWfYafV8RAA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(14060799003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9gSMBAF9LFZ7kSntkneh7mK/xlZjV6cdK3W4if+hKzFpwwpufZkk5wnIUN1Xsb4F6B7eA9kG1f+sPfeL0uV2n45OVdy+v5O2yll8b+Bd/2JDbuXzv8Vr6WB+b2BM3I5gijRdVW2PSn2BDTFwDsd4ULOeVr/QOSVquy8zvnrUSy1WTf7g5ByO0kYCMR0hHH4tyN2/kefUzfm9Q3ZammYa7/kSLUyMeGUY1SjLDixd6O4jgQw8aC1LsBaB4LHmmKZuKe6YvIaKc8HNvvP3OaQ7/TLbVG7k2szdhY+YwU8ps3TXGVxMMmwOk+YRn8JKJLM5Bj30KYqC34qvy10y3OsJNWI16LqIsIuDRXMO6KfXsGbSBRIKWsNzcweid4f6Q7P0//lSI965ivlTdTSud7jMzZ1+fDWGkNhHHEIJUpvqO32cXjehHbYRS8th1zCZKGNZ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:50:41.9963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b68d34-3d3b-4a1e-ad60-08df08e86a65
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9731

The SolidRun Hummingboard IIoT features a DSI connector supporting
touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
SoMs.

Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.

Add the addon in Makefile for all supported SoMs SoC targets.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  8 +++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso | 74 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 69b1f75156016..0bc2bbff9370f 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -170,6 +170,8 @@ r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
 r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
 r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
@@ -186,6 +188,9 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-emmc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-microsd.dtbo
 r9a07g044l2-hummingboard-iiot-microsd-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-a.dtbo
 r9a07g044l2-hummingboard-iiot-rs485-a-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
@@ -205,6 +210,9 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-microsd.dtbo
 r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
 r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 0000000000000..e43a38d5330e6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		/*
+		 * Touchscreen fires short active-low pulses which level trigger
+		 * on i2c gpio expander can miss. Trigger on falling edge instead.
+		 */
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&dsi_backlight>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+
+		port {
+			dsi_in_panel: endpoint {
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&dsi_in_panel>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};

-- 
2.51.0

