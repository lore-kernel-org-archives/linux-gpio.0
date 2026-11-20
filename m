Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162444;
	b=l2ncP6cgh+Ml1nqj2+qrfv/R9gUHBvak4ErF/zk58/Fws84W51iSf216VGzrmyfqbONa
	 2QYe7JFXXdYyNB4ROYS8f93vgg8i8B7JDx4g/XBekWUo763/ZVxn34ymBhOrPlwJYEWco
	 dGg3Wt6BrsFDHeiVzq57Q8MHwIODU1ZyCfJFyO99Z7Rt8NQOeCcgsHvyMT7+8Ne6wveRQ
	 1Yqqr+W/bQ8lHfy1RaV7O5TqqLi76pjghZ+ANJkrykc6NGdYqSjJTbG+JcvOq3KG44U+D
	 34xbZH02/ugArz1byYqRQ16rfOe7hjK84itj5ao/tL1Xx2OhW9a9b6mmgCSWvF/mKJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162444;
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
	bh=zafxUMf8Wv64kfXMRMMjbw2D8NoiqZcAVwGVSFPQvs8=;
	b=nJBY+oKZwVlOa5YOj7yyr4pRriFSEjnp2Da1NWCs9WDLetTFvRM70hRt7iUPzMqp9iKC
	 dBeL/OICQ3HoKf9zv9o6lGTstCumg/x9bMK+X1nSfrpsZS3JyG08bwSPYyyfxntgErH29
	 UjKGADLVsjg22cThI8t1SZLs8LI0PEIl4ZKxXl216gynrhV+dKS+U3F7KtyzFjPROwjaz
	 2W3QcBcejJ3HIx/wV5h5lt/jn2rQwbtEhk7bMpm1onmKuLCedD0EtkJhIlX8OGQEovWbR
	 9Yeqex0wCTiHkQQE7T8iblrpt1eFXU2i440l6ZV/RJQQ4caQmit2ui+6bpVWN4cd4hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LMpeeFEC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.38
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D95606A320;
	Fri, 20 Nov 2026 08:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D95606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LMpeeFEC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2dZpTgeluRCrY4yp/8lLOIgNTjo2ZPAvl9uHVWaB3Vhyl6jx/qM9EEbzEYjKBQ+lZZemq6zCH9B+OPmy6n8Pf8LaO3yiROEdNkoeS9Ghu+Zxst2/gjhBXc8gxigPghTNf82Rbnnz3e8/RUmHbIvvFVTT1968QWf2wMdiwBeLbXFyI2p1gxiOw7e54BTAues8XipedF/13yvtRJm/imPspR9CwuFj9rM+IxXtSR3LZkAXdntRORRi9o4LLQf+g4zc/jMwHKmDGcV5qcwnWi9Ic6a0cX1bu1zyVy/hARQRVDAxII2cCdO1xqKUEi21+2lk424CpsI7mMvO6HxP7hTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zafxUMf8Wv64kfXMRMMjbw2D8NoiqZcAVwGVSFPQvs8=;
 b=N+tfsu6gOVzSX6sbnhgXcZ+2ajN4nkBPETqJH1RJV25/iShCODGoIiaYWo/258a0wsQf20EAm2J1F3qWxR40lfHsxqVw6pW8y3BJtR3SfdB5x/cCDRgDo1AwS3MZV/NeGH/1QSvIfH4NUZiKhUyiuRUK5OeyePRnSFcYHZbIRhedN+DGLp3rZ1M+wfiuXtKlQOqQGfuw1X8klRXcEk4NmO6//wUvSfMgTbmvv3U/Hb8AnKaohLKrmK6/ihpxJKBk4E0yf1FK75nLmrSJfbmq33M2nam/jVDYG6n9DHBqZia0yL+daAsV0EiR2nUtDTXLY3zQ+9J5KZ9IE4uFMFgekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zafxUMf8Wv64kfXMRMMjbw2D8NoiqZcAVwGVSFPQvs8=;
 b=LMpeeFECErzbMcrUD7us0qvMzARB6ZeuwBCcUzoWUTwlhqgeETZA5Evb9zAzV7zsqg1CbO5FOurmsNqwoM5Qbot/VsQVY7IH8SYTxOBGo5hNcHHpH7WPQ7vAo/morYU07oGMo45EwYC5XZSaNB6p/2WdceU1AkJHwr1qbFRdrraoVa3RqWGhz6E4l/jq80fs1vziLu5CCjMhIWpifOcM1t4ZswE2CkpJT+qKTChHu+OnHG4XXr2fp4PiezQX+IdfSHNVlAqgVBNQmEswxXBoldcOfvNph+WvIx2CVh1JRal7VhtMOTaLWPP/idNEH9bMscnEG0gBBWE9b4bFExpkqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:13:59 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 08:13:59 +0000
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
Subject: [PATCH v7 0/8] gpiolib: fix chip removal with lines still requested from user space
Date: Fri, 20 Nov 2026 10:13:52 +0200
Message-ID: <20261120-gpiolib-chip-removal-v7-0-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0005.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::15) To PH7PR12MB5974.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: c75c69e1-ac77-48a6-914d-08df46de3aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|261022075727099003|11063799006|261026140227099003|261021123027099003|261009223027099003|261021121427099003|261102123227099003|10067099003|261026121527099003|261022105027099003|56012099006|261028144727099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mQmTn7DqZ9yKHcWQfW/cFO+vfLjMdyLHRQv6agkp7ZwyJyo0FsikwHrEwsD+sbtozDEBedd0yLv/8q+eQN8kg4BRsELAR/bnpGZJHO5aQ9bHYeTU01C+7laJdouH0XieAtWbr7PzAZ1E/9hG+xN1vSrQynijMF9aXnwqGawGMAQfxSdemdPBaJb/xXLy92jOgLDx5FgQCw7QpdwHvHsnW35IrLJJObHGfwUCqJTulC7nmZTyYM/xUWqpsC5Wz6SqRz0O9Qqv47HgD6S15WMSy5jkSLakkyjvVWkiQ/lvTwwaIqBTvv1etdQVh9iCCFC6vFs2OT+JP72QeFukPOyIWPZM4mW9NTuJF42bXx5xsnxk9UdHOSA+opkEWjGmJMv2GrQdqFFbjrUZTmon428VelTn2r2hgK/QCb649YRqCVrOaEqVqIkXo6hNb20SZrrqXjqeoOfzeSmZqrtRMhL1heAxx/SHheNsXlUfcFo1IDDNLdlHIGucrxuobUMGRDAXFY19UW1nLMBjJUj5amswvAS3QRilNtddhdkIfpb6RwH/Nq1Dmrov2wsb8Ev3jdLBqpTlyRSwV0+95zXY3S98IjCQDqOoYGf/lE9e1MTeGhsHS+aelL7vaOy9HPudTKwbksDWBh+NEqYkau+B85YS0CJR0MRh6P3huhCuvnADedU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(261022075727099003)(11063799006)(261026140227099003)(261021123027099003)(261009223027099003)(261021121427099003)(261102123227099003)(10067099003)(261026121527099003)(261022105027099003)(56012099006)(261028144727099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VIEQ2Wg/gi4RGym4SnbP+ogtahRb1mi8YzxU4VK5UYlfqmLcLeQP34NSfbII?=
 =?us-ascii?Q?sXN9lB1kRLHe9BWNLeCqCkRYVglhevDWTwmdzwMsq7V2wYa9qAOb+luL9Pec?=
 =?us-ascii?Q?ZC4chygxUywxb1TZliIIS7tBQ31kbQVsAzZS4bgKxu5F2avPc3rj4c95lz6d?=
 =?us-ascii?Q?zPl0Ki3NHGxA+zvses3CtyfZiV1i/9sS+Us3/a51QjQoJEUuNi3B6jqRYj0a?=
 =?us-ascii?Q?riFJNzIUjhXYJc/FtPdr+5mHM17f9dzB9tt2dxiUTIyJ9DKSvlGEf+uEfnE3?=
 =?us-ascii?Q?/IswQS8jHnclzk2dTZDf6/4Ud2/i8Q9BVYW5aBZiD+QgnS8U1jeRn65YQ5hD?=
 =?us-ascii?Q?+ZuB2PvO20mQoxUJPtrsQejLAlIJTlY1n2S/DWZDu6fUOccBepJziajoDMnL?=
 =?us-ascii?Q?0on4PvWEhIoEyAsqPV+rv+ezlDkZ1scWmnBeptF5MG3JQpnpqaCCIk+HiU0K?=
 =?us-ascii?Q?YidvTgQXfuK30Xl+2qkP2fwlAZvoQ0tCjndB0YWZ3HxmSyL24uM2qLLkbwQ3?=
 =?us-ascii?Q?/hT9yI7znFmNva0Xa0Wmli3pLw2r2i6j0+jfndY602L5rF5oF1h6rYTphYX7?=
 =?us-ascii?Q?rUhkDjRNNOf3pjBhdD6CvcUcQ+6SG3d/AdVK8lZ8G4GujhnSxSZ4RQUfcsMi?=
 =?us-ascii?Q?7DVq0kxNXNv/YL0QA0NWjzKkjYCDa4UBLTV6mU4XiqgG9ImP0Iw+X6DxNZvA?=
 =?us-ascii?Q?kZwsHk0ulmLzNXXpyMJ8J7/KYIFdi0HPnX+VLutGw/SZG/9WY2psGGvR7xSW?=
 =?us-ascii?Q?U8Kw4sF/Dd+mKDHv1vdtmTO/NyIbg8e4JqH0iRMkkKyUJJey7o3DWoCU0ZUD?=
 =?us-ascii?Q?uY4LyXYTu8ZXI3P8Cwsh7ENj12K884+IKgVHgKRUSr9n5MpJ4P5028KgzHbZ?=
 =?us-ascii?Q?1ZcpauW3AMmevKpgdg4zLT/Mb1o5nnRHuon/7Ud9UxOOajQpImUywsqr6M84?=
 =?us-ascii?Q?ZqgCcu3xB02J8kUMey3Jua6wig4pAzx+u7tip+vn9NzXpLAPaKAWIQJd+zB0?=
 =?us-ascii?Q?KHAzCrZ1XEhuVWHHbdqJmLksWA4TN16VvINhLcdJdODLj6MRfdJYuWPZZ7oH?=
 =?us-ascii?Q?/HddCd9/inlO+E5XkS3Jmc5++FcIgN3ghTlgHGLBSfUY5U/Fdk2i8onET8cX?=
 =?us-ascii?Q?M17DMcfbIfv0Yz5c8gW9Gb0dibyG/UeteLs0Sf8nHdikQLk+DhxfsoaUuXBA?=
 =?us-ascii?Q?o4jQ4uRhnJnqg+S8HJdLnKh7W6+nlIQ1nYGxZNzSSUGcwqO9+3k8EJGgLDDx?=
 =?us-ascii?Q?rKM2VSszc/ibo8gye8a6701E9tliJ+7tvitIz2YlnvntNcbT2owopsq+zOuE?=
 =?us-ascii?Q?kPGXyGTXy9uDkgPTd7CrCjhDU0oT3/fH1rhpgf/xi6x7jRgvn8FyEVxSF9mF?=
 =?us-ascii?Q?UtKN/+ONyxGPKTeiQvYCMVSX7bMxWT4OGlDZrJ3ovIpr30tpUkLISTqbW6eX?=
 =?us-ascii?Q?S3BHrnYl0MTAFuCGgC7X3VcHS7pZ6vVjW7x5bghrW3FLMMW/vepqN2Ik1c+N?=
 =?us-ascii?Q?U7w8fcMHGJ9tRNWGhMXusq8f23MQqtIYMOlPu6HutbPSxgGtyrT1iEjdGnso?=
 =?us-ascii?Q?IrVyu0goq46U13NkWpcxJN+jW1YKFJ8BkyI3TgoOJaBatkqnDf118gD4TsQ3?=
 =?us-ascii?Q?HGChBqkO5Kgf57uFWsNjwqou4cb1iR9F9CYbOMBr3yn4l3fyI4IiZdBAcxn4?=
 =?us-ascii?Q?swWOu2Y+nLObbo44k/WjGUZf8lEpTiv7+tcGQ1QvfeKL0Vr2OgOPn1uDPMyG?=
 =?us-ascii?Q?O4d6QwefFw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75c69e1-ac77-48a6-914d-08df46de3aa7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 08:13:59.2072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUCxi2X+MkeuH2Bj8stABW1YQjtjPDo7YTkPxSSUHjD5O9J+2l37V8PHNzMhZ1nFywB1msWRKkxhpqFHdZRE3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818

Removing a GPIO chip while user space holds a line request, as when a
hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
a blocked read() stall the removal (patch 4). Patch 1 makes
gpiodev_release() wait for pending label frees; without it,
cleanup_srcu_struct() can warn, more often with patch 2.

Patch 7 also affects in-kernel users: their remaining IRQs are freed
after the chip pointer is cleared, when gpiod_*() calls fail. Patch 6
drops edge events whose line read fails instead of reporting an edge.

User-visible change: a read() blocked when the chip is removed returns
the queued events, then fails with -ENODEV.

For stable: patch 2 needs 1, patch 7 needs 6 and patch 8 needs 7;
patches 3, 5 and 7 fix a 6.13 commit also in 6.12.y, patch 8 a 6.19
commit; patch 4 applies to 6.12.y.

Tested under QEMU (x86_64, arm64) with gpio-sim, a shared gpio-sim line
and a test chip on the hierarchical irqchip, with lockdep, kmemleak and
KASAN.

Prepared with Cursor and Claude Code, using Claude, which helped analyse
the bugs, write the reproducers and draft the patches; I reviewed and
tested every change.

Changes in v7:
- Rebased on gpio/for-current (over the line state workqueue fix).
- Patch 7: drop two redundant desc checks in linereq_free() (Kent).
- Link to v6: https://lore.kernel.org/r/20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com

Changes in v6:
- Rebased on gpio/for-current (patch 2 over the flags rework).
- New patch 8: remove the shared GPIO proxies first (Sashiko).
- Patch 7: cite Herve's proposal as [1] (Andy, Herve).
- Dropped the Assisted-by tags (removed upstream).
- Link to v5: https://lore.kernel.org/r/20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com

Changes in v5:
- Rebased on gpio/for-current.
- Patch 6: describe driver ->get() errors; new Fixes tags (Kent,
  Bartosz).
- Link to v4: https://lore.kernel.org/r/20261029-gpiolib-chip-removal-v4-0-aambrozewicz@nvidia.com

Changes in v4:
- Rebased on gpio/for-current.
- New patch 6: drop edge events when a line read fails (Sashiko).
- Patch 2: the NULL label fix was applied separately (Sashiko):
  https://lore.kernel.org/r/20261022083343.3905973-3-aambrozewicz@nvidia.com
- Patch 5: moving irq_label above irq in struct line moves the 4-byte
  hole rather than removing it (Andy).
- Link to v3: https://lore.kernel.org/r/20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com

Changes in v3:
- Rebased on gpio/for-current; shorter commit messages (Kent, Bartosz).
- Patch 6 (now 7): return early when there is no ->to_irq(); drop the
  lineevent_free() comment (Kent).
- Sashiko's v2 6/6 finding on gpiochip_setup_dev(): separate fix
  planned.
- Link to v2: https://lore.kernel.org/r/20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com
- Link to v1: https://lore.kernel.org/r/20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com

Adrian Ambrozewicz (8):
  gpiolib: wait for pending label frees before cleaning up desc_srcu
  gpiolib: free the label of lines released after their chip was removed
  gpiolib: cdev: do not free line IRQs again after the chip is removed
  gpiolib: cdev: don't sleep in the SRCU read section in read()
  gpiolib: cdev: don't leak the IRQ name when the chip is removed
  gpiolib: cdev: don't report a failed line read as an edge
  gpiolib: let the character device free its IRQs first on chip removal
  gpiolib: remove the shared GPIO proxies before freeing the remaining
    IRQs

 drivers/gpio/gpiolib-cdev.c | 157 ++++++++++++++++++++++++++----------
 drivers/gpio/gpiolib.c      |  38 +++++++--
 2 files changed, 146 insertions(+), 49 deletions(-)


base-commit: e6e2181c6920ff59ded349a100f80cf85d074601
-- 
2.43.0

