Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793273389;
	b=zktf/AfaMk74yOzbPjldLR1AO6LB0q9vG2NVmPG2MbcN2aswdrazA3IeXMLz6YhzCtqW
	 ZeaoCRMjmeuKKVAZhOP9at/9lZo3CDSOQeN40zWMdDoB0WXpsQs1MC9p9G8G1ihSxarVO
	 29m3mHiN/WpL/yfbSh5lo0s9FA5wR0O28AL4AAX+ZZOoBYgq7VcCLGpp3zAEbj62Rcq0b
	 kY0c+EOHL2G0xFtl1zkYhWKFa5JIJgsbjlAtj9FOw6pxG5GRUxN2renkPCY9IvmgYL7Ne
	 mE/tdBmKUYRfIi8lj/NUzCHXCwP2YI75i2H1N3KfFO3awcZhvMIz050xTBC/BCZ6FFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273389;
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
	bh=yurAmCXaXdJ2aSN7l5swMf89Wq9ijOkjpUcbZrWBwZ0=;
	b=OpbuzEcWdUf/OePNc1kJE0Lk0rBSocEeYc5lYcQGKFE1ICGSJdlJ4eJcm8FbVgxPjdq8
	 oywWVXa2Mr4xmrxFFg7KIWRyrIi5QPI9KcF6SQoXJRfSHNLnup6bnr2dLD1etymFFTVnr
	 FSTtrt4ekQCwVSwkBtBQdZkh9oQiz2M4fwLOSobIbuLBxjdgG665UyKkln6Rz05P2nphg
	 6/10P/Sv4Fc61Tf1zxI+zd9+ksHByqqgaU/nYhbQ3gc7RssACvKuL7N98pN7rQs5ZVXPl
	 +TolxwWnBCGQuytpHDiNhRqA4xP12ChyoUgPqxz7YINb4sz9AzyJt8Ez3j7bbBlAhIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a+B2CsF5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.10
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010010.outbound.protection.outlook.com [52.101.61.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877E1606A31A;
	Thu, 29 Oct 2026 11:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 877E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a+B2CsF5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EG5G6dVX81cfwoxdexTL6FL2LLhYG3Kj1fAN4ruJwnJZxKGz75je9Z1rA3Rx0PxsHSqTZG3geuJhAe+b3dRyqebsfQJv07R6sEu8WZ8TLkdEHFgYLdczcKVEGpWBUXpvBRo1IeaxHGnMnrGbqyFzhavChe9S4d4pzfkunn1Io/qXBtGJgrQWUbufw5XQbXEemuqmLTTk8I9038AmyEQDKCghTHHT3cZ5GeoBZVNFF/cNH9EYWgn+HUUROi5WHNv/pUK7ODZ8sXJZ27r43GL7q89Its2zX3e8WfdaHFuX0Mi6OqCTzro1wmqJpURBsMXuHZCc965f2B7BHg4jg/nzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yurAmCXaXdJ2aSN7l5swMf89Wq9ijOkjpUcbZrWBwZ0=;
 b=eAYjVUMaN+YVi+CDgbXHDM69uWzj5xNhME/YxlxTGW1/qt+X8OJ7VI0LblCrR752IX2uTQtyEzNsNMaFMWWDelsBY7el6m7SOVDaVRuwGFk+blQAMkp6tS82Eilszf1OQ8dPjLfjJuaSh2mFogTbJbgoDLJ70F7LzvKB3jtr6tuH48ILwkoPCoKYQHfL68hVo4tB+OHq1AZGf3QsFR9HgVl9VT3jmBEA4Z8MHYd2oEelu7ek2nP72o4MaQD5mr+6fA4nCAK1jfmMKSoxx6qrDox8xwNhiWx38pD3+rlnetrnqjiaiiIusS5eaW6yIENh7ttNylcHc0uhBC37TyMpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yurAmCXaXdJ2aSN7l5swMf89Wq9ijOkjpUcbZrWBwZ0=;
 b=a+B2CsF5pok5cRYPTF2GUdHY4HZf8jZDzVbQBPdAMNPLfV+vCHt5XtgnUVWp93U/i6mMU4aCaK+AAki9/r9dmB8U1miwcMI0Y3SjdL5x/Wj/T4YABZ12bRLPiJI2ExVOUFZSyKPYVMD2vjH5cUBBjO2vjZ6vYe5gXhtB7+EFPnWpwvdJy3TJkdVDjfRtAqhAV1tO73VOm+cGOPosARadI9GOjD0Bx75TtIbkY2VRVM5nXEoFlvsItVA98iRTfNITE/f0HrqIwQRhmXrxBVH1XzHz6nVsg0UoyDJ3ogpdroUV223saTY9PS1m5oc/HJpnIjfIvWgzmFKVfDNwqlgH7g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 11:29:21 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 11:29:21 +0000
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
Subject: [PATCH v4 0/7] gpiolib: fix chip removal with lines still requested from user space
Date: Thu, 29 Oct 2026 13:29:15 +0200
Message-ID: <20261029-gpiolib-chip-removal-v4-0-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::6)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: b586abcf-de03-4ef4-5d55-08df35afe03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|261028144727099003|11063799006|56012099006|261009223027099003|261021123027099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|10067099003|261022075727099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8+L8QoFDyvaY20CGiz77QCariQqw8QNyJub8bxPWHjD30W3IVRdvVeZYgEUFfA5ioTbSqbC2TfdT6mb0c4jIcwn2mpkUnX3ME6pU9kVXbSfO2LEKi/0xMmAQ2Z03qK8ICgx9IU9HRXfINrtioWUWeSXtqqYkRtrkmlSSBVE7Ks5jfyAQk6gk3pcJKdz/nw4qJwrbA4q+xodiJy1eXZV1snpts7qwcFlaDco2ftnbnhzzmweKwEzs3luP1F89HMeXDtkxZh3BAdPBOcF8Houw1IpS8c5NpV+U4IOgBsLZM38G7kVrAj2JZVY1f8UsJ5RqIzfZyFYFpQg9WzoXcIrWvoAZK5YeqERbSrEvYA88Wy2pcM25F5TnVhKYO6IWKQq5+GTpe5xEBLAQpWrpK4b5UZ3x6MwI5HJf0dUsQ4qWKJGE/pyYR9tuwxHolLsPG754CYNv5gYURz89TM7R00Rk73lq57udg/xbSTZf4PVoN3/gB4e1EbEM5WfQANuMYBEtOt/f9FWebOtfnbnj/laF89WRUCASD6gUPjN8yXIajBBo6+7ssnwOtykNghL6jbczm26YYxqG5EzVKd8fkLDHtDH6E9KfVmB1nvBAdwVQaqVRC0oIdtEpQTlpmR0fQD/xYf0egoOi9nQlbHoaKMlYaGl2Navi1w7a/s3hkxT864g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(261028144727099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(261022075727099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?COXCjSQqYd9pls8lw9Queykh5Tj9qn2uWHctUMgUP8skpzgSZ9K0aFraFXPb?=
 =?us-ascii?Q?pWRVA28qmDo0dnxaUOJ4kl9f5RXfuYEmFBNB/RieLZuodTqG+yFh9+Qos3Kb?=
 =?us-ascii?Q?Er9+z/pIjNuRnxsWtBUQlnxp6mx3yWVAJh+aSuThoTLIpVtZWPJjwBlvh4Ki?=
 =?us-ascii?Q?e0zYPLpSXxoQ1TVXoH21qMnicIqVlcXl8AJiNjHVWhswghdccemHz7YdUzNg?=
 =?us-ascii?Q?jVo+BhETi8PtGTqApNnYlZTAwHbFFQK/k903qTiYOGBKmZaur5efFYKioc18?=
 =?us-ascii?Q?0oju8qSqk4LxGJzeYbKN8789aZ4lnthMP9oZHSRQzADvC4IEgulv03Sagzen?=
 =?us-ascii?Q?Qy4bIDtXqvsPElQ6oPNCt/U6rIYx4IbcittEVP0eI98VTm8yjtkxliHI4jqb?=
 =?us-ascii?Q?5EQTkzH2Ltyr01nsUIAAz0k6n2EB0AUFjpMgq/RQ6sDk3Uf6oG7q+hHDzpDl?=
 =?us-ascii?Q?+OYCha4s8QupMhTBiBP402xM/Q8eQdFhNVz/ohtmr/NRThwAPEr7e51C+9ZG?=
 =?us-ascii?Q?siCr1qFFz9b1MRdJVVyoAKIabNryaILG2hJVsrH3IIfN1jNIiACNMYa24qSd?=
 =?us-ascii?Q?eYVm4maX9Wy+fdKj1pgcaDjZoVHILYOC+fQFVxu7iESsbfvk/ojN9hNaEvM4?=
 =?us-ascii?Q?a0t0UvhsNEhQCAv65qnVevkhJOlz3rpNtgMpJ/Ypofmj5XVj8g0r9SPosJpV?=
 =?us-ascii?Q?mKKmab1UQlCc9k8U88e+SV/M7AS/uHmV8j+NwXwBMQ5e4+N8/RApFB+A1dww?=
 =?us-ascii?Q?qC0BJZXiwglIvGOZvcXhlsB4orp2328lBetGxmV+YlMOndOg69xFhHm+uHWP?=
 =?us-ascii?Q?0Ip+0uF/HnXEKS6gJsohUzVp3Gy0rY43JiesW1fJv3+luSaddYw8x+peAWVW?=
 =?us-ascii?Q?Az7U9ukfHUdid+CNdMsibw/1p5ZOe7FFaOXjeuRcDuTG1KGZ1gCp0wBRKH5Y?=
 =?us-ascii?Q?CKcpGpkoIOmrmPd8f594KigtAFr304zAhKHurPb9tTyAKogxvn6lD3qJ6WSy?=
 =?us-ascii?Q?TmkXDDDjbV6RmdhxiI5mkmB3RQJvWJ/KmBQz2cW/9dzCG2wC2lEf5dP2G2k1?=
 =?us-ascii?Q?xYJmmVjxad5gesXfxAmZQGuM4uThop7E14lS3u7kaIqDMCmfC9L6/u9bCwSg?=
 =?us-ascii?Q?WLoMpTS6otQA5JgYBw3If2jHUJ1mXrqxpwd973JHW0qH2JrH0Ty8gY2qnouJ?=
 =?us-ascii?Q?jJroMftCfuzqy3T6HMadQI8NA3kXSIZ9pVd8DBfoGOZJZN5IKuYjYRnz912x?=
 =?us-ascii?Q?6R7PchlwR0DyPAku/Aa11HakCCNLuC5u40DjZQiT6t4DTv7oE/RJRaubc2ey?=
 =?us-ascii?Q?BET9Pkh00PtkM5UxKdIYO+vt4hrICOWJnZ5lqqZI+nE+c5XgUgvOhZr4Zz3G?=
 =?us-ascii?Q?RswZUEyE4brd3wZZ7HMuGjXh9vxWcxRSFp3yAds8309L5pL3zWs66e0KzHb3?=
 =?us-ascii?Q?GRpVl/mySeg+kUk1W8W0kF8KeAHwY55MMwFkoERJ2l+penqVR+Bd1Co+86E/?=
 =?us-ascii?Q?mKyv8usxQ5Q/Fmo/Cb5/QHOPK/af8jjkr4uk+IkMDaRkhZBPMwpOrKqgj9sh?=
 =?us-ascii?Q?XN6HsBkB5NngJTemfg5An4tZUgdsNAhzNDb7d/IEUpH76+cJ3wKElAcqwPR7?=
 =?us-ascii?Q?yPm6Xd9u1hWNtdGTH17lxnJu88Ia/4qXFXoTBczKrSJ9okzJz2sGgxQeDXpS?=
 =?us-ascii?Q?JRr7H9UJtENuLEfi8CY4QEQMl+qZfofja8IqZhfcDlHbWE2WBuZfSbUzky6v?=
 =?us-ascii?Q?VG5N/kgdyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b586abcf-de03-4ef4-5d55-08df35afe03d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 11:29:20.9111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bExO33UJwaWgIi1urcWrV7Z0SK0wbmYG9AwiI4ekD5TOZPz/vBGI8/b8yVogM+qSCbk6lZZXF9sTfY9QdhMZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134

Removing a GPIO chip while user space holds a line request, as when a
hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
and IRQ names (patch 5), frees IRQs a second time (patches 3, 7) and
lets a blocked read() stall the removal (patch 4). Patch 1 makes
gpiodev_release() wait for pending label frees; without it,
cleanup_srcu_struct() can warn, more often with patch 2.

Patch 7 changes gpiochip_remove() for in-kernel users too: their
remaining IRQs are freed after the chip pointer is cleared, when
gpiod_*() calls fail. Patch 6 drops edge events when the line read
fails, so an IRQ thread in that window does not report -ENODEV as
a rising edge.

User-visible change: a read() blocked when the chip is removed returns
the queued events, then fails with -ENODEV.

For stable: patch 2 needs 1; patches 3, 5 and 7 fix a 6.13 commit also
in 6.12.y; patch 7 needs 6; patch 4 applies to 6.12.y.

Tested under QEMU (x86_64, 4 vCPUs) with gpio-sim and a test chip on
the hierarchical irqchip, with lockdep, kmemleak and KASAN. An LLM
assistant helped with the analysis, reproducers and drafts, hence the
Assisted-by tags; I reviewed and tested every change.

Changes in v4:
- Rebased on gpio/for-current.
- New patch 6: drop edge events when a line read fails, before patch 7
  frees the character device IRQs after gdev->chip is cleared (Sashiko).
- Patch 2: for_each_hwgpio() seeing a requested line with a NULL label
  is on mainline's request path too; applied separately (Sashiko):
  https://lore.kernel.org/r/20261022083343.3905973-3-aambrozewicz@nvidia.com
- Patch 5: moving irq_label above irq in struct line moves the 4-byte
  hole rather than removing it (Andy).
- Link to v3: https://lore.kernel.org/r/20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com

Changes in v3:
- Rebased on gpio/for-current; shorter commit messages (Kent, Bartosz).
- Patch 6 (now 7): return early when there is no ->to_irq(); drop the
  lineevent_free() comment (Kent).
- Sashiko's v2 6/6 finding on gpiochip_setup_dev() is on mainline too;
  I plan a separate fix on top of this series.
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


base-commit: baa14758afb3e2828de1f76511edc1de50216f39
-- 
2.43.0

