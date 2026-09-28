Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021095.outbound.protection.outlook.com [52.101.65.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C32D8DD0;
	Mon, 28 Sep 2026 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.95
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616861; cv=fail; b=PoBMHEg0G/sx/1OAR63JJq1LyCTP9lMf65Y73yUzwMzHBDc9HwTb0Td2scDKJkGXRwJYC1oSQhGpsoYVEJaRuVGDe3k/2uyShm3RT4V0Kr+oOughTMQD4/qqR2PUiX21SsT7G1YFOoG5y1up/pT5eJTjMXrz6L96/rCXEem5IOk=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616861; c=relaxed/simple;
	bh=S9QDgQ9zNUHWrl1O1vac8Nzobq93WuMJAACLdqHSeRg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MJzmYTxIy3GRb8nIGvsMHYfIv+hT/UFU3+FDHCr4jS7WXmS/GQbviSsVYLUEpdkONgMoPmSOp/B20CRKUkhJZJOPdysFtCVif4hHij44FUhShmduCXYlsGt31LkV6EaXE8mAny+EvXLNsf6A3L0eQuCeeTl5CO+jPwxKEa+dDyQ=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Ic2k+91d; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Ic2k+91d; arc=fail smtp.client-ip=52.101.65.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Ic2k+91d";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Ic2k+91d"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uta5/s2FXAxhlQA1Xqa2XgPBw4kCbCAc2N98QnTO/TU/n1QQvL0kMVOkKKPL0AW7IUmqb1P2ppG9EwPSS7x1kDSsnf8U+3UICyGJIvtSrj5mmnL3ZCgRHK5zpd0qjfKe/5kfqMwjtR8XvPjsdGg2IHGb/wMAgvvlmzRJo77LTdXucdR+iyb3SSp346/eZtGjyD9mS9YVuaDyNPidmXbeYMOaWt2Vu4uSEmTIvHpLzwqAotvMXxEytgcXCCSaBYT58M8ZT6tqIUy5JOGSwzrVEzMLvq3vGs7yW/ro+r0SeDZzrk4TrdJLia5dXza+NyEpYzbYR3NyJ6W4wLSbFcBe+w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSiuA1Dl00b5oV6tfCv4m46gf5ddSzyms57zTNzLdAw=;
 b=SiutXF1xkdN98QIJPfivIMJEiDPAymOrGpt0NPei1ZH90qslmGEIyzzt47HaN2OfjEZ2U73BkmBQBf8KSDpPRPeCA4gVlU0Kp4R9bfl6ZUsh2+oyLPu+w4kI8RdXAd53MV4d20NzUiWIlKgDqAi/74Vv7UsrXZw//sA2uj2rV2O4Gjw8GC7+eIJv0yPS/du1EajYtLVWZRHm3jDHfDf6qeV+Eh9xP9hBKVd+dNk9YGWxA9AGUmf/6yhQLZSlsoA9QTtQfUWaD1NCsLfOY8q/wue1RaorvhHdmXGR/+71gq4zdGZUqvwEg58AcHJ0gOJ+7+C44oqWmQ+jjoNlfkSsTA==
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
 bh=aSiuA1Dl00b5oV6tfCv4m46gf5ddSzyms57zTNzLdAw=;
 b=Ic2k+91dc3t743N1rFTS0+BZZCuUx9d4lEXoH9w/B8J+VjNzHHCeJA9X//afsD6cj546h3Bp2uyBVku3gD6q80h26xVX4RECQI9XYV1YoFyoAMPrcptgA92v44QdGWoxYcN6GU6q8Qg0hR45ZVGoVzobkH6I05nTF8lR8KtlbhjCelEyZ1xtLYQdLafy+6H0tgdq/Z8bbwtaZJDZFUXQW++MhDnEAtib4qNPvmB6dIHYxqGujaXWfs3Qu5b3FNA9gUAxZZB8gQHddgJKxMzNW6uQw4j7eeT1HKi48dnLpnjj+GCl8P4VM8GRJTD+pVG9y+hNO9zU2Jst2HZ2im4ubQ==
Received: from AS4P250CA0004.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::12)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 17:34:14 +0000
Received: from AM1PEPF000C1ADA.eurprd02.prod.outlook.com
 (2603:10a6:20b:5df:cafe::5b) by AS4P250CA0004.outlook.office365.com
 (2603:10a6:20b:5df::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:34:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000C1ADA.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:13 +0000
Received: from emails-7692203-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 84944805F9;
	Mon, 28 Sep 2026 17:34:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616853;
 b=JMJknnpyIuz4QwdtMhAuukVN+puXk3sK8XMOXYyAVofSlnY+yGiFGAXjzM4J09ZTU1J8w
 Ck0N78tcFwe6gBs6qnPGfGib9/0+IB8Dm7DkL0ZI6XY5aMN1IX2Vow6sGavu0WRHBn3Wfop
 d25WJlDnITRsQ3v5NW6KNHvREp8atuI=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616853; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=aSiuA1Dl00b5oV6tfCv4m46gf5ddSzyms57zTNzLdAw=;
 b=n/ipFeYqnhCHl2aO4Xa+IU6bptgGU2S4dJKO0z+kuORWt/W0c0l2npZMRorpYnHKOtxat
 j7dDozbvBXZM6+h/ADoUMCvgJs2Nc4KPPq1C1S3qV6s6aMl1FpbBcu1hJ0/NPQGMft2Q2xl
 rtv5C2IQSCzKVT3oqK/K8CkRtWiAdJE=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSiuA1Dl00b5oV6tfCv4m46gf5ddSzyms57zTNzLdAw=;
 b=Ic2k+91dc3t743N1rFTS0+BZZCuUx9d4lEXoH9w/B8J+VjNzHHCeJA9X//afsD6cj546h3Bp2uyBVku3gD6q80h26xVX4RECQI9XYV1YoFyoAMPrcptgA92v44QdGWoxYcN6GU6q8Qg0hR45ZVGoVzobkH6I05nTF8lR8KtlbhjCelEyZ1xtLYQdLafy+6H0tgdq/Z8bbwtaZJDZFUXQW++MhDnEAtib4qNPvmB6dIHYxqGujaXWfs3Qu5b3FNA9gUAxZZB8gQHddgJKxMzNW6uQw4j7eeT1HKi48dnLpnjj+GCl8P4VM8GRJTD+pVG9y+hNO9zU2Jst2HZ2im4ubQ==
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
Date: Mon, 28 Sep 2026 19:34:00 +0200
Subject: [PATCH v10 09/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzv2l som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-9-91752ea39cbc@solid-run.com>
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
	MMZPR04MB400504:EE_|GV1PR04MB9200:EE_|AM1PEPF000C1ADA:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba64f3c-6878-467d-f58d-08df1d86b6bd
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|23010399003|10070799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 lc8PMGRuCG0McM+PA1bx0sX5nsk/dtT2HutNMR73gMesEE3C5acJk7rgA+xpndLoQ+e2OFryTkbA9JuQvzOtbgbJX5DInmkqLMjHW0FteldixkizgDVAZPHVnvfpaGvjDEwXbMDXbLGxm+VOibBIjynFBPh/9FQt0iRO3bL5x8mIZvDnIS//rjzMWS4DaqqNIc5JQdYaMrNwm8xidtvcfk0ZmRFKgnF9LKOyoufDUz5peXvuH6q928rloKowMQochnS+YjTxLmGx3Xujx6srIWBla6FuMIeKN69GUxTBLN+a54mUjHXhI4KOfZrML1mkh/kTtL0xawsi4zZTrz2GObETQywBGW5pd1ZFELiyTKDYaZS6eYwABHt5ZDccJRykhXpXkMWYY6pDp6ceGF8/uqvGh5mkZ2H0k21xZxOsrEcTM0aMpyGcmXfNBBmrUo4EjNRVxko9a5tVRiwOyhkRlzTTs3ucum0BmZuhzo3dXrq0VJRTGHxIeJc9Z4VsHDk/k3IQyPwKoAgIUpZgjaTJWDEeVUBnWXwgN6s9bDOHdKT5lXI3mGRe2ZKyrmw/lKKp+GEfgt2F4c8tR1YkeMIXkmKK66TapkgqaTrKU/QNJi0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(23010399003)(10070799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 BbTi4458t+f4Ldn3SetefAI8Xd/wvHmQUUZZ56fqpP9P+sgyvLXphJGhXpg1DfPyz7wnArQNdChKXvJrxeVej9XyKJz3aiCPzNPm+RBMycy0ZXYWujFOJWqLSmtGzFb+0uIYLlK/FyoTmpVFMEGnDp3bBbxyIOudCfuZSfjYT8TQgFHpt5FzLWWNqY95TJQl+h3AfRwliUG80OtDtFAnYlN9w67ZHsfZ4Ux88gYN+KMxszKIbBJrU7pbh9JfFsaI+zSPKUcTZOQuhO1P5X5XA3DthbEosdzykvosyXm5/l2aA1HfzDHUdvm+PQ1xJHh8eCBhL26J5G/jKgfYpuuAvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1d2c2dcb386b4f579deb08c56f996146:solidrun,office365_emails,sent,inline:87287daded720ae2bc7e73491d419f2c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdUuU4Fln+rGIJE7j+6negkKhwCWuVxPOb08Ma57+j5iNa7VkioMdISrA7atNjdI9pnUzk0N65KPrWyFincvy2Oy7oPESph/U/oLbRSfBh8pwLsOZjSyd/p6gsMtwWl/ZVrGKUCOht8bexSRy/SmJUTGVC2v5E0cZjp0Z/rvQkMJWj598NJ5GLXUg+a95EdUGNIIKEzEUqoh44PBGYWXXaz+z3dDpn5qF5iF29JYku5VZ0a5Y7FQrAS81w5G+OgbRn8AHejxiubGOHkprwIekhegY0EpxRxjs/mBiRCqel2hxUAgQmuQtIITsnCZtH0M9+/QCAwzqwZ0VT98ED8fpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSiuA1Dl00b5oV6tfCv4m46gf5ddSzyms57zTNzLdAw=;
 b=lt951wOlqvk87bcwmRLJQvB9ktLCSMXSbF74iImXkPwM8c3ngat0VPTNihnwwaHTGveWYC9y/w16VStyHuVwDhh60p0ie4T5CsuDaUOPO3nSIETv0sqCQ29ow/ImNTl04WyjyLW8ABdAe4vo0whxpDaeGwjmfWPDtctQNPIiNA95I14pl5WlmElelROew3U4bMGp2v0qhjQqB7jEUBnSBb7SjpnCsQKNhBvP1cvzxn6jBWL9dHzp6B8DGG5jwLGlxdvP6ZBtEJddpYX46QnD576k/ymwX8MWla5+7UpXul3lbn/9tWYLn+Lf28RAXk5BO/XLbaoyYxXZn5QkteL6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29ee2def-3c73-4eda-9e97-08df1d86aec9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|23010399003|82310400026|7416014|36860700016|376014|35042699022|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lx7NJ+fC7vHlGKcw17eXxhacEJAZrr/bYMve0tOVnGohz/y/PdyQ1Fi+wtXCYoq5XpSsiSZ8hiYak0AppbOafJ8k5QQvG9Y1rfhd2AdS+Pc4FPySAT4z9yykrw7ZK8wR+X6reF1ByuKbR3JrB0kAq8n7TBvMwhlG9500Y0aRT/L5W8ULyPF7d3qKyyGVYhqm+yPb+F9Tn02uGQuRBwS7G53Cf/eyPZintma5Eko8t54PQ1ZVIsNutUzEj2zsYN8z7EmOleDfuYER1OrRoedJR/D39pgAyNuKtqU4M8gXxvWLXRBe3fQ+g6JQ7Jss5W0O7skRumYKUVsmST7EPpOpJHPUuyb9SIXeA6jPohCGMNfDwtMwow6uubbIIW9HrExLdfSmnu7KWToCbXOFooaDppP0FGhS3Lxz7wvBv+u81HDD6EGIpFrxx/XLhGfF1x5m/aPHcFLeqR0p2syibFR3n0WrIIgvZ29erh8nK5nZlnsx5hfEuqGkYFLkwcye3Q2ONEi8pDTpsslWlHx3MgRn1RedgEEhd40IyWIYAalEEfUBNZJf4Z2KJqyvjS1jvUod+wCOio/pwh9Et+oJmZY9KbelwBfyu7R/Py6+mAypp69ICOI5qHLeQR6mr7wdXTr65NdG9ziSiMgkjA15o1n69w==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(23010399003)(82310400026)(7416014)(36860700016)(376014)(35042699022)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tt7/oElUO8t8Ib2RR73bawkaoYyJ9q2BFmu5mUNEHyUpv6aSO+BYXlwXbEJGyvzt5ed+I1FaZK2VaVz/3RHtmPELNeWWp2or8v+N90shi+wCVmMC01WjC+wjKqf7jiQWivSlBK1i+MuAvcfpafbb/T2Y/NWy1dYaxcLAVYFBS77IJWDtD4Y3k5D8g52vqy7jtNedS373zSKA293ukX6fD+yPWiLbWGllIckGhJi2e2dFiqocIpj5984SPmz9VezmHf+04ayoJVpevnZmzzxpOn6lsOD2OEPliHWc8LV5qOiAFrdgGfVFFC6ePHrdDhmaf6hbv+1AfJBdCRGTP9qSZMfbDi8PBB/65gbZVfX0Rb+Q3qtveFyyUz9ShcSxOXTgdK1yvQMBqDpbM22FOiatIIPDChSPBgY0q3efzdcbUihjsCLRzB+5wFpdwLIx07Rp
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:13.7736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba64f3c-6878-467d-f58d-08df1d86b6bd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230

Add support for the SolidRun HummingBoard Ripple [2] with RZ/V2L
SoM [1].

The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
featuring:
- 2x USB-2.0 Type-A connector
- 1x 1Gbps RJ45 Ethernet
- micro-HDMI connector
- microSD connector
- mini-PCI-E connector with SIM slot supporting USB-2.0 interface
- MIPI-CSI Camera Connector (not described without specific camera)
- RTC with backup battery

The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].

The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities, all descriptions except SoC are shared with
RZ/G2L.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                   |  5 +++++
 .../dts/renesas/r9a07g054l2-hummingboard-ripple.dts    | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 077e8ebea0cff..625093995c521 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -224,6 +224,11 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-b.dtbo
 r9a07g054l2-hummingboard-iiot-rs485-b-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-b.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-ripple.dtb
+r9a07g054l2-hummingboard-ripple-emmc-dtbs := r9a07g054l2-hummingboard-ripple.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-ripple-emmc.dtb
+r9a07g054l2-hummingboard-ripple-microsd-dtbs := r9a07g054l2-hummingboard-ripple.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-ripple-microsd.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
 r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..0c73871524541
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g054l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-pulse-common.dtsi"
+#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
+#include "rzg2l-hummingboard-ripple.dtsi"
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-ripple", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard Ripple";
+};

-- 
2.51.0

