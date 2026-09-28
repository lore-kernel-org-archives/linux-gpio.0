Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023111.outbound.protection.outlook.com [40.107.162.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BD4E06FB;
	Mon, 28 Sep 2026 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.111
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606430; cv=fail; b=pGCKeobOAAYtoHW2ZAjEvBCsNp2Xn5n2yJFAI6ThAabhXZ7jESro9KmSo0N/BJPhLmw7N2pHmB77Mj/qHCU9xFlDP1cKsuN+6D7vnCTr1WtoYbVocTs/hGosB4dLyqxDBCkZ8EX0F1vgSkaPaNPRARF93wNs/hvvNObSJnkZORc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606430; c=relaxed/simple;
	bh=prZYGN10toKjxYc9bnWnf0Xmk8UBAKjBN8pgF4BsNk0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZhDQnh3vdbLrO0cHV5BWznrAMlI64u9llR5J3w+hWI2h+a/nZ96cb+Yt49x7OIzRlRF9RMizQSNpY9Q7qJWY/gYkF2d5jSzEaQAOule4PYoKH/LUzur2lGIL/zNGwy3l+3ix9ZDELdOIjXG5+n63poyeFNHhMmvtwKZJpZiJJSY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=YOWp4zTC; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=YOWp4zTC; arc=fail smtp.client-ip=40.107.162.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="YOWp4zTC";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="YOWp4zTC"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mLQs8xnIoxjjQea6cFfnXiKXU/ZUBaFLAsj0QSBq3MATaqSuaEDfrv9gv/YnRy4y6q43glKcBPeMB5814Il7OgOnhdMKx8l5neGWSGinfwm3+NUPrvbzlH+MaBSpKhe0gqJ8isXtxjtIvv5xVdOp9A/8iRJOsTDMV4xIa1TuRECZkQ4eB1MV27sZFi5r1AIMFuM+6aMY3VIgAq6rOnd7z7goQRdI1haNub27aNO+oIFk5TTzqIQ2ZPwa5KWOx6NzrMJYJiU2wxDXqAHuLBM66kK5c+1H6xwgUQwWwiC2QfYlHGenfyB4iN4oVm6BXSwILWbBRZJcw30KiHiTdRjQbA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=RQX75mpPM4t5PiVYFZaciA0vS+c9SQhuwJoUGr6vg8TNu/SW/FbufD13+kiZqjn4ijcJL5+OqXt3aq6xeGkKV8unFkfES4wACuSQpLMapemhfgQ7zvIUSOffuAXziYGc83Hptx5WegEsvdLz6NnvZCtbTKaZkgMb1i33Bw87sQnr4E+I89zLkzDD9NpEZ9OYPK2lWbhgREh2U4PuOwbX3E3HEd1QHYgZy/Vwc9BmWo5oFMgr3I/VtZiQUTLk/DV6zIlu2DmOjqzZDywcGurLIvOTYGPL708Pa3675IaixvXycpbC44OyjpNYQbTNdFkg1GhzOzkZ2hAm35CaOPQxag==
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
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=YOWp4zTCa1BeLZnxebcaYOa53Lr/SwEznOe5WCn6kQnnHuB6smXwboQ64mZRYw1YFQ6jf7VBFvYlrEo18J+i24FsIDSkurwCHS6Q8DLZ/1PEoDsNxxxAtRSahFSoGuB9yiDzrLnF8thCiaPbuBOgTCsM1ZnfSPKL1CmWmw+9hCwKm7t59qCTimw5pPBj1Zswiu8M1TmaEyyQGIirCZ4rTHXEpvlhqlBum3En2TzkI/Z6LnjEFxKuVwCiAM6Qydzjf15fhKdfsXYDBIy2/8Zt3OL+Dr/iGtTrwPXlbkHv0n6byh5EtgR66943alXAlJ6wasqLv9FyrKWyHqhuovVGsQ==
Received: from AM0PR02CA0134.eurprd02.prod.outlook.com (2603:10a6:20b:28c::31)
 by PAXPR04MB8686.eurprd04.prod.outlook.com (2603:10a6:102:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:40:12 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c:cafe::59) by AM0PR02CA0134.outlook.office365.com
 (2603:10a6:20b:28c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 14:40:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:40:11 +0000
Received: from emails-7966038-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-272-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B8A218051C;
	Mon, 28 Sep 2026 14:40:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606411;
 b=i+I+We8vGlVkrdH91MirYL3Nii7JM0RZGOM68EFIRUWI0+B2jvFlOxYhAhZiHykJbGP7D
 J1v5mEB4xJQMCirt51m0Z/k5xa/q2kx5YR3HsGa8ZWbS5ULiEKvu9tl1sPOICwXjPdfIqQa
 eC7zZpiTSmwin0FF3xoD1NaWg8a51Qk=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606411; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=Krfm46GXqWqA0nOKFs8cArKD8J1A6CtHTFWPHX8yAXsFBBYCIGuxijf/S+BKMJZjkXlaS
 SYR5wWXDRdTvtZlUxktruKJBcbSDpYSCOWU+KeK3VQaxNiGXS35zx2NRsqf//Vd3Pu/WSlz
 lQRxYiwjNtKP+SKCAg5J3nsvBnj7Ofs=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=YOWp4zTCa1BeLZnxebcaYOa53Lr/SwEznOe5WCn6kQnnHuB6smXwboQ64mZRYw1YFQ6jf7VBFvYlrEo18J+i24FsIDSkurwCHS6Q8DLZ/1PEoDsNxxxAtRSahFSoGuB9yiDzrLnF8thCiaPbuBOgTCsM1ZnfSPKL1CmWmw+9hCwKm7t59qCTimw5pPBj1Zswiu8M1TmaEyyQGIirCZ4rTHXEpvlhqlBum3En2TzkI/Z6LnjEFxKuVwCiAM6Qydzjf15fhKdfsXYDBIy2/8Zt3OL+Dr/iGtTrwPXlbkHv0n6byh5EtgR66943alXAlJ6wasqLv9FyrKWyHqhuovVGsQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:53 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:53 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:33 +0200
Subject: [PATCH v9 05/11] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-5-5901e0fc9e44@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
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
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|DB3PEPF0000885C:EE_|PAXPR04MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 285bafa8-fba6-4148-301f-08df1d6e66d8
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 ZaMgoQZ8Vi8S3AGUqN/FFmV35BZqPgsKFf0S7Y5C1Yy6ZtjpOG3mYGsUFeWp5tI8GrLlmHFzmXUdcqSlQd+lyW0B+gWTqSZXsls8xrDjUg1a2ar1TLvaYwGkJrwshQDthTuerdsywKaTBCSJEp438YT86zeGbPWZdKaAALvXhq1Z5KtOQh9DkPUj6TEgqx8gPP8tQ74wU6JTAXIt2AkW+c7skG6iIIl2JgzDjG9DfU0WJce9F34x9R5tSHWtCO0GqNUAQzvy4JDr4RiIYgtdOuKXcvjpPcmyCk1JTPXZyzYU0/nOo71dg/hH1PmiexvDJncWO3CYavsgZfmSsyyMzD9vAOloIZZRTCoIXbH+ebn6U+JHQWoGd62OOxmpfjbn7BGNT+CNkLJCppWXVr/Gs/tdpUtv9sitsq0zkHVIk22Ws20c234orEQgo3zQ6zakLAv5h23obInXPXAjQ+OmEdv0rOW9L7OLMuDD076HrtYEJLxsAsw3Vn6iuz/rN52VKehSWZcFqYZZ1Gvm38v6HPV36yLM+ey1xC7DYgoNM2zlXUE3nhjAVcXDwX1Tv3AxivUZPpojnmAas6PRvuZaE4EwfoGqLJ2tbbX+FNzq59yPVR9Ju+zzuDC7zCS+vmAj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 cVGqLwUpkB/R8pQsycAJQYMOWiymDXTNqCl4VvTN/vECmOkV1yMwTsISPIsJeM+zhTe8+ZjaSfR2X2GdS55gYXKsY5sIPrvDy/mF8qChjmO2n/ulgchZgLqpUvXFqy0JsHby7vHf8+DNDm309oqY2mBpwN2lBH9X1U8Ke5VjXl7Lb+22/xmBKTKDqQkQmWe0+fA0oDmu63i1VjweEWaY2//Nh3/V+ceXfXhkK5HEFQ/HM3cHqTAy9MaYSaU+BNHNGtR1v/0PVpgfrY3ZIPov6HJhCUFp/Omb2sQI+Utop8chsFb/AGvLzsQL/qLL6tG9vew2SBjIg+g3plD6nQqa4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6aeed1faf979424c8b5678bb5ef77318:solidrun,office365_emails,sent,inline:ccac836d61caefcbefa3c2641c859a8b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgyhJai9izTF+j6NbcMM+428y5XKggRxlfyuKPs3uLtlsMQTawYJ+7yoYVPFbu7rNAhGJRTvWnNHqiJtWe9R2fXPDNZcpZdlOwg7Bv9b3zxuqAS9XHAOBH8S+j42X8Ce6vYwjIDiQhU9PYBEdH0zdm6ijCGauEm9b4jrNa9l7vCNsEdgPBm1SCZboYziubw1UYGIBPExfEzFU2ZByfTcgbL8TwDVLnUpbn+TlY43t9uQ+INrwfnJZ7cwFyNOxsHowouTc4VIc5BbC+cHZNFbiAYCx99hj/W7VkaAXJ/W1nYSETUKmfKqZggGhlKl6NSr00xdiBsMcQ7sJmRCh55CAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9j5sesU+YvuuHRISTKGnb+vq6Po7a60EBQYestP8PE=;
 b=Scfq0a4e1qj8ZeMotd3xLB/g93Aj//gyZUQBMseOnoea0wKtZPuVpb1Oj8Co4TE6EseErFOXDbYLdU0Yg+WTtGmFpd6Sd3gdPL4jyEh28pr/YvQ5x5ZR9hY7TbCmUjcNh+bYG2H4/Bv03whx3okTP7cBWgpi44k7hloYCbRxLtS/0ZUqHlzTph4XPGmhk7Agjv/UH/d1n/M03aAdEK6osl4pBJ/ZnqHRUsXXy/1iTjqFyHmqNNyU0oBmdJXkE2pxsm1yfzfZwdZBiqsie09NK9WfnF2sb24pqmpsKhjwj558VgvWcxv6JiDs5kXITerL9T2nFlXQZ5VBLwd6Rz6mZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2497ee12-3ec0-4fa8-1662-08df1d6e5b72
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|35042699022|7416014|14060799003|376014|82310400026|36860700016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tqDfd/v0LOd5tvYiSGZj/aq6rbNuUIWIgYdzGP5lLH6ySulyS4lANwWlX+SePP2noMkeoIqFGg0Ta6u3sK5laM21uPNG1pEHNhdJRWzBzcAgKwxoMGiUD+7SdoWvBnk6Y6aa9oIlsx1TXzKMvxqbNo5R20bSrAy8nSQn9d5BEOYOXMTnySHUuxOsyEVXGsT0qcFxopkzCcrHBPFdSgtPPGpnJFOVHT1lADBNkD1yS0zktcaEC22lztSlelclBynNqFpOnkkkoUwv/B//PoHFvGvIzv/ahBP6l4phRv269OmCxE/xiDDjHcLCrffE13eyneTqMKSkxo/fMMhVfleW0FqvPPEp0JmmlM1oSyyfxHIlvJKqiypKFRKx4KoiefnxnRwjl48ucBdWdbnMCb5fCX0RxtqTlo+EgXNaNwmnxhsB8cmxVYET9PsWbz1vqvW7+HtSKBM3xV2YDsfpxD+Fly8b77fY3RCV1sNdyRMwyHLFwjJRzX+t78JDlXce8wdVhaQ9ZB38KJUC6wsMtWhzi6rZvV26nE2gQoIymS0Au8aQX0+Ge6yT3tBydnkDK7rQbgFegckkZlTWC0gVs9TXL0eevqQHkjzxTyLhxtEtiiL/WHVLeBln5GaP4RL4z5IDgTdbOEUA/ODtbjhCwXlVEzXUQ748N79KF4EYclod5VI=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(35042699022)(7416014)(14060799003)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	23CHRosN8f9Mk9i9oEmXdx6zQ1kvnANxSbPaTxzbQHS92lMZy9QOPaLU4TvOtVVOKIj/b9EOUmpzr/wZjj+HB7Wk3w8DCXdlhceo6O+egk9Wjet+psDyp6LLZ1WAFjPHB+Q+RIccL651/jgFu6mCd0rNL/wNgYhcGkwWPV8YQmy4/eZ/l5a9Md/vDcOxH3MfFv7QtZJ2gX7yCfjS9RgRkYoGcT7xrO4hei/xO0X/M5+KdJi3RCFdEIdXw2eppkqKJxhI3F2MFxsnrlsHioW6vIIvT7u6viKpIcNK6N1mLMIa91EiaaBt3J+aWuiKHdaJpbWl1DYAz4dcUM3xQOm2WlZkB2bdxEQ0m2KOIsD/1N6iI741l6pQVY4lq0WBnjiRJIqcV6M1+y4+RX0KQoruZLlp0P//QRr9C5+yL0eKTCbRA6jLuJevgNEQsWOagozw
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:11.8524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285bafa8-fba6-4148-301f-08df1d6e66d8
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8686

Add support for the SolidRun RZ/V2L [1] SoM on HummingBoard IIoT [2].

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

The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities most code is shared, including DT overlays for
eMMC, microSD, and RS485.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

