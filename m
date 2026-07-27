Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023130.outbound.protection.outlook.com [52.101.83.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFB3E0750;
	Mon, 27 Jul 2026 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138201; cv=fail; b=hF3z6j6HdLTIUsOrNHszZsAQOpNIz7YBAZJeyH+kuwkpqXGmuqNxTuNN4IMAlZt7VxCO1knV2kDvZMkTMkOu8rRb7VZPEvg8Vp/KsdlfHMBSVGjwQtscsJiTld7h2oM0RlXZ8diR5ZHDyJuiFLI040hgoW1QQJ/P1v7jpJiN8SM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138201; c=relaxed/simple;
	bh=ni2dyvyJsV8fuznVFN+2CbMT/6OCVVcgi+IuAnlIY+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c6BBFW4qEW3eu3RCOf+EPjDknZxrz8KKApRlD8eYihqjAc63XLzpR901VZuf23FCqvy0folf8is5J6Ju2yZwZLXv9TJ0E78Gc1/Q+wpnOozJcnFjOqdvRZoKeej+NpxrK9zz4gJV8gnoJOjAr6BsggAayxzHFwz1yZRnMvDpTDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=b5Ip28Ot; arc=fail smtp.client-ip=52.101.83.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="b5Ip28Ot"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syYpngsZP7yMEwK0ivF4zS9G9e+RTkd5bEjQ/B6tsqS4wEDW30jRxPBGCSwltsZkpBjKmCx5q5CWlB2xJWhq7kabB6b501a7e5vnuZTMUS07cOqnNxNCJY15RF/vZ4NyHckczfp+Xdmndzo4yxUMcBAVizsE7bQIt5PHqU4TTccHTOqDYqlNXFzM95SxLH8Ab80TGurwlfv7eJdOcQgeyr8+6lMrywexI+zM5iRa1Vwc1RNN1a7VYCiOyJOORBNJ1I4pRdDNITUuOfhPO/CF1K9ai6EzY/Gg0WhSFvFSSgqssxekAtzRN+T0nyimJ4iqBcaDRfUuPuJDIsr2P1OEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xoCJ5h7mnZgWzrRrKnoV0ZU9kQBJVXNv4V2QixM4gU=;
 b=ZlUziryDF/5UxeGjRr4jM25YewimLvBNlaKX3m3ecJUzky9qadcZ5zUwgM6j2uElqkjYfQvk1KcFvH4TmXhRlYTD8lsSqTlknVn5Th4sGU8h8JevLh8ChZSck3/V93pCXTxI5WL2z5LcTkxUXLdXBkMMk0a25GcUesIhivEvPOc4fno+s1a+g2/d0s4ikemqP5MQpq1kRw1Oxeu9Zn6K6FAmLMfEY9y0O7gp5Vq3fW/NRW5NvA+1MEN6JUn5nM5NPPf6gNKLRAbaq4q6uLYMxr+lfUOjcqAoo8w62SeJB9B+FJ9QTOi8n1i3AoFCxd+v6Ekt5bFOSSg7N2nzFGhtJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xoCJ5h7mnZgWzrRrKnoV0ZU9kQBJVXNv4V2QixM4gU=;
 b=b5Ip28OtTCjpdfXRJ0fpZBNDiXpZWtxn1TGmIXtVh2m5y6MkEIFJL3tV2f8XQD5mlznrnRRGEtTEl4oljlroGlQHxnfb0S/crL5fQ4FriLpTU7U6NF9hJMjpT5PTIoKRg9KTk+JhN2Lig3XF2JoeJKc+sFlc3iyeQosw4oxAL+N8aenk8NOszHhczfpz5yz2/80PHp1NRCfNq+lp070cxz4k8beVFcZyVTNY3vY7CF1CiinNOPENZu24CG7MiebEmJr8iLjf8l98WFw1bPidUGD9HHCzy8PBb5SXW/6Qwt8bUtaEWY4UZfjAACOmXtLaM107hhjQbkyFUxr3ov0oxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:15 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v7 16/34] pinctrl: airoha: add missed IRQ resource helpers
Date: Mon, 27 Jul 2026 10:42:16 +0300
Message-ID: <20260727074234.3761170-17-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: a04e65df-5d08-4d55-5064-08deebb2b7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|3023799007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	veyd8pts0MVyitfQTq+7pPqVo+s9V7XQtUgqAI7j4ckArqRPIpQ74SkVZBaq+6A6LQJlwtWAx0PZ6VXsSk26Dxf/VB65lgowBJiE0Wfw4KBMBd37sfK//1NonmYi1nXA4UjYMgECQbQul4wn8xYAbLIWPsutW9Ivr1SXkm8Qh0r3P/I4lWVTNLDy1zU0gQTE9TJ/1X5nkWLsnAgsPQ6zDOgINLe2lvUNTK8pkdiH21PlJsijBMYACreIgoie/BgaijotO2UqtrPsGGD+Dj+nBWRLq/G+zwCIZih2s+fUaJuTeongNrDAD+w1/PcC1DR5H6Q/1QyBlyrwXKfIIpEJo4KMWK2v/Yl9rIoMkn/8auy1N+ZrahTRut+hyjC/tTBy2VbQDoabXtKaUWXGv14yCFRF5r3aTixvvkTnZGlotOG3FkOLsHoHvQsrjFcyWni1ZqEOAhCq7bAg5/FcgUvoWw6pI1Z5/A0sXO5oSvHz50HSiESKBIHMTi/I5D9DR83S4PIfB0ys2puHIsOgvZOeRxziOAuBNM2i3y4MRQNxi5LAqZCa/3g/JjmxrzeoYjmbaFsigxPaR+fqdg2Zhe15ytkWgK9pfMeHNPjr5wloktqwMgpcnvqIkKZCTQ5nKrQy+6I+8nPNw3KOM3CdvvDpNEU8Ul6xTw+xCQqiWnTyHXLo8eLmrNr08+u8/dpei7VGUAnyzpF/5TMd3x3hjX/MXfrQ1SJqPZ/haI4I0siYFZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(3023799007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?blJuusVY94yLUyGMRzkiEzH1HycHco6IWxMBHmsHSxdSvBpyqkuj8amM18VL?=
 =?us-ascii?Q?mGnH2yn8DG2tI8dGqMBRIH3DMWbdckELzJ+1pCMQgo8lDJJqCp2AmY3qOdyV?=
 =?us-ascii?Q?Q7GxKa8EE7dKEI1HY82PZ+4cNI92Sb2s+4eHVrE7hitvGELTDVeGQs+QxQqz?=
 =?us-ascii?Q?30YgO89z/0lVaWau7c78/Ocl+CoI4cp/jXI9osHn5mb92JZjxDYB4pEjw06p?=
 =?us-ascii?Q?cfLg+5pklRPO1kC8ONXJd5r9Uyil8ZPo1FRUR7cCw/yQxXtc9QG4VxQZb6oz?=
 =?us-ascii?Q?9gSkHIDFV0Ysg6iz5yjnCXuyZl+3MrCCxngkihc0jLKJ1a7DkdWoAEqEu7GP?=
 =?us-ascii?Q?OK3wAr4N6d+MqB2W6CMZMbijUSTkVPhNnBxMxeD7fxw6by06SDRWJlEzIbSp?=
 =?us-ascii?Q?pgy11asvHT+9uQJxEscwHKQlRqMSLRT1OZY56OMIKET+O6HiRcCnG6BhFDx+?=
 =?us-ascii?Q?gzSUk4TaugMzHPRKh7k5h+j4K3/wOVwK8qz5SSVet6tulVwZr8WVK9BFbMqq?=
 =?us-ascii?Q?uG/0DkdZzQE0I1tfMDf3WsKWgpR4IGepdPTvxV90zvZIgcSKg1P6GBocSgFN?=
 =?us-ascii?Q?Ov011nv2d/pfAbDFHZgpcrtH4PebeMCWFEMhUef3kZ51Ypm+nS7cI9QXuTPi?=
 =?us-ascii?Q?Rs2mpj57BMyA8+84u4PpTjx2ogM9VoEDNRDG0LC8pww9GZEFWmdqorMB3UKJ?=
 =?us-ascii?Q?6SALxedEdHRJOBaYMYC+QLDYFYs1ixBfzw0FlkGH89wW/pQoXZ8N94Gb5PuF?=
 =?us-ascii?Q?H2llwBwZwjBrp7jsQQoN9W7QZXnf709DRwmCCFqNNIFBVw+z5fCtfj7+eYIS?=
 =?us-ascii?Q?6/403G2HVqpWBXhTgZb43nk4y9ZDkAglOW81g9tlya1K7t6DlQI2iPA/JnU9?=
 =?us-ascii?Q?irQ3wTNfpfpI4kDqNFNOHGnQZLTWVcys5esrK3efcGwAGpf5x3Qr/YqpfdXM?=
 =?us-ascii?Q?DD7FtmDALQv7Hzt5aF2Shtgjl+0ltJExwMDpH0dMe8fuGXjzhAo/BSBw4aLA?=
 =?us-ascii?Q?Dlmz6nSvOg7504u0daBfxroLf77IQlZTTeY/b0ocIFhNitlhCUCveUMxoj00?=
 =?us-ascii?Q?XoOKsy++ScNYzz9j0sEGIBWcp6R17s2q1BYUXh5vn/u11GGp5Yy7dXxc+qOV?=
 =?us-ascii?Q?Iq9Ox1sUNgGJzR0jMol318pB1EdxKOshB94OYydgMxZWz520kbCHixiGi+fY?=
 =?us-ascii?Q?zK8Y7XCdr0hpdQNB4QHbpEqZjYdbpLKmzs87k4tkGMYf3cxeDxeB63LleR5y?=
 =?us-ascii?Q?Wx21HmAWLGgaeQRQqOUVhMBnARiMI02n6u1FJBgIgAVh62QAOACETLwJMKCu?=
 =?us-ascii?Q?+vLLkZA4o0JgMsSXCIqXJGVJ9prZ/qkshLAtIZDFA4rk4wKSlUimqBILwlsJ?=
 =?us-ascii?Q?Vs6odqvi+Lum1+Pcrtn4xb0jF0Ddpt3xAYMULlTcz92vhjzGWHcxXHUDxejk?=
 =?us-ascii?Q?xGrsmwNfYFVH6xDfXi3RTcg77AfARlvWsZ0RjVzBGpiCAWHC+CwXDd05AgPu?=
 =?us-ascii?Q?bLZtNLLR6cb5XnUovQ1TdeGuViez1cp3Snod+luNpBOwN8LbmSzl324Ligzc?=
 =?us-ascii?Q?CczVt0qYp518ATX88+zFVQL3EWP/tIEVu7B62N53EZjNM26/QEUoEPK/1Kvx?=
 =?us-ascii?Q?NHtPWr1Li5vpFE3kc6FX97gd0F3X7fQYOkvHGI5iMREV6NB9/tAhOO+NIp5s?=
 =?us-ascii?Q?jlLMtCJ/jQY8bSrlqnP4Jv4wE98B+ktUCvbGe7NOpZQMnYN6enMYY1zR4AWb?=
 =?us-ascii?Q?5S50mjcFj+UgzBwXo8Rskg5XQbR90hE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a04e65df-5d08-4d55-5064-08deebb2b7ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:15.5798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSCEalKRn8JUqK7eTBprO+b9xQ/cgSGiylZwerna33VI+dvDWiulwVr3SjsEIvz1AleMZnJIkdxqG14zmWPovy1uh6MUYeqWTGMFBkj7DaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index f85941ccea560..d218a1f01648b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2676,6 +2676,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.irq_mask_ack = airoha_irq_mask,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
-- 
2.53.0

