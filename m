Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706563;
	b=R46knveKgzSjE/pbZyglBW5YjHRqqYRllu136EFxye+nsTn8xdDAfyERu/WLXMeIvIRe
	 xH0jk5C9EW+GJuRscsI53JyeBkZo1yRPEkOxRabMD8UsrXFxBHxLzGiNGaFMlNSSXUYV4
	 NbdAhWaiWZmd6jXP+xQI3ooyLM+qpBjNQ0jkUzcISJNP7jZ1PcrpU2JzVIeknMYHv98N4
	 PGJyGFjObhPw3cIehBspSaGhVLP1ZlvxJgxUaikP0gikcuFB6IYCHMKtHc9REtxOQdoSh
	 PmV8o4N6NMEzHHrI6RGjGjye3wk0yMmTG/DQKRtlomVDVe3LTNl4yvuChT7c7MO/KBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
	b=ovaDH6gyDyAx0Exi56+Pq/bFsNezpC3sQToGPc/Tw+JgqFjg5ctu+6l6ESbSmNDlxqAB
	 sYJjc/fSXBm4AEGnIdtV9btWweDrk28o8fODMhJjg7+p38khT9TxUegzZ1mxUjy8wGUso
	 dvcyqMOt8QKx+yQ0IWhVoOlqgMCnKl0FLGqeLc8Hw7AFEDnfd/QPK004m9tZdkSDbyZ+m
	 TWaekiemh4ITv7wHDGgXl8o9waFdGg8o47LppdmrCLhasPo2KGnTbfiRrGM1Fg99fssjA
	 NCqyYFIzY20OmOY5NwQTp33NL1TmYEuw+kbU7kUEFsy7IKj9UzVns844RenSTcW65Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iZu+/D3B";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E17A606A331
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E17A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZu+/D3B
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so3920378f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706562; x=1796311362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
        b=iZu+/D3BniANHRXs2lzbkw7LWRXccfghYj35WKvmta9S+XdGY6U2rH8Mn/8As16s4w
         lo4HwXSBajMqRiU9kbpUWvPYIDQ1FPJmaZ2AX1EgbehGTLoboaSEqFbm5P7EP4M+GyKX
         znnCZR0o7glLDfiEtbztxhzRozOI6FJpdWiwsCKZFsgiEUGrv1uurtDK2LhAPjO+/jVO
         1rhvel0cCAeM4wV8nDvDjmf+cOyhq3Vv7tJ6jDAZihpHEO2J6xenYpTTyPlsC/TfDzSm
         a++r4qhm2D+aZOLOYMNocDhDij4OquLkvot7uFDJEcUfn+x/QAcr8MYbxNOXUUk6iUo8
         Jelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706562; x=1796311362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
        b=wFn9Ev0v0mYX8MNVq+bUktDkFVGXK6qX0xRPBrxfrndlliEVi1AjWd0cpVTIwldYl/
         E3PWl3wBzxyUYU4h7na4mNeWqh4OXD+CcaX5W+yMkGchyhzsI/JyRVsaIEs4DSilvCih
         19h6n/H5f6UkrCIBu/g+fxGYnUw0z8qbG24BKyeNmmYc7lucEV/R9juDEcMKGnAVnayK
         11qHSoaS7EMj3JslLOm79E8Y9D1qQqbRZ4iaAXpEWozOwCAZkgI5u3TsjybiXxZ4QiKb
         IoOnMZ6h0Hi01Y/AUPUCMDyXjFpL2AUiyjaW0a3jzZvfYTqwe0Z5sZwS+5O9rAiqgQeY
         hVFA==
X-Forwarded-Encrypted: i=1; AL+hErGIe68fxhyaLLafX0QvHfopbrs0Sfs3rlh/+jZ4ReWzIkZ4PoR4EZ4q9Yi1Ma2sBoMNqcCEa/Te9D9Z@vger.kernel.org
X-Gm-Message-State: APuU4Z9bNhpyB22Jdwz8f5sv8kNZ5UhV33vDTJPZtNi3vuXor6+uc0g+
	J2yUchCWkSL3GnI8/AGsOXpGY4VQG8JY0/RgbeQRiMovl+pCky0fGW/bs3O5NA==
X-Gm-Gg: AZFdTZfIYB59hMaCw76Y4bmg9f5AVyqXSkiSmKaHUxDS+bRhzrUm8/vac+EltfHT5sP
	arBqkvHeFhaaKfiEmUWiVD1zCQscRp4FGRObcqpDiS5q4SoiWCiJqvu1zNmmfXDwSSFpovslTCq
	AixvFr6R1oQVnjthjhyApx1Nr25p1FOdA13VCuG3JOsFCgimNkXNp6IMIp8Oth5hrlDumcG+cEF
	FC3UoDdo3GZoOKhiURabMCXCqKKonuyCfXz+hy0h9r+0NtO4BgISV+Dqz7h/vgVzec6PkY0mJ0w
	OiG60tOsiOdcpnnWDfHKvuRO/p0ObK3L+8QtisG45WqU+OFCxt+MiQoqo4PGH/bNY+tfRdJwUsB
	t878PFbwm/nVq9swgakQISCm/AC//scdDXlI1pBploN+LtqHdvDIItrzuCtLZpmmL+8806rYSKC
	NAx4+Zpk8NxblyPP+npMgvy7BudNmALrfybi0d+fl8/5Wwk5CdPB8NRfhA6AkY7ZeoDmeRR0YCz
	eahGEeSc6TMuWmmHibMgiHPOYOsoBWCDWtTEnF5OuIqf2r3bD+Om69y9vhhRJpeSEVVYzx6Q60r
	vos07Rw/zO6v1k7yHUIcFQimFEONpIid5BySAg==
X-Received: by 2002:a05:600c:5303:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4bb88786cfamr410681045e9.0.1795706561725;
        Thu, 26 Nov 2026 07:22:41 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Thu, 26 Nov 2026 15:22:32 +0000
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: halliday: add gp_mn and
 gp_pdm functions
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
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-1-b8543d6a83eb@gmail.com>
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=1404;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QegpgPfocKYFJp+cQizBP2hJGKseGJLDx0NLMt+xxOc=;
 b=cnZmYNJ0J/woBA32L0W/n2FpxJmTXEFp2rRyZGRko+DsuEi6MzOSuCfu55i3nZbkgD3GUjjJ9
 lVDNNmqaX7YCDxP78kfu165KKFClqU6BbexaMsOaMD5BlHlOSdC5/6f
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the gp_mn, gp_pdm_mira and gp_pdm_mirb pin mux functions to the
Halliday TLMM function enum.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
index 2615d40b0478..e89220c185a4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
                 edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
                 edp1_hot, egpio, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
-                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
+                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gp_mn,
+                gp_pdm_mira, gp_pdm_mirb, gpio,
                 i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
                 i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
                 mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,

-- 
2.55.0

