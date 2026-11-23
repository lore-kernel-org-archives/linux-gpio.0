Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467303;
	b=i00yO+79egx/G7b1S9P1M5Ii2Chsopu6lSd9r1vZ3Zyb02PAon4sEMJdVqlXY2EHNuIu
	 Scwfx0J4JZd0kifJS0HYVlSyJlEFffy6PG1Rzh4i0MLHrNJS94R2FOQTVIK2wSqpmwx7f
	 WUPHcUK2mcx0H9it+l7nrGPeQwgkYzfDTgV09hR5MYoTov9XRoMuya6hsp3I2S6FrwC2n
	 ZRmAWOYWop+fbUjUTcnAnCY14JbYS5DdssbRm9EOkKLZliw6POd9OrZfUym3+CpJF9/yc
	 cePZ9JoTCPFFiM1qlLyX+naNXpSiL6GGj0BEvubaU4Ov6gaEQ/qp5GfrkCrtR5IfR5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467303;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	b=eYrwvgxShrEH/tWe7/w7pNzuqm1WBXFKg2VjR7YokSNNx+/6AbKaPSCvB+QNNxuO1V0g
	 3W5ibJ7v1Wm72/QxVomGhpnlY2LbR8k+r+t8yMjppKvAu25cucwueefMYUeQWtPngPpMb
	 Ni866lmBMmx56n6x/FYpYqUqRskcN7TaJlaLfqcb8ECM8seUC+sl2WNqEEAmEu01W3Kc1
	 tzMOKvy9pLVs+S87gDEnBvEvXLEIwEBuN5so+50L3jgvWV+itif5dob0sMSrBHZzmYH+Y
	 FCStGADuzI4nXuVix30pyap0wg/BDyonkuLj7kNLlRa7SB97fwwjoT5f2AKo9So8K9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARW5QLrm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE42606A6AD;
	Mon, 23 Nov 2026 20:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARW5QLrm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467303;
	b=kiCsrc22dlx8WPMBxNXT1ogfvH27TWUo4/g3Cu7g0vILSH5yUq6pyCNzyCkAzFiFFHHf
	 ZkS/MGY49BG8/f3YtIau1GEeGYcmI+SbnTaBB2dxuNCTnJVQUNOTrW9hv5bSqjf+HbxRN
	 C74i1JR08cVDAcRZcAlNHOBBPrX3f7KKW3BfoTmUoUnxtP8Dhd30p5oQF7gVnIzPqIkuz
	 +g4j474pHPDOYo5xU7FRlW2i86Es4k23FkM6gQqsbcOwHXjyRqWNtDnnNlmJFKuAqUXT+
	 u00NCSdaa2NKh9cFYoNw3DShHY/8omJ3FTnIHrpfI9nruiRNLzpa/admGQzo765/fyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467303;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	b=ok5S0GP/3XCUkXT/qxE+YtEJ0+bmDSqkSTyZhvCJhOZPX9neXvUE6zL1LH9xmj7SBB3W
	 7WPEUGN0ywTIxT9p1K0g/m1vKn+Cp3EiMTMlHUtGSCE22TRh9j0oiof4AvGNLKqlE4phX
	 3dm2ixmbO4Wq/QDQYr4JE92VspEGdwUIcJkS4kJLj5wTNZgsHAmsB8kO17wRRTOSW6LeD
	 owIFSAms2MaWWGyEiw/9hknmvwL6/YQVKIDRqWLBygoBb8lVAjVmvVFWKtm3s3JIUtBgg
	 OKZ0kOFd8yWATOJizui7jDOiQ76jT6wdSYvVKl5MqB2S9CzjD/14thLy0BP6R0VrlZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A11881F000D4;
	Mon, 23 Nov 2026 20:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467303;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ARW5QLrm8k/tjmHsNLfUzsJPicaCThCsjQSd+M0NjupufEW6Z4WuSCwaoK4ctM4pT
	 m2zsELfit4UjRkbfdfd7ttPQTWh5qCcVygYmHFFGQzu/yNf97/JJ+kf/Llur1zI9y2
	 yvP/XT7+KlQiQVecTcKZp7Bh77wDvhQMl75aXqmVOKrHW9/OXY1juBOqaNeyjYtx3o
	 MmhbLLkZJe8TMcTamj9E8lF3MUx4CwKZL3vjVoYRzaNQC2ex1+XiRKZp/dDzvUBQrJ
	 OlNQlcoNhx1ijyPLn7xvxzfVvhig46WDS9PdhCfy7jsQIrLzN1p9g6VuGAkgwwJADQ
	 w1ODxeNFDVPuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 882FA4C74E;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:54:48 +0300
Subject: [PATCH v3 5/5] MAINTAINERS: Add CS7542 global control support
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
Message-Id: <20261123-cs7542-syscon-v3-5-f1c07a1703f8@gmail.com>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467283; l=1174;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=fgWHYLyeGItAI+Z6w73sl393x6RrEmbFL0xFZL+FdhU=;
 b=QPKZD/sPAFypYFaBbEqI+AbulXKFNGiNIX3z/EqET6hHqVnPJjGszgvjxeqxbfd253su5JOFM
 trApjEGIBjoAYodA6TSJRtK8mHN1ERqxbHiRBv1B76HHWuDXTftIaEU
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


