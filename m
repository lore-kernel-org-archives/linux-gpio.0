Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6414BF930;
	Mon, 12 Oct 2026 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826598; cv=fail; b=hJ5OWbAtYlZklmOc+sMTk2iKyHeVrjHGgvMINRP/Uh3SvPr6TplJOOx5QHGF+osINgSSl9iS/qbCo492fUUArXxSY+p9Nm8Zd836dOGWG38NdOmM/sNKMCtukF2Gn9yh8tHMn6g+5EZyCCpR8zcPu7RS9TPYwbynJUVlsJyziVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826598; c=relaxed/simple;
	bh=hM4XDh30Jl4IRoy6t70YG6jmEY0+onuwK/zvs4xb7Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bTagKcOf1kGiUS9nbalYhtPxgyDOx0OTRqjepX57c/7diRJZO/UDECJplpnm7nmifKM60rhYi81Upkd7wGlciGFX9h/b5qwLO/4ZO6oN0zp4pxAoPAqPPepuWs9BpwGvUFYilq8pY28WOD7cB3d3f3oPRw8pgGGyrStOB0HsNrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aP0Of9ao; arc=fail smtp.client-ip=52.101.46.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aP0Of9ao"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtePpVqB5V4WWOCCY1BQG8RewxMzz4w6AnlMPbU/Z16cevl6ZobyOs6ZHTid/OvwFkORuT4jAkJrLp6/z3msIOg0UsJObvbJdflsQHS73YkBhyTBvdYCaLYpyas+xJSgvDvo300CVYMrHnR8xzHIuChkDyOtwtqjBETcmWdLA7P8UK4FRo6wA1yClqRIHim33ad+aQKNoK0dbeAis4kvUWngvGZ8tsicHKuyQi8PVVE6a+p4uwnb72dxWJLdbMdFWQFh7nrZCV2qVJts3OSWOIZI0drpdsqKu5SzQrQqnvx4SqvK6PAFkuSVNVcJj9lQFn1ed0XnznbiG8b0uihDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8XcKaSODPfym+kCVt3Z6XjhzMMj+vKfLnITBNnEjfE=;
 b=mytaNS1Qz37g4gFnuEoC3BrHYoqX0DYvBuT+PLQK01+6myAWFVPindWc05kjUgeSCdzLToqXlKQRT16IWuiZJ54K6SzRWRJpEBD0xP7L5aMvuhhIb/Ymoj47jKzKxHmqn3ht0Gw/ZeOwMkn5KEvDeQlqoSCrst1OoyX7wnKIC8ZmEDWB6YuMkkYX31uLFWDBXJON8WpuwG1IzW1ach+0PQXMM31J0j2+1InqG6NqPIGpE139FC9YL8Ijh8zoln+RoFM+joTW9d+RTjYxCAOx3B6600sAvkBYWCTnNLu/U7vd41pcjDEnHHYjiPf7eCVkt9uVthPb+elYb2PSH/sUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8XcKaSODPfym+kCVt3Z6XjhzMMj+vKfLnITBNnEjfE=;
 b=aP0Of9aoA0E51wFQcUSib5aKVaR6jxXEceiCYbuLV5KUwqs9XtTscqrGasFq8RhNERjbrAkg2OVqyYagBuzlumJmgm2XFVp76SeL6R2x9CXE9yyyOEEpWAoYrsvQiFBY/QsldCNVA06hq63XqIw35iPyOK+n96kVAbuf/+ftfGaOEG9ne997pO1eVzAC5ZXvJ0poi+HKvy8W/5/Y2MvShPSrAuAkALjDCRHkteT/PBMhLKlRTVP2o7wPgMNt9TKAEwu4A7FxFpa8NqXMLCLTAwQpUThbGgItnRV3oIDFu7PvcX4qnw2uplH4pj1BOzOe9YdmOxdASNqWhksaSMcBhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 17:36:32 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0496.010; Mon, 12 Oct 2026
 17:36:32 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Donald Shannon <donalds@nvidia.com>,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 01/11] dt-bindings: gpio: Add NVIDIA LSTP GPIO
Date: Mon, 12 Oct 2026 20:35:59 +0300
Message-ID: <20261012-lstp-usb-adapter-v1-1-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::6) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 47caba63-3bdf-4a24-ec55-08df28875afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|11063799006|56012099006|22082099003|18002099003|6133799003|261009223027099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	jExLT25OFMTC6C8Reyi+LStTRsOfgTpyuLmVC7ur2E9bxYK0Gso2vcggCDf9wWc7YqiE20CcyNriJDPZGY9v7AmNPsCwEz+gT9wVUW34ZPNFbsQHGYphI7sMIcWvJRkxhzCRI5MUYazCw8YgT0Otg6h6ogPrU1wsx+4BrdakfdimTAv0FRq+AizUFT8D4xB4Rxv+LkVcG1+6uyvlFjTy9ojubl7yESSapCdGlVjFaqpdZPuxbcQgdjAUXmyY5fJLR225luCoCeFGa086Jv5/YZwU7sZZVejYmHsGKCJzbOq87MZVCcBcCRzaBS1fA/Gju42+LAJxVdNyTKoFsWe1uyuc8BiRRb/Hv44PeEy4T/GUSFDXDJZju2zkFArYI0En4aOXOKjcmxuRv0qEsRkl936TtCCZLXPXIboTXfIL74uNokoLiB31btbJhk0GISaTZH1IFUIrfrKy8AaYPPL5Pp06/ier7Zw2RPfPPBQrFed1v7z5aYw6HMPoneSh2ZFnxPGrX3YZnyx39W4GA0rYUDTqedopGP5vaUVaZ9Df+42CDEDWIMgvCDfu2KQlXMAQ3DG7YtDxlRKWy0vd5Ck04fU71gnYbSWK4dw2nvAxpUwv/VWh2d7xjvhbN4shDOe5gDDzO0NYCELugeUQ/hoZ0MfL7bwD7HkOIdwMh2lpis4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y35t3snAj+2v+6YUr6cGuNyBfC2K6C7CmHemXHG/wE0Mai7e1wkuHmoCBFaz?=
 =?us-ascii?Q?3SnQpNyUFyYzYYQKA0tWOhOi0PX5vfLkSuM11GzsUam1QAuojazR1oS4fsQC?=
 =?us-ascii?Q?8JmrRrgiOmJsHxj1Xtp97bXtPndCanGtBx61Bpckl7RXYLC0JF2215slHepw?=
 =?us-ascii?Q?7L9ytqsmqfaHRBgyBVaCRrWg0TgOVguK0sdYMFI1QfrTewAn427QC1oE0t0y?=
 =?us-ascii?Q?hsm5RWmXLteG2s8OnVZ3GbNN0z5LFOcYtyI+VHo9ZauL6hYRHQweqCKywQtR?=
 =?us-ascii?Q?zMjcyKbXZGkmDO5+oG1bgfdw0uEUfHoGCGNlC9fwWbxfVxhtWj1RfYmWuULP?=
 =?us-ascii?Q?CzX9BzSRINwAkBYFGvQhTCdUv0+YWBXkEonHfNRYJ9OIt32Z6QhYDENDJOt7?=
 =?us-ascii?Q?Gkn/wgeM0gOsyo/pjKrf2Fi5sdLfmSLNn6KPEbbn4iLd/FKfku/FpEj1uHdU?=
 =?us-ascii?Q?cHgB0dPJCSr0fOQq/chHF0RYLc3tqYxTWuoElnnSxmILbPyAXZyg26eLXkSE?=
 =?us-ascii?Q?HNucEkT0cuXXVQOaZ6rQ6wQSkOlDTpP7+A8TIMtpX4H7uRoNuCUQxjKcaCD6?=
 =?us-ascii?Q?7KKxDUrk9TH6ldXNfPqyf6B4EcxcYSbmcm439TLWG466asCW2u7TWXnijVXO?=
 =?us-ascii?Q?2hmWqKgxzNnI2/PGx4hLto6d63BPKVYS1PnGGt3u6mBwzd9mGfgoT+jDrBvm?=
 =?us-ascii?Q?mFx2wtfcox7POJnlon/0Ekf+feT4tyXzeNGQ5fOAy5vDgNDL+ToRWsE14tnh?=
 =?us-ascii?Q?XY7OMLrNPO9scY4zTAFgvChpc5JkaOH3NY+sGSFMcvnzKE1byiZe0J8FTv69?=
 =?us-ascii?Q?lV3AuSqeh62ypiAYFYvyRus728cn4/OdZMK20R+QhJI5Cd/+JXGEfg5EXBvf?=
 =?us-ascii?Q?ZbbhgHSGACTHn0WhMLJEFjNb0Y4MxVD+7YqPYNsC1gq47fXmUhQINQxP+Rt2?=
 =?us-ascii?Q?/c+T8RKyHjI5ogdnoQyp8nBLv3y0Bqj3Yp7jhMQZfeWmm/7CLTGMkj4YUFrD?=
 =?us-ascii?Q?vd0WBQaoj5Fzu7pWd5IPVrcpUWZZaQ14RIQrg8yQZitP9KhymgN0bXrp41qP?=
 =?us-ascii?Q?xp8j80xCFv4ACvSqF1tZzcsTG4meJE+qzTZ3HmmS3FkDbqjVXxrc/77ARr8i?=
 =?us-ascii?Q?B4fg0Hx0YzxyDyxIKQbMA3Wopcs0Xe9oPWUvQP5esUAhdhgFIYvA+4XG1m5d?=
 =?us-ascii?Q?vWdLoNw2Nu9ZYewrHgzzMAmvK4AY7QVeYniEZtR+bulIJsdGDdpkMVyC+byi?=
 =?us-ascii?Q?SLrkN4eJBUXqCtYVPRnOwlnqriTon/nctVKePbFpzN+0ws5QeLc4vuUUOqD2?=
 =?us-ascii?Q?BMiu/HBzBnv3MLXjUILg9WG22+OTHrn/ygnuaYjC8ZNsPAMKTpSIjds9KU/B?=
 =?us-ascii?Q?JeHfW4DALSfb1/tKnP6Gq2xgYQVAwIgj8gsJ7n1H5oy666mZBnLwd2ABRNey?=
 =?us-ascii?Q?DB7NS2YJm8b9dsjCRRSrYGqOLB8Cn/gqx/L42/ynk7tFOeVxUPxnexqpN3lR?=
 =?us-ascii?Q?okDfu/l7A3V/gxbqvJCoJkW7aJZjhNMf3d+M6TKDtn6RTMDjeDlkVCffqY2K?=
 =?us-ascii?Q?HhzTUH+GlLENQx26jyuLiiTXeIS0y7TE6d7A75+lGrI7Ojtjm7pYIPx0k6d9?=
 =?us-ascii?Q?JiCHpX0ovdIiZSMYRDO7Bk2ysEs5iHHgD4CmRU2uTW7as4AUeeWDUPWu6xZF?=
 =?us-ascii?Q?zt//Yf6D9Ixs/cmDW1EAqoAapBO2/QH4vBtQ2uUK3ZVjS5zGXc3MPwnbPRyU?=
 =?us-ascii?Q?BcwDUs89Hw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47caba63-3bdf-4a24-ec55-08df28875afc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 17:36:32.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZBf/5EcYBhob3jQSI253j9PauLCXZnYxst8Nq0rYo/bjpKz/nA+mqdxyL4XRF0Hl7DMuJRfoav8rLKAkE753w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012

Add the binding for a GPIO channel of an NVIDIA LSTP USB adapter. The
node is a child of the adapter's USB device or interface node, matched
to a channel the device reports by reg (the channel ID) and compatible
(the channel type).

The device firmware reports the number of lines and their names and
directions; the node adds line names, hogs and interrupt consumers. Pins
the firmware reports as LEDs are LEDs, not GPIO lines, and an optional
leds child node describes them.

Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
---
 .../bindings/gpio/nvidia,lstp-gpio.yaml       | 276 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml
new file mode 100644
index 000000000000..4ca5081e509d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml
@@ -0,0 +1,276 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nvidia,lstp-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA LSTP GPIO Channel
+
+maintainers:
+  - Adrian Ambrozewicz <aambrozewicz@nvidia.com>
+  - Donald Shannon <donalds@nvidia.com>
+
+description: |
+  GPIO controller channel on an NVIDIA LSTP USB device.
+
+  The number of GPIO lines and their default names and directions are
+  reported by the device firmware.
+
+  gpio-line-names overrides the firmware-reported pin names.  The
+  gpio-controller and #gpio-cells properties let consumers (e.g.
+  gpio-leds, gpio-keys) reference the lines by phandle.
+
+  The channel is also an interrupt controller.  A consumer may reference
+  a line through a *-gpios property and use it as an interrupt, or
+  reference it through interrupts-extended, or interrupt-parent and
+  interrupts, using the interrupt-controller and #interrupt-cells
+  properties.  An interrupt line must be an input; the firmware-reported
+  pin direction is authoritative and is not changed at runtime.
+
+  GPIO hog child nodes are supported for boot-time pin configuration.
+
+  Pins the device firmware reports as LEDs are not GPIO lines; each is
+  an LED instead, named after the firmware pin name.  An optional leds
+  child node describes some of them: their names, initial state, default
+  trigger, and a pattern the device plays on its own.
+
+  Because the controller sits behind USB, every line access is a USB
+  transaction that blocks until it completes.  Consumers that need
+  non-blocking line access cannot use this controller.
+
+properties:
+  compatible:
+    const: nvidia,lstp-gpio
+
+  reg:
+    description: Channel ID reported by the device firmware.
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Two cells: pin number and flags.
+      Cell 0: GPIO pin offset (0-based).
+      Cell 1: GPIO flags (e.g. GPIO_ACTIVE_LOW).
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+    description: |
+      Two cells: GPIO line offset and trigger flags.
+      Cell 0: GPIO line offset (0-based), same numbering as #gpio-cells.
+      Cell 1: Trigger flags (see <dt-bindings/interrupt-controller/irq.h>).
+
+  gpio-line-names:
+    description: |
+      Optional list of human-readable names for each GPIO line.
+      Overrides the firmware-reported pin names.  The number of entries
+      must not exceed the number of GPIO lines reported by firmware.
+    minItems: 1
+    maxItems: 255
+
+  leds:
+    type: object
+    description: |
+      LED pins of the channel.  A pin the device firmware reports as an
+      LED is an LED whether or not it has a node here, and a node for a
+      pin the firmware does not report as an LED is ignored.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+        description: |
+          One LED pin.  The LED takes its name from label, or from color,
+          function and function-enumerator, instead of the firmware pin
+          name.
+
+        properties:
+          reg:
+            description: Pin number, in the channel's own pin numbering.
+            maxItems: 1
+
+          default-state:
+            description: |
+              Written to the device once, when the LED is set up, and "off"
+              when absent, as in leds/common.yaml.  "keep" leaves the LED as
+              the device firmware set it; the device cannot report its
+              current state.  Not written for a node with led-pattern.
+
+          led-pattern:
+            description: |
+              A pattern the device plays in a loop once the LED is set up.
+              Each entry is <brightness duration>: brightness from 0 to
+              255, held or faded towards for duration milliseconds,
+              depending on the pin's firmware-reported LED mode.  The
+              pattern is sent to the device once and played there without
+              further USB traffic.  It must fit in a single request, which
+              for a device with 64-byte USB endpoints is ten entries; a
+              longer pattern is not sent.
+            minItems: 1
+            maxItems: 255
+            items:
+              items:
+                - description: Brightness
+                  maximum: 255
+                - description: Duration in milliseconds
+
+          active-low: false
+          flash-max-microamp: false
+          flash-max-timeout-us: false
+          inactive-high-impedance: false
+          led-max-microamp: false
+          led-sources: false
+          max-brightness: false
+          panic-indicator: false
+          retain-state-shutdown: false
+          retain-state-suspended: false
+
+        required:
+          - reg
+
+        anyOf:
+          - required: [label]
+          - required: [function]
+
+        dependentSchemas:
+          led-pattern:
+            properties:
+              default-state: false
+              linux,default-trigger: false
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+    additionalProperties: false
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    required:
+      - gpio-hog
+
+dependentRequired:
+  interrupt-controller: ["#interrupt-cells"]
+  "#interrupt-cells": [interrupt-controller]
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    /* Minimal: let firmware define pin count and names */
+    interface {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@3 {
+            compatible = "nvidia,lstp-gpio";
+            reg = <3>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+  - |
+    /* Override pin names and add a hog */
+    interface {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio_ch: gpio@3 {
+            compatible = "nvidia,lstp-gpio";
+            reg = <3>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-line-names = "STATUS_LED", "ALERT_INT";
+
+            led-hog {
+                gpio-hog;
+                gpios = <0 0>;
+                output-high;
+                line-name = "status-led-hog";
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    /* Act as an interrupt controller for a consumer via interrupts-extended */
+    interface {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio_irq_ch: gpio@3 {
+            compatible = "nvidia,lstp-gpio";
+            reg = <3>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
+
+    gpio-keys {
+        compatible = "gpio-keys";
+
+        key-alert {
+            label = "alert";
+            linux,code = <143>; /* KEY_WAKEUP */
+            /* Line 1 as a falling-edge interrupt source */
+            interrupts-extended = <&gpio_irq_ch 1 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    /* Name two firmware-reported LED pins; one plays a pattern on its own */
+    interface {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@3 {
+            compatible = "nvidia,lstp-gpio";
+            reg = <3>;
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@4 {
+                    reg = <4>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_POWER;
+                    default-state = "on";
+                };
+
+                led@5 {
+                    reg = <5>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_STATUS;
+                    /* Two short flashes, then a pause */
+                    led-pattern = <255 100>, <0 100>, <255 100>, <0 700>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..284000589694 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19565,6 +19565,13 @@ L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/acpi/apei/ghes-nvidia.c
 
+NVIDIA LSTP USB ADAPTER DRIVERS
+M:	Adrian Ambrozewicz <aambrozewicz@nvidia.com>
+M:	Donald Shannon <donalds@nvidia.com>
+L:	linux-usb@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml
+
 NVIDIA VRS RTC DRIVER
 M:	Shubhi Garg <shgarg@nvidia.com>
 L:	linux-tegra@vger.kernel.org
-- 
2.43.0

