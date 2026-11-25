Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604823;
	b=JntsdGgW6ZxlTwIA9LKhQ/WYh1qEL9i0rMNep+lkobx+KL/LnagjxwaIUV/2ZObaE4dg
	 tTJcmBP7Yy8ytE0itnM0VAaD6S4y7HllIvgF1fyupIvPRhwMDUYQ03r8aSy4h56tUM5YT
	 pwpscQANMUYgcxoJmAW9xKxSnFGoz66i6polGRlm7S61vqAeTOp+wUvLrxd1VMrLvgmzU
	 gptkzQ2/+dHyrTzpGpJw7PqG9leS2901DWJuWU3BkTu1aFB5KjESgHhLqqF7Ab8mBi62k
	 SLAvbhP3tYvypQDKxjeQDL57yA+n96L6W/hxYq5ObwfNfNViGkXau/x0btPbBz+6teA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604823;
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
	bh=ZvgRkUWebwSm7JdM4JAcxlKmTvVhKfwLZ/DQ4QKNClk=;
	b=FRNI5ZBFBtYpOX/7PFvG+RjTgKDIsW2Ut7e80KYDiMP0WbYIKenjfbd2mM4iu6M2fXZW
	 QYsW+ogEn5hh3FwvZ5n4OLPzuLjIAIsE61Oc/fumpbaqqqlAMPRUSaal2N/PgA3GUxliL
	 c4IkOJGyneqQecaChYCRWo1EpfMX5pYS9h7Xln0kFM5VIf2BzDq1Mm0J1orsRNJa262Hm
	 wL+h2cchv2KwaCwgojc3cagyrkTgNrcwuLl3XJtxbiY+fis6OYlu0zbIuXIYdvo/FVNTO
	 I1wTz+k3qY4vCImUn65Gy70eX4uQNLLwqErbg/fsEgae1f+UKLxVLpRp/pDAe3TUB3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aXJSwC4f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.1
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C4B606A323;
	Wed, 25 Nov 2026 11:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C4B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aXJSwC4f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBuR2lkFyuI8oPeYF70JmySIphStc6BSB96ZhmENhOKyB3bAC/tUJyIYUHE/cBbiZqzPTrkZdQscv78EZOZUl14pH1e5wVNnr3bPZr6l11Z5Vi5XLIwQ+Yk1VLN6Ps5b5g6Q65Ka/XoJaBZ5pe2R3DB8mX4kGZMkEHIDTXsh/R6zMOBVTOrZmMVcufwr5blMw7/Iy9Z9epjlv/+kg3fypeSJcEAEHvUVE6BXkVoofdZYQBvaMa2eSktISIPvyv8gFUYONWWB/4lD5vFIPaKrrd3QKNTvgyy/9KwyHzYgyK8NKR9gzt0fZw91vIEcLbpQNy34Gwm9PmqJyfitSPGSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvgRkUWebwSm7JdM4JAcxlKmTvVhKfwLZ/DQ4QKNClk=;
 b=B0HyQUJ6W+vx49Z+EByRFCAJLCTn5SljtRfEOcEHnZoImvlbnj1ZG/wlQiyPvaOAPMj17wPE7L3bg06K4FKIsOsTfQEtXE8DS1JdQbjnKH/6BUO0GFh4QkM/tm1LxlyYY3HYiPoaXkL9lJohyY7Y01Muj6GxryulpW5zNcJiqHRzsuRLU2ds0rIT9yPnLQ7iXCqyV324oUkW8Sjjc32kAu643cm0tvn9ItpRXHbNtArbM6QExSPomO9cvgctO5vvWkplEkve+BhK6bRX3M0W7c6ThSHSuZrZKe0X61bFFfrHISKFEfyEszUKnMuW/IOsZt4sAf1naT6tC+1BqdsKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvgRkUWebwSm7JdM4JAcxlKmTvVhKfwLZ/DQ4QKNClk=;
 b=aXJSwC4foHTurXOKoL1y0G3gPnoyBXjAeUU7B3mRC+pe+SLYuc6h53u9xYBw9xlJZ6y9vZmh4GjHSGCJQ6DdycEpTUrKb1LKUnTjkp/+eDDk7nvSubKNQNkek+gQ0rqA18GkycB5UgwezJ7btE2dPLdCHOcIAmO9P1zfwgzR/7WxKBHysQXCbGc5uAPKIb4ogiasN5Ily+IXu0qSJRLUGDLrGKXd/+g5yLYKX7dSxKS5kUgs+A1+PK9esnBtjI6uvgJUbeOC79y2iUND5Ra8WCOOIxOEX7v65D5iOnEXSqbNvmd0D+HJaUZba7XhphYdy4GApjbDxNTz1sLvAoDQDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by IA1PR12MB6553.namprd12.prod.outlook.com (2603:10b6:208:3a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 11:04:46 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 11:04:46 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kent Gibson <warthog618@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Herve Codina <herve.codina@bootlin.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] gpiolib: release user space's lines when adding the chip fails late
Date: Wed, 25 Nov 2026 13:04:43 +0200
Message-ID: <20261125-gpiolib-setupdev-v1-1-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0024.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::8)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|IA1PR12MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: a473480a-53cc-4d6d-81a3-08df4ae3ea95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|261009223027099003|261021123027099003|261026140227099003|261022075727099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|10067099003|56012099006|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	LvA84GNTEIcdMMjvyZq9nyB4szifY4KyOUabKXz5R3MTBc5g7F7nYESjelBMP5Cb8Nx8p/awiUy3+hbwTfIOrs0GU/RCkzMYc73/ap/Ou9Q1sT7c45e7yvvCko8OD7eU7uMjELf1rVjxjGd1X5rHLFOmrm/Wn50+SKnzHja4Bqwp70cngUUcmMXEwyIbj5foSPLRczs/n1u6wgQn1foQx9xBIPehfMdcIXC0ZuVwu5rom1HOZSUa/62dPD3x7GWLrLYVi+jaTotg6HMypxczfBMsUCfbp+bmfQEctimhHacz3/TkzMJm6HudUiCSf3yK4JXSUQ27l0xbqpq9/vVBuVwSoIt4b2QyG1eANaWyxSV3oUmoVwAvpYAfoH8X/9771QHVqLDYbHBVnk5+TbTDbXZ9NVHaqxBeBBIkyAzwLzNOPx8PkX6WHwiKBaB+f5YIpzCdXrKJpzlXppe1CVPwPQKEaWS8bCdgCM6FJxA+bdQRD+gB58gSTo/0uNNAy7g5zcuJdOzzFQwMZzINCDeeHv9Yx/ul+OB1kqqckJOcsNsNkSJI1urN7740xR49ffoyO9zFfXSYgFp65tjgI7Xpt1rZoZ5WqLFtZZF0RzY3GrlCkyovvtCmrDCXkd2SUqvcIGiJ72M1yLcwDlBGWsiONVFEEBFq2MrHER02Ghely3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(261009223027099003)(261021123027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003)(56012099006)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GfZl/EmnwZ4UpGMGTkR1kCNnVvdQ+86fKVtJbKHbpOyOnhjlremjgT3lMrJc?=
 =?us-ascii?Q?zidrnjFIyB4nbYbQVYPA+d5W0DJz1eknRyuYPENm5pSY0avc62PYsyrEuX8s?=
 =?us-ascii?Q?Bd+cQ1zLhJTpW4A7Xn59WQAY3t+xkQqmfjt8cCA9VR1+ysyp/XoF79auEsK5?=
 =?us-ascii?Q?FB3fDUHaxbo6TqQWL6O0bcsHzt7kmGqE1nCDgyrsc3cMG58vxDAxIozWw5zw?=
 =?us-ascii?Q?EMel0TvCuS9dx0J5a1/k7wMT+l2OKKijgQygVEkzr1Lb5dKxafM4p6uJXwl0?=
 =?us-ascii?Q?QQGffG6Y+NLng3AMiVtbG2XsV+V6IwjRVtzoO/I7Uv7AY3M6yta/CBuWVRQb?=
 =?us-ascii?Q?Yk+d08RTWnUfpWrrRGi7PQCalHddB4fV47Cl1nPxQwt+w5vCXDhelTurNTC9?=
 =?us-ascii?Q?Zk7DPcQm7zFB42zMrX91/zjdhvMc0rfwbIaDRvQhi1u6M4ihnYovEgHYY94l?=
 =?us-ascii?Q?5Xfp21RSICYy4NTXh45MaifIX10eR5eNQvgLEqL/rCfCwkDTi82uSTn+JoDi?=
 =?us-ascii?Q?rhMRiSZTfW3Ss+G3LcewcVK+989Dp1cuawu1olgI04nYi84HEoNJ8uqzDu6Y?=
 =?us-ascii?Q?RNm3F+Dpj1HXzUCzPH1iOMUG67Q/d03gYe+W3u/rR+srfv7j1nMXQ41PUmpe?=
 =?us-ascii?Q?Pr16QbFwTIpBrucUEw/f2Hz5NQpSWHPyzHvr5z0njPr2az48T8XduE9Lk1Bn?=
 =?us-ascii?Q?X5yhD9kYOPyxwYuNI57Lgg++dw+hiE2T9mFj0KcDAZR/EfQQ3M2J7sZQ4Cak?=
 =?us-ascii?Q?oWbLuDDtKC0Q4QykHk6HNJYBcGn5/2BEu7wNMRURl3/tjTCzIYH4HUe7UWEn?=
 =?us-ascii?Q?Dw/x1zt673SNk3WWs1ujqYV05DDvWOWd/yqvzcQMlw0Gs77iWkdd+9neuDFi?=
 =?us-ascii?Q?7BrsJMD9koTPuT1D30b6DlvKzIFDxHuL1s/679uAjo/847P5GS38x3hkPh5P?=
 =?us-ascii?Q?+8V75Ik6z+0j0jB0KpwYh/BfwsxKfepLptp+sX916gphBaUnFI9OQgu5fPow?=
 =?us-ascii?Q?PaVPFm/nj3dtw7Jz+mgR0Tk9Z63AlBAo+tRuKzbJetIWJE6IKK43e4ddoHAB?=
 =?us-ascii?Q?U6e+9Zaj4WZzbVChKZ6fpKrKC7V649rRBsB+Mj+OAcu0LL2WIzgkumblwmpI?=
 =?us-ascii?Q?NcAWjMm6xOn465RdnzU4ABV3Amy0kdsewC6ojz61Kkvelyj7tOgJQ5bojEBb?=
 =?us-ascii?Q?s74QYmhc7yBbTGl18HufvhsKalSluNdQHinz+EuRWBBPkD/MREOafOS8EnhP?=
 =?us-ascii?Q?WI85RjvAa4bTZz+leu5/WCd1n/+WZfUOE17zk0e0OXjw6JUBJwn7DmcC7y/N?=
 =?us-ascii?Q?8c7WNjLmyYUBhE/teaVyVrE3o5Qr8ntjdNdHbDjlw0go/zRe172VJqF9QfVy?=
 =?us-ascii?Q?ReXSH+xG65fXlAKcCZY1SusuVONtaRUE4FACq/uFJkd+8sPrpq0zKzEOGmtp?=
 =?us-ascii?Q?gGNbpw2DnT1MgnZtDT/jmFLQny7nioagZk65e4bIhTj9DXWp+T4D1rBBB95W?=
 =?us-ascii?Q?Ci1jjNsuHpzrK1ZT6ffw0J3XPDSve4R5DCoq55/hv2/IQSLwEStuFQQBiO5r?=
 =?us-ascii?Q?iDBePjlGsXBLCVj6dElr1oLBNEsTNkQAN9DgHlm/vbsZ0X1EZoQIZ4nm5/Ic?=
 =?us-ascii?Q?aax6THRPdkdHK35mooHh3P8nqLwSV2vE7id05vck0ApgU17KPFokr44/dW1D?=
 =?us-ascii?Q?Atce+xpUYsq51cFt8FLv/VbHe5rWrlwSQjwZoXuP/wpUlGEbSH5DS7bJLAXu?=
 =?us-ascii?Q?sXNupfYlDA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a473480a-53cc-4d6d-81a3-08df4ae3ea95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:04:46.5099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAUzOtISX5+L4wm9BgIX9LIr78UjzsmzEmf51HAP4miSzhuio4hmZIAmQhnjjPZUwY+Alxep3VbmwwtuoKm6Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6553

gpiochip_setup_dev() registers the character device and then the sysfs
interface. If the latter fails, the error path removes the irqchip and
returns, but user space may already hold a line request with edge
detection. Unlike gpiochip_remove(), the error path neither clears
gdev->chip nor has the character device free its IRQs, so the request
keeps calling into a chip the driver may already have freed, and its
IRQ outlives the irqchip.

Free the hogs while the chip can still free them, then numb the device,
remove the shared proxies and free the IRQs as gpiochip_remove() does,
in a helper both now use.

Reproduced with a test-only change that fails gpio-sim setup a second
after the character device is added: reading the values of a line
requested then hits a KASAN slab-use-after-free of the gpio-sim chip,
freed by devres. With this change, reads return -ENODEV.

Fixes: ec8b6f55b981 ("gpio: free irqs that are still requested when the chip is being removed")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com?part=6
Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
---
The fix needs two commits of the chip-removal series in gpio/for-current:
"gpiolib: let the character device free its IRQs first on chip removal"
and "gpiolib: remove the shared GPIO proxies before freeing the remaining
IRQs". It is the separate fix for Sashiko's comment on v2 6/6 of that
series.

I left out Cc: stable for you to decide: the path needs the sysfs
registration to fail, in practice an allocation failure. A backport
would also need commit 2e002a1d05b1 ("gpiolib: keep the line state
workqueue alive until device release"), and before 6.19, which has no
shared GPIO proxies, a reworked error path; I can prepare one if you
want it.

Prepared with Cursor and Claude Code, using Claude, which helped analyse
the bug, write the reproducer and draft the patch; I reviewed and tested
the change.

 drivers/gpio/gpiolib.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 57024a1b042b..f222b81ff756 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -904,6 +904,24 @@ static void gpiochip_free_remaining_irqs(struct gpio_chip *gc)
 		gpiod_free_irqs(gc, desc);
 }
 
+static void gpiochip_numb_device(struct gpio_chip *gc)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+
+	/* Numb the device, cancelling all outstanding operations */
+	rcu_assign_pointer(gdev->chip, NULL);
+	synchronize_srcu(&gdev->srcu);
+
+	/*
+	 * No new interrupts can be requested through the character device now.
+	 * Have it free the ones it holds, also on the shared proxies, before
+	 * forcibly freeing the rest and removing the irqchip.
+	 */
+	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
+	gpio_device_teardown_shared(gdev);
+	gpiochip_free_remaining_irqs(gc);
+}
+
 static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
@@ -1390,13 +1408,18 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (gpiolib_initialized) {
 		ret = gpiochip_setup_dev(gc);
 		if (ret)
-			goto err_teardown_shared;
+			goto err_numb_device;
 	}
 
 	return 0;
 
-err_teardown_shared:
-	gpio_device_teardown_shared(gdev);
+err_numb_device:
+	/*
+	 * User space may hold lines by now. Free the hogs while the chip can
+	 * still free them; the gpiochip_free_hogs() below then finds none.
+	 */
+	gpiochip_free_hogs(gc);
+	gpiochip_numb_device(gc);
 err_remove_irqchip:
 	gpiochip_irqchip_remove(gc);
 err_remove_irqchip_mask:
@@ -1455,18 +1478,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 		list_del_rcu(&gdev->list);
 	synchronize_srcu(&gpio_devices_srcu);
 
-	/* Numb the device, cancelling all outstanding operations */
-	rcu_assign_pointer(gdev->chip, NULL);
-	synchronize_srcu(&gdev->srcu);
-
-	/*
-	 * No new interrupts can be requested through the character device now.
-	 * Have it free the ones it holds, also on the shared proxies, before
-	 * forcibly freeing the rest and removing the irqchip.
-	 */
-	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
-	gpio_device_teardown_shared(gdev);
-	gpiochip_free_remaining_irqs(gc);
+	gpiochip_numb_device(gc);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
 	of_gpiochip_remove(gc);

base-commit: 1f7d535465a5568187cbdfec3beb734bfb5e5015
-- 
2.43.0

