Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021113.outbound.protection.outlook.com [52.101.57.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA693AE1A9;
	Wed, 29 Jul 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308533; cv=fail; b=uY4SlZ6SdLZA10ZLrelfNIs5xyZfRrBMoF0HAZrab90b7eXTYFn5Tq//L0yNLZWN14ZD0LebpZPHJVXlUx9MWtUeOps07MiafcBs3ROn54jTGQdaTYsudB7x7WNGfafM4Ev3KLIKAT1I7U5chlX38DXoQjtLxH59K5PIAal7dTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308533; c=relaxed/simple;
	bh=0xNk3kTkwyj33r0SOMBTLvp5ryEmN1UDoBFrzWokLmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CmSF5qgvh4i9bkCJJwLaz/rL4xsOHEvqP1AGf17Jyaf9nUZcDeR9JVqLwXc1CZdOjRmQWbpP61k1AfYYjU91O/BypKvzoSZTh0wuwA2zWk/nUNQ9CcBPFLqD7U3kbcczFYaWCv5ybER2xMSwZMbaWPPbN+N/sBmDX+GJeKP4yH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=HmAhKOlH; arc=fail smtp.client-ip=52.101.57.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="HmAhKOlH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxSGQy7V68n83Oot87YtQgPnMb2/JdMo7N3ChNWRFBswjSAn7fX5rbM0g35uIkCRi4qkuSE6a5bFfLYY1TnOLtrSHMeC3npCIfXtuTyDjZsXvvf/IUAz3zZcxtZoKcK6Mm8CRMa0cyiNb1KqYcoeUgFdPZAB9hrX4hXxTXScaCQgiydptL2HEAAE4XfZPSm+YXt8EMLWlnhpRfF45COyy4jskQMc/7weLYQVnSia23tyOCIgNrN0xaAt9k0xMDzzbJKa8mvp8B4/OOHv3bOhn50mlXTqI1t1Wqt9aRmNqm95QXthZvfStvNh20Yq9FH719Q/NFeadKDekN8iEZGfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNKq/779UE8eIKHSJFXaDfSUCneqBwLoETfwMbsRcJ4=;
 b=WZekLJJkj/gdA5krC+/1pDzfXmKpSUnObRSHmHHAl4NtH+caJfkD2GSO8iamxtBpsIjTdxggCdcF9n0wqxoAmUzR+8BJtvVJJSrqet4bmCktWgCWyT0Oy2d9XeWfR7G/LZ4nB+JbqHUov2u5ANgAQvAQAQtkfYwb8rT00mUPNs5p9I0m0bGnrbQLFleZ+Vek9s+EJVO+dRwhVuC6FQ0QaatbRaXD7nzJZjyWqvaGY8uU1Iqk8zkwNsa3IleyeHjFEs9WIJjEhOfyT6vxrpncgzwaqiwJYs7E6FPjvFbZSwFN7z+7L4qOs2QS/ikkFI5oHe1Wk4Mu9eRDZEHrioL50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNKq/779UE8eIKHSJFXaDfSUCneqBwLoETfwMbsRcJ4=;
 b=HmAhKOlH9dl0+3VN3Ml59yi0mk0YfzF0aqcx0Z1lrnotuagcbkSiVaE1M5d+jJI4ILH+DHXXZbVXvvQPX0Ta3sNJrHpd12sGJkI/oX0kUMFP+qqGXYTm4bay5044l1zwUj6qja+MCNVtu3s5agDmYAZTWgvV/ZL+KeE5UNsPvIhfMsQC2in6sYyYgOSeMSN98TvhJlreGq+jwcPJrxln8b1FB2Zp2xkXA5q5XcQsUi+qDsowaWLzNuWE0tn6ZT7Z30qMOT7DlZPl7laJFGilkhVL8O0pF7If8X/yqRHLPn9AYVaPNA3+wfsAaIw+7NksA96dU0eeZYjLUDAvQkij1w==
Received: from CH2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:610:50::12)
 by PH0PR18MB4040.namprd18.prod.outlook.com (2603:10b6:510:2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 07:02:07 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::ae) by CH2PR16CA0002.outlook.office365.com
 (2603:10b6:610:50::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 07:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 07:02:07 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 8E6894186B51;
	Wed, 29 Jul 2026 00:02:06 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v2 0/2] gpio: add support for Axiado SGPIO controller
Date: Wed, 29 Jul 2026 00:02:02 -0700
Message-Id: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGulaWoC/4WNQQqDMBBFryKzbsok2hS76j2KC42jDlhHEgkW8
 e5N9QBdfd6H//4GgTxTgEe2gafIgWVKYC4ZuKGeelLcJgaDxmJuUNUr162kyBFRhX5mUU6mxcs
 4kleInSXdNtZRCUkye+p4PQ5eVeKBwyL+c/xF/WtPdaGLf+qoFarm5u5UOEO2bJ7n4OrkDdW+7
 19PQtAmzQAAAA==
X-Change-ID: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785308526; l=2879;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=0xNk3kTkwyj33r0SOMBTLvp5ryEmN1UDoBFrzWokLmk=;
 b=6XfmR7OjhbXC8VpSLgHbdoCFt+o/nnDSJ4lx5d0FKtuHLiZWhL15APMssbTFpBC5QKUv92Vsg
 GziXsjTrZnOBIoD83jhOZ6og34kn6g8ZL/ue4Bj9WtQDUQYrt4FmPa2
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|PH0PR18MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9403e8-9742-4ded-2142-08deed3f4d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|13003099007|921020|6133799003|5023799004|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	BzLI2eJiAJlLm96t68Tuqmro0jZUriRjgDEduKg5XGmonS1RRTrm/CrbAKKosHrr61V+6z3+rZhL2dxqa2yguFmMAHyeGkNJduJP9PbUXoczZ956lgOO+mGI5fD6X0ydcDyYs2gSzHyLP5L3HRjh3EjpV8Ik2ZAvS9l0q395U5W7SsYSBsJ6IQDwwsEpmmutqFn9YvLLrtCjtTKyYWaiVvdvZus9yPd5CqGSBZZ27Iu8nE5/Jfvmz72L55G5qFey0k6pxWYERi2AL8jpaBkTIc4FxZbS26DEIaQygGJl1yEB6iwe8xlieDaYM6XvkdiSNsl8kWwdS7P/WKSQrhIoXwLj898PWZHXxb5wzmulyAQdB+jJWHmBrbZM1BxhzwPBy2tQDbiqzh74zm9b5gf6pplGeAFCWNXgKlS7OOwogqTyzpIoq6A6yKSl4yiYCpfR/PRhSYc5tWOa+ZBvPbeHM6q+8vAPMSc17roqzbGtgM3Pmvv5Iq/ZTgrMOXryY1m7UdPc1pfAP9NK65HWxB4EmB9cD1gsT1IuvvnZdps1WAfF2+n/yPO+v+NZpB+Ad4rI9+3LQzKCD8nTnc9SAsE2EMbph8lWLZE2Le/dz+Onmqcpty1OsOfpLGj4uMYO2ZJGS57ogLRY+m6XByG4Xio5O1ayD/N9yUtJFejM2bjsXxAQtMYVqBwlDwezBsCzGfJIF7vHHF9ayfVUjxcvhIAMCCiQ5dg1GqHw1o835VTGN17qv1L4ef4/6isIjPgz14+4
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(13003099007)(921020)(6133799003)(5023799004)(56012099006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WAL3CQTiUAwLw/ELWI9DpFQ4gqzbewcWyAZiLq5xWt+8LYpUErjKDSZDS1kMJFIPeHSDW5aohdJ44Lux4rVDK+RgmwBQTJasSEe1m66eMTcd8s/To4XVoyu5oXndBghyCLTiImJC0aTulszlyyWp347NVAS5vkUgQ/xHlMxcTmnaivJrFW5Sx894057kN77d9DhXvSSufkHs0yXUZhjnTAsLY/aUvFSXlNddGtEYhKsXnMQEECg6ZK8RSks3xGS3SyW6MXnnxAI7optM3wEDV4B4bisjAhF8JvnJ69C2jrgoaRrOQJVne/a0W2s/Q6hhq2eIa66dF3xmdlAOmYyUXhQB2dD2OYIJXO26BIdYuoH24IcNBi0gPV3eJwlgXdqbyMYK1/1JgjJijtbJrTVNTinUC6Kc/cn9OsW7gTCm8q5UpsOEV0gAxVX/Aufiqb+b
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:02:07.1290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9403e8-9742-4ded-2142-08deed3f4d86
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4040

SGPIO position provides one input GPIO and one output GPIO with fixed
directions, along with interrupt support for input GPIOs.

This series adds support for the Axiado SGPIO controller.

The series includes:
- Device tree binding documentation
- GPIO driver implementation

The driver integrates with the Linux GPIO subsystem and
registers the controller as a gpio_chip.

Tested on Axiado platforms.

---
Patch 1: dt-bindings: gpio: add Axiado SGPIO controller
Patch 2: gpio: axiado: add SGPIO controller support

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

---
Changes in v2:
- Split the series into two patches: the binding and `MAINTAINERS`
  update, followed by the SGPIO driver.
- Added SoC-specific compatibles for AX3000 and AX3005 and selected
  hardware limits and register layouts through match data.
- Reworked clock handling to use one APB clock and calculate the SGPIO
  divider from `bus-frequency`.
- Removed the custom `design-variant`, `dout-init`, `apb-frequency`,
  and `bus-frequency` clock-source properties from the previous design.
- Added validation for the GPIO count, clock rates, and SGPIO divider
  calculation.
- Added correct GPIO direction handling: even offsets are inputs and odd
  offsets are outputs.
- Fixed child IRQ mapping for the interleaved input/output GPIO layout
  and
  restricted interrupts to input GPIOs.
- Reworked interrupt handling to support rising, falling, and both-edge
  detection through software filtering.
- Initialized the input cache before enabling interrupts to prevent
  false
  edge events during probe.
- Serialized output cache updates and register writes with a mutex to
  prevent lost concurrent updates.
- Updated GPIO IRQ handling to use GPIO IRQ resource helpers and
  threaded
  nested interrupts.
- Added managed hardware cleanup for probe failures and device removal.
- Updated the Kconfig regmap dependency for the MMIO-backed variant.
- Simplified resource management and error handling and performed
  general
  coding-style cleanup.
- Link to v1: https://lore.kernel.org/r/20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com

---
Petar Stepanovic (2):
      dt-bindings: gpio: Add Axiado SGPIO controller
      gpio: axiado: add SGPIO controller support

 .../devicetree/bindings/gpio/axiado,sgpio.yaml     | 118 +++
 MAINTAINERS                                        |   9 +
 drivers/gpio/Kconfig                               |  18 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-axiado-sgpio.c                   | 795 +++++++++++++++++++++
 5 files changed, 941 insertions(+)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9

Best regards,
-- 
Petar Stepanovic <pstepanovic@axiado.com>

