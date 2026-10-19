Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2D04E0B91;
	Mon, 19 Oct 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407926; cv=fail; b=pjJ87NYYaI94IIPwOFOKvygIE3/sNVw/39WttbzlpdASbiopmibAm1oPUdIEF+yabqTLHzLTmYUoHnVT9kEfZMXOHLk4CgUF4EUlVMmpqB/veJcpph/SGGJmvAwVdF+SLvrrAZcDRAsmXsvhF4SFgjA+S56kJnDnLIMLYJmeuQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407926; c=relaxed/simple;
	bh=KRH4gpvtSXVL4iehrMUptomkej5pU/M8HAQYeNQmNy8=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=ibr9fMfYt2b5YYttZqZSXu1UvwSjye53CgGdVZdHtW9RTYMao58yN1I3cbbV6daXyYJiL6dxjY/4c3EQBjZAf8mkrTOmoiUpU8XMo/kY5QvaQG+CVpC6Z5A9RmTOBs/uNZXTkkFAuP9FBtH1Anj5M272rcIs8xFJlcsXFNbenw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OI0AsEKn; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OI0AsEKn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYevn8QKG1LMqa/v+A45qWjvGIykSLvlD7d8pZcza1PUopqytoEYq//HI/elEDA59QgAdqvBmOW11mKKxDaPkh+stUdigwIFHhPNniQZxOapuKGqihSYqLGlSAjnJIbYg1F5n09ZyINlWsyjgdUfOYgXzM1uhCC1VsJvuJCtsmKEbPjITay9+yvFOQfNmffopbyJwB597D1C8lkQnReG7CzzPFVcSW7uybZ/OXXNE9IlJakhhhuKPou9LvVDcydyKcGmpMPYXWbVkzJCq8tXnEmQFf6L4+0LyP4ntBs21hHKJqn5Uo7IofdRVMD34JaGFAVq3wS/7eCSFJ37qWmBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSf73H82ilo4wZZ49JO6MMNm7tt9Ru3rczyzmw4e0VM=;
 b=lz4Wn6RHsOn5LStlkbvI3F9+7AihW75vBW51uEsi8ysY1Hr8TYHcdnYuApcvOfdlBfV1wrw6yRMlOpE0gS3KHHfPWljl4YKYbnmENbJtaewL66Kdlwlq7mmPSrlwY81iWx10DskWd5R+9HsVm0UNN4Irqug2DshPv+c8a185S8nBVD9amLoH8aWpGiLq+WzMYjHj/pQedmV/YdFFM+aOciuiZdn9Qqz043pD0knutix4J8YuoMFpMgPVeGtFUHkX3rZdZ2xHA9Ueeg2rd49KtRGwOY8mo9TD2z0VrK0v9RfpiImvCgEhBBee0LjUM4yuEybnmxUGwufx1X3mgk1otQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSf73H82ilo4wZZ49JO6MMNm7tt9Ru3rczyzmw4e0VM=;
 b=OI0AsEKnuqxrmb2/stuQN9UIveR7WT6ododdOqhgehKdc7NxTJORr+quxPCpAsm23bF5zsmKimn17uGgWl0ngQjeNQkTMHxMV/oR/35ZAtoh1Y/AAXYYc7L/0fob7VfIu7RA1xftDUN6JQMFajkAP3F5tonpIrxK7g3EnWZReAnAhyXg2o5N1nFG5xNemv3RP4OC44rM75sKcqMJCM3WAuOCCc3gI/o0L3qsbHxBgtpR48mcHSQk81dH6K3CtNgOccj8Cc19qJ/DtB/qrpl0vHg8S54rQdiB0lC2QrhR+yxpKBckE2bKnfS6ACg3X408mQAqP2IIuqrGtQcTnoo7xg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:05:22 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 11:05:21 +0000
From: joy.zou@oss.nxp.com
Date: Mon, 19 Oct 2026 19:09:35 +0800
Subject: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC
 data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIAG761WoC/yXMSw6CMBAA0KuQWTsJrZ9Sr2Jc0DLVMbaSGSQkh
 Ltbdfk2bwUlYVI4NysIzaz8KhVm10C89+VGyEM12NaeTGs8hgNyXvzeYZIho8bMOHKJkzzRhUi
 2S50/Jgd1GIUSL7/9cv1b3+FBcfqWsG0fb23N0X8AAAA=
X-Change-ID: 20261019-b4-imx937-frdm-scmi-pinctrl-7bce28f895f7
To: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>, Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 09085242-ab1f-4c74-03bf-08df2dd0dda2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|6133799003|18002099003|10067099003|3023799007|921020|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Efm23D5jAZpljo2Bi2/GtTwExSQUdOfADx4jluxeWvWWbNf1Wlvu1s5fRf6EM+lzvkZtGOrf/jHFyv66LE9qgq0iyAuY5VgdSL8HxU/ARpHTuMJPA8nyUw9JaXpWdOAofPAML0VYz8Nte1zDQkSc2WIhso8H3uYxTaEguSRMK9ZI/GG3ukAn2+URgqGYyo7X5YU1OYRyjmQ+hY5bONoQxgxlrXW8IQs/CJgW1n1f9EMJGrhJjDmzasAG7ezA+lRB5rSyqUFB9QqhM618oLVEfdoFo8qTXMa0DDJymbdDN9bp2LGb4zNQynHv0/e1FfT0PvJM68t/0pWsB2NdDivasTz+iD+8HPAysfwkJyD4UYm7Kpr3ZtK1PVT1Gq+5WMTjxlo5DmCupH+KbOGnB0hqP4iqzPXJczA39+ealqPBP79mheLopx2lOdOfYn+3lKK4a79dUeKfPp5gPB/xRyEAePve+exnzPLeQtGD3VkZqjwteql20P2GItV6dIPCzODBoDFoOzte/TDp8tgrA7yUZk7338X518oZu1WVK49F/j6E+c5enCcLMgczVzwrNVTELTC/3TwVe1B5AFhME9QBexM7A1+CsfOxpF2i9sB42KWceSeVS+cXMBC6orCfoJjav9txo6TTrNkTz4VhHg3YSJBoT3nNI1sfMTtk3A0LTSzV5+OiYOP76vvC/tE42LQeZeSmYO/w3BS8SrL3OjgNAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(3023799007)(921020)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm8yazM5NW9uczFLbFF2Z0F6MXdqekYwUDZkOGRTQ0lhZ20zYnVoSWp6S2pT?=
 =?utf-8?B?MHZLWVBkaSsvOUFERHZDV2x6ZHp1KzVVbEkzbC9aTkw5eEFLampwWTFPWEo2?=
 =?utf-8?B?S0FaVU1HZ2oxeFpYY2RzcXM5Qm0zVEFIWFd4V09nNG9sck9vbEdCeHlxSlEw?=
 =?utf-8?B?b0EyZG9sMS90dGR1d0oxem1TTWVVSTRmNURNYnNIbXBRREZFNWpEYm53Z2RP?=
 =?utf-8?B?OXc5Zk9ZMVJzR0c4cU5zcEszSFdPZFprcWh5ZkRENGg4YXM5TU1PbGRtSFZK?=
 =?utf-8?B?eW5CbjdFdVZ3Q1ZOY2lvd0crSGk4d25SU29rNzE0Z0tJSWd4WE5Sc2VFTVAz?=
 =?utf-8?B?SzhzOFJEZ1J5WDRSSXcrUi9HemxuUEVtUXFrMlVldWFXL0hmNFBVWGlWOGs4?=
 =?utf-8?B?VHpQeGpsbGlXWGhUTndqQlpJdmYrNmpJTmFUU0tseGJicjFTeDdkaEsxaXFn?=
 =?utf-8?B?WTJ3MzlBOUJvMlk4M0FnUkVUTE9BTkVaUW1pVlE2OS9sV0hRVEJramoxVHIv?=
 =?utf-8?B?TUx6UXVnWGJuS3RPTnpKYWx1SFZ4SGg3emhodTR1blZMOVJwMFkrOExSTXVh?=
 =?utf-8?B?TVNqdE1yTi9GbzJGdFB1WUQySVZtUk5nT2lRZEpDS05vVi80MUFFWU54b0RJ?=
 =?utf-8?B?VG5kSngwdXhGYnlpbTJtaDFuL3MxbWtRRmRDT0JCNDAydXhXZTEvQ1E5dE8w?=
 =?utf-8?B?bjNmV3RwY2Y0R2x6MURHakJ4VFF4RjhlRjFXZC9uRmpOMVVTeC9XTy9BaUNl?=
 =?utf-8?B?U3NLRmMxbTQvaEMzYjl4RFdCWGdBSGtLRnl6UU4vSDlaSExmZmhjV0tKbjkz?=
 =?utf-8?B?d0g3YkRiZ0o2OW1RQWVmY1htUE9iREFWb3FmNGtXR2x0WDZWUDBXakJhRm9v?=
 =?utf-8?B?T1ZoT0ZUaE9YY014ZUtkQkFiS245cEJSNy92T3lqT0RNVGUyTjFxNTV0b3pE?=
 =?utf-8?B?T0RwWTJzbXdYcndOSUJpeDZuaU5vV3JYekRHd1JBVi9FdEY2T1lZRTlCLzdl?=
 =?utf-8?B?L1VWSng4anBRbFE5Ykd3dGdCZ3pybnpPNWdZdExaTGtYSWNzT0FlZEVMSnlI?=
 =?utf-8?B?aVY4cHJIRFdXOU5wVHNvVGtXaTEyb2pHSDU3Y0RlUXdINjRHR00vWEZDUUkw?=
 =?utf-8?B?My9RdHBOMW4zYlYrU1kweGRhbHpuR3orWlVVVjlPb0p5Vko3UVl5aGx4VFR6?=
 =?utf-8?B?M3QwdWdWa1d1UUJvL3JQV01pbTk4UEtDbDlQV3JnVUxrRGxPM1h4TWs2bXBW?=
 =?utf-8?B?NnV4RE5RcFBFa0hSU1lZNXhuMmR2QjlBcnBCWnhiN0Q5d24xWDhySGRVbHkz?=
 =?utf-8?B?c1dXQkR5NlpnWVlpalRQRDRJdVoxNzRRaTR6cUdFTzZKckxFejliWTZhKzJG?=
 =?utf-8?B?bkJSM0hBWUlFd2RmN1l2L2kwcFY0S3pqQ1JDbUlDQmVmNDV3TG5lcUwrWktv?=
 =?utf-8?B?L1EwWFJaK2JUbS84OUE0U0d1T1JMeUJIVkhSbzBWTkdWWmtha3hVeVBmeThB?=
 =?utf-8?B?cEpWditZNHRsVFhWV3E5UVVzMk5MSUpnenEvbXRvYUQ4elJZeGZnUjNMbUUv?=
 =?utf-8?B?VFYza2tiMTNUNWdVcW1JVFU2bkZmdFE2WkZoU3h6S0FtZHBRNzRZQ1dad2dj?=
 =?utf-8?B?bVpkUFNqNlV0enZaS1V0aFlLbnBvL0xMMkNVOW10enZwbVdDTEZRdmZHZjBT?=
 =?utf-8?B?VllUWWV0eFg1eGtJcnE1aTkxeDMzU0l4clFwV1VyWVNyQkJxSEM1NXY5elZ2?=
 =?utf-8?B?cllWNStGRFFCUFl0b3RaeXlBQVNhcDUrMlYxMlNDME9LNS93MXpqQkdxZEM2?=
 =?utf-8?B?V1FnNVNHeUdNcWxnd2tneW9kMWZPOHNHRjR3ZVhwd0h2bkVpY0taak5uL2wv?=
 =?utf-8?B?QWd4c2RhaGMrOFdXdlNpdDVqbTI2RmNrY1c2RlN6eUh6MXg0d1N0eXp1cjZZ?=
 =?utf-8?B?cUd2cUl1QU5LVUo1a3NYTEU1Q1oxaHg4MEZoRXFsdVVEUGM2V3hQTVdNWmhD?=
 =?utf-8?B?bFljWkMyQmJMalRIeUNSMEx6SmdoODlCTE83NlRQeVl6S0YxWncwZ3p2aHlk?=
 =?utf-8?B?S096b2hlUldlbkhaUC9SUE5vSjlSeFVTbDVFSE1RYmVBYjViUUxjVTNaQ2hy?=
 =?utf-8?B?bkJZWTJrTHJweGV6MmJ2cmxTakJ5WFVXU1c1TTFFbG9BS1ZGQmlNSWw4T05X?=
 =?utf-8?B?aXZxK2ZzeExQekFndEM1Z2EzbDIyWUgxZ3lJZ3RuZkxRRzdsZkdVZDNadmd5?=
 =?utf-8?B?eWVoRzV5UTlmU3kxZGtLc2JmT0k0SFBtMTErTldNTWg5dG9TRlRaSDRaVCtx?=
 =?utf-8?B?b2QzZVd0UFAwcThuUmZsOEN6c0k3RFFYbW04c1p5SjBkbk9RNEpaNEhiQjQx?=
 =?utf-8?Q?6fUe77vcaHZKMVhtAKl3qT5A15/RxEnw/+MFd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09085242-ab1f-4c74-03bf-08df2dd0dda2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:05:21.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Xwhox65jcXIdifeZrP8ZBWfWpNlzjKtoIgcSI6I49ZHxEp4U8vbsOeX6rB4f3LCb+RXcQ84NONsBFBXh5TCx50EAHv1n269gVehWI2JZZ9ULgfStIx79APk8GICklQq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

From: Peng Fan <peng.fan@nxp.com>

Replace the hardcoded of_machine_is_compatible() if-else chain and the
static string allowlist with a proper of_device_id match table carrying
per-SoC data via the .data field.

This eliminates the static local variable anti-pattern for daisy_off
(lazy-initialized, shared across instances) and adopts the idiomatic
kernel of_machine_get_match_data() APIs.

A new pinctrl_scmi_imx_data struct captures the daisy register offset
for future extensibility when new SoCs may not use register-offset based
daisy configuration.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Replace the hardcoded of_machine_is_compatible() if-else chain and the
static string allowlist with an of_device_id match table that carries the
per-SoC daisy register offset in its .data field.

This drops the lazily-initialized "static uint32_t daisy_off" local and
lets probe do the compatible match and per-SoC data lookup in one step
via of_machine_get_match_data().

No functional change intended.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 55 +++++++++++++++++-----------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index b259a526ccc1..c287c3ef73a1 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -28,12 +28,17 @@
 
 #define DRV_NAME "scmi-pinctrl-imx"
 
+struct pinctrl_scmi_imx_data {
+	uint32_t daisy_off;
+};
+
 struct scmi_pinctrl_imx {
 	struct device *dev;
 	struct scmi_protocol_handle *ph;
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pctl_desc;
 	const struct scmi_pinctrl_proto_ops *ops;
+	const struct pinctrl_scmi_imx_data *data;
 };
 
 /* SCMI pin control types, aligned with SCMI firmware */
@@ -59,6 +64,7 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 					   struct pinctrl_map **map,
 					   unsigned int *num_maps)
 {
+	struct scmi_pinctrl_imx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	struct pinctrl_map *new_map;
 	const __be32 *list;
 	unsigned long *configs = NULL;
@@ -67,21 +73,15 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	int mux_reg, conf_reg, input_reg, mux_val, conf_val, input_val;
 	int i, j;
 	uint32_t ncfg;
-	static uint32_t daisy_off;
-
-	if (!daisy_off) {
-		if (of_machine_is_compatible("fsl,imx95")) {
-			daisy_off = IMX95_DAISY_OFF;
-		} else if (of_machine_is_compatible("fsl,imx94")) {
-			daisy_off = IMX94_DAISY_OFF;
-		} else if (of_machine_is_compatible("fsl,imx952")) {
-			daisy_off = IMX952_DAISY_OFF;
-		} else {
-			dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
-			return -EINVAL;
-		}
+	uint32_t daisy_off;
+
+	if (!pmx->data) {
+		dev_err(pctldev->dev, "platform does not support scmi pinctrl\n");
+		return -EINVAL;
 	}
 
+	daisy_off = pmx->data->daisy_off;
+
 	list = of_get_property(np, "fsl,pins", &size);
 	if (!list) {
 		dev_err(pctldev->dev, "no fsl,pins property in node %pOF\n", np);
@@ -299,11 +299,23 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *des
 	return 0;
 }
 
-static const char * const scmi_pinctrl_imx_allowlist[] = {
-	"fsl,imx94",
-	"fsl,imx95",
-	"fsl,imx952",
-	NULL
+static const struct pinctrl_scmi_imx_data imx94_pin_data = {
+	.daisy_off = IMX94_DAISY_OFF,
+};
+
+static const struct pinctrl_scmi_imx_data imx95_pin_data = {
+	.daisy_off = IMX95_DAISY_OFF,
+};
+
+static const struct pinctrl_scmi_imx_data imx952_pin_data = {
+	.daisy_off = IMX952_DAISY_OFF,
+};
+
+static const struct of_device_id scmi_pinctrl_imx_data[] = {
+	{ .compatible = "fsl,imx94", .data = &imx94_pin_data, },
+	{ .compatible = "fsl,imx95", .data = &imx95_pin_data, },
+	{ .compatible = "fsl,imx952", .data = &imx952_pin_data, },
+	{ }
 };
 
 static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
@@ -318,9 +330,6 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 	if (!handle)
 		return -EINVAL;
 
-	if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
-		return -ENODEV;
-
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
 	if (IS_ERR(pinctrl_ops))
 		return PTR_ERR(pinctrl_ops);
@@ -329,6 +338,10 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 	if (!pmx)
 		return -ENOMEM;
 
+	pmx->data = of_machine_get_match_data(scmi_pinctrl_imx_data);
+	if (!pmx->data)
+		return -ENODEV;
+
 	pmx->ph = ph;
 	pmx->ops = pinctrl_ops;
 

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-b4-imx937-frdm-scmi-pinctrl-7bce28f895f7

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

