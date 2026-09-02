Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023109.outbound.protection.outlook.com [52.101.83.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5580147ECF4;
	Wed,  2 Sep 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.109
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349853; cv=fail; b=iV78n33y4abbuq/FM/aQ9Z/2zAFMXbjxmCV9XmY0dyA+bNPK77hOup7rXqf6p3I0UcZOTK1UTPcFgDtr4qYkuHEyet1w1CTje/dlPxW7L+v3RE27yhO1DBAUOGDI1arbKPUvfpa7ZdZKoxMxd9MglypR/Rb/yoCUWF28eGE9uUk=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349853; c=relaxed/simple;
	bh=cG8TGMMZcWQqiI4radNZn6akpj4rpcwohYGas0D+y1E=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Fp2p08qaVnhHnjxZdnAXRsqQMYjCzNzD71/Qu+izq/8unWbrF3yJw1KivzeJOSolAdyZCaObrVVMN+tKn44YYX46RHJgX7879BSmL/8k72JSxTcIF660+zZ8oWs9xbOKC0SxCQDesdYbsEGo2hiae+3cGwuUQGuiLm7V4ONWhl0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=SnqRAdR7; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=SnqRAdR7; arc=fail smtp.client-ip=52.101.83.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="SnqRAdR7";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="SnqRAdR7"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cHStv+b4mzGrK4hPG0VLZ/qYjhPxCsbp3acBdKBf5RLD2275fEPYOYawOM9C0ji+KFM5gecntGNKE4q5rB9iA+6UNNjvDWjC/deL1j8EF0NpVyImr8zznSPR5SsdqMlGDjXNpFupNZvkk5qTyWyA4zyDu22a9JRjHMfUbDoHB11HxfncOHynO+n4YzIlfOlFyei5FMWmVt3kN62dVUoZzmnyGHzX4Kqy4WnlgllhCI/c4Gvcer/IQLcRWha4GUv9yqBicIHvUmiuFEkgZJwphiz1P47HO6BjnQH0owncGfJwXmtsnOut64O3OXq2h8N0Py74w/Ie1BjDTOZseWAobQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eb0qkXGoejL7ZwwQdUM9dh9tdPUKOAa7FCQeMZc+JVI=;
 b=k+rvkUAwYtYr+/H+uaUC4WcgYdz9LLQfh3prRJRazQ5msLo40gGCUtx3PIxC42Xd9bRHRaQVusn3BY4Go2JRFgQTsSZQj5Nxo3MNNwYLwZzJ4OmLlgNOCuZn5NMkfkXwT47HtNEhFiJ6g61SIbphUwJ+7I3P5SCnE3I9qK7pArb+Lapriwp/P4m/+K4nfN8Fyg0IL+gfIp0d4kJz5+/irUF+7AwqBfmzoC8PpV71PM92tv4cxZKLPr/yFKs14SZ4vGqSuhlf9Nt+kv4ffa/L94LxPgZrbf/rUOo8I8ybdWW2KKYYxVId4lJW7qRWAyKUoUFlXIOltPGqW6S6phvH/A==
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
 bh=Eb0qkXGoejL7ZwwQdUM9dh9tdPUKOAa7FCQeMZc+JVI=;
 b=SnqRAdR76+D4/wYE4c27e3u98z+i33mM4NtwtC8OLzTmQu0rjLv2zQ8MnQhHaHyjxyoWqInbvS5WRqcjC4bgNTujEPpXeUTvStZeB9bmLav36DtbwN/E5OSMtHZvRclnqDpfXDtzHwfGrOEvIaWa/AQTRbaoelBX3A4eo8eNAww2ghYYRSEqqUb8LZqY9CinvuA03lmiEz5wEEJ/Sn5QkyHoEBCOdBjYGkkrgg5sTOuGs2hQST1LzdcoNmkAopt/IcQvOOuxhbMTxn5cxbna9kQL7qlIZEJkTKerthVftSrWboR377jv+HFeBylsxEMhMEjVwiqbaC9UmluqE2+4tw==
Received: from DUZPR01CA0307.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::23) by BR0PR04MB176895.eurprd04.prod.outlook.com
 (2603:10a6:2c8:48::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:50:36 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::63) by DUZPR01CA0307.outlook.office365.com
 (2603:10a6:10:4ba::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 11:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 11:50:36 +0000
Received: from emails-2748299-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 37348812BB;
	Wed,  2 Sep 2026 11:50:36 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788349836;
 b=d/iYJa/Xda32fgCrkI2Lcf2bPiex1knOM7ALbdLrktXUxuDLeIYwyQgzym7u8rgf9jbsC
 ddi5AZtQ1/nVMCbpNv6MZ1SGIN4dJ410gdJOppJK+evw32oIsO4gfX2ep/7Cxbw/HHV8o3F
 nvA+b+W2q3LN67shBT8d9OT5YGNaahU=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788349836; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Eb0qkXGoejL7ZwwQdUM9dh9tdPUKOAa7FCQeMZc+JVI=;
 b=bEhC33jjYqFWPzAEr66iWQV25Y1Ae4IMk6PQz3+a82fCnScHqaRdgGBjpNq6VePgq44/Q
 uScDHSZOTM5QB/ClauK3ofi5//GqWcECU/lhyjh/DXvXNdRTIN8LghUYpTPc3Zte2R9sT+6
 BQyxAG6cEy94pPwFKJNhZ/qb+H1y8ok=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb0qkXGoejL7ZwwQdUM9dh9tdPUKOAa7FCQeMZc+JVI=;
 b=SnqRAdR76+D4/wYE4c27e3u98z+i33mM4NtwtC8OLzTmQu0rjLv2zQ8MnQhHaHyjxyoWqInbvS5WRqcjC4bgNTujEPpXeUTvStZeB9bmLav36DtbwN/E5OSMtHZvRclnqDpfXDtzHwfGrOEvIaWa/AQTRbaoelBX3A4eo8eNAww2ghYYRSEqqUb8LZqY9CinvuA03lmiEz5wEEJ/Sn5QkyHoEBCOdBjYGkkrgg5sTOuGs2hQST1LzdcoNmkAopt/IcQvOOuxhbMTxn5cxbna9kQL7qlIZEJkTKerthVftSrWboR377jv+HFeBylsxEMhMEjVwiqbaC9UmluqE2+4tw==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by PAXPR02MB8248.eurprd04.prod.outlook.com (2603:10a6:102:247::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 11:50:25 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:50:24 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v4 0/7] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Wed, 02 Sep 2026 13:50:08 +0200
Message-Id: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHANmGoC/23PTU7DMBAF4KtUXmNkz9hjmxX3QCwc/7SWoEE2R
 ECVu+NUQo2aLN+T5tObC2upltTY0+HCappKK+O5B/VwYOHkz8fES+yZgQASWgCvv0fgrfJh9DU
 2jiZqTUTWQ2T96KOmXL6v4Mtrz6fSPsf6c/UnubT/FN5Tk+SCW600GZMdBv/cxrcSef06P4bxn
 S3cBCtCyg0BCwE+DUMEY53cI3BNbB6asBNZIObgKDhBe4S6EQbFhlCdEHYISjttbAx7hL4RVrg
 NoTshXSAC1Dbh7gpaEXK7gjqhZPYeIUSfh3tinuc/3TNgEP8BAAA=
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
	MMZPR04MB400504:EE_|PAXPR02MB8248:EE_|DB5PEPF00014B93:EE_|BR0PR04MB176895:EE_
X-MS-Office365-Filtering-Correlation-Id: c97ca2f4-d5fa-4409-789e-08df08e86704
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|52116014|376014|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Qaa5CEyk2Xr17yyij0P0cQ8K32E9LxBygVxQccQ+pQIfACwu8FuPInvoBF+b57WQF34QKKOTx1bwn0X/daumcc7NlgU2qt1Vvqx/t697sEdp+B/uy5oAjUj7raetImJUbYAvJR0Jt+N/iWBa81iH4xs8+Xw/pCRqs4NiWfSHnaqT9ivSfGoVVUZifenKg/G3I+65p1y/R7PbsuxQLFcYZ/AWmnsBbcN1yXRgoTElG/HT0rmCKMsX6FFIo5tobX+LG50IXuAMccKEqIAMPFIOizMcn+GctTBRYisZi2VDIsTA+1HWCFctbxBi+tO3xURtAquKKtSUx9vsNgbdL+xSOfqYxekb3+UqgipLiMUySZzEPMNBeJI9duDInDPicR5DJAa5dL89eTjwLql9Vj/Cf4cTJkPO6S/escwpTAS77F2o0u6jau98im03U1WtEIyyCiUvB4HhRiu/I3tHT9b9TxQBlE561WF8Fp8R7atMWT/Rc7arwmOa5EQ3PoVUhNLxKyGyEmUjZZPF8XjKuTIcsMasxbvLbPyt7sO6Occ6yfYpVc0zMumE4wrtey75u3KPwKa3KPtX0DGwLiHl8S9dFf4qHw9TBuPsqWwYpDJ1El37iE+NUGK7cERCIWWPRql5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(52116014)(376014)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 xrwm0NzcS86s8qscJWNhmZQAulTos9Y9RFBPS+g1/tD6sr+n9zZAUdKwkU0V1aESt6m9FxtnxGC2FJP3+Xpn7J56szgWhfw+glM6xvEboyvCOsocP1K8LiKVJuTQvUcKq2ASsCUcGO0AhGd5+83sTjfY0+Xou95wjleypgKbar/s7rX0NIUnNQ34KCMry/Y5VIKfjiRjalC9MyxgOJqjgT+7ePzcq8/SH1+fb+n7Hfy5NKLyzf9hV8U/T4iuQAQKeSplf6o7OIKE8MbTii9uEFibrs/p4RDB2TpulTdM22xnHHCk4u76TgiC7dNcFFJWasiSaNu5NQbJ80S10qdC6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8248
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 65936bb8f3ea459a91505f5f0f198cf8:solidrun,office365_emails,sent,inline:1557aade5be131ad1d80deafb0b5bb54
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYeSdrt7wYdQXuQhCos8Nz3jzVLqQ2kKbXmQ6m8IWJ7Z/MUCyaZnHs2mNKwheDq/6fc7eV8TK/Rj0pDW7HFWquqCd8e8Q+Ra16xPWR0YoIynHcpff81fONk/gNdQRCIa01v8nEsDWQS5fVeVWK+oNMKEYIwPjx1nXWsPKzwMZGOsDKB34Zn0DRn8vT/rZxB9yzUSCmX1Lj6Z2BxVOdb7Q8mVd1SQ3tvxMLfcmo4bD0ArtOAvShn5dSLldOaiYX2RXqmbNhCjGEAmworKT/i0Lvasw0B7UccKM8NxZSu0Obvx27lfcetf+J2vJUYkcy8aKv2LLJT0Q7UxEp7lxE0VLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eb0qkXGoejL7ZwwQdUM9dh9tdPUKOAa7FCQeMZc+JVI=;
 b=mC5kPbQvIR10twjrq4fWf0C2MaGDVBWzdX48/wL2Bk8KXwGwRnpZk9ubwniEIC2WIGvRV4DMoMP6L+EnIO0AUdhXzqenTTHuqHVCc4zgPNvIkpqokRaVYBdIm5Gz13mzYQy3bbAE/DIMwmBtexUwfuMiD+NB/H+j8dGDvbla9u75ljKAFf5BQnYitFgRkmr1KTvHL6avMabdnz25l7zT1QqFZWzI/YtB2So911Ioa4p7xp1nozoHwPyPGIuCkJqIRn4pmB1fUWlVk1yDvqqH0NOOWIGtafNZ2KtzRSyvRh4fEKQpC+0+BhvOBAt/mzBtNXo7+s+i4Lf1ER4/9EK+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	987ab448-d205-4530-93f0-08df08e8601d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700016|376014|82310400026|1800799024|7416014|23010399003|6133799003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1wh2H1cbj9+c8S2itHruF9Qce/J0aNKmy/Mzl9mqxXJrAqaQTFwPRtwNKjZC3UcCGtWAMseaGUQh5O6VN44CVB+Bou5sbzW4fBGasHQIh2a0PDC+FGpOcNdvqE+MhsBeElbejlr2xJpyo2DypU5WnE5U6/GX2AmjZYixcbowrOwCnUop84Lclrtgir6x4jUqSVHzijzWEM41RhD4LVLzVcUC8QhW+jWzpqusFQNgtJMQcnj89PRRqe3ez9HNiipVtKX/pset/nhyS011bouev1XRrCnx+aCwO+zxyGOBHHxN6CwcvixJA6Xf7WSFuoSx/g11jIsm8fMgdwicDFwBEbJcSVfMlCu6IMl9UK92KBjT57niZAkj8tReMEPXlOaqX8JAe9vHgUlZPclCFOSwFNRCeeTTtYeP2GMjv3xrgDkUD35ndxoq9F+iCplwgYSTmskkJvOxsv12n1B1o+qaFyY7n78eyHRKMLqnMqGZDQIs33nwXCNBaaYzW0gug0UQKaAaaqJw71X3OgGoG49U/Gq0O0bI+s7uVYF5gt51WsQJHdzjBezUARPq+zPVrgBu99EJ9fdc2DiM2a+GZ+kbWPR+J3ubyEc1J2swIMZSpqyCE7xXfJudfvtgLF+0ih6e3ejjd1oklLL4wTQd5zOfIQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700016)(376014)(82310400026)(1800799024)(7416014)(23010399003)(6133799003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QonITewECtw4N3jbApYYL9zJwDyyV+FIlbKNL6Fxdvhjl34cPHSt2BjT8z6TvfnE3w45joMOS4dJv1yOxpPs33KsNMksVBspQs64bpy6+qiOniq83yHzLtazIxFLyCHQ6+1mpwBckUrzA7pjAuk57sT3sm4nZHq8aATw4mfPig4l+PX+6OUUOcT8BmMUZ6D7J2ImY4UYIGQKCC4dNrxmgsmfOyYad9nQKOTbMSAitsW8JrjVXrPR3AlhOo0+wZ2E7Zz98rYHWd161pLPSRPerdHrDb+vJGIxT6bvv6V20JNuhufIuqPSVNQinbdB6YZ7JSyFdhWLnl065042COu09dq3sxTkinJwOmIcfuIZBoQJU8P7WhxD8DJcNTjcCxZtvA3dowD6L/w+zUYyK66uBQp0GvQYp7XaNjVKFX5ymCHpbxLqtprCIhG7RjD7gOdr
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:50:36.3236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c97ca2f4-d5fa-4409-789e-08df08e86704
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB176895

Add support for a variety of SolidRun RZ/G2 based SoMs and the
HummingBoard IIoT Evaluation board.

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

Device-tree are only added for the first board to reduce initial effort.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
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
Josua Mayer (7):
      dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-enable pinconf
      dt-bindings: usb: cypress,hx3: make peer-hub property optional
      arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb
      arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add dsi panel dt overlay

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  37 ++
 .../devicetree/bindings/usb/cypress,hx3.yaml       |   1 -
 arch/arm64/boot/dts/renesas/Makefile               |  43 ++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 564 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  74 +++
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 460 +++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 416 +++++++++++++++
 16 files changed, 1800 insertions(+), 1 deletion(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

