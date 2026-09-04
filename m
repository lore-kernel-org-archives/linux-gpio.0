Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023128.outbound.protection.outlook.com [40.107.162.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717B3B8BC7;
	Fri,  4 Sep 2026 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.128
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523018; cv=fail; b=gt+16AjUn7RZ26BB18zh9Mb0NOZJrixdditLPxMD3D5vlCF2phvGyQz9iYONaJDiK7cZjlFTugU76Wn0Kw3Wva86428mtLK5S6kQ7DbLOiHNDYU0NzzRcjASjdwh4hziF6F6afy9XHGiqKr/nPpNnH6QGiyG7XFkv//SzQHaXcg=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523018; c=relaxed/simple;
	bh=uH0rrP0fNf4uXH6bD77iN8grmdsyC3xONM6M+U2R5cA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KhGsFudsrYXW0LburKxgFpJpXhS9sKwRnKRdE7bG0tkVTvmhUot+5gQ5fL9qCBk6iZmM8JIlJL2llxImcU8Of30LsL/ZeW7jQtL4An+ee6dGP4G2eMwqguB8LKBWxHjeU0Sbkg/v/EIMq/lzAhxmGtP1nbmssZBynnb3YUOfPdc=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=cw7F7WMd; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=cw7F7WMd; arc=fail smtp.client-ip=40.107.162.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="cw7F7WMd";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="cw7F7WMd"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dQ97ELLmpzfvNxLV3va+H9JJL8nXsaBbaLo8b7a/FVcV+HjJGX4onWPCRywIWD1TctuP1ynf8Monj7cKoUkr7xfE4bnDJ7bhO3qPESAGSj5Zvpa4wyGXx7QeSPDr7mfeSjjg4OFGw8zV9ankDQqIRa2o5U1W60+bTUVc/cNAPo/xvNPVcU684bgVmc+dGVPvuqWpyVx3uR2t8dg705aZluTwFbe/gzSljwFtU8Rw5SRFoeOcQnbxu6lZPCum50U87oOuqicrcNRecV84JibXUUWj97mXAbahisD/StXiMZyQpCj87Oh4susJ06kN7P6cx/KFe9sp42guc8KYkr0LnA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=P3cROU3EjXiIjHwzlHMbGQskDYIU3+tFDcSt2RVCOAT5e7e3akPsK3EO+9cDBvh+YJNdqExK5f8vyWlu6GER+ODFBRrCpidiNqydto74vLVO0FxcoJQVwt2FXmFyheNWHIgWc+Rdt0xUmG+npFOjP6ElsoFvZkSLrghx+2uSeVrnL/i6NQiTyv+KIcqtJwqjiLuPn6gZn1M8SdAdUTfX34e6n4CK3b/JAx2S2qFM/DaC6/KNtIKXkqskZpp7do4Jg2FGVZtY/XA/n/aVgBvvARlxVnzkBuaJIybq7gD6jpDK78xeBiDc8RrcWwDYRd9IhsQ9Ls5prPCBVySBMzYf4Q==
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
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=cw7F7WMdjZdEu3QKevaquCz+/1qOO8kU4jBH8UeCVa7I/+COZteCl2g2wAREo3o0j95h5um9Ohbns9PgDeTzTMweHna9PXVTd65hWymkbJTwYAoqEMlDRP7N77//wQP57q/WBOsxvEbigWUY8GqMNd6enCgl0blCj3tcKgkPsUkbUuGADVrQi5usw9YEecHOn+OgRCPMyyeyDSoByNugNd/It2MYxF5EKinJ/r3bWVQUGi2DQd36kYV1hhhGIEl0MfTFM0u0nV/2+CJwwPyjZ3J/OZ2hSl/Ekb/EimI22o99O5YVc9j3d6b4jB0ZCO2somBTrvgvYPwBkfPUsSTMIQ==
Received: from AM9P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::8)
 by GV4PR04MB11289.eurprd04.prod.outlook.com (2603:10a6:150:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:48 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::93) by AM9P192CA0003.outlook.office365.com
 (2603:10a6:20b:21d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 11:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:48 +0000
Received: from emails-6770551-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-87.eu-west-1.compute.internal [10.20.6.87])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 424D381D57;
	Fri,  4 Sep 2026 11:56:48 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523008;
 b=l2e7pERTEffjHJKZ3xMw4c0LLBogfMrq+G4jVU+hr2clAgsXXSZKBV1T5GP/Imk8e6Uda
 2m2ah27/ZU1GQbQHkg6cWUrHAUUif+QIx0dxmb/29t1HOierTBZgVGMaCh6nR8qZF1wFP2L
 oywoVipbySpmE26xQt7Ei4UVpYhD52c=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523008; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=RFN615S4Witg2Dm3oNlPAJL6HYwKgtHSVPqHhv3ZfgHUjWbjCsRTsZcRk0vf7kInksshr
 5Md1pnMRFkA6O6CT8mCw2I7xGJE6v9yJJztWoTqM03oKigrWXaRi5RFPRXujw5Y5vnjAi68
 hJfH/ROkbdDNsAzwhCcu6dUnEskWkt8=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=cw7F7WMdjZdEu3QKevaquCz+/1qOO8kU4jBH8UeCVa7I/+COZteCl2g2wAREo3o0j95h5um9Ohbns9PgDeTzTMweHna9PXVTd65hWymkbJTwYAoqEMlDRP7N77//wQP57q/WBOsxvEbigWUY8GqMNd6enCgl0blCj3tcKgkPsUkbUuGADVrQi5usw9YEecHOn+OgRCPMyyeyDSoByNugNd/It2MYxF5EKinJ/r3bWVQUGi2DQd36kYV1hhhGIEl0MfTFM0u0nV/2+CJwwPyjZ3J/OZ2hSl/Ekb/EimI22o99O5YVc9j3d6b4jB0ZCO2somBTrvgvYPwBkfPUsSTMIQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:56:35 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:56:35 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 04 Sep 2026 13:56:21 +0200
Subject: [PATCH v8 02/11] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-/output-disable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
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
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|AMS1EPF0000003F:EE_|GV4PR04MB11289:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa6e517-008c-4557-2148-08df0a7b99ad
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 va833WnczIP2z/Jr39Ma0b0yGL+XgBKBpyUDtUPXqcTN6FWo2UH9iQjt3pFkWx/6cgk+KPBxlubfuLhnPohIZIeN4m4tp5IZ0uPnGCaWDYCa1OdxTfdJjtE6Up2s6KXG8MxrdsTiy0SqiVfmcXaQNhvFJfSedPqbK0MVqopqPA0vZmJ/hDVI/1ZsfMXFpdyPtc/f8Rlzrarco2D8MmVyLf8RES/cyqw3cTvbdeX5CzHo8hZ4sJSpLMk1Zxc7ooT7QT3sevQCCOPznZhTK+3pQA3SdbTtwfW5uLiI2bbhCfBM79X5KpEY5rk8VOaEgh14rNPpqNKv7exr4E6ZDyFu3JLWvQ0pS4QcAm6B9i9P6XdxUi0kCtAWsUGQff8ylAHUNet1i5vVsI6Cavk9ZuRnGNg9eWMTLspEEf/r/pgxvL9n2yGnJ8AXq3N1f/9EzH2m18/+VF07XC42+GzvdiLrz7XAaAOLGuy8GPYw2sxAW61Ykb2aFaTvmqw7VShMt2XVJsj94OW/dGIR38JeHXtib3YMea9sXSyXLH418AkksZCRCeK2aa4AcNTR0BvdT/pcw6jHe3yL9PCfyU3u4qYQY+6U9T6dIoGXeGq/sCavOB+cPUK3FR6uR90tXI97yCYwdSBuCeFbmNN6gLNGYqPzXaWJBLKVG1Cxm6NtaVfuB4Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 2GW4el7+QGJF/woFsLM/7LvEqGBroctuRsjOeAI1zYT0ygjEoVoN3R3Szz2MCxIT0vU+0l0fpcsjH9a4nMckRsbfRXTnlWDg8VaUteWvKNi34MLykw/ZdmXpL2Kp1y6zfygshWBvQ0qKoCimDuS6AFZzJ06Am/8jwZtX0ikXX294nL6b0wrOqdTxGhaXEnxfnoMtbSHkV2bhTIGqbGyyiLklIqMmv+6nLYBEAGaT+SbhL+yfapw4f+VJ8g4x+VS17LmiW9CF72CmoZ878THPhnbWB9Wg2is5oUe+Y0MWyMhor3YxJMixYV20GejimpgHECtpw3M3RxLOV6wHiCakXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b495532a3c80478c981ef0ba5e62c83d:solidrun,office365_emails,sent,inline:284ae8a1cf75927e32739ded676cd9cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSiOHllOWt7gYFvjSWkGbB9pv5wha4EQhY3BLTjNGd/qad2/c+xjBwPPVJGgNrfFit3GszbpbLUinEUhFZK8N+oQ8i3yoiEf3cytwrpoOi7qxyKGIxwUiWMl6rpttI0foOwWJH5JBhk+9zbusOnErLiKQE83DIkjrHX3qjODJ79Wki4ZjM969TTJbLt2aRfa71zTwYJssWNcw/0zN+wCBY30dd3Be8R7shFtaiGh6XraGuuaglExdIlMZGEGWMyQOqqG8JLBygR069e+Ozgk5WR8KUdQ0oLUNF/R+zqnBHWEKHHetevCFJhnY4innkdkzuv8jzDHdx51LfrXG8mI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=zTBxUqC/pj+lZDDE8I8K3BNIa8m6j5kPn0nScbyi2cRHcTTJNAPeSaWuvXstUq36v2tZd//9ONbMlRT688WeJglZaQpqnVf1eMUgQHo5r46Yk7F90wjOlvGfLuodMWh20Na2nnM5gdqt1yxEaRJpNu9AcXOt4PVZXxr3gVfIEbqpBcnZlnMYa7tFYgMbZKoYX+8e6lme72PV2IeuOcVdEwkAyBVeVsPJDSZNGR1AepM9Hp8HlQKDcDMdZjs+tzkvmVpXONXT1RqUcfjZZ7vIu7RweCMdwhXHxn81HrgiQ/Is+LBV8jhy9c0BaHXdNxe2Yrj0OCubpYbgiSMIAYgGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44e611ab-acd6-4cf6-d5da-08df0a7b91b9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|35042699022|23010399003|7416014|376014|36860700016|56012099006|10067099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	2E7+2yncJp9c4ZfwaD/OmEtyTTaRk0+BFs9d/LhshndZXTC4/2xvMJ9Q6dfQ6WiasoicLLkJEquT1J6fuWLN3aO3ve2fXFznYk6dQMfjyGIbdYzFioFOeutAxrlOZqBU9Ed2fUcaBsCuKjTsQbGh8c0LDxMUCnqoQL4HUG6p7V83yhswJSfYYHsF1u+lxLRgflkDDZVrQvwj4xyF2k63UKMEnENbH0ql0jKHQLkvi7xpkhEu6TH8Vza0qMpe7k9krmtP/ILK+68bPkgadJN7Imr1mdCrJ/G2SwPBLvyOnudpFGw0Bh2hr6SOMevA1QUF63E0RXL+9vPV0npHz60U0N3grJhsNVUn/yute4BuTiF4YCu3uQ//56nVlmFFQyK6+HpPdHwOB360QWkJxhPftkl08x5tJvl7ijanhaDXSMd3Fxcfj0UDvvCD5tGXwVt4ggejsYSx2FUaP6f8iFAJpoqofxe9HBrtVCZ/uJ1hyH822F7qgulzKsSaua9YtZ8sjDCufrtONmbQDhgulk8IvhZJmgOU3DVI9PY2n8VVzl0V92O3KOEerb/iTwoTfW86NAkVYXpc6yXBxkh9u+37tZs7rA7Ni6wbr8JkSYavDtNb1o+KKam0hJBNtl6EaZJD5ZJDTDo85PRw8acF7UXRDMCodPlaPP1n10makaYm1gU=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(23010399003)(7416014)(376014)(36860700016)(56012099006)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VPFtBa/5dcMuis9qNR8zyRua4fDoxihD2D8Iyn3mZhiIqN3cEywgyhJ7qc33d8VSE8XkB7/1Fqjn36hCqGbUhKRIWFno6Au1HK5gHmjY4qgVtU4STxQCg41KNbqSl0CM09fUG591tU59qT0bQ7io/MQaIjAXpiMrSuhB7WHyEilxJwAC+MbipbYDFH/SuXb/TPQ+BJIWb0ECsbb9fTIOtwe1mVtNn67GORtZhUMyNNMyeQ7rH+DiRubd9AXhPDXbm+6eGLqyW0/LSD4GmTcVJpXLvZvk2L/OrRsN6qjJRa4bDO5nYhOJrvRxnr4OF2bWNJh7EAxIWXYAV3N0cK9Q8aix94wmuw7c+DPE8XG6+KIFCBfWEVvU9wh1/HG9CSaK+Lw4EOFnc2T7Y9sq7QwCK5O2Ellk3a46+JZYKAhUoLS6ITXpC7WeiUOUZZsHIJvj
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:48.4592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa6e517-008c-4557-2148-08df0a7b99ad
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11289

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

