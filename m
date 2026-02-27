Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F39437FF6E;
	Fri, 27 Feb 2026 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203996; cv=none; b=MXEEXgDoq8zo2aK0qB09E5pjAj81AR16L7UyqsR+nZhusflCYs2xVvC9zafIaO4BIEiNWWGFVkfl5mhsiS10vOBSi9EncnYEkc3f4J2e0CwLD7BoI374orSuVd1Oypd08HMyW/dtGAAe658ntuKg1zPj9IkhMmMl0LY8Qq03F8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203996; c=relaxed/simple;
	bh=gZr3gd4dKHEk1atNC6Y8Hfnb4BhiyOShXXIcekHSLK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hePlCcZx/7SrfmcOpOxrPmDt+yRcJjY9hYJr5rvbUta8qYpdrOImgavOADVC0ntPq2gAalVSTGk5joQlwaLFyahDscKMOI2rsWB3BWTDGxhT5XxOG0vCiKC2Wq5YWCGLuhhEOAkHTiMKTnCCM1Fu1zVqi8FfULH3U9KFcdyCdmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toeEeVAC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toeEeVAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71D3C116C6;
	Fri, 27 Feb 2026 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772203995;
	bh=gZr3gd4dKHEk1atNC6Y8Hfnb4BhiyOShXXIcekHSLK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=toeEeVACp97TzY+AnJj5gh6vp3y+tcxanJViZSAGccv1N0O3HPT1QdmjuIbNjRd9u
	 7JHePF03O7W0E9Kk6ToJ+cwflQKiatU1X8XsFzdQMa8T6lqEtOR+MwBn9qSEOmlHG5
	 nqjpSeQCU3H3yCJHznrM4nFN7cGMbVukAiTHjaKXao1Lkp/N1bRQ2+nrxpFk2b3syh
	 3G2xUvTm8i1rf5wqx6E1xs861bSgWOHQkfhm+xSy6nN5q8d2BTpD+04J5oHeYi88K+
	 vjEaoGyUT75fMo5poFUOJ1u1g352slacQ6jEK4HCURHSKFKIHRCiughNHjg9w3fn83
	 G2csBXUni0hEg==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v11 2/4] dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt mux
Date: Fri, 27 Feb 2026 14:52:28 +0000
Message-ID: <20260227-unbounded-disposal-dcac091b8ec2@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227-ajar-wolverine-7ce1ebd79821@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3811; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=cNmHl/iHdChyACOE4c0qhyqCGE4DhF6jDYYYQU1loyQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkL16+91XzEWiVr6elDZ2YtPMsqz+r/7r6ODIuJeO2RZ 5orP/u4dZSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiDomMDFcl99gUzTZVbvL+ zae6fP28L3pvXi+PFJ6Y8+zgb0dbpv+MDBd2bNmxoNhESeXKPZvFrQ65inWTKw1vnljuE1BXZOt xmR0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On PolarFire SoC there are more GPIO interrupts than there are interrupt
lines available on the PLIC, and a runtime configurable mux is used to
decide which interrupts are assigned direct connections to the PLIC &
which are relegated to sharing a line.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/microchip/microchip,mpfs-irqmux.yaml  | 76 +++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |  4 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
new file mode 100644
index 0000000000000..c8b0de9444dd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Polarfire SoC GPIO Interrupt Mux
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  There are 3 GPIO controllers on this SoC, of which:
+  - GPIO controller 0 has 14 GPIOs
+  - GPIO controller 1 has 24 GPIOs
+  - GPIO controller 2 has 32 GPIOs
+
+  All GPIOs are capable of generating interrupts, for a total of 70.
+  There are only 41 IRQs available however, so a configurable mux is used to
+  ensure all GPIOs can be used for interrupt generation.
+  38 of the 41 interrupts are in what the documentation calls "direct mode",
+  as they provide an exclusive connection from a GPIO to the PLIC.
+  The 3 remaining interrupts are used to mux the interrupts which do not have
+  a exclusive connection, one for each GPIO controller.
+
+properties:
+  compatible:
+    const: microchip,mpfs-irqmux
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 0
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-map-mask:
+    items:
+      - const: 0x7f
+
+  interrupt-map:
+    description: |
+      Specifies the mapping from GPIO interrupt lines to plic interrupts.
+
+      The child interrupt number set in arrays items is computed using the
+      following formula:
+          gpio_bank * 32 + gpio_number
+      with:
+        - gpio_bank: The GPIO bank number
+            - 0 for GPIO0,
+            - 1 for GPIO1,
+            - 2 for GPIO2
+        - gpio_number: Number of the gpio in the bank (0..31)
+    maxItems: 70
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#interrupt-cells"
+  - interrupt-map-mask
+  - interrupt-map
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@54 {
+        compatible = "microchip,mpfs-irqmux";
+        reg = <0x54 0x4>;
+        #address-cells = <0>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0xff>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 44e4a50c31554..276d48ba15f01 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -38,6 +38,10 @@ properties:
       of PolarFire clock/reset IDs.
     const: 1
 
+  interrupt-controller@54:
+    type: object
+    $ref: /schemas/soc/microchip/microchip,mpfs-irqmux.yaml
+
   pinctrl@200:
     type: object
     $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
-- 
2.51.0

