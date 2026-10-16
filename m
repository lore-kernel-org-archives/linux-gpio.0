Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4156530C14A;
	Fri, 16 Oct 2026 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142927; cv=fail; b=KmUogR1Yb2RcGkb+90QX/XSfv7na+KRdW0QSMMuPxiukSrjMSEkLQ0Ng4G+s0w6hbHgIj0bnWU+C0+LSJENFyVR+aPGJI6D9Mbgv7oaJX2Gf1JslUdl8jhXKSqf70aq4A3xW9FSG5f7JGQa+vs9v634iWT4cjvJ7uHyGY+8qPyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142927; c=relaxed/simple;
	bh=4dZai55rMTK7fq41ksR533mZzBBx9BnrYtuWuW2X/qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nI84gTfWWKbeI40+YHIQrYid43RO82kqJTNodyQgusovIMFjbb1Ei1rBDdnLRw35aP4hiOBDoq8WQOMAb8xwdHw4qWgJjFLiDEStBBvjpbROjdxYBIVyOmi8O2jJhaAcd0D5UprClsrJEnksgsItaskONdNi1k7P5H8LBr3uMe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QDd5MQKT; arc=fail smtp.client-ip=40.93.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QDd5MQKT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ow7uGyNvdjh4Bu8obfEZsv5RiIP/b87rr9rTgUzdFQkW2jGb18aa/xXeVbu6VYICnlP6nL9DhcIYCAA7r/dM7nTCkwtlC9Q0n3nY6aNZ5D4S2h3hIcHuJJokcmSEM7VIodZwoppvl6eosn7d2NOX7XEsRNXWfhe2RC958SYH/L2J5WzUNNj9zD+f9Ubt6n+tgCBzBczdBK0DajkON3Exot2qo1cbYwnTnBTsw03aX0bBx1pHHlj+6KaUczxZbQ0QdIpT8Jt0+tJhDP2NmpJBXzKt3a0Y+/7E6Dm1lboLQaqN52lrDF0qC1PbHOk/PKzU9IHXs0s0z5/Deql6YEZk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dZai55rMTK7fq41ksR533mZzBBx9BnrYtuWuW2X/qQ=;
 b=ouFRvKMvnQv25vMeD4yE0/A6Teul2PRosVvYHjLJHf3kzOOAd5U0YHyQNLTDpsqOCn544gincEKiXyhth0uBbTBqXj6EBly9tfTqayKERsyUzYmvESkspN+2AM6tFWPlKEJ7QHynEISz+wx036hYyozHnUWp4a5qo/kjzmD7XgFUG/N89NnvtXUIZyOrpQjL78EEolaN4JGZ0Cj4ao1jyZmtUNESPdWpkthcMaonfY1PEevB6iJSV1FF222pot8NlSOT0rsjF15TsuenUj7ILnrXw3dvxNGHduHHrl8eNsYa3M0xRHVoM+O1qJQHkiPNtgIOOxOmZMnTIp0rSOfwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dZai55rMTK7fq41ksR533mZzBBx9BnrYtuWuW2X/qQ=;
 b=QDd5MQKTBxgulIj/jfO64trtn8DDOqidqkVDURFehsx88fO7GuQWZ0haOAD8mdwaNTOkNp1FrNZDgTz0ekGeBQxBw+OWoKyd9YKcZlMJDSqgErjEgsiZvfSpcmbwbPn7uHOIRe78ZT7RiJcgbGll5+pQ7RiZVDk+OaiOxOsUlT4VM8S9Hf31/Sfa5u2AX3z1WTid99ZDDc+7Wk2459A1y54hMJEuXBoSTOwLelsBr+GZk46TT2ry4pJ6HnIjE+JaNbPV/2+bCjked7tWvUsJmU+koSqvpeggmilk9NvMxwfKxtzNUpnfCOwUj6SmhMo6oW0v4thvickPNAzGECkpxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:28:42 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:28:42 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 06/11] gpio: Add NVIDIA LSTP GPIO driver
Date: Fri, 16 Oct 2026 12:28:16 +0300
Message-ID: <20261016092821.2049721-5-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168501@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com> <sashiko-outbox-168501@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::18) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a85f660-0de2-4163-8e13-08df2b67de52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EXrYOkLA1y+8JGJg9EpDsN9T4xb7TKO//PByl5p1vvnm9ZkjwOag/dhyCuUdDzt01zSmPorSACu5of2Uu/cy8rcim1pwZdZ4oAeXwNzZ6atR1iLWYoRinaA72FDKeZC3LwPJmzu6ciOX2qkv65FPw3HahuVckfyBFMDrZDkcYnY2NI2tQDQ/APVA+hebO48sCJ6aHMEhJeUQeit5Y20hXRq3bJC4GhXfIHOK6LvSBDoM6JUtx9lQ5b6OpuRtyVK9sGqm0+7MSr1TN0mU21Sjc2y5VHUsTjbIlGMDeTGeWsPI9zCr4/ZOfj3vvRT2NEdOEbarx8WHm7xBZLtLmpVkBaVZjg//2kTZDs/8tokJq3hJaDOmOH8arCHmplbS0nXIQwoe544C0+aJvsGf8i3isGTI7K8L4udhGoxA1Scn23pJLNyABtWCQ0WfFpAjADYwSxLYosslETHT4NJmLgBNLaEv7p+RPylfljEBiExDw8azgzcpJLt6aibr2J1M2D1e6XtyZjJ5q0iLApfkuy8iSF+Tfw6MvIPx0HO8c0rh9TiaDyiJSNOrC+081ebuOk4fsk5a5vqeZLuXKVu4utlbwjVtBl6TEB5wfYQSdTQLSY9WOL3u0beeGmaxDhpXFNo46udFHpHrzHoZyUWI4PzqX5Q85sHgZjJIO8KcX/uQm6E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F21sQc2gt8R9Opmv1pcgrIgJ9pOLmfk2jUj4/OoJTgOYYzgi4rmlavsBzw/s?=
 =?us-ascii?Q?E5seTTyGh1VEPGFhNWYJF3WwjO0zjCO/T1V6VaRRNGNOllJBQbOQ3wLa5A3Q?=
 =?us-ascii?Q?34y7g44q6NCM6IKI0UXwcd5nk5P8tlZNOtYDoy/RLJybAKG/6U6a0c5798t6?=
 =?us-ascii?Q?MjRp78VJ1756f63k4JyJmhDAvPUsxigfznTYP+veg37xgKjeDTJ9Fm++XQJw?=
 =?us-ascii?Q?MpmlyP+jz6Zn1hmDN4agr4PAPhq+A/83y61Le2ZVMviuf7rHGB+K1TXihrfI?=
 =?us-ascii?Q?yjMmc8bHt8AUHmjIYoR21kXxT1faT+tZEBk5T+gmp3OgtD/2c5tlqzpjiD9i?=
 =?us-ascii?Q?ZTG3m1nAiri9XKnA5Kt1pxErbWI+9ZXEbXLXsDw9WCLvfciGsu/1NgGx6ozo?=
 =?us-ascii?Q?oBndjbSJROQZILwfj6Tn7MKx8J7rjFimtoZS3DJlPuC+hqnP8LkixF0PhSGj?=
 =?us-ascii?Q?1x31cjGt4GU56zcNEHl0+lDT/97S2Zi/OKcdU5cnApPO6UHYLEmeN6biAc3y?=
 =?us-ascii?Q?Uo8eLLYZQmMuOwgIgBW8gefAzPdt1X87g+xio6I9BxtBMLG+jkvHopafVN0X?=
 =?us-ascii?Q?XwAArf+2R+boaaPJ4WN8Vd2xohjMDCyeEeV7bgATIG3m7LTf/ZvZ4uPuk7m0?=
 =?us-ascii?Q?XZu0XHuP33ycKnFCa77fZm2XRB/zcbT5PrnZA2Pvv61jiouyzVHSfYawO/of?=
 =?us-ascii?Q?oQu4G2GgrXL1StJlhgORib8vuWTTZv6rTesfFBUltHClLmogCEh0/U65adlF?=
 =?us-ascii?Q?lLIPBoJKkDpvClI2csv8o/RUJ8zzumHsUlfR/TyRJMNRpSyORrKtCGrygS6S?=
 =?us-ascii?Q?LE4AL/wZy99ryfd6f7mp7uLGWjPeL4+8vrg5BjuGx7iCjGt5QnLAUGxt9V8X?=
 =?us-ascii?Q?vSX46pPxSBDJV6AcbHoMuWMTRwaZ2CdKCnRQQDo4g5XmRLaUKqfW87yNWIPu?=
 =?us-ascii?Q?YPwpnR7tt6Gafr59kIbAQCXDjH1FwRiHfx6BY82/W5YDuuPW/pt/fzsZV8ZZ?=
 =?us-ascii?Q?HzS+gQOfQLdy7WAS3kegcaV+PmcOM6noUTJdWIu6GuaWtamVt1+7eiSjbHzR?=
 =?us-ascii?Q?VfJC5GtF4fRI4/MSsoMVKCDDSxdnC5jhV++JoKDTjttr+aZDIEWGRna1TQx0?=
 =?us-ascii?Q?jsFtc1Ceql3L8kyMig4fgIqVWOxupsRfhQNPwUPl02nfeshZ0Pa3Qm/pqXCr?=
 =?us-ascii?Q?V60QEe/ReaB9YH2VHz+PMI4OAzUO1TysYtddBzzlY+uc8QGx72NEhkGtWTV3?=
 =?us-ascii?Q?hqdrlfl516sSqvjQuP4rvGIjg+FUBj5edHHSwFHtFpPbdOHYEjeSw/Y4uWnR?=
 =?us-ascii?Q?OZ8cLneLaJ4JFOJh/vimrqn8Rs8avujfLrgqf3Vz9Cs5nAepCMybijLxVlbJ?=
 =?us-ascii?Q?51e2gDuGYiADD47/WzXcYIGBKCsLdwz14ho1a2aT1JWzTetVOujgXtNicvUx?=
 =?us-ascii?Q?HGHc1YpnikmN1FfHpPtY07jTlW2ZP8iYlOXygeACZBeUQ1IAeoXSeInjsRZv?=
 =?us-ascii?Q?cnRxOZ32X7iNUTbN9CiG/vry2Z5wXXz0sroOONqeHMZDTdIetnL7x5B5xmmB?=
 =?us-ascii?Q?gpepmOVH13iOYMH0dhEs+nzkDThVZLMQvFCGyZ2FWQY4EWd4s1T1/aGGf/Vs?=
 =?us-ascii?Q?B8jdaVSf5K9uuQokN5MqFe2zGI2V6OyU31wCTr71goPHjoco3aotf3IgEocP?=
 =?us-ascii?Q?zZ121IdL4yk9ab0Y+ZG1dS0GO5p+M5Ls8bOzgaKlghqAPANdyHxQ+9hKvJ4O?=
 =?us-ascii?Q?YGWpFBgUiw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a85f660-0de2-4163-8e13-08df2b67de52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:28:42.2128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh/CVSnFTU6lyWA02vdiENZ8mk2sxLu/7nZkNwl+KnOOwHxGcYTUIuEOzJBgaEWudKKJLvdblPAPoarRM0yDZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

On Mon, Oct 12, 2026 at 05:53:50PM +0000, sashiko-bot@kernel.org wrote:
> Returning to unmapped memory causes a kernel panic. A device release function
> must not wake the module_exit thread that unloads its own code.

Yes, this is real, and it is the same problem as in the core driver
(patch 5). It will be fixed in v2.

Adrian
