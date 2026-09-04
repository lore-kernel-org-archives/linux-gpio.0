Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022118.outbound.protection.outlook.com [52.101.66.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA57481A92;
	Fri,  4 Sep 2026 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.118
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523021; cv=fail; b=YikXGcXYA/J/aQ8hXqhBnuKpdPU8cWMLVwTJpoV8mtEf78UTdVMjJh3Raw+KiwD0DCMhc50BJc0fumGw+zBd29Yqv+PxXeZ8BQh/39hHtN8vfBI78aVuJ14xb82CgqNCJCRRDkbMEZabIkBx/2jvkxYlsidLv6BQf6V50G/hDss=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523021; c=relaxed/simple;
	bh=SJAqtKrqvvLKf07XosCRKjpWlYDYRzqFaKKMvZmG8ts=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lLnkYCssuriOFykgM+baFX5RFwMRF271pei9JHjiQtqWcmkDqVP07o9y1cWRMnytcSEaVV3Of4iiGmNppc+CsJioH5vyG8nVjshNpx1SMmmMFl4CbJzaUli9R8kieQtfVQeMyWea9Dk4pFiFVKWnYSn7jK+qV5I1IbtY86UJF6A=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=JP/qSK21; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=JP/qSK21; arc=fail smtp.client-ip=52.101.66.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="JP/qSK21";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="JP/qSK21"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Rdq8hb3y0HVJqkvectCYFD+ubg+2sue1S+CfLtb98v1dpgOyE0RkqxyhamzrghIHotb9DretQmBK0iEBWL1ttCMEfIZQlZGfTbDcO9dccJeMWuoFjqH1oYoESncQbR8VdYax7x0sjWOBEThNHa/zrP3u6OsJeBNXs6mxN1PI9FLqEnc5AIyT1/7X0Qvl/CNKqpxLaplRvBPAxV2Ls9IEePXJ//alU1e3oaRBDSY+8r24YdMj1lVINksdgpPrVe9ERxiUJhk9BUxWbRWtkppyA48Pa/zJfGp0jQ7wAbNJ2DUXSav+ksusWi2zP59UGHSjjPWy+/DKVkUXfcF6c2Ioaw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agAewO41DZ/zcWNVTRKZ5srpxXt2Gy1O+r4Ym3tXmdU=;
 b=fwMQqB7EVA78iG8eHiaXOnCAtunwb7Bk/N/f5gzlCh8jZAq9PsQ0fzR7YPF/Vu/T6DZDLmftYAKbNwSIo514dAkhlP3tuJHxhr9z16fmqADyWXPwtBSu90lu8tgjUU9djwRwY8XL6l5JMmQliMavQ6fPYQ6rGDgkgzFF/afVLkh5OJXPQPdn/5TsZ4Hh3qI9Zv076IJ/9cX4PPpEOO96X32NpFDq1mroR3siUgvTKsdffJvrzaAppbxI3Mq6+JoXYuUTvOBzm8FItMo2wU4p9s3PGqPWJesmCSea5PN8mlWW5xcs8u+UvJ9UBn0A0puuuFAtBrfs+QSAvSuOlqI1Vg==
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
 bh=agAewO41DZ/zcWNVTRKZ5srpxXt2Gy1O+r4Ym3tXmdU=;
 b=JP/qSK21oVWvjP+XDgILvEI/pHNonSABgjoRh+QAVYTCDO57p5gA/HtvDw/n/EslBZrBFPuqlRm/v9d5Ms8FajeivU/UCiI/H7FI9ykWUR/06FG2UhljBMy6QHQXK3WICAHJtYUJHMqcKsrUR6Vift5AhSVWsOKXDtlb3P97Y0Mr29pLLkBL8Oq9SgfCRwrZQ9U09Jkz9+TzcHJ/8w+ehrafWeO/VzIsGuSluUTsF4RrhepwS0CyvL0XAqCI9ez/kTpMiYvJBfbdT43SYYRtS10arGrvdMJM6kJ4ivfWGS1jCmHFiD1/aRz06dhvblsEztxk8hw6mCj2Hqvm26TCdw==
Received: from PR3PR09CA0008.eurprd09.prod.outlook.com (2603:10a6:102:b7::13)
 by MA6PR04MB258777.eurprd04.prod.outlook.com (2603:10a6:250:58::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 11:56:53 +0000
Received: from MAD0EPF000008B5.eurprd04.prod.outlook.com
 (2603:10a6:102:b7:cafe::32) by PR3PR09CA0008.outlook.office365.com
 (2603:10a6:102:b7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 11:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MAD0EPF000008B5.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:52 +0000
Received: from emails-6378051-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3CE2381E1B;
	Fri,  4 Sep 2026 11:56:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523012;
 b=ecVq0IPQ49rflcyICp/OSnPk7F1d6EC1dA2vyowC9CLdDI1NS3Z8W1JovCkOT8oaT95/3
 d0EP+ABUfbQSSdXImtI7LgTuE+VWLIEImcp/ayIgqNNtWgBlNyt+GfOMMO7sSqyHHAGsiy+
 AyFv1oqZ9WzNa++AAfm3bZkWu7YrBOA=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523012; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=agAewO41DZ/zcWNVTRKZ5srpxXt2Gy1O+r4Ym3tXmdU=;
 b=YZYgzaGhUVXoprNJgWB2LfVyMsnMsvhKnA3qhoUFiT5V55XANJSXMwxtwJqlyE355JFpb
 tyLvDR82OUkZyXEbzAEJ4xGpHEmB+HsDIszmZErDWxt47pDRfJTfypmMg1BmzEwjekacu8N
 Y5YZfkPXxi4UhextMjbMvHtQDPjvKpM=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agAewO41DZ/zcWNVTRKZ5srpxXt2Gy1O+r4Ym3tXmdU=;
 b=JP/qSK21oVWvjP+XDgILvEI/pHNonSABgjoRh+QAVYTCDO57p5gA/HtvDw/n/EslBZrBFPuqlRm/v9d5Ms8FajeivU/UCiI/H7FI9ykWUR/06FG2UhljBMy6QHQXK3WICAHJtYUJHMqcKsrUR6Vift5AhSVWsOKXDtlb3P97Y0Mr29pLLkBL8Oq9SgfCRwrZQ9U09Jkz9+TzcHJ/8w+ehrafWeO/VzIsGuSluUTsF4RrhepwS0CyvL0XAqCI9ez/kTpMiYvJBfbdT43SYYRtS10arGrvdMJM6kJ4ivfWGS1jCmHFiD1/aRz06dhvblsEztxk8hw6mCj2Hqvm26TCdw==
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
Date: Fri, 04 Sep 2026 13:56:29 +0200
Subject: [PATCH v8 10/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2lc som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
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
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|MAD0EPF000008B5:EE_|MA6PR04MB258777:EE_
X-MS-Office365-Filtering-Correlation-Id: a70ffff5-a0c9-42be-0c10-08df0a7b9c43
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 HrJogsdWZrlb8paE+XLETv7XIjShOzCh8c/ThCZ3PRvLVoytFG4zxWwazgoPU4Un8/Aip+vo2+eX8jdd4Ff8WFLTd8epGByXRdUbuJE+ywvZo99wpcsmKzqjm0l1FlXLoqMCXHFkUWblF0i1hjbFKJNehP6EUbd+Z+VTJ6hKWM5ovVRpp4t4e5bC/tT0228ZzCF9bKg7Yu2+La4tRhyzH59OzKjZEHTDyRZT3T18haZ9jTdN4QnWh1f8bxexX1WUaLFLTQKPvAWUXdyjlBq6PX4WLl03BSJpEMGp5+Oly5BTMeTrry7I6Ze0u2McIYUP3eAzazGfUqokksm55V+y7MOWoS7q6MfCNZtOtSQ34EXRbFKJn9XxC0yv9faqx8vyhmG1SpW+qE99SfmLUwNGtAkuDHzDQPrs+TcECzKaGRnh5zcP88ZilqYjflosinGzFXLGYFdmWtP6DC98oUAgmxfBOhKk2Krkq1Tt5zFbcvY8ZRsJ516Y1Q4tbH7PGOOqHTzcBxNEujW2hevm2kOwON5gdpMRLnikl4ifwnsGWHs/5AvBrj6rAeLGrOUWlvind3JNwEez9sHOPGD6A4vnBbEBwdXdvMvtwtxyj8W7iZZEkF5OfJ0uPqzQlOeiCiF2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 SBmqgG71AsxfAnLwqHZoIs6UAv04uZzL8AdH5cWWoOkwcVkSDZCXDgwyvQGOPFdKvNvguOIQCwRoyf4i1sFFAaJSvjBO2ghFj/gwwuVT+PsvTEa3AV+kwxUSoJTxST6tOfokIK+DWEB4NBUEsf+lyd4CJ48c4rUfbQbgbxqx37ATyEZkrf5RdKa74D7kcIAjCjRwrSzHyG3xUKXKKOEBzasHL5HTdotIl4Gvb7GUpi86RCb3GITUnfBX1Gs1D6MCX1lvgy3UO5Y5veWt7YtERtERJV0mGwSxLFQTilCRphLew06Xs3U/46xERIbVvV76DPeBDnQ5VcVGqgwt/v9fIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c20a12f41e04489fab56fa8871c2f0a0:solidrun,office365_emails,sent,inline:284ae8a1cf75927e32739ded676cd9cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrMgKBKbsTaQiUIewbiZsrAlp+5kww0rYUKA0pvFDKwjPz1ShfYNZja40ZeFRdc2SQw7+KinyAJwMgVrXkF8bphzg3sq/mTDV5u8R9vYPICqKhyiTEb7ezjWA0DQMDlF29BicFBj6+NIKB5qRDWugCQcQ0veI04GyIuKKh5mkFKku+IPzxoiZUsAhP+0dv0kqRdicSZJzEQQPmdqSl+T6ga5c20nFL1MhTCXNA84JOpXzJ7zODMT5tTEK66j4lB2FW9cuiz/FrRE2B+cPxdO9WEbaejAz44X2eKBG1TNqSRxGJ9SBKWMddUUp+X1YyACFQyl1pIZ5aMVMg/o5CxOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agAewO41DZ/zcWNVTRKZ5srpxXt2Gy1O+r4Ym3tXmdU=;
 b=PxLAVJ4+qgkAZi6amUPBQmoRq5pYiMnKKFVNhrFcTqJgDDfa7KqqnHiuBZOIIgd4Y6s5YSbqL4mNanGIt1nAJqDMnXQnNfeiEPU77wPccwalDh+RYkjMi26wHp3UfmT+06VSSsOD6sQgm/S7SI85D+ZC4tHfyimak1VNFrFqwzOZJcp/rSKVLqhRc4/lS9LUHDCoWKdQoAiR0ghmLuZ9x0Y/icwxE882UlQwti23h5YrJAg17ooYGIjGyoPo5+IbdQX9EWOVeI771/t0Gamfke96k+L0qxEb/X7Jk8+SB10AG6SqUmhKdOU4A++hoPgAxS0fO9OiPGgYEG5jLwdqww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008B5.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fa40ee5-2421-42d0-bc93-08df0a7b93c9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|1800799024|82310400026|35042699022|23010399003|7416014|376014|10067099003|56012099006|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	TnUSir8Rzu9UqfRKzqrMnEcEPU4KArKeDauiM27tyNQMhdMJ+L4ntIGp1169WW2cjU0SDXOKdXWrxhXsdCXBtsk/qKaEPFCgebAvzovLOq+rUSKvHYNO0XXLb15R2DTOG9GDHgKomPQFV6BTR8oDE76p3D2YJvUHSFAiM/5v5kxt3s4kcCJGLPGqgECl1XJOGSWANyqKQDkSGJ15laYc54nK6mlIK5axuQFjkTzCdf2O4zN4wdR7cJ0+MxMkHuD+MTl+7uLDf73k+R6WR8K8Z3l0rGwd4wRwxpTlky8bT+3ygueHEG45SZob2OfInPLHzjKD6MYBqIDp2CmtmLL2LeSPqi0TgjZIuLdmOvW9BWVL7p/CJpcKVOJoPD6GVM0/fffepZ/RDkzyz/fBXzg2++0xD+7l8siBDS8ICtCYKd4l22eDfzbWm+5X81vS0kZX0yLrwuMM9LB5udK/IUktxg8iYKcWyeLNuhuP5hXYlfrNieCeL7VEgYX87xJ0FCvr3Kq5iM+yMumAzVMJ0m8H+iTdJbemzc3SSDJlfyu5axuZHuvcR/A5R+F3g1+uhwHD5Y+RbzXcNnGbastf8e7IyfTqHMNTyV3DqeffPMFW7a4vHOenWFd3Sxp/wo8w0ili
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(1800799024)(82310400026)(35042699022)(23010399003)(7416014)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7uaepsgISJiaC+iN8/rGtfXY65RreWDsTMLmj8ZCkPeUECZVEoYHfHZAwEBsE++rCWjbqFMbvYB3PZj0+YWDRVnl4EX7BB6N02LBqw1t36pCp5uezS19SW+dNZi6zgwz5WLuT5WwY8zNmYDRMsOlf9EZq1hFjrxHmfj04Wz9y5ibVIr/qzx9R3Cg0bGEKB1d/JT58BEHEKqQc/vFPRMDNEMVdv32nKBo3yfv02pHFTVPvCML/sd5o9pXvyaVkx0QReITrLdEALCkVv18+DtKH4bjUrOVbHIKGQKnJra0WnDGhHMfd0XUi8ThPbsgYtiR3oOopIcQ0mbVuXv1I9CjKbisYghCPH2Uwi5NT8+cRRbcSXCRmX38hyN78Dbxme0zw9MPDo8o6imEw7YNVV1HqF1O9lsHO5e2DQxVXkO1N2ZQw25EeGt6KiIHUKrqZvpZ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:52.7424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a70ffff5-a0c9-42be-0c10-08df0a7b9c43
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B5.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB258777

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

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  8 ++
 .../renesas/r9a07g044c2-hummingboard-ripple.dts    | 95 ++++++++++++++++++++++
 .../renesas/rzg2lc-hummingboard-pulse-leds.dtso    | 48 +++++++++++
 3 files changed, 151 insertions(+)

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
index 0000000000000..accc17212adb1
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
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

