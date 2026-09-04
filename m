Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023077.outbound.protection.outlook.com [52.101.83.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1026481673;
	Fri,  4 Sep 2026 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.77
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523024; cv=fail; b=mBn40IZmB86uC+it9S2mRkb4zmlj4gNcR7KZXLW23V+1AE3Q0+zj+Ym5adpaqjoSqEGbWuAI6zTHqmvTB7U2f0qe96LaQafWrJ2IT+e8eM8uTQF5OswuAA2c5lpj5EzQjHB4HAQDlLYPT4oVZgmJ2X62YoMhdsmyS3IZSa9I3RU=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523024; c=relaxed/simple;
	bh=guad9T4gVEIk6SRSyjCakL1GavASzM6xmGYjqMOlotY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q8JjZgpTnhoSJ+AV4a1IJ9pTg/R82JLnDOV85tXyl8GD4tDKKFBAo+1PugtWzJV4OW9j4ufckW3AaYMcp6/hPmGJpnZt6OMtY/zizKifdneF26jEWdPw5k1j1WUsiJBInab2qt8FAl3T8/DwnHVPohUTbdrfQYQyrTLaOACR+Q8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=vo7pKLdW; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=vo7pKLdW; arc=fail smtp.client-ip=52.101.83.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="vo7pKLdW";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="vo7pKLdW"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OSN0DSHltztMmpjqScyjgyntIwUI/3b4K6WYLIO+QbfGMbMz07v4zeip804ug7V1SSbPaNFGkdkvNo4FvM5T8WIW17eivLnq2p8NU0YZckNBwsFDLLVRe+mz8asGF7eayuTMmgCoEiaDjM9WigJe2373XuOIKwLvY335N0y4QjlhaOKjd1IRYfQYBxw6r1JRkVPAzD0Ck5b1B5NH5bLh59Mg0OGc8y8Fs/Tk+KSF/fYOJpGG/dZLxFJj7YwqAARZLPcvJNN/kv4PdwvZhlq+Gz8qzfNrmt8R7shmXtqPvp6iD+SjRIvKEt/AM8Ce3t0qbvt0SjVvdFnUzQ76gzuu1A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAozpjMnbvohZr/CGH/jx2ebmrQwOjq1KQoufBKv8/w=;
 b=BK54tKjpHUXzFLYCbbkWh2YtRfsS8kLPbyYAMbSS/s7/7tkASBzV6DxoIOy5ZqEqSr4RTKIikv153NtSV9c6TRkJJVTUMlvVhg4LS+4Ku4iFbbOmchI9/sYMVD+74HYlf51j7M80iD49mWKsKZGk6Pu2TtFFZdN25BpyMWtYM+iLYgt88BBSBRcO0NqY9rdZyH+kdGWoq8d26HcRRlwirKdUz9IlypdurLSCLAVRQZFHae/Sp5z6GcfRJc8RSdH1rikDOHcQbiy1qCHWPaWESjKL0OAbrA1OBaJRS5stzuO6amAN9U5+uhDc8jVG5TydVHDfUb1nprmHwzCcMCXSSg==
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
 bh=bAozpjMnbvohZr/CGH/jx2ebmrQwOjq1KQoufBKv8/w=;
 b=vo7pKLdWcbhZJLjSRc7rY1BVwHlb77HH7ZCoIdGyuZj7St6o+Hv6+M+fpSF7I+zno+kCH+HSPkDM74hsiHDZ7iW2XCi+/oypOyRItZ+zTalfBf/IVaRnhYpfMYkn1hUj2QlJG1IXoyFa9q7MWf5G3nV0PKU891J/uR5DdYhX9HeKDRuR686NrZ1glJWYpBSaH6j3Rmg9BPP2xB5k9askcZTE6HuejMxf97sJRaSiAZIZyBkDwFvj6zFcaVGRHVjHiy45VmdPoUS9VGmyN9cbMMMOxtzKyM2t0oVcr3C0SoU9sXoyFc3eZ3xI4flbkj7dVnai8ZLhFieh5Vm5ZsDPNg==
Received: from DU2PR04CA0267.eurprd04.prod.outlook.com (2603:10a6:10:28e::32)
 by DUZPR04MB10064.eurprd04.prod.outlook.com (2603:10a6:10:4d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Fri, 4 Sep 2026
 11:56:52 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::14) by DU2PR04CA0267.outlook.office365.com
 (2603:10a6:10:28e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 11:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:56:52 +0000
Received: from emails-2528477-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-87.eu-west-1.compute.internal [10.20.6.87])
	by mta-outgoing-dlp-272-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id F236181D7A;
	Fri,  4 Sep 2026 11:56:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523011;
 b=So2rez/TaOUFpi1IWO/+8op8xKVkG3ufewoF8JPmPuUzL92YoylMgAS4aRxrAj2FkMoOp
 XDU2sw2BsXM7EeVBaQpqyWMA19ReAGMzmyeBEiw0fhp8dVAbhKLyJToaJpRqlERy4FzKXyP
 u30jpSXy+AFoEYH7WZINBKOvaZGHZ2E=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523011; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=bAozpjMnbvohZr/CGH/jx2ebmrQwOjq1KQoufBKv8/w=;
 b=H+UnyH1rAAbnqnwqaKNnn9cPjQvCm9pQweVJ8fP7J3LA7egsWWWp1BDh8u554EVW3bde0
 zt0ZtZMLtIVrspySVaxfLlzbt0Oh0sa0KGqmGby7kOqaZIHeqT5oeIGx7WY9yQKs7zw/mzK
 BjcjPvBmbpT9II29wnCGCSKfAqu7k2Y=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAozpjMnbvohZr/CGH/jx2ebmrQwOjq1KQoufBKv8/w=;
 b=vo7pKLdWcbhZJLjSRc7rY1BVwHlb77HH7ZCoIdGyuZj7St6o+Hv6+M+fpSF7I+zno+kCH+HSPkDM74hsiHDZ7iW2XCi+/oypOyRItZ+zTalfBf/IVaRnhYpfMYkn1hUj2QlJG1IXoyFa9q7MWf5G3nV0PKU891J/uR5DdYhX9HeKDRuR686NrZ1glJWYpBSaH6j3Rmg9BPP2xB5k9askcZTE6HuejMxf97sJRaSiAZIZyBkDwFvj6zFcaVGRHVjHiy45VmdPoUS9VGmyN9cbMMMOxtzKyM2t0oVcr3C0SoU9sXoyFc3eZ3xI4flbkj7dVnai8ZLhFieh5Vm5ZsDPNg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:56:39 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:56:39 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 04 Sep 2026 13:56:26 +0200
Subject: [PATCH v8 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
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
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|DU2PEPF00028D09:EE_|DUZPR04MB10064:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee90168-c852-41b3-8b12-08df0a7b9bd1
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 sJ+apcjcSpndmbUdquO0Dw2RxviL8bP07ynzrUrOEftfgobIFQ2kUUVDqYjAc4wfolNFuErFZEug2XWYrBSzOL7mk7WVHLL08pa2lK73yVEBbidh7N9cUs6j91MjdIN/fgEUJubeIP4Sbd3i4aEsV4QQmd5yi9ql07KFsO2EQJBdjEkelKHgjzpu2NhqA2UKKRnpbuyIbroi2OwiGKo1HaUxbUoV3kyELoZUBE24Deryyn1bfYRAtXw6ZvOXpwRGexI34kFBGcisSjrhWvIBLx6teX0FsV5I+skpVFyohbah1ElrHJSQ4NGXYuC5tNQwggeHjDagqH7S8WHIBmPp/mCz7yhAtSyNlK0dRdIQ4ot921vfTp+m+BjujvEdEMkIouFX/xgbPBv/86fsIHo6b/mSQoAAfc5kAPkf1sQkuN5LZ6Kpq/4cV1CXDYSrr3ejVPVosRon7mYbhG5nS0iu7iO/75lHITaBIoJOtnt4PRQdt2w219PpclAB4h5m098t35wQIh/TjtEra+JvWsulCNfzK+QgbEdDsjaS/AefW8zlqQictp5M+dLvV0rT768v2eEgZRLJn8GBJTNHFM1K03H7xqZ3+dBuiUme+RivWTnuaktZgtqR6g43hQvo1ZGlTk7jN2S8tSOfslTP1HtSW5NRc3pcifX8pwVp/4Wwu9U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 De1g72lRSrShaNgLQWriT5iH3U+ed4YL4joVXiP9RzguBXjWcLNLjqsAslRJ1uBHi/LBYbfO8qMScwO1w6g/v04t1yCywmoaMmwAhZzRMwdd2Kq1EaT95hrjGabBNMrDw6h0Fa28Fs6xjDUouJK+tgGM+czhgSaUPe+eXeq5LHFnwm3VtRdHX6Fpud5ty6nnRSIChuiI8K3mQEp4rzTO0PBGp3IvY7CYEMIJiUnZLEN6juZ04jwKJCymOSOF1OoBo6coU0cmgdM/eI5gIViXQnRjN+gTzYHWOnqETJu8EzcyXJ2W3ksykmanPUcK4sCcj1jZg5qWB4HaY3ESEyqr+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 566498941d16487ab721a9be9b4c033f:solidrun,office365_emails,sent,inline:284ae8a1cf75927e32739ded676cd9cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWlAHXju6if8qNrQGFQllhnzi5YISkTcXmf889GPhkZHwlE909tgqlVaxP2gY4r9b3XPIQYdVDd611pdmWsm2ak4bRkjVjsZWbqLUG8ulB6xAlh7UY4o1r0++Nc5jSGWEzB1QXsexNBJyKVOXRM65FBk/Jf0Utq2KA4Tus5DbWbilaO9EKtzNcHVHkbE95unOVV63nqfSRdsVd50Lrr4TnyMyRUvyvbIz4vKCBgz4zUE/OqUkmbbyvNW4vLbFlhTJRof3ClxLf3+rJswSSk32m+kc5PtVIAjjrgLoE/ytYHLlsYv9XtEUyyixFRT/VUwUpcAadqVxRk7nkiXqQkPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAozpjMnbvohZr/CGH/jx2ebmrQwOjq1KQoufBKv8/w=;
 b=mpdy3pb+vm2O14Jb8IBN5I7hH1vyhWu5a3V+GYGIkuWQdtkvT3SQXDJ4pHjnJGWUVSrga+Bs6u2UmaAn1d+TkiL4pNi1NiOuTH9ThP/8a2ghmsGI6LIl06HgPW0FXGQZ9VH46NmsnYLMHqi27tp8eJkLvL2NJgL8k7nE95NFcesvoabRaGW+UeZh6PGBjyIBHcCRRYf8pdTaP60dO88yd1lBjJWvwd6fAHiS1WOI0h0cMI6Hggbv72UB9pjhjIA9pfnMrThQ504+ZO5xdHNTtZzPcr2ZzTR/fQtdO4Nwgi7LyGdxihzIEDjfq4vtDYdoAdtFLSZcxzg13fehMqwX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2aaf557d-cf30-4083-dce3-08df0a7b9308
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|35042699022|7416014|36860700016|82310400026|23010399003|14060799003|22082099003|18002099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	KFuAzrXROYU+Sks/RSwlxGGsN9aLm9XoBAxnMQnKTihU8HiVXpk0RVYaUAtPY0PS9zT8Cbhp41XfYv6ZlQzIzSlpSeQeePictW0roVBjNoJHvwruDO3ffzO2Ge2agBRt+1odESWtTi4FwuH3dgA4qq+4Co/QSnUt26GKlb+TM6iEbs9AXMWOpkocl+fSbPVXt1e2zqeRgrJtLblPSJXG9++lm1HJDflzU4coSUAKz0MeMc0U2zBETFejCXr79OMxsqr+43h7mbpdfBe3lt35TWpxIxIWw40PExO3buTtm/sQf/ASq1I5ZU49a7xESuq6WuDB3zg8889Q3OtCvvxOjrdNuQvaq29v6GMVEZL/rc/vTY7O01CeFjQJbawWYD8Ok97es5L99RI5s80wgdP4dkVYiZ7kVdL0qTGQrcadQ2VL69uiiBS1MrgJzF9xnwvUUIubeCC4jnwo0LEfS0BB2vptU/78XJApeUr6sF2oz7Z1+N1853vpi0PyS3/tf2Lq0qp6Na3F3jJF3wiXr2So6uaLJWGgox7R74V1/M4DMGwyejoKgrIrwveU+mXuc4A2Ma8Ub2e2KCRQ+Un7rUSdru119ejrGPLBUENSFrGPccuO1anwcLz7RD5pdYppw3C910g4m/JZXKXdYeMhiTcHt+4Skphn9Fgl90xUO8fY+ps=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(7416014)(36860700016)(82310400026)(23010399003)(14060799003)(22082099003)(18002099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s2IGPHPRacKjZfl0pGJJ4moGs16GTzTsd2HTqj3np60LiGlD/i178yqwNAt/SHCw56uYUrNYMOz8m3khNhV4zgkNgYPH0iRLiqe8LqFjTkjRikMKOJFbIq6IBMg5/9BL/r0/D+sj8lu6pH7KQp4E8LmrevVmENbX/U5aQrv0fyf59fTW6gBFya5HroAx2TS8Xh+V2EqHPovLBHjQUco72Xt4iglqEqX60tcfZsPrl1ysd81YxBE+5WPom5shAHZTlGxIYaPl2w0hKiRjN6i1EkmwR3KhUYu7dmB92R04wFfd8fBVp2bvkSaxQPOEC7vZdnKOmt3Sz/PxbDaVZceIxnrQuTJ16F7kr29Mu8EmJ5rnduD8OUdqrbCd1xjOiYqbJXgryvljgssylTNTWd4anqMz2EShERVXNBC9sK1OmR8jTRFO4WYHjvM7p0xwPVGX
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:52.0929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee90168-c852-41b3-8b12-08df0a7b9bd1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10064

The SolidRun HummingBoard IIoT features a DSI connector supporting
touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
SoMs.

Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.

Add the addon in Makefile for all supported SoMs SoC targets.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  8 +++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso | 79 ++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 69b1f75156016..0bc2bbff9370f 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -170,6 +170,8 @@ r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
 r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
 r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
@@ -186,6 +188,9 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-emmc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-microsd.dtbo
 r9a07g044l2-hummingboard-iiot-microsd-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-a.dtbo
 r9a07g044l2-hummingboard-iiot-rs485-a-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
@@ -205,6 +210,9 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-microsd.dtbo
 r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
 r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 0000000000000..f8584c473fafe
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		/*
+		 * Touchscreen fires short active-low pulses which level trigger
+		 * on i2c gpio expander can miss. Trigger on falling edge instead.
+		 */
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&dsi_backlight>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+
+		port {
+			dsi_in_panel: endpoint {
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&dsi_in_panel>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};

-- 
2.51.0

