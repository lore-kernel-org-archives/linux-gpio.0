Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACEA2EC090;
	Wed, 16 Sep 2026 03:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527889; cv=fail; b=bScItiEBijdRRAH0Yku+Y4bMLGl9I0WzN8lVxNYoPqLxKO2Jn7yvtOJoyyMtHxHHTHxuBDcJx/7czhdFhBrew8q5Z9h2dkkq8E4u+EBJW1arIltf6k9vtksT2ozJxz7P2F+rf5ws/sj3wFlwyUrXDqVLkwJajfZSyNbpiVVYulo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527889; c=relaxed/simple;
	bh=ufMXHPkQ6TCqyAak2tAiDidq81EJrALof/j2LxVPTNU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=F8VZpTj/6K3yGdOAQ7HdUR5DgXgOMvcbEI/cq+iHJf3to0ebaD5pvWTcnXvip7oqKQm5jN+Z3Jfo37scZVSUewwC/beh7o4aGwYeoG+nhbVlOwJTZKu8G3mTNHL/Z5DCXSkp46auAAGMI1q9jysyGF5BfDBwuiP6jN4QmAIAdo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l/6BUcO/; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l/6BUcO/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyJ7VTk8bUIyPu6tqKOnM7Oy1QkCRTXs8mviEfXwKu86GzcKvJ6V2I/imQK+lZdsCbyPopVa54Zov0r8qbFqTSTx+17j9nGPqAxgODmykAy+0MkpHj8AKg9lo6vT8YMrhHTkJLSaqJWvdaNDT5uxV1f6Y2gEFrf4FnxgaCUnr1DiDz+V29/t7INTeKoiz6AjIAQBp7aukw7MBua2g0GOPC/qrJW8taHTPhDL1/jlnWOmFAkwKsOl19f7PV65E4NhEfB42bIo+M/9DpycMYlHgf362qMptGixudcXw9cDyxEMN6cMLG/EcYtqwx+H4JAmrQL3huz5S1xdU9u/EQqcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kFfVzhj25cUW2SLQUJJrQSHa00LFhbn9ep+Be3UWS0=;
 b=ttvz17eZUZ7n55KZYp/kjdWRwMfMaYDw6/adyYXB8a4968FJuDUcBGUkSQbVMjmq7XrAUYo+x6O5/n9VgDP0QbTuhdUOy5e2zJeLo/Wx4s9q/yrjHhvdZuRRJzP6DcwPOtry1kVykHM7mNOFgHTpTCRgFACbCmrM6Zw8+oE8zbXitB4SAfkl08lWEjs7tAI2x1Zk/demZ+VvBftHv0j+W5Njt9KTrpbo6A5AZfofBtqvqhLkyTsck6SWLFWfESRaQzJELDMh9E2i7aYpWUF0einWGnjqN3PDREd70w4j/kPkbgmLBDRggYv5elmGCgQ+cTv7KdkoATRqtaqJMqqdwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kFfVzhj25cUW2SLQUJJrQSHa00LFhbn9ep+Be3UWS0=;
 b=l/6BUcO/vEAKEv2Nvvi+UwRwpQKx9cnIb6tLjyfKCWOWumBDHqc58C1iJC8NTjBJTZSN9DoXMMQBCRbxzvYckKKtHU7TVtfRYAeqNJh79qlXxEUk1Dq2NMYnvtzk3RimCBKkXzinDRHHX3gs5F7jZR/56WxLeweHsFRMjmsYOx6RVgseVDOIWICxd7qLtI4GuWZJEf4fAoKO8Vjdm4nUMlhvonVH0l1MsKs7PBThKWdTSPqZgkYYBQVTqevj+Z6QDpPsP8f/VroloqWcIAovJ5j31RbrSmr7VOP2ZCgvhfZ2Vak+BwFZIqticIL2ZIq4/y/v/FxauFfs55AuhoIQ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB11937.eurprd04.prod.outlook.com
 (2603:10a6:800:307::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 03:04:42 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 03:04:42 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: linusw@kernel.org,
	Frank.Li@nxp.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: pinctrl-generic-mux: Fix provider resource leak on re-parse
Date: Wed, 16 Sep 2026 12:04:35 +0900
Message-ID: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0012.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::18) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB11937:EE_
X-MS-Office365-Filtering-Correlation-Id: a6fad772-b0f0-4a95-8fe5-08df139f40e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	wlrVmmR4hW0mnDT6jbDbv87KJ+MbhVAmZI/g/4FMgY1Lm+FMVru//SEs6E3wudJ6us7uboSlK9XlU3FWyNG/8doKx28u87PfZB3WBban7l/tuGF5pjRUkFGZvQ/1QP69Xtc17u1GG9sl4PE4McZ79fe1jrykSgzzsZ5wXWnY5nSOk314cJ2K3JiylUF32VbnI+svbf5xon+ojxPdx9RGsSZKEuZDcmvqx3hgqhN4KV7YLD5kOLRit6mS4fVkPZrhzgxgYphTYpks5NKmqiqUy1fxSdopSLgLOEWILmfbvkhBpzWU1HA0jf+sq2GgfNvqBt9SU6FcsDEbaJYdgmIUlxItNBv1uOuZdLIC1ym9X2oHHVke27MPsOKDypTBpa9puh52CmdHdzi80P+lqLBBmlrUCefT9gMA6DDIbQPjfJhSf6ttg7iHW94ONoN03uFtsM/0/Sm4IlQBDPE25QNk2Up/NKdYH3TNYRD3jL0EIPEvfKLDfGchFOVflhXI27iC3kOYzeG3azivg2Qu4zZnu9O9l52se84up9V4bV2nQBqFtlc5B8+CskMJAt6ZFZMecp99xxi3Oo6lhBdcvN7NmvqTff2jLRQG0HaiqrgSGLo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PfJH3M9S41DfuxG+3E2SiWyoz2wIZ6wPCXDaXoF1R79bjxd5dYzU4uBEyM4w?=
 =?us-ascii?Q?tGXbsM6t9Du+TwJxNF3kADtB0CzvM3akRKcw6lZySDZiq+/G7gxQtqI9FbHx?=
 =?us-ascii?Q?otQ3hHKUrlKnQHrW9x/lt6Kz6f2CEWR3YILktFzZ8TSSzIda7Gc8H7jB51hg?=
 =?us-ascii?Q?j1HWzPHdN+l9JicPFUsq8VaOrDtyWfvOJOaOuzNJcJ3f44o7uWPo5vrZ58O1?=
 =?us-ascii?Q?fCX3eLkV2tOL6UBpx1rx757vG18rhAKguuhGlqebDh2dUpzN4m5ZcKM/VV6T?=
 =?us-ascii?Q?qggzcwuqH4q3zpru5FVG6OVDX6n6yAXKVwNvs4BJqKCoOCEeFy3OrGjhLy7Q?=
 =?us-ascii?Q?6FM8EWlXQtZlcRS9Y64D6LWhLS8vhYcTbp59ZVvTfnF+ECH6tVPgc2IP4nu0?=
 =?us-ascii?Q?qPz8T1ZmFVOJP/FMVMMCT2MU4S1EAOatxEkp5oCUMy8IV/RZ69oh6X6cFXXi?=
 =?us-ascii?Q?EoFrTLaBszfkgVozPbxWBOxcMfSz1d6iTSMz4MS4Y8SOq9DgCcZBln/nxMvG?=
 =?us-ascii?Q?LhV03o/O79hKFb/v3cmqXIkbY9U8cqQ3tZA9cqodSVAixbv/55e8vVHQqu28?=
 =?us-ascii?Q?JbvGW4cA0o3y70+VDUW6Nl3Flncla5J6mrGfwoJ3gsSTg2wLNvtZXWnqbez5?=
 =?us-ascii?Q?EgzuweiUtQGCJXYpYy03OGiBnqT9f11TvEtbZMSac9d084C08Z2dt2SKB0iP?=
 =?us-ascii?Q?dd95rjXJ5MSdM2f5+YLGTehEAS5HxCBTEaqIVjFYLI7KBS+JeagkesMg7E9H?=
 =?us-ascii?Q?bgeJlcO3TI0TBlrMHeRdrnoukXGfsPyP4C2XuLVl0x6dSsO5rdrTgnpPPXtM?=
 =?us-ascii?Q?S7k68KkAivFsBKb3ZOLaA04lKGtQeMQyNsqQX7wlm2UO43cGU6vWxCOQ0LID?=
 =?us-ascii?Q?ZwGTpwpsF59xjuyyXY5JXUrLXlfGv7N69Q0M3TMtbpUMqW/Lgog52y0oVrf2?=
 =?us-ascii?Q?6GouXeeu84lCez2Lxn3DK6XGg+WG6Tekssud/2BETuX/YqQxffQmOQGldw5C?=
 =?us-ascii?Q?8RWzfJxMo7/RjbL/TW12XyGNQ7iXyK6WrHMYbzIRp6m/4K3ae7CnU3eqdyEO?=
 =?us-ascii?Q?ZtQg6eGdxyr8BlOCTad2uXAPyE7pmTyQDzqkF3ZXSaCjZNLC0s/dQzM6YmOp?=
 =?us-ascii?Q?EQKTn+F3qLdfC7m6jrdsz8mm8caxhe8HIg2DOaq+3/re/GgXt13QZ7kAsUjs?=
 =?us-ascii?Q?IRfdeCl6yNIbO4bFxC7X6plDHFUqA6PdL7tMvSWnuNFrap+9FubjhvzqYNLe?=
 =?us-ascii?Q?zrkS2slzdrH9OoIQJHHz1vgwyazifoG3hvJVlVPVV1w29qL1gkfXR37wRh/a?=
 =?us-ascii?Q?tC49B4fTGdLo2UbsBh0jWGCq08iEOcnGce4g+jFlXx5Q5iXxIG0JFuB5Zlig?=
 =?us-ascii?Q?4nR1BoScrdN3jJLRSzpc3ktuNvQ+CUlzcVg/MB3jnP9OVFb00jcXt1pEoSq/?=
 =?us-ascii?Q?QS7APg+aCagGTvlOZE6l9rva5feQGjztE5AfpyCv37IAqKoCTftp9O/AI/qW?=
 =?us-ascii?Q?q3WTu6ky/ZEx+6oA3EMz1NDZniSht5j35rTinOEixylnSkGpNr+40rAnew8i?=
 =?us-ascii?Q?0fAhxKB9qQCpFq6Upuo12lB5ndIVrLu+wGzcE99/pXKgv5uIhLRcY2PGBVUV?=
 =?us-ascii?Q?P02yzZBgQpp3Q8B/eaaYa7d/CVe2ZP/21xwFSXenPgIwbJ+BDdQjDXe2ZRXw?=
 =?us-ascii?Q?ACxWTXplSZF/8I2oH9u6zAzS3ywlmIZ1uTiPGgyhYxZLpFALY46XNVyZAr0o?=
 =?us-ascii?Q?bXSGp50/o9Muk9TUm0LecijA24pb4epR2PtbPWPLuwel+C1HCTlA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fad772-b0f0-4a95-8fe5-08df139f40e6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 03:04:42.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Omc7+GmjowRpqPOBW98H1M4WlGX7zwmOFuM6QMEhEgzCppE/98ywtHzgwcK7KbF+V59LtUBThwCE5Deqa6otPehzpHW1ivJ/eyKzJ5zWgNu5Cq2a0qqoGyUywG6yy/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11937

From: Chancel Liu <chancel.liu@nxp.com>

The pinctrl core re-parses a consumer's pinctrl on every probe attempt
(pinctrl_bind_pins() runs before the driver's probe(), and again on each
deferred-probe retry or re-bind), so .dt_node_to_map() must be side-effect
free and safe to call repeatedly.

mux_pinmux_dt_node_to_map() instead allocated provider-side resources on
every call - the mux_pin_function, the group name table and a mux_state
reference, plus a group name and a pinctrl_generic_add_group()
registration via pinctrl_generic_to_map(). All of these are allocated
with devm_*() against the provider device, so they live for the provider's
lifetime and are only released when the provider itself is unbound. The
.dt_free_map() path never touches them; it frees the per-consumer
pinctrl_map only. Every re-parse therefore adds another set of
provider-side allocations that are never reclaimed, so a consumer that
repeatedly defers probe or is re-bound leaks memory and mux_state
references on the provider without bound.

The groups and functions of a board-level mux are static and fully
described by the device tree, so build them once at probe time in the new
mux_pinctrl_probe_dt(). mux_pinmux_dt_node_to_map() then only looks up the
already registered group and builds the per-consumer mux map, which the
core frees via .dt_free_map. As the mux has no pin electrical
configuration, no config map is emitted.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260824022020.2812810-1-chancel.liu%40oss.nxp.com
Fixes: 34acc5a8adfb ("pinctrl: add generic board-level pinctrl driver using mux framework")
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Assisted-by: VeroCoder:claude-opus-4-8
---
 drivers/pinctrl/pinctrl-generic-mux.c | 76 ++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
index 202b72351efb..de85b4e75eb8 100644
--- a/drivers/pinctrl/pinctrl-generic-mux.c
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -10,13 +10,11 @@
 #include <linux/mutex.h>
 #include <linux/mux/consumer.h>
 #include <linux/platform_device.h>
-#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/slab.h>
 
 #include "core.h"
-#include "pinconf.h"
 #include "pinmux.h"
 #include "pinctrl-utils.h"
 
@@ -38,39 +36,73 @@ mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
 			  struct pinctrl_map **maps, unsigned int *num_maps)
 {
 	unsigned int num_reserved_maps = 0;
-	struct mux_pin_function *function;
-	const char **group_names;
 	int ret;
 
-	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
-	if (!function)
-		return -ENOMEM;
-
-	group_names = devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP_KERNEL);
-	if (!group_names)
-		return -ENOMEM;
-
-	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
-	if (IS_ERR(function->mux_state))
-		return PTR_ERR(function->mux_state);
+	*maps = NULL;
+	*num_maps = 0;
 
-	ret = pinctrl_generic_to_map(pctldev, np_config, np_config, maps,
-				     num_maps, &num_reserved_maps, group_names,
-				     0, &np_config->name, NULL, 0);
+	if (pinctrl_get_group_selector(pctldev, np_config->name) < 0)
+		return -ENODEV;
 
+	ret = pinctrl_utils_reserve_map(pctldev, maps, &num_reserved_maps,
+					num_maps, 1);
 	if (ret)
 		return ret;
 
-	ret = pinmux_generic_add_function(pctldev, np_config->name, group_names,
-					  1, function);
+	ret = pinctrl_utils_add_map_mux(pctldev, maps, &num_reserved_maps,
+					num_maps, np_config->name,
+					np_config->name);
 	if (ret < 0) {
 		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		*maps = NULL;
+		*num_maps = 0;
 		return ret;
 	}
 
 	return 0;
 }
 
+static int mux_pinctrl_probe_dt(struct pinctrl_dev *pctldev,
+				struct device_node *np)
+{
+	struct device *dev = pctldev->dev;
+
+	for_each_available_child_of_node_scoped(np, grp) {
+		struct mux_pin_function *function;
+		const char **group_names;
+		int ret;
+
+		function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
+		if (!function)
+			return -ENOMEM;
+
+		group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
+		if (!group_names)
+			return -ENOMEM;
+
+		group_names[0] = grp->name;
+
+		function->mux_state = devm_mux_state_get_from_np(dev, NULL, grp);
+		if (IS_ERR(function->mux_state))
+			return dev_err_probe(dev, PTR_ERR(function->mux_state),
+					     "failed to get mux-state for %pOFn\n",
+					     grp);
+
+		ret = pinctrl_generic_add_group(pctldev, grp->name, NULL, 0, NULL);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "failed to add group %pOFn\n", grp);
+
+		ret = pinmux_generic_add_function(pctldev, grp->name, group_names,
+						  1, function);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "failed to add function %pOFn\n", grp);
+	}
+
+	return 0;
+}
+
 static const struct pinctrl_ops mux_pinctrl_ops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
@@ -157,6 +189,10 @@ static int mux_pinctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl.\n");
 
+	ret = mux_pinctrl_probe_dt(mpctl->pctl, dev->of_node);
+	if (ret)
+		return ret;
+
 	ret = pinctrl_enable(mpctl->pctl);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable pinctrl.\n");
-- 
2.50.1

