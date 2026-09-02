Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021121.outbound.protection.outlook.com [40.107.130.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E0347A0B6;
	Wed,  2 Sep 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.121
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349866; cv=fail; b=XV1aYRecjPrqJ6YUCmJKua71wwlcSbCFYz6fIUk17e4UP2qjnaLIo3/32XdhVefynPRfhMiVtgrS7A4kDlcT3oiZjdbKnpgcT0am4xCtJmIvAjCz/9hLEO6x39M7ERwro+rrj0y7mp/D5mT/badncIMbI0/98IkMhRZAGUcOMNY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349866; c=relaxed/simple;
	bh=mktS2+jGydq/4OdqUO5ibYbZlVVYbOuZlpYdOdB/MOU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PpQ1ZT9qYFUPFmBTDcgI1dc//DshvpHb0cVYvgNjSMC0xjIxbqv2jepThsNH5nrJ5TW6It/5uu+07X+ubtD3bVcFviftL6axtoBb8FKql15ANC31L2/OVQCqb1pK9catKKbJ+3vdtCHfsIdMvIIqIG5Uv0Uv1czYpRxRljtapmY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=V43DICVG; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=V43DICVG; arc=fail smtp.client-ip=40.107.130.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="V43DICVG";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="V43DICVG"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ioVWVlP3hAt59veFzJ9juHrJTO8wqszZnSywfxzVZwhtCYxNhIn2j10vlVFN9dl5y2jR3vRJkW5/HiJY8s9IVajiTc5rdBkhTK5pVs3JffYUjKQsCpFi3/siXk3pqZIWKjFWO05+s2gnwAJJ2PokJEIqDxqSTPtIPS60DDGIrVMR0f1DwW+ewkigD1NOmf021Q3EyOAYqjVPF7ICZKe1PdkbF2TwNebegb16kZVNdITYq3ahrvIUttVzEZdg+3LTKm5fns6BlWT2NARV341kGbJO0kHQ8Ibk9kL2PG3eIl6VGI0pW8r8JqK7s7jQvGxngKaj4MhhC1VsSMB/t+ZjDQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaUmZ9aJecYhQp/Sv8msoyC+hX+yBjemefDp8Hu0H5A=;
 b=RJiWxbGNQa6Z+LvMeW/iEhl45aB3bXFSF3JHOTPuxQO7JSJCkFJiIh4Y5ue4k+pn94lRnWIWmcDtCeAxV2Z+/O0O0No1igQydXbtzjhhh7lyqlKkYKH5DJVZOzR2Ix8vd4VXEfuLP/keKPlo8khGFMWHFyKnXQX+UmvGQ1okg+4gOhMDklorW0pwTwAjLcZvomJoUyxocYISQ58ksxI2Uex01UTtG/AJRFgA9K13I94zxYVaLvJqgPOKBDe1pTym1yei8qddSyB7gXwm1NV3zFjFxFqse8o21kLA0RYIiphMReW6DT/WOM40DSGEs3n8F2XNk17LG50WBqH0u9DC/Q==
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
 bh=MaUmZ9aJecYhQp/Sv8msoyC+hX+yBjemefDp8Hu0H5A=;
 b=V43DICVGip4+v8by+PWjLWj0zLFWQwGgdjb/toUVnK32bJ7mk9RvRiuvpsikD6e5qFPrdrE5COy57GDKd02nX1rH1FjLZJx5VAouUSUgY4zeMAfMGb8LholtTAqE88odiSgj228MWvzUnL1C1od1ACg0THZWVht2RudX1DibDetX9JR6c2ARdX5DIWv6XMQUCIhiDElCMG5OqWdxfUHTWFPhDCy14z/TGMHePR1Ha0sslESJ14cTmLHtHQepaqFdB5XhR4suMf1bpgUyIlSsCEOwlxcn5ludHAzUMjUVFaIGMM028akn0FRnuc4NiPGa9+QtNlBl6TgUHRTe3dv/jA==
Received: from PAZP264CA0219.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::13)
 by DBAPR04MB7429.eurprd04.prod.outlook.com (2603:10a6:10:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 2 Sep
 2026 11:50:44 +0000
Received: from MI3PEPF00008552.eurprd05.prod.outlook.com
 (2603:10a6:102:237:cafe::26) by PAZP264CA0219.outlook.office365.com
 (2603:10a6:102:237::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 11:50:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MI3PEPF00008552.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 11:50:43 +0000
Received: from emails-4905671-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 62E20812A8;
	Wed,  2 Sep 2026 11:50:43 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788349843;
 b=OuTcSmCpB2hdR9niHFr6TOoeBQwXAfs6cdhQrjyGxFJhYJL0/TtrUUNSaKPjslWTvwaWd
 4iqtKbWNamrBDnL5Vg6uVtUdXVyQscH+ky/Ya/V/goTr9WEA3AkZJ9zFveeVRcnFj9xf+bL
 GiVED9/f2JiyoSr7i2JzBWWGC97fU48=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788349843; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=MaUmZ9aJecYhQp/Sv8msoyC+hX+yBjemefDp8Hu0H5A=;
 b=PBx37bQCqn3Tb1fwUPIqRH8wcovSxNWsFX8I5N8mTjgAS9eyyRXhzN5qHZcuNHPgkLVjB
 EnRu7tyoMckHk+7TqgwTr5n4dpdjv6WKwFOXvM/iONQNy5fBcyihA4w+PbjLa2Fu1qTOSVM
 trIdMA3Y2P0SNdcR0eoBArtY/tqqYaw=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaUmZ9aJecYhQp/Sv8msoyC+hX+yBjemefDp8Hu0H5A=;
 b=V43DICVGip4+v8by+PWjLWj0zLFWQwGgdjb/toUVnK32bJ7mk9RvRiuvpsikD6e5qFPrdrE5COy57GDKd02nX1rH1FjLZJx5VAouUSUgY4zeMAfMGb8LholtTAqE88odiSgj228MWvzUnL1C1od1ACg0THZWVht2RudX1DibDetX9JR6c2ARdX5DIWv6XMQUCIhiDElCMG5OqWdxfUHTWFPhDCy14z/TGMHePR1Ha0sslESJ14cTmLHtHQepaqFdB5XhR4suMf1bpgUyIlSsCEOwlxcn5ludHAzUMjUVFaIGMM028akn0FRnuc4NiPGa9+QtNlBl6TgUHRTe3dv/jA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by PAXPR02MB8248.eurprd04.prod.outlook.com (2603:10a6:102:247::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 11:50:27 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:50:27 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 02 Sep 2026 13:50:13 +0200
Subject: [PATCH v4 5/7] arm64: dts: renesas: add support for solidrun rzv2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rzg2-sr-boards-v4-5-4a456a422fee@solid-run.com>
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
	MMZPR04MB400504:EE_|PAXPR02MB8248:EE_|MI3PEPF00008552:EE_|DBAPR04MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: be60dafa-eeb0-47b6-5807-08df08e86b7c
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|52116014|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 dv+YCrx9RlKuKecyH2+Rj8nD38GrvdrC9tMoKxAg5RwZ6C+tACLLXqYR8tEkDaKUhrj+UeAAKcdiBP/oM3swE+tAToGWMZ+PBzpsY5MGvcob3CBN4U1qpLcaZHTo8BS08/ENTC52Oy8zN5pNn0GCOHPHjGpformqgsH8FY5jP93+UZTUzfBcH/K9H7ChaiJzZi9hhw1OBvM9VtnIGOqWtuetsXz83eR4KsyVQgbAN+NfcN5fm6hiGnY/uo5WLOQLENJsgtpQ4s2qNKQ8SmSIW636aR/AeI4h+DrfOG0wY4eJweAgnNpGhqrgQkqTXjxe1g5Xykgu++2qqb+eowY5EMQAcu2icrgUceEmZUYEJMxxI+C9M75LmX5rVYpuy7ZgkLNrp9VdsVtlVNSNxgaNlHO10EtEBsVjwtBKeHX4I1LkJuTDJ9kgl90ifUd/FZmi7s5e1HHBNoXU+UjSS86AbckZ6VqOT5icGbZpcspashjGpZ2p7hp/NKKt+9bnIqd3mYJ5s0WF6CK6F6fskAjLz4nAMw7dpgIRWEDNHyo+2l9xbFqAhO+il+ug4Ck47t6WCHKo/MgJxAe92/GsfCXA+kU6VpNCJrSsg6CBNZePgNi6sjf4vqkmrZ57DWzgIxQF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(52116014)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 jvdfx/JAwLpjq7DkVgPIb4gns6Q6JhIJwyEVYqtJxTRhheOhZEe38cGAnQ3blMHKgKbWdwm9/UL+CgNt3VvXIPvgSlzWSX0PIP59kV1YNPaiQogJaYj7FWoj8w4Nh8tyPUmY+cCvAsD+sCWBUne5Fojtdd5PjpkxHolpYLC0QEux0u8r30dreQZ1YN8vbvDaP49Poc3tm2fcNjtnqUFSRC2G2vQyirmNYop/VwEu3XPUznQF7uS8+u7iUtCUW9rGPXseEmGDQNrGCgL2GwHsBXx2/8Pgvu+EE4TK+bxdxhsINVjL6hzstfMNTGv5JcyFcqPRiT0ckqqgncWoDB6nbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8248
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: de5bf6af5989418b873a26b056d2fb1b:solidrun,office365_emails,sent,inline:578e1e4ddf8b6fd6dadbc07d47737aab
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyDqziEv0Ikw/+z+Tqw3dk0YwpQooDgslHCZ3xkYjHNWBVZ3P9enyrOBAhO5E8DybV2wJT093jRyYg647wplKT8OKq++nAyu/XHcZ4XA3gnhZY7sevaxZHGjL6AhrlOqGwlvbW4Cm0Ee+yYtohUZOltNu6ffSj5Ky7Xuj98a79aR10XrAK+L024+bnXaE/xInFa25VXfVhZbG4O2gjJyKvh0aOLP7Uajls4jHFCr7FDFHIjW4333ONz/rI5eXEVTd/2rg69KkLU1LWUOnzwGUIMIlcw5Zic0qTnTKNm21YqYhcG0hZs6RtckrAsYZQ89dK54PknBu7dWDREb1tWEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaUmZ9aJecYhQp/Sv8msoyC+hX+yBjemefDp8Hu0H5A=;
 b=ooOxJnP9UXwkZOwCHeL6ccUCd3hv1UF/3I5ysHI+OqTAbl0q6eRE6Ntx46oVeigeKkUB6gLkFWeiuu2N4XHAyTmHLzIxo9Fd/K4Uwyv/o3FMcvYMOAVE3nCWTcj5j955OidDGAJ/H+w27jdGWBgdNumUf+ba3MyXLmMgUe8jmJbQzlV9D6SlIXFZgGqDEtNVl1oJeb+Pc8a/XgxQAx/JwPZhqUoXUtRcLreZ9xFB17puTk+q6O0sizQlIVYMt0O6VHXqRhxAgyO3PjWQFJgy0Cz5rfvTh5o+ANQ3FAodILlfsqFmPSglyHEvKo7cmk6FoFRWRWlBvdrfhipRAmQykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb4a9af4-cece-48ff-b531-08df08e861b0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700016|1800799024|82310400026|23010399003|376014|7416014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jv3O4TMKIEx20J6IIJGxIEmCu4BsB31ymA4zUFvDdAsd8IegLnJZqbHtq5p140hF8LA9FlNIR2UblQ1Yzn5WTTtTviXaOHV4aKQNSGi50G3cHKkZVTQt4lbdd9KUVDD4JY6Ubo5FgavtOspfQGmqP2vaqoYXoPrYhH2lwpiURlzPe2UsRk5ewWJ9rcuK6awq6Drq63lj3fLLpokPdlwT52L2IAoCFCowTZ42M2SxuOVzyYqmr1HY6K/tOUbMRYk/uW/UXvrhiNIS/+eSidGwiUpZY8mOBVSbJUutgNjKfwFwuZosr46rWySf19haFrvmKIbYhug2Wo+HguSs2sbQUdfxJr1SO2Et/qB+7QuDD5FeFxKPFelzJvIxmOvtziQDgQl8fbcKZCWpkGxTvWyNSWqo2btQQ4zqF02/SjgMGEm/nALom/1PrVVhhCQoH/L7f9KgySDIbqPrOEaP0q/ZC6jEZUiZ3QFvorTaEhw+t76ilVzevn+lWBJRnUlW6ye0x3vA6gLxyHc8ihlB30uMd1tFkcLJfkBkOxEt6e5jPsERnY/VgC0TclXfFvKMrU+B/JxAbVQvm5DbIj+oEB3FaYFMNKkG8GS/Cw98WgamIm5EPflAs6pcjwBzKF0uoyD3ECkI+hlpp3ul6Zhkh72wVwuRJgLz7BALML6zoP4CvcE=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(7416014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x8ozIZ9F6Ca/NDQuLUfqp9AMEgKWOVXqwdJFeJcAvIstVLwTwU6wbFzrs1ILK1KY++g+wTcmzjeOzE90jKt3W3ET9cahG0wZ9gc929ojXTd5pEzHETMDKIcHgQHt3GPqltUL1LNHk6+30CKkRphU/OzeyN69aJaPDtDouakXzVUv8SxHgFNJMeNlxHKv+5UDxJT8L7ilWm9odgaH3pFkxjTI5wOs9PL7tQ7Yvm1Cx0OojMIE9hV7XdlpWK0WBZ9MYgAFEb/K9hK0bRahSU6CDHQXXeRWRkVFcM2y4DmtQLQ5eXItpbh1/68lx+Q8n4kEP0nb73YSs/UDJDFb3wftf7P02+Q+MuFkcYbjSvzZk/fU+/90JdzdWfc7lhlOo9JtzlmvBMNOgAmVGTJjO8NI+OKqGZStNT8Ysmycvp2ZnxBUtxDdXYGp1AM2Elg8DVRd
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:50:43.7332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be60dafa-eeb0-47b6-5807-08df08e86b7c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429

Add support for the SolidRun RZ/V2L [1] SoM on Hummingboard IIoT [2].

The SoM features:
- 2x 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

The RZ-V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities most code is shared, including DT overlays for
eMMC, microSD, and RS485.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                     | 13 +++++++++++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts   | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index e2af196e18bf6..4a0cde8cc3b7d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -189,6 +189,19 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-sr-som-emmc.dtbo
+r9a07g054l2-hummingboard-iiot-emmc-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-microsd.dtbo
+r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-b-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
 r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..d77a6ff163bea
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g054l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot.dtsi"
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-iiot", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard IIoT";
+};

-- 
2.51.0

