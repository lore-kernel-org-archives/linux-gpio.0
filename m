Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701963;
	b=vs5uBnBXs9Kun0oOX89gvJkL8voGmrI8Bo0rwkdcoeYGKe7nc+bFd88cwohmvUPTXHvo
	 0DESRCaZtfNwtt7mBahU5bYhDuKJMxBY1lX8sJvbb545vGlqkXeeUJNXkMkk9W7DqGh0A
	 63tYZkHuik2brtW08XQaxod1Q0UEgjuUzd0kEDFDUq5CWt5RIwncqsL/9p9CHUka29s3+
	 xvRiM04fJXdWgtZDNdCV9OHv09ny8wYxtTE35kf0Kj/tMEKPBNLBOydtQIk1zxLtZpF8t
	 Z+XeqDFxbAugiuy7Qkhp7Tkk6br/iWRhh7mg8HMz16FZqrc0d2yl2ZyiRLnk6wOy1lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701963;
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
	bh=QjrQ+13PCMXt6+RE5j3+N1cJNjVPLKjIDPu9mhENWxI=;
	b=4jg3rLTwQY91LoGEGx46aJ7cwpy67KHQr9GnBeCABvbB2tUeWQQQAMx2ih8h4QM7YHpj
	 iI/QziQOTXKWKWMEtMLwPK8zxe0keuOKWy7yJTTMap9G55N8KOXO1rSxN/FNmc+AI0LvR
	 h7IgkFp8aL2yoZ+3LY1+yA5bsPHGapiRj3vzvCMZoWRpzj5jKzcVMjZaoaX2ufJyd6nzl
	 GncZIS4CpkZeNavxaU41iZ0VKpvuPjAR84Qa0Fnq/h8dQuOeo0AR9FRRfIPo/gswl9R8m
	 utd3Kpu/S60+PTxd7KaZqkSfkiFavgWXLqLzB5kjwswEQhzpIB3ULHrRepjszJkHEjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fJdnioHP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.32
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F32606BA5A;
	Tue,  3 Nov 2026 10:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F32606BA5A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fJdnioHP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRL5vf6w2T5UxBNn/TajYYxxPwrpdeDtKywPpgNLClbgAM39vzXQWNuhV3MgMJqncZFtmVXcBrDCnmN7ZQnk1qr6BJhpd5WoxVpaOnc/rOEWX6ArR9iUHAjZmvm7OGVCAQich9PmUv6RZZpkwWIRMnkBnKoX/JKM0mU7rqYQE1trdziB7nK9A0IDaNn4ZsDmo6j1+aTZf0OnUWVKmWlaiu/Ql2y0iuS9oiRzjnndSvqm8u8b38ewCZWiXhjZjn2PkLKCb7Mz2tI84bB0y/mv0Y13JnrErfmbSuUn2AADrWARnCefqVdlaEcZywukLrVO4sSv+/u1UdevOesUcuE/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjrQ+13PCMXt6+RE5j3+N1cJNjVPLKjIDPu9mhENWxI=;
 b=ayFFxm9FWiWAJTcKif5TjfYW5BEjl2dwFgLo/+Fz/4Fd1ww+mWiwyvz4isuUuzWmQ/9iXMmH8ZPL5cQuHyThvvBaBf1Kb//tJsb/MU7okZYTGRH1OLA85ZMVhGzee9JZbcVnbZnKHsurGNbMTtLp9stq+l91KxkAVsGIwAfnLPY2Ok7qVTfoLoDhmP5mVShxjxkk/UJPTT5GvrwsGLKkeB03rilB+O989+5rAwC8pktULr31KwQPl6OLk8iqmqwNLHPIJhyPi/moV+IYZlgJNRSOW5J5F0VZUaN2hW4M6iXxf6cWV0l15krLtKCYQtB+f1yDXJyFvjRlZqusArKfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjrQ+13PCMXt6+RE5j3+N1cJNjVPLKjIDPu9mhENWxI=;
 b=fJdnioHPt2qnNyseIpO0KGAowSwvlKuwEEc8UywdTveykEkfYtATQIxtPCRttl4Nc9wGsXH7hcWdfXfeDkrgOPYlBxn1cUl9c5bHHw+LpOJRDtEFgWnSmfkCTbK2DdaOPa4D7nq9DaevfFevFi0o37NF43M1Lg8T9w4DhTMBGlzM+W3/dOT7xTqdnWzt7dR7iJ+SWlScpsrSW+O+KfWpUlBe088UGlAvt+75qaZY6ejjeI13RoovEt4P2F3bpIRW3g2AP0ZouZOExhu72vndpUCC7yRGtKBwIpYAw2UxkUNKAQuP8X0vGV0f49HaWwlG80qg6Xm7udyTHIgcKGHlbA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:32:38 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 10:32:37 +0000
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
Subject: [PATCH v5 0/7] gpiolib: fix chip removal with lines still requested from user space
Date: Tue,  3 Nov 2026 12:32:33 +0200
Message-ID: <20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0204.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::20) To PH7PR12MB5974.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: f34073eb-a799-4368-6ff7-08df3995c7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|261102123227099003|56012099006|11063799006|261009223027099003|261022075727099003|261021121427099003|261028144727099003|261021123027099003|261026140227099003|261022105027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	QxU/Y51XYVHycZdj9NgDPeqaK3QlPR2yJ8INvtu5e70rvjqPLLTtlltxHEe4x3z1kii87psfaasTz0iooMPi3BcSWb4b67Yi57LITCA0KJIDPtiEIE/1oqH8h2sv3xy3JsMxu7IkBQM8J1hD8gpIXklaL+jRf59WXcZSyOiLq16kSgB7RtcqUv4Ao0W++xNHgtsVPJbuauFAnjrvTQNXC+fImgGo51EOCJdNzyquNnRX7+se0Ps7QZRHHEW0bij6vp7CEYcQL4koarcjhuyugqkkBTQTJ5pCZPPBs8+JeHACxzcU6fO3V7t+bKXK/PuxmJj3iH9bkxbcgZBpcus/jj0r/CiXCfqL4kt7fIIMJ8TXqwmhC2YC5oz6kLmEDY9wUY0gWyfqRkP4WsfpCOTDLPKG2QDroNQpUjCYSGlYtfleSRhJjR6xmVFx9KDHCnyfzo1w1JE3E0wBFokyVe7SNkbiGA73ZXeMpKx4CoZa29VICHMcBRL+kudMfj0D0XPE2gL2DlKsVmHfUdO3UAGVzTtfijKVdE/PXnOXunfpoeLJHrpYZyQjkRzFx/JVtuhvD12xzWBFseEko2IZVsuq+5aMWHXOyGbZagJBbU0Ix6Uh1RrGeKNkagWVJltm4uXUtxbt5GhO5AlBD4RsgO5UDO9JmNxs5wD94V3gw4fbY1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(261102123227099003)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261021123027099003)(261026140227099003)(261022105027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2poNK+WQcj6ppt0Gz4T0ikFE0LQnbA3wOriIQyE+5lrgBD4NuDOIMdXxmKEH?=
 =?us-ascii?Q?bTmmnCC39BZGk9oZebtpcsubpHxH1OjxyBWe4F6ENzgyJEHg3DZXbxKXg08d?=
 =?us-ascii?Q?TuroULl7T4HYpvzvZ9Du187J+jzMpwbKDRv7OLYwI75vn+/oVfKp7q+xCoSc?=
 =?us-ascii?Q?7u5zCWQfcPjqCOHo+G/hZwisdQ68MQE6K0Gi9WljgTFlfZSx+9BTrothT6zr?=
 =?us-ascii?Q?08aDPcGx59mR8eQ716b13lB0pm89KupY8ogyCJfdq4FePeUZPdwTManSZyjB?=
 =?us-ascii?Q?fSSgl2ZjJQvuBjGU4YdGyXYdZbAoA6OpjnXKnRtYLAkesCDwPOhQ+jAyUzO7?=
 =?us-ascii?Q?yt4a9koMDtEYegIZ1zlTQQugREVPIUCVT3HTJ3pSV6TpLme3JN+QWzdoXcUa?=
 =?us-ascii?Q?8NgDeSaGbHlwkTnPB3gZr42pPPaHnm9f0PN49YBKS0vgsWM/BBAD9BVvIPst?=
 =?us-ascii?Q?X5wQY5vh38UGCZbNqg8qBPVaeasv8EfEMLnZctmwEhh608qNeQ65+/KimJuD?=
 =?us-ascii?Q?f1sOFnhd7vQUgHzbPuiXCu3D7lMJLguY84viSVyYuZ7WxelzUqyPKCyL9qRG?=
 =?us-ascii?Q?N/Epa7G9hVCiHkxhcr2m7xXUFjW6KpbSwaTjAM8q4QrFpB+Xjq0+QmS1dr+w?=
 =?us-ascii?Q?H5FYCPpIeopr+Mkd5C27kMoR0wkhcXK/A0k8UyTeC+Bj2syun5SV2SWQnfTb?=
 =?us-ascii?Q?0D3DWQk4KDtX7b6/X/Ue2rGjvrB/BM3qaWnD+pfYbNvaCs044zlDRe4hW6C4?=
 =?us-ascii?Q?weYki/j7Lzd50fOEZHZoIg5MIX0FRpR2BFP9lA7li2aeHanA5SwrOrW5L2/1?=
 =?us-ascii?Q?X1Vab/IvLvGjV06FP8TBiuxR0FX3rF9o6lTa2dCF0O+FjQjSSgwQVM4kwRfX?=
 =?us-ascii?Q?giw6On56EyyTbPk5RgJwCfD8dABCQxFwtotYZH+fqNSadqEhUD5nUFXKmCbw?=
 =?us-ascii?Q?Nc2TQqNYg8dCBIBk8Xqu8xmpwdyBmU8hPKafDS/pOr1VWcLMJSrOtwwxI+je?=
 =?us-ascii?Q?xmjLgP7nhIFkzv0j0jRY/t4azGgxPWPMfZh7VXAR4MHbSHUVFF8sPihO4WPs?=
 =?us-ascii?Q?40JViYSR8QcrB6SKDsvATpHoJNDxOHOWs2NBrPLO623PJSJHknOKQXPk6CMp?=
 =?us-ascii?Q?2C82jsPtkMY2bvC8PVW6NzG1BaI4YSEMEOjKAzok6KiJJ5D6dKr5SVgZxsda?=
 =?us-ascii?Q?cmfgR9CECZqpx10dU+4EMpk+INd47GrBHvXJ1MNFvPA/zQEKRZ/m9KAhPj4F?=
 =?us-ascii?Q?BmHSzQZxuyc8NCQNWN4MCiN5jFFvdR5VIMDv+WLqlcmSiZZgdWgHFdnkvpAF?=
 =?us-ascii?Q?1HjlBQDRNn7xuEChlIyeBgjA4ph5iJMf9Od8ccRGH4xIly+7RMr74Vgldnit?=
 =?us-ascii?Q?6J5vtszw6T7q7icUYykdYAffvo1H9mZnFvqKmDzah0+97lVo4Izaoux0G2uk?=
 =?us-ascii?Q?lbybdR8g83PjkUDjqaC95rAjC5BzFmKjis9fkFcQg2Pn6A0mXWAZt+1Hyn9/?=
 =?us-ascii?Q?LXZWbByOHZI+MEWEsyXa+1qdd7iz4R7KIZPvyDna9kBKSoCHS9aQ6t5LEPUR?=
 =?us-ascii?Q?SHWBpHr3MHQLO+jGkKDp/iJViZCfh/kqpf5Ng2tJ3Nv24h5ZRtIgsI8vZghU?=
 =?us-ascii?Q?FyQ0fvBrjCQvnAhC67+nq4vKIqZFivXyERvfAmTFn+Dk0WJXAedIJ24gfPjP?=
 =?us-ascii?Q?XJNCqXMSZ+XPAapifamKLHwyE4XC9mI5hWq3Virx7GLmRMEBgHZZRZRtWA2x?=
 =?us-ascii?Q?S8FCIB1c8w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34073eb-a799-4368-6ff7-08df3995c7f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:32:37.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LfFBqU+IwEUPFEr8JhuhxMWR0y1LO2injR7Po4jcSAAp4ch/vou6Ygr6iTAp9h66ys5UjlnIEOIi6z0KwQeJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Removing a GPIO chip while user space holds a line request, as when a
hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
and IRQ names (patch 5), frees IRQs twice (patches 3, 7) and lets a
blocked read() stall the removal (patch 4). Patch 1 makes
gpiodev_release() wait for pending label frees; without it,
cleanup_srcu_struct() can warn, more often with patch 2.

Patch 7 also affects in-kernel users: their remaining IRQs are freed
after the chip pointer is cleared, when gpiod_*() calls fail. Patch 6
drops edge events whose line read fails instead of reporting an edge.

User-visible change: a read() blocked when the chip is removed returns
the queued events, then fails with -ENODEV.

For stable: patch 2 needs 1 and patch 7 needs 6; patches 3, 5 and 7 fix
a 6.13 commit also in 6.12.y; patch 4 applies to 6.12.y.

Tested under QEMU (x86_64) with gpio-sim and a test chip on the
hierarchical irqchip, with lockdep, kmemleak and KASAN. An LLM assistant
helped with the analysis, reproducers and drafts; I reviewed and tested
every change.

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

Adrian Ambrozewicz (7):
  gpiolib: wait for pending label frees before cleaning up desc_srcu
  gpiolib: free the label of lines released after their chip was removed
  gpiolib: cdev: do not free line IRQs again after the chip is removed
  gpiolib: cdev: don't sleep in the SRCU read section in read()
  gpiolib: cdev: don't leak the IRQ name when the chip is removed
  gpiolib: cdev: don't report a failed line read as an edge
  gpiolib: let the character device free its IRQs first on chip removal

 drivers/gpio/gpiolib-cdev.c | 155 +++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.c      |  38 +++++++--
 2 files changed, 147 insertions(+), 46 deletions(-)


base-commit: 9e4b35c95fede87bad36f68b7ff1eae94ea6b910
-- 
2.43.0

