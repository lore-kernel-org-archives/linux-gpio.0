Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023102.outbound.protection.outlook.com [40.107.162.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0FA4DB567;
	Mon, 28 Sep 2026 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.102
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606433; cv=fail; b=t+NFafapdUV426umYgPqe3HXeq1dEC+fFhyIMmfi1NCyQelam9QuvJj2B/DjnPWytcERoCQXmhQKDZaQ0Gl7qpIpwlGsrW+GVd8hHet27m8cG6GuVnJlf5BHw6OAWPXkTf9aGtPFwQd7JJEYERwfdZ6FbHgQ4JJN6E1vc40MHz4=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606433; c=relaxed/simple;
	bh=0XUQo8sILVb8aDnbSVKmka9Q9HBnj5VHPTrk/yUYxE0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Bm4WDM+EOFc0OQL9hkJ3OW/oYHLmX3c9YxaYtl6g+gDBaS/70x30hu3FwjaRv/TTWMRQOnubWnIcz3iqi8dz3C15RiK0VNwO6N5TZ771aC5DtO3GnG9wJh2OTEqGa3f4m88WzfbEBR+qwrr+A7mGoIElvGmikRfh/xdjLWp7boc=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=MF9mmpqm; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=MF9mmpqm; arc=fail smtp.client-ip=40.107.162.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="MF9mmpqm";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="MF9mmpqm"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sjBUohotsyS17gbRvtZs4USsnj7SyeGjyETo7IDcrTDCQMZlcHPSVhxVSrr6OrZnU8x1YRIz7Wtv7jFeLmzG9TozaTbOVxUB3dc6K6Jz3+lwbYgm0Lwi1EuK42pQIz4Phuwtw/YLmTnnqmtlxrBzgO8k3kzFqxNEmMNKJhv6wO6dKa1bbGldkSN3X+amXiKCbMzXTFwl7KPTOw/zXrtRUjyeElx+2uUPdwJSCdhh+ZViZag1C++nCwBbAvCQlFMWq5audabksAFJSBVGf3pLozqb1sZHo1nbIfH8pTyg/ADZWkv0BJtRelKdgD/MJUaZm0DpdZ9QuVLV2wd+sy/HGA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw0OvfO8xMATeUQV8l2AtTa5Y5ejY04vNKdFl+GgrbU=;
 b=akCpPTk5GrhJBhJFR/3LZMwKLVHD1IrNC59HhAwMqR5/mPgoHC19ikxuzUXu2JzdL28kNMceWURBPxY+BIh6SPhTch7jZOcZZ4mDy9AtF9dmRBIWhmjqQnL7EEnsIvyjSNvaYu/jEiNTn4J1xLboLJ6z0Xkm/naDq94WA2h5YUqBAz0LtOIzrhMIEcBmujzBuE5460t+GYRj308cwlRo0OsNjpyLm+/Q7uSEvzTrIYRhDJTQ1BOUhMGyOYgZH8xY7aH26EUNhuF9LzEUfBqi56Iu6F0N/NhjUPYV5A5enkgvI+Hczm7PeqFvEEtkzFP+hFVHzKwlRRYk4As0kgZdCQ==
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
 bh=Cw0OvfO8xMATeUQV8l2AtTa5Y5ejY04vNKdFl+GgrbU=;
 b=MF9mmpqmuVkNj9blbgiRRNZCBK9kWJH5VdxtDPmOyE55bhn6uqv6CBpqR+51qjUd3lDFROlIh85PmAA7h8oIA2Ar6ehiUY4aBTGbjLeM6b3EHncyEysTv/gd2Rh6CO6zhPGHmZDySzSMGplVy8cfwtDeGKF+Bvp038x/8oq2QCkhhwKMkbgmRcygrnL079t+L13bdhsBWeSACsl5QoXoGz4tIyLtX63/szKdq7qA7ZX5agCJHg/unSD3YL0gVJJ92oOgoS7U2ooB+qolzemoypIYpVxyntVBdPopbzgXjclO9wTxizbFhOrgKFmn+PrJNApqdCGB2pAHppBzD4mXuQ==
Received: from DUZP191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::8) by
 MMZPR04MB353905.eurprd04.prod.outlook.com (2603:10a6:190:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:40:08 +0000
Received: from MAD0EPF000008BA.eurprd04.prod.outlook.com
 (2603:10a6:10:4f8:cafe::10) by DUZP191CA0048.outlook.office365.com
 (2603:10a6:10:4f8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 14:40:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MAD0EPF000008BA.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:40:07 +0000
Received: from emails-2845607-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6B979802F2;
	Mon, 28 Sep 2026 14:40:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606407;
 b=DaieG/cAcccZe2Y4awx0WZZqj38nQM0XJakFLNJqGUUPDmeQrrwrGW6JC4D1S7hT70vpH
 RpOEj/J67TnYyAW89tUAeAQZ+Krv5wa82zk63ndMHuSceRbseagtTkaTdqJxR+5Zf9jpZo8
 9PpC1xI68TRU28duLCtnTSkjL1Ni0+s=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606407; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Cw0OvfO8xMATeUQV8l2AtTa5Y5ejY04vNKdFl+GgrbU=;
 b=RY/nx6T9Uk2uUQ3wGLSZsUO/5VEwED/NOZJHWDV/S+m585Gy/OTD8H00z1Xc03eGUgr6K
 LxsRDbCQtYpPUcW/Si+PhrGmHuzHEjK8XaoKdhmHLmXU/tGYd7i2/SGHWecGAKPReSE69i8
 ikiNt8yRZFocpl4kbJogwmB107lJRYM=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw0OvfO8xMATeUQV8l2AtTa5Y5ejY04vNKdFl+GgrbU=;
 b=MF9mmpqmuVkNj9blbgiRRNZCBK9kWJH5VdxtDPmOyE55bhn6uqv6CBpqR+51qjUd3lDFROlIh85PmAA7h8oIA2Ar6ehiUY4aBTGbjLeM6b3EHncyEysTv/gd2Rh6CO6zhPGHmZDySzSMGplVy8cfwtDeGKF+Bvp038x/8oq2QCkhhwKMkbgmRcygrnL079t+L13bdhsBWeSACsl5QoXoGz4tIyLtX63/szKdq7qA7ZX5agCJHg/unSD3YL0gVJJ92oOgoS7U2ooB+qolzemoypIYpVxyntVBdPopbzgXjclO9wTxizbFhOrgKFmn+PrJNApqdCGB2pAHppBzD4mXuQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:50 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:50 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v9 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Mon, 28 Sep 2026 16:39:28 +0200
Message-Id: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACB8umoC/23R3U7EIBAF4FfZcC0GBhjAK9/DeEH52SXRrQFt1
 E3fXdrEtFl6eSaZL2cyN1JjybGSp9ONlDjlmsdrC/bhRPzFXc+R5tAyAQbIFANafs9Aa6HD6Eq
 oVOigFCIaB4G0pY8SU/5ewZfXli+5fo7lZ/Unvkz/KXFPTZwyapRUqHWywrvnOr7lQMvX9dGP7
 2ThJtgRnHcELAS4OAwBtLH8iBB7ojtoEo1ITIjkLXrL8IiQG6EF6wjZCGYGL5VV2gR/RKiNMMx
 2hGoEtx4RhDJRHLbAHcH7FtgIyZNzAnxwaTgi9EbY/rnrIdK1jzgJkGI8IsyekB1hGmGll6ilB
 R3NPTHP8x/iT4bQhQIAAA==
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
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|MAD0EPF000008BA:EE_|MMZPR04MB353905:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef53241-0db4-43f9-14c1-08df1d6e6482
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|3023799007|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 vay5OkeEIXXk3uGgxPAqPbhz52eI9n32s7rNNeMLYrGjWVaqE7cDG2r74SANN4OH3IQW6y4gX0ct753WbM1uDeygGrtIqPZR81iolnZen4cXokE/3d9rTvxxsSKoITJH6DE0URUdJCPsFE8ILm4xpjy0Yz8UQTdiEi5GbmZaLsSzPoHKl+B7YD9/Z6WfHPCDG0DG7S6Nm92BMldtQbc6nB827huwg2ZMXMkVcIRZc1Yw7QNL/z5epis2Vlu2NlC4CZp3EXeWYTrOmqEfx+ibJ640V0eRaQk2cMEArxeCEffblclqrtE0DMIC2VD/snSUgMUS/BI6yTzafOrrFnVPOpwZY/bSVT+3dKs2Pinmqy+Xh/Cf4ASrs9e3SxvK6EMndYDKIbj/8dRO7TSMzW6YyhqxbWzjtITsPnuk00ocOfGgcPvSsXaXHzfNHJZSI+rBS3CqyEZUlQBnv8SjDGSMetWVxYq8+jlxPEgaPNk0LlD0VItMHP/oZqMNqwxE6Tbu7nujVieNpWTzwm4HA66Byw0C7Wp2MFuXVRLQ4JoadEqx+Ep7vG9luBOH08UNV2HOHtKGLVHPw5ItjBTzoSpDPMNK/Abd5nuqo07ZL8bXZCrx+ylCLQt+SVgHhTI5hWt9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(3023799007)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 jUnjcNcohGkD+6xDBXkzOvaUndFOf56IqHlMh8mnI71+dDIr0jemPUjCJZmh4Fj+N1MkD4O1JJlb1i9gsXzcsVRhCj4dTCpepWzZ2GQtwpMiwnPPtOajBs3an8dp9mhrfDxLDOx9EonGrN+YkiROiI7oYXfReJF9dhYqtk3/Zon7DX/PIqeqwSpOVLJHQzAVsTVIEMLpAgfYNRG8NhKNPLoTsRsWJrPZs1v0MY2htJNNMP7h5JuMFzFoxdVgD5XZiKke0emgQy8LsWW4Bfnsuh9GW5Ijgaw9iiBTHzJ3PGgjWwIE4l32q7/Hsosal2dEvjKT3sAVr5v2wvBUQcGHmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a35ed883db6d4cf9b1d1b0dc75e30df1:solidrun,office365_emails,sent,inline:bb7aee3ce0155fc133e2b467b7daba00
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvbv978c5DcmXYdKGp05xawjhDuhUnwP5AeTj0yTLwYv+C1rPuv099unRmGz4OJDm3sAycZIvj1EY3/JE+vPh/R42trahDlIbyJJGaUo45BgI+R2RzVlxcqZkNSK/XuR1EhqU0mZXk+fE5QOR3AdMtqA1cSbZX3dNy06GPS6jTtqUx+Uae41RTa+FoK6PVNjaagzQcPVYiTay+DiuL6Moh+u4nQn1B08exESqMfVm16u4ufGoKENfxjK2b+Z5UnKD6/AZ1x2MuEDVxoSlM1lR1iYV6SqoEdJrUhOUfIBO4H+s+8t9SJFJW4Y9Im60byRLeWK1NAd5/rItAQHGYSlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw0OvfO8xMATeUQV8l2AtTa5Y5ejY04vNKdFl+GgrbU=;
 b=J1Lk25hqO2zNqJX0M1xt9WZY/SszQl+n/Xbdba6sfAbMbtaYSx1bkgM3E/5Od7ObU8IdbWuaVFqPv59lFO6r1jugOXIJMvWfz7t5tPwZ6HYo0x9rG+gZIVxM4r57HONJExM7UMN8HgMyaBGS8RkE8HzIgv0HDQK0CsvcIsyQPng904MytLSfXGPieMq/qB/kxYunJPqr9qq6nJhq7uJX1NZpLLTfJ2M4EViYtMLFvyMcQDDZsw9Ie0z3BxgDNyNCM0SG+I3Fk9i686XskWqWqS9abOdaN45k1BK9fmcDw4Eiel7wU9zYOxeUzigk/mMV1u6FsyfRxwYN0uV/WzGe9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92f649fc-790c-4a58-f413-08df1d6e59f7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|35042699022|82310400026|14060799003|23010399003|36860700016|6133799003|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	d152yFZRs8kSjAw9SDER3tPFZdY62JV2gGMHQQMiAsnIGrlkaBklpK1SxrFHWGc+qLznA2tMutROETzYh18NI0/BrypQrZgN6tESdj6PUvMXjct72JlDvOW8OoJzqnqzDMS933AW1suZ+31HNxFHd+24qHvuSZrmH0cPOc7S5QANDGUvFnr8BsG7zKnsStwY4xuMpnYJteMRUGkst52uPggTb8Y77nL5wtzzpXBUSRujNt6oiAPfeRe04WbBIhwx9/sWiOeoxMzpTNKfa70Z+TqEPtgFDJ2Yx6l06NUL6sVWSP5egq/l8LzN2VxxgFF02ROg4O/0EZXfIYSAjiUdymdux2+n/2dtCTgw9aRQSuTjiBH0t16iDbsrtC3jIknaR39MhZ4YNJ5bDjcsMEKSDboL/m83L4j81RogzTCZ2i1F404lu0NatizblPOBUlplsKTu6AqvfugFtx/+ew7vZkQttMKTztWG5rfATTbB6tuGZ9ewjdXRHjxf6G2vtxbei90sLM3HCQaPFclNBOZ7thHBSzXy700gs3mVG7DcqFj129KzrOYONxc/KYtjVUtKwN2xBxNi01Sp8hxCGfZI2YafzWtr1CPmnyOn46c3pUWTZGKCjbrTQBY/3Z9OOncSRV0N2VFJNaQUmzMHMYCbLg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(35042699022)(82310400026)(14060799003)(23010399003)(36860700016)(6133799003)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o9/T476IB6PDJFt2QcuG6/Rn9Nte5v6GHStxl8pN4uHsPpgFa0LL7Gy4XkKkQUTkERCAgo3FWQB+2WELMaImMD7r/UDB4H55tfp8lDQ2BYwc9fFoY9UDZsPpw5fAF/SXzznnnj+f6q1Z3+5ZCJ3k0tXVwitYL0rlfD2hO8NG0U/v5ggHVlwSHYueSu3f915GJViX9oSdfhc2yRILG528fDiM693hOR+pqj5WhYHVIK028cVYRSF1X6R6jLWlU3jZFJOJAnXZWbxDBwd7MzNhmAx9whe06X4mxUxuB7MHKI82nGj44MDb9clYZ6d9UZUvDARGeHAG2M6buXIQsHfIiGvLwiI4CIUTvqGkKGdk4j+dcXOU4tiOjyHPkdMcZtD6e+RlF4PT0o6hXA6XBYaixUl/gVIqvMgJiHc/R+VT+kNthoZLtCeArAUWOSClpSlE
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:07.8361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef53241-0db4-43f9-14c1-08df1d6e6482
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB353905

Add support for a variety of SolidRun RZ/G2 based SoMs and both
HummingBoard IIoT and HummingBoard Ripple Evaluation boards.

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

Device-tree are only added for the IIOT and BASE boards to reduce
initial effort.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v9:
- Drop gpio aliases not supported by drivers.
- Added missing include for hb-ripple micro-hdmi common dtsi on G2L/V2L.
- Moved hb-ripple led bindings include to common dtsi.
- Use preferred regulator naming "regulator-1v1" (instead of 1-1).
- Fixed inconsistent capitalisation of RZ/rz.
- Collected reviews by Geert.
- Link to v8: https://lore.kernel.org/r/20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com

Changes in v8:
- Added RZ/G2UL SoM.
- Added HummingBoard Ripple.
- Added SoM Bluetooth nodes.
- Fixed renesas pinctrl binding commit message logical inversion.
  (Reported-by: Linus Walleij <linusw@kernel.org>)
- Changed memory start address as suggested by sashiko,
  and clarified reasoning with comments.
- Dropped invalid fixed-clock from g2l som.
- Sorted reserved-mem nodes by address.
- Split eMMC pinconf nodes supporting input-enable only on data pins,
  not on clk. Tested both microSD and eMMC overlays (v7 only tested
  microSD).
- Made capitalisation of "HummingBoard" consistent in commit messages.
- Clarified G2LC SoM has 100Mbps ethernet only.
- Added reg property to dsi panel overlay port node, reported by
  sashiko.
- Collected review tags.
- Extended rzg2l-pinctrl to allow both input-enable and output-enable as
  requested by Geert, kept Linus' Reviewed-by from previous version.
- v7 was sent with "v4" subject by mistake, resolved with v8.
- Link to v7: https://lore.kernel.org/r/20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com

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
Josua Mayer (11):
      dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-/output-disable
      dt-bindings: usb: cypress,hx3: make peer-hub property optional
      arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb
      arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add dsi panel dt overlay
      arm64: dts: renesas: add support for solidrun hb-ripple with rzg2l som
      arm64: dts: renesas: add support for solidrun hb-ripple with rzv2l som
      arm64: dts: renesas: add support for solidrun hb-ripple with rzg2lc som
      arm64: dts: renesas: add support for solidrun rzg2ul som on hb-ripple

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   2 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  37 ++
 .../devicetree/bindings/usb/cypress,hx3.yaml       |   1 -
 arch/arm64/boot/dts/renesas/Makefile               |  73 ++-
 .../renesas/r9a07g043u12-hummingboard-ripple.dts   |  89 ++++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../renesas/r9a07g044c2-hummingboard-ripple.dts    |  93 ++++
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../renesas/r9a07g044l2-hummingboard-ripple.dts    |  17 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/r9a07g054l2-hummingboard-ripple.dts    |  17 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 560 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  79 +++
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 .../renesas/rzg2l-hummingboard-pulse-common.dtsi   | 116 +++++
 .../rzg2l-hummingboard-pulse-micro-hdmi.dtsi       |  79 +++
 .../dts/renesas/rzg2l-hummingboard-ripple.dtsi     | 125 +++++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 479 ++++++++++++++++++
 .../renesas/rzg2lc-hummingboard-pulse-leds.dtso    |  48 ++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 442 ++++++++++++++++
 .../renesas/rzg2ul-hummingboard-pulse-leds.dtso    |  48 ++
 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi     | 437 ++++++++++++++++
 26 files changed, 2945 insertions(+), 2 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

