Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540468;
	b=UDlEUHQmmfdM4GSA0S10RYk7axG1S73Cze9RJWuU+6Z4m38KFmxV2wSH7u8F1JDnE56w
	 JJ+4IsgHSZzopWXbO9aZtQMpEMj8kA6YZ54n1WAb2ps05Nkx2o+A7+56O8UnmNeHF+BiK
	 P9URkhpAxE0FLomqj1GXXYmhg7HvBNnHWpzxr66gC8A7ddCi6mERxirMT6tMpiCf127NF
	 bQzfsiPzqIl+/wp+J5rB+0aur0/UKU7lQit+FYLQQOwGMP6QTZRrM3Kxh60ppriWjkF8n
	 fgsaJuIO0l44SWjJsFLECJXHDBYqyI74TBpXhnGh8idwjbfy0i+VF4ErsDpF0s9rqDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7uTzZjFbfwiCl5CZePRaHtIXwUWPwQMotNCrGINBjVY=;
	b=U3Jejd15pPT4bbtHJS7ECa27VGwki56QIPFrsYRyogDLrzswVFomteikHkf1T7RnGZtc
	 XWMZC4NbMOWTKvs5og1vS87jNtwZd2JWzd2zlW+3ySya6AiCIOmpiBChQgkdPTxhwZDVo
	 x69ci141fFbQKLrEEt/amXXAKJzxr6XV0cDydjjSSbOIiYmBEnFSuW2Vi3VzcXCwtXgfU
	 N7fw+qB/pD0AHvkHrSDFn322DC1ijWxqHgogXdDyJsnNLxaK4xexEqgtJG11WmVrsMkCm
	 o9XX8u4NjvfmMwn48Hyh+GFuxY57FBRCwTGKrAZA5+WNaOWtNJZNztDTeAv+k6LFbdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q+K15bUt;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC90D606A323
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC90D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q+K15bUt
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so61271525e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795540466; x=1796145266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uTzZjFbfwiCl5CZePRaHtIXwUWPwQMotNCrGINBjVY=;
        b=Q+K15bUto5aLPWj8V4Iau5HxYR2cBzQG64tQ8DJxpyyhoHEWxgYsh5Y0cCWK+lM6BL
         P2/7iDemph38FoCEL/UtjY5F0JPq/INEmw5kkmChS5Vw7b3r/jXNd6Pa25VgfPufoXpU
         rAbOwLjiKnjJ9r+rZDoV0uoec5kNdau+iCD08XoZ9NtZfS9mx3TpvckITJvv8eoHy2j3
         I4BInlDKrlIt/mvyDGH0pSjPNK59Y0UQS8Sm1cyaIB0jOfll/8RrUrBLwa03YyW6OFuY
         oSckjxzLehJvgYm7LtcBgMoZOBRDil8Cu1u2aE3e8u231/Tr1CdTwTMlI/g4Wk1uTq10
         SWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540466; x=1796145266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uTzZjFbfwiCl5CZePRaHtIXwUWPwQMotNCrGINBjVY=;
        b=YTAhSsmJKQnq6Di0+66Nos203eZ/vyLhYgagF/QkjAYOIGZHkuAB105fnp04JetVLB
         6A66/BRkrMKuUTfwSvHoGGlsxq5v64vuRS1N8p5xZ6Wb778tDZWN6iHDR/0CGVNYpEw3
         qi9eamCQkl0ugh9NJUtSoM3U9ogbTKyInv8jADNrT//5riLSQ1r/J1CBv0sJIx/MDMYc
         S01Z5vKTUbzo32eYyfEcagWkFUS82YGKKyTYvRL5qS5IcCNpw3zXfSaO8vHXsmeP5MGf
         +EPSjzK1ab9yQHoP7qa55qjwzU9SgWhhQW6eb+geJilut3CL4hY6/d5gxF9o9Th6TcPC
         Snpg==
X-Forwarded-Encrypted: i=1; AL+hErFdhfLEy0dsvp405hKl8L0uxqj/kYez/HNJLeCWqJObObPWHoRZi5wPvNP5emSEjqmI78oS8MEwGN4H@vger.kernel.org
X-Gm-Message-State: APuU4Z+04eatRyd7WVireRQvk3ir2zHkJF/ZXbVBqvuT/W2eql9pjQRz
	Xv/ZhAcGIS9J3VfC+NjADNMDG+j5BC7OrbgusHmElLWsUZOX4AWDg6d90XJpwQdFFNg=
X-Gm-Gg: AZFdTZfkIM6BKA0Zhm61jB5EcQ4YcigCv4VPcli6M+8SEW63bsmkXdODPlp923Tt8ar
	RhfWLFk5PSQPjwEajQfXdS3/I+IcC/kwqFDVb5plUwNiDvUqtafWQbPjHqdKJv4kK37lKrDpV/R
	/LdMiZPkJ6AUkjDlv1wV1E6uxOlsjs1hPCna3O+ZMvykhFFC2zNZKGvP45qAHRpdms/LJsaNCnR
	ociZaqs79WA/Ds56CMqzLpU93SgHYZiduUg5IAMGhoHf4xPogMyMLPyg6/4+5I2Ujx3XYinN+vf
	DS+0vThy50LA6G7LWggYq8xmwbdg+ut1OFdAmT8GICu9v9yQR7ZgR4xYp0QaA5AIzNZoYznJSR8
	MWU7NglfjxDBkiC1ymv2gbbix5jeuUfLBXw1TagoOwm7Lwfk6ktr47odCvJmUNYyoH/Q9H3cGBs
	e9qdvNg4n8ZifRHlMcvWAzPfKIojlb0UG8lK9N6d2YSPEX32dvvyhD4ihqcNPoduQfZFO7yxZsW
	q6ViI0SJ2djV69HTV+6MJdyFo801GHhpHWhtwt6+u9RuQOh5o/5YBhKmTVyVlkinE6QZkfEkVXn
	ObHImMqMfvkW+YoqlEAep7rLJFb29Q3zRsg0xIBG+YUqZ/C4JYg=
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb887865b5mr307426055e9.0.1795540466090;
        Tue, 24 Nov 2026 09:14:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm410592735e9.8.2026.11.24.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:14:22 +0100
Subject: [PATCH v2 1/2] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when
 ADSP is not used
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
Message-Id: <20261124-topic-sm8650-el2-pinctrl-v2-1-fd05c8378a08@linaro.org>
References: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vqNo3GM+A7DfxIT/hVIqFbnwUFqt7CTExTLyNqE/XHE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcXvWM97daWaPFipwES2SGc0Ov/oFxGUwx9p+vQz
 LbQ1apyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXF7wAKCRB33NvayMhJ0TgREA
 CiQBZ/P2rFgLNgGP2YHvKZe+aKwVt3K54uoN7CMU6R1nl5OIeK9BB+oURuIHh003E7DX3eNpQWJvId
 C51cdB9AY37m9GtbAt75UyTxrVRpDYYX8VC2n7U8mO5kRWWOSLaLhelp19mcMixNVP65MPGmnkKpCp
 3cikncHfuFNpO4fHGJ+u1geYj4ZeHWAfU9L7b3+CZm/FLs3dYf1+x2UO5kNnXFWzO0+0wwb0MPN47x
 Lv3UP7KXWWj1jMoXnMI0JoHFN8RwwVTC1jH9SYhMstU97ECO+MKTnkqu3x7EvvxIRsvoVxAE/2w74g
 5PJJFMA7mfI1COwDLVsXJLpJ3Wefc2UjURbUJIU0Ql+7zRUe5afQwyARxySQrVE+m1ES6kkMfARvdm
 z3f4hBjErLptCz4INcXU+/cGWg6ZAoscQ4ZShZUSqp7NAbP2P9/W7QhcSFkR2H7aSZhrYh6dxnWps7
 dQRT15yig4XtUNAEBqy8OrabwAoKGSx6UG9XuDuCrgjNzMp3agzwTtO2DCfkB6Q9Yqljy4dluit66u
 J0CVLVSHhWdOAROT8tbpRU/x1SndjApe5tNFQPLzoiGhPiysqzyaMN28mlUQHEci61CcSeVU9jTN/4
 vc/YXRze6ci/ayes2idqo7oVZkl24BftEdcYZCZ7isJBWbBWSpNLzQTVgqxA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the LPASS TLMM
is entirely handled by the OS, the LPASS TLMM block requires
a different set of clocks and power-domains to replace the
clocks exposed by the ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml      | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
index 1bf08860a4ba..7ca09c2c2dea 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
@@ -29,11 +29,21 @@ properties:
       - description: LPASS LPI TLMM Control and Status registers
 
   clocks:
+    minItems: 1
     items:
       - description: LPASS Core voting clock
-      - description: LPASS Audio voting clock
+      - description: LPASS Audio voting clock, only for ADSP based platforms
 
   clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: audio
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
     items:
       - const: core
       - const: audio

-- 
2.34.1

