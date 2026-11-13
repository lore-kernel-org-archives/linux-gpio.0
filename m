Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595145;
	b=dI/E9ofXQrh2nOkUWCYB0/fuu3xa4Z1fhuHQKLaRnqBtHqSHwgg7RdkMfHhJ5pPWus3r
	 TXyE9o0ZdRFCWIpRZbOq+eDh9FY95V2ruY2sLwqZ7CWZnY4ZN3O2zl9osrfwcqPUpN6ro
	 7cCr1Pmrf8QmxRFZ9msK5KqWl1NzarWOb79rPuHkmC6cbc1RpPhfpKepnS7nu9k3vogsL
	 vOvU54ZVqysqueN9Ex/mfQKnkFZgNpNnRLt58VE/O1O2bsgYio4c1D/HqVnPNkMurBptv
	 C2CHJsPrNw8Gz60bvnYAWxKM6YdnQHzRoboqgZETKe4FWICxMMXahMWLp/fsDb1Arwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
	b=y+WOAfy35rne1T5IWyVpwbTdjzqL804Ti1VjPpFhg2hNUM1ptOr3OahtLS5CCaJ3LJbF
	 funsb98keh2tD9aaq6FyhkcqVV8BNrLCvEuQ9/+XAHnmzdNbGxwKf9bExEH/M2CmiS/+s
	 nJxDXSM+EW+jJugJGiq14Xo29PZ31TyEJRV6iGhAJy5o6RKQZWgebXl/XwaOOh6djieXW
	 YZ4GKmWVKIUL0tm7xo2Ss25oAV4v2MSzJZUsRHExjb6TaPTawvWwR6c6fsOJZRgyuM5gb
	 RrzvFShN7OMjLopuM4+AGg4oTrwsr+lYur7csdkNXqWi0nbZt0e9Fu/ByqMZ6ScfAyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PHOkcPW+;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B96160787E9
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 18:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B96160787E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PHOkcPW+
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1731001f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595143; x=1795199943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
        b=PHOkcPW+PAWPCSsGV8WrL7VmLRK1hUSLoOrv7sGnoY8W1UJWtOT8figiBTJFuJhkUq
         RHI0iH3Q6i08V2EcS74axfEZ+Cq0j+8y9Fmy06OkeRqeCGLsv0eiIBsvhl2qufsdBREz
         oq7j4p/lPogKbm5glbHznGcQX8rCIEQf+1yJ8PI2s/+D3TnQdvWN1ERB3mG3Wz1huvrq
         y2tATk0IzBEEFTGIQKnssOD3yggXQ91RR1E1tzI0VgExCvUz4bEEgit8iQ3R4ChjGqJs
         yr7g1nQdi+bJs+40929504rGGJ1RxNH72VkPxPXGxA+IwfoCGfBhgQNKiJvZ2eYm4zD3
         lyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595143; x=1795199943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
        b=ZwfC3etOj4z/ChqTBRb7RlMH4x71knVIjzRNTSzflAlBbIGDH1BcjpLqpYey86TmQi
         iLMpvIchhpNnLxXj74q3iL5JT76pgNpA6p9ko/KkWj0N/IaVWwNpZ/Fb7Q7COoMILfuf
         6i1dl9XxinSK/BPpkcwM1ABwZdvDVr+PhXlm8NbPj+yQxhH4mEcFfSyjHV0iTIbz2BBB
         SXKVR37gJ8hYd5bWkwHNZPKVRirh0NAeSAOhQIQIBBbdPZL6e2JK2cZTm9JIZIojUZgf
         VG/Lrs2MTkpnb8YL/AfutvKk/ERJkKGNbTyMaBvvXunkdxnioELkikWI+sQ3Zyffmr4/
         B0QA==
X-Forwarded-Encrypted: i=1; AL+hErFSZpn8ucNHAoApwDgzq6hRRt/hw0taPk36vtplXKfylFwrKj6KKw0XDyA5OIh0JIKQ4+1sxystrh64@vger.kernel.org
X-Gm-Message-State: APuU4Z8RwssY8q36QmreM0OhQnZA8GjG/m0MNpBwWsJ/6/T2c2BlTeVX
	IsMOzMmog4ezrt1FlVrANBEXf4Cf/9mRokQ8Niv1rOB7DVoTdOt6W7aqQHZ4YGlGKmg=
X-Gm-Gg: AYBFou1as4RJ3EUc8a5N/UMuXb/nIgNs4uakdYKXAxO9jm9LTZP3Nb/chhX7tNxxqvH
	0pCeDH+CbqPyayzNXwq+izm9qq9U4y0nZqX4/sbtahI2l1YiypyJXxmwliA2i/vEJKgyHU7M7le
	GhfxreUaBJh3Er9FJDsCz7T+e5d9tMB0TkzWiSDIUPtlAWbkserBRmqcpqnmMLtcBUQeu/l7ldE
	Wnbe+MhxlBnFXa+JGO0Ewe+aVxKKs1Y6KcXU8FPGxk3/VzIBtCY7qSgb1VAIkYQtq3mcr9zEngM
	X8WCRHRKbEFSEFTqLk49K5zguhFPGywmYQL5w5Y4+y+t1JJGUyJMMlAMj1plKlrPBbX00rfc1xe
	+dJYU+cN88fP2PM995NnOotUnvtOjvN61r+/ng6NFvIab9mNxx3ylhLpjn0jR2v8hkiutjnuzLI
	2njV1ON6JWyMI8en64pu6cr8VeEFyITzyCA6oAwbTsmbKvTpHmSMfxaHhGEUvQsc7hym/A7XqvP
	7OfyITi3uQIq1h7V8kFZIJGB/xheZ6AluBBzIt9Emr74dmqxxtVRZtfLOuXIzFDX8mQmAtu+Ipu
	EvgK3BP+wA1/jidXGEWj2TubqmSTziPIIljjs+xrxdQ=
X-Received: by 2002:a05:6000:290c:b0:493:a59d:880e with SMTP id ffacd0b85a97d-49c713add85mr7018623f8f.30.1794595142585;
        Fri, 13 Nov 2026 10:39:02 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:37 +0100
Subject: [PATCH RFC 23/23] arm64: defconfig: enable the SM8650 LPASS CPU
 driver
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
Message-Id: <20261113-topic-sm8650-el2-v1-23-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=736;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TuP0ZUisg9EWjSIcUm86e7zEnoMVli/g8vNCUSlRTgs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kpXiEkv6/Vb4mssFp0ghv3S+SXNBFifU6hH4nI
 NXpSg8KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKQAKCRB33NvayMhJ0RxrD/
 9VWK4iP0Ou0qF42iPGPcogEvqT+dCtX04UEO3IIJMgaC6ibnCYdgfJ7lQuSGBEjK56j0ayXnneD9T8
 zDg3QYSTO/7vQ98uMZqODrksixRlNB0OCNM7IBHrHvU54JhJ+jueQ0APXrqTVSn6ide4liKpYgR73R
 R+zhLFhsNR5mJ7UrymGr1R8hxYkI5PKqIJAiOJxp7Wy/xkKlWiqvcx0pXQgh0WVxBpEjnzQMNSQUFb
 7bzLIBpv4Z8RH6ORYZclZ6cI8vvpKa3nQEV/smFAoNF49vibmMduja8MxLLbFFY1kdYSnuoETR0GCC
 +2pPh3t3fJ4zFmos16MjmoHh9zlzxZ3pJiOx+VukD6/ZJFnUnqdvW+fyqLe/mWLv6RfsF8k9xun/aP
 q/LiU1yZbgPCYjLGh9n/ctTLsXctEWHj6tklTsnpa3YW4fGTyyDk02MDJSyDaMh7kzuDNY28Ds/Mju
 +4ZEm2EolI+WYfyeTRh0VGx2efXRDXIsvmANBlze28SouA7zCokJbpKHQWVhDYlzK8+xrSxHHvhuLT
 Do4zFI0TA5TFPNxTiYcfUh8WX6SmKFM7eMv4e59PcGkPqv617rst7kwLcPlANrMvJ7UeoxBSP03qFz
 GGSdZ8Wt0EEXHSLVZCeGpFTAR1t3ic4Ja9sSzzwZ6FpbmWMaim1lLb8l5IRw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Boards like the Valve Deckard drive the SM8650 audio interfaces from Linux.

Enable the SM8650 LPASS CPU driver as a module.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..a2dc062f5b33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1116,6 +1116,7 @@ CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m
+CONFIG_SND_SOC_LPASS_SM8650=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_QDSP6_USB=m
 CONFIG_SND_SOC_MSM8996=m

-- 
2.34.1

