Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792482882;
	b=vAEpkQefwPxMVzbUH2k1JqD9S0znrVByHFtAADUK9O0K1bENj78gFX6hYfddXtR09g2s
	 tsviNeqKHxGV5+40PBG7sndc1DgKhSnVUJROi6JXnVajEsX8Qm66tcZp3WWgMREUC3oF3
	 MbjhQrFy7JlYMYjCh7Q/loND2MK7xKA1kBBT9X3AfabpcU/vcDPmgFydgbIozYIiRvXYJ
	 gOYokvcpNMXGNLM2wnacPJ79nXz2cwv4ec69aS1Hzg5OJzXKic+z+vJwfSFhoMCfQ+64x
	 RZJPL3s424XhgpvMqovrO4CQ9qZrb+oIiJ119qWD1+YcHCPASgfeRKd0+C17QWKstPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482882;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	b=ns64j1ysSt7QCM79SGQlzsmRxNRlYVGhSK3Ygs3Z/9umf2AJlv1ylkmjG64wOUcFwuam
	 o0mUQJEQWsQoSTfQ/cP30/kJnxks15QWeEx9ya3uk0UM4iC5+4Hrit50GAquP54RoLZ0k
	 TKBRrri8MrKgijf6vNhFoJSsYx24wcnTXigWDa5Kcx4OXisVB3UqgKK4gaOpFlefQjKVo
	 l/WREpTpeyUrieojVjm/+dEIFW8rq/yA6CQSn7DEKdSg3bTc39ExdMoHZH20ybD9O8/Ss
	 SgdidCzmI4Rs/i497FtApONLgkrjYdKC91+siJsNWRgusWC0EA9t5V3AknMRuDus/NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRvi82Li;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BE2606A31C;
	Tue, 20 Oct 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRvi82Li
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792482881;
	b=Gjcb63MI1z1pOri7DDOrfK+GaK8PrMMLJ7u90ZhUwiJDeVJKrOaaRZXU4H4r8H6VvvRA
	 R+3IPYhGio3sPvjZwgtD0a4QQEVqjmpfFfi/4eQbKCixnc2poGM3o7lx/LTL7MZV8Fm37
	 CJgn2djAaU/Ank0sUwVcv1KkKuYCjINN+fAryVv6tzU0qXT6GYCSbANZOmb2V3R7xaizH
	 /VORGzQ5lBxEZYZ3Tk1OLtzeaz/heUd5fcAvV3CTW2nOVtxaBNl/MMeHY5umUKn3sgZvt
	 DLgyWWnR7PgHJKS9KfiS2NUimZnpckp6xqjwwDjl0xTJJHzHB/ueTv7Ow43fBg+1TyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482881;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	b=lr1VQoFF8kKakyWAMJ0RPcgmrX7yhxu9yGDxS5NWY+w+TLlJPbtuLK9t2HSpkC9rvLCu
	 TVY2dlqiPYYwbysHfpc6D9af5pjCOMZ1pWLFsBHRQrVrXhprNRq7xOE5Ckit/Nf7zJPwA
	 4FTFIqGx3OSD236nxD8TRN8GvsVXggr78PkXf9yjj3ASM2ZxfXRxmgF4dPF7RYuIADFlV
	 k4IxpfpW6gFuTgX8h4T3kXyDJxZbFxm2qdrlQXIk6QIOA+btuZvnakY1rZG/aE9PQtLe5
	 qZ/QwvKEy+V0+yLNO+jmjoo5z6hBEsTi7az1HZSIpCd492LJ3C8oZXsspQPIvCu01Uw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C6E01F000C7;
	Tue, 20 Oct 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482881;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TRvi82LizuZMWTakwcrNYrnbsYG2NEBKalyLRcdcAi8HbpbefAbzdGtI3uRfigqlz
	 vfe0/tZJeypxMX5oXbLW76DMqU9u047doKdzEiMxinQTb4clbyBeI8X8F5+QAPSkx5
	 PzXBeE1aJ4IaoV9HhceehvuUx81BlTBdG7zcHjTsDSBI6YvWIl/LaTyaE5Sib0tnVp
	 +KckY5jBI1/THkIm/TznNxt4FL+6617pZ7ZcYKj864+zh5+5Ht/g9fLcIJN+ozuXCc
	 lsMAufq8XCXdHqpJZyLmrpQtAzzC2gqeb32nM48+aP5QE7F3GK26Ue3ELgLqms+809
	 zMSj2scCa6gGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 76FCF4307D;
	Tue, 20 Oct 2026 07:54:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 20 Oct 2026 15:54:05 +0800
Subject: [PATCH v11 1/9] dt-bindings: gpio: pl061: add Ambarella CV75
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
Message-Id: <20261020-cv75-gpio-v11-1-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
In-Reply-To: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482877; l=2175;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=ecrzSAMMaNZiFiJHNHyvnNwBNYVIUrMbREC+e46Wpqs=;
 b=YOYD8ndIEW5jjxPRKsjVacPtkyWhlYjHe4G0+bpfwyS7N7QGIaLdKr7PjB8EUbPIjQGA5Vdk2
 mEoPMlH4LPABS53ye4h/nsnXPNhcz8mv+DLap6gisDzmLUk6l4PVzdf
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


