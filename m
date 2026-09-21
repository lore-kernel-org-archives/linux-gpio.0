Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021136.outbound.protection.outlook.com [52.101.57.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0723D17B418;
	Mon, 21 Sep 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975232; cv=fail; b=sDnPOE/0iuslOvitZbDrv3dL6vxwSA6vLAv79pwbAWhPWS4mIX9JlEbzFLzBaPUbBSxy+pB1iBllr5sGCEIQYwzaKRcf9Q6wIebSi6GZhD3k27wS5+PRlr3lDAKLH05BnEG5Nf/NoTlRIlMuHrAXCorExQfHdWc3jhMLr0DnTEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975232; c=relaxed/simple;
	bh=Rqk5hx08gpc3JOJOF9XAL1hW5k9JLDzJWSIlc0UlxKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sJVbGOlr9i3cD1iDWrUujRsjBzs6zhs59lqvzSUziQLXnO+JuKqIq+RGnNoSG3t9qaplzmtPP+0BN9Ugp+txmPb/p2e+xPiq1y1YW9w4CODVuFw32qNP4RXmC7Y1dAyuQ1L9X/7heZ1+hVUHAcj4nkVY2rNe2urYbVDENfd1vtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=IeCcLk/4; arc=fail smtp.client-ip=52.101.57.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="IeCcLk/4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Af5VbH/rmcck2vWxPAXDUIwnbNdtrjXA3MI4M4t0o1BsKMv3zdpmhoFuQ26SOIBTZao58+/d3bsCQl0pPtuxFSojSVAH6n7FQW3dReGC3uy2um1WtO+Fjhwo5JA6s7VOnEmzV//gC32YRURJYxMOKnXwjsRrz330i6PWGygD+JYf+a8jjAu2slmlO92VJ3SqtabfJAQNgiC7yYklXJfDVbicuIq65ogvZitP+oM72qitjQ5zHKezPYRYWiZFUZDU/FGwMXBfma7G9bX7SN3QVPmJhGphf2QH6LHtdRCdH0ub1ZKVfzbEWZXenxeDVawjFMxbN5Ktf6dkFLFXVaKTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=814/sgMgtzgva33KFkvqHvINGHUT6LP57WwXfhSYAs4=;
 b=Cgap0lBohQ84x73Bo6FLsRGevo+ursoX6nzQ0jAGAZQSBX4oQfs9jC3LwZ+GHb6TmAIInmJw+70z8RkmbIGyMJvwhij/TrGjlpnk4I7kVBZOljfzgjbLV+XWv0SJkZAcfWjDilrTfnYzuiU5ndqU0tySXtBv7gKYVJx6H7nG/0hEw6uy5gMJfS+/W+LD8tLRY6PTiE24G1QQsrihiUPSey7OsEQHw2kOVe4kB2/evfTK7wIrek4v+G3zCS0S2RhKEzW9srNlg8mkIvnH6awPczRzJ0mtjRfPduSIhlhI7W+HVYO9X3dUDbM25kEVGkIJRrzjJGR7eUsBkJcTc6FUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=814/sgMgtzgva33KFkvqHvINGHUT6LP57WwXfhSYAs4=;
 b=IeCcLk/4oEOoXDnfpC8t/QiH9vR6hCTh3McJlyaXuNn0HXWUWHRDVAZdOimeWpzrDkuAGIQM2ld8RS0nFWIIrPutTNm6hb0DotKehRKFA2iede07Hhsmavkx0ej3tr9IbOy72wpbe1O658LnD0chVYM7oTbFh195o5OlID6Xh6vTxfCybp81BYUqF62Ca1Xuq9afSTVooGc5OHvDUjgagrJR84Pwsy/uRCaOC01lxJUo5sDUeFtG1pPRWXa0xOnTFUnlOF6QRxXgXRFZmy53ZWmmcSLzh8OGoA0npCwJ0wnQnhX6ajx9QevpbgOvyk4lIyeVfVyGtuVkYux5ag/1rw==
Received: from SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::35)
 by MN6PR18MB5443.namprd18.prod.outlook.com (2603:10b6:208:47f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 07:20:26 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::95) by SJ0P220CA0019.outlook.office365.com
 (2603:10b6:a03:41b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 07:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 07:20:25 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 0ECE14186B51;
	Mon, 21 Sep 2026 00:20:25 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v4 0/2] gpio: Add support for Axiado AX3005 SGPIO
 controller
Date: Mon, 21 Sep 2026 00:20:21 -0700
Message-Id: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXasGoC/4XOTQqDMBAF4KuUrJsy+TGarnqP0oXGUQPWSCJiE
 e/eqAspXbga3sB8b2YS0FsM5H6ZicfRBuu6GOT1QkyTdzVSW8ZMOHAFggPNJ5uXLg4BADTUvXX
 UuG7wrm3RU4BKISsLZVCTiPQeKzttBc9XzI0Ng/OfrW9k63anJZNn9Mgo0CIxKUrDUenisR/cj
 HuT1R754aVcn3o8ejpVlcSSMSmyP08cngZx6on1PwEZB2RFlvx6y7J8AbMjpeNtAQAA
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
 openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789975225; l=5586;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=Rqk5hx08gpc3JOJOF9XAL1hW5k9JLDzJWSIlc0UlxKo=;
 b=OQlCC4p2/xl7gulkxuJNvdMZMKZFXpWyc0TKmC6rB9/e2/KNEs5NiPXrrSbPe0WB/+03qbhBA
 XKO+V2UrHyvBK7nZmkdX6Gtyva8zqaGqKKtIxdArLDbTWC7lFrGoxzm
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|MN6PR18MB5443:EE_
X-MS-Office365-Filtering-Correlation-Id: a624e6c4-875a-4eac-633c-08df17b0ce85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|23010399003|82310400026|5023799004|56012099006|10067099003|3023799007|13003099007|921020|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HdwS4mrnnccspYHY/jxwN5sgcHskJ5qYhjI/zdKgUqneTzUMf/F7MECt+jkojP0LgTm//LECEF6M+umbaJOOPVZdnq7qvMMmqG053v5g0IqMcrn4pt8J/kLY5qzsn9kUkqlq132gI8xw+odzgVSC/dVPbN5ZT2PIR3Zl+6LFPFnBHopKoRduuXYsOK/tZBJWqxyeB8As774xFwklqHHpZqWG3EnB4PaxQM12NbgJk6NSXguCDj9G6XxUETpkOZezIGJTk7ZBvQGt8Zn5Wk3lRy0/aVIQzQ3JJ6gXHUD871jgd5iaokVmk/thBx9JTPp8Phgbqpgi5rpShuXW2PAfPMMQIIZbZPuspIF+jddl6mlbvTTvL2fac8p4SfNAyRAVFKUbluu+OZbw2Rl3gTyvmDr48BtEvijF5gLvCwWo15gAuiLuoH7KyC45mflZIo7IsGrp9mQFWj75DWaP7A/xJqMR0go886pBG29kOwxL8lQNJILGRqlQDl/FVrXty97aJ1qBQuVQxm3sU6a6h08BxR6rfVcgpxxsoiJf67sy/4Fr6pJSKFIenMUZrf+YSoxrVDco2n+ogF2xtb6+z4+DnnGK5tqO5ICzQ9UZUNVPFq7xnlg4YxEw3zhDn417tnHMkCefITwMrXTy0rQUEAEez1hjng3J5ovEOKrtbg3KtvIaMXx+q9q/j/h9GH80+MPrI4kpfXOrla5s/uIc3rYp8w==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(23010399003)(82310400026)(5023799004)(56012099006)(10067099003)(3023799007)(13003099007)(921020)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jmYNvVf2KwLTM/VmExezK/sVbh2v+b+elXbbCyTkeTVk1F8fF5mwWv7knT9iFS1X9DDXQEqh4dPwvScoU78FdhFEoRKGVQAKte6i13nMc8/FqG4bHuNS7jF5ztRUlCYH3ONPiskEB2WRVhVqefgteRX19Xu3hSuowsEuPe/v8TD8hbTL5xMAPAkC9YePWW92SwBNAVpjHw5w9zoDXJ0X7DUIo+U4XUr7Mzj9nCd5vIoWGeqOT7LublDolJ4FQtlC/xYXOE8/Btayu2RoCNpPxcZBrBKomdKEYAUkkojXfRZ0KDkrRJwSLheNcFIt/k3BNzVB2nspiDNlG1gVmnVEgy2q/xt/Vq7oTJlI8w6SUcZoESiNEnQucl51VzV+W3idYUPWxcEsMAeh7PAR6r2vDLOxwN5zIQUM3Lmp9awozGWvV7PAHGwkHyvGAy7LzL/q
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:20:25.5137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a624e6c4-875a-4eac-633c-08df17b0ce85
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5443

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
Changes in v4:
- Replace the devm action used to mask SGPIO interrupts with a .remove()
  callback, ensuring interrupts are masked before the devres unwind.
- Link to v3: https://patch.msgid.link/20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com

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
 drivers/gpio/gpio-axiado-sgpio.c                   | 736 +++++++++++++++++++++
 5 files changed, 879 insertions(+)
---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9

Best regards,
--  
Petar Stepanovic <pstepanovic@axiado.com>

