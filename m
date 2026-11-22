Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368924;
	b=wB7a6pJfVkNJe7JMi2LEWSMp2kX205L7NZ8OYtsNX/0ihZMv7y4Ajd9O5VTCumrEOoyD
	 EBakcTAM8bJoK2Q8GT0gRGCWDt7nK1YDbxP2QfmzPCZSEOagPQXWJwdMuembAxSF3fDvk
	 ILEX6MR0Qy+FgLpN2Q5MS/4EeL1XLmA/6oP5zjefi+/koCBCFCft0nikI3K9PCPqFMtod
	 YSKFy4R5FapCorqCgtfQsqdhl98QJgKELoXjU6X6lWp52xMLkfB5c5gzbeayRjV6C5V+/
	 i65ONtSf24T+BxA3MR7uiIXPLb57HJ9xTWX7U4xNfmmbtao9fcORJDyKcB/2zFwzp+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
	b=zRrspWr+S6y3MXApQ0Kq0+hQHXl2t77rQU+spUD4y2NdhWLFUoeisxXWF646/E3L7j+Y
	 Vtng5ZWQG8hItJGuYlHK6tSsY37+DOB3rm0lvXo/l/RjEeZfE2Lm5VdykxsSZ3uInn2Ek
	 j7Wpf7QJFaKuRCDXIQcOzHl9xreQ1glMkHpRaw02L2bc/5O7WgVNUGH4ywYz2RdnCWW4j
	 A9hqvz7whJjYAKscu+vQmM4EtBII524JysEKH3psihx3q1cmqesllGzRVipYGzEllBSF9
	 XUwFRcObZoLUV/yASXtBEY8nNLm0ZZI4Lo0Px1vve76dtIy8+MfNsfT49JMNbjIBdNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4qC68+X;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80505606A320
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 17:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80505606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4qC68+X
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2982902c88.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368922; x=1795973722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
        b=W4qC68+XpfqvfpwyUVqGzy3qdQukJLa8vbARoxPiUyULgvpMdOLwWZ9mdNp7Y+q1S/
         a2fmnkWbUQ4g3PDmBD2Xi+MVOCf2H3+KwoihsgGiI7itQbQQB35TEA47qniEOyOA9qZU
         fW3nC8iru80q1ix8yEct1+VqIWJEeD94z6WUOs27OvHaulTz3Kv+7Jn6/lNkTOkLGDde
         /5NAWSb/AoExQZo3VKznyWbOCIHfqdIC/+3Z7mPBw3mqJoMXBOOLa7D4Ud9zUSgp3jnF
         29MLaCjxJOAS/3R/0vMjJWRGqddVakOkvd0y8p2F58PDKuc9jgJYBZzwQjZUcaWQUHDi
         QNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368922; x=1795973722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
        b=rEBNnlhTt7qJD8dkiVUTnOapI6HA/Xu9qqZD8joba8aXEPm8k1RH7044hk2EezJdzA
         e5JkYxhDXUd/DLLsngsrcPPMhsRHhuSrl2MFYpkE3cdaqazbfTJq167bbL3+H6GvJo66
         KqNu/MCFBcrSXheEwCquzE3GFqM0IPSN9CbZ2+HjFMbMD/VYKOft44m/LcaUHMhFpF2A
         D+xqfXVcMF7mHtf4SbUxpeT4Ay+00g+fGC3MzpOXYB1Th57ZsTFqfplQUky35C/ckUss
         jl22PqP4f9BPSBX+rA7IExK+FhXVxlEtkf4woY43nXwKipGeOpWEGGX99osuwBQM+t6u
         Xi8A==
X-Forwarded-Encrypted: i=1; AL+hErHyJsO+7LQbN2l0KwHFHXelr6eG15+amX1ONeVu+J7MiCn44A2xFIwlTX1EHJUOwTzwMSvSDqkbZYr1@vger.kernel.org
X-Gm-Message-State: APuU4Z9zJJbosaS0yhq6WueT9nMfA2WtkqT+EvhMuycyOybkMlCY2cmT
	6JSm+5F7Fuw0lRi3X1qUzJ5du/LYaGR4SuJR4AZlWUIZ3094LqUGHFLQ
X-Gm-Gg: AZFdTZd455BfkiO2Bl/gMibXkdFMizKgEbMm6efG+TRo7WpTGdz9DvoK8chqmJPgW+/
	ThfxCJnQVmQS1BYAXBac+y96/WuNuph5P/0jdhJWtA08UlA3HMB2UJ3ytcIb5EYvM7DPhiZ7aE5
	gOMKHYN3Eo9lzh/vTKwK3NNRn21pa0L12qzge1WIc5l/JGuDtbhVlmnh7u7ut5v9vZaodWXFT1H
	BtYS+JeL4QjUAPRh3Kwer4VM6T4e+KM+7jmR2e/RhU2OwQgmsAK4ZXvgEEAIuMRLx+mFzMcf8wF
	kumqX1XpoVCs72RiUpgPIw5PI4TClWiYcJdI760k5LjVxBrN8OYDTR91ZXOYEINclJbriGgV91X
	MlFVR5sFRVJRyy+Nfp1KjNgp4DHnO8rJdFibl7CpCJpk4IUQX/fih0DATDkuPVcmMD3PDqgf/C3
	TwRNx41LX0Mg2QaJzZccKnn/aV/nIuRkqVQLBTwgzgQq5SW1MsJiwpoCc/ny7dPpCk6+crdsbE+
	PkBlzZGq6s9DI4qHRR0pbw8kyKfhxkZvZF08mqQSE2gn3IOXQY3vLLARVsDKcV8wf53M8GkkfB+
	wKX22+Jqf0hCRlw1FRcah2Bmc7dfINCbbtBD+dZ7pUFa+a8BbAaYf507R0S5GkS9bzKmucFmUq6
	i4UJNPaxx8HzzSol10i+j29OtOonRxLXgw/+GFTeqJMDofhik7KAC8WKwtlXdAmXBZ2DimCNQiz
	6NAm7NmFu9TYetz0W9YTk5IojqSQ==
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr7108384eec.34.1795368922569;
        Sun, 22 Nov 2026 09:35:22 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:22 -0800 (PST)
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
Subject: [PATCH v3 0/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 22 Nov 2026 23:04:47 +0530
Message-Id: <20261122173449.21009-1-surajsonawane0215@gmail.com>
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

SC7280 LPASS LPI gpio5 can mux EXT_MCLK1_C, but the function slot was
unnamed and the binding did not allow it. Name the slot and allow
ext_mclk1_c in the DT schema.

Changes in v3:
- Fix commit message: do not claim existing SC7280 driver ABI.
  The driver patch adds ext_mclk1_c; the binding allows it.
- No change to the code diffs.

Changes in v2:
- Add the DT binding as patch 1, as requested by Linus Walleij and
  Konrad Dybcio.

Suraj Sonawane (2):
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
  pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1

