Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503033A59A8
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786262727; cv=none; b=jmeB5NjPZe0FIqV+b+MLyfRvKtBzzihB3dPHX7IGhFjlm0QCcTt69piGH0DfIO4SImbnN9d70x7/Lld6cQ2TMzVLn03qVopTmntLB5BcPd2XKw2VFOMKPfK7HaCUirKWjb/3xrDTjzAGthnSzSaw2686LDxDDY4sZxom8qh03d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786262727; c=relaxed/simple;
	bh=Qw/+uFlqwe+Ri4dxIy0hJ8UkUPqVo/buvKX8I+TDON0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xt9CHYAuKj6QvUqPKLEx22pqtvDzeFmTm8CN/X76737ZnfbJNfSQu6JZlvO/h5pMO64/q6rIuTvDvfRWQGkdY0HdnCqLdVdPdDXV9IyD2aDqk/gm7Vjy/5mF3rnmaapkrRu+JQYo74FwZ6B2RKirDB6YCLE11fyYzufJob5roFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsoIElcV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsoIElcV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf52d15d88so6553985ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786262723; x=1786867523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67itLQpWkT3nHAkDca2XQ66Vsg3pd/iTwYazZWQUnDU=;
        b=HsoIElcVjo7n5loDX3iwpksId4pjb6WWhhB+fhk4cBPLCeC5KsfYtq9zkZsUlqkXLR
         ihIDPytfvffbm4CdNcVrCnJmwdFIzoYhSCmCf1ScjJMfSHuuSgIE65rhOGCeAekqa8PX
         fNh2YKTPSbW9KydJwaC5oQdq1acbHpecNx5ZvPb6RxMX5U6B7O1jcEQhSv7cWC7gWDfW
         2ys4vdd2CFbHDLbK4y9VNf7+kLWIpMQfcLSfuRztnK7XQQejbxkK39VjmBkrdv5M8oeD
         3LMWNVTvx30dUCF/soIH8bPIqVIaRo7ZYMpk8S5VUvoPPKGgvdBV09qgKN5g3O42Aos/
         gcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786262723; x=1786867523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=67itLQpWkT3nHAkDca2XQ66Vsg3pd/iTwYazZWQUnDU=;
        b=PSSxoDPcnRThiAzhI+GoqhDgzLMSKnFunBJ+gV8fX+PicWBSe23PCuU2nENwWH1w64
         EOq09EVANbLIMgDTkfY5D75uhSWbGOhvGwbybWx81KwcK9AKdBe692vkYhmRPUMEbxqw
         7O26XCDfeQDpc46ZH4JoBNjpTYkadtekHR1oglUwxfRYYbw5t+KJf0WnjLpupNbF307W
         imZ3+oSZVeD7HPbNDT3fvom8Asrg0JqPgMcOqdwMqVGS9YlgzSWxXn5tjqXCF7HUu10f
         qDdbg0QYLluoUlfwUwz4ZvSSkVJ1Xcx3lF/3I+OiJW2jRllJJCKA4mwfngJcPhcVPl8l
         SgyQ==
X-Gm-Message-State: AOJu0YwJezh9wwCiZHpS+5hhvpdK8JLYveE5Cl/ylQQexhhF9ozpO64g
	vJ+ZSkmKd+lZhaHkUfqbrkAEQ1U5w7vp1UyvbdTR45GTB47G70dlYBxKTHzGR2l4
X-Gm-Gg: AR+sD10mCb6h8LN6nZBbT1V1Dp63iZ+guWLHstEEtR9NLyYQjXgaxLF6DnzyJydwr/X
	JEB9UdmY/oJEuNcRRcVHMqmauLuw5KmtyXqdwuT0V9+lbyOHHV7GnRT51FEgs8tuHVFB8PuEl71
	d7/mKJJuagrBV9nOipg1iZTJ2gYMrneh9SL97A8cVnFFfoWM2mUu//rOlEyJ0D9RheXbJ24iVgA
	ILcCKJhNdljYRBRZu7XAxEr0G2rzBS1q3yUO3UHuATiZ/rNcsF4HYk5nzcW6LoZXiPx9m7+XjHf
	VhE1EJ0rfU3WbucPaokefJFX0AVQi18+8P08tRqI3IEJPBDkgMvsZJR8+MrC/Rg1/e26Ie39B2g
	wcVbVo3Plb0XGHF0gx+DimzQhN8vy73vv3fAhSRnN8NkrAkOjFixlf/ZOmsKOWZn9WQu2lQ6ZCG
	sc3rznNZ+rIdaiPpLrA2M+SUiEnZqq9wzT/9aWOvdQ5lra0NjBhv29hGARK6PU3fKBsWZf/niG7
	zjXYLU=
X-Received: by 2002:a17:90b:3c90:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-3928236ff5fmr12382406a91.12.1786262722632;
        Sun, 09 Aug 2026 01:05:22 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm23315598c88.14.2026.08.09.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:05:21 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin controller
Date: Sun,  9 Aug 2026 12:04:59 +0400
Message-Id: <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1786262697.git.naseefkm@gmail.com>
References: <cover.1786262697.git.naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the binding for the pin controller found on the EcoNet EN7528 MIPS
SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
pin configuration registers have a different layout, so it gets its own
compatible.

The CHIP SCU holding those registers is referenced by the airoha,chip-scu
phandle.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
new file mode 100644
index 000000000000..574285939c9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN7528 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
+  IP with the Airoha pin controllers, but its IOMUX and pin configuration
+  registers have a different layout.
+
+properties:
+  compatible:
+    const: econet,en7528-pinctrl
+
+  airoha,chip-scu:
+    description: phandle to the chip SCU syscon
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - airoha,chip-scu
+  - interrupts
+  - gpio-controller
+  - gpio-ranges
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
+                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
+                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+            items:
+              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
+                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
+                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
+                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
+                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
+                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
+                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
+                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
+                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
+                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                     pcie_reset0, pcie_reset1]
+
+        required:
+          - function
+          - groups
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
+                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
+                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
+                     spi_mosi, spi_miso]
+            minItems: 1
+            maxItems: 50
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for the pin, in mA.
+            enum: [2, 4]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pinctrl {
+      compatible = "econet,en7528-pinctrl";
+
+      airoha,chip-scu = <&chip_scu>;
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      gpio-ranges = <&pinctrl 0 0 42>;
+
+      uart2-pins {
+        mux {
+          function = "uart";
+          groups = "uart2";
+        };
+
+        conf {
+          pins = "gpio28", "gpio29";
+          bias-pull-up;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio30";
+        };
+      };
+    };
-- 
2.34.1

