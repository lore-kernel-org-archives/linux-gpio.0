Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459289;
	b=rZCxeFIoT33x/x3ml0K7jvPU0owYBQ+SF6PHtDof569BJ4xaM5OqP9ghsQl86mp9cBUP
	 35LqdXtzp4TgMyOL6v81fkTOXsmiT1tekz7tOZ6mUF8/XL0geoshgNRH7J2LUWMb0+GfB
	 iYv22PlnpTkPyh9lB2ElqV2YJfgU1Of8wG2jvJKjPmmOqiVbcheBmRa/ln3v4HVZoTWS5
	 5/SOcbPG7IwpEYN0kY/EYjjJbDsoUndw5yEderaqQEN6WBqUd9OWl+JrORMHkhh0IjauH
	 SBnXy82zpDLbWQjh9WDQ8Yp8MmZl1gAzfvA1DqfPjhyfG5TPLTCrwj0RNCAV1hgiYnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459289;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	b=dfkZtCrz5x/7JOwgJ5ENhRfsOlEPp7c3SupCAd2bkyVZUdoi6j3H+8T2pOa1df/U69MX
	 cscCJCcx0EjW3OltltwADwpE3gNqPUq6EUTE+ZKoC4NzZqNvZUP2H3XVXHmypdH6VPT8R
	 19oa/zDgiwFEbmfDlb0OSxdyj2yoEpkuQljymgjm7pfsm73KA+7cDO8WgEsJtndb1QsHJ
	 xNOyfH4eIrN1WTxplU0y8mGgd35Mf4nvGJwoVT8a9pRvOTfOmGmAIVkdg72v19RORXGm4
	 SMW/96LppSplesIaAOf3+VrDlaLToHHQU7aG9X9A7ysxhlTfyfaJafmq79f3+5NDwNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hk3CV+w9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87858606A32E;
	Mon, 23 Nov 2026 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hk3CV+w9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459289;
	b=dQbm51Qaga2rcHEs3PjdI5AbYBKsDLNRvJN3rFPc+MHYf+POgLpHHV74DYikouOJ6r7B
	 ZPo37rIGl74mHbNQIxngIW1saZB/4MzBgc8Z2O6byTO+Kvxa/bXD3+h0kkpVgz5YY9OgY
	 Fa4q8oLiZgW+PLhGsBSnlTQZvFdLHbE+xFM/MkEpQMotIqcNRwlgUxZg7+jZzJmSck5RP
	 olsY5Qz+vX8JRGejhQGHmyg+cYPmRCHsm1oJcWAkQ+hF6KfAk+B5S2Z3j9rF+KSPGkimG
	 JtI/Y4+riPWW/vsr34SPLjzOp9rzhHX2eJHemdO3rD8nzfXaG9lGVGE+OL4Cqc/QRPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459289;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	b=MZVrVyK7jOsFXCuR104V0N+2SAsmiky+RuGodUc/iv0WR5VLImcvTwlBt3R0wjLaL23+
	 uSikhuhTt9TdaZ02NJl1ol9mMpvj4Q6yew36Y3NTMGLPsw7bykFMQs1nif7gZE9cRTncv
	 ZBqV+nsBKicn/Wynv8+RQfyd3L/0yZpvfkkEZATDbsiQgycyo2QI+bE7MoftiuBHk+QoE
	 vHvM95jfdXYJ58r6CUIr0K8e/AjBKix8gNtjF4p6IEXHaR2Nq7y+KrsFB56G71cXSyAzC
	 jq4h6WCGY8j/n0i+TfS3AANTK9ztFJnGuNyU0ko5YQfzT5vvKcgCuo9USl8fUBCcSGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 424831F000C0;
	Mon, 23 Nov 2026 18:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459289;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Hk3CV+w9++LCKyMaCPgnv5LYLF5e3niV97mXxvfYAkZqw6fJ0+sFTzfmSm5dLTn6+
	 1iFH60QQ1p5DfAk2xuaxuEIN8sJfr/98sJ1ILeeAQST0Imr6stFw6PYDJdeeSO1YLk
	 39xOTTXDhvYUvxOTYegHCPsHSfta/ZTQ/ZzvPa3qMKKAhddAf8EFV9MCVXuG4L0zuH
	 ZB4QEzbk+xFG+Oprz7dyGukEpyL+E43rI/d6+nb5Q52HazSlxvz3G7oW/+Y0G61Jtm
	 UrMVrKc+hxoedG/KDUUIwFExsO4E3hk+E/DPAG5MBn7hG+MegeczGpngQVEvW64M9J
	 81yaeUpE9hMhw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A43704C5BF;
	Mon, 23 Nov 2026 18:41:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:16 +0300
Subject: [PATCH 5/5] MAINTAINERS: Add CS7542 global control support
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
Message-Id: <20261123-cs7542-syscon-v1-5-49858e631449@gmail.com>
References: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459271; l=1174;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=fgWHYLyeGItAI+Z6w73sl393x6RrEmbFL0xFZL+FdhU=;
 b=sDCjqIa/sgV9CFJOqw4l+bU2+00O+z4TTreM9rs37EA5rtQg1l+SVzAMioWOdf3TXxhV5bRW5
 XsCQjqX31txAPMDIQE/gBNNAhnaIQzHvepqsA3/NEyZJvhSzcEmuC27
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


