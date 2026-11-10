Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332394;
	b=1eivIQO0kXfLCpJP+jxGFBasuqs/s855sZe/L4oQkOPvEvBJLpVvZ/rRVPGjlsR7kKlZ
	 yjygItUv3MyAhLnjU/HezsI+PXj7S3b7139UFkLcI1Jrt1Bt9Yi5ZqOn09tXol7xnOKD8
	 UDfrTYTBkNH6bjmoHNrPb68Ij/5L2A44QlaaBXcqcet7FbJYayqHS8yvn5a4FAtCNDuVq
	 Hnu7EFchZWZyFfEDHN66jWPc9xjIU0oPT6Lgmyt2KzDTxY29b74Cm7/i7JYfioNBQ90TR
	 zZAQo2oPH/nsCFteN2woqYIHTka0sgKAwi6nOkAVDHsdH8rMc0rHyk9VfCPSIbVRUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332394;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7lS+EIcXlCg6dJDyf8DgoQ18O18IVBFyUh/28ceN0+E=;
	b=aL4hl47kBkzXAuVK+g3/Afh/06su8HYm1FGQ4DugsyYRhIDnIIASgv9Lz93OuTI8mKWc
	 faNbuBk67B+9xnSPPEe1IuvtcFOW/hgkL7d5uKw4YZiYfZbKI91z7P5sIuvDJfD6zGB2z
	 hCZKl82NqzMtrRH+pKjLnLLv1m5PNhglNi7k3uEE8Nh1PYu4EIJFgXCxxWRY01cQsPFFO
	 4Z4qL8TKVpkMxY2I8/wb4BCNFgVGnxnYvIsKK7gSao3iD1mAdh7ESm4hMSU+XM3DOjXno
	 rOmP/gRsAioxJHUsGvCmo+eM3fq1rFK+p+74yKlHnfHvT9p3VnABMEP+c/lQXAST1Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CCF606A331;
	Tue, 10 Nov 2026 17:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CCF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpoz-001CWh-1q;
	Tue, 10 Nov 2026 18:39:49 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 4/7] pinctrl: airoha: mux a requested GPIO through the IOMUX
Date: Tue, 10 Nov 2026 18:39:38 +0100
Message-Id: <20261110173941.301478-5-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110173941.301478-1-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
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

On a SoC with an IOMUX block every pin turns into a GPIO with one mode
value, mode 0 on the AN7589. Add that value to struct
airoha_pinctrl_iomux and write it when gpiolib requests a pin, so no
SoC needs a gpio function with one group per pin.

Without an IOMUX the callback does nothing, so the existing SoCs keep
their explicit gpio functions and their behavior.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/pinctrl/airoha/airoha-common.h  |  1 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 7a0cb8924e71..adfce89493f0 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -111,6 +111,7 @@ extern const struct airoha_gpiochip_regs airoha_gpiochip_regs_64;
 
 struct airoha_pinctrl_iomux {
 	u8 mode_bits;
+	u8 gpio_mode;
 };
 
 struct airoha_pinctrl_confs_info {
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 9116d3ded258..a805f542bc7b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -430,6 +430,19 @@ static int airoha_pinmux_set_pin_modes(struct airoha_pinctrl *pinctrl,
 	return 0;
 }
 
+static int airoha_pinmux_gpio_request_enable(struct pinctrl_dev *pctrl_dev,
+					     struct pinctrl_gpio_range *range,
+					     unsigned int pin)
+{
+	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+
+	if (!pinctrl->iomux_info)
+		return 0;
+
+	return airoha_pinmux_set_pin_mode(pinctrl, pin,
+					  pinctrl->iomux_info->gpio_mode);
+}
+
 static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 				 unsigned int selector,
 				 unsigned int group)
@@ -510,6 +523,7 @@ static const struct pinmux_ops airoha_pmxops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.gpio_request_enable = airoha_pinmux_gpio_request_enable,
 	.gpio_set_direction = airoha_pinmux_set_direction,
 	.set_mux = airoha_pinmux_set_mux,
 	.strict = true,
-- 
2.34.1

