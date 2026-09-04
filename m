Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020138.outbound.protection.outlook.com [52.101.69.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F781471D1A;
	Fri,  4 Sep 2026 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.138
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523017; cv=fail; b=UK08JhiDMoJIy6CBH7a3ZifVVa86I4x0MsmHK3vV5jGNz0d/bYi7oX/ScwpZv9qnkouFowx2GKepO3W1QfP/b1tTa4Nw111qmgkyDce/wdqnB7oNA0INi/NTeb40CDD2b3xCfPmxtQW0DDkJGktJm7WZmTc7WAgHWoi8Vb72vaM=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523017; c=relaxed/simple;
	bh=ieodjQYhnqV5omBVZv5R/+hI9ip82xT+RUiFmi57AdU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ahKIXhsAkXZelNYRDTtBCAIljscoggbEoKiBIFDIsUWHx2xmS+GubfyO8Rfkftdjsb+zTcDGQvrGgTM+KAb1ZLIqPD2mdNwn8Me5NOFiylufp7jhCIxswTLUnp4p778C/avra8Nmy/KzuF/hvGy0Wc/HOITkQeL0hlXXZ44qQI0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=VKUqi/RE; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=VKUqi/RE; arc=fail smtp.client-ip=52.101.69.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="VKUqi/RE";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="VKUqi/RE"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S/tzvw70pfGN8fdFiR9BKSgQGgutNcRm0ZZZnrY5gWGlJ4ZFabPNaRBz8mFCWThT1Qi/BMSHlhPwbF1tW3CTS1FUK8UKT+XC86w//Z5f22sOfJ42z76cVvNIpu8ltbtx531AsO3/6/O+4PXws52BG/M+/3wCeYHFL9jpxwxMqn+sgL/1AH3t1VMAe1ygsefApdkH7PCEv5PeLi74Ofac6p6yHa7j3FnmHZ8JW/ZGGszK3sOXIAm7GRropguGTf6lyRh045qxq/YxdggDlDKJrpsvzy2kFcA07zvxYhLS1CuL2jDDqEZF2FyNuYVcxwukDgBNqnDe3sx/1WkiLLrUQw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OD6kuBm+0gpBq0trIRgpNCLs+/HsiYpGKVzEGoqPrVc=;
 b=E22k5DBkb4aovDdhDpYraTjn5BwecVFEvsiw4pN7ObBy2BRINSPtTPI9bXYHQAB7SQh0jh2gFQfnhQ3MnxlqZ1z4BGJWPk4YYC+VsFC94Eul7i6eVnrVp+lMf4TDLmBd4EbGC3m9jZ8xY2wkvyXMeI17pp8MGicc0bD1lg7dd40VhZXPbvNJAXSsGYtS2I4r+BEE+gqTxPyeD6lEmJSBknPEeYbToueRS8UUiX72ePgZqwYslxGm+1JeudZF10UFVizXmcji3naZKg8GpfWzu4IGw8AmPPVn5z9v8VjJe+wOvLzxYu3qPGOw7a29usWuoXKOAf0QN7w0+jjRQgeqaQ==
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
 bh=OD6kuBm+0gpBq0trIRgpNCLs+/HsiYpGKVzEGoqPrVc=;
 b=VKUqi/REb+FP+kHs+UsRXfkDLM6CCAHXaI2WjfAM036gQ0dS06+ofy1g0AtbzLh1Xa2pY1dGLcDmVe0OXKq66ONzrVadHmq9V8PpgHTd3u5XhGov/TciisRjFmEnhF93eWdgtBSBrTLwgPJL0d4fGl8ylmriz21EY3U6GtX8CmGSubByEPNS53+dOM7ScrgS98LVLByRAL7JEk+RkFCWY6z6P041yO+yJfjy8HVGFJPGVCknMV1OXIy35ir8HbNE9GjZr5nB/Y8svK4dXuqMX2bMifavhDyih/GRmQcFflIXYfGScOZpEqkkcA+dQmyGwAlCNB67rp/IdpIfcRY6LA==
Received: from AS4P189CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::17)
 by VI2PR04MB10594.eurprd04.prod.outlook.com (2603:10a6:800:26f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:48 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::4b) by AS4P189CA0014.outlook.office365.com
 (2603:10a6:20b:5d7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 11:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:48 +0000
Received: from emails-6770551-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 479D181D16;
	Fri,  4 Sep 2026 11:56:48 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523008;
 b=DekKQ+jKBjwZI+ak9Iv6KJ1KF2URKX8mEsXp3Pt4AvK+YJcKkfonBFsXNu/BMBEsM3dq5
 OTYCsK7RXIDXNVZPuDApwlTwAYDtBoxSIJ1HwgBOWAurWv51xJg6ZzjvFKOj35lHjsOUzjB
 KDKYqdlsmM5Y8r+LIEfhwgKvePCI/TU=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523008; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=OD6kuBm+0gpBq0trIRgpNCLs+/HsiYpGKVzEGoqPrVc=;
 b=SpZxn8kx+tnhfoMGSDLaTBKutSRG6S7RB8Fbau76dtVonQtow4qsgLOl1F7ItB0aYlJ+9
 T9K1O1l8Gy5uYqqLxl6QVDQlgAYuCg/WnCZocOAmCwp2MKMZJg8Uy9VViG246cFRYuoWa4i
 XTBQoq87utleWPyvMXX3skrhRT26vXY=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OD6kuBm+0gpBq0trIRgpNCLs+/HsiYpGKVzEGoqPrVc=;
 b=VKUqi/REb+FP+kHs+UsRXfkDLM6CCAHXaI2WjfAM036gQ0dS06+ofy1g0AtbzLh1Xa2pY1dGLcDmVe0OXKq66ONzrVadHmq9V8PpgHTd3u5XhGov/TciisRjFmEnhF93eWdgtBSBrTLwgPJL0d4fGl8ylmriz21EY3U6GtX8CmGSubByEPNS53+dOM7ScrgS98LVLByRAL7JEk+RkFCWY6z6P041yO+yJfjy8HVGFJPGVCknMV1OXIy35ir8HbNE9GjZr5nB/Y8svK4dXuqMX2bMifavhDyih/GRmQcFflIXYfGScOZpEqkkcA+dQmyGwAlCNB67rp/IdpIfcRY6LA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:56:34 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:56:34 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v8 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Fri, 04 Sep 2026 13:56:19 +0200
Message-Id: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOxmmoC/23R20rEMBAG4FdZcm0kmcnRK99DvEhz2A3oVhIt6
 tJ3Ny1Iy6aX/8B8/MPcSI0lx0qeTjdS4pRrHq8tmIcT8Rd3PUeaQ8sEGCgmGdDyewZaCx1GV0K
 lqIOUSinjIJC29FFiyt8r+PLa8iXXz7H8rP7El+k/hffUxCmjRgqptE4WvXuu41sOtHxdH/34T
 hZugh3BeUfAQoCLwxBAG8uPCNwT3UETNiIxxOSt8papI0JshEbWEaIRzAxeSCu1Cf6IkBthmO0
 I2QhuvVKA0kQ8bKF2BO9bqEYInpxD8MGl4YjQG2H7566HCNc+4gRAivGemOf5D+6bLlZCAgAA
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
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|DB1PEPF000509F5:EE_|VI2PR04MB10594:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d0d8e4-10cd-4857-848d-08df0a7b99a0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|6133799003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 gI4EmbDOTPDn1G/PwLtp0TfiFkrwUsokf5S5athziEbN+rbBg/+o5woNZbu1ktlWiuHBCvqcfiwKqcbeIUAQiACaQmJoob49DDbBm3nmPb4gzlCHBwQh9TwPf7aUcUqh7y5M+3bXIZ0M4VGynfQTe0EpF8RZkd7vXpuVIHstw7ykTEyeYebYnuMlR9NTDjItTI7APywFFZn3UCbUMva9jlQIQkNQJqOxaX7ceGxBA0gdIIVyqSI7fEz+9hXVadNqmGm9hZ/HQ39v/in7JJTqWO3Np0zkZeDAQb0w0S+UunLe6dVghlYm9OIO6qLuj47/KgdJDsVR+e4WYkQnWW8EvSFSHI6JrCPY11IrZom/a7LfET4NV4PfWfvyG3qt78e0fe7HSKTIuVaE4mEAZ9HKxXb9AYIk+mMNJrjXAYJiuUSXHBrQhcKFV7Fv1MyKFZJgcSoCpUP9PSfu6u1dxAIuYbA1V8a/+zHL0PPFq1mSDoHvotjzMn9VWRUAQ6neHFPF+TwtD3Zn7F0xDTeFNmUEtZY+c2sJQL4d4iAJZYHmPjWZoHa5oapLrr3uFyHlqHRGuMF2+75yyPuXgRUPKYDByHhMJLvS9S5942V2eAxNvV0rWHrVZEjA8IesK/kzNug6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(6133799003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 fqhvzrEEm7m/l4AI25AZkG68/4zf2xggkSeuKIkgV03qKq+E07SYe2jm0sJsXeSLY0UQbFDHKswxB6uYbD8qSwxUMOu2lTDLtvHOtpuhasy08fCsSZ9zATOP+nPmPGXS4d6hBxbTiKbSM2zCYMoIXPkNUvW3cox6mQUY4dT8yGDchZP8j71uS/1wqtnUDxp3pAjmNndE1+hf6b0z8OesbU5qHJQNewVFFTHKLn162n31sQePKf61DQl2HxuY3OTOiH6HWg0wDL4ZzkB9Qgu3jcDOe5ZrehmBIdzcTWaWh83dPc9F6KPiSjkDgHP+e9/XWGsq0YxJlTDClLdOlGx3Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 15494329029f4f3babac78992afe7f37:solidrun,office365_emails,sent,inline:f889c0c420b2381c882f7b7a94b45501
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXXBJq/nCDC5GkA/92aUy4Liawn+epPUuFXNy53gcRAsMY3ZGx5+X8sjQXI3uNb8m7AGpDsmjjToMhbTkpY0W2syRA3tPTu2mDEjLPZZcSgYE/n7S4gzd6OyzRUs30tCi3qyo9sweXxekBxVgd8Z/kdw7NUKReKj+28lNoEhCOGM6UnDHzSTaMVeCFtoG3hAaGrMR2vxxAcKPwPyljiXLSWb4HhDZRXm8WbQwPZ59QEQ6HuhZj6sHXE0goRmAhChecd0RcEtmW/NUk8RY6x3hrkycq82C7YKkQ3+kxFUpb3Bc0JP9AbDm/OzpGWtAIi64PxEndegfvCFKcxOJKajgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OD6kuBm+0gpBq0trIRgpNCLs+/HsiYpGKVzEGoqPrVc=;
 b=b1WZZDSDHPAvajvsXUO1McxiwVTdXkG+urlt/jN6XaeEXco3fstLQO1/2R5mDtm5RNY71/fRX/4rYUqa+fqAIsWUQWFdqT9N9vE0ChWfrcPFqckcK/afwmAFgnI9bDKAKZgUpk4eAqMWUN8ZTvkEQZWArPxVCNSHVtDlEg4ILSCTy6jdL6AtAnHcrNx9CMfYlYSyH9ZX/JnFam1JJ3RO/bEfGTZDNNtN469YE4Dh9riwuQ+im/fnFHKpcSDzEjj0NuIrnfZfnWxgECRkpGktXABYnr8PRcmgGbm48KianfC2Y6H/j6lC+oFrZMACEj46mN9686552Qb2cZwr7cOlbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84858d2b-2303-48cd-23d1-08df0a7b912f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|14060799003|376014|7416014|1800799024|35042699022|13003099007|6133799003|10067099003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	DChH652byP1/JPLVLhyEWIx/usq3AOVmxKfEhCMyOYA/eV0i1Ez6Z4LSnFKWf4AYg4UDf7hsdribmhoNnnbvhRU34Ehgp73v/HuM5uqa4f48Q5nFj7W2Amie8g9xGnaOZ7Kay+BmO5/W+AOByjJnQGnbBj37vpsvw2BvHOgv7DaD1R5+UqNbBMRXQW+SfG/U2T4sl0XQixp+8rADNX/AR2I+jbN7yxwE5upc9omgsdJtTxQtJji20xPelpp7qKCkQIbbRqf1O2IwzrpUS6H5Tl8oLnYNB1+8zbFuvzdgeX2ay1TLrD4EW7k+FdoiK/iZdQVD1cL9pf2uMoUW/Ic/y/skSz76yF3mfuJmcT7gj/6RKO51hCnFW8AE3G0TfHZKt4+yFOHwLQP5gkz2Y+YF7USnw1ahHVTBZfBZTirJdkVKBHdCsifYsrm7noqdT6qudK2KQ4QsGPtXgfcIn1WWXW8ITLlt+HV4iRdtsfQ6F5gp1Tx2Bw5gsBVd4migh1N0udLBl35O771udKfKv6ugNmxXPQ9T3U4eJqK8ctlSQ5kazH/8hFqE9iqGqBEjWFdd0insZhvyjoL4xloCO4h21gXt/cncnJrJNOEc+x6UrpQ=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(14060799003)(376014)(7416014)(1800799024)(35042699022)(13003099007)(6133799003)(10067099003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pXPTDpSvJj5W9SaMV19aqAfezWyrnaTNyh5FNgjBtamh/2KP/0MWQHf2sDkxTBNrpY0qrZF106qlG54MRVZqNSAyvsbHat7rnDVb3uGsdWiLnxjFp+zt3ipyHA9Z3hrNQDs/2KAUA6kIgU3wN33PZ3tO8ChGlLmn8Dht7ZWQ+kUctFOjnmAMbfZTVwPebSTB+ztf7CdCU34876q/2W3jykYw0feQ21gANicxfi3wUTCdc/+By5XC2zCLvGM4R1A5O4FYh8dxEO+zGQr4F5LNTSdHWp0f3FtIBE0ieMs7CEkrcI/1XRKiDilvC0sgMARtXXmAHrmvla/ggbqCuCiMy5zvriTqwMpjn1ZJ6hJZK+3zveT4H93mO1IIFeaL5MuViUa1wZvGculWwSfAcxWZCePvJ34/++a4LKnhi9YqmMzAMO2Hy+hWxlGE4XbQWLmG
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:48.4152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d0d8e4-10cd-4857-848d-08df0a7b99a0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10594

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
 .../renesas/r9a07g043u12-hummingboard-ripple.dts   |  91 ++++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../renesas/r9a07g044c2-hummingboard-ripple.dts    |  95 ++++
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../renesas/r9a07g044l2-hummingboard-ripple.dts    |  16 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/r9a07g054l2-hummingboard-ripple.dts    |  16 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 564 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  79 +++
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 .../renesas/rzg2l-hummingboard-pulse-common.dtsi   | 114 +++++
 .../rzg2l-hummingboard-pulse-micro-hdmi.dtsi       |  79 +++
 .../dts/renesas/rzg2l-hummingboard-ripple.dtsi     | 127 +++++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 480 ++++++++++++++++++
 .../renesas/rzg2lc-hummingboard-pulse-leds.dtso    |  48 ++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 442 ++++++++++++++++
 .../renesas/rzg2ul-hummingboard-pulse-leds.dtso    |  48 ++
 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi     | 437 ++++++++++++++++
 26 files changed, 2952 insertions(+), 2 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

