Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020100.outbound.protection.outlook.com [52.101.69.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587319E839;
	Tue, 25 Aug 2026 04:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787631374; cv=fail; b=pXK1GAFF72klMrLKk9GgiyiXWb7EZMnKP1b0wzFEMezXmRdAPDoLSjSdEjWJDWFoqj629+B/yYMSjI3HeiCht6k25jemckXGCosE65zCB0AwJ63nYuPrEkFf5AR+HV6m16xLszX2AJMdX6JJ43U7t5Cxw2c2ED+K7NWJtDzwKe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787631374; c=relaxed/simple;
	bh=hiHesN3HPI5NL1Ma1VMgZCLz/Zi193dGOXQnh/rNGv0=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Z99aFCRRjBIripMN8x4QlXHzm3vVYsjz6PjwUC7cqRgFkk1qoMz3eUkGSGc3rNqKGfcpVRwyuGZNssfeIbpv7tUrkwycZsfPL+XjUgvDpuX37Ncj1JhwJs1bmhocRx+GPGWPxHhazUogKkE6Pd9MW3O60PChB1gyMmBmEgC3fKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=VpGkuxiG; arc=fail smtp.client-ip=52.101.69.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="VpGkuxiG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozkNzv1uNWuW8k4XIWMrj9nkqiAjvhXUuiKz9zBmPNKSX6Ixyjm4iIvlxRkCP3kdErVsonprtq1rD5P0/XXdj/FBT9LqmARH8oIWc5DAOBdH80t9gx+A+jafIJg5NxbveoEwD0uC7l8k13366D/2x9VteCT+b8rvsMKW7tzkN+MCBFlBXX+Ot5pdYkyUQ3UtwiGXiJoIAUQPLsJfPE1DnaLEdwAImvUGb6aYR3dfcaKNlRzv55XUfftdhPK8N+YQnMiDCUOr0sM98cUSVe6Ro81fIuvNtB6nCJJp02BEJUjlqiUDUUttHmUrzleIoBqWCCXYcf3nHu9DGaLqgrjjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNHyCPgmCABLv981b89jWkW7QTyAKOOvpRezm/Fhxvw=;
 b=h/GV1v7Cubh9Xs+toJbUk0xXMo1stw+ykVl2GhCfXXrKU7+2gGwdpnOwL11xpQwVMdU+eJnq+8bhxCCe5e519u+/J7doLvx/2pqD6IqiV+W9flT0WtHe7rBCaVnCl3ECPJ0O/GA2gIixW8CovxfhZpVzVsBcmAY/9UgkWXFbandb/uTGynD2G7bqcWtRLQdEtVuvFgTfPb28fmhs2HaJiyOg0LkiKk7GM06iTu3C34SlLdTnbVannSBQiWuaJtDKR2Pcf0Y78q1oL13aOvLBxB/1fniRRuu65dBivkaTilv5HwNYEzmB35F/xPIbtaL3olBYQo/EflNfPndxn1tqUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNHyCPgmCABLv981b89jWkW7QTyAKOOvpRezm/Fhxvw=;
 b=VpGkuxiGUGontjB5bI3QvZPEZ8LMQhDmLIhuvRpbxGzCWheHOEJbb3ACCPugi+apelr4bVppDovIhxBT+Hhluri6nkpelkYKbtzA3+4rIaWTa5YPabx+9Hofsu1zhES3MDHPB6ao3WY0lxoSV5rmPzsE8s0+zGgHoVNqQry+ZT1YeNzUGoV/dlVcA2aoZzLPcbgqduMTd8y6qsYV+lbfFsups1/te4TPq8o4TrqSvyM1d1hIOcogZaXCjzRpE13JXf6HhWor+Sk85EGCexWXWNMW7Ks1IH5mhw5ZNFJIQ1wu4JQg+d5hVyibqAefY+QU40UxRmCBQpvUienh7K/qKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by AS8PR06MB8118.eurprd06.prod.outlook.com (2603:10a6:20b:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 04:16:04 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 04:16:04 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Tue, 25 Aug 2026 04:15:57 +0000
Subject: [PATCH RESEND] gpio: pcf857x: implement get_direction()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-b4-gpio-pcf857x-get-direction-v1-1-de15996ae354@vaisala.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787631363; l=4346;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=hiHesN3HPI5NL1Ma1VMgZCLz/Zi193dGOXQnh/rNGv0=;
 b=jwJd8Z/vZu60dfDx9M6Gx4CDvdGyyyWzq++DEZ9usO/f2Hg0FOlTsr7AB6rrihjrgcbZBcAfs
 sjTAMulrpc7AqmSCgJHwx8wlLVFXzFiR+hffimkXF89EAstf6FuTB3x
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GVZP280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::11) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|AS8PR06MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: b23769f5-c6b6-4745-4864-08df025f9426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	qpPl5tjb5MruYDpEvUQLyj/ftpeoIzrwfLPXa6LleAzLOdEJj8jFGg3F1ZEdTna0pHDs+jnETNpMXGY56kUqs8m+cnlmrKMO6Ph9YGulk6I+ePgvtf7HQKF3eGhYHpUzGN0ie/vAXjmqdDOF0Jb3Fb0yr46kP47wVt6t9SlYjKB/Ac+TJCza1t32lO1MZaxw+to0+ZIABo4jFEmYrqfbopEzUjfzQXBDic7JcLr6iG3gVdowqeOLIkC2jxmV106eJbxXnC2IZ10VLxlKHzmC+H01hsZ1gZSRok5d+I/Zc5v+DGkp7SPWAkqTaUrELd60vjW1hqSXCxk1Q4i3QMr1tPBwrCuF9EX6y/G6suq6zyVhRIIFS9KrKj6dkorATmcUuqgQuhZsTrYXrHbreiDNcUbzf+AcNnjIxr5KSGQXW1dlvlx2hCVHsSWTzWnas1pW4RwDIig0bmcKbqfzy2Nece8DSNeCC5kgAJp1VMU4mz64sPzkkjgxFDqpVLc1Nq7sbU6pFuI4o7NM63L5GlQGNjMymFzAVPgbpnWt/24GuWZYGmmNntfOcID0ykIyZxS+7HZlSe/vSsiZQhbyoRfANRPpM/+cKoVtm1SQFSK46AE0v/8nXTfRchh4R8NlQsY5RQVqNU/dYQ9g6am5OBAW3EWbkB7Fcd1ukQcPeyQ7j9OLCH5kcQF+/BaYjcj7BlNb7mVaUbymu6y0d7D/a6YnADgUMxHrkUhS1XyEy5sNaLc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnZCTWhvcG8wOFR5K0ZFd2RSVFJPZTdORTlrMXVSb09SUFJHeStGL1JMa0FL?=
 =?utf-8?B?RlliZFAwL3REZHhKMHc2dVRUeWQrR3pXSlZyaCtBTElVSlhPR0RrRndPZ0c2?=
 =?utf-8?B?Rjd1N1RJMXc3RHVkV0Q1Tm41QjVJd1VPOFdwVk5IaWNLaTVOcUhDbHlySENU?=
 =?utf-8?B?N3djNkFscHpvMjdyYXlmaGpaZ1EzT1ljVlgrT0w3Y1pMRlNEeUNxekgxcjZO?=
 =?utf-8?B?cUJMNHBFNERTc3gxQVJIQkpWVUEvYmttV3RHejJ3QjdoMEJGNDIwemxjbjNX?=
 =?utf-8?B?cVo4OFBYRjdHdUx2d2N1UmhEMmNZMnhZa2oyMlVpN1R4czhMVEh2NVZIYjEz?=
 =?utf-8?B?UnIxaHh5MWxBSDZTM2pjL0kzZlZ2RG1uc3pFK0hCcUlzT3VMOGRPMGtYQVZa?=
 =?utf-8?B?cUJCaWJLcTVScVM0azJHV21DcktmNnZ6VkZHa3hhSjdFSGZlajhVZGgxVGtU?=
 =?utf-8?B?cHhNM05JZnE4WXpYZ1VyeldTVjVFKzh0ZFdRNGRrSmNiazZxUnk0T0dyK2NB?=
 =?utf-8?B?d3pLNFFodVdrVW9ja05Yd0xiSkNRY1pvNlZPREIzaGZqdEQ0QmJIZ2JyUm5z?=
 =?utf-8?B?UHJPb3RwYmMwTHgyR3pNQXJNVVYvbGtCT3FJVmx2anM3NTgxM1BVeHR1bjBp?=
 =?utf-8?B?UjVicGFOMlBCdVIwNUM2OEZ0MFoyeXd4YkE1UUJJQ3JPaTBCamhWbElYUXc4?=
 =?utf-8?B?b0xmWTlySjF5MVVCRVFnZHQ2RTdFNnBqdHRwUUZpUTYvaS8yMzVLMkJzWFZy?=
 =?utf-8?B?d01maEpkMmRndGt6QXNubkdBUXAvWjRFbHNIOFVrc2xQOVpQRTFMNTRkTGEw?=
 =?utf-8?B?VUYxNXVDME9EdjM0ZjdCZXl4VDdLVXQwOHZFZUp6ZjlvRTlkOTh4cDArdFN3?=
 =?utf-8?B?ejk5d0NzVU9YQUkwOHVtOWNhNmR0dW1CZTBZUzdLYlorYVFIR0FoYjBCU2J1?=
 =?utf-8?B?UFpiczVVSG96YWdlRElWajR0T1REKzI4aFo2R3ZueU9ZNHJlTmJoM3FMRGl6?=
 =?utf-8?B?Mlp1TmlyV0trMU1tSmRHc2lFTHBML3JpamFvUGFyb0Qxb1RjNW5ZRVZQeTBD?=
 =?utf-8?B?bmxKMFdHYjlFd0NRODJQTTQxUnRjUjI2S1Y2bzZBYTFpRE5YSkRhVmlQdVlI?=
 =?utf-8?B?VGk5U0V2QWhCZmpsY1d4Y3J0eVFWTU4rS2hNUUNFck15bEhzUnY3OHVHSlVs?=
 =?utf-8?B?RlZEQjBRQmt4SXYwR1MxeWdxWVZ5NkNMdUFVcDJEU042UWU2MHhCWmdvWjY0?=
 =?utf-8?B?MFdGakJQYjRNaXB3MmY4cUpRSVdETTVLL1lVU2VSYi9ZZC9DZzVrbFZNdkcr?=
 =?utf-8?B?WG9NRjNOTDlrbkp0aGtmWEpEMm9HM09TTzhPK1BBWTJpdzBTS0EwcUNXZ25L?=
 =?utf-8?B?OG11ZXUxcUhValdSOHY4VG9laXpHZnZjaGt0Smc5ckNTRElyeERydHNHZTho?=
 =?utf-8?B?OHRmSmp0bUtseEpkb3VUSjhVNTJVdStwbEwxMFdxSk83VDJyL3ZOUlRHSGw2?=
 =?utf-8?B?ZFQ5cmRXNFZLclJkb0xlNmZYaTFOKzNRTE5qREhlUys3Slp5eXduZUVwNUJQ?=
 =?utf-8?B?OXRIeU1tRVJWWXV6Y2dSdnAxWjJMSEltaVVaYTg2MlNuOEszSFRidjZFTFV3?=
 =?utf-8?B?WjRyc1IwWVltcGdLL0QxU3Z4S1N4b0VvVkJoTE4wMXpuY2dNRjZVSXRaLzZG?=
 =?utf-8?B?cUpCc2tKNWpXaCtRZWNuNTJmeTg2YjNVMWFzc1JmWUN0QXViTjBmWmtMeHFw?=
 =?utf-8?B?Z2NibTdvcXZlUVI3UjE4a3NOc0k5a3ZodWZ6L1kram9vV3M3T2xKbU5rcURO?=
 =?utf-8?B?OWZ3RnhkRHBsU0lUMmgwNk0weTNnQmZleFZ6MDdFV1pTajBxVnRkbjdTWkY2?=
 =?utf-8?B?Y1NqSTBXYnJJRVJqOHVTYnJUVk9lM1JUYkVNaE9lT0JHR2RobWVUQVNQMWs5?=
 =?utf-8?B?T29MbVAyTUltUTdBVmh0ejBuMENMS0NNTlVzN0lIdlA1cE1oamUyUlp2K2V6?=
 =?utf-8?B?Q2ZGYS9PVElITWlVV00vaXhFbWN5RGMyaWdkdDV5bklDUW8wRVArUDJmL1Iz?=
 =?utf-8?B?b2x4Z0FPYVBURk5YN0p3TUppaWcxVldkTVJtaE5pNkhQUExzSVRmellyT3FR?=
 =?utf-8?B?b2NlQy9BOCtiL2xJM25TZTBuN2M4UE9NSnJ5S3NKSHVKUENBUmcvNmF0S1Yz?=
 =?utf-8?B?TWcvdjNkbUhtZDRKenVhenB0UVlpK1Nic3VuT3ZESUFlcHBKVkZGc0N3Nzl6?=
 =?utf-8?B?Z0JXT1J1MUJMR2hscktsbEFJdENRVkZzSWlVdTViVkFxbnh5allCNlZZQU10?=
 =?utf-8?B?dDREZGtsU2Z3ek9xWFF5RURDMVRPN0ZFMndEdk1OQjhVaGFPNE13emRBaGIr?=
 =?utf-8?Q?+21ukMxG5MVr1UdQ=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23769f5-c6b6-4745-4864-08df025f9426
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 04:16:04.2680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nD/bGt3FEgyZ2SDGykVnbSaEcNDSM9KPZ4cYFNhU/ZuVLtejYBMT8CidE0RJnAjj6sAZoLVqtwwUtxch+iuGIbrdG+O1IKKY0gyK5MEEdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8118

The GPIO core warns (and taints the kernel) when a gpiochip lacks
.get_direction() and a consumer queries a line's direction, for example
via /sys/kernel/debug/gpio. pcf857x provided direction_input/output but
no get_direction.

These quasi-bidirectional expanders cannot report direction in hardware,
and the 'out' software latch alone is ambiguous - a released (input)
line and an output driven high both read back as a set bit. Track the
direction explicitly in a 'dir' latch updated by the direction_input(),
direction_output() and set_multiple() paths, and return it from
get_direction(). Initialise it from the same reset state as 'out':
released lines are inputs, lines flagged in the power-on latch are
driven-low outputs.

Fixes: 15fae37d9f5f ("gpiolib: pcf857x i2c gpio expander support")
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
Found and HW-tested on an i.MX6 SoloX board with a pcf8574 I2C expander:
without this, "cat /sys/kernel/debug/gpio" triggers the gpiolib.c:429
WARNING on each requested line; with it the lines report their in/out
direction and the WARNING is gone.

Resend of v1 - the patch itself is unchanged, only rebased onto current
gpio/for-next and carrying Linus' Reviewed-by. It does not appear to
have been picked up:
https://lore.kernel.org/linux-gpio/20260604-b4-gpio-pcf857x-get-direction-v1-1-d9b13a7b4478@vaisala.com/
---
 drivers/gpio/gpio-pcf857x.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index c1f5e10a3c202672ef026e1b444112dd2759d42f..1ba6a09542f3c667dd623a88278b93afd6e93e50 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -71,8 +71,9 @@ MODULE_DEVICE_TABLE(of, pcf857x_of_table);
 struct pcf857x {
 	struct gpio_chip	chip;
 	struct i2c_client	*client;
-	struct mutex		lock;		/* protect 'out' */
+	struct mutex		lock;		/* protect 'out' and 'dir' */
 	unsigned int		out;		/* software latch */
+	unsigned int		dir;		/* direction latch (1 = input) */
 	unsigned int		status;		/* current status */
 	unsigned int		irq_enabled;	/* enabled irqs */
 
@@ -126,12 +127,21 @@ static int pcf857x_input(struct gpio_chip *chip, unsigned int offset)
 
 	mutex_lock(&gpio->lock);
 	gpio->out |= (1 << offset);
+	gpio->dir |= (1 << offset);
 	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
 
 	return status;
 }
 
+static int pcf857x_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct pcf857x *gpio = gpiochip_get_data(chip);
+
+	return (gpio->dir & (1 << offset)) ? GPIO_LINE_DIRECTION_IN
+					   : GPIO_LINE_DIRECTION_OUT;
+}
+
 static int pcf857x_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pcf857x *gpio = gpiochip_get_data(chip);
@@ -167,6 +177,7 @@ static int pcf857x_output(struct gpio_chip *chip, unsigned int offset, int value
 		gpio->out |= bit;
 	else
 		gpio->out &= ~bit;
+	gpio->dir &= ~bit;
 	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
 
@@ -187,6 +198,7 @@ static int pcf857x_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	mutex_lock(&gpio->lock);
 	gpio->out &= ~*mask;
 	gpio->out |= *bits & *mask;
+	gpio->dir &= ~*mask;
 	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
 
@@ -301,6 +313,7 @@ static int pcf857x_probe(struct i2c_client *client)
 	gpio->chip.set_multiple		= pcf857x_set_multiple;
 	gpio->chip.direction_input	= pcf857x_input;
 	gpio->chip.direction_output	= pcf857x_output;
+	gpio->chip.get_direction	= pcf857x_get_direction;
 	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);
 
 	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
@@ -396,6 +409,7 @@ static int pcf857x_probe(struct i2c_client *client)
 	 * reset state.  Otherwise it flags pins to be driven low.
 	 */
 	gpio->out = ~n_latch;
+	gpio->dir = ~n_latch;
 	gpio->status = gpio->read(gpio->client);
 
 	/* Enable irqchip if we have an interrupt */

---
base-commit: 146cc263e457ff6055fe7829e4f4f4b0b5d5dd86
change-id: 20260603-b4-gpio-pcf857x-get-direction-6f636aec468f

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

