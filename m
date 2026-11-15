Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764606;
	b=NHbnHm0oAicY9jk1s3mqfi0Spj5drqBa74O4nivHB+I3oSVWKW2l9VqYuUjnUabHTRHY
	 u7OqyPBLqd6IUr13ohFSN+iGB6I35Pbin8Ou6iBkPgTogwrpRL/jQh2XBF+DbgTEdufBj
	 Qii00ZFrFRRWBk46e/56gyP0t4y2WKCnFiRZZQ7uYGHDA6PKkeXJ1REdwkJ9033OLYpu2
	 zKLNyvlFi3cITmhQ0jnnTTmLPtkDDm0eDSvHdsSFivl4xSspTH++D1xBn2RIuX/Wzck0W
	 7Mw9otYYNdhIu4js2GW20xgS/YXYPGcLwPGYrEtwRtjBp40iaF50WaeT8m6J4W+uS0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
	b=4j8+pr609SHMk5Bxju4OIY2k9ttjHfDphEwqTtx/Jsv6EvBHGvwjs8FghX67mVkAkvJn
	 vlswTMO0Zs7pBe6rGPnTM7QNF85D+QSG3zy9Cxl6AcamrbQxF6X7EvhJ/iMHfu78COt48
	 st9Gk6qgoCGY5HayYmKbmfnH0gbtD20mWtcKZOpqZK8c01jUslb5sefIEoxD+mkWcdhtL
	 ROG1k+GbzqjqhEj6fkpN41XnP8DeWSmxyrjCVJPH1eOmNg8h7UVzuE3H/YnLLSTkgOnfo
	 2S+ek2QA59U/Y++EsHVkiKZOYoloBPHxaA0q+bkjugrAO0ma29ldYF8ZiNPoybHltLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBe7A8yb;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67A8606A31E
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 17:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E67A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBe7A8yb
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso3963133eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 09:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764605; x=1795369405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
        b=fBe7A8ybKmjdDCAZUf1AwgF4q44d/nheQLu/32nrMbMxbngZAUVuSOqxpLKUTYn5Oh
         U4cfAd+4MTTOjCcl37kmirwnd2oZvvZSPRKpBA5l+f8LHHOAB+eT6CFzVeZBR1rwjGvQ
         SCX2ed0LFNy8/6yjRAH+yeryFFgztze2AL79p936zIEXvRT258hK1+3bOQrKxOkXVBjN
         Q7rOPdW7gjmNgYKpBFe0uVELjgllFL39L97cOrAyFKrmC5+NceUl4ZHAdw+PwsPuOLcj
         L3B+/tEUw36iVhkWHXiPfY+SQFXOTGQhc3qrp6VCg1NJzZ9Z43pxuZdahJK6z+3PLoja
         cDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764605; x=1795369405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
        b=DkjZb2PcVL6GKQD8YPsE9sSXUakgcV3cNRET1l1H44BZW52OUmO+bK5oGuHJO3fMw/
         hFMOi5CcNZ1PIU3ivpgcYJUYx5biqd1uZK6NKykTh2Oqt+/MdUVnG0NSz7BWJ+4y7UD/
         eLTjhtaelOYEp5OUYAgSRWcsWKdOWjVve1n1pPKE5vS3JoYnvM+8IkWkQCnVGANU6PR4
         QlzLI3Xkva3F8xumZneQIlD01+QoAFSCD6nM3N/227vrO2RseIBWYoqRnSncSI/jPE8W
         woSUc0GXpNj683U7F4/hftXSjbyv+xUzuLYKI41I/WCYY+VzbIZFP0cNC292h8ykfS0p
         yJjw==
X-Forwarded-Encrypted: i=1; AL+hErGUbFp49rParj8WkcFyREIv+2idAhufSubkPQdyjHAn44rjLnB/enTjrBsDAqimcaxaWJxAevN5LovS@vger.kernel.org
X-Gm-Message-State: APuU4Z/RYigvu5Uf77uniOQZlPq2s8DLAL0IqVm/F/bpGpAKGbwsXI+f
	GNF9zzkVOL+ziVilBGxGngTd7kGrpGZv0KF/VWDPBrAOPpNQ/7+q5jzt
X-Gm-Gg: AYBFou3H24yNoHpkFNInZlvQ3KYL5wBksY4guVEBi0MKGvW4eCE+FXiEgnLki2gViau
	Yw17TKlQr14O7wKK+2ro8QzRzlbu3E4HDgfW7HOY3iAdgjl5lWpYdSxUl5Lm4abkVhwwwQnYPmf
	zJhGvn7t3BbnfnFmhARXWXluisQcWFB7YGkj21VySz4KnF0iEpON/iL/1ecqpeVKfMXZib+Skyk
	zF95jUCmXAnineq4jNwrfmbRK8papP7TqUntcAlR7VfiatZCKBzQZwide9I+5xNIOUA8yfa1+oY
	vJjYrAQ70xdYPUZslbROw2tEw9iIJDVkqYXS7HkuWf/a0WAcAt6Wu1pM0XHL2I7W6flR0oYATwQ
	uZ7CKKbynSr3TUVGsg0DUNMcpXD4GpquSG2pNXKcUAHh3gpNrGF/niBoLXCFSXHEgPv4Tz5STxn
	G6DiQctxANUEfFLjbtM7PCBtEsRAUcJUwloNWlSbGpL0im/wNTldr6dXEZTmNyqC75Yz/czi6KG
	tsq08ceaLJ8/PPyi4gK9BprtM00rKfGkCGegR+uQS6C979xP3wcLxL6qLzmKwdoHlMfeFhSEfDJ
	VkuBHeK/xJblePMmm7USqiQzPHUeKzTD8OI+w2xM3UpyRZy1OO83kaMq6dFUpEkHmYvV8UDnHRF
	6nkCDDkFFelBsF7lYn0N4HKC1Gi4gLoNZ86c264r0GBB4XllEz4fMipjOP/KZ04QK4WX7kff5Es
	N9nmZaGgmTM5avuy9/r/JCxHt8a6o=
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8600534eec.10.1794764604805;
        Sun, 15 Nov 2026 09:43:24 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:24 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 2/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun, 15 Nov 2026 23:12:37 +0530
Message-Id: <20261115174237.48908-3-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115174237.48908-1-surajsonawane0215@gmail.com>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
Changes in v2:
- DT binding moved to patch 1.
- No change to this driver diff.

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
-- 
2.34.1

