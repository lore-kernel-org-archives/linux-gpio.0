Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602869;
	b=plzT0rtsKiq9bcThFwX1cy6CWAIAg521POlLpKNdL72LYViJrLRaDJlY/ghmP/1Zmy5Q
	 1GkGRzXYK/FbCZYslC4XtV5Fv9sSeqpLuTOW+SJG3qqZNApvr2P5wsrUPoWbpXg51XuRw
	 xTlGo5XkCN9bjyXRbGRED+EJzmyZVUGATUaI3AZekzhYjKmPE01Eh37XvwYKTmQs6DJZO
	 zszwpolIqw5T3m0nYFhBaB+WphVktDV52dNTmbnjNM7Iw0jEsB0b2smoYfOqKfH6uNmtE
	 Qj7TtvtGer7yTLVvazLStJwX7KOZz+4Wpl2c/sEdE4SMFEzmFEhpaR12ZIPQW97PunQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602869;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=;
	b=VUTAPun+Za5pxB/0U847zPQOFyW5BUB05f765c74Z7ip+Yj1Wm07RdwgrvGK5cikSdIm
	 TQdFxo2KFH03V6WwwgMxRKFCEsNQhr3z6gIWlHNLPd1V7pt8q+mUS5pmblHS5t0Wiu6Jr
	 /MbjKSxXtKIXf8cHLfpNxhqYrMSLgUSe2YA2Z38LuSNST8dMHpXPr8F1hjo9yAKeL6ZDI
	 TVDcsPEGEhfPJ4g5HIIAuTgZfyOipI/JGRAlsxG/cqCdh3wDO70JvMY3Ez49DgvT8+szr
	 TLMikqps/04Dpu2kxv7Ww2XNP7pnvt+CIY3Wx1nTF/IXFSFbI2jYUfiA5Yf3P7ybEEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fbcsDy/1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1584A606A338;
	Wed, 25 Nov 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbcsDy/1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602868;
	b=u7if8lDhP8HlHZkpUZ+nGmJeIAQKAtwyHzA+aDnerIaD8X/+RBO8nFiAfiqdTBTydhng
	 Ggev5xpM2ru1TO4SMzgUwfXGCj90jmtN7TkvKyUCsWlEojckwSAiSXJRdMNhFUW0dTqz+
	 SaB9O2yKLfvY3XA5JkARVwgMd83pS7ca7nStPfe0haqIOnV2MIIKRu3tyXJJsJzfppU3S
	 6w3aa6Q0tG1URM4ufSc0pZGROwHbAKrFMAGwbX2PyqKdhuCH3bXhxSlD/wuvwEkPrrrgt
	 LuZBJkIFNTyDRDXrFSjcJdsQjvys7SlNkFvrFe+sCqBA1z/hHsRzk9jxKBj2oHLg5wA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602868;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=;
	b=prxxBypH4Dvai4xDnsHJZXgHm1ICblZi/jFI6B6tcgYx9B7q8xuM1DeEMDCwV64+6vBY
	 7qlHFmaox/lJ1CZXe8dp8nklTm92G/6uR+eAqZQ4hPy2K7vTIqm4fQhrVtlyois3YMf0Y
	 hHNKXiZ6Njj/wsbk7PEKgLKRHthAo89vdDppJ7V+bzq/Yv806PXvIWh7xHO5zWSDZ6USH
	 OM1zO1jvJmcr7twKe6dqQowWAPHwdebo0ywR5E7iHPI47zKZuG3V1PUJ36JAJxtfUIdG8
	 wIzYztksuNeWxq4eYzLUuRgd/S4HrPrX7U9OsejpmPQXeWhF1Nh5BzhdlLXO9qEse3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38BA71F01574;
	Wed, 25 Nov 2026 10:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602868;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fbcsDy/1RM6JaTjTtzMRIroj51fymYcuYPNzx7U+A3VqSK7T5TNhIdgQvzUCWHe2S
	 /UOWTFNFqd6icqM/300ATbO3VevUUxEgRoqBdCf1vjIqYNdB0rvU+bL8uIsYTuwRd0
	 Y0ZvO+ma2DtVvh9N0y69gZUnnwYfpPh4GKAgPw/uFq2ky9DM5D3xT5xFs+E8BJS0Lc
	 eqzzPdPMuuygJqVc4OTfh36lGVoD9uSVXcV3OMAUVgQy4ECvTm0AgWOGH+htXn9s+I
	 7fU3p6b4VdHlMjfCfCclfUoam1p2+3NCTTOpHkas26yUEsvFixTaevNT0sz15KmoyL
	 dILaWuJbyrE+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4B6644CE60;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:34:14 +0300
Subject: [PATCH v4 6/6] MAINTAINERS: Add CS7542 global control support
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
Message-Id: <20261125-cs7542-syscon-v4-6-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
In-Reply-To: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=1145;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=451qyYBYGcKQBnv4zkYbgyAEFoN+lZtfxN3rOpF09y8=;
 b=7SwLJdRedUZdNTGMoRkhPdZqvW/+eAFF2+lVWXeaAGO7mvMncnIIxXO/jiDMvff4bEPKnKzYv
 mKlRMyg8oTzBhHK2X3iFcZ0QPJQOgrroMCuxvaDvhAefcQBlvJi9ovP
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add contacts and paths for the CS7542 clock, reset and pinctrl
drivers and their device tree bindings.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..703e95e83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,6 +2949,18 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA SYSTEMS CS7542 GLOBAL CONTROL
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
+F:	Documentation/devicetree/bindings/soc/cortina/
+F:	drivers/clk/clk-cs7542.c
+F:	drivers/pinctrl/pinctrl-cs7542.c
+F:	drivers/reset/reset-cs7542.c
+F:	include/dt-bindings/clock/cortina,cs7542-clock.h
+F:	include/dt-bindings/reset/cortina,cs7542-reset.h
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0


