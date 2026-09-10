Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DFD49EC56;
	Thu, 10 Sep 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047333; cv=none; b=MTaHVKUE30P504BPism62ymtcr7PbFCIA69dTSLI37yuRXg9sR1LMz5mRAR1o28iQhf4Wr7gP2DLXoRVMuvfZEtQEBTqWLsE+dDguQq665zmFCH2QGkEUkf54nWj2DNonxl6dBVIlRYYsNaoDQ+WzzC3BGgDe0g1Qc9b26SQkfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047333; c=relaxed/simple;
	bh=FxDtznMDF3G6v0CC70O4PDTkkMNel6NjQbC+dSOUz88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH+my7yK8QNiYIbbc0WKguIFaFca9ypsR2qWf/YLboxLBDSJF2nJkPMzXtXogf9Orw9VevEZ5q2NhqUXGYCHkoKg40XR01BkywTD0gpcNbOYUJH2zN1ueBGBnaASLs61iTTq5FDE55s2Rv4gqkcqr1QZzmdKlp1iFw7qWBMlj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P2rUvKCc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P2rUvKCc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2A0C2103;
	Thu, 10 Sep 2026 06:35:27 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8AE93F528;
	Thu, 10 Sep 2026 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047331; bh=FxDtznMDF3G6v0CC70O4PDTkkMNel6NjQbC+dSOUz88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P2rUvKCc6VWahL75AGslFxx/iJECXrzPx0JPzJM6WnYBtpajHI33FgH8EJo2UJEsv
	 8PKF6u3/TDuCfgyMvC/K1OnSfw8CJ5cZtGERkvscnIH5PdRuwJ9e5mGsyRnv3Z4n5O
	 W0jBsHSre5QW+IjH3+zxOCX8ovtNwI5NlkbR4L7U=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/7] pinctrl: sunxi: only use PortK special handling on A523
Date: Thu, 10 Sep 2026 15:35:13 +0200
Message-ID: <20260910133519.459011-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 pinctrl IP requires an exception for addressing PortK,
since the registers for this GPIO bank did not fit anymore in the
existing MMIO frame. Since the A523 was also the first SoC to actually
implement PortK, we just enabled this quirk unconditionally.
Now the new Allwinner A733 changed the MMIO frame layout, so PortK can
and must be handled without any special code.

Mark the special casing for PortK with the ELEVEN_BANKS quirk flag we
introduced, so that it will only be used on SoCs using the A523 pinctrl
IP.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bc6948e3fb495..2524e0b3a2a5a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -67,7 +67,7 @@ static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
 {
 	u32 offset = 0;
 
-	if (pin >= PK_BASE) {
+	if (pin >= PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS)) {
 		pin -= PK_BASE;
 		offset = PIO_BANK_K_OFFSET;
 	}
-- 
2.47.3

