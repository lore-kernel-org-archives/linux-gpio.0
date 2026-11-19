Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795087641;
	b=eEOL7JWAx0XI9OD8k6HbWYVzpZSGaCDk7y/IUnLvzRHFKXmGtbbNtU494BLYI1JOI3nq
	 Cfk651XWSCIQzQCJXaItcoGW9vgtS8zlDH1bPqGKPBOX4xic6CrT/odJfwP9Pj9LVGjnm
	 i8YQWLFY75RlFr4xlzqgL16bmYoKYJivGRPF95ffDfvSVDkaegXUGfEUpOxOWfn9cfujq
	 R9gt8wCpfQSuuF1SFLCaxhsrX7z5I/HNKyfqY0U6YAaMIQv9NyJhrQAtoCLalUhs0Iekc
	 cJsrfLJLfTiH+OsvRgHkzs4/ncooyO7lNnx4qa/dfmESWzdrxIkHZ0lk0ay9cPQWl+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087641;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+CRcQp8sMUzGgaohehrGUgw6cGzo+6+9O4mSQHF0Css=;
	b=LMVc+jL/gPGNItYTvIE7NkNxBXKWY4oxF+BAVBpNcnYx+dL0jRb8GRA6g3gnNwe2msoC
	 wcPloT9dbyrPdR4Vr73oqJOq1SqKh+JedzQ6/07s/fv3mWgrV/nOdkQSpIVyxz6zXNck6
	 odcHMirEH5waRfJo/C94gQaG2ocXvqKpjtgeHaxHVlAjFHyZO0oPeKlK1/A25BkQdOgbZ
	 cFqdt7wZtDShN4zHsInpRSzkF4TnJ85ZZSvbDhwW/YJrZ6K3iEgRMX1cmxiGw2fZnpYvT
	 jpCWKpt4UjxWuyLP5dDzNDCFoMVHYFTi3Ky3WfyP/bJWKS1eo5pgzJhz2BtnaPiFb6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=PCRiqyYf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.50
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4772D606A324;
	Thu, 19 Nov 2026 11:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4772D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=PCRiqyYf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYniuWVt/9Ckp4us3NtZRC8gqMZ6ZhA7KxWBGZGX3sQLElApepIrJGuhr8+y9x1Gd0zIRntuFRNlPGB8FuEp8mZZ40OKYySFtvDCfZw/YAJrTIG+zF+D46EwGGp7Xxcmt90eqM1fspGJqLjRl75xfrC2xy92jZSPoBlOkbPGhQgNyRb7JOY410My0EMe6JXpJG5/eiqenDx4hFU0LKhqFZ6ikEl+s7Jp0Mjj/95RyuzxcLUQAZOmF0BKGRHuIrzqnEjyfqXdCWMoxfYGnOH2d1paxK7orWhjgcB2N8Zd74z9qkDX66so6tF2uSgvtPs0h0zEUWUzIIMVIjvyPSdzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CRcQp8sMUzGgaohehrGUgw6cGzo+6+9O4mSQHF0Css=;
 b=wEsKiGeDYQEGqjH52EB5LUcnIDX7J3xq3H7rDwm6lseCkcVYGC/hmflpVcZ8VHsiTC+wNOy2P10xegAPAT+TS0an4B6FBQ3cYOWIFS4OTmySjx9BQ8KKBTDLwQ5c2/CI5tHfFeiHzgjGm4BBbqqUz8gNzK9GMDUIhJoAncLy/S7yOn2PWQk0z54Bb1CcDDJqifKn+nGtXYfPg1HA19ylcJN6lNNZlepZK9SFTuLSeI/ErGl/APDK15RvNIQuxI69LHTSLyKEcgB/zcqCtTl6owhYNjNPWXnUILb5jyCYbMhhIudnvfVUhFCHtZyVeT5cgMWKDaG/7TibT9X1pr0amg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=cmss.chinamobile.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CRcQp8sMUzGgaohehrGUgw6cGzo+6+9O4mSQHF0Css=;
 b=PCRiqyYfODG2KjtjCEi2dvuSYv7dEd1X6vYWYPWZ17UQOGtREPWbGMXSNQUSHzqunj0Q8c9PLcYC/axwGsEAarWxXAkDzdcvArJHPrLlpzgAYy8Y+HoGL+HDDmYDfS3A84oxU9dB37PejAfltVYDNcdMwOOTyz888EvuGFUKTIEf9BDs+7qBepFR0rDBWkoj5ft/pymEvyjd0AZAranFbVbhHFUyVOMG2uVHTzRNViZFyknnnwIpwLxdGDRkjlH0X9vQ85k2e+WojDMUFe8tRM31/dBElh3p6/6RfsKYT15PjYNvRydR6LqnP7+x6MLPWwH6MCLXTGCgKmf06SFl6w==
Received: from AS4P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::19)
 by PAXPR10MB7927.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Thu, 19 Nov
 2026 11:27:16 +0000
Received: from AMS0EPF0000056A.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::f) by AS4P251CA0029.outlook.office365.com
 (2603:10a6:20b:5d3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 11:27:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000056A.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 11:27:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 19 Nov
 2026 12:28:17 +0100
Received: from [192.168.8.15] (10.48.87.124) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 19 Nov
 2026 12:27:14 +0100
Message-ID: <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Linus Walleij
	<linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 19 Nov 2026 12:27:13 +0100
In-Reply-To: <20261119060924.675-1-laixiangwu@cmss.chinamobile.com>
References: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
	 <20261119060924.675-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000056A:EE_|PAXPR10MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: a470fa07-92d0-4122-24db-08df4630104c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|261102123227099003|4143699003|56012099006|261026140227099003|11063799006|261026121527099003|261021121427099003|261028144727099003|261022075727099003|10067099003|261022105027099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rvKzi/DKUxW6LaH5V58uU77oNprNa18tHO7gnFm/LlKpog0c30xkdWjvK8X6WlqflLP6mH0ZfP7fNZl1RA+UAXfCmzwFGgZDbd1VnU1KXpyQkB++RUTzGQpPuZOhNp6v4PcsFReQObw2/w4MeK4xVEmuujQm3hyJmnlv5Dot3oSj0zYAA42Ddp37TgtiVa+Hbwe2DKwsz6He1ZH11ceghY9bV977pxlEpLStsawQAvSQQeFgXDzzvfpdKyIfM2h7DEKQ1kVJlEsnmu8T8sGusuT3fNeHUx4D+pShVUWq01iwz0ndRrw70A7Uy3n+Mec8YQ6gwDbjxHEjFYzHs3FNJvB+EflXFdyBqUmOuEFNPDeB0SegiCXVOFGuo4AL6CeLqt9toYuGck4tiGSy5LKySd0ZkyhhodYuE8/gbNO3hLaTxhslwfaDQrgW4W4FcxALOLU6MTy8GZ/l4Aepoc+bqsMK1mHLcaB1gIqC09d6dRh+TNu4/hDjP5cXbtLvrUVcGjeeEiIMiuf+/6QUycYmv7yA7NpLGX5eXinL2H6tdftcr7tleabAUcD0nyY9BgQ7xC8VJ6PlBoy1In/0pKULeVqQp1Q3Uf86GqZn2ty/9hLDGZW1ahmw8FaLMGDRTevaGcoKn2FwaMzrXRDCGxl4tnJioSET0kz/4ihRMKJg4tA=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(261102123227099003)(4143699003)(56012099006)(261026140227099003)(11063799006)(261026121527099003)(261021121427099003)(261028144727099003)(261022075727099003)(10067099003)(261022105027099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Aeb2vxoIAGHmPaC18VNIHg1nqnG+wpKDUeg4me/GwyufBTmwGR9chmSuocGzm6v42m7LR7PqVWdVb6r5RyzpDSV7SibwH3yG7a1D6JDx0Lo1MHjZUv55KrJdOPcsOUig0kM3pBjAWe3UuvJTEkwXWepPTKmThphfMfaGIJtVSqizMQ6uH9b7r+MQNpdCU8Hn75NVJk0XwO0m1XAIKMWZZzBXyag9W/idCRVJe8goQE02Bjmc3DlwQgDrIi45S1SxhspwPCiZIXZv3oEr8nSVfBm1iD/im7pBLFitV/NGp2kyXEZPtRaHnWV3Zgl8ub5DnmdmzRAt0ylwW8wL/bEs9EPmvAJT7X8WPbaVVZES+JZG7H1wU4/AMc/90Qo+6zPUsWOCHx14DfKHp/c3ov6H2Y2V1EXDXhjU7nl/+MPJ3IZmEtHqVk41V+eRyZFnmYQq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:27:15.4810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a470fa07-92d0-4122-24db-08df4630104c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB7927

On Thu, 2026-11-19 at 14:09 +0800, Xiangwu Lai wrote:
> Hi Linus,
>=20
> thanks for taking a look.=C2=A0 For the record, this is about "[PATCH v2]
> pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error
> paths":
>=20
> https://lore.kernel.org/all/20261110083253.1525-1-laixiangwu@cmss.chinamo=
bile.com/
>=20
> On Wed, Nov 18, 2026 at 10:09:40PM +0100, Linus Walleij wrote:
> > Fix your email address in .gitconfig please so you don't use
> > your login name as name.
>=20
> Sorry about that.=C2=A0 The email address is unchanged, what was wrong is
> that git picked my login handle up as the user name; the .gitconfig
> name is set to "Xiangwu Lai" now, and the patch was already resent
> with the corrected author and sign-off before your reply arrived - it
> is identical to v2 otherwise:
>=20
> [PATCH v3] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() e=
rror paths
> https://lore.kernel.org/all/20261116031043.502-1-laixiangwu@cmss.chinamob=
ile.com/
>=20
> On Wed, Nov 18, 2026 at 10:08:09PM +0100, Linus Walleij wrote:
> > Looks like a bulky fix, what about just stop using
> > of_reset_control_get_exclusive()
> > and use devm_reset_control_get_exclusive(&pdev->dev, ..) hmm?
>=20
> The managed getter is unfortunately not a drop-in replacement here:
> the reset phandles live in the per-bank child nodes, while
> devm_reset_control_get_exclusive() resolves the "resets" property
> from dev_fwnode(&pdev->dev), that is the pinctrl node itself.=C2=A0 The
> driver fetches one reset line per GPIO bank from each child:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bank->rstc =3D of_reset_c=
ontrol_get_exclusive(np, NULL);
>=20
> with np =3D to_of_node(child).=C2=A0 The reset core only provides devm
> variants that take a struct device *; there is no devm getter
> parameterized by a device_node/fwnode, which is what the per-bank
> lookup would need.
>=20
> If you prefer the managed form, the equivalent that keeps the
> child-node lookup would be to register the put as a devm action after
> each successful get:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0static void stm32_pctl_pu=
t_reset_control(void *data)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0reset_control_put(data);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bank->rstc =3D of_reset_c=
ontrol_get_exclusive(np, NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (PTR_ERR(bank->rstc) =
=3D=3D -EPROBE_DEFER) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EPROBE_DEFER;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D devm_add_action_o=
r_reset(dev, stm32_pctl_put_reset_control,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bank->rstc);
>=20
> which turns all the error paths back into plain returns - devres
> releases the rstcs acquired so far - and removes the goto
> err_put_rstcs wiring from v3.=C2=A0 On success the semantics stay as they
> are: the rstcs are held for the lifetime of the device (the driver
> has no .remove) and are still in use, stm32_gpiolib_register_bank()
> deasserts them.=C2=A0 phy-qcom-qmp-pcie-msm8996.c uses the same
> combination for the same reason, a reset phandle living in a
> sub-node.
>=20
> Philipp, does this look sane from the reset core point of view, or
> would a devm getter that takes a fwnode be something acceptable in
> the core?
>=20
> I can respin a v4 with the devm action conversion on top of v3, or
> keep the explicit unwind of v3 - let me know which form you prefer.


The driver's "resets" property is not currently used by any upstream DT.
Using it is also problematic, as asserting the reset affects all GPIOs in
the bank, including those already configured by the bootloader or secure
world. The current driver uses this only to deassert the reset during
probe.

As part of the cleanup following the planned removal of armv7m support,
I was considering removing this unused property from both the binding and
the driver. Although the ST reference manual documents a per-bank reset,
I lean toward removing its support given the maintenance burden of unused
code.

I've added Krzysztof in copy to get his early feedback on whether removing
the "resets" property from the binding would be acceptable and appropriate.

This patch has the "Fixes:" tag. Whatever the evolution of this thread,
I think this patch should be taken for backport in stable then,
eventually, followed by the "resets" removal.

Regards,
Antonio

