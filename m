Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013026.outbound.protection.outlook.com [52.101.127.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F93F39E9;
	Fri, 17 Jul 2026 10:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285952; cv=fail; b=PS49suPRInRpByt1cGFgWg2OBPOAqSK7SJ8L6x/52xekTTplbiuoXZPsLvHeBVvJ8z3U7IfifldxKw8kY63D03vX836TqaZPHxOwMA0l2ad9k38SdLlPEGca0k9hJ4slrDU8MVSN7Q+TbRyTFnxDwZqZRGC5+WrQ7mVu5EC8Gxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285952; c=relaxed/simple;
	bh=Ab4xflflkz5LeVwRzj8iIQLM938PC9Q+YRtRGRKRZzU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i+3F/wvoktCnoi1mtYFvOvf9i9tTIfv0gpQBCHRIQ80WL59MQKT942+YOW5D+wRSClcM4VvxbHU5UbBQ4+7roI5M04QLuadKijtN4voTlt2pbKo8vgwzHZ+b1Ebe/qs/mDC6kgsbdgaz+8auJ+EKcgrm6svstSmCfgclcoyTNiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=BuoKb+v5; arc=fail smtp.client-ip=52.101.127.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="BuoKb+v5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChG5NsSel9oHd271U87V7p/56DYQ/acIEp6INeUKiBpXkjBGqotKZZZMccxW2PcdEp9JBPTDJD498ETRu0ilbNHFNviA5PQhW8JQde5dhHurD0MjOibA8eWLsFTiTdLGTYDtj2bsOkxYdORL41KPwUFFnPLoKjQPn94mM4jGYXV3gwbMoORoNllxWh0tTFbbojgNrZ31Ksx8/gYWlB8W0i8RKA39xxxQuslvmF4A4J6QZEBqK/j4Xej36fBW4GCXgjT4FlOz91fZJMtQi1Pl9MKYDSQwIn7XQMKHgV0c9CHjaBjHnIPgtLWOfGi69jl4ofHdKv6Mk/L34dYlUlBqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW6d0dD5xJWxn6ZjTVQdRBO4Fe9tVK2zCRuyCdyCKGY=;
 b=XnDfxbtYfiHGa5dIj6aYGHTu30k4hF4v4396HpZxv6yr3gDR/B47tyMUKe1LBnS6arj0stnn9yAJDxdGk2Uk7+Jy74ECh3MtUWnNm8zoayX93JriXyxm80SKO5LaFvVN/IkGH/7O2ijZSu7A1qHl1+ccspDfOGqQ6SxKccZmGOwVunDVzBjxXDUvbgulmbhmxpk/KHjzRZHU8t0cjZe7LQvCMzJdcG3CpyCPgEpASJ/TxC31/GcNhSEyh2BDlbTNL4ddBO8A3W3ngJitI9htOXIxG9G91tbapKXobFpN7Q7HnCZTQ7IIvN5BKPx8AvdHV4Qn41y1c4+XH6m763/usQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW6d0dD5xJWxn6ZjTVQdRBO4Fe9tVK2zCRuyCdyCKGY=;
 b=BuoKb+v5H6wB+oPKK0arw256CDwopAotH+pRtHxGLPAdRKw9cgIspzwG5x/rDjg/kBFzj6M99pw7p3P3fgPpVfZP86rdPz/+HE1m0CypKzfTawWcpNtos+lsnaYvBrDnPvov6WrgYzUV7ciMvirDGEuNZsD7Eo+bCbctiXA4rvsHDoc+TjVskhOatybSfiHrSHfULEKE3U75xE08WA5eoW/txHmO0kYQXcqwDoT//hbXwhZx/6uqonSUz6wsocxqzx/Ypo/wD/12ozu6BZc+vvPZZr5jJnWv+3E0zqa2OBYmT1vDdMwUPH+tWgO8pJUA3Oe5L/8PzH+He6nfbe+/Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUZPR06MB8313.apcprd06.prod.outlook.com (2603:1096:d10:64::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 10:59:04 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:59:03 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-mediatek@lists.infradead.org (moderated list:PIN CONTROLLER - AIROHA),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 0/4] pinctrl: Remove redundant error messages on IRQ request failure
Date: Fri, 17 Jul 2026 18:58:42 +0800
Message-Id: <20260717105847.131359-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::20) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUZPR06MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a03316f-b1d8-4a3b-d2b1-08dee3f26a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|52116014|376014|1800799024|921020|6133799003|38350700014|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	5Hf9o795wOqxW4BlmjjfD2V09+R7FarKBbQ2DTyS5joWUQQS3EYNx92M/xteFmair8eYEAlPzMjiYbG98QsxIUtb8+TMo6blL2ENrY2/EYBTDa2U24ZzBuQZ0uKQ9w+IPQz0irpBrc3ssKhDOpXww3E+vYMIl4je8cqUI31eRYLtvysP9rXrl4wFcRniZzQq49nRb9S1uK6309Nw20wwa6qg72MFXr3RaIEtp+SX5iRQripQb95cMgeLROBRyJExdHqnAIh9p6MCPThG6kvn+iTaNeyH/fsDhlxkY+RmKkBaefKuInu0PYgWuwCri3XKkW8D0TPOZr6p7jVYxAIlngrfcOOz3zsPT/fAFYr5mDjIA57dap+q53K+c/9qXr82iJm3Dtow/ASWlLymWwGpXyk5SlRM9ZjJzf8iw/nn4rtmObSexv84O01evcUI0QAf9MXu4Nn5baAbEcoou8MN2HNkKcCkHYf95ZLncwNZ57eNd8cpDhrD1DvjaGGENJG2hR+46Z3uWq6Kj3QzqQH66rvkZ7eRE8nJVNL1XE4X9PD+adPsRnlt1Sapz52H1PXFiRLiuVUafNUNt124cEMDN37/BJmIt64KE39jFLckizxEZqwRYyz/rqgErKni29W8CD+hjs3x0nnN4G0iQFz2MQGFX3Pl+KRSNuk7o4LV2T505x0Usf821GJcNwtUTpF0M6b6UXcB57WaTDNiYHW4zDGR4IVXHY4fTg1/hefZJfy5xqBvNglYpmjWOIja7G3G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(52116014)(376014)(1800799024)(921020)(6133799003)(38350700014)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p677aleDLAYnP6UAb0EiJCO0ETQZgWh4KCYPMHLTpSIrsl0ERFDw0vmXu41Q?=
 =?us-ascii?Q?M4zntryDOREtdPlW/iuhWs9nzoBrd9KakpMIMZH2pDQDhdQhPeh3CqqNTNqQ?=
 =?us-ascii?Q?0+BUnMVS5P+a9uNvLdvFS2D7LcA8C0JV/lQKkCIkRfu/kmsaYj4SeI+AIHc5?=
 =?us-ascii?Q?Lb2JpMRc8t/ACMKc0RoXCH4aSpWDEZuxIdhVQ4+e841gbLNVvawtmI0AOcb0?=
 =?us-ascii?Q?V7xMPiwq7OPjpmpPKzxmqqR2nN2xfKZgi7vVLPVS1NpuFJhsU12evlPL617C?=
 =?us-ascii?Q?Sv8KU5OG0/hWsUEeISTVFBvhq5WM2/PPtbNWgxgxlP1isXfXnFw4Gx1MFRxB?=
 =?us-ascii?Q?YB9qtPpTPT0u8YPaUewuei/qmb7k7g4uL5DA1M5QXvregAjQHQgMjtexfhwr?=
 =?us-ascii?Q?n0MBebrgJ1gfiEwJ9YTC12085Teq2WNP4ehbZ5Ez+ViIWdpW3PwnD6Ck2Yqk?=
 =?us-ascii?Q?j8PGyxCQzAtJ9t45e9AmDmk0xpiA0U0Cyo3U0+4Z04Ns+MGFTGfJfFIrJAin?=
 =?us-ascii?Q?Ah6vjW0v8zB1YRl0eXYPBa5vTu3O3SisnhSjvN1SGNtWqesuThoBtmWio2tB?=
 =?us-ascii?Q?/n841nXsrxdqec3Up/9Z/BSMv2TzLiTqza6PY0XZB7SxtayHttDpDvOOpzln?=
 =?us-ascii?Q?GlvmqjbsNRfaWI5EWzME4Eh/U4FFlBroTl0/lJqwulnmHzt7rpJ5tuEgXoYa?=
 =?us-ascii?Q?6eYLwJTPOpgesDkzS3XAVxVZa4WTvLXab8IDU3eG7cR3jRGLjMab+khPR/K/?=
 =?us-ascii?Q?tTo5MaYSNDtPrh5I99iH7CLh7Ss3pR4l25RI/asf22gUZjN89nlSRgMEik5B?=
 =?us-ascii?Q?USC9e4mLbBKKPnTCj6b7wjBKB279muaWD7ovWt92VGz80knPkR4GojD2b6LT?=
 =?us-ascii?Q?2hMlPoRuj8LqMoTKfMbhFAOOK0afAFiVZ4if3bpcvX6N/nIBkBiAPNORXPeD?=
 =?us-ascii?Q?yeSotHfa/nhr2KqEX9GzXKLrP3XtSsVGpG6zdjmWZQd/BNo4sGrP4mdnK6vs?=
 =?us-ascii?Q?JW57XU/0r/Nlxkqqwhym+qQYzsVQJRgjJXscneoVBIHfvkWIQysGqQNATCso?=
 =?us-ascii?Q?oWlZSvZt8o0TebmQR4C8eze6TefSW+RE48u68vOnCsNExftJDWHjDdYVRgkb?=
 =?us-ascii?Q?aAoPZg+5gU4AjtszUNqqMbxwQXVRbdksNTcqiszlPXuw0C3QCYGDIGWuszJ/?=
 =?us-ascii?Q?/HNYS2idTuTjYiG/shZYR+VKV44OSSsIwrYYjP7NYQtxaN/oQp8MXqpufiVO?=
 =?us-ascii?Q?bApwMNJAnHgn8VKovGggkbVPWbdaHedcvRE3Jr6guQnXhVPYszom4qOLyL87?=
 =?us-ascii?Q?IZCGSAHtHdJPLUj88y0oScs+AE1vcLD4UaExh+olgW6N5CC4jm7ZPQjkc/QW?=
 =?us-ascii?Q?0bqmS6K69ky7ZweRY+7BpDiZ94Q72NGzGarp0Cpda7ByN/hyv6wW5Z0Jut+j?=
 =?us-ascii?Q?WJeN/D48+JylHOdAy6cRKRE0OiI5Cshvd3c1gnxjWkbnmhXO75V6hYT5hsIp?=
 =?us-ascii?Q?LIR/1Xh3mv61PIZAwV33HbwAndc/o3thGoLOCYtdqDlTVcFqysATaLCQi5or?=
 =?us-ascii?Q?K9j6LiWyz25QtmjZmIW9VBn5N4vlARSbmfLzt9Jc+wWpgKC807PkjVrOJ9uC?=
 =?us-ascii?Q?kh9JWavcsCxRmJ3PC1vnTQy4iekqg6AaJfywmtS1CZ+kYqsbS+vbk3nS9ZMQ?=
 =?us-ascii?Q?VcKWXU+63tPUlZnlUq7XgIiLatFgOvm4z17CPNEhLD4w94ODR+oiYAzW93YL?=
 =?us-ascii?Q?CpTe9UV0Sg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a03316f-b1d8-4a3b-d2b1-08dee3f26a02
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:59:03.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7iv1nj9iAcDC6FEkpyYef9juHbAj57mhcFEdaN9HTF4VurULMXfmaksv7YBA845UmuqSmiBDyZEdAMTvWGaCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8313

devm_request_threaded_irq() and devm_request_any_context_irq()
automatically log detailed error messages on failure via
the devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in pinctrl drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (4):
  pinctrl: airoha: Remove redundant dev_err()
  pinctrl: bcm: Remove redundant dev_err()
  pinctrl: intel: Remove redundant dev_err_probe()
  pinctrl: Remove redundant dev_err()/dev_err_probe()

 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 +---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c  | 5 +----
 drivers/pinctrl/intel/pinctrl-intel.c   | 2 +-
 drivers/pinctrl/pinctrl-aw9523.c        | 2 +-
 drivers/pinctrl/pinctrl-mcp23s08.c      | 5 +----
 drivers/pinctrl/pinctrl-stmfx.c         | 4 +---
 6 files changed, 6 insertions(+), 16 deletions(-)

-- 
2.34.1

