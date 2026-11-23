Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465638;
	b=wzT+x+aqhqsX3HXZLX1QCAW7GGODsBpO3Ux0SgNiksKs6HdI3w+KU/BJUhfM7onU90Kw
	 Og9Q6jnKs1KeJQeVIzcG8FX4KHh9WLEKBqS0LGWgEFD08UQ5LITGXWezJd+YkicJWbbsx
	 WL/4eTevyVD4cI5grPX4L3GtVuQNHVCkoZ7FUQwQl1ZUXCTs9+2I78WKrt4TDxSED2guU
	 ZDWJOflGxw3GMEB9qSLzGQ1PuVsFwSjkmjJWOqpxbb2X5UY4AJJ+7ldh91hz/VwBWZnXf
	 +ovmfbORRtdFN2MsK5idettNmkzVZxd4RYN8DQocLAVneMNhr+Qn1IVlMwDi2OkjW0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465638;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	b=0TBvT5YmlskRGW1QtF99X7GulXeas28zJJRf4/ccExbXZ0lNrF/FIp4t7IsDjtuNMpfN
	 2k7MROfdxRJVbi+iVpvyvGtke2Wne6kG9Op96Mf6VW+mRj4bvX02gOah3WmEZg8zO/pW7
	 wpHTJFeLirnF1pfGRvuuFvUKfJsaMlTK2kTOOLzCna2wffAMzSt+RrjF/BKzYLIfeH9AF
	 zWPqgwjMjqNInaknhz8p6VJ5YfbmBBi2/iu8yR93x8bgMy3ysZhZe+XceaaC4eTHxWrHm
	 OMWSvy+ToSDaXpP79TuOyPWtpJaWJ2sm7HrsvE+fuOjUTvCLCwsSpHnDdVM2ppNV93Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y615IMCE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674F606A6A3;
	Mon, 23 Nov 2026 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y615IMCE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465638;
	b=JXg5JtCXr9lwSEERf+m31ftx5Of0lQTElbBT+w7oCYORkl+Cnw6UwF7R/uxaFW79Fvdl
	 NCZ1tlJczYKSdj7TmS5iFYcvlBXOkds16gY8biEh3r4Jo65XfMpeEmcPyBr4JdfNmmyGr
	 K7XF2RGvbIaYIV1jhpe8AvSEYypY28nQ/9zeU4/P37PWbW9v4kh8uvFcRnYG89YHcAv6W
	 osaI45e5LXPSBbod31faSr2C+uGnras9f7wJT6Wgp41zm+DHq9q19w28kwCHC0tRde0g0
	 dfLIHjXhK2TgFoNxn7h1hQHtxdCpA5Ij0W8asxJ3hVWdsuVn+9Gou0O70WJcpVeMgJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465638;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	b=msNFyoP5fbgUolASjjY1PiwDX4GifFvzFfMUHR7j97pMA4+93pVvKM2Cr23XYkN8RA5k
	 x5V5IP5/37mt+XRnphK88GhFHht8gbos0/laCuPwk9O8x+yTc6Afdf/wib1qF0hO3IgrX
	 6sdipceaH+KlztEZU4BVZNHmRWCMn8i3Pev5Kh/soD4KPKafMLFo9r/60Za7p75z7bsud
	 szhwZbgL+aP6uAnuANZ68rpyUwNGC8Wprh1I65PkEArad+Go+ZPjDvx2CQSxvSsoBJUkL
	 w5dHvHXw0+B1FytRBaq/EVH2a5WqE2e54rnUPXzH0Vy5C10iCz0DJHJxtT2JF/M6Vxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6423C1F000C4;
	Mon, 23 Nov 2026 20:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465638;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y615IMCE6ZHyF+uQeYMqDeDmE4h8V4Xf3YuP1phXJYZNlEwUPzgLac65zs4qOu5Vk
	 3W6+SYTqjr47vm+Kl1ULmpUhGHvY5eUnVJQEs5ypNvRUPF3K2ZdsluQYkDX9h7Ef6H
	 Xm43+ntDKbWmx1mUZSTSs/SAPO1tAkNM7gBN3bz7an7f7qCCv+7Bm2JX+l1zIpsKpY
	 H3LlXkOT0iGZ4/AkJxRjgvegBCiBbFNPQSoW9ZuXFJDL2no8F2v6/3HiuUvw9cKW6a
	 2GBHgn6TVsNFPtGLSprC6IrcKEHLlEorAlRLkZaf2BmJ+tF7xpH74ssAIG6BAxFa9L
	 cuPBK200NfL+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AC4E14C6DD;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:26:59 +0300
Subject: [PATCH v2 5/5] MAINTAINERS: Add CS7542 global control support
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
Message-Id: <20261123-cs7542-syscon-v2-5-1cd74b2522f9@gmail.com>
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465614; l=1174;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=fgWHYLyeGItAI+Z6w73sl393x6RrEmbFL0xFZL+FdhU=;
 b=I9Y0WYCeAFYXc7S1UwMeT0BTdFu4HDPRBK8cINHLf2b7zR3WBPMm0SUh7Mr+fDy4C3i/BWeZe
 PZDMMzKQ4rvApav6YgCBt/8rc6sF4lse4gKdB6wY4tYya23RS2HwbD5
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Track the global control binding, strap clock provider and pin
multiplexer independently of the pending platform series.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..d8835aeca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,6 +2949,16 @@ F:	tools/perf/tests/shell/coresight/*
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
+F:	include/dt-bindings/clock/cortina,cs7542-clock.h
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0


