Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020104.outbound.protection.outlook.com [52.101.69.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EF748033E;
	Wed,  2 Sep 2026 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.104
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349867; cv=fail; b=ItrN6vqJQWXgn7FcxM9dqJqU0mHAjZWNqi4TT2xtoQOBpVqOZTVPy4PSuZPoOSXUlQLOdR2hk+bxLCVh0N/1oM4Z/S3IorEDMJ0R81L5ZziMLIXnMpTIoSbrWrNe5qpcusW4DkaZN6kXHziOg9jb8A40VO6b+NTGiWNI1cwyTz8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349867; c=relaxed/simple;
	bh=DbAYcbvbhbo3GiLPgZRbQUmu+hx3IzJXAGHnC6by7ek=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PBg6teVu76CAdCeZBo5pSQ97i4fTDJop36vWPWvkpPjKsFYJiFijs28bzTRgb49TgHWVMVr7kdTgpTVM8AyRcXtjVjTxwVZwUMt6YiXL2sSqAJXf5ZHwrP9o5MaxPMZgZMaBIkERx34D6+LSIPmuM5H8CXQit3amDmyevZZC/l0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=uEEaS+yB; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=uEEaS+yB; arc=fail smtp.client-ip=52.101.69.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="uEEaS+yB";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="uEEaS+yB"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a+bu6X1aRuZSye+dTgiJDY6zMygS9EVBoBGst7FfNsYDU0XFZ3EzNUgQSsQ7Hg6fOoBjzpBN/ZMjnBeTRvtGpD1LotkW11YmJTLkBQJIeMP4RaR8llWLpGi1WPPnUK4suVN3TiEuCzYhVG1LTgwCd8vPpLO7yK0vuX4VZPZd22J0DfH/4JX/mDwL/8dX3W7io0zZbEPSSKEBMt56c86dBAvtIOQGFdM0j8GBcNyFdDN1tb2J6cZT11rThRWFNzFnB4F+/aSXHAvi4TzEYvVsNgT+2B7DZnPhOnR0Rak7rdmDMo5fcUVMFrjuLjR4sXUrsw0orm7kyf1d22yNKmB/fg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=pgBNwx8+cz+E6yVfrizz13BvXB2K/wDGXDFJt/1f5Md5PnyJ+VYSV7b8b9rp3GW+JtrN+ENOQprcqrirPB5/G9oxPYsmpiWeNmYqteAn3Rs/iI03zH40jvi4QF6G3ZYC0kfsNTW+vWpU1e3dat6LfnPKWHnU+ssYINNuorQrlLN6eLBd4mZ2dFtxjuUY81JKvyldvyGtXwcNbEX/ZggFsHEwcZe4JmiaMQUIhr9pDQuvheqrkEswIXtjjVVH9D7ZIed5fwqxiwccloKbOcTgDBMuFkOLwQcrAm2Q5MCR7ttGS9qKkxgOktE9FQMhaPEaX/27F23f7+FGGC5a+uW7Mw==
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
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=uEEaS+yB97vc+tQ9ICjr86f3BS+sozz0Mkb1hnZPC28lEoaUoZ5LCoQDU20IGwfoAvyWN1bw/kAUfxu+RgvX4en3NMpYSrO6GUpUCo0T+P9srIfa1j0fUfj+2+/IwSTGkc1hEvr88ViVExSG0GkaBe/lMpp0GHeXRN8ZLEFJMRa/IN1Rq2u/GqbbwnJv6B2H1wKiDcfELJzLo0qR7C6KgswuQ4vAY0dhaj/rNKHPfb8ColHehYGcWXfuNfWOUWrnWjbFz5AZ7BvrJlSsNu8BjPd45z6gY1pP71ESI589VxZ++YJ7QCRLvb74Nw8XeqZ36qzQJj0M60XEkgRKjRWqVQ==
Received: from GV3PEPF0001DD9F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6d4) by PA1PR04MB11408.eurprd04.prod.outlook.com
 (2603:10a6:102:4f2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:50:36 +0000
Received: from CPH1EPF00000523.eurprd05.prod.outlook.com (2603:10a6:388::1e6)
 by GV3PEPF0001DD9F.outlook.office365.com (2603:10a6:158:401::6d4) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.382.11 via Frontend Transport; Wed, 2 Sep 2026 11:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 CPH1EPF00000523.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 11:50:36 +0000
Received: from emails-4589615-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-87.eu-west-1.compute.internal [10.20.6.87])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id CB2E6811E9;
	Wed,  2 Sep 2026 11:50:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788349835;
 b=YZA5TkBjzfQh8iOJGCORUmIDRCdCwdFsH8OMOYjZ04aIZY8BZvOXKebKP/ojmdf5saELR
 RU8XbIybLDnRk0qNnUXeH7OAjHeWtn9spVw0QPz8BQAGYX40DjFS4qmQo0YtaNO6qp2sT+D
 k+/E2xUT0QZ3PwiBo6cc1S7r5EMwSHE=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788349835; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=ewPWrHY0ONkasqw+Fqw5nnLjB0g7E8iYPFzmFL2QLf48GaLLd39TTWs7oN8C4yUcun+PT
 swGrOE0xfsU3EH0+d5TZPzWXXCtZrk9g435KR/WYjlHdIa/GJCf6ANmGdsn4zjt8+6rszFY
 sMqfvturN6ygs5xtoG6ejw4WGXDq6sA=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=uEEaS+yB97vc+tQ9ICjr86f3BS+sozz0Mkb1hnZPC28lEoaUoZ5LCoQDU20IGwfoAvyWN1bw/kAUfxu+RgvX4en3NMpYSrO6GUpUCo0T+P9srIfa1j0fUfj+2+/IwSTGkc1hEvr88ViVExSG0GkaBe/lMpp0GHeXRN8ZLEFJMRa/IN1Rq2u/GqbbwnJv6B2H1wKiDcfELJzLo0qR7C6KgswuQ4vAY0dhaj/rNKHPfb8ColHehYGcWXfuNfWOUWrnWjbFz5AZ7BvrJlSsNu8BjPd45z6gY1pP71ESI589VxZ++YJ7QCRLvb74Nw8XeqZ36qzQJj0M60XEkgRKjRWqVQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by PAXPR02MB8248.eurprd04.prod.outlook.com (2603:10a6:102:247::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 11:50:26 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:50:26 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 02 Sep 2026 13:50:11 +0200
Subject: [PATCH v4 3/7] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rzg2-sr-boards-v4-3-4a456a422fee@solid-run.com>
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
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	MMZPR04MB400504:EE_|PAXPR02MB8248:EE_|CPH1EPF00000523:EE_|PA1PR04MB11408:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e72fff-7993-4107-bdf3-08df08e866fb
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|52116014|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 HQ7wVe5YEz9+Z2xPyAEfGyMl/Nc4fwDm3ljYRs8gGcEt1f9bgfeGcaBjBmFig64cZItXh5Jfs2nUKmga5ZwK+otp248bxX/hZh5ZgM10nSdrWswD3PTQ3p8l8YLQjBQQXC7UPMrM4U4WBoeD0zRMB9AfFGl0Hvqw63RokVCmPz80CavuXQl117lIYOJYMr+SsiwyKSht0lGRMy27LmZnkSpLA/dBAr6NY8ePE2o13oYiKVr7lGNpdvniAB4usCpWhoriV2LyaRZh9o29W4zXXesnrNUgMyojkBEfFlpA3id700i0OVn73mSmEYnq2YAqT3H+jyc4HXQ5JZ3FBXtNd/Xpn4BJQSJU/2IFW4EBk49gTlIJV2ql4SQW62FXhQVLg10mwCjTgw2Ej6V7qQRQWPJnb+xh309FOTODmVeG2BsnOCvdNoesvlETLwv5p3Rzp0w7BBsDT/pIhtb74gYBC+fBYgtHxDeEWVK+PWBweRcy6dnULa91QM6Xkmj2hbRlMdq+g/FQwYc3CiJS/OJ68vOT1I8iLe7uIlaI4Xr8zRIodYt6axZ8vo2qcERXV/QQMk1w375H+bCvwr8cDAFy72jk4GDGH1qSYvPGaGct1+/jbyCw1w5HtTvkr6eT8zzrAgKRmsa48G0kpZqGgsg0YcUzcTOIcagkSDomdZNzrp4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(52116014)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 XJfM1rmqMjypS3Pq8YtGyjy2Z16kQqozC+5VqNLrQZgH/51VwECSp47f9QZlbZpt1LteX3oYRvDTCUx1AWCvjshZUsUsZrG1+aJnlxk9w59aQIaYDlXcM/ICVrusriceREOt3n6iF8j8wpXd16v2mUhkZ4AVTjNHuuGSWVRPCLx7Fqtw+MeIgGvj+6/9jhLzby0PmVGTjjHx6OMnf4Dd5JeQO8ETpZr4vK2gERNjRQCckULVMHaXGADVagLgyfxYKDeF0o0bhQX+FtxZjEPMbuu5mJHrNqF91U6ESzAW2AkLDX2d65ZtrWbeZffGZ4Ho++GXNHHJD2KLVZcBQaCX2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8248
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 815fae2a86c6464f8ba27f939f79ee54:solidrun,office365_emails,sent,inline:b41cad1130c89600b64c607e07833a6b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAnOS7NFD/g32Sw2VkmVQb++3ogS3VDNWRCcmjMhLl2o2Ft5qW5TI/fUjmY3SmVVblxtqTPHmjMTDmlSiyGE9GwcnOMy/f24vFYSB/fwoeNw4BNpdiphTrrYxC/BU4okU8JPFAcJhWfa/sPyXuaE1tKRyWLr13zTZaY+w44gIr9LhXXSIUqeUbbjCTZSoDRWqIbGszeIHFVeCdi1gG71dns/c8vwqhWQ9TC3Q4XC4Sn3LbJ6tU1mpkMarJQQDEcJFt7LC+hlR3lKcGBmma6cV7Ef7Y8TqiFJdb/RC03KMd5kTXmdO23V8JOb2vLWJo1mYW4j8ts5hqSLqRniMyUCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=i8iTE0dQTpsLr5ONmYbvviXMhNSAwz/94XHQu/EmhehWKR6eQZxo+FmzEwRZYE22yWeYM2C0XepNYR7B6dBf2hs0rvbzgTrbTpoqJRa/cGRF7Qg+hv88LSal9G/4nBbUJ6RoEOgdFd2Muz5t0el8KPD3a6jPnOqLmNvocryu3nQu7bbqPsVP7qwig32XyTIzcXMN4X4kV4GiTxlX1QMkMXvW/ZHS3ND/kbViB78z+LN6jqvD1sNb5PE3TpYMittb49nS46TCXMRzvLcioJT5PMym2SbEZxfbkLIImpGZJriNMjKG6vIkHnW2QY5TyDd/sV/XIS7xYmlMInIKuAGFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF00000523.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d5fa22e-813a-4af9-8b8a-08df08e86114
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|23010399003|14060799003|36860700016|82310400026|1800799024|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+2FuA23+8sJ/HA9dTckMq+njP3t8+YOfHvGvimTnURdo/hPKpHLRuEq+BUeMuOibn8ZE13WirhEOjeTWNlOzisyXJSL+SrvD5upOhp8i7lyVMUW5mctgsW4Ylc9gO4AFP0lktNlWym36Ahmm2wYY33xUFv9COzGOgrFkpgNDkcZcpD/f3YDapm1/fg9IBMCw2vWQ6r/R7vDHQ5kv89x74fuowDl/V0YgQxnW2znHde1IN6E/pkyCwbWW17KMmHYCIVEebzoy9ROWXzUeHaOAGCFrcmXvzhH3VIHzgy8V6M+IseKQKOYT1Uwjwk5Ok3pZMn1d0UG9d0mC7RoKuaxPBJV1pWgxTR15SVjOpSz5vmehb/4DWwcFFptVoG8NVspJfuHJZltA0NziuV3vcKv30f3fbReCnzawOOikckOMxtXvT3sd5vLnUzvjh5QmWF9so88gPQW8ZFU2bkPFS+hJOgPYi4GY190Opqv1eeuPSIoHWxzcJuZO/+LhlkE+CerUjK1FMYvdFkE5Fo8Ao+kwsRKuyaDZs8jaq44OjNODMSQ3GkDyBtryiZgFT5+54MbUdDYMdxIc/sp1DkObUyM2pNjmeRAibwv/zzTfJ+DQcdSaRbBFNzjkZBkbV/H6RD42afWZikf+EQUEd+wCDUntDwIGl5or5CUv3H+wBdeNE2qnMagFhUFN/PUuw78n7CaJp+q3ohJ1at3Hm78JUDLJig==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(23010399003)(14060799003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qpa3ILKRIpdcob+6rx4CpyiDBLfjNB/JFqZxT4O9guvrgsrQi8tvQs+esQM2mtMjm3VemruilKatZt1chB40QSqe06XQC84aR29YdzA/iF6cQEgpI54vOgxPVtS/qaPUBKLzSCqZapk7sBOmJE0+G8Exl/qnFnAVxa/loUche7Wu9ZKcTG6PafRvaRG3F6Lk9orvhMcp5DqmxEQuH9atyNr7IFJKtiJZy2Dd6q/TAN6Q154AnqZTeYFBBj+tmIgOTBDiAZZxvPVHPWLPGCxAt2A7TdUK3afVW1d/nAxzBOup4jFKi5npJRVM3Zu42dHmkN+lmLVIy51IFFhMZjcGfcOLWzoSc0krz2Rprlea/sBkkJTad5OC0jPiA298kAMVY3Ull/E2K/WzhdtixAwn+9FxpTWsDErqjKwxc4P/i8FhgNKMclF0FdKFZCeWG80H
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:50:36.1814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e72fff-7993-4107-bdf3-08df08e866fb
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000523.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11408

Cypress HX3 Hubs are combined USB-2.0 and USB-3.0 devices, and should be
described by one node per speed and linked by peer-hub property.

It is however possible to install this Hub to a USB-2.0-only host, in
which case the USB-3.0 peer has no place in device-tree.

Remove peer-hub from required properties.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index d6eac1213228d..aca2fe796240f 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -53,7 +53,6 @@ properties:
 required:
   - compatible
   - reg
-  - peer-hub
   - vdd-supply
   - vdd2-supply
 

-- 
2.51.0

