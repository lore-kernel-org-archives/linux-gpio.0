Received: from mailproxy09.manitu.net (mailproxy09.manitu.net [217.11.48.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80221E520A;
	Sun, 19 Jul 2026 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.11.48.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469345; cv=none; b=ArUh5XFznFz4DEcR+BLTtsdv78qP9f9w7kSBM4qcl3GE/DQQlMYwut+7is3Fna10G25aYYN4G/gYloum7Kvzr8KokeW3pwd1wjIGbuyxbdAnsb0W5sRZG7pakIwkLX6MvwzybxJpeiqXQa/QZ5v6x2H4QAO2ruwgHjad9lW7wIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469345; c=relaxed/simple;
	bh=zRub/AcKvITZbYBR6rIo/0tBIENQN373bg7jhQHTBdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqYJqm5zzC1yl/gvT9o2eBa7sxVg178H9QARBbk2RX5uLHfPEpi35Te9DtuGyQYEob+D4SKYHuuCe/U3FzwcoaOJDmcurhhinxIRwt4cgFYwtn+Le6wwTufWQqmWbZHM6oVwUIvX0N+hXJHrKqsAxOahSGXFGkvwGPfzbe28x9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ulli-kroll.de; spf=pass smtp.mailfrom=ulli-kroll.de; dkim=pass (2048-bit key) header.d=ulli-kroll.de header.i=@ulli-kroll.de header.b=veGb8yNy; arc=none smtp.client-ip=217.11.48.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ulli-kroll.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ulli-kroll.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ulli-kroll.de header.i=@ulli-kroll.de header.b="veGb8yNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ulli-kroll.de;
	s=manitu-webhosting; t=1784468908;
	bh=pTSA01dQFLWTZnr2BNdiSh0ArcZhE2QNdfSSEwFtqqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=veGb8yNy039mtzkRjBey6u53htYQQTWVwQcHFvphb1uw5dvZDXgyzQqWg2y1Ccm8a
	 U1nF0u9warQWFt4yWmOHsuv1bj8NEkaZxC1BjW9NE+vR6QK5gEbIfHuBwGVWwozQfB
	 /MSsoXfFMYXXCU2oDaBrsbUY/rXaXWxC1/A482HJcOakdGdpOyOaN6u++3jxNayCn+
	 5Z8/czYqfWMtYFgulpcxp/RleF9FNW/LWfVlqcM1ep7hkLObBUQ5wrEeP0cJk7J9QQ
	 cDKTXg385I2+NfD1IEi+jd1STx4qKKbRl/yPhKFsqmTf2DdSpD4k2BE58AMd5Eh/iT
	 OmCMQm3dk9b7g==
From: Hans Ulli Kroll <linux@ulli-kroll.de>
To: Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Ulli Kroll <linux@ulli-kroll.de>
Subject: [PATCH 2/2] pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function
Date: Sun, 19 Jul 2026 15:36:00 +0200
Message-ID: <20260719134548.8830-3-linux@ulli-kroll.de>
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

Mark PCIe reset as GPIO pin function

This allows ipq806x to keep the PCIe-reset related configuration in DTS
without tripping over strict pinmux ownership checks.

Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
---
 drivers/pinctrl/qcom/pinctrl-ipq8064.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8064.c b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
index e1c3c213559f9..0a50486337d31 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
@@ -507,19 +507,19 @@ static const struct pinfunction ipq8064_functions[] = {
 	IPQ_PIN_FUNCTION(usb2_hsic),
 	IPQ_PIN_FUNCTION(rgmii2),
 	IPQ_PIN_FUNCTION(sata),
-	IPQ_PIN_FUNCTION(pcie1_rst),
+	IPQ_GPIO_PIN_FUNCTION(pcie1_rst),
 	IPQ_PIN_FUNCTION(pcie1_prsnt),
 	IPQ_PIN_FUNCTION(pcie1_pwren_n),
 	IPQ_PIN_FUNCTION(pcie1_pwren),
 	IPQ_PIN_FUNCTION(pcie1_pwrflt),
 	IPQ_PIN_FUNCTION(pcie1_clk_req),
-	IPQ_PIN_FUNCTION(pcie2_rst),
+	IPQ_GPIO_PIN_FUNCTION(pcie2_rst),
 	IPQ_PIN_FUNCTION(pcie2_prsnt),
 	IPQ_PIN_FUNCTION(pcie2_pwren_n),
 	IPQ_PIN_FUNCTION(pcie2_pwren),
 	IPQ_PIN_FUNCTION(pcie2_pwrflt),
 	IPQ_PIN_FUNCTION(pcie2_clk_req),
-	IPQ_PIN_FUNCTION(pcie3_rst),
+	IPQ_GPIO_PIN_FUNCTION(pcie3_rst),
 	IPQ_PIN_FUNCTION(pcie3_prsnt),
 	IPQ_PIN_FUNCTION(pcie3_pwren_n),
 	IPQ_PIN_FUNCTION(pcie3_pwren),
-- 
2.55.0

