Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51FE4418D7
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136876; cv=fail; b=k8h7YDPtz0sucVeuJERPR+Ja/QzNjPlE3OqnJLb2FevqXTl6AkNrvMfzxPDw+mF5T6EJRR05LsOS2odo2McmhRfjUS+waiWXp36aX6dV2ym2EoUvzWj2CUEdjcCeOHhqF52cAqXUfqQmQ1DWjyz+BB5fSvm0FpfM0zFKqA3J438=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136876; c=relaxed/simple;
	bh=6MKdLaVMDmldcqwv2K0AkTdnJ+05UG8d3cjpGg20kkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oGqiAYt4m2G/AW/TfrAhaWuOqJJSaO/af2X7tBkE9z6wp2GZeCEp07OHIQWeFEYO3UoX9xreBPzydJCAy5cdOfy4mEePsi9p+bju1Xho5hwQYvVBQZVc8g003Uc4ri0fI1m+7YETYYvWyJ87UWPhWbffLpSjwUshyauJinnhk6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ul+hT1sc; arc=fail smtp.client-ip=40.93.196.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ul+hT1sc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0G0kJwLSJ9HjU87umdI+se4+8kb0zTj22BJGgtHIGRr4y9xdSknQFLPvgEG9YtXKqQ+6aMAtZ+X9Ki4qJKqShecOn4SIdYmG0Ti5jJg+GbeTrfFAh+WZJZkgZoDvHuKmWVE/aIx1gUaIQW2mB9AuNXmzz4pbCL+NGTp6VmTz2x9W8wmew13PS1WizL1rf3htc7ttIyTfUzLY1MNOa0SumAuYBchY1v7TGOHT5h9SyrpEPsGtXYOxIxux/QJNCUerD+KM3fPLbBY9MOXMl+3e8hHvDC6/fg6knoPIE5l5N0Ge0Ru+hSFBjbCIJtD+MXmpDB32XJF1W8nKrwGVUreig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah1RJvoLvmKwvf6v5P3rNonK9fNlXgrQrKRgK+wFOcw=;
 b=O2IDlLugXsXnxrCHjefL3JD9Uowy3O91Vdy86JiD/la3YH/slRZ8meUUmejIaZPMAm7JGKZD2DJ1gdU6ekTbE2ZiOn2luSu009qDbzDK8a/7/dL3wrH4vSaJ0PiBqDPHIcAGmVkvuNrcVjUHMkmGpB3aLzvcvs9oUiFVqIs66GO3QRVM66owzwWUUD7eP/Odq0cAg2lPGfy3uqJr3EYqjSQZ5uvMEFRgti58rSwyex2aLzw0t+OdkgJ042FBheM5x4SIn1XFL7Fp/lSuOQCOjGJERON/Bq8aW7OzEHQ12NWQSP1Fk1WWF/abD3C/Qqjq9Gwo5evpoMoDIcz1jJCgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah1RJvoLvmKwvf6v5P3rNonK9fNlXgrQrKRgK+wFOcw=;
 b=ul+hT1scYhPo3yxfaHnMXJgHHqVWqDzwloug8UXo21UYznKL+AV4VQsLwPOZP3PCsCw3+0/Nzwqg8cGjQamoEhnocaTf6PHAqM+jWypq89zqEFIBmkVTMoHoy0zwkke1YzRd8P27PrTmo84yTsKPIyvr9zZM11kHKTKvNdeUAvaaIthlNTJ5piEsnoHMSQdZTGw2BHln8CaOiP40jRK4X125nVtDfW5vd2LYyJX6neTwP0ic50afYVkPQB/hWBkcmOkJIRDVjqbr2cQjdD4vPohjE4GrlXGe0IBCIlDSdZ3uuOVyVW8BgtSlg9ljmNfxne+RJ/H1RB2Sk17xFOTyYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 07:47:49 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 07:47:48 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver refused
Date: Fri, 16 Oct 2026 10:46:56 +0300
Message-ID: <20261016074704.1860749-9-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015153714.GA105746@rigel>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com> <sashiko-outbox-168233@kernel.org> <20261014043645.GA13991@rigel> <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com> <20261015153714.GA105746@rigel>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::13) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|MN2PR12MB4320:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecaff3e-91c5-4d9e-5e3f-08df2b59c617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jArifWTJCTRnQZW7LEFVUO70aLKho9PDC20NRUBYhX/+A4u5WqyhAV9aCk6D4wdZvGF4NGE6OVfI7eH4bN52/A8FlhH/fv2ls8J/AGz3R4EMCm8VOKNFiy3CCwrIlNOva5M2R2eQO/i8dwOcwWQ9vXIbrzPFfm0Vs1Z1CJ5igCW05M8LCyFxhUjGaY0VgpSyoBCeUSv4RPiEZIRYklN5FUZewbtSKQRSwoJVH1xouQcbYLHSRnCJRZt/DyWagIbmhRwd536nubPgQRO5+uSfhCJAQBlZgv8qUa475MhqeSz/o10qVnTbsYQWOuTsOgJBMcOl7/bg0dRfxHPw2aJINrphp3X5PNsTE5zJOW+Yb7tbknBUUinQzagQ8swnCzAKwgq3HcmNwO01OnIpnWsAbW4cIszPgy9ZmF5yOWGbd+69q9dGM1fpJpOy35Q+dMtvlrI6GlVW9PeSnDEjO+bgFW1YPdMw/Dc938OTssZYY8i/PucwtJGVKpvmVf9amHa9PpDUOdZ8KAczMCbQJNMKk+oJbOoQQvcdR1N1xDKy+sp9aRBO4I+Cm91M1CozkQFSrJN0XO5uuNsOraoiaro1xaDssa0+nMSab2UY3+TbQwhs5M0ddSY/RJp6dWItzWPug0op17y//BDGvsNASkBpBlGsIX5LfrnaKX5PoXd6aNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yi7rZx8kmljZ7bmtobYNWWTqtMQ1EGxgI0WPAorFBgvME5G2Z8OC/S5jvvgr?=
 =?us-ascii?Q?QSVR6i9eLkZ5idI2uTw3ZREBRcaQv6AMhSozheNM+kTWqDZA4hx0VdcRp/gh?=
 =?us-ascii?Q?j3dPe1hiy77a2NGMO8nv716//VE0ZyvMboD93w7XDc7mxTkR78B+W5IlzzLr?=
 =?us-ascii?Q?lMC97ovxsnQmChPxEyi/iDEEmDKw2QB+H9Q6aAtTJKOTvddVXwCE9O+VpEDl?=
 =?us-ascii?Q?2rAwgC6FzmHBrSERn0lF1EkpH3DnMNwI0LxoUTo+E4NEaWT78ZEbLS+yNTar?=
 =?us-ascii?Q?dPnjpsuh/6+qNjPm+AwIFzog3hxpLQiD/JQF0PjWzCs5F81H2qFSM2C+B005?=
 =?us-ascii?Q?FWOhPYgjQvprlWhg+U3aaiMPja5vn8FISQeJMflp3zAWE0vuYn03SiVIsxkh?=
 =?us-ascii?Q?e+0M+dK7/xbNbp9Honq1G+5YsxOo/LadQpcruLhEmtrqwEbrbQ9jOUck8IeL?=
 =?us-ascii?Q?BkhCkOOujR4RLSc912xs7tXV3a4jaFq01PCHUZmcprtscp7Ejx8sv+1KqrdD?=
 =?us-ascii?Q?1M7ElkEzABbEcA0M0gyoOn0TzCA05ahKGiN2fwK698ZVzhsK7lOl3qzimtjf?=
 =?us-ascii?Q?U6hasGO0keaLvIrEFQiRUCDA0Bo0G1h+mHGcTWeQ6a/m0YIoxi08P1Z1uolt?=
 =?us-ascii?Q?ot9Z47U6+bQG5aiqUb7dyg82cOY5JwoxdbUA1n4slvjlYCvoB0SFy7zAVyX8?=
 =?us-ascii?Q?wA1q8uk4bvi6yccP8hZA0mUoU0VVaxneiWr+WmQEmTpzk6h/b6jncoaVtMib?=
 =?us-ascii?Q?qGNm1Fx4RscS8tJxgkB3S1rWUEKoH1dQbEnWAKHPyx9tIW2LCkgan0Uy7kwZ?=
 =?us-ascii?Q?l69UgfYO9ywzghO+q9Oqg1RhC3MLH1KscCrdNefH0zkeJsrxLYq+bXlB27Bg?=
 =?us-ascii?Q?y95AKQPy+swjHhe3RBUYl+7lsDnK4Ir35OoAwdco5X040RXvZvjMc5UWue7z?=
 =?us-ascii?Q?6FiRTNaxVDWOXZirr8PBkKLzCq9LRtlcR4zfD/fnXk5os5jwMqcrowELRd26?=
 =?us-ascii?Q?+uHUkTFXShxlynYEJ2jGvVmYgBbDkSiEO5WwCt9XcI8MZ9Qb2m3UXHxkwHQP?=
 =?us-ascii?Q?kTov3jBzzAvRBR57wYEprpJ7CWBe7S5+sx6RX4OLL9cmcLpX5FcAB1JY4hj4?=
 =?us-ascii?Q?xdtckZtGeNBIZSWmbfZdbXNO8p/ZySHf+RxgqsvZ/HopncbXM1S9No+omrc7?=
 =?us-ascii?Q?Ve9IhY2VkPeUeZdOnRj86WnnDWXDpfBW+lH4VPyJt4i6zlVzi8mmKFU+SHx+?=
 =?us-ascii?Q?kEAWjoxsTEk0Ybg2sSxg977qodnk4RgjkAt6jBcpX5G66s8CzEMCUuVDWE41?=
 =?us-ascii?Q?1VqvO++cV/vtT8kYk5Q2uYQpnPK6yy3Se/AcWG6h4ShHRVn2rSBvoCdF7VKI?=
 =?us-ascii?Q?LltiDYJpAf98sB2RrJrjIbFYMgvLIRI9Sruq/to7HlyJb59MRrNoRzE2D3kF?=
 =?us-ascii?Q?gCAuGeZkHxtjsuhQLPdMKqhWIC92aRiJYbemVJshngWOdPa6zpiM9g/S5Tm1?=
 =?us-ascii?Q?8mb7oHZIQnk7EuZ3iJqH4z6lU4BQ7VT+8W8yHoXDSwF4Gb2o1ZGv4jxdA6Tv?=
 =?us-ascii?Q?lJgWvaGQG3+Bhz1tDxOpadtP2a1ehMKlTUQPsdl3syrLaaod7p1CofQFRKIS?=
 =?us-ascii?Q?ac5sP1vzPrsiIiG5WrkXJOjv37eEWHptZtyqvvu6QlejDofTUIjpkoRvQK2n?=
 =?us-ascii?Q?hKja5ZrbhxIXrkJHyOQT3qiw/MTcor4NNL8sBxt7MhYkTj+Rtz8jQ00rcGAl?=
 =?us-ascii?Q?G1GHWWAIDQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecaff3e-91c5-4d9e-5e3f-08df2b59c617
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 07:47:48.7702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BCu+WfIxPpQXd2gsuMjKIqA145nOfeRQxDRcHy5Q81a9ul55sDtNoi4mhoPq9pCm87geFzFHdeBjDoEzTdV4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320

On Thu, Oct 15, 2026 at 11:37:14PM +0800, Kent Gibson wrote:
> On Thu, Oct 15, 2026 at 06:36:26AM -0700, Bartosz Golaszewski wrote:
> > We can't protect the flags with mutex or spinlock due to the multitude of
> > issues that forced us to use SRCU. We could maybe consider atomic_t for the
> > flags field and that would allow us to use various atomic ops and possibly it
> > would be enough to cover all the read-modify-write cases we have. I need to
> > think about it and will also ask the clanker for help.
>
> I was thinking along the lines of reverting to atomic bitops directly
> on the flags, e.g. reverting b7adfb6076ff, without changing the
> underlying type to atomic_t.

I'll leave the flags to you two. For whichever form you pick, there
are two places where my patches meet that code.

gpiod_free_commit() does the same read-modify-write: it reads the
flags, calls ->free(), which may sleep, and writes the word back.
Patch 8 of chip-removal v2 (for the debounce race Sashiko found on the
event clock fix) relies on that write: it resets debounce_period_us
first and makes the write a release store, pairing with the
test_and_set_bit() in gpiod_request_commit(), so that a new owner sees
the reset. With atomic bitops there, clearing GPIOD_FLAG_REQUESTED last
with clear_bit_unlock() would give the same ordering. v2 keeps the
release store, as that matches the code today.

v2 of this patch only drops the GPIOD_FLAG_IS_OUT lines from
gpio_v2_line_config_flags_to_desc_flags(), which b7adfb6076ff also
touches, so a revert and this patch only need rebasing over each other.

> > >> Doesn't this bypass the bitmap_free() calls at the end of the function and
> > >> leak mask and bits?
> > >
> > > This also looks like a valid concern in existing code.  Unlikely, but valid.
> > >
> > > It is also not something we can readily test.

It is: both the -EPERM return and the one after a failed
gpiochip_set_multiple() skip the bitmap_free() calls when the bitmaps
were allocated. The -EPERM path shows up with gpio-sim as it is: on a
chip with more lines than CONFIG_GPIOLIB_FASTPATH_LIMIT (512 by
default; I used 600), GPIO_V2_LINE_SET_VALUES_IOCTL on a line requested
as input leaves the two bitmaps to kmemleak. Unless Bart would rather take it
himself, I'll send the fix as patch 7 of chip-removal v2:

https://lore.kernel.org/r/20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com

Adrian
