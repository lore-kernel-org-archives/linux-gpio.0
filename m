Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020113.outbound.protection.outlook.com [52.101.69.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CF1389107;
	Thu,  3 Sep 2026 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.113
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427445; cv=fail; b=sOGfpSC4TkKkMbcyoHabA1knjM0GkTg3lT3pTP75YUjtWkEPj6B5VEjlIwUwR3D2vmbJX9LDdDKFFyrxHjeqtK4+DGloFvOFPeos2BusX/Wy6F9TUCDUQgg49egGxrmxfgn0CPuCI4YdoEsyls/L4bBp0FoVM7Kax9PPy4Nh/rY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427445; c=relaxed/simple;
	bh=SK1opXBraoqkmNBXv11XcK3g1XwitKHpJzre8GncT0w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KI5yj115WfT3BR6TxEhuvHCyWDUaU44kGOPUt/IzfZFvinFN0bIkPH6W/3PO+/yjfH9jSkt7RapZ365Wh9T5JhiBsgkzCKhrVn4cP1L4lsscU4l1wlxPUlB1o+NNJIwb0w1/fWV3slaQNVPTPFDiMkHGjKl0KVyfyonNDfZxgP4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=CqHljwBe; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=CqHljwBe; arc=fail smtp.client-ip=52.101.69.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="CqHljwBe";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="CqHljwBe"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YnAxCz1suSh4dQiD60zsI1fG7AZsT8/OnM508eXpO2kQk6T8S1+0PN/U/nLlGWlVqER4rXjmkoWbA4j1xMsg6hofA8pXYGtJUc3bC27SAFp/GcKX1iFwE7Rqujd+DgTvBYDuQ3PirPaWzNaWDy3TJQirkyCAyBFsBQKCHQ24sbGQ1CsSvKRgjUmEvC748WZcVZH5b+/PsKXrzesFA2Y35BPS4rahx/RrrhL9+tBfBEcwAn3ep+4qDXspC9P0aD1+d0irX6MzZTdARKbaY2TyjvKlMWvFQ0Zwv2rdSTMch/B4Fvvlt5BszWAYUZ3rW4spcMXp/68PCYwnE5/JIUVy1A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK1opXBraoqkmNBXv11XcK3g1XwitKHpJzre8GncT0w=;
 b=O/b2vqHS3EByd8YKMXFq4po1QaFy64EmBEU2j6Wue+9v3cr9QspNwUwMurl50XkabSix/6rbvqtqoFduODoEDcLqD+CBL1r0nWriTxEpw9g1FHofndFd/CnXAf4fAqraIHVP0qLpro+oJd2NzzstT8s0Kzcfp0q0C02h4B8HmZwyX57HiCqUfx+UIv+wlphekVtFO5Jm2vdGmuCad5xMxDS2dTtKdbXanWVJLbj5pSD653dSDBpcHsigmm2Tm3An32DWMw2QKI0VwRDKBZqYEZmbg6Buno07zp5PochYQRxVyYzkd28bBEz637+M68SDD2eNN0Szcn3vDzUwLk22iw==
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
 bh=SK1opXBraoqkmNBXv11XcK3g1XwitKHpJzre8GncT0w=;
 b=CqHljwBejqVxQNtCG8v6esbiR0+ImpUl05rvIw9LdIhifnddSUTAmD+gUgS/NIN/oqXOxHN+A709Xubsvt4H7fdjgWe5O3mwHCjY4jHu9l7/cByszh2orJMB7KG5Q4CnXNjYwfY66ajNp06HhsahvvLBwGlqUjmDJrKGsgJEcyp12SvNZcnDUVt8K1aX01tJWoot90Q2QLbnBCPCD/w8zspXdQB19o/Xk7ypjtkyC3NW799aBMNFb+fe1GDg28H8dpRRhZYxYNfR0jPob27NlaetOuq2K7PThlyKglQxEq75Iehqnl7fYCAGuB/7ycdnhUxa4HmlC8uQbpJ5Dm0g7g==
Received: from AM0PR02CA0149.eurprd02.prod.outlook.com (2603:10a6:20b:28d::16)
 by VI2PR04MB10218.eurprd04.prod.outlook.com (2603:10a6:800:22b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 09:23:50 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d:cafe::57) by AM0PR02CA0149.outlook.office365.com
 (2603:10a6:20b:28d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 09:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 09:23:49 +0000
Received: from emails-2220808-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-87.eu-west-1.compute.internal [10.20.6.87])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C774C80351;
	Thu,  3 Sep 2026 09:23:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788427429;
 b=HF2X93yNqzOZQigce/ZKQYEzmJmTXC+dj6A2jHwShJojlAJM96S4tvMIVCCsmKxAXYCtS
 1rmS1AIgJy8I/Q3Si579s583/SCHlJblAJOyQPss+Aj20aWJP1QT+9BuZSGuRHNIy3gM3gL
 Py4dYUbMS74N6W8JrGQa/L05YZ4JcLo=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788427429; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=SK1opXBraoqkmNBXv11XcK3g1XwitKHpJzre8GncT0w=;
 b=WiLhqyMyRA4iac8O7vAoGOt9JwLlnUFGGGIJpffR4oQV9Wj4F9D33RtxbWSeUlH+oMoIE
 RrPHEn9YmQ+CbJQ8C65a87DckDnuVCMqAmkI24yBotdykyPyYKccsyNNWuuMDfHdJ4YNPg2
 uBzaCE192ZjbpCusCJPiQjf9AOrYjOI=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SK1opXBraoqkmNBXv11XcK3g1XwitKHpJzre8GncT0w=;
 b=CqHljwBejqVxQNtCG8v6esbiR0+ImpUl05rvIw9LdIhifnddSUTAmD+gUgS/NIN/oqXOxHN+A709Xubsvt4H7fdjgWe5O3mwHCjY4jHu9l7/cByszh2orJMB7KG5Q4CnXNjYwfY66ajNp06HhsahvvLBwGlqUjmDJrKGsgJEcyp12SvNZcnDUVt8K1aX01tJWoot90Q2QLbnBCPCD/w8zspXdQB19o/Xk7ypjtkyC3NW799aBMNFb+fe1GDg28H8dpRRhZYxYNfR0jPob27NlaetOuq2K7PThlyKglQxEq75Iehqnl7fYCAGuB/7ycdnhUxa4HmlC8uQbpJ5Dm0g7g==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 09:23:39 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 09:23:37 +0000
From: Josua Mayer <josua@solid-run.com>
To: Linus Walleij <linusw@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton
	<jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
Thread-Topic: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-enable pinconf
Thread-Index: AQHdOtE+gVzmYmXL+Ea9R+ytXkurZ7a7P8yAgAFWXAA=
Date: Thu, 3 Sep 2026 09:23:37 +0000
Message-ID: <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com>
 <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
In-Reply-To:
 <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|DB9PR04MB8284:EE_|DB5PEPF00014B92:EE_|VI2PR04MB10218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4ef92b-89ec-4bc4-452e-08df099d1067
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|4143699003|10067099003|56012099006|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 Xk+bUo4oImiDEZ28wFcTC702NDy+fvCWwytDP3mro0Pmkcc9g5aa3gXqDby0hHgDkepb0uIdQe+FkrFQWBD8rosaFdM2y9awVN4x3qywlcCfW6b6CraXKdXeFzmBKoG7lqUrPmpCMdaqraOj1L0lDf3FhxzDRQ60RSRs9HqJzG7e/HLpG983oE8CpCmbfoco6s7BAISlcX2clc/rZg5q40mTGB1IQYof7/odPu/ns/T2tcFgDFby4neY4JFcdaKUhtdEuC2yg25wFvC4TjY4iH5Lx+LZBh0MX2avzKmpnPch85WejAhC9eje8WUiS/oBjXaFE0THK46dNBmZ127dLXp158QRM0axbTm5/JfyIWfqDdMBzJ2rFH0xxup8k516BqBG5FOECv7fEcYJx7AAXvqJVbDdHMc6SFB1jvpfS/ppZnR88dQ0QZ+yBz9d/bklHJRFR92W4BNwj/SAKzjPyQpJwCbvOoUsMCH6N2wdF96o8giztnnLv4uXWfw96arQMQa6W90JJNQX62NGtGJO9ghWG+Ep2aH/sGgl2lwgMsgISqnFCrmrojgWSGEWAd3JTCi3dIChKpP/KpkTjTZhPsOktGiOKOE2gMfRR64AVrAAO0GmVW6g/rRqn0vY99ZL1c44vP7lXBTqb34Goj7mBp9WPiJZeF3BxKrY7/ENIJJUMU79ZddqrS+vu/hljeiHo2vmu2IMCrQejR2k9UJ+LgotrW17CpeJ0XRk5xpPV4Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <055E4995037181428A528B7CE2F21C30@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 BP8LhK2BpML4ioB3rUZj+BcwkSapMEaAzLfRgft7cxK3IrO5TNmOJ2YgddXSWaAjTfrnLJiwByZEp2iD/wWMkReyfKgxIq9rDFlsIqKgYMKnkR8gcm+4zTwbdbjuw8rzFvAZdq70ovcCie3lrUAeC74CP9WQL+k47MsrTtjD1k93B2d0y6fjUp5RSeyRHVqceMauzWRqvRBbczO9UH3jLSX7NnaiR6L6Q6UPMzEPHN53gv78zfZKWgiWP6R6sSvQSdRibh10vEyy0JdAJRNI23dfxJYNmwhZV+ONegBT53uMYW0W534YIr0/7YJKgauXhknJgaN7pXXSOLDnPz8NIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: fceb8f525a4c47a48fdee76ddab5b8d9:solidrun,office365_emails,sent,inline:f444e51eca3fe390ef06f1392570d17a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNiytTLLO9Ofs2WBFsQEdZ8j2rRXK6CHeuHosEToUw+GOuWNTzjLQwFtqJ4l6uwVEARIVrRS46O61XEledlbNS8yMnku8dKUom31RrC8FCObe4hgCNfyDVqFkuG0hv7t5qgvuBc3aXwgNvTgMIkjrAEsLGFR2ZZ5KKdlq7IKu3i2YgXskjBXjv+QNov/LMwefl/zVM7KUkqttluEgsmITrocmmErHG9vN226SlixmN8G0072nJVfI9Pb0nQQhvrWSiLGl5ZqYd2kM3/f0mD0pZTs5/swshF9t5mSRf7pLia86V/ADae4n36o+e5YIAEYW3lBgeASk3gQIXjs+dl5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK1opXBraoqkmNBXv11XcK3g1XwitKHpJzre8GncT0w=;
 b=ZvZi8jI5XjyZDD8aRFnWpFby+Dh2ilqI90mLik7EjAkfPAivv66ZBUtckmZblErqA9f6dluQbw0Zw4ec27I+oe0igL3hvgGPLXk62IBkxTyDJ405dJCq+gkfqnhJwBfHHcz9mr4q7sqt970oq++JZPatR+nbRPR7HwV7e2dx1GeUTBxfuvJgkTWnMVz2keUI4hXCPTnfUF+ZMoCKPUNJftM2GKBoTDQxiqZwvsDYPWYHSzosc1BGkPJTMXHCQSI8/yE5EDL9EUU4Fwv2gxh9UCqi+L0zutCFjJMWc9cZbIlcGlhwr+Wmd3iE/l3mq8DsCcsMpzPHX/5ilS9Va45zQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	813139b0-c7cf-416f-ed1f-08df099d08e7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|14060799003|1800799024|35042699022|23010399003|376014|7416014|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	GL1obytMGgBp/R+S9nQrZbCbrsxBTXF88bBM7CNPqA7qNfmmudWfMe70lg9YgYBlVjjVPMBfBoKEiOVn8BO+M0sMGJqKU7R9Sc1T71JdJv71oH3Zaop3GrM7wx6+/U03mGj7NX0t1gFLCdn9z3NNz11NuMBSODvScMhddN4zEshw3lsW8F4rHZNEbTM0kEAw8/HY6KU8ADnMbw2rN09c3sRxUHxSq+iaAqiYEvHBcVzL0tOo/MFVP0fYdahB6y292qBOBevF2GKCzbJAGjKV9zhXYUjJPe8hT5zZYOYk6tNYWpjvwjWxP23jdt6J0kvna/48MwUS8XnnPlRmdaEB7+UCiXiwh7dzPUn0k5oVBz9aqNVG9VbJL4374xhpjDY6bCOLlZdPDK4+NkNnPGV0absaDBCHNbrSFo/8FYtju6X329gihY6OvYrGVcItJbliti6+6zzJlvPsdtaRpjW5fyoS6YvmcfIGX+jXlWoAi3COCJmxjFEGYjhlxT/hopptDdQ2otnjSIj74SCRzT/YSGjnEkKFWTy2YfKysDkYAWS/rGC5vaKH1sga3q2IUoZ56Zos7fUgXHZBHFIVMn9gK21txA9AGOSlDQLTfHut9Jwv2cnFQzdSYDP3BOMkrJom2oVd9LImk9nn/DmpwplGKRSTuRxGwOJ5ZaYeT1SAAWUhxjOl+hUG8JZ9bui2NW77AGskm9sNv0XNfvCsfExT0g==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(14060799003)(1800799024)(35042699022)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FlRuGBBNDLZHznG+bNvsuHjtDvU3HFRYJkTWUXpfhMVg4pPVcqw4X8jt8BHz3O2kyRr0WcwtCI/MknzQVN3Oj700lWRY5htFXJh5nLWPHcIOYBC9ipKhlF85cBXq4qwQziNaEFa+BaqrvECLBMYgzLcrdDpus7PY0kOGgKZVKXah0qVaq2cjpyanTVVNJcdFypRnKJeNFzCSSZ+4gwT2GohDtIMSouSMznxsVIQuYUe9xxocghnHILbZjd0by6L19DoQmY3f/eIkHlYHBXh2De6aVBBlXwrTFekP1fTqKnonOYv7RFJ29z7lRnYfKQg7B/7ZxZ6eQBTsU4qbssiDXzXrX/k/HAKwXgedJO5s3bNtdfIk2T1e8ORGX6302WsH297rT6CT4Q1TwJjl+7r8RXn673vox5XkXJmrDYtiL8YFQbuva7WZF4EbiVbXPVuQ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:23:49.9202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4ef92b-89ec-4bc4-452e-08df099d1067
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10218

QW0gMDIuMDkuMjYgdW0gMTQ6NTggc2NocmllYiBMaW51cyBXYWxsZWlqOg0KPiBIaSBKb3NodWEs
DQo+DQo+IHRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4NCj4gT24gV2VkLCBTZXAgMiwgMjAyNiBh
dCAxOjUw4oCvUE0gSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+IHdyb3RlOg0KPg0K
Pj4gVGhlIGxpc3Qgb2YgYWxsb3dlZCBwaW5jb25mIHByb3BlcnRpZXMgYWxyZWFkeSBpbmNsdWRl
cyBpbnB1dC1lbmFibGUsDQo+PiBidXQgaGFzIG9taXR0ZWQgaW5wdXQtZGlzYWJsZS4NCj4+DQo+
PiBCb3RoIHJlZmVyIHRvIHRoZSBzYW1lIGhhcmR3YXJlIHByb3BlcnR5LCBzZXR0aW5nIGFuZCBj
bGVhcmluZyBpbnB1dC1lbmFibGUuDQo+Pg0KPj4gQWRkIGlucHV0LWRpc2FibGUgdG8gdGhlIGxp
c3QuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5j
b20+DQo+ICguLi4pDQo+PiArICAgICAgICBpbnB1dC1kaXNhYmxlOiB0cnVlDQo+IFRoZSBTdWJq
ZWN0IG9mIHRoaXMgcGF0Y2ggaXMgICJBbGxvdyBpbnB1dC1lbmFibGUgcGluY29uZiIuDQo+DQo+
IEJ1dCB3aGF0IHlvdSBhcmUgZG9pbmcgaXMgYWxsb3dpbmcgaW5wdXQtZGlzYWJsZS4NCj4NCj4g
V2l0aCB0aGUgc3ViamVjdCBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzd0BrZXJuZWwub3JnPg0KVGhhbmtzIQ0KSSdsbCBmaXggdGhlIHN1YmplY3QgLi4uICENCg0K
KCJkdC1iaW5kaW5nczogcGluY3RybDogcmVuZXNhcyxyemcybC1waW5jdHJsOiBBbGxvdyBpbnB1
dC1kaXNhYmxlIHBpbmNvbmYiKQ0K
