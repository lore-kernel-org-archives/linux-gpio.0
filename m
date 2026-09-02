Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021072.outbound.protection.outlook.com [40.107.130.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC447ECF9;
	Wed,  2 Sep 2026 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.72
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349856; cv=fail; b=cHLNGh8gCTgdiyGbfSc7jL4zcEb4H/q6T4Qfbbzf+h+lbzCjpbvBMDUEou6tOzqHpK36VIeGK+SbTBkEhB4bbsclzw+8tdYMFfZy0rTSmiE66+YuAoWXGD/KVsoDzr7TWKmN2Jk39pTRqhAbvGrnwlPsciXEkxL9+75S1I80QRY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349856; c=relaxed/simple;
	bh=pogjFqSkNK6V1GLyXG9mY/NDPlms0CA4f64qamDvD8w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kR3IrSoHaVNOWyL0JwnAv5Pp2S4kXvxFfjagpmDqUfDzKemFYIqEcdl37UGXm/5kZ1Q2czv2fYHApjvkSba1Qy/6KxEJxKgbhNerQ/5atyRCgE0eCOG+G1YQK428EP3Opb4wlRKORwbb4JEK5SHucEa7JH69vWpozOTQjxgSK34=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=sRKgg486; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=sRKgg486; arc=fail smtp.client-ip=40.107.130.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="sRKgg486";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="sRKgg486"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZxFSXutITcJXc6efsVbjiuIPZkEA7QR5Pv+odO2jD9q3dV3WcRj/jFPEsTowtUNOrD80QhnABix9RDxczCJl9RT/Cwtatt9dKqQxgNkvMiD2FJPvtPjcOpmM1TZn/KJcNbGZoKDlnSBcUJ8EmkJejO7b1jdhSQ8RKTzx0uTa3Td4z/l1ugLdf5FUlx52pNhQLScF1hqrrWjFgv/w5v+RKNn4tT249Y/F94Z+s+hOjDzGcLiujQAY7e51Cu6h9RYFKXUbtfI39IsEp2OBjg08s+2NiMm2Eo2qM0vGZ4IdI+6uhReDncIvrNEEUEmTXhl8MPeZcSkzQYzY1uFBjBW/Ow==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq2+vaeahfqJ4r5UB3YwmfOAYpfL7ISpUL6bmcWYeA8=;
 b=qzzdhv2eSi+mdVq7B5QHSE+9iJwapTOWrU5sbJQFR3eU/DcntdeaZPBD3rAMpMwGQkSLllvFq3cpOZO8KRhtoMVKzTAzfYkFQ60FBPBhMZZDkhnpPRKZ0wlZqVo3zVrBGvD7XcziYlYu7JKkYtpj5yUb2iXFJf/ckQ2pfqJMqCwzqtwUGmO8S9hbKt5o3B1a+jZPOGsash0fdrxQHbJlZmaSfGE23PnHcag5z3IwURPdWr0Tsu8s+dZ+lzp9me4kZXNq9wjoznPx825TS+13j24uDYm7fTnshslT3zji2ZswgMJ9gzjHqgYgL2Ft/Y5GmljdcTnQ4gz00VCJfCFnDA==
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
 bh=gq2+vaeahfqJ4r5UB3YwmfOAYpfL7ISpUL6bmcWYeA8=;
 b=sRKgg486pclGkkDuthWDtAmTy0QLU8l3RPZI5e+yJbe328LcgrCt5Z56Wnyq5jQ09OUcPS3jULTK0GncYKdF3McTFhuf1+6rDgmfnU95ony9R0EtId1gwEgmmWnlHOgRXzcF+9nQh8VWUQfBF83lL9kGFyU2dTus+Rbk8XWnwom9cPzNeg8IIckyYACAD3Zq4cR8AydJ57EMpEJ+s7AOH9qHuThz0NWC6XnfPtwb91ezTveG3IIcc4imPQbxPjv5i9+GCpyEWMOEzMLwqpIoajfZMc9xP6uQuoNWKfjkpHk3prrFpq/ssHaBEalRn09QAuIxeRZaiNyd6gQhxONd8w==
Received: from AS8PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:310::23)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:50:36 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:310:cafe::a2) by AS8PR04CA0018.outlook.office365.com
 (2603:10a6:20b:310::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 11:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 11:50:35 +0000
Received: from emails-5666934-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id AC4BD812B3;
	Wed,  2 Sep 2026 11:50:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788349835;
 b=BwRvamIUo75IV81YI+jMMBgSyT6OqvDL9yNb02fqn/DdzVwgbUbl1KhAbNQGa8KcKSiGa
 PyTutz6fdA/QzEnmiqEVmbwustdsl65CgxSOcXKDGzGDU0YCBFJpS31hy/TJNfJFY5xlyxq
 jFgdk5U3VAVZDgmN5b5kCoNVsaDChrg=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788349835; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=gq2+vaeahfqJ4r5UB3YwmfOAYpfL7ISpUL6bmcWYeA8=;
 b=PZK2qAMSw3NQi83VNARb9g6EQaHgcaxyCyJhC731fsJwPKXBaxzYUb50qRSYYHTwW4gOw
 CN1NzQyWX+aleI0+0qUz9979/6XTNeWblvzJhg0D0sDq5+0TuTDeIbMBmLywC+Xj4vtaTER
 uwzizGc8AD+oDmL1ME3npX26olXQqgg=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq2+vaeahfqJ4r5UB3YwmfOAYpfL7ISpUL6bmcWYeA8=;
 b=sRKgg486pclGkkDuthWDtAmTy0QLU8l3RPZI5e+yJbe328LcgrCt5Z56Wnyq5jQ09OUcPS3jULTK0GncYKdF3McTFhuf1+6rDgmfnU95ony9R0EtId1gwEgmmWnlHOgRXzcF+9nQh8VWUQfBF83lL9kGFyU2dTus+Rbk8XWnwom9cPzNeg8IIckyYACAD3Zq4cR8AydJ57EMpEJ+s7AOH9qHuThz0NWC6XnfPtwb91ezTveG3IIcc4imPQbxPjv5i9+GCpyEWMOEzMLwqpIoajfZMc9xP6uQuoNWKfjkpHk3prrFpq/ssHaBEalRn09QAuIxeRZaiNyd6gQhxONd8w==
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
Date: Wed, 02 Sep 2026 13:50:10 +0200
Subject: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com>
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
	MMZPR04MB400504:EE_|PAXPR02MB8248:EE_|AM3PEPF00009B9B:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0b89c1-b467-4d3a-9b53-08df08e866d3
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|52116014|376014|3023799007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 ybzwNyAP2C/Z5dtlAeyYTTfwTuhawWLKEPn8QFNb9OE/RR2hNK1RFByi/BiWQyIxWLwXoOMkClOMg0XSled6vHTJ1HHz8coPf2iYdzooAe3d/pPBMFh3Y4gRp/BAcTJn2GMPcJDdt9MsKGPrwQK//BWZfIEiBIkA/APd/zsKc2bXaRvNZOc9pTpje7A6IZbN6vLjqjErHNGrLEbFMEJeYX9Jrn5j1gFsSH3M1K0JWiHikOtNPR44zppppgUcVdxnhq1zRCRv979EtuJGC73cNBronQWvGOWvZzUOFgZebB1FioOa9/20zbNv3354pDj+qg3WVV8Hux1+LjbwRr28zuwMkxizbF9Fc7nbTaVgJRMAbmNUQNI4H0M35ny2JjDpHvwshOEhlY/vYHcFnfX2Qhf89Z0R1pLaUCYh9LW4Ft4OflkttR0qjy1N7Pj6APhynp5n5kykQVpPk3mG7SxamZlP0IXfQS49seF1kTn3GXK16QuXqNQf4iGbc9ptuOPsKCJ9X+bgpUTXH07zp8i9R5CcDDhdOxpoRRv5MBH4pb8gXEEB33E3gdNqYroiNrmluZf40d86vWi+kytbtSidEf7l1FPDmjI+dk3YtmIjBCkEI6wB5dlUW7EFfhsnMM/RtulgDHUsc9FrZWaumk9+YQRv8rXtBxjG1IxyshHlKhs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(52116014)(376014)(3023799007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 OPjYAJgzzpEoA6ip5ZvD/+MAL2A511eiUw5DI1zc2z0k3AGg4bqghP8q9Hhluc1ukDv7Or4el6wKGAaCKreE/EI5EbI84hG5ABXemhdnjifkz+aDMCVvIc8gtzd+E0yaZ6Caws3AwnwN870bhb+kqhVVkNqYypF7MHhSA7yD4+mkC0tqXOFpd6UEexjcQvs8O9+XHBeyZFnhgFDucrf1uxom8iwqH5nxGjDaEtLVfsrbm6HMFKX7Mci9I/n2+tjpXDbQe/F8jJQgNAYoPoZD4JrRL2wACElwFrFedD7H3cs9lD3zgxLdyco/DX6vkioe2AUCrDVzp1u7z9uR7VCYtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8248
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ee182f6669784929b6cfa0b2c8461498:solidrun,office365_emails,sent,inline:578e1e4ddf8b6fd6dadbc07d47737aab
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZe1iu5ceRACorPYHm3SU0zGcttA+tc/WjnI+FG+V/+/J+HQKBiz+Jzve8eeIZ1ETLmM5ntMVTj05/BZ+vt9dgjk5oeMaeQMNc6tsc3uFhGCpu1JD6btt2HeVELFVqWFFOIanKlhnJlWUh/vEHR4DP7XpUgSSonHvxPQom0MtZO3Jqua4W3kxEWS5jcuqqTyLbZ/qwjdoBYX2GSFD8tzRpf90uhrdzTbf9x3y3sNGhugofU+/sSRkXPEeWh+U65FY1uySav2VSlmOGmQaDZuqtzOTPnADb0qIT+3hOQZW1aWZ3c8H3lMRyCI/a6jvnrYK/BzIZfO1pCg6cKX9xK6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq2+vaeahfqJ4r5UB3YwmfOAYpfL7ISpUL6bmcWYeA8=;
 b=etk0paaniFT1f+H+0fR7ZXDFO0LY+KSvK/rccfG2AnUIXi26FIsBefJxaQOWv+TL/rKnuLAK2Ak1RIQDh3sN3/psyBgHkoyYAXGBV6CoY+NAOVj3xdRWb1Ap0CVinZs20g2zhCC9v/GTZLoYIBhszfcZ48sURpUCO4KHRAQrp1aCXtH36GEaaFtGQFUxHuAOBeyNozIy7NKg3Azw37dyZdQLqgJfq6bBjGqkTUftuIx1BSdgRa5whrT13NMy0iAjNSit5Ufodl8nsmWaqvoZIAr7pIool4KWYMvFa4QQKiYeVmoPxx52oCAttP5FW+y3hqGsBXq4RG7g9kOMKLWRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2553db7a-0926-4436-a868-08df08e860c6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|14060799003|35042699022|23010399003|82310400026|36860700016|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ARXkR4Y+qxXAaSift+94evshkUSsZD1Qxd7JFSOnmCTzyNyEoc6rH1UvfnIS6YTU0tghouXbV8KF85fqN+KGKCnHUg7GlSQtwW3Lw2d7Y3WCblwWtZoejHNLUrcD+btrADTwB01ZHi3hjsdNzJGZLNJUwSkfJPFLLjPQpeD784Fa+4VxO2gwjXKw+ib9Y7D0HkJTdGXk8gmpnWOgoQ4hzLjZ+P1luhpFp02xKnp2ND10PXqI1uzRlFaJApZ6Dv6M8Pg3GkgQx053Zl3RaaAtPxgx/E+176Gyrj/ZFM1iqUN8j+9qUKS6osET82l3r5OrnRoOf39GD7U0n10el9qVejrUZTyffcjaDNdE7+Igg3bAK/8HkEK+JcTGn6cE9vP7QjAF9t6/aUnjJf1m5HhJJi2DSIDjK5MQoTTyn6xZEFfmY6sl6nO5ZfinZV0Mn8H7EJGmoCIcuGUH175F04OAhsSkwYAOlHkqoSpszEwYLeaMlv6AyefQT1IZbyfdAtZ24U6HapLoZTfgLvVHcHOs7Ef0mzo7Gq2LZLCrUZ3wb5e0UibDsDmXeQJ8O+7LwfHEIkTvxsGOF1Kdmiq024BZZexJc2MtKDbkDE/0XHbeIAgDmlYI9UeOoxYV217qZbjTM1iEjJn3N+0D8K1SF2YxyJOCehh6ZHzqOenE90mlfFFqYu2+dRCFImGwa34y4tKqVbDOeEEM1TesNXm5JXjPEw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(14060799003)(35042699022)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ik2XWCdcb8e3nw7dpQm4iJeMDNY12UQMWzAeFHsPg9xAkt1KeixjabCz4y3wWK8xHBGER2Op5AYQ6icDxHGvU17h4thR4uHLGLw94zP5xccuoGHp1nmKlk5jrqS/A6sOug2jJdBh1eata2qHu8njBTiZKQ3B3ZJ+sfNYNfmrKHiveke5V14OP95yKxZPwgX+0Ie0xQlugntpA+DdVIPvfO2hjDQTnrC73ugb9MEaeQumPB1CRoWoj+mk6t5uKYpmSNBZhMgj1B1ls1ZAL4PvGHSgzxnCaNZXMDpCBCkF2OKWIFiNGWQnsOIeDWEWs4NCLeiyZRuLTtdCjUvwcAuJkoH3W4Qb8JlvXpDOr8VhtgEt/kSWvTPmFK2kDKKsRpqrcBziXR076z+7iCX7vNbK6Of0uaeFNfCvmo3wJEpZZYOrs0O1Yi2j9xKsXD3DFxov
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:50:35.9419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0b89c1-b467-4d3a-9b53-08df08e866d3
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

The list of allowed pinconf properties already includes input-enable,
but has omitted input-disable.

Both refer to the same hardware property, setting and clearing input-enable.

Add input-disable to the list.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fb1fe1ea759fc..5089be4770ae5 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -135,6 +135,7 @@ additionalProperties:
         gpios: true
         input: true
         input-enable: true
+        input-disable: true
         output-enable: true
         output-high: true
         output-low: true

-- 
2.51.0

