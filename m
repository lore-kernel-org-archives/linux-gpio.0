Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368949;
	b=15qrGZtJ7Hbl3G7n6kbuzjeX4H80h+wSXBVgWP35i4MeTOQj46JkJZIk2QF1ZbAbYsL8
	 yPE8iSNqY7r3MKCBgDURRWhPCqY2q3ADanIvhIEwIKd+mnd90e0cU5lRqBrhKzz7EmLLL
	 nkUpYcfkg6pI4ooy9sdO7hmDg64cxEIJ/scyze318bgRhATiVpo2nzRmlstePyE32WQbC
	 vtwO6OFEU/f57VPsLTVrgpH/gAfdkoOkP3ZSET1nY0FHPqFjVrAOgCR0zwPctCURQm5sb
	 1iVS5qSEk8LOadhvjVKO+nZqkQz0v6tafa3LWgEFDuEeb+/pyijXIQCfZoAHQMdso6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
	b=CpyAC0RqEG4ZUN3U50rUxS8sz7J6C8DGOglfc4G4AxYxoW0P7osPCRTZtxNDsJUsCOf/
	 tYdLaDMrgFNqU3qryzz1YEzCcYU6KDcJTOZnUNCelM/t8K2xv9BbsK5B3chhnRhYlEKY6
	 /1LHrOTmSBI3qjoIAm18CxRmZQZVCgx2yRT2X9IVuaTZnhzBebJf+E1k36wH0Ymgij9/k
	 c5/i8orM0SrkDdXLvhhnfvnBKVH+w8wOpJ1kQxihs3C0EnPEsYC7602iFr/FLJI6iGyiA
	 0QVJQ6tpkjhmk5RJMJzKjxxxszwCTJQbOHg9xWHB8rKiq5YdoIX82L61w0tv8oqssFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUAGvOS4;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F2E606A330
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 17:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F2E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUAGvOS4
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so415376c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368948; x=1795973748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
        b=RUAGvOS424fngzXVXGnBDW25yR6ASDwqNP4nBG6P0RkE9ctSrz2XI5dWkla9yQdNRU
         8bc+GZlnNJmIL+GnPOD5i/FJh16cvhqcLYZIkG5s/IkqkrVNbUlWzbaclMWsw5QGc6Qd
         yT2/i3zW+d70nhhLwUMIP11m73mOojUYl0aXoDYXwtqEmJhKXxzb7ppUZSOP1TCZoMUa
         zFpsiJE8TN7BQ5GCwoYiz1+ILN3lGf1t4zBTybBd0aFdLHXrkrS6miH8A9n+WXnX9q1t
         tx+eDUcBs7EJU9tDABYma36Kjm9TPSCLgU1cAeRSx/G9t3CuwamMijnomdFYbGBUmUWH
         H6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368948; x=1795973748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
        b=YewSovV/9eEONRfk7Ec6jhUBjAh1ltp8g1elvrmcgmuozqFUQvE+dGorGR+mv2nk0Z
         0fa7/cuomCiv0oVzDyCiFdPBsQJk9OCycf/Lp/uoNZrmrEWx8bGm1iia00tXO05lKpN9
         UqsdE+S/crSBhI+0fWcJicyDq6czCmGxvrZyM46RJUah82cwjjpzLQsQs3ieJjZhPuSG
         8xp4iL9anK5RnZuNfomqD7RP1Ap3vFoTs38nLmwlNCdj5UlZ2d4/aICyjBHh/Tsa4szu
         jvCUUITyxBSiUj1Ua9/jhBcDOfbPtptFFrnfplh1tWLBk07I95YbCQJcFKrD7OUwWfAd
         z+9w==
X-Forwarded-Encrypted: i=1; AL+hErGdKFQP3KeVBiLRCoD9bzWQw09xqgHqrGkORtcGkv9NdGYLxHTT5/D5U5Clgo72fiK1Q5mhMfzl1i7+@vger.kernel.org
X-Gm-Message-State: APuU4Z8g+KoMWpuz0n3OWG4wwXafalaMN8DLjp5mHfAoEHjfz0kgklr1
	TZRSo1RjWZnoO4QAyIos7XgVdslt3G+/hhIT+yTPLxvybKDlqSe3Wa8s
X-Gm-Gg: AZFdTZfWtKTh2XqYc3mj/EZ0rVLMM3+jhQZMijRqBeXvbfkmdh6floFpQbJ2aJDfGlJ
	0KCCV4Kj5OwN4ZkulIbSgbAr6HvQpvfcln1Z3HIAnO93p/6hX5fQTrIIraPnjTHGaFzPofkW9I4
	H5W63Jk7l29HQDR3G7XpnDA44l7HKSx+Zg2SNjtXj+aZi0LOc4GYcGMauSvi+vLkm076RqCrrvf
	B4yqfKRELU+Zm+ylqpi2dOPBJZTK4GxdgSP0t/d6qscX2Q2rEOr131SV9ljkCOoB4nqKNov5WA9
	mCXlj8MezCZcpreCdJpaVC4BTUn27mlMZ2hvspQ6dVvfIBXnkJrns6/8ITEb9WUJAVKfTxZ4Cxm
	zzkgygqqF9BWrCotmLdFW3gcmMpRJn1JrQJT+hDwiZDgDkgQ77RSODgx3ojdFEp8llhWm7Ja/49
	YA2L6A89KR43ng5XXR4CLHtCYr4bja+5xfV/+1iybjemUCcolzl80nqvXzifoQFHvWILiAYzo7r
	HqCGXEM5xBdwpL6g6WVXZD9pbmZw+gaBBwIZXMklWAtLjYqzUPIrgY9O3tTmxtGbPhHDudyrFlo
	q/gvdeDqgWKYGEiaRV2v/HdCriTVNMn/U+K7Wnq98BShtd9v7sMkzcTG/SIUl1Z9egm/Dfy+/Hb
	H16byLE8box19Dma38phAZDz6xQ9vD33Dh9RRzEPflKhDHs+QN2/UEp3Bb50uapqgE8nyoQ8CCV
	YlyQ1RKtJhdYXtU2p+5c0FcvLy2A==
X-Received: by 2002:a05:7022:ed02:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b5568f335cmr9548851c88.24.1795368948100;
        Sun, 22 Nov 2026 09:35:48 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:47 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 22 Nov 2026 23:04:49 +0530
Message-Id: <20261122173449.21009-2-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122173449.21009-1-surajsonawane0215@gmail.com>
References: <20261122173449.21009-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C. Allow function = "ext_mclk1_c"
in the SC7280 LPASS LPI pinctrl binding so DT can select that mux
once the driver exposes it.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bc7b8dda8..5f7870fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -64,7 +64,7 @@ $defs:
                 qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
                 dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
                 i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
+                dmic3_data, i2s2_data, ext_mclk1_c ]
         description:
           Specify the alternative function to be configured for the specified
           pins.
-- 
2.34.1

