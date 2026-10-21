Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792576558;
	b=C24Ilw+Q10VcUj+VMWKDarf+9HWgb+Z4DijKzMn9XXrB+j9L3E/l3mmDymi7jV64faRo
	 zIoTBEQarX6CuGTPEnFzyjkd0rAOoDgKRMfjyt+c25fKP7QJ1BXrplH9IH8KJrjchz8Tq
	 juniuqjhxo82bAOQXBIfTlrlj8RyFSfOx2HOmW8abxjOT5Zx8F8rNPKUG2wTgivnNxhHY
	 qQyQkLR0C+Hu2IC/yyth1IFrSe5RBeofkVpnhd8TphkI+M7NV7AdiWOfn7805gaei6P72
	 gNFVZpN5OzR0TedEuFHlu3XXXEZKIQMs2eOeG/cv1q7zn4kAAcIaeXpkSUoNCuqGeAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576558;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DbekAbgG/Xv7DUFdO4gAxSBoPIcOq7v8Bs+HNtRoJiA=;
	b=z0GwFRP5rUM9gxmwiZXyMCVMgFu6o6iLpogauahqe39xQAzXfllAuwVM06w2oCpKLClw
	 XwPhThphU7cUsqu0TddZBsVabDKcS8Z0edDWyIzqy/uyZA6pX8b3otDnU8AaqYWO2I6I6
	 LUZVPon81yBrjNjCGZ9NvrYi4tz4SwyxJ8wuEHv+YnJfB/Z4dG88Uw+mFHqu6CxxpkqSw
	 S8w5SexXXIkPhdH4yiXizgzbCU+merd7dUuRRQC8fYofmNbaAYIn7ScAOnoRkFlzmy59o
	 SRnN8x/+2FjRevrV1CgryfaYNvrIDLxnkxVWjffa4D0bflL4o4iZQQ3cC7zOsfnUa+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mJcSYrls;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.18
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05BA606A31F
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F05BA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mJcSYrls
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUggDzmTSkrQj9r5HPJg3P4yH4uAwaU0ryWLqaDSQbaNtyXKjIVLMnvD/A4G2KQYjwerkj+GFqBxG0gA/Ggzdv7BqxyNXu8GdL8zaUph5irBbYJ/H1nnab3FcYatJD0VMRIoIDeF+awLhiTuhBi6gLV2fZjmjCwdlvUMMr0i61cpVM0SD6r/B4FfiEuxQCz8psClFklRuRfvF9M090MEmU6RucrWR2FwgfWy1GLPMp4K7/Mfsp8iV3ZcmcIT+UEJXKDXU4GV6X5tjRd3IVkW9brrxC9We7QMb0xDsGVq/3h6hKN99Jtnob8OeU4Z6fwoM8rE26z2yQtrWWIOCFDGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbekAbgG/Xv7DUFdO4gAxSBoPIcOq7v8Bs+HNtRoJiA=;
 b=VuW0DQB1X2pcLv/Wk1yoKqMG1bK14oJiSfdZzDMWjMSqqOKui1TVHdd3Tl6YcMU3dk3O/Q/9URLNtAKfUzq2ouIPzrHaNUHn3az2imboXmvQCCca6hWkX7qd/Fh+EBTyOB6nYjWbQtAocxpE1Rebs1Smx0qdYIO1yUn3BZOmqgMif+KBpEZl+tYoYz4pU4FmttV3KvqrMbUt9JpEkk/QE/wJ94yI9FXm4/ti8t0d7O5jruQ/4kDzMO1d7ujWzgh9HFTF3/UFGwyPfhYxVHYHQPULJ1P1BHkhoQVwoOCtrUqarYVXD+ESqYdadVV8QSZO/ybDvG5kcFU4iHPRmydOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbekAbgG/Xv7DUFdO4gAxSBoPIcOq7v8Bs+HNtRoJiA=;
 b=mJcSYrlsmh1ek9K3gE0YGWZbLJ2DdfCfNQUVlzEhQ6JaEsIf0Hus/vEobcS8kl7axy2dPNY+X6g1Fm6nHLkDiCj5FhYzZh4LNnAutWZw1W3woauAsWj4xajjtCwE1Fd1WuRJKpoPnQPSPlypghsr+4mW0KRLkxjA9nXQK6gccNwmKXCi50k5NMXSV+uGv3mcL5CjEpGqL5GvYqiqmC4MF58nnb2fLz/qquJqvzab4qXJsjf4I+Ty2Lba+g93uD/RxovLvhmTYMdSAaiJLYr5bi8VK20fEdFDTfWRHtznT1U4eH2cxfRtvT/1pSBvoVss9yEVxmVpLi+D6xfwfBDVVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 09:55:55 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 09:55:54 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/6] gpiolib: free the label of lines released after their chip was removed
Date: Wed, 21 Oct 2026 12:55:52 +0300
Message-ID: <20261021095551.3283369-4-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-179011@kernel.org>
References: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com> <20261020-gpiolib-chip-removal-v3-2-aambrozewicz@nvidia.com> <sashiko-outbox-179011@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::32) To PH7PR12MB5974.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d410dc2-f66e-43d5-cd0b-08df2f597f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	b9U1hWm1/426X5xCy1l4xqnDgjoj2r26g4bz7thaWUqIwjUXKA0YAEL4dGBD6Kt7F+SAnZmLFO8x/EuccaOfOBvsbAWCwFOQUxHYWxaGi0OHNgWbL5H4+LPjBRIZjZgSSHurN3CW3bpDddYmzH2lE421def6NUAGKo/0OTXTwTFrvk73uNAEpTJGTOVkIz2eCShpNvvO7zq0vUBPKgpsRlgtULfY5G9B77tKhd5179hngTFVDMgeyc5zNpb1CA+Iv+Swu9QaByJ2acZI8YJfE9usQ+R4vqvYaDGq+qgDxTCQQKOpj483C3BpJeMOPkSSxtxUzvWfJAFMRQOTU9lXn4DQZ7gf94OQnWmXCwRgLJ17T8apb9ENA4NtwXuh2MpSWNmm1HMFsC4HRgilnwtkkG36iAl5p/MB+8j5+bW+/a+HkJYvUgjTm/0QocfTHHMF2B6AoSwp2NwOoB9JylOe1Bmrat3yzXMsm3qDHYiV8LQPQhbwXwv3SlL17VhQBSO+fdJbHnTHwZzbjeyJQhYvPcIJq8t2hAI0ptkA7vTrCQ3QwrkPe7FwLNlmv027n/Rhkmt4uspUrx3f+1OCVTyS/bDTROlPm6AF5IavBV39uY2jQ4ijV2qDU/M9HdaoB0XNaviM1ool19kn3aJcKVnolJu3N0majzeTxfxnvfAsmUg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R0SMx+W8nWQ0tDKkSsyNxE9effFBiRKpFsS67V5scenPl9JPQOk2XGgEMttK?=
 =?us-ascii?Q?Y2xTu4QZ9MligrzOkGC2wkRnRK0VFRJX8BAMk91+tlBhTbXrf6Hg6N10tUu8?=
 =?us-ascii?Q?b4jG7kN8X2uxyB8BIoAXiCji+EUhDVVtfGr3aS5+mLT7bMml65w8v/f2cwPb?=
 =?us-ascii?Q?7PPK6KkmMNDDCTCHliZBdxd3wWvn+PGC5sQOFRjMWlKMcUwYwOZn/IGTlD2G?=
 =?us-ascii?Q?Xo0me9cYtXDYV98cOUN8GfFLPvL4eCeq5udzkOyvSX6r5F2gLH6PwtA26qdN?=
 =?us-ascii?Q?Si/KkMXor7ihbMYbVQ7rfVpn2Qh8uqycSwMbY7KKRkzVY37hQ0Xkvg35jbws?=
 =?us-ascii?Q?8fv8wa1sBs7yTrPeBWNLshDbYBwN5BA68LyX4XT65n+esyCCo5ZzH85DUOF4?=
 =?us-ascii?Q?z5/leTG+EoWlbihZ/zNVjrpl6ymuxrkXg0D2AfD4804h/cOH8RTqbUhETBOy?=
 =?us-ascii?Q?uQJJ9z0zkCAxUdE4YUwz55oMsNWZGNofBI0i4T/mO9+8+xF0X1GLLZTYwThW?=
 =?us-ascii?Q?ED62bcT7IhClj/ePjKbolCLHQ6fC9pelzWXBjcgZTGtiD4hiyWxl5muKQcKO?=
 =?us-ascii?Q?HF5wzw/p5B0n9xIaPoy5FNE9wAytysB603Hi+7Tyjc7c0PESUECmcZpMfWYy?=
 =?us-ascii?Q?3aNUnMwrx0rRDbMC0bt/8P3uwqPV5GPj629KdLa1i9uTTQHqV0YxevbFsgC+?=
 =?us-ascii?Q?P6B2XvJllDIzU7tLze5eVigkV2GqjfmHgJ2ntjTJta926RsI1bluHrvd0Vq0?=
 =?us-ascii?Q?OfnNeN76Kz+niMiZFeXhPNAls/PNb8O2F2RFij6CpB2vhc2QntxfV03SFmnw?=
 =?us-ascii?Q?ct1BgeG+NTndMQWLDaOFLK1J2LqwIypjEmbzDKdNTgWniwHnrNnKeja/KNlR?=
 =?us-ascii?Q?stRzvWL1w6oqVPsAHc8TGNRHsW+DKGAFbLj3tc58R/ySDYyY21bgdsiFg0qy?=
 =?us-ascii?Q?58u+5uE4h0i33dxy0dLUYl2Tj0q4tYSuaqIc/ERP9M7cK9YQMByqAUukafdz?=
 =?us-ascii?Q?P+LHXDB7naWDpigb+7V8hwZHqf+8h7SKRgeoI6d+lJahs43R7m+QT7UPkYvh?=
 =?us-ascii?Q?RdoShuJ2+grDmmFiD9ApqSddNAbX6z7hE3nRO4UOdu7E704oesQYpnieVVnf?=
 =?us-ascii?Q?y3J3enylwfZwnMQDnAELG9+wvejkK5nxCb5VhULHUJgR7kzFEYmCPZd0aGqs?=
 =?us-ascii?Q?f6jWQJ+dTvVkPfC5OfJF20C7pDX49bGpPnI/MsFz2F4WIVqEor5mrz38+uvc?=
 =?us-ascii?Q?m1uZmxGQjoTzD7e+mj3f+OIRZJVfA4nTdCAbcRMl2Y8zdo1rqATQG4YMgEDE?=
 =?us-ascii?Q?6mdl7yc4lM4nu4ug//8kPz8LtyKrCx9sdPhf0AHAq1xdLA9d5/eGJ5oFQ389?=
 =?us-ascii?Q?O5imlhe4+m52/V6G8N+WUSXjpp8kxEBKemVUcEEXi38QOXDCtvWkhReR4WzS?=
 =?us-ascii?Q?SpQeqGqJyZmAd2mlRH46ykzBkCe7dOkhjFLAU77j7aZ86VtW0d8lyG+hvXXy?=
 =?us-ascii?Q?XBroZmpGMpoPGx1gMX1hx4L7NJJjnd1/rp1MnaLqeStMnR+5UfAwZrgc5Qo7?=
 =?us-ascii?Q?VOPSMe1erfN+lX9PPYjEgRP0WvP4+r6+COsAbx+3J/U+uX8o/wX7IFv/mbEk?=
 =?us-ascii?Q?/18Tl+b+WlFdtLIrpqjTku8k64gBEyXRMMRwxOEQGoCTiwGTyoByhUPVfsDZ?=
 =?us-ascii?Q?bJ4UyJz0P+rpqRmbLKPNMx2foAPpHh5K8ZFO1Gy4Ks1AWEc2Pjh0SBcj7Qio?=
 =?us-ascii?Q?lGdKJ8NL1Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d410dc2-f66e-43d5-cd0b-08df2f597f71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:55:54.9257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVa88DOFCqR4CQ0caunJmNtihojeN6GoruIdfDhbE8WSfQNgr+Bu9qXMZJaEn829pbhLbWsQIC2y/Jx9tEntWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098

On Tue, Oct 20, 2026 at 01:19:01PM +0000, sashiko-bot@kernel.org wrote:
> Can clearing desc->label before invoking guard.gc->free() and before clearing
> GPIOD_FLAG_REQUESTED cause a concurrent for_each_hwgpio() or
> for_each_requested_gpio() caller to pass ERR_PTR(-ENOMEM) to kfree()?

Yes, but mainline gets there without this patch: gpiod_request_commit()
sets GPIOD_FLAG_REQUESTED, calls ->request() and only then sets the
label. Reading /sys/kernel/debug/gpio in a loop while gpio-sim lines are
requested and released oopses gpio/for-current in kfree() within
seconds:

  BUG: unable to handle page fault for address: ffcc73074355ffc8
  Call Trace:
   gpio_sim_dbg_show
   gpiolib_seq_show
   seq_read_iter

Before commit 35b545332b80 ("gpio: remove gpio_lock"), gpio_lock
covered both the flag and the label.

Bartosz, Linus: as this is in mainline, I've added you. Below is a quick
draft of how the fix could look, on gpio/for-current: return NULL from
gpiochip_dup_line_label() when gpiod_get_label() gives NULL, as for an
unrequested line. With it, the test above runs 100000 cycles without an
oops. The order in this patch then doesn't matter, so I'd keep 2/6 as
it is.

Should I submit this as a patch?

Adrian

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6932278cdb..48e0f2f2aa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2718,6 +2718,7 @@ void gpiod_free(struct gpio_desc *desc)
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_desc *desc;
+	const char *name;
 	char *label;
 
 	desc = gpiochip_get_desc(gc, offset);
@@ -2729,7 +2730,11 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 
 	guard(srcu)(&desc->gdev->desc_srcu);
 
-	label = kstrdup(gpiod_get_label(desc), GFP_KERNEL);
+	name = gpiod_get_label(desc);
+	if (!name)
+		return NULL;
+
+	label = kstrdup(name, GFP_KERNEL);
 	if (!label)
 		return ERR_PTR(-ENOMEM);
 
