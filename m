Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC933E345
	for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787416755; cv=none; b=X9g4ergWWGqtqsis2BQ+HeCIbDk49t00G6KNIjpkaQfIxMKkITQv24veg8grQYAGvp8A+P0Q7GTcr8SD2tkiTJGgUyzUOj1eUsDRSWR1urb4VD19MapkW/JOTWG9pkAfUP00foAvJdKK+V4AkLTitHtmpRH0O5w6SRONm/Wqpis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787416755; c=relaxed/simple;
	bh=QGthBs2cYAse8hU3NfRheG6PYV/YVUrGjFZ/cvF+W1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rzXfkUTSXdCDoeegPBfMpSSVZPz+Fx1tvVtKsi777+IcVGkfd1wx/ns9l1fy7fV2so28TVhIx12PExocs5lFAKBESHS/Gke6ExxiW9vemioKtg9HJOvk4vSYqIrZ1Gwx59DdXsLJINZxYPYBs5HG5PJFisfVFhV2XN42NbO05Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hnqo5d7j; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hnqo5d7j"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d027b7c8easo4454985ad.3
        for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787416749; x=1788021549; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a8bdW9dJzKyEAw9N+gxt/IwMYZ7Z3SRgtsnnidiZoC0=;
        b=Hnqo5d7j+OezLmh03VBICXYnXocYnBaSNw7xcpAmfQ7SaAg19VUkw8psiQeGKz9yxW
         M0b3BhYwIfWybzQlosBSVhDSDABcyLu9I3CdW4sVOWvwZdMoLDLODCZJWhHboXrr8yvS
         CDBDOyuAlSVZ8fdteZxFvaNkeaaftTLSyGUZV3NyucRFgon1MvybfJzb+m42YoKN64n4
         Yj/LEKwmYAStIoaQaT9p4KJa279EN27Gze2UXxDRUiXYyWx5WhZuaGvZEFt3Q7/q5wjM
         Y+zSj22Pf2T1q9eEFwqYxE1RwZAEICZbQmsk2gVZ4b6LhOMn9+M/QAYVEP3YHo6jvFLO
         0Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787416749; x=1788021549;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a8bdW9dJzKyEAw9N+gxt/IwMYZ7Z3SRgtsnnidiZoC0=;
        b=UP2QgzFgSLyNjY0gficrmIKuYauy1B1VLaUhRK8t1E9HKZF+W3lX+lrHXaKusSPpxI
         W7mHLtIqWzQrfDH58uxsyyTM3QgPQnPvuSPklxKf2Ut6U/uaM8eE+c+2a1q8fIJo5T82
         0xroPYtcFxp7/As72s8VJhwb0vSMUhyXPraE6ArjGUSFZOArx9yet2A56lZ17uVb5YIa
         4pn6ztXgZBgg7r39hC1ArXrGXdGTE7+bPI3af7wDWVpOxAqPQQ1wxtrcfvDL8gtHe7ll
         HeJCYIVrR5MID8DhEb+vNhfbb7QJfmVOif3VYpTdaLD5a1jQxqIEMvBW5XMScCsHdBAv
         70Ng==
X-Gm-Message-State: AFuF++mR0eVIa6vwBN7gT0i/jjnWAzJS5CW/vXaNqAveyias0YpRbSTx
	gO9rsv2svK5aD+96nT4MOqfNDDT/DqV2AMFdkMnR8xgoo6EMKRhbPHz5
X-Gm-Gg: AR+sD12M4t5oQzzhKIgHne4WSxy8scaKcQp+655b4neoQfza5naOfVNypxjKjzexOVs
	47iS+OuvjoHD4jP7vHdaD2lEcJK7aubAswsOqBFr34uy1eWa+iTQjNGErXD+H4TaTCS1gSO/R+U
	eLAycWKnjoird4JSXN04JdNdorRCyPSxwC+UpRhGvyzPOfXk/FPbeXgcr1Nzq2UNInfe28Z78u+
	RLbEQLo3vC/yFChAA7vRVHVb+67M/X66KnRaCu+gwlhM1G+Gxv5OvQUtnSThAJWSIvOmcNrUN2Y
	fn8a5Ob+6KY8UOQ5PZiv0jMasuKkXnUXpCN3AR6sZp88LygnLskkq8zQqanvoHeihGFVgjiXGzt
	6Bkvd6Dco9Hg2twJ+3Nl5cMCp10uiwtgt4lTBSERWfVN/I4g1FmqVwGuW9O5gK4wJNTRcoFQP15
	DWkSDRbJUbWJb8D+wSrXi41Zof0+Rqzuu+4JWlHsMr/P64LOKkTLKe6Lh0GUbdAkN8fI6MUHU=
X-Received: by 2002:a17:903:3c30:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d64a9d1a92mr123326665ad.0.1787416749362;
        Sat, 22 Aug 2026 09:39:09 -0700 (PDT)
Received: from [10.66.141.252] ([2409:40c2:5436:fa17:e408:579e:d06b:ea4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9099ce7sm7625834eec.5.2026.08.22.09.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 09:39:08 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 22 Aug 2026 22:08:53 +0530
Subject: [PATCH v3] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-ti-pinctrl-palmas-v3-1-f92cd3b773fd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNTQ6CMBCG4auQrq1phwLiynsYF2M7wCT8pSWNh
 nB3CytXuny/ZJ5ZRSDPFMQ1W4WnyIGnMUV+yoTtcGxJskstQEGpLgByYTnzaBffyxn7AYMkKkq
 CGnNncpHuZk8Nvw7z/kjdcVgm/z5eRL2vv7SopZZonKmpasDh89YOyP3ZToPYtQh/BUhCobStb
 VkpMs23sG3bB4WIYbn0AAAA
X-Change-ID: 20260822-ti-pinctrl-palmas-ee56e29a3d43
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787416740; l=10951;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=QGthBs2cYAse8hU3NfRheG6PYV/YVUrGjFZ/cvF+W1Q=;
 b=o0JNR6e3Xx3heOxnMOyS3o7K0LieHs6iZ9eCUWee0+jyLS1kk8tp8ijBDRKua/ANvJ6/i98SD
 lmC+B3tla1VAcILtUx+/248Xda44ceBekBLwww+ZxTBpMb2qKh8fjcF
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI Palmas pin control text binding to DT schema. The legacy
binding allowed any subnode name. Restrict them to standard prefixes to
prevent the validator from accidentally evaluating standard integer
properties (like phandle) as child nodes.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Add unevaluatedProperties instead additionalProperties in top level
  and child node as well.
- remove redundant property definitions inheritted using $ref.
- Link to v2: https://patch.msgid.link/20260822-ti-pinctrl-palmas-v2-1-501c9c670e4f@gmail.com

Changes in v2:
- Removed legacy text binding which was not removed accidently in v1
- Link to v1: https://lore.kernel.org/r/20260822-ti-pinctrl-palmas-v1-1-a4d49e7f2dab@gmail.com
---
 .../devicetree/bindings/pinctrl/pinctrl-palmas.txt | 105 -------------
 .../bindings/pinctrl/ti,palmas-pinctrl.yaml        | 170 +++++++++++++++++++++
 2 files changed, 170 insertions(+), 105 deletions(-)

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
index 000000000000..11c2d429633c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
@@ -0,0 +1,170 @@
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
+        unevaluatedProperties: false
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
+        required:
+          - pins
+
+required:
+  - compatible
+
+unevaluatedProperties: false
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

