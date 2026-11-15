Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764589;
	b=XnoTWpXbKu4bsTMnYx+t4ywSpN1O0ukPvTEG1HHNRTaJ7Q4rOGznvX63wSWqnia5waIA
	 dXl+ovi5a7rTXrL8UyRU6YC5GGkVxpEZmH+rekZD37uy9ybX5ThVR30mVXOln2VulWfqA
	 id1YJ63MRIaM+Grcg5+pujOWqIpPGltqfcFYdAktJgNBXcaYIflj/MjEYY17BdMGQ20ox
	 kGd+8YT5gA39PPiow8tRm35D2pSnOrb6h5TBu8IMBcYXgUhlaoHWOVMQ03bgVC5MF5wbG
	 FaO9iSWtHZYngy97w611CqPJMjTDOh7YEQPewxm4RdntsDGtDnfiyGs8Zv02PXFMMXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
	b=H7nVrBlADyeX3r+eTkiCE2Ji00dfZaiNGi6tSOuaLQIRAzEZZc6Y2gQ8mmLN7QZj7E8E
	 PNkGBLX1Np49ty3B86LqF9itAupeLlPDMFF6nqGnkWzdrUCfhYtA8zUIgtpAOlvuBEsNL
	 1hmqfD8IZ0gfumQNbLaokl/mPUne6nnam7L4wfwzT8kLa8qsmv4EC4C+l5wCeMTJNPPS7
	 nglZ0eg8Ti5SiEGvWjsr81/CiSyw/1zuwZYxPxGMSCnShf6AZOLEm4lph7pXwolKrVZmu
	 i31lIq/iXSD3c4hLA75x+iExxWi0kK5WxzRQmrWwz6tgzLLlY9Q1dqMjOf/IYQuIwRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcvgdI2h;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07530606A31F
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 17:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07530606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcvgdI2h
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3282649eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 09:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764588; x=1795369388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
        b=PcvgdI2hMpvMdiW1+HQUyQPn73hNMwjQBCwx2gkXPzGcBD40Rm7sqewFwAMwQCrvSt
         dujQtw5KC39VuO4ARpPHiz3Iu+zKcCuXu8Lq0tBgOi9SUEdX/QGMVciLkHTJEwOvAjfM
         Z9hMoL2L90bxWRmAxOxqdqU1DyiRABaDLILrtFT50DBkiGTsLzDOE48d/UAbjKMf1AwG
         feu6Fha2eouQLYBnnvCedkwY0fj4ZGKC4bXCNatK44fRWUVlJWVfupyap9ckJWUErR+0
         eUl3RMiNb7nhdmEhxuhtFwZ7jvv7hluUuX6DMiuvI+kXR41QKL7swfA8LdDJotG8cZfc
         2f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764588; x=1795369388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
        b=p2tJqTny4v3rzbdqGUAeAg6K2im5BC7RP3ljP0tOsVDzQH9UbYUHxMlAw5AKh2UAXA
         4NwS4ZI3l/HVY2CZs/fqww3Drtaa+MSiEKYL98BMQH2gGr6pyiptIk9uH1CFUOwj8vOv
         fY5sSy1ZOk470VjTvxICuDVRG89XJZi1PZfY9rnXOHaPlHfoDIrcTsSLIJ5tO7cLz1tv
         77BXbBlLPOihLr+9U6JSit7DaX3/7ESavwkJhkTGIauzTGhPQriVdJbBw6dTQ0xn9Ipd
         p3zASV9s8PJy9UU4Ol6dlDzaCFgZQ2cRRTFEZlp8l7gbDgsx9VXgvlund7s2RE1WGTKs
         DUsQ==
X-Forwarded-Encrypted: i=1; AL+hErFopz2IKh9s/8emHYI8349vxzQ1I6bXFXeNw+U5pZkZ9D3PbBdMpFCSCkmM8ha2aiRVmOY1sQ2uzGEK@vger.kernel.org
X-Gm-Message-State: APuU4Z8QsXk9oSnE04rSTmEKixfSPJ+Fiejdem0fbhaSzxPP/H8H7G6h
	9/rcn/8Jv04bftCCZyXnTNmmQGmeL+YD7hC4/YSjGaTCcBYId38n+sXqnzY8+7bb
X-Gm-Gg: AYBFou25msHtCsEElUCmEFfmRDCkB2UkOpLlpO0o8LiqimUooh0EB/sJoOYDqHkqRvW
	ex/uDMeS0VdBP2SvcIM2Nxv5GoH3DrTdjFP/QuyIGwOK6UASwtzcoX2NSVVCLqLWcbV5OQvMEYK
	yu8Asx7jhaU5ljUAn2Lm2QO93vHS3teKtJXnqg4RR0MeiAcIdUop+COuLfTeQgsKoNIsbQP6icV
	r0ADSgMTkvOaSvcKh3M4VPN2dRQMnbf+G3hxjd9PD+c2qtGXlsBR9joKyAw0WYFNwuisRyUDBUc
	NWhmCIZbKs4iXBSE37GiCTY8skpEPVOPKhxVNqzXnaa7mTkzlN5Was7y40TwRu14L/dvaLH9+zX
	B1jXAhc+r1m3ufksnEcGoMk+qffoDk3BsTAQCyIfBn2eWiyMPEhzUuonXeuzzLKp3+fv8+w8fCv
	iaIGkZ2B5dAx4zUGJZv8hlqasLiOcKg8cjj4QpEWVUAow1eH4NpMxgsax8U9GQIrv7ZJjhGnnbm
	JuOyD+EAwasXHejdzLXaMFl3VRHdPUedlVC3ZxfO0JbdqW/BTvAQLB94vzuJsJrcdK3sKwq3c4l
	FPKmTwlOat/XIbDi7XLY7fWxzuCGFZw24jNbaIaPpecevmscqkb+mqNByi6TwiuOk+DaTjTOwPw
	6OsjQD9L50SAHDpihHN39tMD2e4vPYEZRWPKLvPlclPU6GSm1xxil8FVthhjIjE7xEQjcVaUzc9
	Yd8ObZrRRPJqH6jLLQ0NOm7e/40Q6h5BKrWrIHqIK9AZyZ2N4=
X-Received: by 2002:a05:693c:87d5:10b0:379:f7aa:1013 with SMTP id 5a478bee46e88-379f7aa1638mr6773932eec.15.1794764588005;
        Sun, 15 Nov 2026 09:43:08 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:07 -0800 (PST)
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
Subject: [PATCH v2 0/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 15 Nov 2026 23:12:35 +0530
Message-Id: <20261115174237.48908-1-surajsonawane0215@gmail.com>
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

Changes in v2:
- Add the DT binding as patch 1, as requested by Linus Walleij and
  Konrad Dybcio.
- No functional change to the driver patch.

Suraj Sonawane (2):
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
  pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1

