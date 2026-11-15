Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739464;
	b=wxXHV5Sq59U7I9MOr9tH/4trkZ5taEPk43eyvTi7q8PQalBbzd+93ZVXfpcCfmCdn9vp
	 bj2oTiWC+3lesVk9ZxmRxBfDjOZcFkj2uxO2/f77mgeY6H4BEMB8g/mCPddqhNuu7FCZ0
	 39pj8WnKfrCmy1oY8o5E2oZRVVJSsS0Trnph0ENTTPWLwSzoePwm+y6hyAkoVFJ/4xv1o
	 z0FIKAVXhae8ea6YPO2OFJsK++fz2i+GieWw+ENyGz3LrKUqPDT7T/O3yfS4dHP9Lh78F
	 gTGlMPY5dig9mM9sbpiEKyagE+qJYfD16d0KCfZX+5V0n57tQzO1j3lqdyu/rxOxECw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739464;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=63pVHVdLZ/AAb6QhX+KkOYKHoBRqlXz1mx2wQQLYHRU=;
	b=X798yrre+34qg+bxUW9NAz9FLKPHD49ups54wrNnkOTDR+oSiwiacHiOqbwA9ZMGVT8q
	 UubdPLkLwGQjaVVh9ci2yE0tRln+eApgLfeq14YRux82LXa33Eig+WM77XePzm5qkbiFP
	 1UFlzOofFPQXgZPDLgpA9wwUI2obgmVZZIaaoKhP3xODELSlW6bOS9P9p3llAPEkkxM9v
	 iwA0TF2nyo5vcDpQM2pT5x74cDBcxXv+egNkCh4hV4ffrzs2QauEwXnliIZ1bSyEt97Pb
	 ZRES4MQYCU7eyMZKqYcVPGi0xJ84R4LDBlWZjeHI29/sM9zbBHVrD74wwJXFeK8BBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aalB4+hB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0A7606A323;
	Sun, 15 Nov 2026 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aalB4+hB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E1A1F000C5;
	Sun, 15 Nov 2026 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739464;
	bh=63pVHVdLZ/AAb6QhX+KkOYKHoBRqlXz1mx2wQQLYHRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aalB4+hBCPAVo2paG9AWhpOHRJeXCGXOzM3qjOe7aCl14dGamAR+qArw60Ki7cjUL
	 8ALEr7F5Bf53KO6yz3RfPxrXfTwKG9w0RfQVTzwmNOf47mZz0XAo+R8aSoPoG5BmZd
	 +vPEEh1CzmBQkZvEpkxU9gLIy9/H7/GdfvUs5jsT4LrDnRchMvfm48nF3uBMUyQRuN
	 fnOEsyaUYzdDT2jREdUDiS0hfsCTuw9Dz1BeFUTp0P+QSs8mkab/UlWw7r/jp6DDOP
	 +80FA42dCIgX257A/7Dm18Loj+AR3M7/5mZIyUhFIcEjvd5iJk207zu84UMLtFQh1i
	 RoluObqF7g9IA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 01/13] arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
Date: Sun, 15 Nov 2026 18:23:40 +0800
Message-ID: <20261115102401.3520-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend ARCH_BERLIN to cover Synaptics arm64 SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/Kconfig.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 49dcd7be82ce..b830161fe68b 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -108,13 +108,13 @@ config ARCH_BRCMSTB
 endif
 
 config ARCH_BERLIN
-	bool "Marvell Berlin SoC Family"
+	bool "Synaptics/Marvell Berlin SoC Family"
 	select DW_APB_ICTL
 	select DW_APB_TIMER_OF
 	select GPIOLIB
 	select PINCTRL
 	help
-	  This enables support for Marvell Berlin SoC Family
+	  This enables support for Synaptics SoCs or Marvell Berlin SoC Family
 
 config ARCH_BITMAIN
 	bool "Bitmain SoC Platforms"
-- 
2.55.0

