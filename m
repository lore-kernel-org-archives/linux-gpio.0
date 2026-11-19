Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795086189;
	b=s3B20ozMC+m58joOzXQBNFLXDpL6vmvNZ+pC8uJbrXgbYdQLYNTsWMXmAkt81GkO7OBq
	 4gYY6aFIN4QTxIggaORotuFsxLBex1CO5hjg5phTmCZKQISFgim+ZgOxAicMBjxCas3w/
	 OMAiaEvXJK+v1uGMLc67Dl2f8IwOGuFPmZvr8HdhZyUHSSvd4Gkis12sg5qyD03sR11/8
	 ahS23SArMyCil53cn2rVR5O8427K9Nrf6V3jwO3JvFihrbKRMNUsHMzJqWZZJ+PH1o5d1
	 3KRazcITq8hBg+wXz7kGcrDhk/DTk0nP9C4OvEMHFmk7M0E2wgWpxht1YH97hYCPx/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086189;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qNGnohMiCzeV/2nST/vZxlru2Awqvea6Nd2NAaEq//s=;
	b=RktO8xCtXHZaTMLRgWOM+LPS5VQRAaXzuE91P/mg4E9vBPf4DbwCIwmQ6LwOJ3DvqOMq
	 PIiSVNM3APMAKaq4vPDo86xvPGJoFQIPZwN9MVebi29OqJIHSfP5DZpYrRQdNztoQJTCM
	 2dUgWvG9QLu0snoLzET6knPMFzML0SswKrP3YrpchI5rEblFIz3wo/ciJypf/DE3bvV/O
	 2UhEpQOYlbC7QHhbxaPRMoz1J8CMzAg7+qer8aBPl+0kvgD7atZQDHVhnI27kMxhCRHH0
	 b6pv9LaIGJBi/Luls1+VSOJHTaMjisnXhtwCbNVSLr4/vK0XrVLMRpSnhVukQr0lUSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MS0IzOOU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880E1606A320;
	Thu, 19 Nov 2026 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MS0IzOOU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795086189;
	b=MAA9bqDNVxc+3W6ZaI6Ay8LE83Sy8peiPITUAt+djcnq9X/jO1xSbqz1whIpAQUvnxm7
	 EFB0+/n25zWHoyFG6CKmMFJIwcDbngvLLlKyh6QfA7taCMYt6y8nxOY1b/aBswmAuc42g
	 8TZLaVlHb0Cgt61s9gE0wDGSLfuu8MChFOZ7OJeBm+yfzvaU4AolISA/QyRVqgLRX3jxX
	 7ZMFYyY0drSpR0BULiq1jyDyw+iDbr7wcUwBLJIOdAQjhyLFLf0hJhkaKrxJsWtb+0Dpg
	 /xxEmSgouCFsD/xiS+IAuHiy+42mSIHDuxE4AEyfHeeRaInLmyyg3oEoxN7pKoS9idQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795086189;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qNGnohMiCzeV/2nST/vZxlru2Awqvea6Nd2NAaEq//s=;
	b=1QDRhFKP8zSxl7dXQKPRqvRELV0gYlIQSapIzmn20NY2NxgouDhAwS9ywRRReHmb32bp
	 DuTRko8Cb4rCCI49mM8w4REPq5NQgULrSy0lEoMRWAMnHLkHMKmNyzaSeG6XbxxlS01Ef
	 DOctQI3qykjD0CQYEoO/0sj11KAFNPsjuJ+yOKuDCGWH52NbzhO/EGGzsF3DN/CLO0hmQ
	 n6CwgBjxv3J584NVnSsB8LqjZ4dtNxJqJzbUSZoatPikYxUXMhi0UvsSjTPXXyjYBy+cp
	 qTVDEm6YFpatOjBfXGLgue++mRZfl3Bvdmb7U9cNEDzehjXfmf7EqfTarxMSjZz3VTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA0A71F000C7;
	Thu, 19 Nov 2026 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086189;
	bh=qNGnohMiCzeV/2nST/vZxlru2Awqvea6Nd2NAaEq//s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MS0IzOOUK9QBP2zCQofQi+1b5BXor9HpiesakmJ/BYy72oKVcOX7UFUCBGDLr6oU1
	 X/u9OXybkAZX3yHYB92PKPfeXR1hkZDk1eD7FImw5V7UHEZdWGGSZR6ygrM+BajaZe
	 Khrtwzqi3Fa2tyG5h7ucMfG8mm7E3lBb53WMMMOsuqsgwpshlFZw456oh0p4SoXIP5
	 6VRvCo1kb/gyFl8zJOKFgNPIx5lfmvEFRyxghBmiTU5YDDUyOLxEAoat/KSbsuruPp
	 qUQoVKMz1KkJyXEOr/u+CStqBGn609fB3m72R3F50NpWOmeanCNYG00+8dyfQTEfZu
	 LQKrtx/GV7Qpw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 431404B266;
	Thu, 19 Nov 2026 11:03:08 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 14:02:49 +0300
Subject: [PATCH v5 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO
 controller
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-cs75xx-gpio-v5-1-8d14f2bb614b@gmail.com>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795086186; l=2247;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6OdrTQPhY1jNQj4i0+0IbDQKAnU7nQcBZYFWTSNHycw=;
 b=DwwXCNuzU3x6pm7aweLuak25Zy4x1XAfQug/Uti4tQFx8EnQVefrqxuwliuvScUT1/rMlw9+n
 GzymnxCR07MAb8YmunAo9X0SZAnRUwKlWWza6du7YGvGeGoG5DcGOn7
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
pin is shared between a GPIO line and a peripheral function; the pin
mux lives in the global control block and is not described here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/gpio/cortina,cs7542-gpio.yaml         | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml b/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
new file mode 100644
index 000000000..faa302180
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cortina,cs7542-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 GPIO controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The Cortina Systems CS75xx (Goldengate G2) SoCs have five banks of 32
+  GPIO lines, each with its own interrupt. Every pin is shared between a
+  GPIO line and a peripheral function; the choice is made in the global
+  control block and is not part of the GPIO controller.
+
+properties:
+  compatible:
+    const: cortina,cs7542-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    maxItems: 32
+
+  gpio-reserved-ranges: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@f00701f0 {
+        compatible = "cortina,cs7542-gpio";
+        reg = <0xf00701f0 0x20>;
+        interrupt-parent = <&intc>;
+        interrupts = <7>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
2.53.0


