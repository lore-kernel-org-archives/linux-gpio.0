Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074769;
	b=V0LkmzMXyjXxQjWGioGSeJ9eZ3JoMIiNLfzTKmYbCmCaP4UpOJ1F9UDgvQgE9JBEyhkO
	 Y94xi5zaGnlyJnvExqTT+hPZFPen6+IPAZ07OnzA3IPL5UGgzyFuvNSqhNrFLWOqaSllU
	 PtYbyr/r6urQnLskWbeLjYNnFhckEhVB1MtNLcZi/JDxVlHDztwoqf2lT0yyYeJA9DXH0
	 ENyYv5JLU/8NnCiWrAfiD7mwoSC3AS/HzZAWQLrlDDg1YnEvbRy5QJeDDcC72I9ZEl6D0
	 LzFa3PMPh+LDlnIf0UhuZXhBFDK4Wrg/husvCcMvckFFh5yivAvnVohNyouDtLsaIQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074769;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	b=z0QDX+Z/d6j7ilkIA9mb5oC6FXM6QNv/gaO3fd2wIH7kjb++cTX1LJsslzGGKCr5LwZA
	 gT0cxkYXd/fDAnN54FJi9/4WDLH0C4BwsD0I7xhMZ+oMniiTJcpfwZQ06rks/yjJ1ZFY1
	 +nJTtFjJ+j8qvIct5MFSrXcdOWhBP0u0j/H63EbTWeutbI+ZQNSc71HY1KQFyfmq93niP
	 62Mp9fVengwcV//K3Ule/66EFJXaMP0u0nrBAnIzXA1GRRFVYx94MdZ4LYIYD6otUqzRf
	 3UURnKrtcHy6l3eoBRIx9Mc/68a4Xf6swMaFr+jky7228OtNS2N8A212FSa/t/yGk7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUuzFrKq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC946606A31D;
	Tue, 27 Oct 2026 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUuzFrKq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793074768;
	b=TAjUHhA9WzHywGY3aZ5vtZHHXT/bymxOYkh/j5qhU6gx5VjuqO9mxQh+xJpwZWHsucxv
	 GpwmtLU9fMnv2G8I3MkIyKPkhhYUnUCnlBdTwm/B0hET34lQdk0fkFLC+FjdKhT3LOWqA
	 UzBQwwP/foj2TQwUAGwC3uVxgeEmnMuFFDVPQsuw06+sZ/76xkoi9ngmZT7I3q5SUmwfP
	 R+O0kGhaytd/2kJnszVFkesgRhLUy9ffg/zdpTSkB/3YjxBrgf9f5CbvTOC/dGEySc285
	 Uno0+6ms1R198hps5um9OOHMiIfiiPlR/+f1VuN+HzFd9U0qxAcr11ozHY5l6j4/2Kg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793074768;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	b=AI8Jbkj+rCu3tmhEmAb7OMflTG6wgTpqcm49qzL5QhBtDbO1vuYSONMBL9SD+TIcFiSL
	 UJ93ESZU2vZcRHlsjb81NQL6IWTDFSq0OBX5bjRlOood5QKq8syrF/6KqXSjyFYVItHkz
	 AY2+7PkwuFxgKxF2uJuflUPFrcqy2el8u5qBM6h6BOMhtiPrjcNW2+rQaTG5oH+XP92UK
	 lgzEQNR4i1WqoCbEPtbledEsX2HMLAt48nOsW8Z5VfoMvHhP5OgFlxc5zc83CZDUhZE6P
	 rKoTANp4UPiNmdYkPaGwr1vS0G+MYstOwiy8pxJty27/Agfp/KPBte3MHzKR08uum4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 405A61F01825;
	Tue, 27 Oct 2026 04:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793074768;
	bh=3GqzT7SXZUXUviYJRJR+eWJ2kJqwUKNfSUL8dK6KjqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cUuzFrKqo+ZsBil8nM55rtipbjriN689pGNea8iAsyFHso995pHSNb49P9KVuYG8o
	 ucNex/14OEFuJ7Ny3fc/dgc5HRvza5xrfKOlmlDiGJCfsY2DJcJQRZaCABM4mEUGWQ
	 ZDhe3pPoyY50x/pe6B71jbnMOi2Mz6CTCfsknKVYbB3kI0y/6sqh1MjzqyhGj4NvS3
	 774eUDzoFKIihUOwVx0lJJoJmTBy51HOFN0vu8tl/RFg5bEf9lMSKXCI3FqmE6/fwi
	 F79na6AG6rhPwD46IJLbznTTpCtuyMF6vD4ZrAwyI+CTbZV1xqiX9JLWs3tiSFDba5
	 jX+HVHvQzOu9g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A403A44F4C;
	Tue, 27 Oct 2026 04:19:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 27 Oct 2026 12:18:48 +0800
Subject: [PATCH v12 01/11] dt-bindings: gpio: pl061: add Ambarella CV75
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
Message-Id: <20261027-cv75-gpio-v12-1-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793074764; l=2175;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=ecrzSAMMaNZiFiJHNHyvnNwBNYVIUrMbREC+e46Wpqs=;
 b=I9dstgGUQsaWlKSGSNAkDoYNGw6w1YBLgLOAuxIyYXYTaLxJlD8mc7Ei1i6vOJvcZQZ+CeVKo
 wezLXGPRCv9B9+igTwealDLVbngOa3A5niTW/p7h79XmV6Iy8ZwKYN+
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


