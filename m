Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023140.outbound.protection.outlook.com [52.101.83.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F9F4E324A;
	Mon, 28 Sep 2026 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.140
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616866; cv=fail; b=bN+Wkmed43gKpQJw/prxphQEU46s3VePseoDdY3UoQiVeYEt1Sg4wORjxLOYLWdjDYe9cukWe9k1u74UuvG91w+DYFIlnv7EOhc2S1+p34bbF9GuYOUouQ7A4Kjoi6FoL+tx6zWiLINV6Ky3Ju5z6066QMq7KjAoYkadD+h+6b0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616866; c=relaxed/simple;
	bh=erZnZ4AiCq4hdwHpdupfzp2JDn1Gu/AQ8NbzPHj7uX8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Nj+t4DrEzLDE49P/6LAdERHFBprwIjuiYrGlD7F/dKFIJ9Wv3zg+7okrOYO8dSQMSW223g4PGXr+tUh+AMfU2GF9uJukwuk+ULqREOCWI0/ycJc0wrkdSIhrBLviiJ24R9JE8Kref2AbKjAElmR30vA5mFexDINO/aCEN1aLSm4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=sn0FlNKZ; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=sn0FlNKZ; arc=fail smtp.client-ip=52.101.83.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="sn0FlNKZ";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="sn0FlNKZ"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RFiZmlfUeY6HnOcTWFPM0rP4SLywy1yvWONblLZT7EgZ5qhXEnWMrMi3TujZQrQ5XgQx8v4PBBqBgbD95uWlQn8D8aOFJDFaXHwft8lfTzQU5GAJ3XnRpYicC4dBNl2cPPl8telEtAfQkI+r5sOcwVsDRvVWQDj5mYVZJysn/argzbAShjX5awg7Zwu4ETVGjAug7uIxQd21V5LBPTDxOcIYjug07K3G380UCNL/cAPwCJzp9BMY4gFRxLihns4xUk1mkLGMFp3K6BTixY/4KFUOxdXq5IX1QyCjmqHSgmfq9IT5gPTv41eCXoeABiE/VqACgmGx1TrMzUdquDSXDg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2MScaxYhhrXesLwNLVDW58g71ywvclTDmJ826xiUXE=;
 b=owMvCEJz6M1qgkmTmwQc4x3dRI5A13p7i61Q1EHvaiRKzKU56nRNHegbKM7Q7qGWutdJCnaD4UN3UUdCBTmvmonIzC7jRKjXQzkH1iLjsO44GrqvmmKn9Zlg28p3VWl5OCggti06yTX0WxuEGoaOnD7OYSHwTZVFiLoaE67fWRn20puWYn66Tcb83hdm1tHlFk3L0SuP1E3PLql9Kh1qbucjoNE+utpmxlzOE0pspQDMkzenza6SqriE3VHO8CA/kNG/E0Yy+xvByTYqlM30KuETRUsIhMeg+lOdFHgrVLqF1AfWuocLr1TdkH91YmyQO3gT0IDn8jkHRWJkOe6Oxw==
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
 bh=x2MScaxYhhrXesLwNLVDW58g71ywvclTDmJ826xiUXE=;
 b=sn0FlNKZev9lxRFr6LXHzPpqXiaB45+5A1o6IJbz7tYiWOut4CzQlpQ2eYtr5h5Z9kCIryVz+DCdujI6yDs3JMkT4KJb6MTQneQDDrfa41PE17TaYcUUiwtXOE8veU9E5g5WFtM/v5iq9VUcdFuC1HVP9Da0HlDx0MWRfwJ1tfNDEJoCV62jRDdz4+MrUDpAgffJzKNDXt4cmRsyqne+i8dueUVRwVn46KkOl1W0b2cM+GYfgBwEofueFcQhbzP1tjeTV96c04E/e7wfAY0X9g5h7N4Ro8fqHrvqlpeBrvkUgwFO8dsO+SjpN17TNNlm6GjQuvjge2OtZxttYmbgjg==
Received: from AM8P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::25)
 by DU4PR04MB11339.eurprd04.prod.outlook.com (2603:10a6:10:5ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:34:15 +0000
Received: from AM7PEPF00000057.EURPRD83.prod.outlook.com
 (2603:10a6:20b:219:cafe::3) by AM8P190CA0020.outlook.office365.com
 (2603:10a6:20b:219::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 17:34:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM7PEPF00000057.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.3
 via Frontend Transport; Mon, 28 Sep 2026 17:34:15 +0000
Received: from emails-3111997-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 5465C7E951;
	Mon, 28 Sep 2026 17:34:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616855;
 b=nrw7G+TP23xfoFBS96IN7x9YNp49nbYqh0N0kWv74Z67gdxMhY5amW5RyrUL2esh6qwil
 v4bM2fc7Er2eod2E+4LdS37JUs+SSUq7mRIzugnv68mTIBb6MlTzFUMwrCgUah4X/lxj18Z
 EVlMpljkBjne3aDqpk/FHaFjqWqp3eI=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616855; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=x2MScaxYhhrXesLwNLVDW58g71ywvclTDmJ826xiUXE=;
 b=ZX/ZJjpVdvmbCvBCSZOp39fuA9lDeFjgQoPs2Zhc3RgOLvZm7uF68cQma4FLLAlXEFa3u
 7azqW6duhE4tiOsTFUA9pMiQQGsNbs8LydUVZMdjYrC4h54opLLb7DeVSVeybXeWnv4eHnn
 jRDguhGDnAjhbg7AKPVlD5D8bahDQ7g=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2MScaxYhhrXesLwNLVDW58g71ywvclTDmJ826xiUXE=;
 b=sn0FlNKZev9lxRFr6LXHzPpqXiaB45+5A1o6IJbz7tYiWOut4CzQlpQ2eYtr5h5Z9kCIryVz+DCdujI6yDs3JMkT4KJb6MTQneQDDrfa41PE17TaYcUUiwtXOE8veU9E5g5WFtM/v5iq9VUcdFuC1HVP9Da0HlDx0MWRfwJ1tfNDEJoCV62jRDdz4+MrUDpAgffJzKNDXt4cmRsyqne+i8dueUVRwVn46KkOl1W0b2cM+GYfgBwEofueFcQhbzP1tjeTV96c04E/e7wfAY0X9g5h7N4Ro8fqHrvqlpeBrvkUgwFO8dsO+SjpN17TNNlm6GjQuvjge2OtZxttYmbgjg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:33:56 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:33:56 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Mon, 28 Sep 2026 19:33:51 +0200
Message-Id: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP+kumoC/23RS04DMQwG4KtUWROUOM6LFfdALDJ5tJGggxIYA
 VXvTjoSmlGTpS35s63/QmosOVbydLiQEpdc83xuBWcPB+JP7nyMNIfWIMBAMcmAlt8j0FroNLs
 SKhU6SKmUMg4CaUMfJab8vYovr60+5fo5l591wcJv3X9K3FMLp4waiVJpnazw7rnObznQ8nV+9
 PM7uXEL7AjOOwJuBLg4TQG0sXxEiD3RPbSIRiQmRPJWecvUiMCN0IJ1BDaCmcmjtFKb4EeE3Aj
 DbEfIRnDrlQIhTRTDK9SO4P0VqhHIk3MCfHBpGhF6I2wf7voIupaIQ4AU44gwewI7wjTCokel0
 YKOZkTYHQGmI2wjpGU8spZJRLwnrtfrH/XS1LTJAgAA
X-Change-ID: 20260502-rzg2-sr-boards-37d556668a2d
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
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	MMZPR04MB400504:EE_|GVXPR04MB10045:EE_|AM7PEPF00000057:EE_|DU4PR04MB11339:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acf269f-2d87-4572-9c3e-08df1d86b7d9
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|7416014|376014|52116014|1800799024|10070799003|366016|18002099003|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 Es78ikU4kJnHavgrKs4daZlQK6D1YS5LwIgxngSSjUNJ6SYx0NNmWhVbIXZTA42dBpb9/ZON4jsfG0Du8HQqvF/W2YURfOg2GNRjRisBqWCS5K9ipzFDnA1knLjILbC/gzT6VkL0AhjvsJGh1spWSyI/X7q0OiX9QBAk/eVPvIDPm4dfu7Edh1gGj34mn/5FvmWz6ZsybzoJtgTyk8PTp6LVXItqSrlGAm+nYX6tZYm0q4Sr1X55Y72YECjYpZM8t90Wn06dMoc4mfbrDss5xH2ZIB7QXndaccW74qtfe84S4uVhljJZKcDDXqGTKJLr5V65WwWqUL4mtqRsmJVy6gRSPeUmgGjGiuQP1rCvc0rk7V+q+7JHN4uHHR3oVl+YylGm5YQk+WODD7XupN1ZUsqUEyeFpMbKQ39VGg571BHZakIywmwW9thP6E/u3z7P8VDt7EjxWyQ28le0g0Tu0HCE5Tmb7EH7p8I9+8kPrfxYb4XX4OY0fXpTiBuQHoFJGss58kf8FNpMezPy2AZx8cel/Ui/7pf6gA9jl+yXgkMnBzDxoUrrjYDbRkcGGR+MQp+RG7S7xl6jJDsouna3tK7offIShVGRQwY7alcRZTRGRjIqJkDh47PHRtyD995H
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(52116014)(1800799024)(10070799003)(366016)(18002099003)(3023799007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 fJPJig58nr40KNytovDaDzKHX9q9pJuMJofhmfTZCkRvB2jM6IayYiQ/GiNTjyeA1+z/NDgbF/dvkrCwy81H+zZYwBU8uDb8y+wAWFXK7SEgysOnYCTE5WpBTxkqAT1Nl9PHjS3Vg5lUIiyjQWz2RAVYhpxR+m40Cw3hwkKw86SJ7e43K9/JS5dw39UjWBaLBPtRLVDy0D34/TJb+HVCnQ6OCmlYDSOdbZpjYMFH/4tPbWcpw42lYS3gmO5/XJhNCmKCli8CegFd+fqJDO75sC2FHaJPkPpOtha2NjWSlI6tYbnr+w9AspO4aW9gnRwiig4KlTff1Fx65zXp0N1H5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b2bf4606294640938e5a6ab011caf9c3:solidrun,office365_emails,sent,inline:431e4d72ac0236e5ac17ab1cf7925720
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTza3+bb2gU1T3pL/bltK5+IBG68g32qA658vS2K6PNnb7CBVPFPkuKUBp7IVDJ7jvuBz9Dh4oSPxj6ysIXrgmoIwAP7Y557Kd8fSy7wL440j/YDd7B8MJHQklDIenjDtEzwD847T93eLdRg9/owGumnWusRGshjnFaY9BXtwu4S8ZtFpKg/Doj/ohjQBSMgA+2Dv+2DyUkYHZmR6HAIWDTZgWT0rqHtdgfqZTT0IzPNJdFlBkm2ZW/IwDiSrfXUTgD2JrZVv43RcyS1mDTG8sKFkwMuTCMbfyW9JQ0/M/w9li0DVRVnWgWKQ2AIS3XRC7xjPXVwfkNtTPhewVOPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2MScaxYhhrXesLwNLVDW58g71ywvclTDmJ826xiUXE=;
 b=kJiIDrvYxnsZfWMHdoMdNWZ4IUmM9WQVwwwTYAawGrgD0WNEMKr/R0XrImGBA39XAu+937XWDxUN+AxRXY99M2WEH3x5WwIb4gBFBYMcN8+47x2Z7EVyxkTO+PgeYG9evRk2btT1xe9UypeHxUrTibB9NKOdrWLcXXJYkOIUGTqhyQdmBEBgOH+Q63BKM/UWGoZr8pkJOUc/BHMB80EL2CFB98qxk8Nd+lwZzMxxOrbgWprBjWfEmySnETb9ToYvSMfdNcfo0wVlwFSvJPaTCFI5jhw0YYWivMqrLfyTCn9494Jw8XhpcOLjcezTw6kkdMz2/n6w9R8CRCn4jpzgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7PEPF00000057.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3672c994-73af-451d-e805-08df1d86ac48
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700016|35042699022|1800799024|7416014|376014|23010399003|10067099003|56012099006|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	jI9DOWPwSNHq1KT5lrlv/5lxjELILjlFl6xTPdrCoeP+59L2S0/T6polZ85YV6+TXW+GQt/nA16KwiZ1C6rvnX9/K5GSw2VKLcd92E8hQYsSH+/GRGHZMVXjPqQg5Z+o+3rc2m9cJaV6ShO8UIa7lqFK8kq6DSSwpbmf4+p+jPZXTS8cRDngQRka93/uJ64OANRVpGKFFZzo7oFirjq9dvjUg4/dvnqXsTArdYv0DDUmTzJVKM7Y44myUKPSFZJQ+9sQA5Vr+vBLfYHAxP1ntfeOjJ3YlUZKGarTpsbUMuyZ+IZ35hPXiHbajZYqXhsb5sNyQWqO9S4yLwbDCUhO1njuHijxFpCIT5QbWfJ1wU3PmlSfNszHomIyB+npH+KYO7OXGG9u04AaTYjOBJ8erYo1QhuSQrRg9+oZmvU3g3eGHt6B6PRxxITtuGIQJOy/0OkB3TZBobZI0S9J6CZTmBzMDel5wk8Rg81S3qWDAJzIBtFXAduCwP7B1Ck0OMJKY3/XGJree39GF91qfOYCT3DNkvuaOHg+BcFuN7+AhIlwk7V3sUrq7haoW8wTJxW50QQVi28wP7OZWWeCm7xvHIQ4NMev3gjsqLFFHyyy58VX7RamdE9P9OFzizZxcbAfa6I+p6Tdzivh+bXaeIp1WQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700016)(35042699022)(1800799024)(7416014)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1ui0QBrPPvAL5oh2nnSkhS3UlD0ubo+jmJ+Nbsstk217/MIhaj7XsiU8gjJxN/r7rrHXr25HnWx+Ca512ZKZPZGWMJlTMbw2+nlVkecHL2R5fMrYh38yXqbZNbvRzV1BxOUnzrVcR5F8gJFhbbESbGnJjucHctI7oJfOnp2kXcNrySnZwm0si6B3vmQxOIHAIwJs+6xw5fMfY0V3GLTq1UHXrVZ+OK0GDhuW2J7GtV9b0KdLLXxl2K5BFIaP+Q7P0t7wEdHo5CyJaI7XuLLFrr7ya0/t3EGD3F3D49wyEEMyt+3ANdIxMdSdakIdttElfxUbAh15zzC2aFMvCNBbQEsLM6uXF4OPem7aYhvV0qcY6DkFKQvNaCI+UIb2RTo62kmDjtC7Gw+P280Im9V3nx/fqaIy0bEw9ZmgTJwYZPaf5S5L4unPkbj98BznsyHi
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:15.6155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acf269f-2d87-4572-9c3e-08df1d86b7d9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000057.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11339

Add support for a variety of SolidRun RZ/G2 based SoMs and both
HummingBoard IIoT and HummingBoard Ripple Evaluation boards.

Bindings are added for all SolidRun RZ/G2 SoMs:

- RZ/G2L SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
- RZ/V2L SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
- RZ/G2LC SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
- RZ/G2UL SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/

And each supported carrier board:

- HUMMINGBOARD RZ/G2L IIOT
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
- HUMMINGBOARD RZ/G2L PRO
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
- HUMMINGBOARD RZ/G2LC BASE (Ripple)
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Device-tree are only added for the IIOT and BASE boards to reduce
initial effort.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v10:
- Fix duplicate micro-hdmi include.
- Drop G2UL superfluous reserved memory nodes.
- Drop linux,multimedia reserved memory, downstream BSP leftovers.
- Link to v9: https://lore.kernel.org/r/20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com

Changes in v9:
- Drop gpio aliases not supported by drivers.
- Added missing include for hb-ripple micro-hdmi common dtsi on G2L/V2L.
- Moved hb-ripple led bindings include to common dtsi.
- Use preferred regulator naming "regulator-1v1" (instead of 1-1).
- Fixed inconsistent capitalisation of RZ/rz.
- Collected reviews by Geert.
- Link to v8: https://lore.kernel.org/r/20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com

Changes in v8:
- Added RZ/G2UL SoM.
- Added HummingBoard Ripple.
- Added SoM Bluetooth nodes.
- Fixed renesas pinctrl binding commit message logical inversion.
  (Reported-by: Linus Walleij <linusw@kernel.org>)
- Changed memory start address as suggested by sashiko,
  and clarified reasoning with comments.
- Dropped invalid fixed-clock from g2l som.
- Sorted reserved-mem nodes by address.
- Split eMMC pinconf nodes supporting input-enable only on data pins,
  not on clk. Tested both microSD and eMMC overlays (v7 only tested
  microSD).
- Made capitalisation of "HummingBoard" consistent in commit messages.
- Clarified G2LC SoM has 100Mbps ethernet only.
- Added reg property to dsi panel overlay port node, reported by
  sashiko.
- Collected review tags.
- Extended rzg2l-pinctrl to allow both input-enable and output-enable as
  requested by Geert, kept Linus' Reviewed-by from previous version.
- v7 was sent with "v4" subject by mistake, resolved with v8.
- Link to v7: https://lore.kernel.org/r/20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com

Changes in v7:
- rebased and tested on v7.3-rc1
- updated explanation for edge-triggered interrupt between SoC and gpio
  expander.
- set interrupt for ethernet phys to falling-edge because SoC does not
  support level interrupts on its gpios, only on dedicated irq pins.
- Fixed sd data4-7 pinconf nodes trying to avoid cross 1.8V/3.3V domain
  conflicts when data0-3 are muxed to SD and 4-7 still hard-wired to
  eMMC. RZ/G2 family does not support bias-disable property, and
  power-source property applies to all pins of SD0 as a group.
  Instead added input-disable as the only feasible measure on
  fixed-function pins.
- Update dt-binding for rzg2l pinctrl to allow setting input-disable
  property.

Changes in v6:
- Drop currently unused usb-vbus pinctrl nodes from som dtsi, reported
  by sashiko.
- Fix duplicate pin config mistakes in split dat0-3/dat4-7, reported by
  sashiko.
- Link to v5: https://patch.msgid.link/20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com

Changes in v5:
- Clarified sdhi mux dt comment on mux and gpio states.
- Added microsd & emmc dtbos to Makefile targets explicitly for V2L SoC
  too. Reported by Sashiko.
- split 8-bit and 4-bit sdhi pinctrl to avoid theoretical overvoltage on
  hardwired eMMC DAT4-7 pins. Reported by sashiko.
- Moved dr_mode from usb phy to controller. Reported by sashiko.
- Collected acks.
- Link to v4: https://patch.msgid.link/20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com

Changes in v4:
- Rebased on v7.2-rc1.
- Addresed sashiko comments for g2l som & hb-iiot:
  gpio dt property -> plural, irq levels, memory size, usb-3.0 hub.
  The usb hub ids however are correct, 6502 and 6506 are usb-2.0.
- Addressed sashiko comments for g2lc som & hb-iiot:
  gpio dt property -> plural, vmmc gpio polarity.
- Link to v3: https://patch.msgid.link/20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com

Changes in v3:
- Added explanatory comments on won't-fix sashiko findings.
- Added cap-sdio-irq to sdhi controllers used for WiFi.
- Drop redundant addition of common device-tree overlays to install
  targets of G2L(C) SoC.
- Add common device-tree overlays to install targets of both G2L and V2L
  SoCs.
- Assign kbuild composie variables with := operator.
- Link to v2: https://lore.kernel.org/r/20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com

Changes in v2:
- Added relevant product page links to each commit description.
- Added product page links to cover letter, thanks Geert.
- Link to v1: https://lore.kernel.org/r/20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com

---
Josua Mayer (11):
      dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-/output-disable
      dt-bindings: usb: cypress,hx3: make peer-hub property optional
      arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb
      arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add dsi panel dt overlay
      arm64: dts: renesas: add support for solidrun hb-ripple with rzg2l som
      arm64: dts: renesas: add support for solidrun hb-ripple with rzv2l som
      arm64: dts: renesas: add support for solidrun hb-ripple with rzg2lc som
      arm64: dts: renesas: add support for solidrun rzg2ul som on hb-ripple

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   2 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  37 ++
 .../devicetree/bindings/usb/cypress,hx3.yaml       |   1 -
 arch/arm64/boot/dts/renesas/Makefile               |  73 ++-
 .../renesas/r9a07g043u12-hummingboard-ripple.dts   |  89 ++++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../renesas/r9a07g044c2-hummingboard-ripple.dts    |  93 ++++
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../renesas/r9a07g044l2-hummingboard-ripple.dts    |  18 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/r9a07g054l2-hummingboard-ripple.dts    |  18 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 560 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  79 +++
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 .../renesas/rzg2l-hummingboard-pulse-common.dtsi   | 116 +++++
 .../rzg2l-hummingboard-pulse-micro-hdmi.dtsi       |  79 +++
 .../dts/renesas/rzg2l-hummingboard-ripple.dtsi     | 122 +++++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 473 +++++++++++++++++
 .../renesas/rzg2lc-hummingboard-pulse-leds.dtso    |  48 ++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 436 ++++++++++++++++
 .../renesas/rzg2ul-hummingboard-pulse-leds.dtso    |  48 ++
 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi     | 418 +++++++++++++++
 26 files changed, 2913 insertions(+), 2 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

