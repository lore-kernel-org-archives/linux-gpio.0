Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020109.outbound.protection.outlook.com [52.101.61.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21EC3FF1D5;
	Thu,  3 Sep 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419503; cv=fail; b=AbhZwXGAv40JHaJoKlb7+Xx8X8FvInMD09Y26cSwg+rKvYBwNlGY3u6cKM/FezRUbmBnOzVhWt/fk0iVJnD+4CuIA40LZh0guEpPlBjrg4V1xF50sJLw/vyrfhoKpeLPX+HFMvL9QZhjBUOmvLYPR/EQq2uYCyVUZWWJAh4QySA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419503; c=relaxed/simple;
	bh=DXKI6RsoR2hikcTY0iRxF321i1OzVLOpM4p7z0FEqwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SG35KU9CO3TuPNJqcTs8OaYTnHpMIF/KXRl5tIRCNsLOquI5MFmrBELgAsRQMHMnJI3KvgXczQshLCxHQxEmAflq6yM8C8471ECLsAHKPP9rGTiiDJl9y9JiRzMoLnG1b6rINCBImukOAa2ON6P0H3/Fg3olPB0D6q1Y5fsgO0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=FeMCumeN; arc=fail smtp.client-ip=52.101.61.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="FeMCumeN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DC/Zwzq0Zoevb02mj1EgQEoejDY+kMn5ka3MwDvSDyUKnIkcStn0Ks6oDicP8cwqymXhMo/lDmfswGKlCnTIsT3UIoCOPTCBjNJcWQXizEW4huYgsZc9yXQvj2hSIvf0I1nIqPVZk4h6mHoC45/McBrLRSzVRSo5Y3Kk1vUSA1d08IpWQ7n0S+2XhVR7lhsBAZungxTb6C1fuFxgRB8BErR/SjfWt+WTQOkQpfQKDBK2qwXuxTu/tYp9x4YRxKyXd0pu1LfKE537JZmUIwfzSLwFVx2gDdbtBtK2ZpgljU1X3xk+gQtCnkr+WYcDsjaxrGeCc26VzGcsQy/EAqs8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzFxd0gdFcwvirEZ59tyd8qcmxTEk9rocqV5RMamIoU=;
 b=qJFNpfRYFr8914QGg/56RYGGagpHJAxJgeq0ry/rVmQMw36CgCVNSLcBjFEvvo5ZeuLL7cZKTF2f8Yj1+PEtKMIkZWiDVZvwOKLt7siZePlIYSG4ilP0qCf9hUkUfM7HwmUjTAw53eDxlQ+skVpynxiw4GD3B9rNpdNr3Nz4QtNqmwOr3pzG0Pwq2kx2sTajdSR5vHtbL8nM7z4AOwesD2Nn/4TOf5oC2YJBq4VOisveDgaA4e4oYYoKKFFbKQfP6yPeAKV+aJHMGFk2jWpex0MOmFQsLRRR/k8jTY+UxfA97AI0rcay2T0X54MDnYf3IvbtcRznrDAA33Nnfr4JvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzFxd0gdFcwvirEZ59tyd8qcmxTEk9rocqV5RMamIoU=;
 b=FeMCumeN4/DGQr/dU6hGICaoA45g8nknwlSLFV3r3BUiV/vk+orRmX2H3aYOVwH2FIk2rVPZJd9d7m5WBYqKnGSRwQRylEMnDxUiq+RdVQ/r/YJM6CLzlixNEBzleau7bC8JiWg3tzl1n5tH6je61e2vH4bFdu+Oc7iInWKTaQsJTuqibBmjtkrlvwjFwOyF9NdbZb5kECzLo7gRN5ZAf/g3XIJKgQ8EhMVKFDq7nPm0McdIMaC40NnFalBcbo8drOPMA8B7cRTzjZUoUf53QzaGdDouI1IUb0uPaWdE2QLltZleFSlj/sYmySTkuc4CmVOl86GV0aS/jn1R+hWZaA==
Received: from DS7P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::13) by
 DS0PR18MB5504.namprd18.prod.outlook.com (2603:10b6:8:162::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 07:11:34 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:8:25c:cafe::6a) by DS7P221CA0026.outlook.office365.com
 (2603:10b6:8:25c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 07:11:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 07:11:33 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 173DC4186B51;
	Thu,  3 Sep 2026 00:11:33 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v3 0/2] gpio: Add support for Axiado AX3005 SGPIO
 controller
Date: Thu, 03 Sep 2026 00:11:31 -0700
Message-Id: <20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMdmWoC/4XNTQqDMBAF4KuUrJsy+Wlsuuo9SheajBqwRhIJF
 vHujbooXbka3sD73kwiBoeR3E8zCZhcdL7PQZxPxLRl3yB1NmfCgSsQHGg5udL6fAQA0NgMzlP
 j+zH4rsNAAWqFzFbKoCYZGQLWbtoGnq+cWxdHHz7bXmLrd6clk0d0YhRodTUFSsNR6eqxFy7Gv
 8lqJ/7zCq4PPZ49XahaomVMituftyzLF6e1T9UdAQAA
X-Change-ID: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, Michael Walle <mwalle@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419493; l=5315;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=DXKI6RsoR2hikcTY0iRxF321i1OzVLOpM4p7z0FEqwQ=;
 b=goKS6Scva2K3HAUSMsHecrUvDwUgwpgkMSxJkL4NkcejV2Fu0NIsAL0N5nzhhRa5kJL8NXzbo
 CKWKLmbfPVFClIXQFmENaSF1+FHAYaoTH6O5+nCORWrGU8JnOXg7Nk6
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DS0PR18MB5504:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ce25cf-a4ca-4ad5-e168-08df098a961a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|18002099003|13003099007|56012099006|3023799007|10067099003|6133799003|5023799004|921020;
X-Microsoft-Antispam-Message-Info:
	iai8Mv+K2Lzxt7Hh1cVFPRFXvwVVc0IR3/UGseOei+bOJZtHZLSyaS160qXiJNn0q8tT0kaNT33oNnD4+GfHLXnPFm0vmT8zNKkKsW9/xvnvE3KrI4g4+lURFRx5hoIWmyKegoLtcd+ZUwFBKjuVzIwJM+U3WfIwc99uRatLtW5SyGNPYscSoGWUuuW6qnUFTUBjmwPtD9XFZI7iUQHqXf831TqMWB5Z8PntgBg/pqGVuEXZerwiS5RdB7uMO0GFOk9iwWYHtAMWoIijNPgKxmGUp2NTTzK9QhWHfoIekZMMEuvnJfNQh1HtRGBmvMt0w70PRYB5u1iWqt8ruPRRfHprkqsgiDUJRGEwhmaslYIM7Lg9k829idTs1KhHNLcUwSsd5FcDW3BGdn5v8bdVgf2Qz5l5a4NIT4H0zLPdCY1mTcKkL6Ypb0MpnHRLyg48sB8dkvFhKFXTHGn8Iasw442SmzfSnCa4lfJJRMnb41nVUOnjxGt8NRACSFeCbc25jw9M0bO0Xgh70RJ1VgjH+uXwnpXPOnqJo0d5FdfTp2IsnjOU8L0Fl4uDL8Vi/3zN0IMbLTrQ+ju8zlFwfpabejgnlafNRbHYourlDyGYQa2nqCfPK2pmAyJ/rtiKRpwd2VMBdmzM969ySEYJnz5CYX7G9jUFA4V7XdTB7x/P/e+JLxl25YkNDgEYUo4v2+m3dRE2ViowX98v3kVRhPVhLmDDd+PERp5DSC/hg4DtuhKhWBxzZpF16b/KyL6o5VIX
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(13003099007)(56012099006)(3023799007)(10067099003)(6133799003)(5023799004)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2j7bBVB5sU7Ke/xOJYjgl/6iGhsnqC8lEMYnep+DALPVKFndPhOl/FfsSyyq+TaRPIOXL43ZGny8v4CXxictzDHByjPzxKhUdSAAbZmvbbvjukjwiUBdMwtaY74eTqV0pElSxIDM0xNSSBfeSrKywaquepujcEE8sk3wDYfVkbKTYc8+BFXE8T1Xfx2X5cNhCeaD8MPMAwG8PqPx0G/WDp0ZYmacf/xrB48qfuCHUcKoJw7ywMxNJb6QB4nHPpHDb+1CR7twNo4V0qR6wegbrEzu2VcBD3n6WqDyXTzBwSTWqUc4Q5PlctSWxJKBlNDnuF919cVzuGq35q5tFwAm09TgOrWfalGVNbspvz3lzLZkRG9hRLISllOJPSX32SDha8isJH7MinWy7jT1wnMf5wt76NW9B1p+UvvORzyc+lEMITojy5XmN7sEZXsxPdpl
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:11:33.7126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ce25cf-a4ca-4ad5-e168-08df098a961a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR18MB5504

Each SGPIO position provides one input GPIO and one output GPIO with
fixed directions, along with interrupt support for input GPIOs.

This series adds support for the SGPIO controller found on the Axiado
AX3005 SoC.

The series includes:
- Devicetree binding documentation
- GPIO driver implementation

The driver uses gpio-regmap for GPIO operations and provides
controller-specific interrupt handling.

Tested on Axiado AX3005 platforms.

---
Patch 1: dt-bindings: gpio: add Axiado AX3005 SGPIO controller
Patch 2: gpio: axiado: add AX3005 SGPIO controller support

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

---
Changes in v3:
- Dropped AX3000 support.
- Renamed the series to reflect AX3005-only support.
- Removed AX3000-specific compatible, match data, and register-layout
  handling.
- Reworked GPIO operations to use `gpio-regmap` with fixed GPIO
  directions and custom register/mask translation.
- Changed `ngpios` to represent the total number of Linux GPIO lines,
  with each SGPIO position contributing one input and one output line,
  and allowed any even count up to the hardware limit.
- Reworked interrupt handling to use a dedicated managed IRQ domain and
  the `gpio-regmap` IRQ resource helpers.
- Added IRQ lockdep classes and restricted IRQ mappings to input GPIOs.
- Reworked software edge detection using input shadow state and dynamic
  bitmaps for rising, falling, and unmasked interrupts.
- Updated input shadow handling so transitions occurring while an IRQ is
  masked are not replayed after it is unmasked.
- Added regmap caching for the write-only output shadow registers and
  marked live and interrupt-status registers appropriately.
- Reworked SoC match data to explicitly describe bank count, input-bank
  alignment.
- Reworked hardware initialization to check register-access errors, use
  named register fields and masks, and correctly handle partial banks.
- Added managed hardware shutdown so the shift engine and interrupts are
  disabled on probe failures and device removal.
- Simplified resource management and removed the custom GPIO data
  shadowing and locking used by the previous implementation.
- Clarified the binding description of SGPIO positions, fixed
  input/output directions, and interrupt capabilities.
- Link to v2: https://lore.kernel.org/r/20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com

Changes in v2:
- Split the series into two patches: the binding and `MAINTAINERS`
  update, followed by the SGPIO driver.
- Added SoC-specific compatibles for AX3000 and AX3005 and selected
  hardware limits and register layouts through match data.
- Reworked clock handling to use one APB clock and calculate the SGPIO
  divider from `bus-frequency`.
- Removed the custom `design-variant`, `dout-init`, `apb-frequency`,
  and clock-source selection properties from the previous design.
- Added validation for the GPIO count, clock rates, and SGPIO divider
  calculation.
- Added fixed GPIO direction handling: even offsets are inputs and odd
  offsets are outputs.
- Fixed child IRQ mapping for the interleaved input/output GPIO layout
  and restricted interrupts to input GPIOs.
- Reworked interrupt handling to support rising, falling, and both-edge
  detection through software filtering.
- Initialized the input cache before enabling interrupts to prevent
  false edge events during probe.
- Serialized output cache updates and register writes with a mutex to
  prevent lost concurrent updates.
- Updated GPIO IRQ handling to use GPIO IRQ resource helpers and
  threaded nested interrupts.
- Added managed hardware cleanup for probe failures and device removal.
- Updated the Kconfig regmap dependency for the MMIO-backed variant.
- Simplified resource management and error handling and performed
  general coding-style cleanup.
- Link to v1: https://lore.kernel.org/r/20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com

To: Petar Stepanovic <pstepanovic@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>
To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
To: Karthikeyan Mitran <kmitran@axiado.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Petar Stepanovic (2):
      dt-bindings: gpio: add Axiado AX3005 SGPIO controller
      gpio: axiado: add AX3005 SGPIO controller support

 .../bindings/gpio/axiado,ax3005-sgpio.yaml         | 112 ++++
 MAINTAINERS                                        |   9 +
 drivers/gpio/Kconfig                               |  21 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-axiado-sgpio.c                   | 737 +++++++++++++++++++++
 5 files changed, 880 insertions(+)
---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9

Best regards,
--  
Petar Stepanovic <pstepanovic@axiado.com>

