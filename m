Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792504467;
	b=pqYpUQYttVU7S3uev41MkAkcUJBo8AgmJ4Tx5cvqKFKWWjgg/tA87cXVFmlHk80ur9LR
	 zRLOZXz9ao31Q15Qf5Fm16rNWLwnBwypcW7VTGwqh75LZjvWnawa06z4BuRfV2Ql9YmbF
	 ZnGl+fU1z6On+9/s2ymelCKa3URtwtUAYFMhK/Y+b66H2pL19tUY5j4m0xhs8JiDUKMKk
	 Ui1lBVacE2mTZn4udmSuBpmZ0eEOP98nld49nRDi+iUIFssunJGSK4/VhmrdfDth5DkCV
	 XBuVX55lcO0dR4SHBiXr1Wn5jb5oHRce5oPZs/uPT1FA3Gr/VNPafWKmV2VEeZFf8CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504467;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Yox76MmSLQNzY4vXnUV2RBx6MN/aCL79HirjtHAwi/A=;
	b=lzRkxFroSs6YGrjQy3BtOGs+T4ITfcxAW5q55ng4A3eg9o+/dZqe6M95qGSvtFuG4G8F
	 garRlUaUkUlffUhilXTzcESLgKg4tEVF3FkL/AKN8OT/BLMFcvAUNhB2V4LhYZ2Mi3fTj
	 cVGiyMQUeVKnh8+Z03zSKjv183sbkqnR8Eno2SmnhEthjUaUL4wHHo3qHTU2yG3phel+G
	 UxZVXKppAIrDcirjfLh0MFBA7Wwc81F0InxJQwP3sSJeXZw+8Zj/M5tCi3trVyyzPlvpA
	 e9tcA/sjc9S5CnMRsaOR8vnjp+BluuQrh9UrzfKflUzrCJ8CcF8BfMM+ODK9FmBn2hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ctwu0qRW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.68
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7A606A319;
	Tue, 20 Oct 2026 13:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F7A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ctwu0qRW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msJKkCowKtepx0cGK4KaYkLJyP/5Xl1Vv2uwKKS3QeWbZl36gp5V50LNYd4KG223W9sVkcojrqtinB62d5tDMkEBPjAgTUmsiJiEgsZHjimL6qZFSpyy9eIk1Htno+ExMF72rQ0iS3dTn5Ntm2m/h9fyfX/aiZWj6qn9MK0GsTo9zyFyLDW6DRhJVZL2S6ZcxdnWmgwclSlvvvorh4ldZF+qoX2Gp0I6EDHmLsI7FSt+zM5eKpCoUMnkA5mh7Rx6msqEt4r+JR0+XKB4huECnAiaK88FE7OA6gmNnNiPjLz2ywfgHeNHwUu7ie5URsKPHTX6Rwpvq4KEH34DavqnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yox76MmSLQNzY4vXnUV2RBx6MN/aCL79HirjtHAwi/A=;
 b=O9ABi1z8z5cPpDkKX8fMKbzXeKQSNoc5VB2kGPgohl0ZFzYx/XXGHTQVF3k7Lym53h2CH2amf3T1b3MaCGOycrO46+2AXzieTNMNVysPD8/3Lv99Zmo43EhfEqXVtruLlhn4tIWCmxnxxCYz0LRut7zecNabVaWFuRth5TQqXnOjTBtXpUBEfC/zYOFr7sdojmQ6ck5F21AgeeCRiTrgyQH5M7GnakhppVBelF1Sl4vPvB7IVv2VWG0rtTpe4UaSg0UerXwmy9jACa0jYrbprIT78GQ8k+/feDxNlYzIwP07Se8fm283BSBXoxMOJvUg7QeuGhEXyoI5xtzfpJtErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yox76MmSLQNzY4vXnUV2RBx6MN/aCL79HirjtHAwi/A=;
 b=ctwu0qRWJq6o+atUjkudpkHYTyR3uM2tzs+ck9oaBpG/vkm7d4j+rGdtOpa6v4AiMbkfFRYSZzu1TaZdJTm9hLyK+0LyJJRYLfDXKSuUkOR7TqirFzdB5HaIyWbd8sH68WU51eVNS57650Km7vJQHvHaG3f3rmzNhiOhWJK6+GpfL8cOa/t3UJybmc7PjgmsaS4lOa5AZM46yO5zLtjJyRyvkSVlH7PwILGrVDefKwWfarnjwd9J0OnWNwxqS/V7p+FL2HsBwcXU7ZQWhuvj8gjkGvBBMlCw0xc/3n+X6Gf2iORDVJ4ZcnzmAU11XJnqOM/24JmYlbN5HtyQrPa+xA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by PH8PR12MB6866.namprd12.prod.outlook.com (2603:10b6:510:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 13:53:52 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 13:53:52 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Donald Shannon <donalds@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-usb@vger.kernel.org,
	llvm@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 06/11] gpio: Add NVIDIA LSTP GPIO driver
Date: Tue, 20 Oct 2026 16:53:44 +0300
Message-ID: <20261020135342.2963044-4-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLkQd70V+wQhCaKES8LQqWoU+dmt=Dr0PgbA81xHh+hppw@mail.gmail.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com> <CAD++jLkru2AL2_7ieOdbYrePAhNSFaa3wwEzCagiPsALgG2GwQ@mail.gmail.com> <20261016081917.1958681-4-aambrozewicz@nvidia.com> <CAD++jLkQd70V+wQhCaKES8LQqWoU+dmt=Dr0PgbA81xHh+hppw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0017.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::7)
 To PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|PH8PR12MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: bd796df1-0e32-4508-9003-08df2eb1934f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|22082099003|18002099003|4143699003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	epUOf/Lr0j8aFEwqlFbOL9v4g85s/sxyQiNL/YgYwR7nKSmRqdoOa05hRpC2v04Tt+KM1JcnzRYNAxTj3XVLDlzsK/TKq4fRCMVXr4ZaxQAra4sgUq6ngq+saDrPHzxjxvvp6X4NWpNS2mXxxWob18x127CKPPMkpMmDB1D1DcS6QaquhMbslClafC9ueYbf/Tpd+sXs6XY7SLEeW82Y2tZ7oBXaDOcWi86+45iejqHwB0GybLFHTyJRKBfOAK4Cf8MgaP+uu8sffZCtsep3jUZAwhnROYuHahYPwKsskVpw6PX9mqU/wu3mBe2+UKT1Yxyh6TqBVs6jpJGUc9Vu+zDbC/rbfcBPU3M5VgfUKBg9WzXiOURPIn15XXZM149noX8DxaZTH/o7Kwmz2mZIkzYA+Vy2nqJ5095UE6w9Zr8RaDWo6Id32q0HaeIj36LsLMPrCTSvk5WO3zUjNtkhWc2c+d7fZZM2Mo+XkpHHiH+Gn1H5tR0omjlqtIcZxjAunrw3ciSsL68E0Ihf3spxdFnmwkJ10zT+lbZ724HYWjdCuG83E4OGd03GEC6gZetca89GiUbL00hQCgkK51IMI7Jx7lUSK0qAsq7PxGSDCQCfEiF1hutOyoCWOAmwgDw+aPHvMnbg6HTz678Ew60qbGfKCM2JQ68DSlVMe5CGfQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LMzreooZlVLk6ANcJ14QQ0Ng2UnuofLh7bSeew8PP6Giti7JrXmWeACuVPhy?=
 =?us-ascii?Q?6vFOLh64Pbw+44bZcXwgf5zjrHmVrkElKrsqHv3Lfpx3L+lHjGC03vCU40vS?=
 =?us-ascii?Q?8YLcfBrKh23WBJ0g+6HaSI/0B4YlK2MsbLlhFEas/CQqiofAXp0HHrJRP47L?=
 =?us-ascii?Q?ov8TqC3md3OqAgAQnQj6TmvgJvaP+L6LlfFTWAihBNym7fQzYOKpwYNullPO?=
 =?us-ascii?Q?XPdPd+F1yXEhHVOIEIeLpQxySbWny48ruOZX+l9L6nYxf+Kkg4FFY/ZARlDc?=
 =?us-ascii?Q?8E7RLVR5REj9So8AgUf27PvMoglKZSAJdplbPcDmg6itkJuCmP43HQiXA5s0?=
 =?us-ascii?Q?2A7bFFzDdoxDDRK+kcnU9FbtGo4OGhpcdbRl91ipj9DcozqZ4/U0+VL4QD+A?=
 =?us-ascii?Q?94nrfpfFTmCSFJIW0RC47akalnQokGVgogPhqEh+bAQxMQbzr8R7FWLbDly+?=
 =?us-ascii?Q?TRYhLaaRog9AyKePwIOdSWMula0vYWHMzTrbv//rrsSQArjv5/UNZBETg0l8?=
 =?us-ascii?Q?5EvNFy2KwtFGItvNlKKTgnngNIO1OszZOvKnO+Xx6oGq95k9LGtjsGL0xaQa?=
 =?us-ascii?Q?EgAnROUlGCZ9MPkNwKDcDtarhPk4DJr3b5lRMn5PBFaid55aCNQZTj+vVk1q?=
 =?us-ascii?Q?K0NoCch0pl+KInIHzzfMyWaDS3tq5GO6yCFc2cWEIoLbt4aJgz14H0xXuHUu?=
 =?us-ascii?Q?47rtin7BWdPHvVeGH4TuQaeMdvdSExpuLHUOCo2Ciw0oyD+VAhW3NcAG5Xma?=
 =?us-ascii?Q?5iWPVteSfLpbLK204hY++N5gLuJipYStLvbStSv5VNQR9v+94yQj3hn39NRK?=
 =?us-ascii?Q?d1mtGHGTr000ymRdKk+ZOjDpZKZj0pSKgxqdu3EwaD2tlhqrNdqsxddmhdZE?=
 =?us-ascii?Q?QlvHUJpYYwVTqcFAXzyxiTxnOLv+ywT8PPR6SBLOfetAqG3v+PVVUAXvsoEw?=
 =?us-ascii?Q?n7rsPxdJaBg2Qsfv4xUlOvnPFCk/Gqds7bCGXzzJGx/vf7dj0nqIXq+aDGL6?=
 =?us-ascii?Q?AwJpa/FCHJwJ8HL+MJWYJITup7AVZrO0vY3lulIFVzKw1OiNHZ/CjQxTu9QX?=
 =?us-ascii?Q?JYG8/yM8cL3hL7Tmydrfmup/eq8Ebcr2UOy07qUHwT3O08cv8LBahA1EsWwJ?=
 =?us-ascii?Q?bb00JVbLfvkQlKScmLJOYzx+jk/iVg8K83vy8kYtnEh0RvCMnlL8/OZ++aIS?=
 =?us-ascii?Q?05GZ/DTiyzs5gYEKLAPRSGsSua/dBMkA9llaojjJtfFFuMxTLvhWzRNB2Aqc?=
 =?us-ascii?Q?9Rw/THNKKGH17LJPwuIvH3Vf+nzkqSvU1ZPjqL9aagY+f83VRpReKozJ0EDt?=
 =?us-ascii?Q?MSZ+ZEEgqdS0cGgWqS3F4NM5j1+Xq1rbZBjf2MRx+Kkpe40VMUetIMq6dqKY?=
 =?us-ascii?Q?1B1XKdYPzmGwB8UH5097AcpviLuW1g1L2kqU6XBDKAlJd9h+RLmZcQjvsKyw?=
 =?us-ascii?Q?TtTX9Iq6GHoYP25Rks+rnvd/Z8foJ4d4b9u9HPMUzgWm1S0TfUuCBRa3zTcZ?=
 =?us-ascii?Q?NyIiX5fV2nV63jZVooj2GmMmVUpwlJphVuq1O509LyKJlHSgTAnEogyYLfF4?=
 =?us-ascii?Q?YxN4J0WbLelvIkE/eYNCKAA7KMSXzdYs6X/0JHm0lguAPT1UDmICYMKeYUu3?=
 =?us-ascii?Q?J595Rp3/wVWmDbcveEL2DDQ4j5qb8JjqvIE0VLHzxgqCAI+uweFIrKiVfhpL?=
 =?us-ascii?Q?mDJ5VBzsZNc1pB4k0ivBZkoMAC5QITj3/oR6cclKEpk0CBDCtKHosxV6MZq2?=
 =?us-ascii?Q?xX4LXqjEzQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd796df1-0e32-4508-9003-08df2eb1934f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:53:52.6541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAVK+E+dsP96gKZ82EoTFftH3RxsFJ3508c8Toqo1/CdvqGj+Q7FLHrfF49YxbiGjDoDJpFeDdZULSx+svcCLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6866

Hi Linus,

On Fri, Oct 16, 2026 at 11:14 PM Linus Walleij <linusw@kernel.org> wrote:
> > gpio-regmap has no get_multiple/set_multiple, while the device takes
> > several pins in one request,
>
> So just add it (get/set_multiple) to gpio-regmap.c?
>
> There is a nice generic implementation of get/set_multiple in
> drivers/gpio/gpio-mmio.c to draw on for inspiration.
[...]
> I don't quite get it, but I prefer gpio-regmap with an extended
> gpio-regmap.

Thanks for the pointer to gpio-mmio.c. We are open to extending
gpio-regmap and will evaluate this approach.

Thanks,
Adrian
