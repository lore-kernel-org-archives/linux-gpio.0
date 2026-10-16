Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628C43839B9;
	Fri, 16 Oct 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142909; cv=fail; b=nuJlMzo0gfc4QQEVLjVNoOmfWbrHO89awfNX68iP1V9uzklQuJCq9wwL2TBq6wnXNGU+9T8O7NRV76VMQ4wwAksBvUha3SkZIlt0MqNMNsqWWPkWt2Zl8rk8r23dJrIAr+Vo7va6Ufty0A4KaDSe5qSlDMxtKvRtOVVE9ZIsdDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142909; c=relaxed/simple;
	bh=OAytWAiMqG+WOiBCFnOLcO09oQ/b+XcRPLd2wcJ7XgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZFRO3D9oN/QBEVra6sivbBiWJtos+pW0TqFtZ1g5+NJ0W/xetF9PNyKmnqxjVWnb8LnChtUfKO9xf9tGuXpu9oC009G334O7O+o+4KBpAar3ulDaeRqUn14TxFMqDVIkex+FS+CJPoGVMq1xPl1VY9HTQPOOIFU/GulwCNLKEFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dGCnRoFp; arc=fail smtp.client-ip=52.101.52.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dGCnRoFp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwYHqGxHEGExW0hAg3mMWLz5PQUYQwu3VY4hbaqBwI7DUG2f6qqP+ry6NNV5U3wE2zMTqRUgGYoVVUhkfjxaFHtmogel/7ff2Yjo6yyksCskqUhGBO32rmks6CXtQrgMFDXGy5qQek9bgl7tRYNSBZJZMdd2hjlVZqa2gzFzWtiAQOoVKUiO0tGtdET6jTI6L6jfDrhwIiywQqFzs+TK9yNW4HtkpSKhpbRdjGl7iE2EuB7dWxhlFdnOGJVseQU+pYeaTRRCbCZPoyuXs9Rr0emYDih8fJSntKl4fbqG17V0k+bNjNoAZ9PD4zGwhaJFla9gm9kdAolWNaxEekyBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAytWAiMqG+WOiBCFnOLcO09oQ/b+XcRPLd2wcJ7XgI=;
 b=mIDTYfuu9Olm0RKpaMml4Z0mhDAT8URGU6vqE6acWdH4lxNtQwqHsD+NhKSK1JyhZ81F/ANoz8A8JGb15VQMN8W/++Oge3aJCfXtKjnGlpCCN/iiITLAx00eDIGIvY/bjVbZTCHyOS15DW7rFTooczvjTVOfT2PDVv1s6w0kvupLXUwvS9xRXZCOjTk2ssmA1ixFrghJ7dSJa0NGg6UfhzPWyZ1usV5eA6/rCgOM/8Szc5RrZP8XI3lbNqwjDpA1HBqoHcgtAhdx1BILnGSXTKIwzwfeqj92civzqmvAk0uduyRGG3CLCox9fyIKb95/64mgmQQ+DP3MeIrZZPcyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAytWAiMqG+WOiBCFnOLcO09oQ/b+XcRPLd2wcJ7XgI=;
 b=dGCnRoFpYCZCyAmVf5oK1pC+DzwKHz4VewLsU0yJuA0Ka071F8CypicGTH6EW0cvhEszjaX4MBv/W53DMeYalFPz4P7nkwvCVcPwfSxBC6/bZfe45bND14aE1GRUyvjRrW80616mRbprnaVI/JrsAWC7zn9htgukapxXurWOo1zEgx9Dx4/xXqN8xcPRvqdxj4XIQz8TkcrQFfwGH2MYk3KVIDJVGpmtU1YFGnopQSHpqA+RHJ4aHoSp4icHtwyl6qqOAWVmZfiDIJtW5illaGP6ivtBu8kEosq9EfZwgzbdvG4DPHX7xg73FBmWYtiCuwtxoH/2/kYjvTTLH85Hig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:28:25 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:28:25 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: gpio: Add NVIDIA LSTP GPIO
Date: Fri, 16 Oct 2026 12:28:12 +0300
Message-ID: <20261016092821.2049721-1-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168484@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-1-aambrozewicz@nvidia.com> <sashiko-outbox-168484@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::14) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a2cd86-a4aa-4000-7d16-08df2b67d405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|261009223027099003|260925021311599003|260925022911599003|260925021911599003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EsIUbJwCclafOZecZtpnpSgsplgh3zFku2l//iK9Q3JYdR5GmUN45swjdww42bOe/1oNqED2D+aazz4MCAQIfHgP/ChQc+3yQgBmDtdItQvrLNHmoFAHWDI8UJHi1PH3UIxkVHGyfjgNArUuTsopfZH/eWuXkIOLtb3dtI/DT9235DA8JvhQjL0DfMIHCMhKoVB/OszYX2x+8/v5lznhSZR8FYkInMmcDAlIPS52sJlXq90BwuZOJTw1BON52gDlghF1apnHiX5m3DvlP3Y+0YeSyaV9axO7l4PtGPbgRzypZLnjAwOupRbRtL5LJsrUKi1MqCSTPi+9DXRSXxX4HvZDhHiP6YMrKvvz/RTKSVAeyjIwEtwVcJtQAWyeZSsra21OxQ+qU2vd1IVw3X1Q5zVD++lHv6UmUOjk6/TTsOSLZM9hn6NH7LED5MQuBiBWca32lPpArne7s9VeSTCozMVofshyUcKjbBONdJpNJWsjQ4wBvg5APuRMoEDWr0TMBh58gHPcYxhJe09qGGgzRAGjcY83bkcPx5d3SILlgx2Nj6XnC2D3BOGr0Re8l6Im+SPWkOfuT19cgSLv6glOZKfYGjbbVH8m84r2q4TCbzPm+XMSBEvk/Z3/aOxkRZOIwtIMpGgiUGX61SJqRyl0Xk3APIs0YPoIR12NfT02SXY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vTAFlH2En5cDREXd9EvcAG05OzmA1n1bfzey+xNvP8RFntOoe4W7oaCFiZl+?=
 =?us-ascii?Q?lLaqshrgBzGzgYb2S1Gw3+7Lfhptmw0sPx6+01fgjMfrWMZi1K801WcPmQkp?=
 =?us-ascii?Q?HoQDeGl6tJNqQVM7NEGfyeKASHvoNkgW4Ym5MSq+CCFfr7nBvXOi5KupmkGv?=
 =?us-ascii?Q?qzA38wXSgwZqYAZdaO5AYoeOCY/QNsuuhfgCpF2RQdPuVFi+DLMRFI6OcPJz?=
 =?us-ascii?Q?fS/b4zaaRsiRG5aS12GjqBP7jG5w+r6x/gJmZtWYwDDazMAMUwDWBSaZaY9y?=
 =?us-ascii?Q?n8KN3ayB1UvQNHVPHfXkLg87Ppv2Z+W63eH6GCAFrmY9592zid4OMYNqQDft?=
 =?us-ascii?Q?B5vo6lGhYHhxUmgHZywtnB++/C16aKRQzjtZ6WkkFc7u01ChZw7Q9bSk8MMy?=
 =?us-ascii?Q?H1G2caRVfivC16p67OQE0wYcgbZmOZile3GHsUoTwl3iZU5FN+A3T+y0Q0Bw?=
 =?us-ascii?Q?IS19akEL3w9Wq2DgGR640uNfCDoOuX110bJTSa1tEPCRLseYDOddNjlrOZU+?=
 =?us-ascii?Q?l+l1ITJ8v4gxPgAjOHxDoTmo4dRaU1+B0ECJF76DjwPOJAewONIeDQScbrOW?=
 =?us-ascii?Q?AgL/pFWid1yBXjU6oz6xs7lpgsH5XCUN8cHzwyre8pyj8Xbzc3FMuhMrXhbk?=
 =?us-ascii?Q?dhx9hO+T2gGzsRRhF8yohqDloR4z35MALxnEV+2PQ+JS+1hD7Ijss7rdWd00?=
 =?us-ascii?Q?qm7gIIyy/rjP4Y7swF0njs3vy+wvpojTS0WooUG+KwZnAHOoPYJvC4H3UOia?=
 =?us-ascii?Q?xtvj9KxRNXKzly+5XZ2cFn+n0NuvDPnVGPEHSIyzf78rY0WaEF4jdll3/uDw?=
 =?us-ascii?Q?s2vUoM7mlGZJ8gu431CuYBub//bZaxL1PPwVNse6mmK6Od2+6QAv+97UOg0a?=
 =?us-ascii?Q?3MpURBNhV/qL8Lj+oDywU3wWTRLwoq08tZnj0spCLWA1muTfkvWZ19TYhUS1?=
 =?us-ascii?Q?ZOhDJ3zPagGMtFxY+7VYNkU+SI7aQH7U7FW5MubWR+mAo/icp0PZ2EgVe+Ug?=
 =?us-ascii?Q?FkFElNNcLmh3rR/zW1NmBl0lvtijr97FXREyNLtBflfotSZiG4GpmcOndc+L?=
 =?us-ascii?Q?vd2nftcTV9PeOslf1xj4qz29dRr6yNsRvktPnHe6Ad2WBMTmWM3xiotPF3jy?=
 =?us-ascii?Q?V7JI89Oo5+gm751bT3U4Xfk5G/p2lCHiLOsBRVe0yPUkVl6uPiDRhwbUEbcW?=
 =?us-ascii?Q?LW259zotw1fWcF8gs0l4M0KxJJtkTCJBIFIjbHh5Z1P29hzyl8WPeVdhpPLC?=
 =?us-ascii?Q?Zl/y6wsNx/FuzJ4fv/moVtZQlAzADrqW6ZN9cI1nHu1jjYf/1XWRvUskikq+?=
 =?us-ascii?Q?X0nY0+4e5dRn1zo+wtJyX/SBani5bfF0VCDz9WDccOsMyupHi65W9+6izR15?=
 =?us-ascii?Q?z4JoX8Q9ZQAFMQgxrutHqdnb0uiW2bulkvfH4Db2BSskwHMzUc9pSoLwRifX?=
 =?us-ascii?Q?AcXzugh27kfkkkHvP67toD8h+gLBZrpAIeIg8qE5Wqgo60+mJ5MoVfUwpHeu?=
 =?us-ascii?Q?a4nzneaJYrPW7ZZCEoMhRsRcJ32xLXpNicPVLlKAiR0hMV5PX4jOJMmKlhNY?=
 =?us-ascii?Q?ib/7PhocA9loTyF8uDF/xQGG3omfgKz73kzO+2dxnaIHBCB4nKKl4etfzOhW?=
 =?us-ascii?Q?SVmRUJEWvHN7/Pg/eRJPI9BV5hf3qXYoEQLnP17h6F+DUrOmmifAjpSANS3R?=
 =?us-ascii?Q?i2XoUaYGRbhXc0lWz03iARUQsrjacNmSxOUjexORyz57WdKPAGw3IaQAJjc9?=
 =?us-ascii?Q?PAdrqVHYgQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a2cd86-a4aa-4000-7d16-08df2b67d405
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:28:24.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7b0hBvVuIevkIv0H1VT3obRVvtCwOhPMckFtbT4x5RF7Ht6tBYOAgA6n+R5L+kVOTffv2COxL9FWtr+R1op3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

On Mon, Oct 12, 2026 at 05:43:41PM +0000, sashiko-bot@kernel.org wrote:
> Should interrupt-controller and #interrupt-cells be moved from
> dependentRequired into this unconditional required list?

Noted. Whether these bindings stay is being discussed on the cover
letter [1] and in the RFC [2]; I'll handle this together with
Krzysztof's comments on the bindings once that is settled.

[1] https://lore.kernel.org/r/2026101355-species-glance-9ff8@gregkh
[2] https://lore.kernel.org/r/20261012-lstp-dt-rfc-v1-aambrozewicz@nvidia.com

Adrian
