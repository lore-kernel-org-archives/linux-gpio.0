Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023073.outbound.protection.outlook.com [52.101.72.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27644F403D;
	Mon, 28 Sep 2026 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.73
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616869; cv=fail; b=YJWJ0Uc/Q2/U6c+Lo0a1DqZVsQx7eV9CJMtAEpfFhWDYJiuX3g3TxqUdQfEqUMlAYC71ayYqLTym0O22cnnfJj37KCYBfrHNpNhLsPPWoOwl65dVYWZaxw/qvMsoU9+kQiRg5YYDVNduzH54pQnBIUzNpw34JN5yYr9cYRiUHbs=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616869; c=relaxed/simple;
	bh=nd4Y11F5nS/8TCsLshusZvs+RFFWZsMhF97zhIdpI9g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EdkL58e3ruawGz9sU9/1XtlpO7sQYDzOHKsaWzVWwZj7r9Wy5WoqPlW9iMv2rLrjnDDNmckDPYQZpp7hPKFEfihyGY7uLNjox66es00xO4d81jwLYY7A2IT7OUQrvJ0taJJ6y8kRKyMh42AX7fkkhGwKmi9aR3NgpRC27FmmOGs=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=kdFewnkB; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=kdFewnkB; arc=fail smtp.client-ip=52.101.72.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="kdFewnkB";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="kdFewnkB"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q9RhuOTYh5GhGhhtv9MNr48XMmTdtYGEU4gQWfVvZhKKAD4l5YHCJe4uhRUXOlOvSEUxZ3t9GhqEwbawxSRCb7P53EGSV3DFHU6phcqdw4PEKofeWkGNrMcPuN6WrVCEJ+c8rD9DXRydAs7HOXoaaPd2Jvl1X+oYwiR8ZYd3mSoxAPW8GWp8Clu/cq9EtcXSXkXWlXcnWnnqXOLqpCh17SFROSQ9ycgEsTMGmvo5rD9MD64MmArvjN+0ZMcscTPoiXQYZtCTElfal5D5o2rLlmFAdAe8n2SK8Sz1CuLf472/vkI99wD8bH6T6LxRUcyFuP7kByWdv8HxrTLPODG0Eg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PROfF9Jgeg13XJpdyM38nJ4Ev8FVAaXMozzi1NIYjhc=;
 b=QSNlU1XriTzNnOSP3dT94tSx75h8XpnAxUXx+h6Svxq5x2iX/ldVek/82HKW37rOmUp0x24YlK7sTbBuTjcwROU46Y5tJxK0YGrTL36ZIOulMRPe9EL38KrbxdDHEsieoQD6+hsNty+bkyjll4nX3ZxRcegAYupxRiHGh2qe/pdMU5QGLkYzGBYOV7pqJs1DSeub0Uzvdq+m5tDDYGWSARScaVzScF8ylSUjFU+qrTS1Y+DowV6Oszzgc0MyX6aR4aV5uIo+0IrquL9pMOCygHZRLfITDlrlXYFK/Z8lBEF1WFQoqsn9rKQIJse19aSLm/RcY2xP2DQmcph2BGxN0Q==
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
 bh=PROfF9Jgeg13XJpdyM38nJ4Ev8FVAaXMozzi1NIYjhc=;
 b=kdFewnkBSpOHIRHFI2j7MnM+LFp1OpSRSNaszhuoDgELz3aDIPQF7lfAliMP76fH7wIx6pgA1642fSXIyy77KteZ8j7bwqkCkYSjgvLwsyvOyI/Nplcko7lNI/iBRSaHqllGVk0kD+b8w2Swxla8M8FPCbsBWDR3AyExU18WZq+MRGm8LHxu9dMrMbPJXcLCp2F/Dnhq68g3C949xkKADddXVmDlGCZbWqyfBTWLs3UQkAbcKN+cBt6fPcVC2tu9Z6XYc2CezAHSLxNdGJK/zADtGUY9MHlNUsGzHmHXGCMXVdGgYI9F5zfVlY8cpg7ESVtA7WlycxIuRtr6RdMMEg==
Received: from DUZPR01CA0109.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::28) by PA1PR04MB10889.eurprd04.prod.outlook.com
 (2603:10a6:102:491::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:34:14 +0000
Received: from MAD0EPF000008B4.eurprd04.prod.outlook.com
 (2603:10a6:10:4bb:cafe::2) by DUZPR01CA0109.outlook.office365.com
 (2603:10a6:10:4bb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:34:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MAD0EPF000008B4.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:13 +0000
Received: from emails-3049601-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 60A538061A;
	Mon, 28 Sep 2026 17:34:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616853;
 b=YCOiTdhsOr8SnG5r6uacN2diHoq788TvNGoFfXSVvKsMR2qUiJW08zkh8sIpD1eaQF4cL
 J3kTom+Nz4hfCZ9sDWqhkkdN9S6dqLnbPdeddZK1E/UnY8dDiYQmsh7CjBdtjIvQOg/wCly
 nc23H9b/kVrQ8tLNxHjOj8GPrBnjy2o=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616853; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=PROfF9Jgeg13XJpdyM38nJ4Ev8FVAaXMozzi1NIYjhc=;
 b=QJL8z9EB0pYlvwBjYrI3uJIrIi/wsqF/2UHJ7867ulzR4Qc+U0O9Pv2XDsn6jX3C7RsYl
 UF9mDkQSuULMsSPVCaSQZXStUtI7/0XkPG2Q+Ve/pfeaRUEwB+szSuMItkXUXsLd35fJfFK
 1+emXuClaOY7OgMsQpN1dzpe9agIQ20=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PROfF9Jgeg13XJpdyM38nJ4Ev8FVAaXMozzi1NIYjhc=;
 b=kdFewnkBSpOHIRHFI2j7MnM+LFp1OpSRSNaszhuoDgELz3aDIPQF7lfAliMP76fH7wIx6pgA1642fSXIyy77KteZ8j7bwqkCkYSjgvLwsyvOyI/Nplcko7lNI/iBRSaHqllGVk0kD+b8w2Swxla8M8FPCbsBWDR3AyExU18WZq+MRGm8LHxu9dMrMbPJXcLCp2F/Dnhq68g3C949xkKADddXVmDlGCZbWqyfBTWLs3UQkAbcKN+cBt6fPcVC2tu9Z6XYc2CezAHSLxNdGJK/zADtGUY9MHlNUsGzHmHXGCMXVdGgYI9F5zfVlY8cpg7ESVtA7WlycxIuRtr6RdMMEg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 17:34:00 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:34:00 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 19:33:57 +0200
Subject: [PATCH v10 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-6-91752ea39cbc@solid-run.com>
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
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
	MMZPR04MB400504:EE_|GV1PR04MB9200:EE_|MAD0EPF000008B4:EE_|PA1PR04MB10889:EE_
X-MS-Office365-Filtering-Correlation-Id: f4894d15-5e6a-413f-5e99-08df1d86b6c6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|23010399003|10070799003|6133799003|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 82CS4ec73gRtoRQNCe2ZohPUnL73BqRKb0dfUEdXIvOk0PCOTBoe4UOTT0dH8JyFuoAJ8cCgzviMEkhupffZqMAn+2WuE0Q0aVpb+4hRdGv8aSZ4X2oNRsefOxFaxaS17/5U6nWv8icne+HWtTc0QSYM9JysGOFQY+sW/8jp6xFip8I9L72/8Ze2Ei6ChXIiKWToy2k4556ZrBBqZtjpclyhzrXGNQq8m+Yu9G32w8+DeJNYnj6Uhl6spc8O1/Hk5jHdKbPxmNKgLb769HqwQkWK6wTf4Q3ieQaEPRzI1O36KGGzmArgmmSH+wJs26CII3G2cl0Nchon7oS8t6EfnS3XJNuHwxG7+DN89UxBEk59LZ4JvpFZNhGKZrRN5KgUJx5zgggMltH3ELwM0im0HbXb26FW6OaDXo0zOWMzH4QqwQ/NndlIUA1WHCwfym2KsqjDQz80Uowe+gQWkPC9eWcINbv847BlZUIZh+XBsAaUBBTGFrm5BcAk/TRKxf/lN4sRh1ks3vaRmEzgvdqfKK6TRbJNa3R3wQonlpLloVtPn5prk3RdPUmIznSF0W/M5/qexIwvf1rkh6O0FJ9g1HP/9tScvm4oKdLSgMyslxcgbCx16XkdEFv2SYd9DAID
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(23010399003)(10070799003)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 yMe609Ml6TV0y1JERPA3SoFZJL67ddfyAcE5QgCZq85QlaVckbSfqsfJNUdtHQ5XW1+xsTFjmJDREpP0vbB1z+Rc2n6um1RHLPblkh62RSmp4ctZNDD6u4RTOStpMe6zChTmXJ5VnQ6W+BIVJ7+N6VCS7mnKLs3N78P5orjEELaxrV2Tuh5Ft0tNEpZdvpjLWqv1hogvPK8L/xVixDdq8AJ8T+G9A055KootqiKMsXvTf6sv2OKvNJKfvZ7yWPtToVMDipK5PRMzbWN/VhySGnmFR5zteJ78bKKc4O1IzFlLoXUFJ3hla8NwPJ6d+aeCNlQnpoAWjQGkW5+LRvIHFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6c4b7bc32d7540dfa9df30b8a28778b9:solidrun,office365_emails,sent,inline:87287daded720ae2bc7e73491d419f2c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i182COvTVlCiEBOIhpch6WfOW3i6eSvvGym3TfSq1C50tl5/3RG0yy/M1XT/0IrPDm+Wx3zrr7BNelrs8Q5vQ64R2KOPHHpjYKweOrStviNc/GDtMttEisOb58LFEkMGNPPPCXyNFHXroBsmwdINZhyfI4qET+Q8WtN67rYT5obd9EcLBmKZYbY6ehShod3ln9NNhSdVbSKPKdbQYtWqWWD71//5H7i7PJZlnyBMoTHbKBVQSXnHtNqjKEx7xqq3NBi9wMwXtMaVdeVHfq8mgFjArJgpCHurkVRbvLcHHd7jCRSE+rzmEjuDGFrhSO0Fycyt3uATbZEjS0o4Ahu/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PROfF9Jgeg13XJpdyM38nJ4Ev8FVAaXMozzi1NIYjhc=;
 b=k6O4zTEY7yiqJrEjZaBPU1P6XKXqqc/t2MFSwUDflNo601nf+iqY4p9PxtMwxXfVOPu29hSmUoQprbnEIi/vHtET2Q5y94zrZ5SYyzGX8KUsRXHANs7KwBlzoMDZlEdujChH0sCdvztjm56ruJmE0zkW9fi0XtGcOjT9/E3zYN7ChLGlLrXQhnrH6NXp/zshdQNpHSWArgvKnk2BjGXupXrwZPZRAkgVva5sLryQ79V/1LHuz1K7S+HUDWVUEuoeDZMdLqbmFCtfYRNL7ga+mwZ7XnXah1JeuL1fQ1t+BEC0z8eKJSqY0QXJLS07CzNVcU8VqZ0GLLbRZQ3cv7obmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008B4.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ffd9b2b-fb85-44ca-1aa2-08df1d86adfb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|82310400026|35042699022|14060799003|36860700016|1800799024|10067099003|6133799003|3023799007|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	dv4gPbx8NzioB9LM8mDYjZWUJEeIOOah7vsqbQEmW9Nl7jPfh64MYGkKbRuivJiTRuJA4JStyyzLPcytKPsl4yaxcKMTdtz/82rF69gMSUmMlX0eVr8HQQ7pS6TrDPTQJLCX3RgdMnhIHasV4/hCftZZOq6wkR+W+/OZS3p9WQnTfiYqGIJPqYqXXOBn/gFi4Y8kQD2KSPDNBI4epi4Gx/Jgl+sDqc6VI5QBQFV9cBXCXYQs208PT3QzTXcz792CVBblpv4RHv6IH6+Rbbl1uGwZJhYV/vmFIlaMfnWZZfyLmbpiXMTU0yWYCx4RIABnPSjSzaIMwly3bjfLHMp475twWTUv01ZWRW9db+E36uBBnuty8Hk6cvYE4Q/Cy7CVoJrWgkfIZMo2UKp8yKbcis6TbilhIRDi4K6tZmQLBlxUr+cgIx0eMf/9ncIINGxYlpZ07bIAZsAL9L6VgSaSkKbew+Mrw6BX/oCAcs/KWtH10sfuutrEyVjZ9IeXjpdj2a1YarqjkelddZa4rpae5Cm912IAdQKCwy3+iGRo8HrPpl4ZptWFBMRd325I0VSunug5z/oMoBlyK25uXQ4aVtHmSfnvCIGiw+4fmF9/6HFb4BxM0nDvxjFS+saNKGuiXQjMb7KrSyAKnHIG3f01Bj3A0tZPABG6hGOQr/QdA+E=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(82310400026)(35042699022)(14060799003)(36860700016)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+qEBx0BLoAEC83Z50pchxdgZvmquZY0H87h3Ku7gDLNAKs0uJzXWRX/o+hsP+u96pN3R8H1a7HD+cBnyPj/Q6HmXPC3mL5oiM3zdHZUQefJqqBEfmnqxOLqvhoLaKUs847ZPF59i23wa65El257JMtzdV2G7zSsvxp5P5kpP4Pnx/jDXis5EJq1CkomqKJs2N3s2cXMy3xkziALS4X1DvZEAbTx0mCTU1pK0waFng3Lg/RQgy4vKp2tcVPrF5DmeakZCospTShqPm5en59j/W73LLG5K2vMDkE77AEBN5MsptRxVRYzLX/A9x0oKhZrmpMHyfQHKzs+bWuE0WLlHjU7OdgiqtixGul69x2kAeECX3Hp5jTw98IE7QmAcVHlxrWkKRP8btJWEj4q3Y6ThNqAYgK0cqz8y62wBzJGthxN0xXVX3cWMyOQex0MORe27
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:13.7831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4894d15-5e6a-413f-5e99-08df1d86b6c6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10889

Add support for the SolidRun RZ/G2LC SoM [1] on HummingBoard IIoT [2].

The SoM features:
- 100Mbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 1x 100Mbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)

The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
slightly reduced feature set.

Descriptions for eMMC, microSD, and RS485 are shared with G2L.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   9 +
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 436 +++++++++++++++++++++
 3 files changed, 465 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 4a0cde8cc3b7d..69b1f75156016 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -165,6 +165,15 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot.dtb
+r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
+r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
+r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..9cc21ae32ed4d
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-iiot", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard IIoT";
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
new file mode 100644
index 0000000000000..bf3d9e8ed109c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC Solidrun SOM
+ *
+ * Copyright 2023 SolidRun Ltd.
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		rtc0 = &pmic;
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		/*
+		 * Physical RAM starts at 0x40000000, but Renesas RZ/G2 BSPs
+		 * reserve and hide the first 128MB for TrustZone by default.
+		 *
+		 * Minimum size for this SoM is 1GB, and the bootloader patches
+		 * the dtb according to the actual RAM size and reservations.
+		 */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+		device_type = "memory";
+	};
+
+	sdhi0_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
+		 * on-SoM eMMC and board-to-board connector using one gpio:
+		 * High = connector, Low = eMMC.
+		 * Define active-high for logical mux state 0 = eMMC, 1 = connector.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pmic_buck1: regulator-pmic-buck1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+	};
+
+	reg_pmic_buck3: regulator-pmic-buck3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_pmic_buck4: regulator-pmic-buck4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck4";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_pmic_ldo1: regulator-pmic-ldo1 {
+		compatible = "regulator-gpio";
+		regulator-name = "pmic-ldo1";
+		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	reg_pmic_ldo2: regulator-pmic-ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-ldo2";
+		/*
+		 * This ldo can switch mmc host controller io voltage between
+		 * 1.8V and 3.3V by assembly option of pull-up / pull-dow.
+		 * Default assembly is 3.3V.
+		 */
+		regulator-min-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sdhi1_pwrseq: sdhi1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&phy0>;
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the ADIN1200 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		/* Level interrupts are typical for phy but not supported on RZ/G2L gpios. */
+		interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&gpu {
+	mali-supply = <&reg_pmic_buck1>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+	};
+
+	i2c0_pins: i2c0 {
+		input-enable;
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+	};
+
+	i2c1_pins: i2c1 {
+		input-enable;
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 3, 1)>, /* RIIC2_SDA */
+			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* RIIC2_SCL */
+	};
+
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* SCIF0_TXD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>; /* SCIF0_RXD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 4)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(42, 1, 4)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(5, 1, 2)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(5, 2, 2)>; /* SCIF2_RTS# */
+	};
+
+	sdhi0_4bit_pins: sdhi0-4bit {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <3300>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * These pins are fixed-function lacking independently configurable
+		 * pull-up, pull-down or output-disable.
+		 *
+		 * While unused, disable the input buffers to avoid sampling the still
+		 * physically connected but unused eMMC lines.
+		 * For output direction rely on correct controller bus-width configuration
+		 * to avoid over-voltage to eMMC e.g. when operating at 3.3V for a 4-bit microSD.
+		 */
+		sd0_dat47 {
+			input-disable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_4bit_uhs_pins: sdhi0-4bit-uhs {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * These pins are fixed-function, lacking configurable pull-up, pull-down or
+		 * output-disable, while sharing the voltage domain with all SD0_* pins.
+		 *
+		 * While unused, disable the input buffers to avoid sampling the still
+		 * physically connected but unused eMMC lines.
+		 * For output direction rely on correct controller bus-width configuration
+		 * to avoid over-voltage to eMMC e.g. when operating at 3.3V for a 4-bit microSD.
+		 */
+		sd0_dat47 {
+			input-disable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_8bit_uhs_pins: sdhi0-8bit-uhs {
+		sd0_ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0_dat {
+			input-enable;
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_cd_pins: sdhi0-cd {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
+	};
+
+	/* SD0_RST is only routed to eMMC which uses fixed 1.8V IO voltage */
+	sdhi0_rst_pins: sdhi0-rst {
+		pins = "SD0_RST#";
+		power-source = <1800>;
+	};
+
+	sdhi1_pins: sdhi1 {
+		pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3",
+		       "SD1_CLK", "SD1_CMD";
+		power-source = <3300>;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 2, 1)>, /* RSPI1_MISO */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* RSPI1_MOSI */
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>; /* RSPI1_CK */
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+};
+
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q80bl", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		/*
+		 * The BT is based on BCM4343A2. Murata 1YN variant seems to
+		 * require driving RTS on open.
+		 * Use compatible bcm43438 to accomplish this.
+		 */
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <115200>;
+		shutdown-gpios = <&pinctrl RZG2L_GPIO(23, 1) GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_pmic_buck4>;
+		vddio-supply = <&reg_pmic_buck4>;
+	};
+};
+
+/* WiFi */
+&sdhi1 {
+	/* Murata 1YN max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	cap-sdio-irq;
+	mmc-pwrseq = <&sdhi1_pwrseq>;
+	non-removable;
+	no-1-8-v;
+	no-sd;
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/*
+	 * Host controller IO voltage is provided from reg_pmic_ldo2,
+	 * WiFi module IO voltage from reg_pmic_buck4.
+	 * Neither is configurable at run-time so either can be set here.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo2>;
+	status = "okay";
+};
+
+&usb2_phy0 {
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};

-- 
2.51.0

