Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022751;
	b=Ol5VmJkXY/MCTHbCTNoh//ES5Liaq0DxIs4FItsgr00eanWsc9D3431sfg90YT/0YbxU
	 SzO9NpkZFLkC8HmIeY33tgrkPEeSBQtawuo/KlaZG1B6KgmBHJi8zA0EYE4k0l1owuodz
	 uRzuoWgy3ITh1nOPrSRVvWxODOgiw5AONdWz16wkmTe/4ZaazWWNdkt0KUcZIb4MGQfOV
	 cHR+ZVFP9cZoOX++qzrf/gLhvrfICC7+3C6CPHcUAcmWs0rj+Hkj6I7p4Ho3x5y4RQLnW
	 duyp/W1263RUqG/Oz4PXdWfWEeHbH4wpSeSuQK6p8Z/ca378DwxFztWBFkpy1M8kabA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022751;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=g9/yyvrRXWzYPBq/8c7/EuD+8MRZviiASUnGr27vgRk=;
	b=f1wJW+OuOf/T6lTj9ShOhRgSpxLdlW7zExZMywoW/eB38c8oa00Cwx67cwB6nx5EgfXG
	 LLnbR5B+CZgtUzDGaHjLIFPr+lJPULC83apOfBuiTliw3/v34Zy2gE66LzUu8/R2GLguo
	 LHx/O7U9Vg73uf5xBPjBqpFWFiS978dnvl6xGmUtBb7dVnYl+A1slQ23X8TrsOKHLu72X
	 gNMWxPXSyBqCaY28jNinCioTTeE1WWlfxK70vTGSY1jxkzIHxl6s4159BoWrevittxY6h
	 Eio7dJcnvGhnnmf7NTSLhyVK0rflTW9fELgEq2ubWz45oORtFGVjc5blynk7dz9GYlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iyR8jzUK;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=B2xYaysX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62503606B5F7;
	Wed, 18 Nov 2026 17:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62503606B5F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iyR8jzUK;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=B2xYaysX
ARC-Seal: i=1; a=rsa-sha256; t=1795022742; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bDPGIqJo2RDs2GgamVkIpUQgvBbdzOJMA4XNV+Zl9DA9hcwSBwey5wDJzQnkcUgSQC
    K33te1IauoEHwyyH5vcY0X2LkdWudyCi4SniCfLf5pkRsQ7JnsHOZYY59ho1O6yBsmVM
    nRJ1A7+8UtKhpVNsNXTFQlSBvzUqKc7JExYY/T8jOIRV3DD2XCPXHw6Df/8NWaLxnqJG
    cqdDS857CtJlSYlZWXfqLqucft23wWGyzinlnGOErd5cznn3pw963sOfhAV695pTOaIl
    W+aFix0ole/yxnBbhR6B30zHTBiCRoeCnJnlmXjnRu/+yyG7+7HHXJIaortbLx5tBjYL
    z22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022742;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=g9/yyvrRXWzYPBq/8c7/EuD+8MRZviiASUnGr27vgRk=;
    b=blbvaey6CuwmvoegBNzhg+Z97AOTbchNKTWOUA/IIZ8Y4gqfSpCdheN01lRo0WMg9e
    +6WpJX+ux7tZ0JPIJW8bigc4EFJ1xRQz7y2C5jzJjLkc2RPDfx5ed6Q74+wBagCvzqY7
    erAcY6cTjk3PerBto5L0BRlF31qFl3xutSlln4m3+NK1iLfh7peEm1vNjqDDel7B5dcL
    IQhxin0nzgVThPXgPWngCpevUYrcLB0JCDIbZkvYBgoxDjrVlA2sHSZhTsSVP2ZTOAJL
    Qs4Cs4CYevcMzUzOUmOjNHL4zJtYWtbGroEmamFm0vCiGcErixRG9o/+kYmT/SDo912c
    VrMA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022742;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=g9/yyvrRXWzYPBq/8c7/EuD+8MRZviiASUnGr27vgRk=;
    b=iyR8jzUKJaIqVsRgj3OEzIr1SMlSa4CfPhFGVW++uA/35GA/BzpfJoGPsk4tgUKIP/
    YMd7Tp2iwCyWUNuCEY/Ycb56zhiUnkvmBECjj31LHYIbm0Lnltf9kT+g1tc8a4d58s8d
    5RKFkyeUyXPMmlVFnbJw2RjQZNj6U0JmEAzOfmvml/xuWnb1bLrBgk3k1W0mvlgLYAxd
    +BQ93p+YEUs5iXdR6qisL1kS6Qc22jXDLnIywigr2buMizj5leuEu3gb+qzegXuAet5J
    FKz7l+S7cXwCMGVmaIt8rlbFiSgaF2mjk1kNlaVQy6oPYlqGstK4PG/ELm2ukicrgNbD
    kxjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795022742;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=g9/yyvrRXWzYPBq/8c7/EuD+8MRZviiASUnGr27vgRk=;
    b=B2xYaysX5FCeZbtm/MSik1PEqNujtbNlcRNryJqZwRlC8nMF4ixmzonpNMKM5D/zQi
    +VPpzGjdH1wUYOpv1pCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AIHPfdiZ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 18:25:41 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v4 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt trigger
Date: Wed, 18 Nov 2026 18:25:36 +0100
Message-ID: <1932f6b68d67badeddcd1d1ec213d2918d877d71.1795022736.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795022736.git.hns@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
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
Content-Type: text/plain; charset="us-ascii"

Port E has two Schmitt trigger configuration bits per pin.
Select the lower-hysteresis mode when enabling and read both bits
to report firmware-initialized settings.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 02ebfecf9563a..876e8e9e00c45 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -69,6 +69,7 @@
 #define X2000_GPIO_PEPD				0x90
 #define X2000_GPIO_SR				0xd0
 #define X2000_GPIO_SMT				0xe0
+#define X2600_GPIO_SMT1				0x100
 
 #define X2600_GPIO_SHADOW_OFFSET		0x800
 #define X2600_GPIO_PAGLD			(X2600_GPIO_SHADOW_OFFSET + 0xf0)
@@ -4697,6 +4698,9 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 
 		arg = !!ingenic_get_pin_config(jzpc, pin, reg);
+		if (is_soc(jzpc, ID_X2600) && offt == 4)
+			arg |= !!ingenic_get_pin_config(jzpc, pin,
+						X2600_GPIO_SMT1);
 		break;
 
 	case PIN_CONFIG_SLEW_RATE:
@@ -4771,6 +4775,11 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 static void ingenic_set_schmitt_trigger(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, bool enable)
 {
+	/* Port E uses two bits; select the lower-hysteresis Schmitt mode. */
+	if (is_soc(jzpc, ID_X2600) &&
+	    pin / PINS_PER_GPIO_CHIP == 4)
+		ingenic_config_pin(jzpc, pin, X2600_GPIO_SMT1, false);
+
 	if (is_soc_or_above(jzpc, ID_X2000))
 		ingenic_config_pin(jzpc, pin, X2000_GPIO_SMT, enable);
 	else
-- 
2.56.0

