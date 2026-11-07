Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794040505;
	b=0V9XAr0oTzvRpmbazX/06lRfZViX1QjdWKRWl//IrDka3AgDbTdqp4a0ZOBRaqW5EFtn
	 H/j8QSebpdW5wQasOKspudz19cfpuGpUcJyCNqc7xJKB/aZjxBTkm29xMnu7YQMzCPQqv
	 7veOIT59hJuk+/Ru4o1qSEc3uccEoARUAP0cre1tp7RuSAM3bhAlK4b2vfUe3HoxbQAAP
	 /d9NoneXy7FSi50TN2bwXdnvRk6Vz15gFRwz1Ks1WMaRWeCY4mG8fSHeCIeKZ8j8Kig1w
	 953P1vi/ZlO0ErK1cYgnlQigRCwG7UtlEEH7Is7OufUjXWnpWc1VfStzvRtCD3OycOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794040505;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=aXXbFIqeuNqZ+gcGb1wBjBrEJR2db0REnn66oJVi+ng=;
	b=q8CVZmraNbRO7bTnxsHidWTiTb0VULrWJ55yZtLIkNW9q/IuzmAUxEmjAYj0M5oZQZty
	 LIiHRmeRmqkkozGAVwI6hRDt+6/6FrLYwWK5ZBOTfTTE8L2ErRLHB9791Af+CkfkXr7Kh
	 1k30IuJiv0g3n7G1AtqV69zfrqjm421UHqQDO2RjCCxRZM6YgTkjUWF1paGA+oqNpIJnC
	 jYwwYZpO1ccP77cSQsF7WozFMEQELSfGqygANCp1z720Qk2ZuW6HplkAvW2OvNMh+eNVd
	 maxfgZgTQY3IgxCSIMuITFS6JQZZeJrrsYw+WbOONUVbFSWw8DkxOeHulhtRrhqr2iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCI53vjs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8C606A333;
	Sat,  7 Nov 2026 08:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCI53vjs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6781F008A1;
	Sat,  7 Nov 2026 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794040504;
	bh=aXXbFIqeuNqZ+gcGb1wBjBrEJR2db0REnn66oJVi+ng=;
	h=From:Date:Subject:To:Cc;
	b=VCI53vjsIrd/IEA1+mmAlrhkEdAWLeO1Y1vTyyKnIjdU7PePP5OL4Ij1JlCMWPquh
	 DwrTJaPxlasnH1jw9Wf+QmlyTB2L+ghysBxD/tXOKc/1FvPHe7B78YlWkHX+TcyMoD
	 Td3CHvLBb3b09dMtdeD+Je+00vvnXzK9pqIufQNFv+Q/G7EbfCA321vGIZmFUjt32z
	 1ReI177KkjwRj3c28vdf1dkk6t2wuo8+R9yIREMO4J0+8Oy9gLN3K7u1mWGqy1gJmp
	 4mj0mDb3tzUF9A4ojsVJCp/y9yNFFlh3sM9d8gauy6Ozis7RYtE+zMKsw4Adk8qyUS
	 iRq0OaLvv23tQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 07 Nov 2026 09:35:00 +0100
Subject: [PATCH] dt-bindings: gpio: nomadik: Describe DB8500 and GPIO hogs
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-ux500-gpio-hogs-v1-1-123fb308fe90@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MwQmAMAwF0FXCPxtIBRW7inhQG2suVloUQdxd8
 A3wHhTNpgWeHmS9rFja4clVhGWb9qhsAZ5QS906Jx2fdyPC8bDEW4qFewlrE2SeWnGoCEfW1e5
 /HMb3/QDJZ74vYQAAAA==
X-Change-ID: 20261107-ux500-gpio-hogs-90df5d0ba601
To: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The DB8500 boards use a specific compatible with the Nomadik fallback,
line names and GPIO hogs. Describe these existing uses without changing
the GPIO register or interrupt constraints. Found with CHECK_DTBS=1.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Describe the existing DB8500 compatible, GPIO line names and GPIO hogs.
---
 .../devicetree/bindings/gpio/st,nomadik-gpio.yaml     | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
index e871149c520f..e70f3b5ce7a6 100644
--- a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
@@ -19,9 +19,13 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - st,nomadik-gpio
-      - mobileye,eyeq5-gpio
+    oneOf:
+      - enum:
+          - st,nomadik-gpio
+          - mobileye,eyeq5-gpio
+      - items:
+          - const: stericsson,db8500-gpio
+          - const: st,nomadik-gpio
 
   reg:
     maxItems: 1
@@ -34,6 +38,10 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
   interrupt-controller: true
 
   "#interrupt-cells":
@@ -60,6 +68,11 @@ properties:
   resets:
     maxItems: 1
 
+patternProperties:
+  "-hog$":
+    type: object
+    $ref: /schemas/gpio/gpio-hog.yaml#
+
 required:
   - compatible
   - reg

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-ux500-gpio-hogs-90df5d0ba601

Best regards,
--  
Linus Walleij <linusw@kernel.org>

