Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582AA3033E6;
	Mon, 12 Oct 2026 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813015; cv=fail; b=S/WGpCLgj/iFTi7+AU195AeVC1EpDwby1IRejgzi74luDUkwxW0O8gHlUecoIFv7P65Jou6o62uyqBXgqNi/cHPZ7tnhg/rRpHT2andi29yuFxYNXKTDtx6qi3ojcjMMS7Qn526S7gR4qKDCIk0SgQyIQj63W7cIbz5V/hlQ1E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813015; c=relaxed/simple;
	bh=FJYPdk9UIa3lJyqlkOsEnYXWAngfidDmO9xd5nLF6sY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J2U0Fwoza3c8NDkL7G3L7epyVJ/epsxHqO1pLvg5ofKQX2I0zPeG+XGnZAN+SM4neLr6YTrUUK5FcobPmLXkBI/Kw4OwTHQ+fqEJuFOOFXSJDDHLxPPLXClDs1HWKP13NNI77Otz2M7IDfmG+YpRmDcFY9mGmUeQao7i00mt/cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XQ5AK/2m; arc=fail smtp.client-ip=52.101.48.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XQ5AK/2m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7ZRXRXq/3GTagyzgeQphWgcPTp6MHs6a2WRv5fx04B2OEgPej1fp+UDXsYqi1CPlLcL13+qmIgNXu6RhoB/IWCDHc6vGHv0NkanevTTis75GOcAIHvDQO95FtdhIva1oqbGoW1tXS7F0bsc/UOy1zEd5GT4LwAKpDRNioeaQbUZMLoCMTBwrs6LHTQ55+TZZyZeALvVUmF6dHPIWNkR6iU4zFNeU70qfCMYrMUoPEPKJ8qahFoxPyKN+wE+kJY14ZrQSwzekiPjonmWrEnsDbgRIhwyOEqfnIOrwoIiKyFL4dDC2FGFwb1nyE/8Qji8E0XkoAS6M99IgcosHfeETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i7CAHJa7GIhCFI6oqfWpEz0LW6DrlAiCuKUjEHJMgw=;
 b=Y3HhkLmUmHXemY1tKcrz3cBw6PT5q4xi4SyLXAMrBTxQ98VAI0H34sv8RpHp2C7bJTQsQ9OVuAYbAiTAKn4sI3YZFX6xDUf2nX/a/T0su2mWkSNxe1aun0hGO9h2AUkL1advPHIsYS5S6h4/zKHwMPi5zOVn8uj2tZVuGW3XPibd0a4KFtxuL+Nu0IB5lt56H+Wzr18PVH9IYxVMh6UJtTleVzHbcKujq8jhgLNGcTaYCNMOnt4lv9ZaOwqedLt1A/h01RL6poDXFko08m4bbicCp6RmolH1bhOGF2L+MJT1mGy24gbI3eJr8201dMhz7KBLhFRkmaONxDDYaZCxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i7CAHJa7GIhCFI6oqfWpEz0LW6DrlAiCuKUjEHJMgw=;
 b=XQ5AK/2mO9Ln1PyGSvUwP7kTvC4tEYVALenbi3I4OKkD9zeTvW6A8SMsfXPNoZOTw7VXsJKf1iv3rJG/qFay8BrtzYlmIOAsdHe7LWrB+o2PrNiA4oEp/r2hx5PmofcNUAk+WF5ey25mgXfXKfw0yCaDB2a9PjO3QqrP99LKWT5Xv9nK2LqTJQ5hkhcg1jEeaz0bWxM+jwTkK6nU9h4tAEKrE28qJ4SVCJgyNH1HIOx0jwC/tv0imE7SNSWDukZbs4VrI4XugEdi3TdzXLyji1IX1doxoIm/wltmfXt6KVSOHSzxEPR1wtNVC3Gz1Zy5/sieYYO6zsNwTI1oG7fNRg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Mon, 12 Oct
 2026 13:50:00 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0496.010; Mon, 12 Oct 2026
 13:50:00 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kent Gibson <warthog618@gmail.com>,
	Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <treding@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: clear the event clock flags when a line is released
Date: Mon, 12 Oct 2026 16:49:45 +0300
Message-ID: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0128.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::6) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ed6b08-73a9-44e0-24eb-08df2867b55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|11063799006|10067099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	LpSmn2INf3Td25aii4P808oHkgWQb/K/Cw9hpICj3bWjwy+iU7hbvHQC5ksimHECyOTlQsGaCbLRAO3rwJ7+I4vxXrg/EfqFi7nnkShe9IHkR6rEYcILFCM3MbC1e5KDbqN0K7jyOngOegWJCw9t8GnV0Dr8SzQbXVyyy4qsq/cMXmWZ0kZq+ampfTJVZPblENRcaAOBaZrq4296Nr6SlNmezKXrk0iMrrIIhHLviDTJ3m1Rj2+re0SR6Et2VuuAUuGkMu8AOHMjNs/WppxPlbxHGRAZG249sT1KHc30GyAmOTNPnR7+OoWRwRoU9rfk6gSgXVD+VB6Nm/ejcGvHDEyW+Mab6GtNcXntyANmCxZMAqcGKKXZHj/EploZLiNDoaDjPDdsWzWe4D5JIr3560vwHY9aO7oIy+8QNUINntYaCcsu50HIBvhZz7s51um6rzAuzw54p2OCNeOh6zVYyeXeKZWx7F0ecXbjrfAMK/tqSdfP/Wjx+onyAFmHDhcsQB3+IeeOI6TCAjBLQmU6Zy/Peb1MIJX6sOE69X2XKa+DkdipEfxfDqTuUZcKHHuZBDGIl1eI1ODG3NL23AmfMJWau+vbLVkOnMfYFg7hM0sqzaswx5Dq7NkJJ2gYV/NHnmtZt/sQ+/rIa095YSImHkEZIMmzY42yB6jTlBbd9iM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(11063799006)(10067099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?65XhThMAeDcTsYl6LXS2N3+edevimuYNf+Cj08nfwne1MPL6smAYmMDGcO+n?=
 =?us-ascii?Q?EINRdh01V9LNLuvkoljVrLB9n5HC64jI26PHhjOLDC1RwgxJnhFOULKaDE7z?=
 =?us-ascii?Q?xlsFUZqB2R3fLqSrR3d6wNExW4Xwd25wko5+0esq3iJEA2qZ2oJk8lHsBMzs?=
 =?us-ascii?Q?KaDP8vFVvgNMEgWRERXdmN544AxMWNXrsdHtrXPQjD1KxEC3E+JCtiMsCIJ/?=
 =?us-ascii?Q?QGWcGOWLzbDyZ/CBgVcrOozpfFzsrUwkPdB5sTZA+QvBj6FBcw0KXLlfSI2G?=
 =?us-ascii?Q?D33+oKVuhft+IRM/YbIVwfNRAuwnJ4w/ZLFIjlq2PLHx4cbylQhX+TPMWstf?=
 =?us-ascii?Q?ETBaNm4fEHCP4VH+2MSQv5VnvxVAJrek556PzBBcIp8scY3yYhQwhANSDart?=
 =?us-ascii?Q?c/f6tpJAO1gb2kk10nuaRh1n6JUZRc8nrYW1pMohpwAMRZTmwRvPDSyfJhEd?=
 =?us-ascii?Q?mzjXWC7UrPems3MJWsjmNISnqshd6F+pRWTekZj+TJBeeMbZJTAd39Qb1fPO?=
 =?us-ascii?Q?doj9g96qy3ec502UOQVskB/DSNLtK9pjMNUyK7D55JUZt9my30/FAV4GVRIA?=
 =?us-ascii?Q?Xec1Kht9yPHFreQTCqVZtcdZvf1XEjRfU8ehn7kK5MYkod+W58R72F2bldob?=
 =?us-ascii?Q?WfqTYx9TwVxUlYsgovxxnIfA3C76CzOqbnbNbXcbFmALzlPjoxRMI9t9lG55?=
 =?us-ascii?Q?gdzAGdKbliW37ltIJ/IBrix2zvYbS07riEMrYVRoSGpu1PoEl9JdgjzIkv35?=
 =?us-ascii?Q?+eXGkR6Ga0JxTXx63JNQCqbpJg1nhUggpqwJ+L/s9yiZHQUQPnx+NAMJ6T8B?=
 =?us-ascii?Q?nOfB/Jlx7HUfDpiU/vtZzoVc5BDcSD/i9y4057YGaSMh+y7kxgn3EX2a0J9v?=
 =?us-ascii?Q?8+WILdFg2Q/l85pMsOTENMWkwzzUdzU07gLUPBc3M4jAuGYc0aPJ2encamKz?=
 =?us-ascii?Q?0s8btPE/03BZ0KY7OxuePTj719g0P6KKXjX6EqTn6qyc+rjHM7fSYa+RmLEM?=
 =?us-ascii?Q?LTON7MJXc34cl6zMjsgxKCG3N6ud96TE593khJqnpmEOAw+X6w/JefeGi7UZ?=
 =?us-ascii?Q?gtY3wEOtvdiVRvOgvi37GVhBClzYJBjkH1YxZVqL0Gzlcs3HAztfWq7yfFzE?=
 =?us-ascii?Q?CKb4T/zj0DVxpeCtpmbKqSrd7zyg9VjMJoiH9e+0bqzFpzJm0Uwd1fbiPGKt?=
 =?us-ascii?Q?k6KyTuH/XEHEoxvToYyI8k1wOoqDjO3Vf+se0mXRcVSlAWydT9isDB8fIMeY?=
 =?us-ascii?Q?eyKgtZp52/g33Z2CU6XvB4ZdwCRlKRymdWxZbCK95xZtpTkrsP3ydEV5iaCk?=
 =?us-ascii?Q?eT2RWwJbz816KYZRgNPUDCFXzLVewMbo7375LvwewC1/d1Jaaqjs5hPJU3B5?=
 =?us-ascii?Q?HOoIW2XlJHZ0TGB0b1W+biOgPzzdslrL2/3x6lfsvobuqYe1OVhaRBCa282T?=
 =?us-ascii?Q?IwcSW4CbTy9wh+3eJSREzUI1x9ZQtQY/hlIv/q42f1FivC9uez/DrlvkYRrw?=
 =?us-ascii?Q?7xP3xk44Ppi18vS/jUYBnbiwU1d6ELz1hkIhyD+dGWQvxKGgNb7xW1hzrDSd?=
 =?us-ascii?Q?la75VfswJzNLO6Y4pic0G786OPX+fR364xQiUJw7Bj4wgdXsFp6j6Mj5M5ZO?=
 =?us-ascii?Q?0Q+iia3uLQmndOwZcvULpmX/x65r8NaBJZT/jGAehawmNYymMS6OtDLi2KkA?=
 =?us-ascii?Q?W1Uk/hGDUcmGU5aOBeybk4HFqjlIruiviQeX/U5xe3q9jn1i0NmHsfst1vRJ?=
 =?us-ascii?Q?D0KOzk94MA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ed6b08-73a9-44e0-24eb-08df2867b55d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:50:00.0967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTWYBvU8DPS+mruXguiDC7G2jx6i6zLI2KhUvSHgO64yWrZqWgpwSrab27lMpLUU0ETR7YXPMDpgL0vKvvQWDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

gpiod_free_commit() clears the flags that a request sets on a line, but
not GPIOD_FLAG_EVENT_CLOCK_REALTIME and GPIOD_FLAG_EVENT_CLOCK_HTE,
which gpio_v2_line_config_flags_to_desc_flags() sets from the uAPI v2
line config. Once a line requested with
GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME or
GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE is released, GPIO_V2_GET_LINEINFO_IOCTL
and the line info changed events, the "released" one included, keep
reporting that event clock for the free line:

  GPIO_V2_GET_LINE_IOCTL, line 1, input, event clock realtime:  ok
  close()
  GPIO_V2_GET_LINEINFO_IOCTL, line 1:  input, event clock realtime

The flags are set before edge detection is set up, so a request that
fails in hte_ts_get(), for instance because no HTE provider handles the
line, leaves GPIOD_FLAG_EVENT_CLOCK_HTE behind as well. The next uAPI v2
request rewrites both flags, but requests through uAPI v1, sysfs exports
and in-kernel consumers do not, and the line info then shows the event
clock of an earlier user for them too.

Clear both flags together with the other flags of the request.

Reproduced under QEMU with a test GPIO chip: after a released request
with the realtime event clock, and on a kernel with CONFIG_HTE=y but no
HTE provider after a failed request with the HTE event clock, the line
info of the free line still reports that event clock. With this change
it reports none.

Fixes: 26d060e47e25 ("gpiolib: cdev: allow edge event timestamps to be configured as REALTIME")
Fixes: 2068339a6c35 ("gpiolib: cdev: Add hardware timestamp clock type")
Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 772c6f04f489..c6cee872e4ae 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2679,6 +2679,8 @@ void gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(GPIOD_FLAG_BIAS_DISABLE, &flags);
 		clear_bit(GPIOD_FLAG_EDGE_RISING, &flags);
 		clear_bit(GPIOD_FLAG_EDGE_FALLING, &flags);
+		clear_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags);
+		clear_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags);
 		clear_bit(GPIOD_FLAG_IS_HOGGED, &flags);
 #ifdef CONFIG_OF_DYNAMIC
 		WRITE_ONCE(desc->hog, NULL);

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0

