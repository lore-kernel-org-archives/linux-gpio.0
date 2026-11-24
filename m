Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529959;
	b=EbuL7UFgLzeNM43HreGbGjD0v/6Pxm/DUy0FuI1kVlP4p8upgqo5fpoNtUVwlLAMnfj/
	 RdwvJuKsIu5Ouhn8bcnXuWwkKE4+hKYC18ybgHWXFhJa5u0kLsUdlu4MyF5eCxHZSIoBB
	 cthKBOF/SrF75dHupImHCCbDC7TDAyKpPSqDXZIQmpsZefn+O4CEDpSGapGEf/OzZWfai
	 IgwVOQz8ZdOzk6GaQektE+VDFz+MRUCrEXMrhq4eqnb71FirmwXqhlCCgI2MfQlq99UhS
	 BBzenfCYmD5OwF+qhgCkDZROrZ49PgYLip0mkvfKz0AxF9y4bFj2CpxQtwoc6f3nX1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+kSqf285EfWl9/eRRplcUwj5s1cX/XrDZcOYyTq3/f4=;
	b=vQSwSARMAwLbOAja3qeI3LNO8Z4GEjs544pSoLCXLuRX63Wl0chPrLG6SkfBrPuJ0dgd
	 ya4ESvZs1bzKx7Im0Ficl9TqenfxARN92msVURT6qtAUkF+XKnS6OLpz4J763jB4fLy6M
	 w3Zoq28PprWSSL2tPbNlSo6Oeq7PrNmKaB5ddjGLbvfjRWfuOkk04qBs7PWrARNZOYG5T
	 0eDeT9snhWnUng3n2Dp5ORYye0RO8HtOf7EIh+SouOZI4EXf47E8pnS65MxBhQC2sEIZc
	 O5oHlyqpwbKSgJoXxyGW7L5kLkrpLxnWv3S9YhGjhd7aFvoGFdSekem2K+UJpGhgA+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HMZRrDaf;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA082606A330
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA082606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HMZRrDaf
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c51a02ad3acso21689966b.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529957; x=1796134757; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+kSqf285EfWl9/eRRplcUwj5s1cX/XrDZcOYyTq3/f4=;
        b=HMZRrDafOU/zPQUMXT1zbW6RC6FQRh00x4uCIKUkiIP/mvmjzEuwltrRQ0ATHnkNCT
         +bE8+5z5no6gpZon/jQWpcXYeaywVaBsKYXvkyLcVqmI7x7o+qVbEDSD6CtSUAtw499l
         RhjrPGowfX3YTZ7MrrMiVUj68jJLXMeSgmUF3ujmFdj5v7zXilA1Xc+sI+jG85KvBKvW
         KDJD/IUgXIk17egvIj/ikXOJ/NdoiOpcAKy9pJXR/2xO0JXPY47hvMhCNCpJogJWemuj
         /iXJ8LMT2Q1o7/PILO1Wcf/+UA2Soji3cSgevqcHbiX3ZiggcGFVx7q6A3NK63Ped++p
         K7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529957; x=1796134757;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+kSqf285EfWl9/eRRplcUwj5s1cX/XrDZcOYyTq3/f4=;
        b=u5XPTmV/wAPWj7SMWZ6evqUm0TNWZ/LlBFxByMxHPN0IPXkVee1MhiB/91YE3DdTEz
         voKkmAOFxllTqnQNis09trJexn3U/G505IZhDng9DRmwS6NdLRv72lH/87ckfUJcs5f7
         uox1YNJMWxoVHAoWPS6QB/NdnTnkjuG2oZIdpMNJAPWN1/XB9g2rpu+kSNRap+2XS917
         jNIRZMuxk1eQCLKZco828t5xoDXjtVH7qtwjgK8C/CkigCjlE7Q4wrPw/Cq52q52KlkQ
         csCgSS1KjSDeYj8hrVvZX49cIeXKjXbpSM4rkAFfEkJvvoqJEuOCTEI98oxDzYKOMtpD
         Nn9A==
X-Forwarded-Encrypted: i=1; AL+hErHUy47kcZmCKAR/c43AhXM+yIhLdN6BNi16NQVAsYg0VMhY3rbsUHJcZivINfXQIKo4Iv/sgZNbFL96@vger.kernel.org
X-Gm-Message-State: APuU4Z/56b5K6IUFTNipnE3XLQUEwwuqxwxMTohJYideeQb9Ru6cVkN3
	GC3n+m/td4DatzCAXqPFm5HPqLgxZRIrV6fVBCB1cmk7FZliXHuuDwd8
X-Gm-Gg: AZFdTZeJdLhn5s2sqL4SncJmduYUOkLumUvWXZ3ZavEvNu404aSI7YphSLgZUx5wQm6
	LMZBIXhlgjzTqnbe8K18/L1Y+KLRw4pYSUStbb/D5v1e86EMNTp+wHVi8rGbzBk6zJEn1zDAfR8
	ZvvyWF25274VMzBFtJkhKzgpRbkKJ5Hy03lh5Mau/TJnofwKUQCrlhH7LMauxEYWy0JTTC5cGss
	8EHCxXFWxhh5M6EEnXScdIAYJvbqtolKCnd/MiOX/v8b5zhY/2EPHhrqAE3fEre6c4Ck1xeokC5
	BByapOwDfJNxlQDMSMSsfoL1+SIElTRg0YhSO5RcaJgL4lP9I5USGBMLIy6nzduDufxFKc3fXDE
	UmfUhhjLwQ6Xu9D7bqXB9FyjAuH39lE9xjZD9vrAwQ2+GxT0zDq1H6Jo2g2JPNKW9Cih9T9f8AT
	A0lmpLjw014z3FhRiyZDbBF7p9Xc+i+fim+h9eM0LiTyZXvErTjlm1fEFdJ4qtGXUY2VqcRiMEk
	x4nwcZWXj4STlCcUbXQSUkIyGYBq4y10pX1vpXKVvQZd31vVO7DPg8NWzlWGCw0pjG9Jt7OGmUK
	Z5XYHOXf5ggwICzxFOe+YYEoAPfZVR9jFcGDIw==
X-Received: by 2002:a17:907:9d1a:b0:c51:3b58:b99b with SMTP id a640c23a62f3a-c513b58bc59mr1211438166b.19.1795529957109;
        Tue, 24 Nov 2026 06:19:17 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae679e3sm525342766b.22.2026.11.24.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:19:16 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v3 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Tue, 24 Nov 2026 14:18:50 +0000
Message-Id: <20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAMqcBWsC/12NQQ6CMBBFr0K6tqZTCqIr72FclLbAmAKmxUZCu
 LstxoS4fJn/3izEG4fGk0u2EGcCehyHCPkhI6qTQ2so6siEM14CsIp20lrUcqaT7Xva8ILlJxE
 vhpHoPJ1p8L31bvcv+1f9MGpKkbTo0E+jm7eHAdLu1z7/tQNQRiVUoAvBQSh9bXuJ9qjGnqR24
 Dsbyn+bR7sWWheMKwmC7+11XT+j+eAz+gAAAA==
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795529955; l=1615;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wlPT/nME1AQhUiN1+373e16OMr/g2AzfAMoT0SWUSoo=;
 b=g8aWd02uvYBxRIy/qz5sy51yisBFmAocdjkZ/XsyRdXv4GzTylVxa5BJeStDKeiu99GbMqRLw
 IQ2O+puS4PXC+dLwp8sMzc8kkkiO9p5WUVVb7qEKz7aIcaSkr0z/mqc
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v3:
- Add the egpio function for GPIOs 185 to 223, which have EGPIO_PRESENT
  set (Bartosz). The binding gets it in its function list.
- Use the exact PDC map provided by Bartosz
- Add the Reviewed-by tag (Krzysztof)
- Link to v2: https://patch.msgid.link/20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com

Changes in v2:
- dt-bindings: Add the tlmm label that gpio-ranges refers to in the
  example (Bartosz)
- Link to v1: https://patch.msgid.link/20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1840 ++++++++++++++++++++
 4 files changed, 1997 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

