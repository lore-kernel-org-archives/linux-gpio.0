Received: from mailproxy11.manitu.net (mailproxy11.manitu.net [217.11.48.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58B1A6814;
	Sun, 19 Jul 2026 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.11.48.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469345; cv=none; b=XvwVZ/wLXFzW3U6NOFwr4Gbc97hZW4KvPsLuMZj+/vQ3hlgW/nxFpy4iRQNh0NOMzQsdGS4zIppsRdpCz4xZsNkIj8yFIxdlLD9NeJ+BMPPom31fJLWrMWfqhZNKZcV6KjGxxddVAkMRQGJfA7wpItt2qR6lO5TNdqIP3lzLUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469345; c=relaxed/simple;
	bh=IsA0ToFtGN9AnK6dDZL1pCUnOhCpfOEkFw0+m5ShPy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUx8RjBWwKmIikZwxKZQFkfKcAgSh+u60JTnV5GFwAU0rJMjazPKkPMwj9gHLblBcrX2Q6kjCXUpCV+OqM3ZL+p1+5KIZSZaBISMd1vAyU0jEep6TbOs9P1cF50CLyAM4SYO1XCr8o06+pRRa+ihxe/RjSNkqi+kbpNXxkMsemw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ulli-kroll.de; spf=pass smtp.mailfrom=ulli-kroll.de; dkim=pass (2048-bit key) header.d=ulli-kroll.de header.i=@ulli-kroll.de header.b=Pf21sXYC; arc=none smtp.client-ip=217.11.48.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ulli-kroll.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ulli-kroll.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ulli-kroll.de header.i=@ulli-kroll.de header.b="Pf21sXYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ulli-kroll.de;
	s=manitu-webhosting; t=1784468907;
	bh=uqG6dDBEm3kBb7ofDTOFE6qtve6KZ5+P8PAsCUz7w3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pf21sXYC/wMLK49t0LU/YCwc2xP35pXBeniQ77jSWnYRvf51cIInYdWTzvlV6hh16
	 bP7XJ5iyIWgkGeEKWiMQB+7TeNxuRwNHtYoI+7UQJKXS85N1AvDjdwNZCaczYOOr1Y
	 FAGxUxlOo8sx8+/eMvap8zKbVvY3CG9Pt0cCEUz88w+0fTirWHas1Iv0pHs7sFJJsC
	 ND3RvaBMfPQ8UMu93s8SZ09lMuVyet1UhRPNirt2lGpmE+WnritinULUHveM0f6obp
	 Uti1MapYb1SSOL5xmdNnwLkuVpmCx6EiCqMDVKeOc7oGyo4n3UmFoprXY+g0xSjcV+
	 WCJ45PUQjqpFw==
From: Hans Ulli Kroll <linux@ulli-kroll.de>
To: Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Ulli Kroll <linux@ulli-kroll.de>
Subject: [PATCH 1/2] pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
Date: Sun, 19 Jul 2026 15:35:59 +0200
Message-ID: <20260719134548.8830-2-linux@ulli-kroll.de>
In-Reply-To: <20260719134548.8830-1-linux@ulli-kroll.de>
References: <20260719134548.8830-1-linux@ulli-kroll.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcom pinctrl core supports marking functions that represent GPIO mode
via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
GPIO requests for pins that are muxed to the GPIO function.

Add a IPQ_GPIO_PIN_FUNCTION() helper and use it for the ipq806x gpio
function, matching how the msm-based qcom drivers handle this.

This allows ipq806x to keep the GPIO-related configuration in DTS
without tripping over strict pinmux ownership
checks.

Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
---
 drivers/pinctrl/qcom/pinctrl-ipq8064.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.h     | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8064.c b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
index 78d320d56be6d..e1c3c213559f9 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
@@ -480,7 +480,7 @@ static const char * const ps_hold_groups[] = {
 };
 
 static const struct pinfunction ipq8064_functions[] = {
-	IPQ_PIN_FUNCTION(gpio),
+	IPQ_GPIO_PIN_FUNCTION(gpio),
 	IPQ_PIN_FUNCTION(mdio),
 	IPQ_PIN_FUNCTION(ssbi),
 	IPQ_PIN_FUNCTION(spmi),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 4fbff61de6bb3..b94ba1a4177ed 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -24,6 +24,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define IPQ_GPIO_PIN_FUNCTION(fname)					\
+	[IPQ_MUX_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,		\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define MSM_PIN_FUNCTION(fname) 				\
 	[msm_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\
-- 
2.55.0

