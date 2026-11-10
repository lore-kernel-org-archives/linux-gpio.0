Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285167;
	b=IgIpF6PV50QNM1J//YWC+SSbJbQyqnmDpnZV7DONEXVAPPA8DbTw/mHetpf//6vwCjPa
	 M5jKSyMK/yhIbqv7MRzN4PxkvphvNOxz2q8MqD57gy1+bE1msBtSC6g4fwjRKYR4yBhqB
	 c6GHSW1pccjzGhXdvzkUnMtG0ACwSpq0hmxw2kotULDzqItRxnkkAk5fWOZ+fKSESV77b
	 OCZ14nbJXK7E1l96AiZrKg8YOwAK4jJDHCUhXTfa7rM3BcFdUR9Lai2Hwj7zU3ZaHYNlM
	 HyNRYlfGHbNaCZP3AByNHFUZZy6ORFG8UUtFgpo5VtaQv+uO9dZe6zxDPuPt6t+Apag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285167;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	b=OkJ7nXMPuct4uK9nxJzh4070eON21eljqzL8rvPMb4G9Tn1IYPasvlrFCQu7LzMveTq4
	 J42QTs989vRnZ4kL9eCqRXOjkgnga6/AVjXPThRzGDiXS/7GkmTm+kVtttTC/UOU34P7D
	 dhRtkefPwI4HJEzFi8KvRYDFcL3/T9O72Ou7QUwyoFcTJGZGYuUdM/vvwcz6b6OJu7h8n
	 c0zcNzQIWg2ao0aLYeUJdiiHXIRZVPeebXEvnZl81oCnU/JePM170xlHSP/xv5rW88e2Q
	 jwKHepNF8WhGyepWN/hY4r/udMS/CcEuiVXi8QrxHs07NANzZN6BWZ93oEc+QXQUM6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6fGGLds;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADAC606A334;
	Tue, 10 Nov 2026 04:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6fGGLds
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285166;
	b=1BSjJkYNuVnN4vum8SXQ5lWPd0XtbJ88+86K/y8dO4SCGhPoACQyvPclzXKm2XzL5kcd
	 LEAgv3TjzV9tq3JFbtSxoEOlhi5h0P/0Hgl+EaaVPPcUgNV0f4G5PTTO05IvhwlUSfhgC
	 UIHaymGMAicf1bVMkVTVWxBC1Oj2r87vCcWaTrxaPzWZ/F1OInoe4reuQA8S+goZaHjFd
	 9KYhl/9zn6pAC2cKiu1SS8hXiPoQ6V0SvhiwDz3mssgW/lr8tZ/LUHNpJo4eWuCSXqXkw
	 U0n6JKjMv2Gjz/xdFcXFd3swx202YWe4JTpDT5wArIdlebK+Ft3tY4xtXG5pkl5rqwA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285166;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	b=igvmpmmVJq1/GYodj5Zn6xPRhiqy1qDMJMrWW8O7FtHLAtXphChITlnW7w/fsR/HpNr7
	 j9le5N2Y07+6+ey9wMvb5IaQ6RF7PRKOuhjs+/yqrRPqLsGt5dwECJ8sKYSSi7hpKGH59
	 mH/UXqikDI9eSi7qD4e0uFQpEanErmg0DByHnPiQ0CnZVuj9ADEwhKsZUOYv+s7bOP10r
	 5xe2YVaoNKH1OKUxU4WJ0v2AyNpJvkYoOR0ixIZ8pI6JT7W/ZM/R4lDqqDn55kLHtDVBG
	 FSvUfYGjPktCuO47cdqZh6f/QRpgwDPq+FF5UwvBIu+VJpeWrb2IMdUTun9+my2Pgtg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1711A1F008A1;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285166;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=f6fGGLdsLBvYbaMw0pk5B+GLv67csbQuODztRr5M7Ezm5a3BBmkuN4I5JxGlOIVxk
	 wAwUVlfnj78VevhwUMTlPSPApwASHLhudQKSTOROZZt3+8E4s21IqvY1wtBd/Q2tdd
	 h1Yo/ddTgJ7DlGgG0iWuuHA90QrYZcz2wXzhpc2M9nXPUDIgImGzxbPDVqREmj2+/H
	 XRvNJKAlCG+1d7NdoQGsZJ1/PD3kr8fyRAY6vBq7Mrpp194oSACWBeYF+BzyIRfQNJ
	 280sn7hpe8XdNTUUSabMHutJd6Gm7nemCHPGyFSdxAsSqZYdL3wk1UlhtR7OucCqs7
	 MUUdexrMsrO3w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8F8A648851;
	Tue, 10 Nov 2026 04:32:44 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:26 +0800
Subject: [PATCH v14 01/14] dt-bindings: gpio: pl061: add Ambarella CV75
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
Message-Id: <20261110-cv75-gpio-v14-1-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=2175;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=ecrzSAMMaNZiFiJHNHyvnNwBNYVIUrMbREC+e46Wpqs=;
 b=H6GUr2Z/7COpyrIR13z6KmzvMPIPlforcPHrCAJALcgCcQehYUrJX9q5s0UzoE/BhFoYva+iA
 2dik2rOoTXQDr7mbDNnyMX0h34AIrScO8BxJsNab/g/olOqLybRXLoV
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


