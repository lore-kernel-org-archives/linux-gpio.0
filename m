Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013026.outbound.protection.outlook.com [52.101.127.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899F3F412C;
	Fri, 17 Jul 2026 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285969; cv=fail; b=KO8KwUZna/NS/OxhmWgrxiL76a0RjRWZMHRyCa3sV3VnCBEAobDqXq4Y2+mpCMsarxNt4MgIXFOKy7v7oUc10xtuAdrn+ZXN3m5myi0mOC7feKf4VbmgcQzdA4T5jLpSm6egjxsit6wUKyKKMN7WoMGuJsw5KZcVnFX4y/CdrYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285969; c=relaxed/simple;
	bh=EKSPvhyd8Mm8m61F4a+8xNukNkz/2jlWAD1HmCj03m8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NFS11as2ZPZNt7v9mX/eHg44nuymQwx82YRLFI/wWIrQD81jt+UN3CdcQgMrTdQu2XQAr2CxTGYgrC99VlDyaDl7x6cMcRHtifZwthqfPXt1d/TOsevkr1gA7r/daP0tgWc0amUyFl6V4soiNv/njQkeh451FjCcXqIjlFwi8vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=csiVBsIV; arc=fail smtp.client-ip=52.101.127.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="csiVBsIV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzDPYynn6CgVvpui5p2nWY47TIkr0BByXIs6lNI/TfT5711m5Pf+K34FGvf50gSKiSIcsxb8rZjxC84o8hAoeNSAChucKyVFXP3GceUWXJvLc7e6nBgTiz4aRTrlZNN6sn+ZbkqKe5LS3iymOsttsRHjvJkY06uodKjhV4/Ymz2OY5NRtj3bxz3w83irIId26QnUeWT9k1wYTjdddX/ujiPwekPe95Uz8O7BkhkKDmk+GDXRTM6GORJrq74MwEMTw/XMOj4DK1jMHUH8bPIiPvAbdIEwuiow0PXBXK+2scZcThUTnAKD6EQ3y4TBpNm8ucmXN24ltMhYfK3uG2YBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PY4uVrPvN+6ZIwQNbP46A09f4bcw/FSaEE64BE0gu78=;
 b=ug2czAo8JW4oOsGnkuDVhozhEEvqGmalov0vxFIm4/RJvUIcvwefQ/jQQxAoV1NZlle9d2y5Pjo6YajTLZSFYgMVZTxdSSf9XWks57MqONCNnizo84r/3Gty4sGwmKhkHRucaa0GexJaxxt8oOEr7h8kZYZDhs35Xew+h7582Yt6KFb/OepHWfC48nTPoG6YmVDrWB1uK5ik+aybgTpDxQuwUR0rLJJuZ7YWbs0BL0Ny/ihcxM1SVVavc+z7wstyyZtqn0+sJzLr2wF1yDbGjcveffkVBTpsFFb9SMCswNqiblNZy3piGSM7JkpKGTpAIpF95gYXt50cOdDVcHsbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY4uVrPvN+6ZIwQNbP46A09f4bcw/FSaEE64BE0gu78=;
 b=csiVBsIV9Bw4825IqL3QOq+J6ZB+v+Kz57ypeWS++ikf8HN1R7dYgrLVdjdLopyZfe8zKec+lFFCeodGRxbsEdA43tKNiTLL9m9RuI3TEi7+gg0mpNyHAcXaDbmpcHWKsb7IL1f4zDzkHWSN1B0hWsWF4ZzJwyDKprQzkelq7K9vYGGN3MRXNFBCaOz79ScZdr2pxu0CT+T0dEhp1zt3u27aVZifw8vojjqTn+q5s4hCdmeG+5LDfofMLA4UL42IKzIcy6lhbTmmex0paE0wpWs4ASX9qaN2srkAbAfxvfRM5Kr+DuIxmq6BjbO6LuLjOxqE0DjfD8LkOWGeJVtfZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUZPR06MB8313.apcprd06.prod.outlook.com (2603:1096:d10:64::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 10:59:06 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:59:06 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 2/4] pinctrl: bcm: Remove redundant dev_err()
Date: Fri, 17 Jul 2026 18:58:44 +0800
Message-Id: <20260717105847.131359-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717105847.131359-1-panchuang@vivo.com>
References: <20260717105847.131359-1-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5e0eaeb3-1d93-4a7c-d7cd-08dee3f26bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|6133799003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	+nNy0uA7H1t6q9SkEBH2N6DP/BV+24q0ucw5J0W2+wBJ1/wk55Rz1SO19XRepFyc9IAg7bsUv4E0jHeoZsyQq7d9evZy9tQZeREjho0lGcgro5td0FB+fIVjYl33Lt8PZXt7qDDfc7N3+tH77p78Rg98IaRVSufknIsM7kDEAZZSMMMkOtecdEVGQTO55wNVGo66WjqE1GZ3z0v0z8cXAST2M8JwYZ4aaUiMeDZ4juVX4ElU8rYXEI0UYCBNGSzLZyNsNq8/NVOIyBnvDWfktrtjnfNN+gUqwNIV4DyNXJ6lv6UarYaRJOM1zs0jZ6lQHGOX9d/g7Y2shT/DLI6+Q7pFOxU3CV9AGi83GlucdA2KsTilNyRfgBZSipugJgDyQprgt/6P+Z/SehYb7yzibv/GiCn25Lit661wf3KjFlSO5aDjZdrGZGcEMV4A4OldtBlyp3tqGxBKiji866Rp5/7Bi0eJsxyoWuztrOIxz3UZniukKOn67+pJmqvbLGcaFJwa6IiTr49s91QcadpBykod67kuoN90LS47/I47zVGbj38V6fmrAe8L0jN/L/ojovgg0/5JqBFl7tkEbLhAaeAbmLL1T1eVkCdqru12cVGm3e/SdTVD2z6iu5ExY8lxCZEqRNraOhoaGaRc0Fbf5SrfDdQOVLPQm7olPbuxKWAqwlNMH/nOHbTY4Sih5fdmeJyrs0RW5CQW4j7xE0N7IZJ6RTxb1MuQa/VI6Be2QH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(6133799003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ns7V15zLxZyt0GT9ZLtgQQOk8wmKOiArFw2DpsB0+PF7UFvZTR647DUGrnV?=
 =?us-ascii?Q?CGawBx3jD9EwJA/0X9cLisLsL8s15pM1qWzxPlFOfpfh1bzjiwUMxZD4/84b?=
 =?us-ascii?Q?YrzfKFTXB6Z9OpnKbvo3o4UulIfnTukexeug3f1Fej+7cbFAc2x5BssEaS88?=
 =?us-ascii?Q?KWCBuFWjv3VOgqt7Pybovxc/kpuYegV3sssI+o6OB+8UJ5qKAR++CM6WctLp?=
 =?us-ascii?Q?cubxWnfcRjZwEZyRSd9JDvtsOju+1TZSkbhRw66Q76LQOQzomSTtTvr4LVUE?=
 =?us-ascii?Q?/kvN0aE/4zX7qpVm4Ex82AoGdmN9IhoqBH7LVxsZdghWkoRbuGsKw1FgGhNL?=
 =?us-ascii?Q?JuIVPprR3Q9aUxv2240/UcHod6xcCyfx+Lc6W8OwGWupDkZ3S8s4aLzQxrH8?=
 =?us-ascii?Q?4G09QXws9tFm9G0l5WB3dhhOSl819MqkiRlDj9B7ge8gsq6RQ2nnees18KnI?=
 =?us-ascii?Q?3USMTjvnVF+ZoIY8O0JYyQC8mI+LGTzDAkqxGxkce4oqQE/JJM2RC9hFu+Kf?=
 =?us-ascii?Q?yI9sZwKXJqkml2y2NcCFnhTHxQZSeKwp9vBJfHc29EjfTheZaUOM+YPl4GQp?=
 =?us-ascii?Q?O2bzahQrhVn9Jhrk9Mp/6kLfU7xsQBbsMeYIVuVoXH1Z+10h8izI+S72UBkt?=
 =?us-ascii?Q?ilsfQe081IRU6N1qtEpiARyCki/2+38PHWovz3ahkhCSZttx7Ba2xIBWXyGw?=
 =?us-ascii?Q?fbs5M7pWNVVdx03EBkUIl+5npoBR2OG+MuzX0XkPefK2k8ZAK6pcAOhQVfOl?=
 =?us-ascii?Q?4SemTulsHFgMNX9/c9foh3eJRKxLFJSRsWaQwpKqkjutAB4kvBB56oHGjGo6?=
 =?us-ascii?Q?fpityFLjdGtUc4rpkBfrdZv06MjhyCiTxbBYxlUmcXBNAi/11txWYa5sZTmH?=
 =?us-ascii?Q?1F3pxG9iOwKVQmV5brTYXvYPQ+TfvFSX7zKWLVM0WVi3E6rrteh5KcYoFS9G?=
 =?us-ascii?Q?VATQ56hmx5y5P8GIaokDiuTWbaDbCmKwuYKTPqnS5KYgT7VkWAEFnN0+ncT/?=
 =?us-ascii?Q?ALChBX7wYGwYKJBQY8Lfk2WVXXpUKjac432qddLS4aitICqDMDsXLXefVU30?=
 =?us-ascii?Q?/Z71LuUap0l8guEsN87WZsTy6peSw42/YHemzUTT/q9gtUbVQ3xeJhnyikyK?=
 =?us-ascii?Q?FfNL4eX2ZONGYDwBzVVQMYiq0acwELHnNf4pUOYHOQSmZKtQChfO+uwQxsk3?=
 =?us-ascii?Q?jQSFyt9ZtMUW0N+2KOnLXUhB4/RblNYYVmz6HD0jZGK54/iiKZvEaGsXVFW6?=
 =?us-ascii?Q?9KKxjWaXdU8ESBYf2qD0gzbsahc5JowmRQ5x2tZ7oOaiZfwX+RlaGKcvAw6E?=
 =?us-ascii?Q?bqxVX7Zgw2s1hXaklMw8iNhQhtydRhXAVwIZBjIoRKdG0xqK9NlfXxFaxHqt?=
 =?us-ascii?Q?fcqJegtl7tlvTzHx/4Kt4YcfVVIljQ/gpz12HhjhXRigYV1XFqwK0TuYFvlo?=
 =?us-ascii?Q?kjzt2TpEwcq4fQxc+Orj2/llDEpZgJOus9KZxgSnLtscw1b57JUfsBzQE1dU?=
 =?us-ascii?Q?E/s4fIqX5HZ4OVyeBF9I6ms+4Z6CwYXQETBKt222ZXaFCJQxI2hfz5EMja01?=
 =?us-ascii?Q?f9HThSFXAZpVm+NsMloBpEoyNe5q96z0Z2N5/9/6jzvlr+r4HMVCvJ5P023q?=
 =?us-ascii?Q?DA/1WNW/jYlA7LvMg30Dj9GCc+2d2nCiRPKojOsYt3mY8U6m7Pd2PamyDr5k?=
 =?us-ascii?Q?ikP5csI3qbKhc2/j+iuq//jyJKAfaXJQvyO2ArshDiXTdT/MrU/rQN/oariU?=
 =?us-ascii?Q?w4FkH2DEUg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0eaeb3-1d93-4a7c-d7cd-08dee3f26bca
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:59:06.5479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1B2XKjWDyN6NLVKxoKIYsAivqHDpBecYsMTIExhsnmWKb2FRK0RrM3M0yeRi5VTuaa+4PML6Drm85itrNSRJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8313

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index b425ecacd1b0..1fbb101386a3 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -671,11 +671,8 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 		/* Install ISR for this GPIO controller. */
 		ret = devm_request_irq(dev, irq, nsp_gpio_irq_handler,
 				       IRQF_SHARED, "gpio-a", &chip->gc);
-		if (ret) {
-			dev_err(&pdev->dev, "Unable to request IRQ%d: %d\n",
-				irq, ret);
+		if (ret)
 			return ret;
-		}
 
 		girq = &chip->gc.irq;
 		gpio_irq_chip_set_chip(girq, &nsp_gpio_irq_chip);
-- 
2.34.1

