Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CBF3B83F0
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142370; cv=fail; b=uKx3yuTToFAVKrRzxMsKqu/ZuXWcQWc3XzEk4PqBSJJYJA6spp0hd3uSHxt04KCJ4eHMO7hRjQLE1UMdsqPGjX0OGvO407tgUDALxACaBce84Xi5n8FfcvSab5ooQK78swuySqTBZJDZvyqibOA3Zk0HdScfPfNEHPjGgLuDC60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142370; c=relaxed/simple;
	bh=eigDTB+ZA1pGRU3K8f0CtXbzvlizNEpPMx4XoG8A9eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KLFgbRai54LhGh6ikXJWtsFsKoS87Xkhqy85nx8hMsyHt4ogy5Vw9XB7O921kA+fM1+KWSv6uyqOZduVCMNCUK6Lcj01wU+y3bO/eYl+lZJmxv9ZjBa10wRuA4jaVvtsyARO9EpZUBY1O0KBZiLofohPbekjSkwIcHC1b1A0teM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YcOxEI/E; arc=fail smtp.client-ip=52.101.53.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YcOxEI/E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0TleUUbOJIJlsDfAvVlzvBIAAQDFsJnFaoGEdv7loJbwub+cq7yjYsRRPGpSuCE6Dd3SptTTwo00D8nO3oFSo06QUC1gWaU8GAWoDy59i3PNWuBjFY8ByaPrRPfYP+5e7fc5GcuC9eXr4pmHhdPo/jJEgtn0DP8OIWZgnpgXlSpH+lk53Rhfa3L+kCxgKfJ1qm6TMESt0EVvucsKWURdH+mduJTp0X0LuHHCDBQlnyiH26IAfGfHr9dJ+7KcHR3fDqlAF3WDk6+3qdDMjooz+rb7PfqYVwR6MEmX5RRrAziJ9HOELPk5H+PWL62xtAcMcxjH29xsvmiPcZ53SOUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eigDTB+ZA1pGRU3K8f0CtXbzvlizNEpPMx4XoG8A9eg=;
 b=u4wZKLYfkWlOoJxDGd96AfYgoyZMpT/wddQ7cFpnviHDveqX2iDjXBL1hhQWtk18M2IjuoFtQHQjM+asW6YZsdbFSt3bODEcoVNIcX3FNTJDPX6fwN5J7fZYZoBJe02KNA3dZXuR2VUzmFe2pwshagk9aSaBwVxfRcm+eitL7Rfu7pTKpiAGSxVO65vK4/CQgyaSbiL6NLEID45FK/fhLxQp5wavGjOPC5XpdKC/lWZdQp6L96MFvV40hwmnNZpkYH3YaeJWc9cVr0XekBcT7MZ1q/svtLCvSEEMWDpvfdeALN8KkJb9JAciyIKASAeGKFuv211meAz7gpMPR8OCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eigDTB+ZA1pGRU3K8f0CtXbzvlizNEpPMx4XoG8A9eg=;
 b=YcOxEI/EZ3tAZpDq3r9zXWYuPelfyXi/26yCxN7ISwr9i1PJvoIAp4k3RLKGg5eg2SrSYh8nVRF556NWnkk3SVJQ1RgvGdY2ZL0BAnhAKxv4BJPrOaxpqL+gx1lQ6NmxG6PfrF3HvkaOVntuWVA1+xLcChPYsZPL6TG9FpW3gkijtiq7E1pYxGOEtnZ5tT3y1TqlD9Cdfpk5jF6WBdr1LfMeLzppcKuVSFqVxzHsyQObt2yae2TsM5n0xECFXMslp64aIywTQPT8JmgtTBkH81iZwv1u2woHlsZNrLw1cF2K9hUFMRSmrqQHwbYaR6Rt5BNAF09NKVHwi49I/IjpgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by SA5PPFB29794CA1.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8dd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 09:19:26 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:19:26 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver refused
Date: Fri, 16 Oct 2026 12:19:20 +0300
Message-ID: <20261016091920.2039186-1-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016083709.GA56522@rigel>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com> <sashiko-outbox-168233@kernel.org> <20261014043645.GA13991@rigel> <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com> <20261015153714.GA105746@rigel> <20261016074704.1860749-9-aambrozewicz@nvidia.com> <20261016083709.GA56522@rigel>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:28::21) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|SA5PPFB29794CA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e0d4d7-6a40-4a4d-7b7d-08df2b669315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0Thi6FBzkxXeLkYuYMmQa+a+Zxyi8AdD2kSUBWkOB6SQx8KV+WdVvyIn2fsU7FEK/AZZxnnFOL0Sbqk9AUjliWiVrk7heeh3zA5s1fhmDfszXP3G2rDztWZpVTYMlk2JItM7LNz2H1gVtlYRFQ5/u1vHerkxTPeAjPK55fwUvJ4R5y0+HzJh13e9rpVoPWNeWCIRfEw2Qlfl5iKe0q0+dtWnCBkybR4JCHYcH+IIrnuzgxRWR7Rv6E+I1xjWB87oTuHS+No26amFlJaRBQdGIkt+MNqOqqbZhvqB/LbwB+yaaT4sonIYozRFer/4N83fRx3A2DBdOapc7NKDwmWwkYb6s0QcO+K/ZZPRvQe5y9sPpzDzAymWkDY7nrG8JgErzq6voOLpkCTy4JsOo+2J8q4MELa8OlZrRyVs0KnNJ3eQ3QRra9cOy23N+MV01aCikr7lt7Xc1N8wBX7KlZrasFrxqQOjSD2WKiUIMMwN3BTidXA2et+FQfJhOywxn7B6BRdheAJ17mQkTQiwbEDXjcqSklXGCSN8golqw+UKi3Z6w95+kfM/t3j3tBKRkcQKg8bRFp7gezEokQKa/FK6ObZULh+UjY9lDwS3wdOwDjBZnaZiiHdiD/8BQ0S1MZcpS2n/usTU8gBSDVBGj8Ydp7MeBfeXUIv0izWRcNfu6XM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QE2o/BWugfRoVCTqhKKWb/DJWMpk8KoEq2HrEkt6LauUlyUoWcuQjzGZnOE+?=
 =?us-ascii?Q?KCi8O1hxwVpn4YnHzIQz8Fh1g7UXDCtRZvdRLcUEGNnBT9TNtawSxUDgl0QJ?=
 =?us-ascii?Q?Lujg8BRz5p61Po90NJM2fNiMMvhcWzakb/LkiyGW1fGRZwcV5bIl7FXjBQaB?=
 =?us-ascii?Q?Ine8RV7rZHA3JBdqhUI+FZvRMi8ueERQElGpYyqaAG6IY+PGR215Dm01iZvZ?=
 =?us-ascii?Q?zBKGKKbSv3rnD6rdFzByD7rxeP6eI1gxJWbKah/3HtCj57roT9cS0mtSdW5x?=
 =?us-ascii?Q?p/2ig1rWToJ2Hhcx5PY2WL0wYxaX9B8blREv2hSkINmZ6OlGTNWiGwLiHJJs?=
 =?us-ascii?Q?ZM1M34TBdp3HjPtQhUOT0xShvHxmpAAOM2iHthi6shZhXqEJCl07fvA5pkSd?=
 =?us-ascii?Q?Q8LjEM+NyKPeKOoCNZ/GWmBy8UcIAavTpRj5vXM942ZedCrbuMeDfaCypajt?=
 =?us-ascii?Q?8J7iFZHld7MCJ4UfTYBMVawlv9jyxu6Kx6LeKuEloDujZpmraA3EQ51RPBEp?=
 =?us-ascii?Q?HFdt0E9ZUf1iWML2+PfUhlwntouyzi6tecw5+9Y/sp0CC//aOJwbpM+XhWlX?=
 =?us-ascii?Q?ciBoPb02Xu8t2fyiZOOuGpDxApjPfVEJNTAP6GxecF0ErP2PoivxDS/J6FM7?=
 =?us-ascii?Q?OIJG3pRrLWVYMFf4f2oNLWnHV1mSmdjXd5DXlN8ip4Q8Q0U4n3hjHxkTYML4?=
 =?us-ascii?Q?aeorwMo3S/OGE0eii6Xq+fWgGWIg+HPZihaXa1Oe3cdb+twIzFeQMuPByRiv?=
 =?us-ascii?Q?tJaMuaNmbyFphQNPryPfqjIvo23xXRKeIJAdT/xJunMeCp9iVD5LuqrH4NmR?=
 =?us-ascii?Q?u1orJybGUUJMSvYCisCO9uZH+LX7RGkSJ2egFZuEtdT5/duOe/AXsp+Qg6UA?=
 =?us-ascii?Q?bY4TylLqsFmrr+LU68XVZ/FIKevFPyov1CZUXS3sr3QM0hPqFZ/QABeeY0Qq?=
 =?us-ascii?Q?PVAQUUNmaauATYQmlTzxAbeALFtCXRUsY4PMw3b8dRL75hu6dNJLfwHljtHS?=
 =?us-ascii?Q?7gAV3X+By6DYeStZ2VNuBnyKCeiMXCKOEde4XOWpQ2TPZ3oTBA75iIdzugCe?=
 =?us-ascii?Q?qJpQ8qFOqliYE+Wz2WUhk1LbR3aowtHsEHp/QRzrLW15MaEUYtFC5D9YiG0l?=
 =?us-ascii?Q?zdElxrveMgDO/suj26byeVnaPg/T5AluTAmcgAE2egI5B4i68PE49LE/qEXC?=
 =?us-ascii?Q?IMGk6V1VGg+PJwdUlQp2M4tHKVCVfctmXq066KEm+K20Hw0X77nDDx0DszUt?=
 =?us-ascii?Q?yemc9UJndSjKhUfQqRoOEmmMudGjCKQu4Yj/E566322UfqSkrDTK99E5JYwL?=
 =?us-ascii?Q?w0MDOwBUuMD+PIsMwgjLayxHnqbAjsp/zeuVlBVfHRE3NbVwDTWYl10Py40X?=
 =?us-ascii?Q?zZb13F9qpqExVtNOAhd915SD0cSPx1qN0f1dhuKIaFdevEsdQ2Wm+pYMoQ54?=
 =?us-ascii?Q?+pVQsIuV68HB81k0bw+2GDDtND4vF0Bzzd4JQWdIJefFt/XhAJdjS65ScDZm?=
 =?us-ascii?Q?StFOzkeyzzztRczznACHYB17E56gP1ZKDSmAiV3k25VwKRds12FmktnjEH3l?=
 =?us-ascii?Q?M2Vvtggb58nj/wu2xx6HXxPUQA8Ug5wKXcmjmZpPhd9719OWSK/2L7ZIYTRr?=
 =?us-ascii?Q?EIH1WutXKhx7nzU+qoIVTF+FLOcojRoag6AYwuEXy67yM6agy0khh1eIt9Yz?=
 =?us-ascii?Q?Ysgl4HjBsYrXVpLw4YCWfHSRQob6KOX5hfNJHQ99/aNZSg80uUqKDz1IaFB6?=
 =?us-ascii?Q?5ZboyDvA/A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e0d4d7-6a40-4a4d-7b7d-08df2b669315
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:19:26.5375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXiNGQ+1SpvmN1C3SS/TLDljdl+2DJHP/bV1prenZ7+UMQIxM+mP5ZvZXqdLVMgdrGlFpnC4pec4dU5Y6OsvLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB29794CA1

On Fri, Oct 16, 2026 at 04:37:09PM +0800, Kent Gibson wrote:
> I was thinking specifically of the gpiochip_set_multiple() error path.
> How do you elicit a gpiochip_set_multiple() failure from gpio-sim -
> it always returns 0?

I don't; only the -EPERM path reproduces with gpio-sim. The
gpiochip_set_multiple() one I only know from reading the code.

> Oh nuts, I overlooked the EPERM case.
> Bart has already merged a patch for the gpiod_set_multiple() failure leak[1]
> - you were Cced.

Sorry, I missed that one.

> I would keep patches in your removal series focused on that and keep
> patches for existing problems separate so we can get that series merged as
> soon as possible.
>
> I'll send out a patch for the EPERM path shortly.

Thanks, I'll leave it to you and drop the leak fix from the series. I'll
run your patch through the kmemleak test above and reply with the result.

v2 of the removal series will then have the six removal fixes only. The
debounce fix depends on the reworked gpiod_free_commit() in patch 2, so
I'll send it on its own once the series is in.

Adrian
