Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795701236;
	b=xkNRpFjDAju+Vr8EgZZ++pGIrnbyqrVjCOii4PeZ05mMacjUgYRvxEpbtv+og1KbqMbF
	 E6naM23zKnCMxrwsH6vqKwulkTWz5kUrKamLDAX0gV7PPKWKEoXNVVHcUcRvwLovfYOUF
	 GNV/u6ejKrKrcfowfUDkqYEepEKyMhOZy53xkL9y8tS5UlUQhK9kqaL7FzQXclbnEYAub
	 jQdpU9ipME5m6kIvoAxn2Ed6sCoi3/FwaLtrqWA9k7JYTuUHPd4ekpVMb9x/9B5tqURHn
	 nAHV3cupOPwHndMXME1URtwBqtFaEg4IDScA0tWazFJqAvWpLWG9ZFq69N1hb8LyYcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701236;
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
	bh=nWSO8x/8DdbR4LR/2w2KqnfKZCctzFV60o7ihVwFtyA=;
	b=04AeBahQhTmQd/x7Ml6SZpccmj2O573IF/kpJUM0j7qBkh1NFOEGDeQd46toW+OWmWrB
	 X9VzvRQ0as8zkQsUgRrcLbu9hElOnAnJ2rre1v+dN2lnMfS9ElOPWg6ecMSQK9xVJskac
	 9m1qbBRYQFErHEzXDXgyMaXIDZui1RgwJ8N65jWDe69vavbuo698W1g4X2xA33bKntXGQ
	 LApxc1tGUmUIx2QU4dFqS8so9q8HSljzrXcnJz77S64zby9L9D3vuo0gpefx12HAHHONW
	 5DUhJ6nSVSCeHs5pVEN3A+gFfjDcclYW0ZkLLZlNn5VyyJb5zcwbUhXA2srf0Gw518A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Ce4hcNj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.9
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013009.outbound.protection.outlook.com [40.107.162.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29585606A31C;
	Thu, 26 Nov 2026 13:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29585606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Ce4hcNj8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmvTgN7g9XeCl2w1LyrRG0w2nQfUZrec8pM/06lEvCdmdoAQLtPp81fs1EAAUAx+Ce1B5ocd8wQqA50mTGVVDH0TDvmY2RYCLLFjA8FnrA/kknXIa65GAHypNTkfYLuj+EPsmLvIAqUDwMBskJjnipBJaxCpXII//f9zmM4zBQNZiTSpeSMy8avKn4Pik2yEDwXcUinJKaCirxMQdG5vslN1VdhNyqgwGb6a/8Lr68kDpXw9lAxITvEAwvDUCsHwQ0IrpwZmimaBjzefe5duqVt1pbEB/AADQTNktzlqheCC1nPsLtMOXnxwOsVf89V/2Z4wZ2sfQW12TOx0/9JLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWSO8x/8DdbR4LR/2w2KqnfKZCctzFV60o7ihVwFtyA=;
 b=Zs8e+xEACT8FaRuUkPa7kZG5Oe8b0aW8NAUvqiGU9+xI1zMiiLgLSvop36Z6IH8AHmMjYWxs2oxJ3tgx/gDgzf6HTvHGUwunkZz2JbcWXLngzSFbVJaffcpmgelC2REZfOC5okWkpoDLHedekTeenoCDjere6gXEAWMb8uFE9oJWVyMm/Ysoif5nxg3c2WJvQ4ZdPzLNU06liiJRAZhh6D6gqemZfEn1vj0eKtLULzfUhuzhqj/iH9xvg6UBiGe6i4ekzPCND1BSneiDQk98pyjLtXDeeVdYxXnbtZOCa7X28AXRy7KITxZx6CIQ45vPdNaiFAt0ukWXWXNGpFrLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWSO8x/8DdbR4LR/2w2KqnfKZCctzFV60o7ihVwFtyA=;
 b=Ce4hcNj8b+6o26gVq3yGoSW8Q+ym8gOZKnkfGdHx51pZTmbY8AAaK3BVcfV0g5XUTDVr8ac3UnN09oVYzYG3A+dgZQXVloLUjvI1KdgeSvOK2524xJLCZoTaxsYMgOdZF9uEXI/SNXql01kds9GEFJdXZq9xRUt66hYg7aS+ZhsF461zKC3BX5U+QL5Us/DdKOh4Nm55veA6ikqgod9xc5asuniopXBqgrGElyX2EXQV+peo590JxkXfiaYPxDFOP4LLXr/SSaQlQI+0h59Glkm2gDng9TDjQvqR3ohu9ObVzogD38j/R96JjigZiCF+BQZBPEzn2I6e5cqDRPCDrA==
Received: from PAYP264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::20)
 by AMCPR10MB992192.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:77f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 13:53:52 +0000
Received: from MI3PEPF00008499.eurprd03.prod.outlook.com
 (2603:10a6:102:11e:cafe::d) by PAYP264CA0015.outlook.office365.com
 (2603:10a6:102:11e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 13:53:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008499.mail.protection.outlook.com (10.167.240.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 13:53:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 26 Nov
 2026 14:54:58 +0100
Received: from [192.168.8.15] (10.48.87.124) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 26 Nov
 2026 14:53:51 +0100
Message-ID: <bb93567fd9951d909089704af4e6d58ae71292e8.camel@foss.st.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linusw@kernel.org>
CC: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 26 Nov 2026 14:53:50 +0100
In-Reply-To: <CAD++jLn0tuzo8gUmn0rOKRe1q58L=q7-P+iQNkSmtntk6zyJKQ@mail.gmail.com>
References: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
	 <20261119060924.675-1-laixiangwu@cmss.chinamobile.com>
	 <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
	 <CAD++jLn0tuzo8gUmn0rOKRe1q58L=q7-P+iQNkSmtntk6zyJKQ@mail.gmail.com>
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
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008499:EE_|AMCPR10MB992192:EE_
X-MS-Office365-Filtering-Correlation-Id: 51dd280c-93a9-4bd7-2902-08df4bc4b4ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|261026121527099003|261026140227099003|261022105027099003|261102123227099003|261022075727099003|4143699003|261028144727099003|11063799006|5023799004|56012099006|10067099003|261021121427099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zqYBslzNO1R6Ma3h533PhXsKc8N3DC3/xO8yyobvcBkfFAL9t09kqnw2QvUUR3VTRoy6Eqn6sbEsUVql6gFlotmbNP5WR+Ck4xJHkjweC/IUOWCzeLJwTaBFz7+qu5s5+H5aAD004/uV0GHXcHmDkoTKLyEogKq70gajsS0zBrrBSoonS+iFDwwELJD1UFNOXkiHuRicaYxY7MMUCGKmK5q+IqDXeAYuPkhDfgy8veTcyOiw0rfE4Jgm3PRWWZJJRjSrdY3VtarC4pcWjkLr6ON6q+mq6knxBa528PlfdpOTHs8jfT9cwfSR5A216UBeITCD06ucJJPA2UEp0BuO06XUGIEdh5BKd5sMGIsHTFm++WjHBS+HU2pCjz2XdhpiB2UWVBxsOGVnP0g/pguPfVpl76isC4mptCh4x6tnBnzXsBXpylk1KuAvSDUVQcICO9M1WzIwXgZKM1WGc0d31QXAR+04e9neMoW8RftX0bzbso97gR0dFOzcBZm7a25/g0x5H2jFu6B+T6dXt7e9NGtvKPbskuxLtTztWcuqktms4urB1CbVhr6eyFp2vmpLp+tNKW8Nw0oQkwo4KSb9bnk3TqDRRNoXPKs/AUB/Jk+ijgczWoBbz/wvoVBCNItt1KQzo5uvUvDTLwTfEW3dAAAaLbgiNuZLLoYexmcdcEBL/ZIC9Q1E5e7zzOKjhYVpzKD0qx4aJgEyk/ukD5Hxlg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(261026121527099003)(261026140227099003)(261022105027099003)(261102123227099003)(261022075727099003)(4143699003)(261028144727099003)(11063799006)(5023799004)(56012099006)(10067099003)(261021121427099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XKL5mUclhmoiNhQHwQNa7NvadE8x68AJIDptEZCAhUtAbUeHhX5FyO0Z5WXdsoXlL74UKdOf6vX/vtZnsaMIGCL5rACOy/+Uml2yMGhkBvVKE1rrL2C2bp2UT9dPWDWKcTv1rTumrdtRVtekXKoCFS3hNX/HBwEVRjqUtaA7dP99FkOxtnfwmYCoEtWElUoVeMjK0PoPH38/jRV4ejpBwgWaMMf8MAuU3BH6ULPzlAyyBr5YDtku6NpkIc3KPPcS75NjNsAwftEiHZVTPEAG09nd5hCgY0IRIeUpa3kyXw5m3HJorZdFsMrfNytcM0Kp+TIfx18Ps61NBGpRwshzZN3ZawBTDx2867g5y1qDu1b9+8nPp2r+KMNQpJcdK5mzCYzAm87QuD/6MRT5iUxdCmz91SGOmpP8pCVQGVSYtAkA5oXfkzpTUVhp4jLdxvnS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:53:52.6424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dd280c-93a9-4bd7-2902-08df4bc4b4ac
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008499.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR10MB992192

On Thu, 2026-11-26 at 14:10 +0100, Linus Walleij wrote:
> Hi Antonio,
>=20
> On Thu, Nov 19, 2026 at 12:27=E2=80=AFPM Antonio Borneo
> <antonio.borneo@foss.st.com> wrote:
>=20
> > The driver's "resets" property is not currently used by any upstream DT=
.
> > Using it is also problematic, as asserting the reset affects all GPIOs =
in
> > the bank, including those already configured by the bootloader or secur=
e
> > world. The current driver uses this only to deassert the reset during
> > probe.
> >=20
> > As part of the cleanup following the planned removal of armv7m support,
> > I was considering removing this unused property from both the binding a=
nd
> > the driver. Although the ST reference manual documents a per-bank reset=
,
> > I lean toward removing its support given the maintenance burden of unus=
ed
> > code.
> >=20
> > I've added Krzysztof in copy to get his early feedback on whether remov=
ing
> > the "resets" property from the binding would be acceptable and appropri=
ate.
>=20
> Why would you remove the property from the bindings?
>=20
> The DT describes the hardware, the block has a reset, it should be in the
> binding, end of story. Things such as boot loaders could be using the
> same device tree and may need the property.
>=20
> You might want to delete the *use* of that property from the Linux
> kernel, so as to leave the hardware in the bring-up state. That is
> a Linux concern and has nothing to do with the bindings.
>=20
> We don't remove DT properties to protect people from themselves,
> that's not what they are for.

Yes, that's reasonable.
I will only drop the use of the property from the Linux kernel!

Thanks for your feedback.

Regards
Antonio
