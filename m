Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023103.outbound.protection.outlook.com [40.107.159.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1E4772B8;
	Fri,  4 Sep 2026 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.103
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521617; cv=fail; b=EKK48/pCUFeqFGPkmAHnyjQvClHe8j7I+cmDzadmuTybTESpGwvKnQS2VdU3T0QyIXyd1DTEbF40H/4EtBRscd1UmkuijJmUDqRL/JGXf/ntyLVctZvQlu98oZDvkevq9H0XUivRylfQikSDr1YBdiV0lSk3c6byf0meytb3mQM=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521617; c=relaxed/simple;
	bh=cAfRcNsoAkObbhf8BSj0EGHicqXSkAjYwXd7MCCkYb0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=icjxSaJ+U236NcTI/Nf3rQQz4O6MQY7yjhKdmHfpjXO4kQDEE9lPgUpSwMM8/dktoligATaudMEwtPFKxTZtlD++YFba2cm5tDLD8sV+ZO5AINV3H/5FdZ6B3WbuuaJ8wRksEQym0/lcNmy1+vrvMVw/LbRSoIhOvbsSxfeZKy0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=T6XF8/yP; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=T6XF8/yP; arc=fail smtp.client-ip=40.107.159.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="T6XF8/yP";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="T6XF8/yP"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x+Y3hqzzwOWGaOidwutMAZab7hQgvvcZq6Ke5dzemmUNY8USpTp/VCCvHpWcVfYPR/eI//0mjdzBofxww4EojK+a2omZR1PwIfIX/0eTXcXJhuSGrwiRA8rq72i5PeNSuPk3Rkf6TXOjMBirY0jCDH2iLk0tA7ie2tlI9Vj/d4t2KUu5OKAZ97a+JVf74MbYBWdlGlF3IwNQIVtpAOlaB54qd1plzRv8Oj3oQKvrAGLH3Ir8g9J8p6Z0l3dps5omeU1t9CRmOcnR69MJgO5/Rng1nYo6sjhcBk8xyCpnAaa0Bq0gWe8B2YmYKvnRKsOYUVM4ICk/cUf5gFiBIu8GrQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAfRcNsoAkObbhf8BSj0EGHicqXSkAjYwXd7MCCkYb0=;
 b=uzsuhIJJybjR9SN34EMP338s1H2l94iU+7Wo5ONXae8mOd4oLXAlBlydDBmborW7dpKgC2xgB5mvNn9K+BPXwtjdMMRip8r7iozIiSTp4RKl7Rg0OinACwUMAD4xIjlU8DknC6HhXyt7Sr9V3ulrFoYG0bok+eKhFlbrGqeagen7w8L8IH8WHt1Buf06qoNOywrWIZAHumAnCAfZmpdGa0KtDnDS3BM9uFyFE42gCMGnjgf85sGz4mudapfj6ciL/LhNFce7jJz/6/ndmQbpbxlaE+X6MoSblsfZ3QXZ8pLetxzh2VsIxNd6ajf3CEYSYI623H25PIouVe0KTMHqsw==
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
 bh=cAfRcNsoAkObbhf8BSj0EGHicqXSkAjYwXd7MCCkYb0=;
 b=T6XF8/yP219NGsUlysk1f2kSLQGoZ7DLIDkfF+TQ51xZ5OSsIqL93sh66coXt/pwsQivZLZ/Dwb8dlvyvExNOJLKtGEj6/iqTGCl0DHhVLJ93gvzo4edsQ16ijKL1gFg/nBb6TdvW8r0rDHBgEH7u3j+H59c38ORekH1sFfm4qvnx8jFLiSVlcOAnnadzj6aIz/CgoQAYwssoSfvqFrHOtEkYYspI4SBah6eTPV2TR9Vvog7sTDX4bbxhLfoANwmH/7k4jUfpKTN9GXF5HftKyH7R701kdnDH6w5L0y+Oo99scApTH10HgvRJT32cj+F4hKnTpKwtNmv4I94n5wqbw==
Received: from AS9PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:488::23)
 by MI9PR04MB532906.eurprd04.prod.outlook.com (2603:10a6:290:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:33:29 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:488:cafe::5f) by AS9PR05CA0024.outlook.office365.com
 (2603:10a6:20b:488::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 11:33:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:33:29 +0000
Received: from emails-7008659-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2C0C781DD3;
	Fri,  4 Sep 2026 11:33:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788521609;
 b=AiJlWpsmj2m9Nuj2OWGGVXYh6MQUwsbmE2b8acSlEI0SkXZceAhikpiLKju/Qcpxq3AYY
 +7Modg3t2pUvIPS9ye/4Mmut9Qxqev4T/uoy7YPQIA3/9cVPK5hkQv6Y1X/gigcvwq3+YOk
 FQojTTDJ4Fq7uqu2VsXyiGHq5w00CkY=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788521609; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=cAfRcNsoAkObbhf8BSj0EGHicqXSkAjYwXd7MCCkYb0=;
 b=Ciy0tnzZbHYoQq1Dy/9WBdRv5Zeg+8R8fT9C/7s7k+SBmgz9B8srRYDszg9uVRQItLjn1
 4WUBYUbWhfpNU4JhSaL5Rr7vIARz59ECrz7BE1Cl45Ehjepi6aJEYGqOnjjid3eISRy5AOe
 kiHZfJPfXa6HZ86ojKLIqh59/vSm7rM=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAfRcNsoAkObbhf8BSj0EGHicqXSkAjYwXd7MCCkYb0=;
 b=T6XF8/yP219NGsUlysk1f2kSLQGoZ7DLIDkfF+TQ51xZ5OSsIqL93sh66coXt/pwsQivZLZ/Dwb8dlvyvExNOJLKtGEj6/iqTGCl0DHhVLJ93gvzo4edsQ16ijKL1gFg/nBb6TdvW8r0rDHBgEH7u3j+H59c38ORekH1sFfm4qvnx8jFLiSVlcOAnnadzj6aIz/CgoQAYwssoSfvqFrHOtEkYYspI4SBah6eTPV2TR9Vvog7sTDX4bbxhLfoANwmH/7k4jUfpKTN9GXF5HftKyH7R701kdnDH6w5L0y+Oo99scApTH10HgvRJT32cj+F4hKnTpKwtNmv4I94n5wqbw==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GVXPR04MB10517.eurprd04.prod.outlook.com (2603:10a6:150:1e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:33:15 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:33:15 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
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
Thread-Index:
 AQHdOtE+gVzmYmXL+Ea9R+ytXkurZ7a7P8yAgAFWXACAAZ/tgIAAEUMAgAAAwQCAAASdgA==
Date: Fri, 4 Sep 2026 11:33:15 +0000
Message-ID: <1098d7f9-13bb-49da-9aa7-c42b1a33089e@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com>
 <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
 <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
 <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
 <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|GVXPR04MB10517:EE_|AM4PEPF00027A67:EE_|MI9PR04MB532906:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c87504-a740-465d-a108-08df0a7857d6
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|10070799003|366016|38070700021|10067099003|4143699003|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 J4jpTQezmOZ7oRNjzM8poeQbn69r2M0EQiw2zIvj72j7afjnqnKdv6EJ5aiHAkktVI5MFfSQH3ETHReOtXaaZtTBvo8qPHO4Snj1HwUToaii7qF2EKagJ/hd5pUzF16DzAVdFntzVbX+TX/8BjFgW4lrNcKbd7NbgnDH8/EZ5sawXgeasg2NAetTHtLYMRzsta3BavDh9JxB9BQxzsI56WrXYMD3jA2+Joeez+4PslO/Mn63Rgs+7h0BNhpXjrlyYGX3pIuabwYfFkzvEDvpEkwPEYeLUUHSdsVYu+ns/IJspdwAI/HHoIw8HFj5IUeWzCg1G3xxuYiAdehH+fMaBs4Z0UeAVrxUTDAIUS/35Y5kZHjmigpkVpIiC+EyrmeRViesrb/22iAfDtq32kjozu7HcGid/KVHZgzW3NH7t+WgLnQafUCAqS3PEH+RgDwG0PwIgq0axPkaUQkw85cJ0hMNzku9l3El4P/SwrNVHYS/xkfMGzXk3TTUK8PH3vcQ7EmWE/GFGXoVDxlqVnTxOWF9pBv7IJHNaHbdmZrRQkkd7xPd+eWq25ZfJNg0Xptoza0nE4SgqPUDxY6dcl8NuJAw17iTSYLFJGJQo9ejfJkvprOuh97Xbf+7lHUN5Vw3V+MKLBJwoGh459nuK4u9Ybx6ZafgABC8OcuEUDZ+TTd7upVSmk+Mn2BQBRFotS1Wh8g6jzfwShQt1E5J2ojaA6WsitMHuKNIJHCqoOcJlds=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(10070799003)(366016)(38070700021)(10067099003)(4143699003)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3650087BEF4F804EA17024292EFDEFA0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 WWrOgsfu3JRxUycFaR6x9F+Npeu9Fa1oycObBY8JfhW668WdwkTqRddKCy22icoQqhv4HTdB7e1jGanoWVvXR0fX1ti7o88jm7yz85SpwgQfFDCuOO1c9kPH4W5Lx6+x3cd8UdcqJeOSrH2jtFTyZ/vE9LPDvNiQa865gN46mjtSDm86cdEtGlQbV/nVilkKfgnX07o7GubgwHpX3juidc7VX8QCJAjJNACRW+/JaR99GE3fxKe7ru5C/0JUCDKuBvo1j62qQ9RPxzXDQB5baumqhgggvZCQE/1xnP+RxC2LRdf0qvEQx9IcxLCKRnpKyUhz99NBPCkzuEzrFeVQsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10517
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 079f0d7a5eee4bab99a9a79167ecf7aa:solidrun,office365_emails,sent,inline:c8e7ae9b5f88038d8ddafba974ceae05
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXPvbvFkHgMQe99eBOe2r8UDoaT/RIkyhXfTeOClocHCrn+ctvVSvDU1mOZF7Ldl95sLRYvFynul7Ld7L8CjzEtFM0rswP4WOIf+ZmF4eLFy14YjmOnCyburkNKaImxLxuMdtOI85Ui0X1a/TdnStjgv1W9AqBn2g9GCsV4Pvec39nzvBCUVZYzukpagx05x6zG0g7vpjC7+cuoAWyMAwojg4aDWOHq70IkL10cT/WNLf5EYl7FnJdO+6fjquhqGm3p6eJ63XcIMJA+/kmCI5uqE7hztqtNUGSZStNUIBTNnOV/DkAzuS5IQy8cvUBsrt3YpLuB0dQVlSjIKowB5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAfRcNsoAkObbhf8BSj0EGHicqXSkAjYwXd7MCCkYb0=;
 b=d0UJTD8IFLr3AUVnsfTwU3EHOHlAC7xEhTaO5ZbcZerPobn9tekBExVWlHAKCUSCaWYLpCSkn4bUodyk7zTWn3SYWH6Li5ow0UaX+CUv0397ePJhkJz02xvXWs6O/mzCCGLR8wUiBl8+/IOqwfaIFs3ZknQl0Xapp4jiQap5+6ugjTO+lTclHPqM0kjINud0jjbqai2MNuRM8gM7JxOSpW8BahPWq2tUB142mIvmf+eQlPJHsWSnRX33sQUwlY8oo6ITF+W5KAjZJc43DIlHw6Zqd60q1DGpqkqpy3xLmJ18KhOUHnY1+C1tb0V7w2wEIyxIZol+1kVCDjYVzuDtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0c1ecda2-739a-464f-15e3-08df0a784f88
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|23010399003|36860700016|376014|1800799024|7416014|82310400026|4143699003|10067099003|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	TEFo3uDFNE2x5P1/KzMlP4fln9ABkamJoAQvg5Q+pqUfcxp8yzA+8nVnQqm1WexAu+sR6tAhf4vds/A6i1tP+n+MZhoVGDx8/7DDnJOxzJOeVjJrAOy8k++Te3JqmYbKaiSNpy4QG7MFCqyrm/r93km8qIclj1LivklrnYgGMvMCQIb+EvuGtX64xuKY6F4wt43x+ILXTlR8X5ZGzz3SV6MMcwC0Wbtwllb0ETsr7N8mBCE+eshNNB+x/AJIliUXGl6hwdJwHFOLONXUG8ETJsmC/5bU7rGBI0+xRal5qtxo7zidbtzcBXMwZVihdnDmby5ETsBwJk2ZEwCv2drLGaLQeQE0wAtlb0Dk8EAGM4JmFoP13YkCrFwfcfFe55/azJMg2GN6b/fDOC0EypRE9PPAqa8VBlvzZtm0Xc9GEdi0Jb7upmNNoC9Q+xAYdDUmgKaCiZoJYiqJcZ4Bdo4fO51OcpeHf8MHXMQKRk83VCAunt/2v9KiFYD5lgX8iJXWReyW1vS3L8HdlMhxKsf9Z7sy5sXM5yQT+dncix6SCwPiR9tCHpjLBNbf0XHHqdpkJendDlPaC9K8nueh25z9UswQsH9UofUzomYRCT9BCgNwuEtzuQ4yfAqD9M7M5ZxRIPNKH+iC4/3VDUrcH5QalLOgodytawpHkf1L7m0pUhw=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(23010399003)(36860700016)(376014)(1800799024)(7416014)(82310400026)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pFHq0ATwC77FswRmXj4+Hz51MimdPr8dg4vcrpKcVooGa5VYvvOQYu8CTB4ZSlCyl7FMxtxMd8aS7oCjhEuOOCTg2KNM7DF1zSgo+AMmVKl+SsR00XH+4U/K0uy5TdpGbbma8i1qD50VW3Aiy9pTQsp9LsBIFgmebkSG3v5028/BmuqMzq4GlMyCn70nom+79B+g8csyvn33KqQFHinxMv4Bg/tQmYax7p+ese/zHP9dVegeENs0gzRuDd/ays7MJ5xDJWwquQwig844Y2nshY1WbG48nErSbBbJ2CFpbzDOoFe0Pe6qDG4bWtW4GBTd1xL2e0uoPh37AkzswZKpJrb296ZHHVvntr3YwOTxVoqVigS4lySmcnv581eD2QCS4ztVxcTvA95w1w5a0CItk1dWxpjFY1HWdcQCZisP4LGNxYuHx6zUcp6NGPqTrfv3
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:33:29.4935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c87504-a740-465d-a108-08df0a7857d6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB532906

QW0gMDQuMDkuMjYgdW0gMTM6MTYgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+IEhpIEpv
c3VhLA0KPg0KPiBPbiBGcmksIDQgU2VwdCAyMDI2IGF0IDEzOjE0LCBKb3N1YSBNYXllciA8am9z
dWFAc29saWQtcnVuLmNvbT4gd3JvdGU6DQo+PiBBbSAwNC4wOS4yNiB1bSAxMjoxMiBzY2hyaWVi
IEdlZXJ0IFV5dHRlcmhvZXZlbjoNCj4+PiBPbiBUaHUsIDMgU2VwdCAyMDI2IGF0IDExOjIzLCBK
b3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4gd3JvdGU6DQo+Pj4+IEFtIDAyLjA5LjI2
IHVtIDE0OjU4IHNjaHJpZWIgTGludXMgV2FsbGVpajoNCj4+Pj4+IE9uIFdlZCwgU2VwIDIsIDIw
MjYgYXQgMTo1MOKAr1BNIEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPiB3cm90ZToN
Cj4+Pj4+PiBUaGUgbGlzdCBvZiBhbGxvd2VkIHBpbmNvbmYgcHJvcGVydGllcyBhbHJlYWR5IGlu
Y2x1ZGVzIGlucHV0LWVuYWJsZSwNCj4+Pj4+PiBidXQgaGFzIG9taXR0ZWQgaW5wdXQtZGlzYWJs
ZS4NCj4+Pj4+Pg0KPj4+Pj4+IEJvdGggcmVmZXIgdG8gdGhlIHNhbWUgaGFyZHdhcmUgcHJvcGVy
dHksIHNldHRpbmcgYW5kIGNsZWFyaW5nIGlucHV0LWVuYWJsZS4NCj4+Pj4+Pg0KPj4+Pj4+IEFk
ZCBpbnB1dC1kaXNhYmxlIHRvIHRoZSBsaXN0Lg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+Pj4+PiAoLi4uKQ0KPj4+Pj4+
ICsgICAgICAgIGlucHV0LWRpc2FibGU6IHRydWUNCj4+Pj4+IFRoZSBTdWJqZWN0IG9mIHRoaXMg
cGF0Y2ggaXMgICJBbGxvdyBpbnB1dC1lbmFibGUgcGluY29uZiIuDQo+Pj4+Pg0KPj4+Pj4gQnV0
IHdoYXQgeW91IGFyZSBkb2luZyBpcyBhbGxvd2luZyBpbnB1dC1kaXNhYmxlLg0KPj4+Pj4NCj4+
Pj4+IFdpdGggdGhlIHN1YmplY3QgZml4ZWQ6DQo+Pj4+PiBSZXZpZXdlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXN3QGtlcm5lbC5vcmc+DQo+Pj4+IFRoYW5rcyENCj4+Pj4gSSdsbCBmaXggdGhl
IHN1YmplY3QgLi4uICENCj4+Pj4NCj4+Pj4gKCJkdC1iaW5kaW5nczogcGluY3RybDogcmVuZXNh
cyxyemcybC1waW5jdHJsOiBBbGxvdyBpbnB1dC1kaXNhYmxlIHBpbmNvbmYiKQ0KPj4+IE5vIG5l
ZWQgdG8gcmVzZW5kLCBJIHdpbGwgZml4IHRoaXMgd2hpbGUgYXBwbHlpbmcNCj4+PiBSZXZpZXdl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4+PiBp
LmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1waW5jdHJsIGZvciB2Ny40Lg0KPj4+DQo+Pj4gSSB3
aWxsIGFsc28gYWRkICJvdXRwdXQtZGlzYWJsZSIsIHdoaWNoIGlzIG1pc3NpbmcsIHRvby4NCj4+
IFRoYW5rcyENCj4+DQo+PiBIb3dldmVyIEkgYW0gcmVhZHkgdG8gc2VuZCB2OC4gSWYgSSBkcm9w
IGl0IG15IHNlcmllcyB3aWxsIGZhaWwgZHRic19jaGVjay4NCj4+IElzIGl0IG9rYXkgaWYgSSBk
byByZXNlbmQgaXQsIGFuZC9vciBzaG91bGQgSSB3YWl0IGFuZCBjaGVycnktcGljayB5b3VyDQo+
PiB2ZXJzaW9uDQo+PiBzbyB0aGF0IGl0IGlzIGVhc2lseSBkcm9wcGVkIHdoaWxlIGFwcGx5aW5n
IHdpdGhvdXQgY29uZmxpY3Q/DQo+Pg0KPj4gT3IgZHJvcCBpdCBhbmQgbGl2ZSB3aXRoIGZhaWxp
bmcgZHRic19jaGVjaz8NCj4gSWYgeW91J3JlIHJlYWR5LCB0aGVuIHBsZWFzZSBzZW5kIHY4IChh
bmQgYWRkICJvdXRwdXQtZGlzYWJsZSIpLg0KPiBUaGFua3MhDQpBY2suIEkgd2lsbCBzZW5kIGl0
IHdpdGhpbiB0aGUgaG91ci4NCg==
