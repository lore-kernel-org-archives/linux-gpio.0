Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021117.outbound.protection.outlook.com [52.101.65.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F664F96B8;
	Mon, 28 Sep 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.117
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616880; cv=fail; b=XlsWQkRmWIh3yPFzc3JnUZDCF/VdHrbFBFe3N5aP9I01LUfDgHFaMeOA++a9UBJiY3cbuMMgdvAGoF4/2ulCIaiBeJt7iiq9JiLB+CJOMan3IrNT7UxEGaFAFdSpQ40rXOuWjVjvQve+gbpcziNf+vtf6SenjSNmPI42GL5DBh4=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616880; c=relaxed/simple;
	bh=n8l/MTty1nAWCEqcS8pAYfReeAv1qZvWiMBgArv7PSs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Px26tvEaqXz1dN/guCF2ST72RHbuV897dqS8RbJ1G/3N7vO/T8T2C8TQ2sTImo7nyxC6FoH+P0IhZNDoGsq1fXouIiFvFpkIJdHxnyI0v5XsbKRvwhjetKZ22M0gL55tc6IoH0P4M0SkAZysWQgbWr7GGzcV+g8gZ9qBUaUoYuU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=W1hQr8WN; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=W1hQr8WN; arc=fail smtp.client-ip=52.101.65.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="W1hQr8WN";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="W1hQr8WN"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MVxt2UMCF4jq7Gxd9gzMm/XPqcukY9LHzUQToM7U/3ihHZu+51UEe6bIbG0L1w7cysMg0d55Smf5CxHsrx0DoYJ9QyZHKwBd/P6xjq7V2bv2ERBF4q+Qe65MZDIWQtwtIj1yFf7uVnjvdaOr/20bnGcEQop6VFJBDp6pMC4tf7PFAI2ttGi8ffoTdGoehFP7gmQma+Lk8jKEr1HKR3NnbObves7Ph6gKp9u9A4wWFkQejMbxRahZ7iBgF12eIhooZ09p7yhFswieDRtbQHo6QMU6LgO4oeHZPy95rcbo/lXux2GUdyixZQtd63hSBGN6/jz4+7rKE5GLJfJxO4xe7A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=El2HQYOJEU70hUAmkvHs/xwA1IAWLLy84wYMqX8Rkl8LGCXG8E3eiEU0d6q6QF4AwqmQpnQ/c6qwIn+jlP2+df2/+SaA1kjO2igq1p8pe0xOifEU4KQKsafWGPzDyASiWT+kGUj+N648WHAhLIp2/wRQTIG3XLsg9OstDJSy41TgoWGTisbcJEcL7japYCSCeoXSbcRObbNk2B7cvJ9e/59Sl5q27jUB6DkAe2QbEKvZ/U1mODDEQURkSVGi8e38HBY7vRYRNxI8jkbE9PJyHc4s8wxA3kC7SsVHNlekjttQ8UZWbKos9IJY1rwHGGIeC5/t/2iZvzmtXvFAD6V0QQ==
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
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=W1hQr8WNrijoBYZOrvH497ebO+BRZH/LDANQLFH+ukoZNVRkBBTbSYMUOnxViWNv9QZ0kSLd8UNJpLF7CSvzL5YVNoBTP7eRwL/nQS05LQLso8Tq48Ksq1L+j4tbHYxAr2EGcV9IGotGZmazOys7XR4gWXhAV2Jn6KaEDrEMhuF44zgghs1wBIh3SuvF3shtbGfHuxx2U6oFJUlqRTmKPhr1sZ10yjcmMujUZIBodMAWlGllqkEFTgvuFNzLQHvsm4UEhuSzQkw+tv1wtCX/3PwRq/yp7S9Y0WqFDHFG3LrnZr5eis1zYsRuKkjvlaogZ5qIqgbeSk/R0LQDDhMMoA==
Received: from MA4P292CA0004.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:2d::10)
 by DB9PR04MB9476.eurprd04.prod.outlook.com (2603:10a6:10:366::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:34:14 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:250:2d:cafe::42) by MA4P292CA0004.outlook.office365.com
 (2603:10a6:250:2d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 17:34:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:13 +0000
Received: from emails-1727397-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id EEB557E934;
	Mon, 28 Sep 2026 17:34:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616852;
 b=C5eebv3mHnQ7oYTYYYCJJIxoUi4/liFwJVKN8MWWhHVhghqQYBwAJpePuQX50HUwoqxOQ
 nFQtVZTunqcnn0U/++Q7i+wITq6AiF0hgzLgt/CPICWhHXafArU+Ip9GuVinbtDmAxP04Zx
 V91fTEfkFXxJAPSG1gKGIPLzGiIFUEc=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616852; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=ISvgTocP20LJCoO3L58hqeSXHEYgUhuXfKxV0tH0TQbtiUOqASRs2sPcXnE2usEe0kSWl
 naDhb69SsxvVi/tLPvExrHrZhFyBb7zkn95AywSHUQ5WWeewZjhZmuiJxFejdama5febYI0
 sYpWNOQ18kB5PH3KSufxXqSVps5Ad3U=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=W1hQr8WNrijoBYZOrvH497ebO+BRZH/LDANQLFH+ukoZNVRkBBTbSYMUOnxViWNv9QZ0kSLd8UNJpLF7CSvzL5YVNoBTP7eRwL/nQS05LQLso8Tq48Ksq1L+j4tbHYxAr2EGcV9IGotGZmazOys7XR4gWXhAV2Jn6KaEDrEMhuF44zgghs1wBIh3SuvF3shtbGfHuxx2U6oFJUlqRTmKPhr1sZ10yjcmMujUZIBodMAWlGllqkEFTgvuFNzLQHvsm4UEhuSzQkw+tv1wtCX/3PwRq/yp7S9Y0WqFDHFG3LrnZr5eis1zYsRuKkjvlaogZ5qIqgbeSk/R0LQDDhMMoA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 17:34:01 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:34:01 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 19:34:01 +0200
Subject: [PATCH v10 10/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2lc som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-10-91752ea39cbc@solid-run.com>
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
	MMZPR04MB400504:EE_|GV1PR04MB9200:EE_|MAD0EPF000008B6:EE_|DB9PR04MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f64812-f5b5-4c3f-172f-08df1d86b68e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|23010399003|10070799003|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 Pyay76J3K5WCdJ9u6QDWo7WQ5eUwOqU/BjVumBegTDV9mWh9v74jI0ncngXBY+M4OmNGIB9N5gHLMf0DZHgWAyqP0eKPM9uBk7cSqCncWJWyAgU5smvAPwKpJRrX6MHbKNDqKyzVU/piwoISzodLgKVmfnrsbOHrLzMJth+XzxSbE/t7rN1o4b6+/LJwqKzaDZ5ipzG/aesYlwhk/EejA0Vy93x1CWug4lIEjoQMTTBmdYImUeUm9FRJUwMxQHoj8VN8ul5PKOFOsKI+8JTdzZLEJc5SgvWw2m4VZCs3e2Iky6mtxOgUgxzGHG8ucfu5ti/Gd7f+ot6OTWMT6glZy9/8mmBe7JIZuPK4CJN90OCqUHZe0t2jYXQ7VrJ2aELVaglqIymk6M6HoHJOPSP5zybuJrKviPyL8OXYFZbQqVVeaBTrXBtkZ90Frd6+OxRPegwMRGMbKdyB+VtIM4vUg3tAHickkxPwnEFRvrKNbRjyb1rK15vgYDoCxVQDM1L0hd5K733U/lKLefs0pSSYY+FNnQS20TjlOnwFlRfJqXExBaB1J+L9bx8poAwpjsF4Ni3AmdeDFk/Dis3nf2/HJh3MDQMG0AyTNvgvhPdFEvpZdoHFsuhhQcehYchC4yOi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(23010399003)(10070799003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 j3jOGOnoLBB0zvFzLMXp44bDePN7vcHxYZ8Y3ZGe9bJcxZM9Uw5XKY5rTiGQO5n/qzV9CoTjZ3KQYw/lMK5dCt+lyjge0nIMpyX3TAh6NQ8C8OgB3NjoJ3DsB+hb+uEKnol8cnWsuowgvccrxz0pMKgiKWxc3CXxGmr5uQn+gi8yfTv4PF09hNk2qgk3zhDliRJwq4HNad/IhXv/jcS063Jaxnfv3VABVUB/LeXoCTCHZsoiQUuQ6QP0V24Ock1hMSoHXEdX7xeBedheFUxTk/1LdBnAKGjrGTsBwivK3obJjRab1z72MZpVTnavrdjb3B0K0kEr3vEq98xi3hLLHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 359f11c6bf6b41f08d37ae10faa9e971:solidrun,office365_emails,sent,inline:87287daded720ae2bc7e73491d419f2c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyWQU+cVIyCi2ybi/oeoy3fUOnkOWIR9HKWLxJogtuOYTxKdFhTolHcJ44gocySspQLwyhSWm9+24VX/0/2h1UOqdcFr+xyDphaK2LGSi+RiTDb+nfLDOvtipCPwjAVT2/6+xtWsWjBgEeGUHBKupLTmotcEk/GuZTw/3/HBfDY6ewNouKKKqnEMEK7WN/ARNnzGkctHB+uoGHigkxA2aWipwhHIwHgIBsSCJLD/0+MCkqaGPE2ozA/xioco7GhIJM1OrqoXNJUYyrJD+J5igAMQ2By6bpblaIWYJSyRcuzOth/1MOogk+huXDlY+DFzNMmvSIG0Gkb8KaS5QRE6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK8rJLCxHn0BDo6B8FfN7lxNqIZRV+4L/KyCuwTJ+Fg=;
 b=EzTdik3M64jz/Z6Qr2m+gHtN4DskOrqhcdrD9cLlvJbLIZXeqL2b3sKCVRWyHaZDQitqRJ6JTokGkGoieEQm6mkI+i0efKHQgc3o6Wjq9C1pckRy4zCnNq2cjoatl17VP/d3vSjm2AFWOwoKIz8yejlcZ8ifdJwrP2La1cJ2uPHDjz/jqx3H/X380X3vMD6vI7/1zBVvW0eh5r7NrXzkfIniW9Mj891STy723Vyih1WqyMv/qoIClEQzxWEPD91Z6Izs0Fol3hVIBLtFmEdbGQ2c4mUjwX1YPj9sRdwMuYNoG6zS9sGixnyXLVxlmWukatpwwdPRdUZZ4+r9qfYJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4522edc7-3201-40d5-991a-08df1d86af0e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|23010399003|35042699022|7416014|1800799024|376014|82310400026|56012099006|10067099003|22082099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	pX7oFq/3STytTKRiXEt+LoPeOjRMBRrL8rlfkS9N+M9Vzi5XHMx/TDedwzDRYQqkL9Q0lkbcSpFpzOODoYohHxoe5nLJYb9O37wWIM8czJlxFl3HRawdm0qEUuwl21haR6+k5RQEPDhHFGmLeo+ZIRDZazcZ2zN5C+ZUqQKcKZ3etuwpnErZePA2utUpf+zdJ4ErV1FcnV2n32oNqnl4JP/5/EKcwFEoSdM0J2DazvkKvFMWTG9cCt/h1pEeovF8wMMB+8yiLfwN5lDD8qaf8nsvpx9zj3i/3q4OJi8PWPwx2K6fgTjO1tXt6mXPfyHf0H7tC1UJS/qhVX3ZLJITv8VuiVE7ELZukBO8JkN4ydgPGC6wpdbB2iQPFbSKWCKS62f0XiNH5AO7b8DXp4FA7+nrkJg7fEubyXiM6CQ/zlWDz3bttH24CGtay8JJmPRyz/sy5Zk7ws4t0agGcUoHj3RshuTSGzqmZgtj9Kh39NLLeB2wXbtnBSjAdt99NvypEywRSiZvOj5fpbJ/VYfbavCr4QpfLVczuJ3DFOTkJ4X6aDvDroxKkWnj5MYoYM/aTEtq6hA3t/0bR0gaejv79zvh7bX4dYy0jeXTgcZ1mtdsySVqJ9Ljda8cgNe61B5bCmh2/0pWwnS8tg3YALv2zw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(23010399003)(35042699022)(7416014)(1800799024)(376014)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tPGSwSzxVxNSca27h5HCoUo54Fk0/vgeD3vzCBA+h3zjNj4/a3/xeL2xMvdvqucRghyZRFaDPS9gXwgW9OcfOtFqOONr9yt8wKjFmKAdzXEj7xpL8+AZ/OGa8iSF1C1o2Vu2ZBYyDBWFQX6ORd9sMHN+TXmSpoCuuwaZXw2dAIbapDzgo8C+a59aP9Y8dZFe8l7wmPZPbZE8vPmapCI1k/R1KZSOSrDVvvK5HR82Nxbq8FpMfA+x3LTFMNf/D8duaALr7WY24IYEQirkTgsH+dfyBtH6BT1Z+7QOlbu11JfM8MKBeiYkriYnjORPBoIV+pLpqfE9q+8tfQzOXbCHp4y2Q/aJBVpBXKIXiuAM9MlwKaGZ5KOyOaWAJrnNlgK2+ekcMNCrpbZBXLWBty6ghQazJLea4lExTxWvwDTrCgc9xPlTd9MDO3IBwm3Udswh
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:13.4073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f64812-f5b5-4c3f-172f-08df1d86b68e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9476

Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2LC
SoM [1].

The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
featuring:
- 2x USB-2.0 Type-A connector
- 1x 100Mbps RJ45 Ethernet
- micro-HDMI connector
- microSD connector
- mini-PCI-E connector with SIM slot supporting USB-2.0 interface
- MIPI-CSI Camera Connector (not described without specific camera)
- RTC with backup battery

The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].

RZ/G2LC SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
board. Provide dt overlay changing pin function from uart to gpio led
control.

While the variant being supported here is named "Ripple", the overlay
still carries the "pulse" suffix as it would fit all its variants.

Descriptions for eMMC and microSD are shared with G2L SoM and
HummingBoard IIoT.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  8 ++
 .../renesas/r9a07g044c2-hummingboard-ripple.dts    | 93 ++++++++++++++++++++++
 .../renesas/rzg2lc-hummingboard-pulse-leds.dtso    | 48 +++++++++++
 3 files changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 625093995c521..83519d459ae80 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -176,6 +176,14 @@ r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
 r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-ripple.dtb
+r9a07g044c2-hummingboard-ripple-emmc-dtbs := r9a07g044c2-hummingboard-ripple.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-ripple-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2lc-hummingboard-pulse-leds.dtbo
+r9a07g044c2-hummingboard-ripple-leds-dtbs := r9a07g044c2-hummingboard-ripple.dtb rzg2lc-hummingboard-pulse-leds.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-ripple-leds.dtb
+r9a07g044c2-hummingboard-ripple-microsd-dtbs := r9a07g044c2-hummingboard-ripple.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-ripple-microsd.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..ef8e2f62b6827
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-pulse-common.dtsi"
+#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-ripple", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard Ripple";
+
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
+			label = "D30";
+		};
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&gpt {
+	/* mikrobus header pwm pin is pwm channel 6 */
+	pinctrl-0 = <&mikro_pwm_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&hdmi {
+	interrupts-extended = <&pinctrl RZG2L_GPIO(42, 2) IRQ_TYPE_EDGE_FALLING>;
+	pd-gpios = <&pinctrl RZG2L_GPIO(40, 2) GPIO_ACTIVE_LOW>;
+};
+
+&hub_2_0 {
+	reset-gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl {
+	mpcie_rst_hog: mpcie-reset-hog {
+		gpios = <RZG2L_GPIO(19, 1) GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		line-name = "mpcie-reset";
+		output-low;
+	};
+
+	mikro_pwm_pins: pinctrl-mikro-pwm-grp {
+		pinmux = <RZG2L_PORT_PINMUX(41, 0, 4)>; /* GTIOC3A */
+	};
+
+	mikro_uart_pins: pinctrl-mikro-uart-grp {
+		pinmux = <RZG2L_PORT_PINMUX(40, 1, 1)>, /* SCIF1_RXD */
+			 <RZG2L_PORT_PINMUX(40, 0, 1)>; /* SCIF1_TXD */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+};
+
+&usb2_phy1 {
+	vbus-supply = <&vbus1>;
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+};
+
+&vmpcie {
+	/*
+	 * G2LC SoM v1.2 moved this IO from J7-28 (CON4-12)
+	 * to J7-18 (this regulator).
+	 * There are no known users of CON4-12 and thus no need
+	 * to differentiate here between SoM v1.1 and v1.2.
+	 */
+	gpios = <&pinctrl RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-hummingboard-pulse-leds.dtso b/arch/arm64/boot/dts/renesas/rzg2lc-hummingboard-pulse-leds.dtso
new file mode 100644
index 0000000000000..a2572718fa87c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-hummingboard-pulse-leds.dtso
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Overlay for SolidRun RZ/G2LC HummingBoard Pulse
+ * enabling LEDs D31-34 in exchange for on-SoM Bluetooth.
+ *
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&leds {
+	led-1 {
+		label = "D31";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 2) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-2 {
+		label = "D32";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 1) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-3 {
+		label = "D33";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(42, 0) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-4 {
+		label = "D34";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(42, 1) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+};
+
+&scif2 {
+	status = "disabled";
+};

-- 
2.51.0

