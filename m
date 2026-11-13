Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595138;
	b=k09aE7Ak/a8Ikbpxb3FATYHFHf4xEI3/u389pj6i0zHwY0ftECSg8eQQMZGt3SlU44Be
	 l9w8d1EjYTwc9JwHvKvvGH2Jc7b2qTR5x+kWiiwHG/w/jkmSazWKJ2H+7OAOQ3Ked3jtr
	 +MrfCDR1U/DIiCQRB/JqAYeSK4gzkojkMUWhL4RloPqb7UqaRJCh98RxFaCguI1MAe11c
	 fZ62LpNykTH3snpVwgO3ai5oMTaHN+0lSrii6ZCd5Ec3RR+Pz1JMm8ildikIbIRLOjfBj
	 6OgYT6nzCybTNeRvv06cHkSFu3m0q9mVNrLOZXRZJcU9Gahf+GX0G5mkCRLdKgP/z6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Sb8DFUlQmjU4/qyO564x84mS41rxyPwR0Mfj0gP/tZw=;
	b=cfyo0twqjzDkBE9ZGzLlP7E2Y9Dhz0Sgmuyb6qC48j5shokK4B+FakOV3uRLP6snAjrf
	 BXCHvxAiMDlikE4Wv9xEMfXnG6LDCu/L8uGhHODviJJboRyUVunvPL0sO8xUsy4w2Ksu5
	 XGY2VsRfDwYjqZx/gDxzcsLqcH8q+PZe9/HhqcSJJWh6EMiW0TJMkXCb7B0qKmi6vjVr3
	 rNqDMRYyM4rVBLQ/poISlXuAYHWRpF8HUCyTtW3mwFv1xYmj/fbxvfP9uVp9B1IYE7+am
	 vfb/5aMkayUtj/vjr5Xpa3gk0zzuMpT9ByN8V0+9IsRHTkOPGbrFMJyUr/LDqgZqsDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eiUsTeut;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8C860A6F61
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 18:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8C860A6F61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eiUsTeut
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso18353105e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595135; x=1795199935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sb8DFUlQmjU4/qyO564x84mS41rxyPwR0Mfj0gP/tZw=;
        b=eiUsTeutoRfpVR1lc/Pw48S2P71aatiA0ngKcd+0b5MN47x6T3HvUqzvXy2jtB6aXO
         t6gVgna/wmI9V5micVVXfdeJIFElzu/8pQOhpa9C1O1Q9sazBbIUMLV0NbgFCssQRg2f
         +BdYSUNGJm1MWi7wJFg6sBPod3Pc7haav6183CjCgIugFfcDI6EeBZIS7do2cQ1iLUzJ
         9nJ/K2jXrfrRS7g+iODf+Ub+SetcRsDckrPaDWQK8A6h6FBlx6vxbxWtYvpfn4FMcuxS
         HAQ8H6WT6slVm9aOsq8jFz8Y8FFWBNwbVB0SVkzoAo0AkPsT2ew3UG3C6RYyRQJQhbn6
         2H7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595135; x=1795199935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb8DFUlQmjU4/qyO564x84mS41rxyPwR0Mfj0gP/tZw=;
        b=0rR0ukHDw6WfCX9C8XHrA+r/iOAn0jUBZsd4mKkoIujbRf6Swm9o8zcOAhnPstAQ8U
         9C6JjRJlC7RjLx14wKq3hsJFA+CvqU5GjyM8D8xe+nVjY+3nO7JTznJH94CqkCUMO0FR
         i35VxP2AGRFkLYeJGGCEWz1Sy/qFZ3TxGnB3vGFlhnPXCxxSmQVOmfIW0inQPKb8Uay7
         quLYWvoEstNEpdvMtrKXdCkkCNVJKAQNRDSrQLybmbF4jIBCHkOkCsXVY8pWEt4XVJlN
         0smDFlmGIsSDj1Br0JBBt5+xntCUAi80f5NTX3Gf2Na50gyq2HBPavrvLE/Puu74mNge
         RiXQ==
X-Forwarded-Encrypted: i=1; AL+hErE2Too/r3Rm3cz0Ood6mML+LsXLDkjjD/if2RNS5vtfrB1CY4GhWoutYSCWAvF4zGzI1Q55Bv8125tx@vger.kernel.org
X-Gm-Message-State: APuU4Z8j4Zvg0dferYLqyeWniVV3nFJXway60/9SAucC3OKNmzzNEHQN
	gutmKVan5Py2Yvqe8VyS7IAzs+u9SEmhkRGMwuhQ/yuInAKHgzUpo1LJMnEAXCDK1LU=
X-Gm-Gg: AYBFou2Tl1vTbFxjrjc6evntD8F6yY8ghCAy/911APm7Xg47QlqsHfcp/GmP2wl5+83
	N7hBfp60XKrwD3STaeYLEbj5zYh53+P7zysRRMcVlWNTEXFw10SUj45j3wsXC65S+H2JDqN2nFe
	XoucHcY7ppcuCjyo2BkryKpyHm78WczV47oeX1IwdR+/usyrq3J10pgDi6paA+DnYiI9K1GpFX5
	tZsOdwf33rKqcaFf8AYz1LecjJxwWcR0rDgcxWjqYhjnd/OTqjI+18LLEaPkBBlQ5OjavitHkcl
	zQbMqiDCNKuRWAy8pLAMmNnnfK+D5BIAYzKQ7MINpSfVgbmBIcDEBmyfNb2RlpGRH0WxNgsaar0
	gf/l/DH9ac2WHrTgq2Vt81tAqMm8MG08dWHvJh4JpUU/8+E1yacr1hAN/YC38kBSiuPuqruAIU5
	g6bQm/ta0MqTCi5ByL7KqIU2duqkXNdbJQEKYDUhF5GdrAPweWPH0k7n0n2PtAfDzlW/URxjCW5
	BzcFFt/odBmJSAE6zE4sl4IZAioXCMI+hKwsLb1wDUg+zftRQi+fIbMr6xRmBuFQSVQbcX1oYiT
	ge/TrzoKOM3eI364TkvjRh+t7te+Kx7GZkaeMtqtfqM=
X-Received: by 2002:a05:600c:1d03:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb55a58e1amr81333845e9.20.1794595134798;
        Fri, 13 Nov 2026 10:38:54 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:30 +0100
Subject: [PATCH RFC 16/23] ASoC: qcom: lpass: enable the right codec_mem
 clock when usin LPM memory
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
Message-Id: <20261113-topic-sm8650-el2-v1-16-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1PHrl1bnC9gePFMj/aP2+K6qk5z6zGw3NPDjiSd89LQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kl4HiUZEUqVZs17X1D9Ch8npT+ibOhQ5bYsD3p
 eWJXtDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJQAKCRB33NvayMhJ0cxuD/
 wJGCu68fEr4YqXdOSSu6ZoUm9h5JAml/m0e+4lFR5ssuqrerSPWr5sJSK1Ruqi1pGunyz2h0JIeNKC
 Vg2VNcx59QRTzGIn4+wdstUNwk2vlejLolqmNC0eXDxR3qPcMso1zuJxYxKgbUM0UxH2FdsZSQXc44
 XTDKf9v3WBs+clRK/Fhb2wgA0is87XBzdw1DlX9fOXWYgCb0vwyNHAK/m6QfVkeXezJjv0TNDGVprc
 fHQVw8rzNNXbkupSL45b4WyYeQy1TIJOTqUGTVVJTm5SMpuUq0yBelZ7fxcVZPqy/fw8Nv5BSGjZ2U
 gmyY54OU+3dhLZ6l0sh9EI4cv+dDKVCzh8mWHBfIvtXbByDdbKhMwR6ZOn6L7sTlJa74mmeuZD/2Si
 ikxQCBEbjmjUrqsXbD/8UuYu7uPZn3bXI2JW+R6CMlrBmgK8x5PhS+y++BeFR6bUQDwFf6XVYBVX4O
 mJ39DEGBPrc7+ALCCaPPZb+Qdtgrs282zS06GYIgvI9PSI+y0dxTo0HaKSuuqXfpaa3uLykFGRYHQB
 gGtytNxh9P4aEayb2v8i9YZNU1Pr9vuoKenyapqxX6nbDsTVfDwqoZkVO3T+FtU0w85ZqUqobniGgz
 oD0JpkJMJE39T2ZofYRgqMrOzdcsLiJ1sKgKEPH81dTOwZhGBMiL/hL69QiA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The LPM memory zone needs different codec_mem clock to be
enabled depending on the DMA buffer offset, add an helper
returning the right clock and add support for the MI2S
ports using a non-core LPAIF.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 27 ++++++++++++---------------
 sound/soc/qcom/lpass-cpu.c     | 21 +++++++++++++++++++++
 sound/soc/qcom/lpass.h         | 20 ++++++++++++++++++++
 3 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 903055e3188d..c20e0976563b 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -199,12 +199,14 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct clk *mem_clk;
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
-		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);
-		clk_prepare_enable(drvdata->codec_mem0);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->rxtx_lpm_offset);
+		clk_set_rate(mem_clk, CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(mem_clk);
 		break;
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
@@ -212,14 +214,9 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 		break;
 	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
 	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
-		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);	//??
-		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);	//??
-		clk_set_rate(drvdata->codec_mem2, CODEC_MEM_HZ_NORMAL);	//??
-		clk_set_rate(drvdata->codec_mem3, CODEC_MEM_HZ_NORMAL);	//??
-		clk_prepare_enable(drvdata->codec_mem0);		//??
-		clk_prepare_enable(drvdata->codec_mem1);		//??
-		clk_prepare_enable(drvdata->codec_mem2);		//??
-		clk_prepare_enable(drvdata->codec_mem3);		//??
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->wsa_lpm_offset);
+		clk_set_rate(mem_clk, CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(mem_clk);
 		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
@@ -233,21 +230,21 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct clk *mem_clk;
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
-		clk_disable_unprepare(drvdata->codec_mem0);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->rxtx_lpm_offset);
+		clk_disable_unprepare(mem_clk);
 		break;
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_disable_unprepare(drvdata->va_mem0);
 		break;
 	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
 	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
-		clk_disable_unprepare(drvdata->codec_mem3);
-		clk_disable_unprepare(drvdata->codec_mem2);
-		clk_disable_unprepare(drvdata->codec_mem1);
-		clk_disable_unprepare(drvdata->codec_mem0);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->wsa_lpm_offset);
+		clk_disable_unprepare(mem_clk);
 		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 4bbcd59ebd60..302c31b23090 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -89,6 +89,17 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
 	unsigned int port_id = mi2s_port_id(dai->driver->id);
 	int ret;
 
+	if (is_lpm_mi2s_port(drvdata, dai->driver->id)) {
+		struct clk *mem_clk = drvdata->va_mem0;
+
+		if (drvdata->mi2s_lpm[port_id] == LPASS_RXTX_CDC_LPM)
+			mem_clk = lpass_cdc_dma_mem_clk(drvdata,
+							drvdata->mi2s_lpm_offset[port_id]);
+
+		clk_set_rate(mem_clk, LPASS_CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(mem_clk);
+	}
+
 	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[port_id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
@@ -133,6 +144,16 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 	}
 
 	clk_unprepare(drvdata->mi2s_bit_clk[port_id]);
+
+	if (is_lpm_mi2s_port(drvdata, dai->driver->id)) {
+		struct clk *mem_clk = drvdata->va_mem0;
+
+		if (drvdata->mi2s_lpm[port_id] == LPASS_RXTX_CDC_LPM)
+			mem_clk = lpass_cdc_dma_mem_clk(drvdata,
+							drvdata->mi2s_lpm_offset[port_id]);
+
+		clk_disable_unprepare(mem_clk);
+	}
 }
 
 static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 8f361f2808ca..699b9a07eb5a 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -30,6 +30,8 @@
 #define LPASS_CDC_DMA_INTF_FOUR_CHANNEL		(0x0F)
 #define LPASS_CDC_DMA_INTF_SIX_CHANNEL		(0x3F)
 #define LPASS_CDC_DMA_INTF_EIGHT_CHANNEL	(0xFF)
+#define LPASS_CDC_DMA_LPM_MEM_BLK_SIZE (2 * 8 * 1024)
+#define LPASS_CODEC_MEM_HZ_NORMAL		153600000
 
 #define LPASS_ACTIVE_PDS			(4)
 #define LPASS_PROXY_PDS			(8)
@@ -291,6 +293,24 @@ static inline bool is_lpm_mi2s_port(struct lpass_data *drvdata, unsigned int dai
 	return false;
 }
 
+static inline struct clk *lpass_cdc_dma_mem_clk(struct lpass_data *drvdata, u32 offset)
+{
+	unsigned int id = offset / LPASS_CDC_DMA_LPM_MEM_BLK_SIZE;
+
+	switch (id) {
+	case 0:
+		return drvdata->codec_mem0;
+	case 1:
+		return drvdata->codec_mem1;
+	case 2:
+		return drvdata->codec_mem2;
+	case 3:
+		return drvdata->codec_mem3;
+	default:
+		return NULL;
+	}
+}
+
 /* Vairant data per each SOC */
 struct lpass_variant {
 	u32	irq_reg_base;

-- 
2.34.1

