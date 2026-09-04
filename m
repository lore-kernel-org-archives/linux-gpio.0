Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021128.outbound.protection.outlook.com [40.107.130.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A608247CC89;
	Fri,  4 Sep 2026 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.128
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523019; cv=fail; b=qxNJBMrm9RFIHu4iqMsyI3D6XTycSenu/aXvMlo/Rl7uZNPoxSVMwKXd8UUz3v/f9xN512/Zyz8lZ0AH8R1PlHmIqAwTrqvyHugO1Qteg32Jsv5XV4FO+RTMUWnN1HX8Xn/i/Wu4cVbYtnL4J/exPgIogV2tA0E+6NX+H3bu3fE=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523019; c=relaxed/simple;
	bh=8UFW0/rkQQfFWUJqAf+29ka+6XiT2uq5plTFPd+Rw88=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qCnODNWVHbDWgVvSk99ptZtkZz3ROvEVQd5ZgGYbxTDFNT1la4UD78XiYWsh7oOoTnuN7zkNY4BG1k6XuHalvnjV51eAZ3Yq5I+ExTHVyszYNiNfGGnomDm8FasuWsKTjzbxxnmjbfx5OvOnltbHo77capErpZ8C1iis0rzK2Oc=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=GPsNInHS; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=GPsNInHS; arc=fail smtp.client-ip=40.107.130.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="GPsNInHS";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="GPsNInHS"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZAs2LW0fVMDh5qOmSveYxTbUamjXkTFRnJHhPjJaNmZfj/JlX7De+sQp5weLmHZa1oeIn9asS2sJiRkCGonO1KtnHVhB37WsbzAEGnKkoHGkMo6TvwVedt+m5vNILZQidk3rb8z2DRusfp/okEWN/eIgSVqq8SY5GvX9jVUGKU0pGtQrC9D0MfP/qKPIdaqF01Efl6gXf7s47irDKSxVX50i1bgNKKfIjxXIVnSnfxKlhuNE/Yt7ysm0+frIOYRn+EjjfeX/BQax48eCgtbthbMInVBUHQCydxH3Q2UAbXreXf5H7+2R6FvKc+2WiH9/CcHsaIry8qi3MVF8utB87g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LYzrIeiEw0I47VGr4C8hLYhyDh/ZO2U6vGtNCoaMbI=;
 b=fIz3WFTQBQ7LcthvUJhH9xUyGbsbPdkmLX/1nHVw+tiIC+sR/qm1vOaHVEYHyobNepXJD993yiegH5KTqmsio4bIbVEOpmmq2bimWbX/STwLM8+p6U0rbvqGSab56KAU02VOYvOQuRf+X95gTmJ+tkWtdQzIvsa0nz/LykjpCEgVjBBI+wo0wnRqLNkTNt7R3Eoqjff8B6i4x1LB/t1s9dc+xm99cvNY4cYwzoM3KMvfR4zDrGdv+VXVz1v8rZc2MTSURxKWbDKjZQ+LrLR9zIw0fdA+YzWqKIePAY7lpGVxnwcqKgpg8yGxUvxVRUTWg3o7iCHle+rO/mHAL+r5PQ==
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
 bh=8LYzrIeiEw0I47VGr4C8hLYhyDh/ZO2U6vGtNCoaMbI=;
 b=GPsNInHSNS5xyoR2cLsBO4PfPyVUbXXHOE3lzNLlT7FW7xx8xXrI5eYYa7Jc6veVRqpI0kVuLaHvJHY7Ns9gHJ2XAiTPCOwCzV4iqB1wxYiwPBF9v8hBkDZo4ohT58OSxb8T5ltwWAfqUzB+V0UuvT5C4n/RiTeNGVfbL7yweRQRHUvvxbQcAtdt58pou5mCFqbyWxkba2ylVTICCEE0KcWH0l/CLdYGd74wjghuCGpsdDWDfbAnPAiPbPQraIPWQ0LVO03ucH981zVo8BXoz7OjB/rWLgZ06h6mMEarvB2/5oSWphVP8yVsrD/6ieBwWMPXa/vzEa53QHUC8F6sxQ==
Received: from AS9PR05CA0321.eurprd05.prod.outlook.com (2603:10a6:20b:491::14)
 by MRWPR04MB12332.eurprd04.prod.outlook.com (2603:10a6:501:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:50 +0000
Received: from AMS1EPF0000009D.eurprd02.prod.outlook.com
 (2603:10a6:20b:491:cafe::3e) by AS9PR05CA0321.outlook.office365.com
 (2603:10a6:20b:491::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 11:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000009D.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:50 +0000
Received: from emails-7832044-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-87.eu-west-1.compute.internal [10.20.6.87])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 419C281CE2;
	Fri,  4 Sep 2026 11:56:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523010;
 b=qkWO3NpjbIX6I8F11YT7LjGPtVU0ks1lKT4UGIJsDNLXJ2/+k1nniUybNpUybXsTjb2Hc
 rqrpvVwRdaN9vOR7vxjjstBRw5lUAeaVLLneRbutd386udsUQ2nvEYK8XxBGCFaRDQJkgU4
 7E1H2sx8xPWRA0MPmSWse+5XgkXJPlU=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523010; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=8LYzrIeiEw0I47VGr4C8hLYhyDh/ZO2U6vGtNCoaMbI=;
 b=mFc7lnF8ovINIfP4Pkka/jaQzuMiq/UkGK+YgX17jDbeMr2ZXxsDR6R8MWdtm67SGhxqA
 WNVHLRfB2VAhiDZ4+e4HstCAAUPTnm6xnISXCIJO5YIgUWxIF1vRCxQe730xBcnK0fnyINT
 jOO3ChZDKp+GH1ZO6W8OvupE0sNddKY=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LYzrIeiEw0I47VGr4C8hLYhyDh/ZO2U6vGtNCoaMbI=;
 b=GPsNInHSNS5xyoR2cLsBO4PfPyVUbXXHOE3lzNLlT7FW7xx8xXrI5eYYa7Jc6veVRqpI0kVuLaHvJHY7Ns9gHJ2XAiTPCOwCzV4iqB1wxYiwPBF9v8hBkDZo4ohT58OSxb8T5ltwWAfqUzB+V0UuvT5C4n/RiTeNGVfbL7yweRQRHUvvxbQcAtdt58pou5mCFqbyWxkba2ylVTICCEE0KcWH0l/CLdYGd74wjghuCGpsdDWDfbAnPAiPbPQraIPWQ0LVO03ucH981zVo8BXoz7OjB/rWLgZ06h6mMEarvB2/5oSWphVP8yVsrD/6ieBwWMPXa/vzEa53QHUC8F6sxQ==
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
Date: Fri, 04 Sep 2026 13:56:27 +0200
Subject: [PATCH v8 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
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
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|AMS1EPF0000009D:EE_|MRWPR04MB12332:EE_
X-MS-Office365-Filtering-Correlation-Id: a52c5bd8-f150-40f2-a84d-08df0a7b9ae9
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 g+GIy8tfX1ay7AokLDBFV1c07oobBqho7foCLLfE0ExgWpRjISVscmooAUPcDD0sA2EOP3JN/vn4TXo4qWk7D39AlqZDM1Kd0NHGiTJYGqBhtq5FwNpf3vjUzOLGkHaCJcwDO6i7vNyiRcuI023ZMCdHJP4tZtXq7D7MPj7iEpY2DNkO8PH2xEtN7o0MCn0Mk1m7K8+6ycdkPFPUZgc73F8VzsFVjFinAP0LhBkjv8eLtSXzcrtkM8t/Yh9PmWuntBtAxURcn0ShbuWw6YuN6A/aWzaPAEMINSb79l5ngD2sJxj078OLH1nUsLEIDsok3mxHBvrl8FjhrlEdNIuE74Mo1TaNEmQl2hQLJnP3lCMQ0vLN8eUgIZWJojQ2hOu9mTilWseHD2X7Wivyw70b8sykq4QIfmat5LXh1/OJ1r+aNAMfavEqe6uOaJAY8IGClA2KLIURuqCzgd9F1xJqg0KN/FFsqKl/PEQDMRX9HrDPs0D8DRNJI5lqsdiuQF51Y3Jbgt50YpOZ7JPmJdhMh/kutb+qWUJdEAuDGFwdh44aLPv+0P1gUYfKQtDmg+VYK1jTWvvTJjtH1Df1E7EQaryFd+RDHXZPvngc3vcrklPXyJParW41/aamDsv7yIYr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 LKJXE/XT1gxGILGHSBvuxtT7NyAdYSDCMHmP7VZTONfRL3p/WMapJc55TsiCqgHC9P7Zm02m7yQ+GpPxFVDdREkkZF0gfm0EI5VQln92/A/7mlgmCseGnQ2WSvZghN75kweHHHZh5whgGtCgOOOHRxNA0wjM8aXs01YtvQQQqZnZFQqnYuNEdjmoCoOTnqw49EZxQeGycxx0B2YZTtFfvi3yYUq2Qra0GISDHIrE3xQTxPgeJICczaijpqwfzeqyCEEht0VVhxrW7upWVNbZl8ifw1kwcrX2pT5wdgrZIsh3aQkU9BtyNcVAldtXpGDxCidcLUQDJSNPvoYp0vOtrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0315e8f587da4f459383e8e135c76fe8:solidrun,office365_emails,sent,inline:284ae8a1cf75927e32739ded676cd9cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkPeHhpaXD1HUJvDc+ZfzerTaedhKaIt5Xxnbajn78jbPUjlK5PXjR3iB5BbLfWcsdxgIARDgwy2atY9uqqyEvL6IuRSKD4AENPzN3DZ8we5OAddTxHWyGn5jTfASmPOA2cuYa7Ex08JryW1k0udrLN992X2DkvgBVt2aMCccCCTOWWCT6KnD0tiEpX7sIoJ7MoDF45bCnQPKa1rt7KuzJWda+v0J6wM4WdKw20rQe4G1Kn6EYHwdrm61xKSY4KDGkjnm4HyIADKP7TprbVRl8wbobJ9XklU+MX75WgGTaSfpjKxTc3XMPtWrRsblGTQ0OapnqRV8Lc72lLu02Igjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LYzrIeiEw0I47VGr4C8hLYhyDh/ZO2U6vGtNCoaMbI=;
 b=NSi3nZ7hphS4WLMqMocXHei3AmFYjJJLWamAeRlC3mfqcQZPBD6mIbvX2oMeOuu8L3kYn2xRojuKfoPGl7fMdjrNgExn9xd3Tv5B8R9tnlzSu2iH1O4k6Ka1W+46GnggodaOg55vKnczsQLqG00VQKQ3ukpaOFp8Eswg4/pLg/3haZYF8RX6ImIWrC2f7AtM+5qJ0LsKEbo/1OfocnLFzXBndtAuM7tmi0iAXKk9tlntUIHFD7XKjsAuIcnyFPX/X9kWZldv6NWf2BQwwqGlNZupOGOQjpnGuIPPefc/zgzexeM4taJs3SiaGK5gnP47USwNKdeMeTuMH1HxoPtuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000009D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85ba8436-8756-4619-e277-08df0a7b9348
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|14060799003|82310400026|36860700016|35042699022|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xZDT9mwz+CV2zjrjmyxA8foUEf5QKemv5ONkYVGK6mfOedQP6iXqzLSP2OyQMUXLEBz1/3H0ahvZpfEJ2jd9Cje506CC7+H+/gv/cszcVlksjk9FGa0wyBBkgG75OffQO4Lq2syACEyNciLD2RV8tjF+4tDeDPpjbO3lTV9BVNn7rPElXoraJGENjPhc+M3TNVeyzLzFgyhXHUboi9i99DkPPmd5vZVf0f+Y3+qEH0iFzNmIHt7RvuDwOy36bpNUxaMRxtMdWHGlRBVOzHInqVMxxwWnwo0OLTwPWRw+DYEElZS70z//WQQdRHP4wFHqkqmHhyLJFGz0Ru7cmUThJkGrjg/dnhrK4J8sXqCjrLhx6Ign91HXfAlYb4PxD8MvuYu4XN2+J+UfzlsjeG3wF+3wPISQ0h48s2qFKLg/8l/nJyDU3eiZ90h9ZUGXFUAHrXkeiPKqNLO7UCbP0OW3rtgoA58Rnk1W2gWofz85/yyGO7+3DJpUUpAQHSnFQ5Z6X/5cvCfzkv4Em/EHmZy2mGLqaf14A4uWUwrGy/7SwrpqsyMV2XyqsELB3fJJijtMX36oJvjH9j0nZX+wf14rOTR/y/HaEg9Wahst28EL+enGZmbhJBOKo2xQW3ZDipYC
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(14060799003)(82310400026)(36860700016)(35042699022)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rl6FvPMoH/iq+ZiTL709Pm25TPFR1kCq6mWFNvfwdcSd12bGKnsQTvXAyD+T7WvH9loPg95+qk4r93qxc7PIQ71/LyTx/i6jYqqXKxXJuuJQLvIg0LvwovCXa+zT2pWq4mE8wMY5Tm1XEtDlQkUUFFr0KyAzHbuJU94NnS9f2uHlYfAfLDlCgCuQcY/yOKn9/ExkbhNtOIIWkDRbot5nAULHmRzBRXWwpM6C/QV/Qmlvh5loZ/xWfMqMHexsVEqXRNNzgcR4zw77yGfQ5j3lCskaQHv3KRS55Eb17dpwq+IvV99N/ePb173r06JlfAMlLLlXhzgTOmwnnCjFAKRhJkpvLMpsYotT292LI2c+aatOYhGfi1RTETSC+M70mFssu06NCpWFe1CN2JxR6v1KbYlzpV71802MkclBg49MIIx1JrtWJAAsxXpzzTxc4s2O
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:50.5140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52c5bd8-f150-40f2-a84d-08df0a7b9ae9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000009D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12332

Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
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

While the variant being supported here is named "Ripple", shared include
files are still named according to the full board for consistency with
schematics, silk screen labels and other SoMs on same board.

Description for microSD is shared with HummingBoard IIoT.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   5 +
 .../renesas/r9a07g044l2-hummingboard-ripple.dts    |  16 +++
 .../renesas/rzg2l-hummingboard-pulse-common.dtsi   | 114 ++++++++++++++++++
 .../rzg2l-hummingboard-pulse-micro-hdmi.dtsi       |  79 +++++++++++++
 .../dts/renesas/rzg2l-hummingboard-ripple.dtsi     | 127 +++++++++++++++++++++
 5 files changed, 341 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 0bc2bbff9370f..077e8ebea0cff 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -197,6 +197,11 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-b.dtbo
 r9a07g044l2-hummingboard-iiot-rs485-b-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-b.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple.dtb
+r9a07g044l2-hummingboard-ripple-emmc-dtbs := r9a07g044l2-hummingboard-ripple.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple-emmc.dtb
+r9a07g044l2-hummingboard-ripple-microsd-dtbs := r9a07g044l2-hummingboard-ripple.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple-microsd.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-remi-pi.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..22fea75d0ec25
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-ripple.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2l-hummingboard-ripple", "solidrun,rzg2l-sr-som",
+		     "renesas,r9a07g044l2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2L HummingBoard Ripple";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
new file mode 100644
index 0000000000000..b0ddd426241ab
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &pmic;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-max-microvolt = <1200000>;
+		regulator-min-microvolt = <1200000>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		startup-delay-us = <250>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+
+	vmpcie: regulator-mpcie {
+		/* supplies mpcie and m2 connectors */
+		regulator-name = "vmpcie";
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+	};
+};
+
+&ehci1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		vdd2-supply = <&reg_pmic_buck4>;
+		vdd-supply = <&v_1_2>;
+	};
+};
+
+&i2c0 {
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&ohci0 {
+	dr_mode = "host";
+};
+
+&ohci1 {
+	dr_mode = "host";
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_ORANGE>;
+			default-state = "keep";
+			function = LED_FUNCTION_LAN;
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "keep";
+			function = LED_FUNCTION_LAN;
+		};
+	};
+};
+
+/* mikrobus uart */
+&scif1 {
+	pinctrl-0 = <&mikro_uart_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* mikrobus spi */
+&spi1 {
+	num-cs = <1>;
+	pinctrl-0 = <&spi1_pins>, <&spi1_cs_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_vbus_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi
new file mode 100644
index 0000000000000..80e43510142ab
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	vmipi: regulator-mipi-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vmipi";
+		regulator-always-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_from_dsim>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c0 {
+	hdmi: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		a2vdd-supply = <&vmipi>;
+		avdd-supply = <&vmipi>;
+		dvdd-supply = <&vmipi>;
+		pvdd-supply = <&vmipi>;
+		v3p3-supply = <&reg_pmic_buck4>;
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
new file mode 100644
index 0000000000000..5e043e40641a6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/leds/common.h>
+
+#include "rzg2l-hummingboard-pulse-common.dtsi"
+#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
+
+/ {
+	aliases {
+		/* this board does not use second phy / ethernet on SoM */
+		/delete-property/ ethernet1;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
+			label = "D30";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(47, 2) GPIO_ACTIVE_LOW>;
+			label = "D31";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(47, 1) GPIO_ACTIVE_LOW>;
+			label = "D32";
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(48, 2) GPIO_ACTIVE_LOW>;
+			label = "D33";
+		};
+
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(7, 2) GPIO_ACTIVE_LOW>;
+			label = "D34";
+		};
+	};
+
+	rfkill-mpcie {
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&pinctrl RZG2L_GPIO(14, 1) GPIO_ACTIVE_HIGH>;
+		label = "mpcie radio";
+		/*
+		 * The mpcie connector only has USB,
+		 * therefore this rfkill is for cellular radios only.
+		 */
+		radio-type = "wwan";
+		compatible = "rfkill-gpio";
+	};
+};
+
+&eth1 {
+	/* this board does not use second phy / ethernet on SoM */
+	status = "disabled";
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
+	interrupts-extended = <&pinctrl RZG2L_GPIO(9, 1) IRQ_TYPE_EDGE_FALLING>;
+	pd-gpios = <&pinctrl RZG2L_GPIO(3, 0) GPIO_ACTIVE_LOW>;
+};
+
+&hub_2_0 {
+	reset-gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl {
+	mpcie_rst_hog: mpcie-reset-hog {
+		gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
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
+
+	usb1_vbus_pins: usb1-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>; /* USB1_VBUSEN */
+	};
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_vbus_pins>;
+	pinctrl-names = "default";
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(4, 1) GPIO_ACTIVE_LOW>;
+};
+
+&vmpcie {
+	gpios = <&pinctrl RZG2L_GPIO(17, 0) GPIO_ACTIVE_HIGH>;
+};

-- 
2.51.0

