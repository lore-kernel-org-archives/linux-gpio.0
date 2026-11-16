Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851347;
	b=uaf//bzu9/dmcVmyly8+ALK59pSx/Hu0KKmTG/994TkeKGGYpozim3tnncyyvGfFgQSA
	 m7iFbKjfOwq8NH2zRqJDOvk/2Ddgh4hzj6BH0wLGHB5gTN36Ag/NBa4uNYgSAZmMXJZiL
	 DLhPfJAbDGUsQ2T9/Y3FwHE6UTohe4tglZhbIdSjEXFrqjZfte1iI9A0GasNgu8Xs4gCf
	 DMfhORyiihWq+1WESZuNZDYyVk/AEBhL2/kG+Na78QRLRiiVIXTWaZpKeO0PagkkZXFlj
	 5xctdPqMu1U5zqlStCXqU/xbFm/65juZnl/Oer1LiE3O4uLSwMo++diop29Lbrv83EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851347;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wM/M3Qr2q2MJMidiTw81CDwlECWMExQSmD67qBO/SYk=;
	b=HRM5dZZFzjn0DhCikItPIrP13PrKmU+q50BuBhU2YPqrD6Ugg1tfZOVbfsXLWK/xn6Vn
	 MT1pofCeBasNk8ambjAgkbJ0PaWiLVm//+khSigpHwKuwUNMqjw6g3X6ZDu4tY0K23utk
	 Z4Fnxbh2M4060wMMkwzIKpeidJGKFU2AxTStDFh6B3sRr/euUBL92zFiB7rJzfKHfIzaV
	 +JmjfxL0AgYmNIB4WVZf6OvREZPmJF4Jx9MUirMjUSgB8M1rRmYoyjJEuB+Vclek7wZdy
	 AGkpTIMVXc20yXFQIZlbe5gB4ECkfHYVDVAkkeGt2FQqogVEm7Jib9QIoUdSDYbYJHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B066606A33E;
	Mon, 16 Nov 2026 17:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B066606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0pC-004GcH-2W;
	Mon, 16 Nov 2026 18:49:02 +0100
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
Subject: [PATCH v3 4/9] pinctrl: airoha: mux a requested GPIO through the IOMUX
Date: Mon, 16 Nov 2026 18:48:49 +0100
Message-Id: <20261116174854.342912-5-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116174854.342912-1-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
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
index 5ae0c49e491a..e6b0180c9cb0 100644
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

