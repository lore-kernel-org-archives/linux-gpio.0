Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793527445;
	b=LY3vYJZbf6nwfHHpmfl7I34J+wRLkERJduPQEl4CBQBaV5GgkudpLRhgMQF9jMSR0C7c
	 46vAqp1mp2PTnWDG2zbHtCmVOOU8Bw5v6AoyF0bdBP2OVGXJOFRr6ZFl6rmgb+jaOoWNj
	 /jX6YXo3ioK4495iLnQaBhQY6Dz3sl0TX81+P72pD3tVZs24e45Fgj/W50mqnol3EPWmk
	 E0JLpxOqJRyGNqIyDBtbn8B9JQogjZIt2oE7DmfwRpK6JI8cCmSrJFH2gnpYMPDjMoIh9
	 4azRBaC8g6iu9jQoVftIgsSVZTkumoealQ+rWSsvDJG026Vhvmn8fFYuoynl6cky91g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793527445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
	b=juPtvGp/tZVzInATO7RbHFy7yFFzo6UmFAOjUfPVUujCIgaRJn47cAWibXdHMuWW0Cbm
	 jNXDXdAw+YHCGtkXNDIxWnPXPpRh81QDaVndnn7PXRdk5MKlhxJRVNHyP23CmII/Q0maG
	 y4OxwkWiabQv3yAvCtjfhKy+ULuXuYhdHND9AiTKz39gJwVItkhIcTTVYkIZPzkvi6mvK
	 7l89EBs3sX5NIgu9igYo5XCJfGwUEv0j6w4NeNROcj3q/wBiwbTma8nmnP3Wgo8I4aH8+
	 7TkiVEJDSOy+aF0cZEfLEdxEmrFoCbKnp1Agp5s/VbkAzX0f0vyPbc/ihvvA4RQSWbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLOkA644;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB4606A326
	for <linux-gpio@vger.kernel.org>; Sun,  1 Nov 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CB4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLOkA644
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so2585931c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 01 Nov 2026 02:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793527444; x=1794132244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
        b=TLOkA644h9HfpGw/SGS0NewdQGdEbuAjgwC6StfxYuB2bPe3WZ+EYXFOt4aEtJaIrh
         BBq3fFtIm8e++mbwBzQ+fZSH22eTonM421VOxPrOpBbgCOOHE107pqLSy+czZBRMeUq4
         TpaS5zs/fUFbM0nBc97gfHaxmVgwOLcU1oz5xqT38TmNJYGyOsXSVJ5cXNjXi3V6YOXx
         DYuOuWLmVqnDSDy3mmMs+r3Jb6DZf43fcoaGuMWC1kO6OMB9xrJSZzUqjr899avlFJ5u
         hJD0aVMe6ZKzT5fBN8mQVWpvK0b7/89Bv3F3T9pNqcD5e5KjqHhwt4I4ukZINp2YetK4
         bbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793527444; x=1794132244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
        b=wdnkWq5xk+C7Dgi+qGZiq6ZcX1oXsuRO+j169kdBfq3pCuGD9cdXNT9SaGTwMUY1kb
         2I1LJJYMOVjNfKuBfhdAQOx7C1V91pUqnISLn1I7QP0kwwHb7o4iB4oSv1/qNdBs3c7d
         KQI7A9kTW9fY3dKSsqapyBBSJWLW4GIUVVF9CTjPYzjlA3hM1+enbYuziL4B4Zexhpb8
         EfmpRleByWV4HRqUikpqXpsL1Yk9DOQQzPduJ6ltey2DJtzwVF1zJ8tDSvt+3q0vzoq0
         O6cUjbFfuFQlvxLPcGper5kdkypzdLX7QbfLXk5S2ngZ6sL1K7jN0PkwXAvEXXwo139C
         +JwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRw9EyaiZ9w67l07pSPIhklaIiCZusXFXF3mfEOMTnqQjOojEZ+sDWohGgav21Piy/tnedsW87IeYc@vger.kernel.org
X-Gm-Message-State: AFq9FYLqzDfnkIEgNeA6LfS3zkzEEcOmzw3BJqYq14xUu+8KZW2YpQgA
	K1C5WmT571HfHN/SIvzd3/2rnrHoNmk88Ol+tSVBrylQA1XgcAKXdZiK
X-Gm-Gg: AYBFou0HvnMqCu1JIKju9IXEtZuZbMJUPk6Z2EaIzIXONJA/bC4AtJIRtC639LzKLuo
	QQFU4/ynEc9ytG6xoCTEVy2lZHLSkmUwSnpdReGGA5nDv5jcHyNrPFs+3UtnNg6XqE9x3D68pu5
	IWHN2Ji15q0gYE7kCJR/LmEV3aIKWFVMwOQ1Kl2Ip/oU9XiZIXCF+e20/oXzKMVNux+lwpDL7jn
	hg4r+RSOgpgu12LuKOhABh7+uS4n6jHv3PXAmi81tjK7BCNRVUmE1k3ZjlXrQI6M7esnl3tl6uQ
	gy17nMIBy4zu482w5VpnNcs5E6bBdC627qEEsW8YkrK5R/I2Ul/qoibaK87KD0X7Lct8GfU/qgg
	NycggJiD7quIdRec2QQKjAE8qK+jMHpDNp6rBIFfm2EYvQrP7B3xGRn0PbfjIbK5sv0klLukO88
	Qa15oBsqn8yGdliJxZvHB2yUnyACIhBI9etviSkbdFcynpGuQKS3va1QhMgW3cySC0EPMTdnf5u
	w8XActNqZHlHQW2w37BPTVLwfBi56U2mtnaE4yUqdHFhu9XyrVIKb1MORP6iAtWJQ2uWrQhQexU
	stggBTymu8VUZzQBbyiq0VX7SW2kKLUnmzNINKDSauI38h92+wUHJtAW5vZMB7ZQ/NXu1elam12
	v3CEyZaDAviEQdUT7YVQjZAvNQ9K7fOB1YJve5g+5TQpOaQBf4U+o3t8V0hk6L+oOo3imm6NEpz
	d8z/KK
X-Received: by 2002:a05:701b:4511:10b0:160:6a5b:7edf with SMTP id a92af1059eb24-1ac5fd0852amr9931498c88.44.1793527444190;
        Sun, 01 Nov 2026 02:04:04 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.. ([2402:a00:163:3509:1f2e:5705:c23f:b6fa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm26302562c88.13.2026.11.01.02.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:04:03 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun,  1 Nov 2026 15:30:30 +0530
Message-Id: <20261101100030.15744-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
unnamed, so a device tree cannot select it. SC8280XP already names the
same slot ext_mclk1_c.

Name the slot on SC7280 and assign it to gpio5. The third slot stays
empty; on SC8280XP it is qua_mi2s_data.

This file also provides the SM8350 LPASS LPI driver, which uses the
same pin table, so the function becomes available on SM8350 as well.

Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
drives the codec master clock, and ES8388 playback and headset capture
work. Not tested on SM8350.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d4..278d5fac8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -34,6 +34,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_c,
 	LPI_MUX_gpio,
 	LPI_MUX__,
 };
@@ -77,6 +78,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
 
 static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -84,7 +86,7 @@ static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, _, _),
 	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
 	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
 	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
@@ -118,6 +120,7 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_c),
 };
 
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.34.1

