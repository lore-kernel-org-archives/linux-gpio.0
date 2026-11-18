Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987756;
	b=zo1l/WLYJ2+/FAGnzHDZY4MBZ3f03e5Il5yU/dtRr/yRiPazw0iXBFHs0QL+q3rbwymI
	 ucMEPWD+qmjtxKlFRXWWL84dJJ1KU4h9OWh3N0rhNXwL92eyDzQqDjrKkUJZ14YrTVefu
	 cfE9eZGL+m4N4NqsIID6x+QM3C4wd8pod9XJHLrFufg/QDSGEc7gKlYFxJc2ogNmCIYlD
	 OcT7mnQgksKbZDMOPPHw8QPtEi0xWdO41Z8iP7qFOqu11HYhtvukm8KvX757Ss/iMdqBO
	 FfpelUxb3XEUxeA9ITKPNU1oLW6GC1g3v/lEtuGo0Hhzgcq+5WeipA4QuqbfMSSkDKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987756;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	b=OFbWpFw9+l1Ah2xepeRyGIioF8dc5xjG0aBgsWb7gHtSsFiwyEVufn0rsYaJawLi6TjW
	 PLcz9UJA98oDCnupKMmarbCtXX342QuU5oZzNvB/07RnzcAa/4Y1oeo/Wr11Azs8irC2t
	 8m9L/NdzdmXyOWopGZjCADv+oZP39nM3IxdtHO2Qoy16OkZA3KlkL0qnha92Gc8t2t4x+
	 Hu+0kVq/Nn6/k59Y7PxinHLyMKmqi98ldGYONvmnXOw3y9jy5Ais3eojbwH2v+zKCHQYo
	 n/Xhir7cUJBaODl4rbUsfpD1NQPukOlhPrZNM/NwjHyGJID5MrPaZ0m40vgyLU71/XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfaSfH+U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE6E606A325;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfaSfH+U
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987755;
	b=NuUtBSk4sGkz4ZGV1keLOqCX8mJdW6fOwW/ko0vB0zkRmYNZHCXWfnAdmbMFlZDtXhdP
	 A+JbzVJzITGvkruXmaljrj3kjuCYuKO9W8wJayvQ3TIK1xyQ6ifkYPkd1qWIdbGuC/T5e
	 HE+q9hVPXiTj+VutmciVg6BCY+sB+kOaegwNV6fYiAv6TTbamwLux6rBvbqQlrRqvCtB6
	 hB6QT5J3QyJAIQUaiA29z9TtNVeBultAoFilAxHPl6zTGrhqcr0xp/dwQt/BGFLNGS6BS
	 eoh+vZM0Sy8brkW1cTGZXuerVT0T/r6fPaS5qW2BEFlO3Dk1/75rDnHnScnASOaJq8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987755;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	b=DDYnEsZD2d+VPkDAtcAyaMrf71K+j5vsXXx2Oq7wvWARNJLuIPvVMM84qSaZZE1Kn0Qq
	 ILfZ/ocsKByV6rUA6+dc8O9XSJIrfcEsN74uryzvOBx5vSREOooUGYKGl6EddW5Dw5bID
	 rgTa3HtgnSStthfS64OAcZ6MmAjmCnoOMnGtTvcgfM7aNJ7ygbzvblrltexYYqUW5cixz
	 UhiAgZ9gYQ8jlNxFbhxJ4DjioPx7gHF+a4yJEItwYvVqU2DQapR8gv6Ic00zdU8zayzQp
	 QIjzlnVz9pIAuj1rSN2EL5fp/+DaVPqk4jucOt7LqNxsKPcYmxlNIL9G6SqRPl1rEAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B0171F000C5;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987755;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bfaSfH+URZE1uMDDpEGTjh203XluL7QtQ7fDfMfrX6+WWKg150H8hGP5LXVWazenK
	 RhNhSGOFIX3MjxGxgdgrqj0poaEw3VD10FfAnMZguAiDGRfX5h8AoB/fFPn3mimD+O
	 H6hpPnZ5aRq2BKEwAvvlu5eclNll3r3zL+Ybix5nK8hZHVtExUXuxvm6fyJ2/fMuPU
	 nZ4/qSzfQJ24f1gEkQm7zl7CcB4i4A0Og65BeyO42+UvBp+MWIdqpIRAfc3AVPg412
	 UVmgp/WGc9iPBAvp78UO1RRZOJvt/Z4oA4qYdZ5UVViRxgA3pYlSB0YNHTU5ejPjCY
	 HAsChOj/UPzvg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 890904AC54;
	Wed, 18 Nov 2026 07:42:34 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:18 +0800
Subject: [PATCH v15 01/14] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
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
Message-Id: <20261118-cv75-gpio-v15-1-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
In-Reply-To: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=2175;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=ecrzSAMMaNZiFiJHNHyvnNwBNYVIUrMbREC+e46Wpqs=;
 b=QUgPm/Qa8dTT9OYziUaZaXgEFrbgqlGTJ/PfC3H4v6LT3Qutf/pJY1a12qBZ+dDPV0rfiNAVb
 nIEYvIc0xw9CFMO3HfJaSOBt+npEgx+/xTXmiE75Syq6xLUEMf0csqi
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

The CV75 GPIO is a modified PL061. The basic registers have the same
names and roles (DAT/DIR/IS/IBE/IEV/IE/MIS/IC). Each bank is 32-bit
and 32 lines and adds MASK and ENABLE, so it is not
register-compatible with the ARM PL061 and arm,pl061 must not be
used as a fallback.

The AMBA core matches the PL061 driver by PrimeCell ID, not by the DT
compatible string. These blocks do not implement the standard PL061 ID
(0x00041061) in the ID registers, so arm,primecell-periphid is required
and is fixed to 0x000e8061; the driver uses that ID to select the
Ambarella layout. gpio-ranges is required because each bank is a slice
of the SoC pinctrl pin space.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../devicetree/bindings/gpio/pl061-gpio.yaml       | 25 +++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
index 4d970e55104b..c22dd8a1d2c1 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -15,7 +15,9 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,pl061
+        enum:
+          - arm,pl061
+          - ambarella,cv75-gpio
   required:
     - compatible
 
@@ -25,7 +27,9 @@ properties:
 
   compatible:
     items:
-      - const: arm,pl061
+      - enum:
+          - ambarella,cv75-gpio
+          - arm,pl061
       - const: arm,primecell
 
   reg:
@@ -64,6 +68,21 @@ required:
   - "#gpio-cells"
   - gpio-controller
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ambarella,cv75-gpio
+    then:
+      properties:
+        arm,primecell-periphid:
+          const: 0x000e8061
+      required:
+        - arm,primecell-periphid
+        - gpio-ranges
+
+unevaluatedProperties: false
 
 ...

-- 
2.34.1


