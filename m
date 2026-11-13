Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=Qzv7MJUQdOh7pvM+XhYnwI4uZhnaxeeD0JpAk28c9nSp2ND8vcG2P7PVrNGjO5LTKoWF
	 oGaXwN3B3lsdemao9DvUeKsQXw8UoT3vc1YZNdWbghqVDzVfmDQsg9RAJbfXlpY+/WvX1
	 RGQOCG8XOIiQvTcxPadI/oFxO3usSwGa/Wzw2navUHoDZ0kuCLgsRjcix+x4QUiiDW1vZ
	 Fcloj29j8/3ajci5Z1yw/nefxQ7FvikGgesWxB9xuIZmfFtz6PB6B6IayXPvSa1sLiSgR
	 HyFYT9XcefMDtPYal1a0NZsF0safxSi5itM0X3B7Xq9hm5rYKUpV/7MI5jHEMukqr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
	b=zDSl6HE0MG3stCwyT1ZvrWnN7m3sTXCWo0+mIjpoZ/yXCqRTNL6mpw+WM9kIhxSf8GJM
	 jYJ9Y5wna+VIqhx7NpXu0ufcaoZ3AMo9DQSAmakRBVne/mAfoardjziZl0pZPKvHg++fA
	 tSbewdXBnVYpbGURZYd4QF+QVCEnE4MeV+oa9sBHjfTC7eIBa/uzVDRPXiRPYRaRzD+i0
	 jWnZ3/MNHFLj803nULZaa4HrcOlCqoLXaGVAn+DtRxVI6Jm0IfvsLf7Y305HsglNQ0FxW
	 gChPVi7G7mCf2ujxR/Niz11rnSiwiiUm+PWP58gZbFMVDxq2HRZZTY5EDjhDf/EU0Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nGXC2mr8;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5F96077DB8
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 18:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5F96077DB8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nGXC2mr8
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso520254f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595142; x=1795199942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
        b=nGXC2mr8jDEFHh8X7rT1WEuyQyAOtyoVaJp5hD24VULt5Dm7tn5F4rQogcz1AKkt8B
         GbsQRDgwSeNRHydCV8O1Hf2dk9YPkq8TTOacvrvqNUcKJhd0pmpYNxAhee9OAn3Q3CBb
         ZrLDMEXjtXAByco6PMvyEc4Xctx+kkdofg5qfcfru3MRhroRs5e8pFa7aQn0UfFZsG5M
         IawcxBBflPCVPeX9BBMQ76gpLVA7LVYCgcNqtEAO7pfK5UbS4qgGZFXxWtBsDRRjMzcE
         xmBeK91uK9gZwr+1rZrafLNgqEXXbHruS92N+aVKjk5Mm+T2BzzvS4ELissMU9eRY1Yp
         90Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595142; x=1795199942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
        b=bd7MtSeaOrE8mB6+uBwfmGj6syPpWa/9TsMfVbx4yVkl5PgcSy4KrPPuA+UuNQqydf
         tyJii0YwqBLS4OX/bxlhxwbWCxeU4vF4CEzsgpxFajVs7wLURK0b0hWELYtWHpievceE
         eF/VH34/BiqISKidwMQNa/6c9hKL94RUMgZbBCHUJYrn3SuMhJ2lrQYkhAMT3ujfgOa6
         XPzKMFIVAMdEo7esCtbMSBbDr3whftJBTBFJv8TzylbSA8lcPd0+bfZrOR0BQj8p1QUx
         lh7OzPEButeTILpj43VgpaJEUqCekJJFq8NQWKN5gpAas6tsyUthOVxdYWYJ2A/yjm+Z
         pkFA==
X-Forwarded-Encrypted: i=1; AL+hErEYBW53P/JPBN1ADujyK8kgeCtlF2t9QEhWg5yl6u9WIf33Al5OMRrXSYG8Q3R6LAUur0kNj2439xWy@vger.kernel.org
X-Gm-Message-State: APuU4Z+sXbJydPmL4iKApwoIClOE4w54ZaFsgK4UQ1npcgzKeUq1pgas
	yDlSFUYa9/kdrY1Rw0w8EDaBBJZZfNtlbyfZv5cZFF9N3iB4zgkqRvRrB41Pk1Df2F4=
X-Gm-Gg: AYBFou1k/kZlOLoATrTZgGeRAGF9KxPO84jBhgGGlzLinxXCd1yRpi4iR5FnhPVagQ7
	aE61OTqoq8sEtFWqurmqQWF3S000fvyVW7xgzjiOLWbG5MuT3Xnv9Q12kw7t9O+kFfBYqJyIUr9
	KLZzYGgXYci9WfVz6NBG3oLlJcPkQjxju7DmQ4Vgp5fMR8UJPsk101YecmpafpvrZ6rmp1JL0E2
	cvsQ3WsfmUGWJbtfYgKrB6KGVDwQFCHkv4I0sjwrqzS2L+9CQihjGt/4Lfq8iOHfQLzSgO78IUV
	77IyETiiwLLeXO10HU4dF8xZycvYhPXDoC61zPQOsc1R0LQ/jg6ZdF1lQqZR7ZE694DUbZtQf2x
	KyxNxXGgI99GGks4X8wm84qHrjtUwKsPTSkoUsGrA4afWEbYxP7QrxRIGTwiMVxHgy9UF40m/bt
	FGEVFXImoz1Pix5T9Xlo4cV07Xd3M+goDxy9RtuqG2y8MbX0QuBotkvRrsFOk+e/pw/Hd+2+0Jo
	SHQb915cxLrHd3XoiZZSBojZD6FRvhPTturKwbl4l9i/vuMEL5vLjLeR36KEBuwoiNdYfSE6ek/
	shJpXw7Jb6H9o9LzQKyfASrL6tk/f3XDsf4jyFhrMdE=
X-Received: by 2002:a05:6000:4697:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-49c7458620emr5628794f8f.49.1794595141531;
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:36 +0100
Subject: [PATCH RFC 22/23] arm64: dts: qcom: sm8650-valve-deckard: enable
 audio
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
Message-Id: <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V5W1xkU5JSLg+slKk1AfIWeDvtlCZVv2u4mE0vZ1GEw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91koLJdzmuJYexHUXqCwf/rguGD0uVlz2GY/nKi3
 xzdtgDCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKAAKCRB33NvayMhJ0bV8EA
 CP6h7TdIv30wzog9Ph/7TaDUOU9Q0KoVpgAYqjAzcf+icYGmJ2kONvsVh8/7PH4note+jLzG4tDvTg
 nzrwuAj4KUDPAlz6PsQ0XHZ29zJ75rEWfDIcEdF7vdhPYIovfSgs6QqLDpS1desaMEODAJoS795EuR
 iEfrJWyLP5ef/bcOxxWzXNzoSsZ8A/Bt5LvYXk1HHAUA+tFPJhz/gcwCBydcEOTB1yo4qRJayeiKVJ
 Rcu1DJoYfimFMS66fRmnsNY6R5eAQZ1B8TESR7wnoyE+HFaY7XEe2rWXyhtMp9D39ig0ofzVxfvBfX
 xClL2KpG9LTBkZ+JVJyZ0ZGlzjrbxZ57KV9KGfbgr/ifMSJ/eBIUb8zKdUnuqKwQG/0xmOgGYXvoaQ
 oUkbQeo4YfP7z7bTQ/6Nx7byp2lGcbrehRCaO08sxRUtNvRMx0txP92TmhKIVG0+kRyH056YcHvSfl
 uFXPOGWBL0r5Hbvb0nq80KI4A0cCyrHZ5L7hEzBaIZY0mL/EEWfx31q7RHb8acgQTvlh+WLJBIuuKi
 SHdv3y0nTLm8aCpLij24hLvJwvowGkLPsz0Nqz3L7r9XD7eBVkTeWrfOzngpRAPTHBq7P3NEAWHkft
 L83kztdj+ctg8j8LHeuyGltN3XftbP1L7HKNTQojJmNX5Zlac2vC7lPbC0rg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Deckard boots Linux at EL2 without the ADSP audio firmware, its speakers
and DMICs need to be driven through lpass-cpu.

Include sm8650-lpass-cpu.dtsi and add the SM8650 sound card with the
speakers amplifiers on Senary MI2S and the DMICs on the VA macro.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a365caa28cee..723f7911fc54 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -16,6 +16,7 @@
 #include "pm8550ve.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
+#include "sm8650-lpass-cpu.dtsi"
 
 / {
 	model = "Valve Deckard";
@@ -160,6 +161,37 @@ framebuffer_mem: framebuffer-region@af400000 {
 		};
 	};
 
+	sound: sound {
+		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		model = "VALVE-DECKARD";
+
+		audio-routing = "VA DMIC0", "vdd-micb";
+
+		speaker-dai-link {
+			link-name = "SPKR Playback";
+
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_SENARY>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr_i2s>, <&right_spkr_i2s>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -776,6 +808,38 @@ eeprom@50 {
 	};
 };
 
+&lpass_cpu {
+	status = "okay";
+
+	pinctrl-0 = <&i2s2_active>;
+	pinctrl-names = "default";
+
+	dai-link@22 {
+		reg = <MI2S_SENARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+
+	dai-link@19 {
+		reg = <LPASS_CDC_DMA_VA_TX0>;
+	};
+
+};
+
+&lpass_rxmacro {
+	status = "okay";
+};
+
+&lpass_txmacro {
+	status = "okay";
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <2400000>;
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;

-- 
2.34.1

