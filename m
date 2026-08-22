Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F62233955
	for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787414960; cv=none; b=Bf8SjZsWgg2e7/bCAxY4kUwJQd4sXVEIvY/wF812KV4iX1ATwPoSXsuw/sAw9ShJfhjR11fxWHe69ZKOp4qZF3KgStDialEL9rbZXxUjV+Oh6IUGlOK/ptFMh7Pkx3+QtM+ij7JwtxxJfzQ+/03jrslmkiQFEAj7W36NZxitjsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787414960; c=relaxed/simple;
	bh=kdC6x95hcZcj7NjvRK20sOu8F6ePIwl0dUoUel+qQcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OA2nhgLucLop+aOx4cv5DO/CmxyzBWb3z9KRUw7s7Di06rAlmWTwh3fLX4u1jg7QO0aPiV+B2cps0UWTLAxKDAYZzrPTPahi7nSlilo8mfD+DwyWLOqLO/ZmJ85Rz/n7fUa4BBfoUpKzK8whmPF/R9pm8hCy8zrCEKazid+ir54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQiuQSCh; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQiuQSCh"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-394f4397662so208652a91.1
        for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787414957; x=1788019757; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kUt1Yy+gfMqSHh0mIQ788tGW8A4V2/g80J8oxMhPMHA=;
        b=hQiuQSChxUKG0yBZ/Cb7sOlF4t5iSFotY3CBS8n3k1vO2ciLXkOi47TX5s1jE+T2Lj
         2Impk6JNzHK8h4fBrBCB1zLZqybOfE1Z4FwPMrGc4LpM8VZDMRBbrNCUG5ZgNwSYtCpd
         +Jr/kr6VnT4Q2MQt0u+KV9BIv9dqVR8P7wHA7UApbPCG+Cm1JQVGlRbzrbLw01Adef0A
         dP5NGye2+HmlVNuK9vErwhghCXbEkSRTQfMJgCR+MwG8+kfGyrhow0Jlgt5QssyyheiZ
         tNWqlNc2GmR0e1nbzD/YvVnvItpC44GlkiXujCP9UZEAgmDLjxzjVq3HJIFqijVyM4wV
         rmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787414957; x=1788019757;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kUt1Yy+gfMqSHh0mIQ788tGW8A4V2/g80J8oxMhPMHA=;
        b=Mw18lwU9JjBruquwj9jPtzpwf6mQFZnddrufiMXA3EjES5CEabtuZJKllMI3VH3CKi
         H5inNMQjyA9IDTLljzbZV/Eix1n5plLW1M7nV48xblQz57qSSmzjgUFdGigHI7LcaTeK
         uO/NIOC5NDmtcFo84Sm2YfMHmp9wH+1Vz6Bia7lEN6a2BplF922MhVkeQbqmPfwxgdRD
         uU8SclZso9GznD/wZzeDrTEqoA+0gVQPf0bRGav/lt+hGN44iwcDH25fpiQCKit+9auW
         kZ+e8lHznlCjGcLWJRhNJ4ON/LfLVn0zfL2SYFLGS5cl9Qi5QxfhQgP8VZPHA+X0G3Qm
         6R/Q==
X-Gm-Message-State: AFuF++n9vlFEeQGGLTi00pQN+ypcREMoKHp+i+49YZZ/trvraZLzXV2D
	mg2EnEfx4OFoQtH6j7bCI6VTvejT0ho9ByZ7YnLHgL7+ebAYOpmgihOd1TYJQQ==
X-Gm-Gg: AR+sD135G8YVj8Bdu4xda1Z0C2EqzxChnESA7/7iWWDV6t6Pue7IE+e3sSfGpIAit3S
	Uy1ZlNlfV4K9ZrwoWTRGVgFFBePiYuNZ3Clu9C0AqwjxwURgM7nQmITj8p8sj9jgBbzWEGkNcjx
	sb6crhRtfP/dQlQxdJzja08BwTwxLQNHdvB2vz/inV/IIfkrUL0NKkb+yZyYpU1nYCzF3B9Dxa6
	ufp1V2EblaeQBmmKeFStC4DSHVTpCAH6lyDWFsMd2AfgkbLZMnntQTvU0Cz4QD3kAYisCId6Wf4
	NE7KCsdDfujGTKqTssZOWFk7bUjB5TOaHwtLXAT0YcuTwA4PyTGCdS8RXGoWKu6osXAImgh479u
	JW8eE0eZLGCetcqNaDL5Ox01nDS4FT8wFraPjgaSX6Z+Utt9Drth8Ao1/RfkPR8j52g3ebOJ+uD
	gfIjHpxxOMfNuUQ8giLw8l9nf+nacOQ9nw8qOsOfLtDdoXyo/RItvq7gi3RfN2SNEpBjMr6pE=
X-Received: by 2002:a17:903:1b65:b0:2d5:3f09:4126 with SMTP id d9443c01a7336-2d64b13195dmr133230135ad.4.1787414957087;
        Sat, 22 Aug 2026 09:09:17 -0700 (PDT)
Received: from [10.66.141.252] ([2409:40c2:5436:fa17:e408:579e:d06b:ea4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f920659csm13104481eec.20.2026.08.22.09.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 09:09:16 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 22 Aug 2026 21:39:02 +0530
Subject: [PATCH v2] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-ti-pinctrl-palmas-v2-1-501c9c670e4f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQ6CMBBGr0Jm7RgYEMWV9zAsRjrAJPw0bUM0p
 He3cgCX7yXf+3bw4lQ83LMdnGzqdV0S0CmDbuRlEFSTGCinOr8RYVC0unTBTWh5mtmjyKUWarg
 0VQlpZ530+j6azzbxqD6s7nNcbMXP/qttBRbIlakaufZk+PUYZtbp3K0ztDHGLwMYtNqyAAAA
X-Change-ID: 20260822-ti-pinctrl-palmas-ee56e29a3d43
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787414949; l=10808;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=kdC6x95hcZcj7NjvRK20sOu8F6ePIwl0dUoUel+qQcU=;
 b=dXP38fstpOQgyvcz387fCGKyA9FUpsnebSAN9Yj1CgFP2c3HRbOzCDrvgkxBY5Maxioei1c1+
 JV+9Uq9RgfQAocRpLKtFghpcjhgzmS3IlrtPbDSDITQd4R44FDvyRbU
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI Palmas pin control text binding to DT schema. The legacy
binding allowed any subnode name. Restrict them to standard prefixes to
prevent the validator from accidentally evaluating standard integer
properties (like phandle) as child nodes.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Removed legacy text binding which was not removed accidently in v1
- Link to v1: https://lore.kernel.org/r/20260822-ti-pinctrl-palmas-v1-1-a4d49e7f2dab@gmail.com
---
 .../devicetree/bindings/pinctrl/pinctrl-palmas.txt | 105 -------------
 .../bindings/pinctrl/ti,palmas-pinctrl.yaml        | 175 +++++++++++++++++++++
 2 files changed, 175 insertions(+), 105 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt
deleted file mode 100644
index c28d4eb83b76..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt
+++ /dev/null
@@ -1,105 +0,0 @@
-Palmas Pincontrol bindings
-
-The pins of Palmas device can be set on different option and provides
-the configuration for Pull UP/DOWN, open drain etc.
-
-Required properties:
-- compatible: It must be one of following:
-  - "ti,palmas-pinctrl" for Palma series of the pincontrol.
-  - "ti,tps65913-pinctrl" for Palma series device TPS65913.
-  - "ti,tps80036-pinctrl" for Palma series device TPS80036.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Palmas's pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-list of pins. This configuration can include the mux function to select on
-those pin(s), and various pin configuration parameters, such as pull-up,
-open drain.
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Each subnode only affects those parameters that are explicitly listed. In
-other words, a subnode that lists a mux function but no pin configuration
-parameters implies no information about any pin configuration parameters.
-Similarly, a pin subnode that describes a pullup parameter implies no
-information about e.g. the mux function.
-
-Optional properties:
-- ti,palmas-enable-dvfs1: Enable DVFS1. Configure pins for DVFS1 mode.
-	Selection primary or secondary function associated to I2C2_SCL_SCE,
-	I2C2_SDA_SDO pin/pad for DVFS1 interface
-- ti,palmas-enable-dvfs2: Enable DVFS2. Configure pins for DVFS2 mode.
-	Selection primary or secondary function associated to GPADC_START
-	and SYSEN2 pin/pad for DVFS2 interface
-- ti,palmas-override-powerhold: This is applicable for PMICs for which
-	GPIO7 is configured in POWERHOLD mode which has higher priority
-	over DEV_ON bit and keeps the PMIC supplies on even after the DEV_ON
-	bit is turned off. This property enables driver to over ride the
-	POWERHOLD value to GPIO7 so as to turn off the PMIC in power off
-	scenarios. So for GPIO7 if ti,palmas-override-powerhold is set
-	then the GPIO_7 field should never be muxed to anything else.
-	It should be set to POWERHOLD by default and only in case of
-	power off scenarios the driver will over ride the mux value.
-
-This binding uses the following generic properties as defined in
-pinctrl-bindings.txt:
-
-Required: pins
-Options: function, bias-disable, bias-pull-up, bias-pull-down,
-	 drive-open-drain.
-
-Note that many of these properties are only valid for certain specific pins.
-See the Palmas device datasheet for complete details regarding which pins
-support which functionality.
-
-Valid values for pin names are:
-	gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7, gpio8, gpio9,
-	gpio10, gpio11, gpio12, gpio13, gpio14, gpio15, vac, powergood,
-	nreswarm, pwrdown, gpadc_start, reset_in, nsleep, enable1, enable2,
-	int.
-
-Valid value of function names are:
-	gpio, led, pwm, regen, sysen, clk32kgaudio, id, vbus_det, chrg_det,
-	vac, vacok, powergood, usb_psel, msecure, pwrhold, int, nreswarm,
-	simrsto, simrsti, low_vbat, wireless_chrg1, rcm, pwrdown, gpadc_start,
-	reset_in, nsleep, enable.
-
-There are 4 special functions: opt0, opt1, opt2 and opt3. If any of these
-functions is selected then directly pins register will be written with 0, 1, 2
-or 3 respectively if it is valid for that pins or list of pins.
-
-Example:
-	palmas: tps65913 {
-		....
-		pinctrl {
-			compatible = "ti,tps65913-pinctrl";
-			ti,palmas-enable-dvfs1;
-			pinctrl-names = "default";
-			pinctrl-0 = <&palmas_pins_state>;
-
-			palmas_pins_state: pinmux {
-				gpio0 {
-					pins = "gpio0";
-					function = "id";
-					bias-pull-up;
-				};
-
-				vac {
-					pins = "vac";
-					function = "vacok";
-					bias-pull-down;
-				};
-
-				gpio5 {
-					pins = "gpio5";
-					function = "opt0";
-					drive-open-drain = <1>;
-				};
-			};
-		};
-		....
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
new file mode 100644
index 000000000000..c07e3a782ef0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,palmas-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Palmas Pincontrol
+
+maintainers:
+  - Laxman Dewangan <ldewangan@nvidia.com>
+
+description:
+  The pins of Palmas device can be set on different option and provides
+  the configuration for Pull UP/DOWN, open drain etc.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,palmas-pinctrl
+      - ti,tps65913-pinctrl
+      - ti,tps80036-pinctrl
+
+  ti,palmas-enable-dvfs1:
+    type: boolean
+    description:
+      Enable DVFS1. Configure pins for DVFS1 mode.
+      Selection primary or secondary function associated to I2C2_SCL_SCE,
+      I2C2_SDA_SDO pin/pad for DVFS1 interface.
+
+  ti,palmas-enable-dvfs2:
+    type: boolean
+    description:
+      Enable DVFS2. Configure pins for DVFS2 mode.
+      Selection primary or secondary function associated to GPADC_START
+      and SYSEN2 pin/pad for DVFS2 interface.
+
+  ti,palmas-override-powerhold:
+    type: boolean
+    description:
+      This is applicable for PMICs for which GPIO7 is configured in POWERHOLD
+      mode which has higher priority over DEV_ON bit and keeps the PMIC
+      supplies on even after the DEV_ON bit is turned off. This property enables
+      driver to over ride the POWERHOLD value to GPIO7 so as to turn off the PMIC
+      in power off scenarios. So for GPIO7 if ti,palmas-override-powerhold is set
+      then the GPIO_7 field should never be muxed to anything else.
+      It should be set to POWERHOLD by default and only in case of
+      power off scenarios the driver will over ride the mux value.
+
+patternProperties:
+  '^(pinmux|pins?-[a-z0-9-]+)$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '^(pin.*|gpio[0-9]+|vac|powergood|nreswarm|pwrdown|gpadc_start|reset_in|nsleep|enable[12]|int)$':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
+        properties:
+          pins:
+            items:
+              enum:
+                - gpio0
+                - gpio1
+                - gpio2
+                - gpio3
+                - gpio4
+                - gpio5
+                - gpio6
+                - gpio7
+                - gpio8
+                - gpio9
+                - gpio10
+                - gpio11
+                - gpio12
+                - gpio13
+                - gpio14
+                - gpio15
+                - vac
+                - powergood
+                - nreswarm
+                - pwrdown
+                - gpadc_start
+                - reset_in
+                - nsleep
+                - enable1
+                - enable2
+                - int
+
+          function:
+            description:
+              Selects the mux function. There are 4 special functions opt0,
+              opt1, opt2 and opt3. If any of these functions is selected then
+              directly pins register will be written with 0, 1, 2 or 3
+              respectively if it is valid for that pin or list of pins.
+            enum:
+              - gpio
+              - led
+              - pwm
+              - regen
+              - sysen
+              - clk32kgaudio
+              - id
+              - vbus_det
+              - chrg_det
+              - vac
+              - vacok
+              - powergood
+              - usb_psel
+              - msecure
+              - pwrhold
+              - int
+              - nreswarm
+              - simrsto
+              - simrsti
+              - low_vbat
+              - wireless_chrg1
+              - rcm
+              - pwrdown
+              - gpadc_start
+              - reset_in
+              - nsleep
+              - enable
+              - opt0
+              - opt1
+              - opt2
+              - opt3
+
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-down: true
+          drive-open-drain: true
+
+        required:
+          - pins
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+        pinctrl {
+            compatible = "ti,tps65913-pinctrl";
+            ti,palmas-enable-dvfs1;
+            pinctrl-names = "default";
+            pinctrl-0 = <&palmas_pins_state>;
+
+            pinmux {
+                gpio0 {
+                    pins = "gpio0";
+                    function = "id";
+                    bias-pull-up;
+                };
+
+                vac {
+                    pins = "vac";
+                    function = "vacok";
+                    bias-pull-down;
+                };
+
+                gpio5 {
+                    pins = "gpio5";
+                    function = "opt0";
+                    drive-open-drain = <1>;
+                };
+            };
+        };
+    };

---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260822-ti-pinctrl-palmas-ee56e29a3d43

Best regards,
--  
Bhargav

