Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793993787;
	b=chBP5E5Q0zuAGTwOdJliDGz12n96HFseljTb6IInCaa8BNf+0Kb8JVb2/j4gk2kvNiJG
	 0kgE2BwwbtjrATb9ehxMi2IDkDyAEwCFa/fyT3Pu8Bn08fLs3CKZ72nKQQQO9ldyFV0+0
	 aPGLASPxfW6e2uYFXl/QklTO/gaQWeIBFieitWagyLt2lbKMywWg8FTJlZwr2ZLh1P5e/
	 PrKkBFFmW6XC/eI0reiBNGBnRrLc9OKp2pJVmQVyw6Zq5N/7GpIlfe4vuunqOSVaCjIG2
	 rQQ1n89zP8NRnf+sgce6rgTRlKNc4k/mmG4fpmkBcywceKX31jqJksMa6NojoMNrm/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993787;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=HaDvqqM1aHY770KYqszI2Ek8CtfQ6a2OxvtP+NU3+wQ=;
	b=YKfpFj3pByucupCjtdSwGcwzEGGEG/zD+S4vQVQCWJc4LKdSStxKId0UiP31fDTUoGvy
	 EL2qdzUwUiLjdZpb8Hj9t+grimjNRJZdshI3rHjtXfPTNZvR161ay7ADK16azzIsXyruz
	 hW4h+oDSMC8QcQSFL71nnNlK2MT7WKxTVNgbL9aZyzbULiseuVCbdbfIrjSyjOHC06/Of
	 lQNhLXOYS1BiPaNFbcgLPhuF/DbmnKPPZq6PRNM0CE1VLL5rZqbL4RZNZGT4P14KMWUxI
	 tD1AaepOMvNvlrtzL+1xBnDiDnqf9FaE54xj5w6uMPNjSxEcbM15L0D/rwVjlnjILpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n68uJ+U5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9B6606A329;
	Fri,  6 Nov 2026 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n68uJ+U5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793993787;
	b=ET3kLOz5WloWf1li2EW/6t8EVVKpGxLZ6fznm8tjtXUvqIwbQ+LuPPEsFqOUbTkmHTdD
	 BkQ9e01aqQhxpQDvArH1zlV8jB2My5R13//cj3ffSm+5HYVeefep77AbL1bd23SnkrJmi
	 ik/x4lwOF5DUgVnwYA0vPkoMEQdI8YoQ1Dt2sWJClk08f06qJvPcamGCBjWR4EFK313g/
	 kgDxBUUj56nkdM/UgxdZGg93e/jK/2OnPCaw2smG+5vgMsuBAMDZaAbvKe0nHQMe5eGOz
	 dnn3KtxRwUHPOJIg8rOEG7rqnmVIPN3hnmYOVYrIf904kKc5NCg2cdEWJniRTOOuV4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793993787;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HaDvqqM1aHY770KYqszI2Ek8CtfQ6a2OxvtP+NU3+wQ=;
	b=LYdM64DEyk0kWJEhQBdKAwxQtSpUwsgj1FdI6d+5K6QHEuZfxgsXyPXEyW+LBZVmTVfA
	 LzLwc8HGSw3XjBq9AVotm7+IWTWkCD01gZzw1onqkEKufCdtiGlohe0H0dl4v56G3iDsL
	 DmSZPkfY3dN5577bByCxWS19r6ll59AoTOaqXsHmw+PmVNoNCQPuPCNWTzDrc3yVp0lI5
	 j/Xbvw8Eh8f/LVDrgYczPyKCHV70j0NYuUQC1ESdPA5QHJG7zFDXSgRd0GF0p6gX7q3Ni
	 F5cC39W4BZ8wxH9zoos9kC6bCGwj0cNvTW7nGfr3GVHLT62Yl/ZLoiwUET+NzXXhiZg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BA901F008A4;
	Fri,  6 Nov 2026 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793993787;
	bh=HaDvqqM1aHY770KYqszI2Ek8CtfQ6a2OxvtP+NU3+wQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n68uJ+U5eFp5xCb1ybbQb2QmwrOD/Yy8TBgYcViRNPLPsXvBvKEmorHiuaYujc5+S
	 FPqdBx4QpbaqQXSRV3qhwITAOlbfdnMZqjHprYOTVj5h1j/K0gpGNaGc+WEEd+hrWo
	 LUMu2nKz4OW3jjfdlVR5MoLjlePMgQzHnyrfMX7WCfnGoBnsvcd3HuG2TIBYQWDkHF
	 UXMdpcQYoAP2ORVoo+8mV/Yapa99qSK1Slf0q7t8D6Wf+As3CBi5rEDlXc3oDmPutt
	 ZqnRqpHjUsUoOAk64nAU+19XNSfEo/49/dFZvFrcIq7TTNh8LRZy8rvU5ONRDuJ/pi
	 3Seg44L6t3FQw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D95794783A;
	Fri,  6 Nov 2026 19:36:25 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 07 Nov 2026 03:36:07 +0800
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Zhihe
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
Message-Id: <20261107-a210-pinctrl-v1-1-6ddedfb0b76b@iscas.ac.cn>
References: <20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn>
In-Reply-To: <20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793993783; l=895;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=NfTLhXrzvQ5lJQxz8O7S6dCaG/HAPcHpRM6wkHRi+5Q=;
 b=jXSpmF5KYuPWmqUmA8jIye9cqYSZ78cKrjemBzTsQkLr4lAxawkA/NLoOQjMABq6qjFLYAyei
 vajxHFbcLs7D9lJUYcfjl+eCyQSqwyV74P4gAQNdWJoT63PX2PPpf/7
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the vendor prefix for Zhihe Computing.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..e6db332510bc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1995,6 +1995,8 @@ patternProperties:
     description: Zealz
   "^zeitec,.*":
     description: ZEITEC Semiconductor Co., LTD.
+  "^zhihe,.*":
+    description: Zhihe Computing Limited
   "^zidoo,.*":
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":

-- 
2.55.0


