Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595128;
	b=0SrBIMgZUL3HjUZ7E5SfGvb5Ek1aGeIpwZ7k6X6tmZlvs31I2J5i+kJnkSatyaZgnrOr
	 JLiBXw1OaEz07BTBOiAgIu9uZ0143TxoxjqDy99Mx6gdYfhwQXm9FIFAyML0ZJ5HxcS0F
	 TYqddtkLQGWdIDUslaIExzIjjpKBrYbsyec6FXzmx3nfOHLrPXH6Z4D0iXbLOQQkQ5+S5
	 ct5NEDhkdzKAZ8lXOWVbjmaF3lJmtVMBC2BaIW97JResLFmyplogNwPAd7qst04KhxQ0g
	 oDUFyLtPExm2hcPMacVlGiLa6yzT+0dbdYyvROeKXgTEa4nILTxp3Gvz32fN+aY9POA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G73dHZS2pGnpXTpuxeHV3DYpzCnzuaaQaYHT0chm8vE=;
	b=sS31ouD+KqdRbeJAbwFbRpplhjEoz5ptSQ6ZECK6d/aHhtJCR0FxngC+aWieF9llqnPC
	 rM+ekSyQJ8FwYnGwQVQK/2HTdHXSKmN3jr7cSd2dEtobjt4p2k1rByvGY2nZXh4yJjqBi
	 /OeR8YG2z+ylHLOhi2h6FO6pUUIgHn151Sm3iMj8C4/6ZfuCI7yng/Px/SLwd98YhhFnL
	 yJh9o7avijT8308QLTXMjfaZMGK719M6HL6U+B8rcyk71lPLZ7PCTyif2U+VydXSeK1hc
	 DitLsjKheRWOB6lTmvuygTrbDAFPe3s/D3oKgvi1sK9CCpQHawi7meERGN1AN7/LsCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jhJolbzX;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF70606E551
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 18:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF70606E551
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jhJolbzX
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so625949f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595126; x=1795199926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G73dHZS2pGnpXTpuxeHV3DYpzCnzuaaQaYHT0chm8vE=;
        b=jhJolbzXWFFsiIEHx9l91sEYiwR2PiL+ur7AVRrzCKjMBEFaqjDWk0D4n9gkWK0crs
         KyX1RZTn3uMkiu+whkl4croTqShYRBngiXSzL33XB8w0NIdSI4nddESvT40imo2CiEHn
         FPjLZgE1WWc4BbDk+ryFzeLi8vjSD9/JXh0lRdtW+OgVqV6iDRWS8p//zi6OjusdRudw
         bXr8KMDEnXoeYgnAHBdpEwuQ/yB+d/d39JZ7CRqjdIbxFSoTYUBmFiNpP0JcrLQTDu2Q
         cIyFYwwi9qorQ7P3gQEMW9MxKSntGmUftqzbxf6RzjIWeABQQl/XxqCmpYSWaXkgLvmh
         lpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595126; x=1795199926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G73dHZS2pGnpXTpuxeHV3DYpzCnzuaaQaYHT0chm8vE=;
        b=YJdw0/1pqO8j0O9m5vS2cQqhbsKHpHX3EqtUwMizm3YlVL5HEUvnLlvXVm/8oZVsTy
         VxyVwlD+D6fz4yRKW954q1k0RgG1ipXI2gxBmQdFfEoPxq4XzmllLNq29B503NdCadzu
         2RSmIcgS7A6Ub+jC44JwGVyxiyrtBJoGau9LL+ErnBGMQaUpcVTASiHTA0RVIJ7qN8gK
         dSFtnYIUerEkVTK0vEKVhNOJnbNY8ZFaixYztvPiI01h3nArqrX/FovTHQZbxnnofx0i
         jiMKOF8D6lzjTVyotJdIgmswgMjmgnK+m9njVFR7W6rRjBdtoiW8NK2zKm1TvyK7xU34
         JiXw==
X-Forwarded-Encrypted: i=1; AL+hErEKi27HPwQV/y7IjP/wN7T+ozKHL91QljaVgUPBDR/YYSH+fOXmoAH5fD5r53y3e/yes4yFM6Yay7Zm@vger.kernel.org
X-Gm-Message-State: APuU4Z9TWYU8MtlPUePUw3zXdlIvkB5TpZ4pL90RM/Q/XwKMX/sUzM81
	U3+XRLO2lScAtWq9T+1imkvWnf2r5m46/RBQyp9Xs3bfLfIwyQjECjc+vZVukqbmAK8=
X-Gm-Gg: AYBFou1xD5cvEKF0EGLuKVGQDdm3vI3j6Oywfo421XHYI20KNgc735vzi7oNSFOIVKX
	bB2Sy26eRIxBj1hJyfTTMqxaAet6BUAgGa1FjL9VI8f47wuk3WO8+Lb7ibunm0uzOqoapJL1xxA
	B6Me907pwBJ3z8Hr7lIplGIi/NxuVdSdcsb36yzQUnz6BxE3Y2WeyWrXRWoqzV4UV08iV4gygKZ
	9fhtETtk4KDmEkumEGvmXYpSrZq0QG5OJ3E6ms7JgaVWpkDLYSBRoPJok6w/Aum7H519oj0kNWO
	sKMv9lsgfACECy9DcmGrTs0O8emM8SwLdGzrPG0OHxMRskuxygjt5AS+5jol27uQCrEfs9aGKlA
	Dsp0TxPmuykabENw+KPu2ADjWgO8zMv+XlB8HLCRB+k8yDKEi7wuuhipw8l5NXy9kYqtaUIwksf
	gLwqo5Tz9ZZHsEl2nhyXnbrUD4M2qHjc49UrkuH7GGfFzr2zh0rvz7J/arRWw7yzFiwFXISB3ub
	LDgG12Cp94GWRXgF2+byvILDE0gSbwvFTqq1Lu7WuGJxIs0W3aFA540NSXHY3rRpYAUF0T1Kraz
	fzwdpiphz9/cBeEdiMaIrm9/d7PGjtToSj2ILoW2R4U=
X-Received: by 2002:a05:6000:26c9:b0:493:32cf:ff9a with SMTP id ffacd0b85a97d-49c7325c195mr8314708f8f.56.1794595125795;
        Fri, 13 Nov 2026 10:38:45 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:23 +0100
Subject: [PATCH RFC 09/23] ASoC: qcom: lpass: add support for optional WSA
 interface
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-9-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22969;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CC2WJCdBlk50xwiNf2m2RCQi3pFpLpQLeH77sARfsP4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91khKhabFdq3YXuu3FgBFCedenZdAn+eKeF6c4Wf
 nri4cGGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIQAKCRB33NvayMhJ0Yn/D/
 9dV4aQtw9ZARI/MluXV2cnnB3OmQaeYeOFkVFgRgQXqE5+j76vaAuhlBy4uusvMqYrdphveGxD8FlY
 IKh7qyPwH+78JW5Akjh+mHYt4Xo1zxVDsK8Y8Oe/xvLVoKqodgLXxJBZzWIY+MrsQMwYQYWa07GP8k
 dxqmb1fQ8z4Ri9XMKrAW3txAQmHeMjnU7texyuzlhnBLFOmIVAqzN4avUc7NTpSJnn3BY1YmzlXqvB
 4AAKR3QZOKt1T9tyJLh1qewsPmnDdooS/tQv6CUk1PUbhLyBCLAtZNUqFVHZepJDha5obD42mCxaVp
 ULsEzhVHrBFa2dqAWTD7j3IojxuT9/OeNmP3+JwnMSKfyD4AEd42oT6wUoXyvnEbhrxmdDUlFUr1pE
 Z+CtWJbZVDwHWYRFRpx+2Ye3w0mbqEUXus6O3QUACQ+wbiqfi/e6fnRW2C30A5taywrkJBdxqJAnjL
 Yvo7YwJ3GbLZYcfXMS8HS0SEpSVT5H7Fp7FXNVcOys6aWI0ZqQKQN0qQUc+R+p8jG0wyz9kB3Xqbpk
 tcEkFiTRLZX/TQN1CAmvCInRwI2A3Dj7srmGAh8a174R1DwEvN/KVt92CAOBzsBzBlNXK6WKZb6ILG
 3pW4DOUKBjpbR42exmGqU4kI+scigAqOOfRka3p2x/BVdR/ccbjD3G/D/mvQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Newer SoCs have an additional WSA LPAIF used to driver and
additional soundwire bus dedicated to Speakers.

Add the necessary plumbing which is very similar to the
RXTX support used to driver the WCD soundwire bus.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c       |  31 +++++++
 sound/soc/qcom/lpass-lpaif-reg.h |  51 +++++++++--
 sound/soc/qcom/lpass-platform.c  | 182 +++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h           |  64 ++++++++++++++
 4 files changed, 323 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index ea8b6083529c..d46b72c926b2 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -983,6 +983,16 @@ static struct regmap_config lpass_va_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static struct regmap_config lpass_wsa_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.writeable_reg = lpass_rxtx_regmap_writeable,
+	.readable_reg = lpass_rxtx_regmap_readable,
+	.volatile_reg = lpass_rxtx_regmap_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
 static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
 						struct device_node *node,
 						const char *name)
@@ -1045,6 +1055,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 			data->hdmi_port_enable = 1;
 		} else if (is_cdc_dma_port(id)) {
 			data->codec_dma_enable = 1;
+			if (is_wsa_cdc_dma_port(id))
+				data->wsa_enable = 1;
 		} else {
 			data->mi2s_playback_sd_mode[id] =
 				of_lpass_cpu_parse_sd_lines(dev, node,
@@ -1124,6 +1136,13 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		if (IS_ERR(drvdata->va_lpaif))
 			return PTR_ERR(drvdata->va_lpaif);
 
+		if (drvdata->wsa_enable) {
+			drvdata->wsa_lpaif =
+				devm_platform_ioremap_resource_byname(pdev, "lpass-wsa-lpaif");
+			if (IS_ERR(drvdata->wsa_lpaif))
+				return PTR_ERR(drvdata->wsa_lpaif);
+		}
+
 		lpass_rxtx_regmap_config.max_register = LPAIF_CDC_RXTX_WRDMAPER_REG(variant,
 					variant->rxtx_wrdma_channels +
 					variant->rxtx_wrdma_channel_start, LPASS_CDC_DMA_TX3);
@@ -1142,6 +1161,18 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		if (IS_ERR(drvdata->va_lpaif_map))
 			return PTR_ERR(drvdata->va_lpaif_map);
 
+		if (drvdata->wsa_enable) {
+			lpass_wsa_regmap_config.max_register = LPAIF_CDC_RXTX_WRDMAPER_REG(variant,
+						variant->wsa_wrdma_channels +
+						variant->wsa_wrdma_channel_start,
+						LPASS_CDC_DMA_WSA_TX0);
+
+			drvdata->wsa_lpaif_map = devm_regmap_init_mmio(dev, drvdata->wsa_lpaif,
+								       &lpass_wsa_regmap_config);
+			if (IS_ERR(drvdata->wsa_lpaif_map))
+				return PTR_ERR(drvdata->wsa_lpaif_map);
+		}
+
 		ret = of_lpass_cdc_dma_clks_parse(dev, drvdata);
 		if (ret) {
 			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 6d9d9d1f6a4d..faea5a0ce5ea 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -82,6 +82,14 @@
 #define LPAIF_RXTX_IRQSTAT_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port)
 #define LPAIF_RXTX_IRQCLEAR_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port)
 
+/* LPAIF WSA IRQ */
+#define LPAIF_WSA_IRQ_REG_ADDR(v, addr, port) \
+		(v->wsa_irq_reg_base + (addr) + v->wsa_irq_reg_stride * (port))
+
+#define LPAIF_WSA_IRQEN_REG(v, port) LPAIF_WSA_IRQ_REG_ADDR(v, 0x0, port)
+#define LPAIF_WSA_IRQSTAT_REG(v, port) LPAIF_WSA_IRQ_REG_ADDR(v, 0x4, port)
+#define LPAIF_WSA_IRQCLEAR_REG(v, port) LPAIF_WSA_IRQ_REG_ADDR(v, 0xC, port)
+
 /* LPAIF VA IRQ */
 #define LPAIF_VA_IRQ_REG_ADDR(v, addr, port) \
 		(v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))
@@ -182,7 +190,9 @@
 #define LPAIF_CDC_RDMA_REG_ADDR(v, addr, chan, dai_id) \
 	(is_rxtx_cdc_dma_port(dai_id) ? \
 	(v->rxtx_rdma_reg_base + (addr) + v->rxtx_rdma_reg_stride * (chan)) : \
-	(v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan)))
+	(is_wsa_cdc_dma_port(dai_id) ? \
+	 (v->wsa_rdma_reg_base + (addr) + v->wsa_rdma_reg_stride * (chan)) : \
+	 (v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan))))
 
 #define LPAIF_CDC_RXTX_RDMACTL_REG(v, chan, dai_id) \
 		LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
@@ -205,12 +215,28 @@
 #define LPAIF_CDC_VA_RDMA_INTF_REG(v, chan, dai_id) \
 	LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
 
+#define LPAIF_CDC_WSA_RDMACTL_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMABASE_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMABUFF_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMACURR_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMAPER_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
 #define LPAIF_CDC_WRDMA_REG_ADDR(v, addr, chan, dai_id) \
 	(is_rxtx_cdc_dma_port(dai_id) ? \
 	(v->rxtx_wrdma_reg_base + (addr) + \
 		v->rxtx_wrdma_reg_stride * (chan - v->rxtx_wrdma_channel_start)) : \
-	(v->va_wrdma_reg_base + (addr) + \
-		v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start)))
+	(is_wsa_cdc_dma_port(dai_id) ? \
+	 (v->wsa_wrdma_reg_base + (addr) + \
+		v->wsa_wrdma_reg_stride * (chan - v->wsa_wrdma_channel_start)) : \
+	 (v->va_wrdma_reg_base + (addr) + \
+		v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start))))
 
 #define LPAIF_CDC_RXTX_WRDMACTL_REG(v, chan, dai_id) \
 	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
@@ -238,13 +264,28 @@
 #define LPAIF_CDC_VA_WRDMA_INTF_REG(v, chan, dai_id) \
 	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
 
+#define LPAIF_CDC_WSA_WRDMACTL_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMABASE_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMABUFF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMACURR_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMAPER_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
 #define __LPAIF_CDC_RDDMA_REG(v, chan, dir, reg, dai_id) \
 		(is_rxtx_cdc_dma_port(dai_id) ? LPAIF_CDC_RXTX_RDMA##reg##_REG(v, chan, dai_id) : \
-			LPAIF_CDC_VA_RDMA##reg##_REG(v, chan, dai_id))
+		 (is_wsa_cdc_dma_port(dai_id) ? LPAIF_CDC_WSA_RDMA##reg##_REG(v, chan, dai_id) : \
+			LPAIF_CDC_VA_RDMA##reg##_REG(v, chan, dai_id)))
 
 #define __LPAIF_CDC_WRDMA_REG(v, chan, dir, reg, dai_id) \
 		(is_rxtx_cdc_dma_port(dai_id) ? LPAIF_CDC_RXTX_WRDMA##reg##_REG(v, chan, dai_id) : \
-			LPAIF_CDC_VA_WRDMA##reg##_REG(v, chan, dai_id))
+		 (is_wsa_cdc_dma_port(dai_id) ? LPAIF_CDC_WSA_WRDMA##reg##_REG(v, chan, dai_id) : \
+			LPAIF_CDC_VA_WRDMA##reg##_REG(v, chan, dai_id)))
 
 #define __LPAIF_CDC_DMA_REG(v, chan, dir, reg, dai_id) \
 		((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index e162627d6f86..9c879a8090bb 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -97,6 +97,30 @@ static const struct snd_pcm_hardware lpass_platform_va_hardware = {
 	.fifo_size		=	0,
 };
 
+static const struct snd_pcm_hardware lpass_platform_wsa_hardware = {
+	.info			=	SNDRV_PCM_INFO_MMAP |
+					SNDRV_PCM_INFO_MMAP_VALID |
+					SNDRV_PCM_INFO_INTERLEAVED |
+					SNDRV_PCM_INFO_PAUSE |
+					SNDRV_PCM_INFO_RESUME,
+	.formats		=	SNDRV_PCM_FMTBIT_S16 |
+					SNDRV_PCM_FMTBIT_S24 |
+					SNDRV_PCM_FMTBIT_S32,
+	.rates			=	SNDRV_PCM_RATE_8000_192000,
+	.rate_min		=	8000,
+	.rate_max		=	192000,
+	.channels_min		=	1,
+	.channels_max		=	8,
+	.buffer_bytes_max	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE,
+	.period_bytes_max	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.period_bytes_min	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.periods_min		=	LPASS_PLATFORM_PERIODS,
+	.periods_max		=	LPASS_PLATFORM_PERIODS,
+	.fifo_size		=	0,
+};
+
 static int lpass_platform_alloc_rxtx_dmactl_fields(struct device *dev,
 					 struct regmap *map)
 {
@@ -141,6 +165,33 @@ static int lpass_platform_alloc_va_dmactl_fields(struct device *dev,
 					    &v->va_wrdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
 }
 
+static int lpass_platform_alloc_wsa_dmactl_fields(struct device *dev,
+						  struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	const struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
+	int rval;
+
+	rd_dmactl = devm_kzalloc(dev, sizeof(*rd_dmactl), GFP_KERNEL);
+	if (!rd_dmactl)
+		return -ENOMEM;
+
+	wr_dmactl = devm_kzalloc(dev, sizeof(*wr_dmactl), GFP_KERNEL);
+	if (!wr_dmactl)
+		return -ENOMEM;
+
+	drvdata->wsa_rd_dmactl = rd_dmactl;
+	drvdata->wsa_wr_dmactl = wr_dmactl;
+
+	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->intf,
+					    &v->wsa_rdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
+	if (rval)
+		return rval;
+
+	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
+					    &v->wsa_wrdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
+}
 
 static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 					 struct regmap *map)
@@ -237,6 +288,11 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 		map = drvdata->va_lpaif_map;
 		drvdata->va_substream[dma_ch] = substream;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		map = drvdata->wsa_lpaif_map;
+		drvdata->wsa_substream[dma_ch] = substream;
+		break;
 	default:
 		break;
 	}
@@ -265,6 +321,12 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 		runtime->dma_bytes = lpass_platform_va_hardware.buffer_bytes_max;
 		snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		snd_soc_set_runtime_hwparams(substream, &lpass_platform_wsa_hardware);
+		runtime->dma_bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
+		snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+		break;
 	default:
 		break;
 	}
@@ -307,6 +369,10 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		drvdata->va_substream[data->dma_ch] = NULL;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		drvdata->wsa_substream[data->dma_ch] = NULL;
+		break;
 	default:
 		break;
 	}
@@ -345,6 +411,12 @@ static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_subst
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		dmactl = drvdata->va_wr_dmactl;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		dmactl = drvdata->wsa_rd_dmactl;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		dmactl = drvdata->wsa_wr_dmactl;
+		break;
 	}
 
 	return dmactl;
@@ -380,6 +452,12 @@ static int __lpass_get_id(const struct snd_pcm_substream *substream,
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		id = pcm_data->dma_ch - v->va_wrdma_channel_start;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		id = pcm_data->dma_ch;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		id = pcm_data->dma_ch - v->wsa_wrdma_channel_start;
+		break;
 	}
 
 	return id;
@@ -407,6 +485,10 @@ static struct regmap *__lpass_get_regmap_handle(const struct snd_pcm_substream *
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		map = drvdata->va_lpaif_map;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		map = drvdata->wsa_lpaif_map;
+		break;
 	}
 
 	return map;
@@ -491,6 +573,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
 		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai_id);
@@ -756,6 +840,21 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			val_mask = LPAIF_IRQ_ALL(ch);
 			val_irqen = LPAIF_IRQ_ALL(ch);
 			break;
+		case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_ON);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg field: %d\n", ret);
+				return ret;
+			}
+			reg_irqclr = LPAIF_WSA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_irqclr = LPAIF_IRQ_ALL(ch);
+
+			reg_irqen = LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = LPAIF_IRQ_ALL(ch);
+			break;
 		default:
 			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
 			return -EINVAL;
@@ -838,6 +937,22 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			val_mask = LPAIF_IRQ_ALL(ch);
 			val_irqen = LPAIF_IRQ_ALL(ch);
 			break;
+		case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg field: %d\n", ret);
+				return ret;
+			}
+
+			reg_irqclr = LPAIF_WSA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_irqclr = LPAIF_IRQ_ALL(ch);
+
+			reg_irqen = LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = LPAIF_IRQ_ALL(ch);
+			break;
 		default:
 			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
 			return -EINVAL;
@@ -964,6 +1079,12 @@ static irqreturn_t lpass_dma_interrupt_handler(
 		reg = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
 		val = 0;
 	break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		map = drvdata->wsa_lpaif_map;
+		reg = LPAIF_WSA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
+		val = 0;
+	break;
 	default:
 	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
 	return -EINVAL;
@@ -1124,6 +1245,31 @@ static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lpass_platform_wsaif_irq(int irq, void *data)
+{
+	struct lpass_data *drvdata = data;
+	const struct lpass_variant *v = drvdata->variant;
+	unsigned int irqs;
+	irqreturn_t rv;
+	int chan;
+
+	rv = regmap_read(drvdata->wsa_lpaif_map,
+			 LPAIF_WSA_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
+
+	/* Handle per channel interrupts */
+	for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
+		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->wsa_substream[chan]) {
+			rv = lpass_dma_interrupt_handler(
+						drvdata->wsa_substream[chan],
+						drvdata, chan, irqs);
+			if (rv != IRQ_HANDLED)
+				return rv;
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
 						  struct snd_pcm *pcm, int dai_id)
 {
@@ -1156,6 +1302,14 @@ static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *comp
 		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
 		buf->addr = drvdata->va_cdc_dma_lpm_buf;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 3;
+		break;
 	default:
 		break;
 	}
@@ -1359,6 +1513,34 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 				"error initializing va dmactl fields: %d\n", ret);
 			return ret;
 		}
+
+		if (drvdata->wsa_enable) {
+			ret = regmap_write(drvdata->wsa_lpaif_map,
+				LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
+			if (ret) {
+				dev_err(&pdev->dev, "error writing to wsa irqen reg: %d\n", ret);
+				return ret;
+			}
+			drvdata->wsaif_irq = platform_get_irq_byname(pdev, "lpass-irq-wsaif");
+			if (drvdata->wsaif_irq < 0)
+				return -ENODEV;
+
+			ret = devm_request_irq(&pdev->dev, drvdata->wsaif_irq,
+					       lpass_platform_wsaif_irq, 0,
+					       "lpass-irq-wsaif", drvdata);
+			if (ret) {
+				dev_err(&pdev->dev, "wsa irq request failed: %d\n", ret);
+				return ret;
+			}
+
+			ret = lpass_platform_alloc_wsa_dmactl_fields(&pdev->dev,
+								     drvdata->wsa_lpaif_map);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"error initializing wsa dmactl fields: %d\n", ret);
+				return ret;
+			}
+		}
 	}
 
 	if (drvdata->hdmi_port_enable) {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 4231466928d4..46ae02e67403 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -46,6 +46,8 @@ static inline bool is_cdc_dma_port(int dai_id)
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
 		return true;
 	}
 	return false;
@@ -61,6 +63,16 @@ static inline bool is_rxtx_cdc_dma_port(int dai_id)
 	return false;
 }
 
+static inline bool is_wsa_cdc_dma_port(int dai_id)
+{
+	switch (dai_id) {
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		return true;
+	}
+	return false;
+}
+
 struct lpaif_i2sctl {
 	struct regmap_field *loopback;
 	struct regmap_field *spken;
@@ -119,12 +131,14 @@ struct lpass_data {
 
 	int hdmi_port_enable;
 	int codec_dma_enable;
+	int wsa_enable;
 
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *lpaif;
 	void __iomem *hdmiif;
 	void __iomem *rxtx_lpaif;
 	void __iomem *va_lpaif;
+	void __iomem *wsa_lpaif;
 
 	u32 rxtx_cdc_dma_lpm_buf;
 	u32 va_cdc_dma_lpm_buf;
@@ -134,12 +148,14 @@ struct lpass_data {
 	struct regmap *hdmiif_map;
 	struct regmap *rxtx_lpaif_map;
 	struct regmap *va_lpaif_map;
+	struct regmap *wsa_lpaif_map;
 
 	/* interrupts from the low-power audio interface (LPAIF) */
 	int lpaif_irq;
 	int hdmiif_irq;
 	int rxtxif_irq;
 	int vaif_irq;
+	int wsaif_irq;
 
 	/* SOC specific variations in the LPASS IP integration */
 	const struct lpass_variant *variant;
@@ -149,12 +165,14 @@ struct lpass_data {
 	unsigned long hdmi_dma_ch_bit_map;
 	unsigned long rxtx_dma_ch_bit_map;
 	unsigned long va_dma_ch_bit_map;
+	unsigned long wsa_dma_ch_bit_map;
 
 	/* used it for handling interrupt per dma channel */
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 	struct snd_pcm_substream *hdmi_substream[LPASS_MAX_HDMI_DMA_CHANNELS];
 	struct snd_pcm_substream *rxtx_substream[LPASS_MAX_CDC_DMA_CHANNELS];
 	struct snd_pcm_substream *va_substream[LPASS_MAX_CDC_DMA_CHANNELS];
+	struct snd_pcm_substream *wsa_substream[LPASS_MAX_CDC_DMA_CHANNELS];
 
 	/* SOC specific clock list */
 	struct clk_bulk_data *clks;
@@ -170,6 +188,8 @@ struct lpass_data {
 	struct lpaif_dmactl *rxtx_rd_dmactl;
 	struct lpaif_dmactl *rxtx_wr_dmactl;
 	struct lpaif_dmactl *va_wr_dmactl;
+	struct lpaif_dmactl *wsa_rd_dmactl;
+	struct lpaif_dmactl *wsa_wr_dmactl;
 
 	/* Regmap fields of HDMI_CTRL registers*/
 	struct regmap_field *hdmitx_legacy_en;
@@ -215,6 +235,15 @@ struct lpass_variant {
 	u32	va_wrdma_reg_base;
 	u32	va_wrdma_reg_stride;
 	u32	va_wrdma_channels;
+	u32	wsa_irq_reg_base;
+	u32	wsa_irq_reg_stride;
+	u32	wsa_irq_ports;
+	u32	wsa_rdma_reg_base;
+	u32	wsa_rdma_reg_stride;
+	u32	wsa_rdma_channels;
+	u32	wsa_wrdma_reg_base;
+	u32	wsa_wrdma_reg_stride;
+	u32	wsa_wrdma_channels;
 	u32	i2sctrl_reg_base;
 	u32	i2sctrl_reg_stride;
 	u32	i2s_ports;
@@ -369,6 +398,40 @@ struct lpass_variant {
 	struct reg_field va_wrdma_codec_ch;
 	struct reg_field va_wrdma_codec_fs_delay;
 
+	/* CDC WSA RD_DMA */
+	struct reg_field wsa_rdma_intf;
+	struct reg_field wsa_rdma_bursten;
+	struct reg_field wsa_rdma_wpscnt;
+	struct reg_field wsa_rdma_fifowm;
+	struct reg_field wsa_rdma_enable;
+	struct reg_field wsa_rdma_dyncclk;
+	struct reg_field wsa_rdma_burst8;
+	struct reg_field wsa_rdma_burst16;
+	struct reg_field wsa_rdma_dynburst;
+	struct reg_field wsa_rdma_codec_enable;
+	struct reg_field wsa_rdma_codec_pack;
+	struct reg_field wsa_rdma_codec_intf;
+	struct reg_field wsa_rdma_codec_fs_sel;
+	struct reg_field wsa_rdma_codec_ch;
+	struct reg_field wsa_rdma_codec_fs_delay;
+
+	/* CDC WSA WR_DMA */
+	struct reg_field wsa_wrdma_intf;
+	struct reg_field wsa_wrdma_bursten;
+	struct reg_field wsa_wrdma_wpscnt;
+	struct reg_field wsa_wrdma_fifowm;
+	struct reg_field wsa_wrdma_enable;
+	struct reg_field wsa_wrdma_dyncclk;
+	struct reg_field wsa_wrdma_burst8;
+	struct reg_field wsa_wrdma_burst16;
+	struct reg_field wsa_wrdma_dynburst;
+	struct reg_field wsa_wrdma_codec_enable;
+	struct reg_field wsa_wrdma_codec_pack;
+	struct reg_field wsa_wrdma_codec_intf;
+	struct reg_field wsa_wrdma_codec_fs_sel;
+	struct reg_field wsa_wrdma_codec_ch;
+	struct reg_field wsa_wrdma_codec_fs_delay;
+
 	/**
 	 * on SOCs like APQ8016 the channel control bits start
 	 * at different offset to ipq806x
@@ -377,6 +440,7 @@ struct lpass_variant {
 	u32	wrdma_channel_start;
 	u32	rxtx_wrdma_channel_start;
 	u32	va_wrdma_channel_start;
+	u32	wsa_wrdma_channel_start;
 
 	/* SOC specific initialization like clocks */
 	int (*init)(struct platform_device *pdev);

-- 
2.34.1

