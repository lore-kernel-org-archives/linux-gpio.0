Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836842;
	b=3upLIGqBgH7fXkTs0tsMihpTRujldgxnhrLDTUoOQHVd0XzoTjYWBHhIh2X2FhWAoINa
	 lzuyWeTX+M/qmYYp1Wbi6QTC2fAi2fk9iraVW+v2RCS4KeVEJC/ZqP7FvA2VOjcb2lpxU
	 f06KvVnpjopLKdTwOSxnt7Wo8J2afYV2GJhDQjV9XPtPoWCoLqQVRYH8qaQq0bXndizIf
	 cvKdGd4AqCDW3xSFN0CC62/pjCRrnibw+C5MLSvwnhcQMk25dGyeN9+qMHk3YmHq1JnQo
	 bp7RqIAN2fv7UM1UsllpxpOiAknxzMwS3SNt+nvpi+zksBLDd5++voxh1g5QJ+4Fgpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836842;
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
	bh=V5hwy0Gpl6mGarOZNtSX1kxi0JAIz6TQh6GoQbubkH8=;
	b=QBgIAL1QDdHhYLfbX4v5aaHbcDNcnoj2W61CBa4F77fMF7cRtQ2q38YJb81zvuU4yDg/
	 7CZ8w6RjfFzYAvw3e6v5nOa7qAyL787yKPam21QCR7w+6ME1saKfXdHgOn9uWyU5vpvxb
	 OyL226NfJSTP795eE9hlop2rzusl2NqotQC2oq+U6Mj6MbqysslAPVY5grXQbklhdT+Tb
	 FuGP9BlqBZVNXEBuWD18aOHdrnV/TuN90Ieco7Gz3XNix3XmSxEr6soOJFBO1g2rCQQBq
	 8URO5L5CuDVw7T4AMN3TZO7RFt1wnsaeMxGAA/HdvU7xp+2MZf6PR+ILJUgsXXjS4Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t0TiY29g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.46
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3283606A338;
	Mon, 16 Nov 2026 13:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3283606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t0TiY29g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6o+mMzTZQ+s/TXqn2aoy7ExP6NKyR6tNXfxYOTfGawyKMdis5n/cZfjiFc0DPovhOJeO5ixKCJFd28el8Av573pOmSh4Njrg13x+qpgnh0rnSFKssQyT2rXySobkZMRpBAhlMzifwvQkcICMmwGW8X+0nG6lQsHx3xGbLbUmXeobm6bvxIA9DC4uTJBcTUagE3svfkHaOe3yNMbovIrl2/xTNcP83BnUizV3BcEpNzRdn9MCtjH8ZLwu27yD3mLFooUTFzdpIfeRUB4kVp3ZCJ9qiiuNIIGSb4SS871MQNHMg81CjsD2aC1l7UNOt471w5qFbQZEpb2eFwDoPyF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5hwy0Gpl6mGarOZNtSX1kxi0JAIz6TQh6GoQbubkH8=;
 b=xwgus+8V5xNTNomaPw9tFyg2fp0Np8ALwLUexEHnnhR11o5X/6s71yCa9FT+ahFmGrmbh/8z1BIc1FJ97wtFNrMTijs9dUxIiyblPwXvzga1EbEXmbB8dXSmytC8uQlc884MN7cfAtx1zFW4EhDqsAYa0aLkmN9Baw/bZRsK/h6wJb7o1kRqtaRZUndoVRKigO3NxUxd8/2PLyCDFtzRVyzzqXa54a+/3H0LS1LfkCbnGPINAn+rKoG+STY5arJbVWoPwEPVv05WMzop3kK5s8134UIgezWij7Rlu+pyR3YKoc4DOCH9IuvcKces/oLUHMbXoJbjtDUnwlGONJ0YYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5hwy0Gpl6mGarOZNtSX1kxi0JAIz6TQh6GoQbubkH8=;
 b=t0TiY29g1Daaf9yoJqYzvOjMlZT+VKz1hC1vnN94JpD6CDyYfIou0b6Cz5hogrfJJ+3rI8cJyB/bRTmrm+dvPDuXcqKzQCewZxNyNxTGoTAnmsbeDE2f0gO2yrTJ2lwVKt7vhoJOC+wMxJG13imAgBo9bITg7ve4eaqK9dZKIDybVKyWnL9T5USkxa0nVkdE6uN/n7mBmud0tawoTB75fl2hwOL7YLmUxvpwTpRefugAbGxnXccjUm2aU5i+8Pz5NqFjKw1XRjYWChO7oagoOWAL/YUz+SNymn9DvDCD/RZrVCvN4c+IGbXJZ8XbLam3+j+u8pjAC+0lkMNViayBow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by LV3PR12MB9117.namprd12.prod.outlook.com (2603:10b6:408:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 16 Nov
 2026 13:47:09 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 13:47:09 +0000
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
Subject: [PATCH v6 0/8] gpiolib: fix chip removal with lines still requested from user space
Date: Mon, 16 Nov 2026 15:47:03 +0200
Message-ID: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::19) To PH7PR12MB5974.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|LV3PR12MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4e8ebf-53d4-4489-1cfd-08df43e81bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|56012099006|261021123027099003|11063799006|261026121527099003|261009223027099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003|261026140227099003|261102123227099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IMtYNmxES5LEeX/QERaSEBIdeXaaGBVeqL2nk6P9tSWRa0Anoi+G+oB97x6UpH8vQZYfVZSFKSMdIn4CtJk735nwuUT/IqBxbW4oDREXGAcn4whB8vUkBjai+/RLVku3p/hr4n4iHe5QSeosxKhjLZOKKOPtFn2qWkCqAjfOK4oGVRhaJnV0oEQ6/LJr3PmA5VLNAh9eyEx6DrMjSIiXCwj+CE/jqQzYbtdvxlhB/rE4/13/pDNHtS/Cn4L8iNBfUHQloEQbltb/cZ/LtHlWsCsAmeSkfrv0oM7f8ip2W3IMedYMNwBoP1/1y6Ugmd8Qg5c3XFMsHejeR+kQHK6R94SXeEQUhUGgnr0ygXa8zzC0CR789aXAA28IcyQE4JdchVz+vOWL1iDF6ImjCU0FEaNwY6EiFvsjpDVb9Dc/soJ1c6qNj846TRlwxE9cmpryzr2UOjzDnm20yEatOQ9RLPWi6t8m3ZzgMrzaUDf65EUZ3//vIpOMX6hxT+4XI433KS9Z1jd9qBoNkuJ1RP2IWivrfaHMlMANgCu9xkZ96Xax5lgJ2VCVPD+IDmnO8Ch4Qg0d7fqKerCqe4Ad75924pD48KrhpkAr5OHinurAd/C5CsHT027sOouz+k6/JZhi4N0P/tNgRwELsoqrTnUzjGRM2OPSgJPgdjZr0qS+XCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(56012099006)(261021123027099003)(11063799006)(261026121527099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C9OX4wE7VxP2VzUbkT1VoffoRiVeQKjbiVQBRsu6HvmfL+8gmlcSS5neSy/v?=
 =?us-ascii?Q?brpHW5HOVOF0hm/tWNqp+crCfaoE2X4onzHn7Nft5hhbLclU7rQuQXelBJsx?=
 =?us-ascii?Q?uw6PGzUW4j7mgMF6VCK6/Aw9EWWgYK6gAuVX3tVJQDUeSaInH0K9ooI1R1qk?=
 =?us-ascii?Q?QETHgZwaRVLt+gueKuUiHnMR/r+5/zCwo31ezK74wmn4FDxrFcPAk12nyoX9?=
 =?us-ascii?Q?U7Lk6F+Z16Q1LFYlpeCczspvH+3Lm3GOE76RsTQXn0hsNK8zxOmNYWOJhV1E?=
 =?us-ascii?Q?KcF20SvUxysY4Y+hdFRBEDTLCwI/FdhwDL2JW24qrq0sGVW89RjzEyI9VEtD?=
 =?us-ascii?Q?TNQBCzWkLOG/gN2F6/Hfp6Vg2b3b+Y3oreV8o8xMNjjYj9JqtcU/D++s6KVr?=
 =?us-ascii?Q?qXSiYuKeGQ0ZSaRGheflfXsmq4iQCvKm5JdQWwoyFGQ9ll5IXf0Ok2iSEFph?=
 =?us-ascii?Q?/xMZKhWZFkO/5lYYz4qYG+19h8XzU9lQ3rfU8vJfDJ7FWSD6m7N61ZZNBaIz?=
 =?us-ascii?Q?Ea0gg7/NdqH4oUOvbcbMQzdsyuxiFZDafSFWB+uENkC65L9sTZFMqZoq3Cbe?=
 =?us-ascii?Q?/OeLnJWF+GjAZ986Kvr+/TkMI+UDiNobUtnjUra6zrfp/jDsHppHJrzHSLrL?=
 =?us-ascii?Q?Ma+AMho07GHzw5k5Ot4iKIc5SR/UTA4As1gUsoWTe9iSdG6Sryfwn7dEOyjv?=
 =?us-ascii?Q?XTmzjeZX1m0+PZFlrNeZS4ArwjrElDRhzQBipizKdNj1q3TwcM+Dxt7pGp6g?=
 =?us-ascii?Q?ZHol1GDBr2DbpHLnp5p6M+jPf5znRKXakNyxJFWDCo33gHW68w5Npn4Mj0hH?=
 =?us-ascii?Q?ZdQxeaSY0H1tIF1m0CK7AqzmPzKnqUN49A9+mheSzU9vWG8r9efJ+YaFjT4O?=
 =?us-ascii?Q?xMo1oQUKGyGOevb30JbJi6Ps4sdnAfZz+e7bYwfvVHSip9Eqt6b+OTr7j3FA?=
 =?us-ascii?Q?sdoD7PejisaTSD/qITzI1+6lvCSCD+tEaJpp4bxFeaH+sceCnNDbtP+w4O13?=
 =?us-ascii?Q?cUVl3XCxxJ/f8hj9v0tWmkqrWUA2rXnmOdKO0fNMBjvk+jMTKgvWiAz2siyo?=
 =?us-ascii?Q?/26OVG9BILBTMLXewQKOPH2bhA0WgDAKmx9HOYFglidFS8oSKMoG/neJswRN?=
 =?us-ascii?Q?Ln3uMYA4gGIiR/eJFBoRTWPbcsBoAYlP+ab9J6Ly1GGcrspAin0Zfyj78U+T?=
 =?us-ascii?Q?PtTg00GRTE1iMI0nrBNcm6I5tQs8ZsFt91kKwSKau/JexeH28raCq+r6JWdj?=
 =?us-ascii?Q?CnW6zYO9UxbFfawRxlUjjK4WjweqxSPJKbluxNeE80D71uWuWnRssgEv+Ef6?=
 =?us-ascii?Q?8I51GDMp/LxK0Dil9MsXmJUWqy7W7Djcw5yRMISymbC7OidvcIVhGNyyzDhF?=
 =?us-ascii?Q?NzDMrhoxp2nT2rJfxinbnuF1LnFPhP/x3G9ZFIhEmsfNnhE0CRA8fJFbRgB/?=
 =?us-ascii?Q?WMtRFKiAK/YpKCZbMJjHTI/k/59h6sxYeKmXHT8o5sG9WPFO+/Hk8LOSl6lr?=
 =?us-ascii?Q?0jR4ygS6jFsA/LDnNB7cqYNCYjpuGbD/dIyVq9wxGFru5OHv4DqXWmQaQ/1a?=
 =?us-ascii?Q?gioKCd7qXdLNt554qEYJxWz43LZHYG2AVgd9/8hWzSNsY5+hj7IdBcEuMPA1?=
 =?us-ascii?Q?AgybtMXhEvkPG0l+btCcag1oGH16s32Gj0JFtxbvcTzwtura+T/FDe2ebjFw?=
 =?us-ascii?Q?WJlgCd205Jjg6GFuzJW8wlOsbTlB+bRo6C1jFUa3eHF//29tTtuMuWTJisPU?=
 =?us-ascii?Q?c/Z1sz4wkw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4e8ebf-53d4-4489-1cfd-08df43e81bd7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:47:09.0795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1+tVLikgK8pAa5gH8yKbXFBAygX9o0ymGwBEKJAcZ8Toi6WwqXZDa/asCxDvKj0Di//yK7YeL19mrYBxekRSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9117

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

Prepared with Cursor using Claude, which helped analyse the bugs, write
the reproducers and draft the patches; I reviewed and tested every
change.

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

 drivers/gpio/gpiolib-cdev.c | 155 +++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.c      |  38 +++++++--
 2 files changed, 147 insertions(+), 46 deletions(-)


base-commit: 3e68810e7c109ae4cc23541f36a1a9fc8ed65700
-- 
2.43.0

