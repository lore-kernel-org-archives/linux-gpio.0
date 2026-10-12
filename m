Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010016.outbound.protection.outlook.com [52.101.193.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80383CB907;
	Mon, 12 Oct 2026 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813028; cv=fail; b=WGHhnIAzBAFWiHNHsid6D2LRu/NnZJv0OmPjb48vresxPAqkVQHaWiV7mWQKhjY3aHxG8HVhU3TkYQp6zvC0C7awpkxxCAqGYz/XfCCdGI5TIWIT0Hn8jzCgpgPYpJ4D4Siz0zvYxxNu9T6BFCucCdynVuXxlKSEVIPCvlRepHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813028; c=relaxed/simple;
	bh=3JH8YMPSO/PJfDnRDIEDCWv/sm5hesbk/NNQdlcmr6o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YERmdCNsnfY46XmTgAlsRrF/6xlUsvk2mDLvJmYi2erV0hnAXR83cZrxLaa2yoLoxdbw6wictVdheuPC6hg3/95MQxk7twi/m1ZjggwptpTdHTkGO4WFYr0Dl9O1Pld3BrlUPdJ8FGx1pzW/UsOQO7EbEgO8fVJ9wtJUCj6NClk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WNKJeE24; arc=fail smtp.client-ip=52.101.193.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WNKJeE24"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ3EXX9LwonLgPxK9WHvxHms2vqjkVDzt5nxPSkVQjftua19JvtujkGR8EzmzGuSWQW030SebWQDACWhTxZaaMT9QtlUQvN5/A1u77SicEc+pFh/Lpph2guFSuhAO5lsdXPXTNjgJmjsbm54w7yTahJhXbPusWJ9CV8VJg50GqazA0p6mC7LCAx8iK6DYkB50MZRqjz4rtU77K/zKaQkFaWDMqElynJTyLndKJiPyeayy/eq3sgWurq8/s4n9I8fJrNQJXo0Kea31yttlQkJL8WmysO0++D0kmZMa6fIRnDvuErQcslJBv2l+myG2XF04o94JS0L7SkO9RdDnsKpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvAdIpPjsw0TqgL1Bi+YLhkggaby6mVQlgoI/+TjB5M=;
 b=HckWRPr7KF2KnR0TIrU4HYzz6piqGxauG/gCes43LMIUPKjnYHugzeP2voPfnNYUeLXmBwva4u0m/FN0EBZPGkWaCtMxUtumnlkHcg95YLb7/e8O6j6KlHCZDLCIvCu2kLc5k+OSTzIDMQURxS+8Q+z8apjA5sf9EEyiRraN/y2EuLCaRHs4VP1iGwDjxh6YMLsKB+fAKN88m7WpRZuCwB4RDteA+rdCvNoGDqJPIEq778I1G5i6b0j4Z1GSW7X2/yKVXgx2L/a94MpcZtrkqt3dBqLctkEFgy6EUmMfnXdMNMTjt9gKS3BHa+0fEgSv41ZbdKukzSBJ9aTEv+xNDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvAdIpPjsw0TqgL1Bi+YLhkggaby6mVQlgoI/+TjB5M=;
 b=WNKJeE24EwRh6isoFrnlX2tdmQ8dA1uz18XvhFdqhSINxByAyRAgvBc34hqaxhRduwpeyoXXCG1Ce8uIfoLdLV7zoEvqt8TLAe0NfNMVRZRlkDNcHvAuHl1o0/FJkaoLjBsend+N8CFc55EBusv4TQw0HJxUhAcyoZ85rkWfokjp2YGDnWdCTEy4LxktltjhbomGq/p98ZlmYue/xVNxdnGCqf2v9sYzpN3R0MlApnYXox9ujk5NgVF/90fG/87i6eRkhOI9ehju7XTA0eR++DUjBICq0rOX/63BPXtA3Ecjyoor9mnsS9YC2Ly12TdqIZjbS6qsrF5fFU6L9MgMYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Mon, 12 Oct
 2026 13:50:16 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0496.010; Mon, 12 Oct 2026
 13:50:16 +0000
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
Subject: [PATCH 0/6] gpiolib: fix chip removal with lines still requested from user space
Date: Mon, 12 Oct 2026 16:49:54 +0300
Message-ID: <20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0031.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::14) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: de138e3b-2002-4669-bccb-08df2867bf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|11063799006|10067099003|5023799004|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	CF6WCJnvMelQq7cCnJAcwRlJDdQxJ0/J0ewMgix5bTkVB0dWhb6F6Z8Br7ylaLuvX7T7LLiepBnPfmHwfflZHCupy3UuluhWbAYMs3Gxy02yK2LZsbAOcSeKMEvWIk/WUkfuJ2w5I3vQVaaXKUSMsX6MUIOq9ElnCMdX+Fe+RPoEecVQ3kyj/2h1Nq2BhVIrK2JTpb6wwuQ9CwOYaQENCALV92fBvR22NH/y34Mp2rg1t0v8hmmeYTOufvjRTr9d/QbRlMcJwsKZIS6LH77ypusrCY/j7StRf+52T1tzzGxN5M7lP9S5teKf3/P0TN0nonAoJL8LJPZxiv+ZHS5gNrgd9hDvEJXy/XM3ZbssGG7gE32yN0OiY+XeZ6PCNaKeFg4HL+dTFkP6XHOZTkb5RtcRv6OwCTYGlspNaPLzwYC/0WFO5OYkZPe/OSfrTpv4dJD2bGoHQou0kospXmYXCFKEiGSm6/aMP5nsD/F1WlI7/LqWVkBkhwNTx4RWJVhO+b2a/J4YskBmaVVM0puhc2F4bgV3wAANNtUWBBKSK5Y0/kNUCY+OrBHNHDb3YFXZ2c1jqvUbwiaKhCZdKSB6EmXjVB7IkFjySFT42oLU+IwVTYi9bfA7hF62qWRz3GPegh72ZsM+CroDBl/s8RqtGlYjfyFCTR6awPGlTZR+Sg0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(11063799006)(10067099003)(5023799004)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Wl5VWqYt9Pr7b/bDYYafLfapvy0x31r6Gsg4gbcKHkCAi1F+Rc0Y+BB9HQW?=
 =?us-ascii?Q?pbJDDiPbTJ3bWGPyZPsQ61c5POAf7AAqyiVnhNr63Lx7+9af7vklRid6n80C?=
 =?us-ascii?Q?61yMEs5nwJ09SGNQZc1sOZ/jMPFzKQSC1SHvJvD4egFtWkROznB99HsjnKwr?=
 =?us-ascii?Q?lenGRDyJJ0NMfmcEYcdMnabuqNILWUwI6Zm88Jw7q7VgbQaQCea8yC14l9Wq?=
 =?us-ascii?Q?MLpac3GM4mP4mWR7QLLBFzo332+8I+WGnT5XNH7w5delXc3rNPwapsPlR8as?=
 =?us-ascii?Q?av1wgodSBhEP8yB9K6LYypgFMkscohayZYZe2xONMAQsvqQFNDUJn0OTIaxI?=
 =?us-ascii?Q?CQRuwmEbLdAppDdo9C7JIHkCPS9iJhdSaXQ0+pIkuP/UiT3qOw/YrBT0h1xj?=
 =?us-ascii?Q?yWha96jhnsAV1dZgOOv4sPQbbe9srTGRFN5GbL0tGw9ffQp82S9MY/CRrE8l?=
 =?us-ascii?Q?So7I5gHH0lROWlZcZ1vRiKM5gSLxt9afy1g1Ybg0Sm71oVqd1F1FHNVdUTt0?=
 =?us-ascii?Q?xM2xSloLAI2E3MksE0hyPd7EyU667YND/J95/XTgX17IqvIwiDTH5ui4Ccfp?=
 =?us-ascii?Q?x/9LlLWXzhMrmP38EBmdjShWCMl0ZAYexpGAkTo5kFRUwUGxCma6jYoYKC7x?=
 =?us-ascii?Q?hXI0CXa6Lyc525sNmTrQfJVrj2Jp5SdKGpLpPAeB9S5DWQ7bO5SOfHk7SqyW?=
 =?us-ascii?Q?OEO/9VFQOV1Z4Nx9z04rglF1WxYxp0csp8v/VtgqBBJgI0x7o6P0NsK29tKF?=
 =?us-ascii?Q?9SVlNWcMz+IM6iihAU+NcYJgusIjXgCbWuTKi3QuLkMM3xvfd2s+DvWQyT5d?=
 =?us-ascii?Q?jGfaMTLeXExO63k2oRMV4TknUnE29JoWhEOHnbdjCzA5MJs5QpwyGyu1tjxD?=
 =?us-ascii?Q?sYAwf8W34xpayd3eIr6lvzwiEoOS2O/ZxjDBSoAEIej9tIleLbJC/5qgKnO8?=
 =?us-ascii?Q?3r8YLNqS2Zu1FzzbWga8Rg97m8tDffpf2FnS/xh8I9FGSS83FkJIY4heISQH?=
 =?us-ascii?Q?PbXtX5gQHh4HrOvV4cCkZyc1QREvdZebd5uyQJuPLe27fxydBt2xLZ8xSSy/?=
 =?us-ascii?Q?z/52Agb35lWOIi+pzGl/Kv40vxOQM+V6n//88kcTBYrKRe9yn0BkadENCo36?=
 =?us-ascii?Q?5xNFOihDM7e+zrMAAkvagn/+b96CfqaePBuu4Ct8oZcwoxxV85pBbN/pMPqo?=
 =?us-ascii?Q?7ioCHQIckfguROiFHFUeFeI7ne08TRlm6tIw2Rm6QFSEEIzIcnNMpvHRjO3C?=
 =?us-ascii?Q?t7uNuMgmQJIBbWYThrCD+XDo7R6CVwz7AWCko8iQS3h0KWyZqqtNhEJbxqjj?=
 =?us-ascii?Q?gjFUzgcnrQ6flZw62jhBCsiqWE5+BhYggrrwjY7OdChiLx449P9zEQHfMnq/?=
 =?us-ascii?Q?Xxhf1U7subSbAM9zOHyec/63Bi4ZT3JzYfuwbNFqb1jjdZ2PbuwR//Rlt1d2?=
 =?us-ascii?Q?RJhbunyq83LCSMF2yHf+NNC6hhGDgZDVf0or/S5QL4fc2uJcMPyq0W1J2Bnb?=
 =?us-ascii?Q?GA/AMH9HWqoSxbGOVDDbDJ62qmCmKWHHuahHPovHMDZBffiL4nGGx41NdD/I?=
 =?us-ascii?Q?ATqhdF21Mxw0DE+51Q0kWYuXu3wLzbBuyPMVkNQ4vCMkWwLXsanSqSViuAUE?=
 =?us-ascii?Q?FJcZQHr/MDkW4fSmV0ie6Lw33pI0fuqg2z+WcEP28hwbuhRrat2tHgYaU/Aq?=
 =?us-ascii?Q?mmRK5hNXtAl58wf5+Y1uz1DpWx8UD8Rl2bbw0/DTeY+8I9Ps/RBG+Cx9DymC?=
 =?us-ascii?Q?YUzlwSI4Uw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de138e3b-2002-4669-bccb-08df2867bf12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:50:16.3494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+HFrC2HZNWqncP1ZJKYxhLj+nMPJnvsPDhEmAow8lcoYfMQgGuID7HcBryP4C6nzPf+exkDaH+Uz9RM4mcq5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

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

The counts above are from both a KASAN and a non-KASAN build; KASAN did
not report anything in these runs, the slab use-after-free from the
report needs the descriptor free to race with the close. kmemleak does
not see every leaked object, hence the ranges. The desc_srcu warning
fixed by patch 1 takes srcutree.convert_to_big=1 to show up within a
few dozen cycles of a hogged line (cycle 57 here); with the series,
1000 cycles pass. That warning was also seen on real hardware, on arm64
KCSAN kernels with v7.3-rc5 unbinding a USB GPIO expander whose driver
is not yet upstream, built both as an out-of-tree module and into the
kernel.

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
the driver refused (gpiolib-cdev), one for the event clock flags of a
released line (gpiolib). This series does not depend on them, nor they
on it; all three apply to v7.3-rc5, gpio/for-next and gpio/for-current
in any order.

Direction fix: https://lore.kernel.org/r/20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com
Event clock fix: https://lore.kernel.org/r/20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com

Cc'd beyond the GPIO maintainers and list: Paul for the SRCU side,
since patch 1 replaces synchronize_srcu() with srcu_barrier() before
cleanup_srcu_struct(), patch 4 moves sleeping waits out of the
gdev->srcu read section, and patch 6 relies on synchronize_srcu() on
gdev->srcu to rule out new IRQ requests through the character device;
Herve for [1], which patch 6 revisits; Jia Jia for the virtio-gpio
use-after-free report [2] that patch 3 addresses; Kent as the author of
the v2 character device; Andy, who acked the commit that patch 2 fixes.

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

 drivers/gpio/gpiolib-cdev.c | 136 +++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.c      |  34 +++++++--
 2 files changed, 130 insertions(+), 40 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0

