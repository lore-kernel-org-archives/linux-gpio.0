Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B1E224AF2;
	Fri, 16 Oct 2026 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142626; cv=fail; b=rMTnWh/YAHMr25WOLAMLenwSS0Dg1BNnt4aAX3vjmKZqqBohsKkIsi6W5Thvro9noo2nI01VuUfiYutqkfUolcOGkilivYwD0wvX/RL5YIpESnBCV8NRKlMjhqLPuUTsVChGDL0wOhbVrKD+TSJF4RuJpFVmu97caeW0FexTLeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142626; c=relaxed/simple;
	bh=nhGJ7jPwicYALWtbpXOr9xqj1C/0rSAIV0SBI/P5xvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jkoGA0QV1f6mBAfhZgvbY8f3Op1aggVNPui4JWU2AWmC31DMtvVLzsb8ntQTpnXN2LJauPsbWRBkiX+Tqw00ETFyPGRHGf5urtDYExDTHjNM9SBT4W+2SMFwnNMyJpPU8pQTL66YM44JHOvLgSzprB+WxsSHoPcbX7v04Ews7I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ipcNt2PG; arc=fail smtp.client-ip=40.93.195.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ipcNt2PG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5iLFP+8SGVjuAdJZ2cHBMd1XiGLb5HlVxXQc2Bvd40xr4LHHxOXW/z0wJhtwUHkTi2Q1oRXSnjnalwK5TCy6JkCp6kmC5NX5ymWxUWBv69eFsNg1YV4vwfLjYr+aR+Jr/lCcHHDYEZYDEdiMii7EWVJskaPcrgKoPZ1wbuvUUzU01oFgSmMuu3kGViaNbd3Zdj1IAam/E8svtjPy8QbPD4kvLlRQtcZh7hu669d1knGkcjLgLV0h+g6ENquf7CWXEcTaF8iGlQX2w11Mlto1kauLF+bqAAGUEkjVrpkUeRhqwqLxUWdx9TAuLzrcLcD98oTmeE4TTqK82EVmPHQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=or6ROaFqk94TdWtwsRiUs4Tcy6MWUWmftsCeKVcJ6uE=;
 b=DA8qSRfstduQQdLRJYO1TyHMskQZza+QP4kIeKT+yqxnmoVwazTGtqnh755niI5g/ON/kE5DV5FdnhQL8k7T1kueof7lPBdZdSIu4cmmjzsANGjGseioZ3jBzQmVwFT7v83syiUVLPYLXKgIYio+Uamu9S4/V0Nv45K8e7c3MY9FoteK0MfHjjMFVcGN29htjavTK7+xLhQ//te12apHa1cpzlIeryrcvIACIDl+lodKASAh6XzINkQRLbG2IXPtD5O7r7P0GB4KfsC24vad/52Lmbfbv0OsFWpRaepk/1+eywfD6mTJI0ScgUE0/PkdgXJbWRk7wTxOnvagC8biKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=or6ROaFqk94TdWtwsRiUs4Tcy6MWUWmftsCeKVcJ6uE=;
 b=ipcNt2PGlV21GEUDDg/ADKlntJezuWGShhBLfuknSd6CcpoEoVkqBFUnzeFHUNM4paR2PAy5WY9EgyZqBaXXgUnLq6dmV+A4VM43huSK6P1YU44CubnJ0OtMv5raAzL8yG81fn0FIYIDhAIPGo/oillx6vAUO8GGeS1YbOJOMTv5l8YIemVqZy3dLGNZNb8EBoqPhpwrnLyqsn4cnX2+fv2PfsAkEjMzyUAIcoc7pv3APeykeNCfW+SKBvYjmUN0Z/ICFW2I9VPqgcVGrQfHlEK3CzYx7azEleryPgTNR5WcZs4HwbOT0r4Y/jPBejsL0/WbD2SFVzk5BAKuvubDpA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by DSVPR12MB195923.namprd12.prod.outlook.com (2603:10b6:8:3eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:23:41 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:23:41 +0000
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
Subject: [PATCH v2 0/6] gpiolib: fix chip removal with lines still requested from user space
Date: Fri, 16 Oct 2026 12:23:32 +0300
Message-ID: <20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::19) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|DSVPR12MB195923:EE_
X-MS-Office365-Filtering-Correlation-Id: 85750125-5495-4d5d-3f73-08df2b672b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|6133799003|18002099003|10067099003|261009223027099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HRxv4t3FK0Uzp5cM5ex5bcbv2UxNynq8WUgN6p3oRm4w2Ijhm/S21CGJBv1vhpe+p88iULgPDUh0O7QNtajakOiUywMvWz3IaYonnU+g2wzBdOnubs2veQkloyk/rkHZw+/760167uOusg6uzggxOFAfihQX2kt7vRg/IvvtA3IbHKhwkX3Cp2yiysmFGBoqU/DggmkDYMaoh0oBg1uDTXFJq428kxfWNn/6Ix+loD1xldSPTFm2m0SlPcCGndV/8GM2l8OA3QM0Jm2Q0r2rKFGli0tKAacJDCS63ESfgOACDjuvzshHM+hTC3tsRvbUnWUdmTjcu+Gcr2FpqymNyxIIH3hadxShIz2fEloSW12uq9BbW94JsmGikr/1ecDTTSERfDxlyTZK76vwYwqqoFG3IaSaNvrywZ4taqPcwDF1IXruGRGHwCX7OrWhqooz9roOXPTgoZ5Cos6SHet7e0KTA41XhTI+WOcUjY4t6BCZTiFOcuxJI1KKliOlFgI2Fcg+Gapt/nt84CCB5lU7sfSdQbRYpN1V271B5ZKo50SuHy79vZA277lknMRLFQMYoQ/sMg7cGbiY6tE0zvG9yAfbVt2YxCm27/SYn7+Tc4ccRYsZzamvJTr9ex2xtuA2FnwWAr5biKOcyAJuSTywFUVUJSHlaRVmk32HMK3avi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(261009223027099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nDPnNhZgZTwKjEP6JblXUY5yIK3/H4tB7hdhpZUxEAQgbq9K/4InHIExmLe/?=
 =?us-ascii?Q?RYexji+h9RnUNeGVj0KXJJ8Nm7ry/rPR8e4nPojpJj4dI01pa06lFCLdJwN/?=
 =?us-ascii?Q?Og9Gh+wGmAOkDHl629f8OLzqMUyl30aWKtgdpv7kx4NYlgn+UBczeI2720N5?=
 =?us-ascii?Q?r1xXOi1iHOkDwcQfQ4w6BvaHAiTaergjKjq9H7Zzq0vD63YSnOz0qZhSkNt2?=
 =?us-ascii?Q?jF/4VWmjxDkCHn6REaGNK/pFlTPf7o2l5GkOVgjVwij25amhlTi5It0diVeX?=
 =?us-ascii?Q?xeE2j0bhFLEwh9IYbejA7yaEe/IhCL0CqoTZ1zV1QYY2L3jygz99pKntIKIW?=
 =?us-ascii?Q?SV+2PGLXHjitKk+hd2iLSzgKnekGhch4vCkqP5uVQmzC7STHSPVbcwbY1V4I?=
 =?us-ascii?Q?8CJintxkxiPMFFzxqTMPzjHKdL3UCRdAehcF5o8DlBvEIN+LRhhXM7zp+aNe?=
 =?us-ascii?Q?73Fa3bAzZuV1ghv0nL9Ml/LK0sg4em5ouGzzf1NE5jRnY9L+cg9cbHKWd2J5?=
 =?us-ascii?Q?PEuUP+J/vFY4yH3QT6IjVF3yr25qBkWsgOfXwjhEPjTNVxliPOGSejRahbAj?=
 =?us-ascii?Q?HAbMe+N/ldJWTTHmbnvObXjNECSDKC6Pgesv+Li763nqIxVVyMWqUMtbO/1k?=
 =?us-ascii?Q?7PYG6r78PslOYMdngg7e/er0LQ3b7jruodRQUfU5Jhnw1USxS14gnYsZ+5sy?=
 =?us-ascii?Q?pLRY7ayRE4xU8pzIMA3U0hvNmgAhVc+VrCmK3LWqj7O0Kmp1JOvUGF9vVzIH?=
 =?us-ascii?Q?Tbbh6XCBeiwiXocV9VTVR/q6j/9VJk/a8tHBh58B2H5oBshLztWeWUjQgw6C?=
 =?us-ascii?Q?B5EaifwW6ubdEtuT1EnXG+US0pnOvZUc+B1aNw5Vd8WMiWO03w3LyNySExIe?=
 =?us-ascii?Q?ineqeLGoEbiIqJmsUsqaMMIFjN6PHku/B10ZoXX9ZL/MsV9aMfKz2L3S9PeF?=
 =?us-ascii?Q?CvoScjNWE8s+piGMUqNh/viGwWU6vr5Revm7v1RmqEY9O7Cit+1EHLd2FL3/?=
 =?us-ascii?Q?O87rYylk6WsdeOIJGfl+DLnzJKvoGufpdNhLx+ksVXzz531hmHJQG3lZjZ7+?=
 =?us-ascii?Q?4GBB/HwyMe9qh30guqJWZziO+P0GvqLK2/inqDlNJfoGPJQX8jzRz/7lzCnp?=
 =?us-ascii?Q?rOF/f9LOBLMJ3vWVQ1gb+Mr6UtNFRjMjA+S7FwvJLAPoSjU2p6JQXusfiLPn?=
 =?us-ascii?Q?w19YunRIEcqmK7X+b1w9gT/1zKvaQZQTGErNuYPtbj1sAIpZRBP7JRJzVFy4?=
 =?us-ascii?Q?3SUKv6qocL2Vrf3wz70lCaySDvjciG2GWD2OMk/U8+g/NOsCFigKfLp8bEuG?=
 =?us-ascii?Q?eiib8/BtVn2IeW4Qd5+5JshBIIAS8wYA7nxchDrSm6VX5bXXpIBUEUrhpadG?=
 =?us-ascii?Q?R9BWUhEiqxyZXtvqzprOzSJFaJP+msBPT6td9Jx81M6fiA0BBUrL31I/3BvB?=
 =?us-ascii?Q?5s/AS49Zuy4dexYAiXUssNvV0FOApk+6Q6ilm9z0/tBXAvVCyLmmLKyBJpc3?=
 =?us-ascii?Q?7cagY+MI4Wzu6frtZc8qP8Y+wcjRiRqzXLIE8ChpQkI2PLRnPjJz4jNsUflW?=
 =?us-ascii?Q?nDpXAzo1iAtfH0JT3Xcn7yYE9/b9SHepHYxb64E60Xp6ul2LGZktNm5yxtOT?=
 =?us-ascii?Q?FE+FcEf5hHxnOJSyrP4fvUC7uI/3CuUL680rLfRX27pX4ze/Rt5eNxSqXYPO?=
 =?us-ascii?Q?KrE72mEqDlBn/nUWspcf7X02CzkhVEaUb6E4DZa33mGPdGwE9nUlwv4/JoRQ?=
 =?us-ascii?Q?I45HZEjp5Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85750125-5495-4d5d-3f73-08df2b672b48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:23:41.8766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbuOiBbSYSqr49FO1JdxDU4eW6eGD+SOO/ug/p0K6JJMlw4y156HORfx1+10cqwDsrzaxwTUM0h82DL0bBnqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB195923

Removing a GPIO chip while user space keeps a line request open, which
is what happens when a USB or otherwise hot-pluggable GPIO controller
goes away, leaves a few things behind on current kernels:

 - the consumer label of each such line leaks (patch 2), and freeing it
   just before the GPIO device is released needs gpiodev_release() to
   wait for pending label frees (patch 1, which can also be hit on its
   own with line hogs);
 - the character device frees the line's IRQ a second time on close,
   after gpiochip_remove() already did, which warns when the IRQ number
   was reused and was reported as a use-after-free with virtio-gpio
   (patch 3), and its IRQs are freed in an order that still lets a
   reused IRQ number or a concurrent close() get in the way (patch 6);
 - a process blocked in read() on the request keeps gpiochip_remove()
   waiting in synchronize_srcu() until it is signalled, and with it
   device_shutdown() on power-off (patch 4);
 - the IRQ name the character device allocated leaks (patch 5).

All five were reproduced with gpio-sim on v7.3-rc5 under QEMU (x86_64,
4 vCPUs) and are still present in gpio/for-next. The loop: create a
gpio-sim chip, request a line through the character device and hold
it, set "live" to 0 while it is held, then optionally set the chip up
again and request the same line, and close the first request.

                      v7.3-rc5 (30 cycles)        with the series (100)
 v2 edges, reuse      30 WARN, 17-30 labels       0 WARN, 0 leaks
 v2 edges             0 WARN, 19-29 labels        0
 v2 sw debounce       30 WARN, 13-30 labels       0
 v1 line event        30 WARN, 14-29 labels       0
 v2 no edges          15-30 labels                0
 v2 edges, consumer   30 WARN, 15-30 labels,      0
                      17-24 IRQ names
 blocked read()       removal waits for the       removal completes,
 (v2, v1, info watch) reader to be killed         read() gets -ENODEV

The counts above are from both a KASAN and a non-KASAN build of v1;
KASAN did not report anything in these runs, the slab use-after-free
from the report needs the descriptor free to race with the close.
kmemleak does not see every leaked object, hence the ranges. The
desc_srcu warning fixed by patch 1 takes srcutree.convert_to_big=1 to
show up within a few dozen cycles of a hogged line (cycle 57 here);
with the series, 1000 cycles pass. That warning was also seen on real
hardware, on arm64 KCSAN kernels with v7.3-rc5 unbinding a USB GPIO
expander whose driver is not yet upstream, built both as an out-of-tree
module and into the kernel.

Patch 3 on its own leaves two windows, which gpio-sim does not hit: if
the chip disposes of its IRQ mappings in gpiochip_irqchip_remove() and
another device gets one of the numbers before the character device's
notifier runs, the notifier's free_irq() warns; and a close() racing
with gpiochip_remove() is not serialized against gpiod_free_irqs().
Patch 6 calls the notifier right after the chip pointer is cleared and
before gpiod_free_irqs(), and makes the release paths free their IRQs
before unregistering from it. With a test-only chip on the gpiolib
hierarchical irqchip that hands an IRQ number out again during the
removal, or sleeps in irq_bus_lock() to widen the race, 30 out of 30
cycles warn in each case with patches 1-5 and none with patch 6.

Patch 6 is kept apart from patch 3 because it changes the order of
gpiochip_remove() for in-kernel users too: interrupts they leave
requested are now freed after the chip pointer is cleared rather than
before, so the irqchip callbacks that free_irq() calls into run with
the gpiod_*() consumer calls on that chip already failing; the driver
data is still set at that point. Patch 3 is enough for the reported
use-after-free and is the smaller backport. Herve's series [1] moved the
character device's cleanup earlier in gpiochip_remove() in 2024 and was
set aside for a fix covering in-kernel users as well, which became
gpiochip_free_remaining_irqs(); patch 6 keeps that and only lets the
character device go first.

The revocable conversion posted for gpiolib [3] keeps all of these as
they are; patches 2, 4 and 6 would need rebasing over it, patch 6
because its notifier call goes right after the revocable_revoke() that
the conversion puts in gpiochip_remove().

On arm64 (QEMU virt, 4 vCPUs, KASAN), 5 cycles per case, the removal
loop gives the same picture: on v7.3-rc5 the v2 edge, debounce, v1 and
consumer cases warn in every cycle, all cases but the blocked readers
leak labels, and the blocked readers hold up the removal; with the
series none of that happens. With the test chip, the close race warns
in 10 out of 10 cycles on v7.3-rc5 for v2 and v1 alike, and in one v2
cycle KASAN reports the use-after-free of [2], free_irq() from
edge_detector_stop() on a freed irq_desc; with the series there is
neither. (The reused IRQ number only leads to a warning once patch 3
frees IRQs from the notifier, so not on v7.3-rc5.) An x86_64 KCSAN
build, default KCSAN options, shows the same warnings and stalls on
v7.3-rc5 and none with the series; KCSAN itself reported no data race
in gpiolib, also with kcsan.skip_watch=100 for the test chip and the
edge, consumer and blocked-reader cases (one report in 32 boots, in
osq_unlock() while a disk was probed during boot). The test kernels
with patch 6 also had the direction fix mentioned below applied, which
touches none of these paths.

For v2, the x86_64 removal loop (10 cycles per case, 2 for the blocked
readers) and the test chip (30 cycles) were run again on a debug and kmemleak build of this series
with the two fixes below, and on KASAN and KCSAN builds that also had
two fixes for existing code in gpiolib.c on top: no warnings, leaks or
stalls. The arm64 runs were not repeated.

User-visible change: with patch 4, a read() that is blocked on a line
request, on a v1 line event or on a chip file with watched lines when
the chip is removed returns the events still queued, if any, and then
fails with -ENODEV. On v7.3-rc5 it stays blocked until it is signalled
or an event arrives, holding up the removal. A read() started after the
removal already failed with -ENODEV, and poll() already reported
EPOLLHUP | EPOLLERR; neither changes.

For stable: patches 3, 5 and 6 fix commit ec8b6f55b981, which is in
6.12 and later. Patch 4 applies to 6.12.y as is; the SRCU read section
it changes replaced the gdev->sem rwsem in 6.9, and 5.15.y, 6.1.y and
6.6.y have that rwsem from the commit it fixes and need a different
change. There the read handlers hold gdev->sem for reading across the
whole read through call_read_locked(), wait included, and
gpiochip_remove() takes it for writing, so the backport has to drop the
rwsem around wait_event_interruptible_locked(), retake it and check
gdev->chip again, with !gdev->chip added to the wait condition. On
6.6.y the device notifier, called with the rwsem held for writing, then
wakes the reader, which gets -ENODEV once the removal drops the rwsem.
5.15.y and 6.1.y have no device notifier: the removal no longer waits,
but a blocked reader is only woken by an event or a signal, as before.

Two fixes found along the way have nothing to do with chip removal and
are sent on their own: one for the line info keeping a direction that
the driver refused (gpiolib-cdev, now at v2), one for the event clock
flags of a released line (gpiolib, v1 unchanged). This series does not
depend on them, nor they on it; all three apply to v7.3-rc5,
gpio/for-next and gpio/for-current in any order. A fix for a debounce
period race in gpiod_free_commit() that Sashiko found on the event
clock fix builds on patch 2, so it will follow once this series is in.

Direction fix: https://lore.kernel.org/r/20261016-gpiolib-cdev-direction-v2-1-aambrozewicz@nvidia.com
Event clock fix: https://lore.kernel.org/r/20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com

For transparency: an LLM coding assistant helped with the analysis, the
reproducers and test setup, and drafting the patches and messages,
hence the Assisted-by tags.

Cc'd beyond the GPIO maintainers and list: Paul for the SRCU side,
since patch 1 replaces synchronize_srcu() with srcu_barrier() before
cleanup_srcu_struct(), patch 4 moves sleeping waits out of the
gdev->srcu read section, and patch 6 relies on synchronize_srcu() on
gdev->srcu to rule out new IRQ requests through the character device;
Herve for [1], which patch 6 revisits; Jia Jia for the virtio-gpio
use-after-free report [2] that patch 3 addresses; Kent as the author of
the v2 character device; Andy, who acked the commit that patch 2 fixes.

Changes in v2:
- Patches 1, 2, 3 and 5: backtraces cut down to the warning and the
  frames that matter (Andy).
- Patch 1: Paul's Reviewed-by.
- Patch 2: gpiod_free_commit() returns early for a line that is not
  requested on a live chip and clears the label once, before the chip
  check, so now before ->free() (Andy).
- Patch 3: the IRQ check moved into free_line_irq(), with a local for
  the IRQ name; container_of() on one line; loop variable declared in
  the for (Andy).
- Patch 4: the three chip checks of the read() paths factored into
  gpiodev_check_chip() (Andy).
- Patch 5: follows the free_line_irq() shape from patch 3 (Andy).
- Patch 6: mutex_destroy() for config_mutex and irq_lock; the missing
  ->to_irq() case folded into the irq <= 0 check (Andy).
- Assisted-by tags; see the note on tools above.
- Link to v1: https://lore.kernel.org/r/20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com

[1] https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/
[2] https://lore.kernel.org/all/20260817070429.157993-1-physicalmtea@gmail.com/
[3] https://lore.kernel.org/all/20261011121246.162759-1-tzungbi@kernel.org/

Adrian Ambrozewicz (6):
  gpiolib: wait for pending label frees before cleaning up desc_srcu
  gpiolib: free the label of lines released after their chip was removed
  gpiolib: cdev: do not free line IRQs again after the chip is removed
  gpiolib: cdev: don't sleep in the SRCU read section in read()
  gpiolib: cdev: don't leak the IRQ name when the chip is removed
  gpiolib: let the character device free its IRQs first on chip removal

 drivers/gpio/gpiolib-cdev.c | 146 +++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.c      |  39 ++++++++--
 2 files changed, 140 insertions(+), 45 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0

