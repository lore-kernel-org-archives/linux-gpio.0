Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792501238;
	b=fWi3Sd+08INMo8JkluhHLG4qIReuBvF2PWjLLG7WmZTlnkpms/J6TQWbkAV/FM1/c7kn
	 a/TXuEkExAAJCJYn6BqrzcjCHW8H/qioBaUdCynEDeUsHQOfvUVrsZxuuAy5v78Bj2kn+
	 qRFnEXGeUAIzBAhxm5CeVos3yy/4ur20m6FTkMk7Po+E47rDHGq8PDtaoOjL6pnOmbOVS
	 kpWdzS6IRyre8l10Dl13sYzIogJQjLWTp9tj/Vdykwx6MX4dgUUyLeOM6YvdPNzSX5JSV
	 mOfnymRbcoDx12kfUEKri1/b38/oZr29+MWFVl1ZmzX2mHxyyByxsdg3k80cF5bbIvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501238;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HWRQbeo8utPwpwh+fIlrOacxRBTDzEtjy+DkoYIxz7o=;
	b=1GvEK0ChhKIZJqbAHV9TaJr8pmV/BJciFnzM7GdW1mLwOGJwlIR0A/nwCKSjY4xmfwtd
	 2+xTD+sv7Hvt6kRgyc0s1UeNK/E4zIMzBT2O+VooE7rmdFlhYRu/LPE6+Vr0mgh1x43BY
	 DLSTAi6V1MZOuHOnUKqUXty4LDB5rTL/Iuyjo3juf3WWAujbGPnow5ngVP2JCFXMziHmR
	 kaTan5DzKHHR6xiC+Hr2dbE7BPRNjAsEQiqWvwUHmjifDrKlRDsamuXiZQE9n0sNfPyRz
	 WO6GpkerkTdr77O7Tbr+rZf2PTkizD7er4FSdcuCFeOXjL+wQRkzyLOlaz9/Vrs0m7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="sGdrY/T5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.8
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490B60A4AD2;
	Tue, 20 Oct 2026 13:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E490B60A4AD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sGdrY/T5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f54PM319xRlC/DwAme1vI4LoouFmoeULwU7KmoHyb38vW1qfx66HCotTl/slW4SjramkYRpEthx8ZhZKPqiF0DtxCAd3fPu+uWAcwJpwJnd4aoNRSj0niJSJpv5wXaBifTOi6IqoxKtHd1BXrQyLEGVkB3nsQeKgwpxioJEryQBp/XI9a9jm0onjI6Iw27XHTpEw9s9BUsgwbuNc3NNKzypJ2M7aXNmm8iTPy49YM4VgA3VChSaOTozC4Sz1VZk3ztuuqgmxjMhvfCe26RFiXuKZjdrp6kKCxrRqszJdthS80xgWV8smmOmZkX5htFccRZjY79kWaKU43/9X6aMjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWRQbeo8utPwpwh+fIlrOacxRBTDzEtjy+DkoYIxz7o=;
 b=UTu5VUxrQE+F6HwyfOcemWC/tYVJWOi1oknGmggSq41sxmTib6K4QSicDi02d0xI4ZluzsYwVOr2zEM+mgpKQzn7hclDflTPCs/1sOFXJM9NjxtJ8bURYH/6mPyPtg6bkFzHC69WUSGtlQYz8gWwbdHzYrgfYCrlN2ggLSLz903v5gzOyI3xO4YJPYcIgSxl9IWhQF5yl7NkwcK5ahUuaMxIWJRJbzLO5Bd7O98kdkeSnWkdr4RY44wUiW0BQ6hTSanCK1MrBOjsN7joc+fczg/rSjl0JaKpmkj849DNU9/suikz08C7Sh/PAgxQNR6lNxDd5zi9esOsCpJi94z7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWRQbeo8utPwpwh+fIlrOacxRBTDzEtjy+DkoYIxz7o=;
 b=sGdrY/T5Gni90eSCYz1P8HMQPmxaGSUaTa8BBri+C53H6gVr+lbMrwrU0Vcj3U9rEhvh2tPYf8Es74q3r8pkG3aQhOIU4mJr6UEsznLQ4VWXGnaD08QlT48AmSXPjCAbaE0Dg8WSdq131A4AI0nayjFKAy9qdseqM6l5/Gl+niobjZ2ZkMiCgqfygACRGdqJ7qADnsgz5QeHWyxKFEV1y+lEdoeCa9EsFl4ReBUoLZSeegOS2odTW5D/J+PbOGtASyMpRaOqRHVJ3/IJ21dGO/ThlmNIJy+UXAooEwG4KMRHPw3DheDKHn/5dUEGEgWmnuazUn6/T2w37nO1sA9VWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by CY8PR12MB7414.namprd12.prod.outlook.com (2603:10b6:930:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 13:00:30 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 13:00:30 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kent Gibson <warthog618@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] gpiolib: fix chip removal with lines still requested from user space
Date: Tue, 20 Oct 2026 16:00:22 +0300
Message-ID: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25b::11) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|CY8PR12MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d430335-ecac-4af4-5409-08df2eaa1e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mUNxcBh7ByAmiKFOlsAnjGuChzUNlzlhQRoq/63Vo4VfFIhJH/Fcea0jPwdsU6zVlZCqN7ch9WI2x/p4fRHp6D5r+I3VHWGHLaQNT9ZI+TfcwDUb/6tyIRcOSRoVSDidymF7nxl56Zu+xjDGKWvCAoOSLRR/28K3yALbcZGFqvNNNQ5Dc892A7uIJ+bi/Dk4LvfkQA64nkOCF4i682YK/LOWmJoTZ1em0n6+K1VHb/uZH4Dx1kHSyXjVqFSaILjKBpj3bN8iU8Q/1ochKRZVYfCeArNyweNGJxychxCKtlrVnaDvyQtbV6QBnDzRMqR1n7h6HcchhIKbEiqGNzkbDffcWU6LxiSiUcSo98EypHnRAVUgQc2TTVxm7QH/7Usp7g3da0S3xE/iL/z1BfOXBKs16bfqI7oXrWXLxb848HV4qaBEYJUTBMwEDZehRSWg63is4aQiSfPsqFWnDMZOMv5ab0qww9sAMhoktP6OoJVAHtuQLSjM/EPBl59nTzxIZFevIulPTpjCp5HFIZpaIVf5cJ6JePIG9gdQ3JQDtq1JuqbkSBJE97dicOxVe2Ao4plYxHEx799eSeC78+2ui6LZr9vBZ4hZ4GZQQv23L26fjYAZrjZkJEopmJCDEtC80rFCXG7wq4s0mq/9sDzHHEkFX5mvAW5552zZHkqdaIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KGz7I+gi5ZMbtjxLupY6cxtlZc4cEhF7DkxUJKtZ15Ox7tEeBXGkw6FezTJb?=
 =?us-ascii?Q?uh7gEwnV1+cN1gzb2NJQdA7B9lwj8jiVYPmsM+QjM77+qWnTJXUg8mXNT6AI?=
 =?us-ascii?Q?5/0vn1Lshhq1JX39DIgA2L5rPFNTj5EbboZOLjyn+weCGJzSBIS2PL7cpOEA?=
 =?us-ascii?Q?I6N3oXsN6rbzuzfrGphDfef0DEiHggtGmkeCO7d+fkdjnVBCtMT0gsETWYZt?=
 =?us-ascii?Q?SD4akU87rmEB3v6a1rwCCUKT9jniE4YUyhOREVkQop+Szc5OKRfCak8tTJfa?=
 =?us-ascii?Q?LFzVYEuZ6gFGmw2LTZyDaNjQxCHL/Vff8E2FpYYidn3g7/u4jO/y4l3UfwH6?=
 =?us-ascii?Q?0Ao2ROB1Ix/LM86AKwhvrwNlOoz1zmnNhVUgqEDQGFCWnVzanlwursn2ibLB?=
 =?us-ascii?Q?ffliD/r1k+qZGkHBLiOOGpnqdNBwAdhs0ueLlFdsK9jd09s0kf70xJ5n2tNH?=
 =?us-ascii?Q?gnG3aAU6O4uQsowaSAhacBltI1btSlnZSQDTKHb1rOC+DuTT9OR49kyid9fE?=
 =?us-ascii?Q?FOXI7TE6mGtiBmE6Kd1S8tbxILxgaesE6IfCHqEZ/5xVtW1l5SAuyDu4AVR8?=
 =?us-ascii?Q?uUNELflYwqWcLVp61gMarki1cXv2J4KQoeel++PoKYTLJE/debI6DoKohwow?=
 =?us-ascii?Q?3f7mfjMOU7plZTEOfSo3di5zs/MmkgAblPbs/aLLK7QqIZdCokW7wnzoabG7?=
 =?us-ascii?Q?vqwFwzqQAMIBANVPA2NntVgehtENLNWrlcpRanhWlzeDLFcLstLOcP4Xcpv0?=
 =?us-ascii?Q?WFJv4IPMv3wHzgURCRA+eCKZPvVmPIqQve5YkZv46iJPBUdd5Wy+pezYOXXJ?=
 =?us-ascii?Q?q8L/OAsKMuazcgrMoPcGhWiIe+Vm5qIrD6Yg6OKKohulq8GMmVWojE5SoBYe?=
 =?us-ascii?Q?K2YWE21P+m1UsuUcDOjnPXu61PAFTVSjsTGoEd5ChN8TyoJcHOj8oy+aaY/e?=
 =?us-ascii?Q?DTqnBUPN8pSkC3QtE0vmnNVLtYbKND3MYhtW05BnETqAaA/BRrSJzJJsgEKB?=
 =?us-ascii?Q?3OhxSLp2FoU1ul5eXTYB7h20u6EwjAXCmNt2aj8DmaeZdbYcnRKsH6KNLnqF?=
 =?us-ascii?Q?d4xTiy2xDnkeeO+ILhNPkJnpu25jzrdE2gpW3FuCDaz5jAIn1XxyiA5rqQrD?=
 =?us-ascii?Q?Gb2ziqjwQuqzSNDGyLISfHksALUjj2LaOoDAK0TANjRzkVvsBMMTPWw0bttO?=
 =?us-ascii?Q?bSFZHM6V5jI7TEboaUt24heZdggXxNaMwGnGlBbJkcSFnsw4NmolD27Egvmk?=
 =?us-ascii?Q?G8ET5EGlHqRUbbn03FenQuXEjaGbhbqR9zr2Rxlw/dYGSFW7NMd5AWgSxHzy?=
 =?us-ascii?Q?XJhF4HqrANVELSrHsFVv02j1SYVxmYf9g97p1fAyjG04EM0+abMNu0vHhRNE?=
 =?us-ascii?Q?iBcyi5WpL518jGsB9BSkCk7rSoakEzv5WVxdh2RJeNVSiTPJjBbAzwqW8kKv?=
 =?us-ascii?Q?6MpeH5g4T47fZGMgRSZRdBSw88JstWraIBqOpMulMdCdc4AWedNTKuxwMhsg?=
 =?us-ascii?Q?a6XWFdmYrZlq2Vyvm3b1ctmrXln62ee32zUrygu5wG2sB+HbBjlAz361mV3G?=
 =?us-ascii?Q?IsWJmAK15Kmw3kEvIlCt6SazdQLreST2gJc7jEEXSA+XDJjDg7QebOBKwC/L?=
 =?us-ascii?Q?pAaqjLMBNOlDhRqW7/qMslQoFJbUT927Tpgb69BWcwFzaAcbwrd2YVg5Abm3?=
 =?us-ascii?Q?r7U5szBuzcT/L3tpLCikLnrUlUnwmeTjwASDSpaerIi3MmPL1sNrqhx0relL?=
 =?us-ascii?Q?DR0iPnv6yg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d430335-ecac-4af4-5409-08df2eaa1e95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:00:30.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLRSybtRSLa3VYxFQGhpg7eO11sXtCd7ssSwi3Iwlv3/dTpK9iikDn0PYmjQ+3Tp9QHm/8x4e5H4iM04YpSkxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7414

Removing a GPIO chip while user space holds a line request, as when a
hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
and IRQ names (patch 5), frees IRQs a second time (patches 3, 6) and
lets a blocked read() stall the removal (patch 4). Patch 1 makes
gpiodev_release() wait for pending label frees; without it,
cleanup_srcu_struct() can warn, more often with patch 2.

Patch 6 changes the order in gpiochip_remove() for in-kernel users too:
the IRQs they leave requested are now freed after the chip pointer is
cleared, when gpiod_*() calls on the chip fail.

User-visible change: a read() blocked when the chip is removed returns
the queued events, if any, and then fails with -ENODEV, instead of
staying blocked until a signal or an event.

For stable: patch 2 needs patch 1; patches 3, 5 and 6 fix a commit from
6.13 that 6.12.y also has; patch 4 applies to 6.12.y, older trees need a
different change.

Tested under QEMU (x86_64, 4 vCPUs) with gpio-sim and a test-only chip
on the hierarchical irqchip, on lockdep, kmemleak and KASAN builds:
each reproducer warns, leaks or hangs without its patch and passes with
it. v2 has the details.

An LLM assistant helped with the analysis, the reproducers and the
drafts, hence the Assisted-by tags; I reviewed and tested every change.

Changes in v3:
- Rebased on gpio/for-current.
- Patch 6: return early when there is no ->to_irq(); drop the comment
  in lineevent_free() (Kent).
- Shorter commit messages (Kent, Bartosz).
- Sashiko's finding on v2 6/6, the gpiochip_add_data_with_key() error
  path after the character device is registered, is on mainline too; I
  plan to send a fix for it on top of this series.
- Link to v2: https://lore.kernel.org/r/20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com
- Link to v1: https://lore.kernel.org/r/20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com

Adrian Ambrozewicz (6):
  gpiolib: wait for pending label frees before cleaning up desc_srcu
  gpiolib: free the label of lines released after their chip was removed
  gpiolib: cdev: do not free line IRQs again after the chip is removed
  gpiolib: cdev: don't sleep in the SRCU read section in read()
  gpiolib: cdev: don't leak the IRQ name when the chip is removed
  gpiolib: let the character device free its IRQs first on chip removal

 drivers/gpio/gpiolib-cdev.c | 145 +++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.c      |  38 ++++++++--
 2 files changed, 138 insertions(+), 45 deletions(-)


base-commit: 974d2712cb15014019595799b3ed68fef5fe9695
-- 
2.43.0

