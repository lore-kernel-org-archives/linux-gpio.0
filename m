Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534172;
	b=RwDHgSEAoK5x9NzOREyny8rrSmu0QlVVEaDbZ8F2o/VH2WWOEs+I/RxvEWHqNxaM5t5a
	 VqwF/f1mr8Duzjtl2u4bNXlxLRpEu+PrIA5ZWq0ThoRKzPlrQ2d40PIYO+0TMU+2pobXP
	 XN+Axv3lT2/XZ3UY1Y32QjXvjF8pj0yeVPhEPoBnjoveGdPEGBTqxsi19XVQiO2Dw3Tjp
	 zi2Snf06ERlgVyu7KfeQ+kLltVxAqJYrYOTWnK4lYDOYj8qA6NENl1e8ZAmjdX2c8FWI7
	 iDF5xldj1ITog+AYhurLPWM4c8BMejgfp0atHCNfOCy/ADx19WDCxt5tNLAawyp1NGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
	b=Netqh09JguQJQv7pu/Di9RI+ZimiVOQortRiXInnpYT8u2LaO+32yj8fmYAuU7deEqSz
	 /LPNnYgzydl//PhNgjeqofMGGaRFTjGutV5aF7j3duoFlARp772CYEOW3yFbEECAvHPW/
	 iWyb3dmN1g6Mx0Gz/T1WNsNSusg7pvH7dQTsOe4m0qJsLM7oBA0F7LhZjV0m+YnQkmTJ7
	 ptJ6P0fo4+wmchvscQYIeV35Yi6lKOVyLw5C6nvGiqhfRAiim+INRBcfK6VWpLX7M1pJL
	 qL+uoSPmDDWhTCJIEgXq3jwd4MsLx/ZQa5FQFKlvDDjpcFZ5xFl++cHnpDgBXq3GsTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESB8LODa;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E247E60A2621
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E247E60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESB8LODa
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso922304466b.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534170; x=1796138970; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
        b=ESB8LODa35Vf5EcyPsyzwx5pgl/mMKWV85vMM/1+lenyfAOt7Bz0Q0zY7FjolGmpzF
         YMNP/J9mTqdTFQTAhTBC7jljpZ9TjrZbBCd0tK/xddphcbcZPR3sT0Be1DVddcCvG/r1
         SY6tklwyNsafnfzBjy93ZHI+FYsPBss7I9FHT4qEZuO+p+cIy9a0IbRS7QhARwKsMTZ7
         4c9Jg1moj8o9x86oVfV+4t0cqOWdJWcl+5AW25mtQvkei41jvhOHl1A72nJk9ftdCcbd
         e/cCx1xCkoGCUN+/j8eH2tspcmYxodWCUPHko6eZYfoW7hoqrxR8GwvcQR+HU+RGm7Rq
         F7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534170; x=1796138970;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
        b=RSKyMA6g8tuCXNvXr4rT5gu9cYIqcSK4h1yPdMl+ne01eEEaezWpRg6ni6csfQ1dqL
         Bn2vohxsBntgBUktN/ZiYBQeEkd8/L2YGWFEd1tk6popweHEt1zQizzf8q+TGU+z9zWx
         1a5TnygE+uINLEacQCWDghSUzOriGhLoAa0cpPN0yP0pWbbgByk4JiT0hkIsDRs3GdUn
         6Cs+TdggOw8nXgehAwt9JowxOUqopatz3XRqiEDxGfjgpOVaSQg/qgVd72jFLWIoXICI
         rW/fkHtBJ/qQqAfUayDhmrAzng2d+KKHKhy1Nlse13bsNdIhmHYeEu/EqqDuzk9Az+JZ
         sCog==
X-Forwarded-Encrypted: i=1; AL+hErEqmk2JYzMrwHR3HWaG/Zj31NeJ0e5TurewJzdyxTQxDHgd+vrs7+UOo8GJAtX07frzdzZzouywocfH@vger.kernel.org
X-Gm-Message-State: APuU4Z9ahCSNVlK/Dv27/kflkKL2no3+JQA4OwLaXMTCUWRcygDW/N75
	u4dtR3aXjLfPQ6ZnWgMKk40E6aT0c3ld/S5hCfHqdDp+S7uKeZBfHh7P
X-Gm-Gg: AZFdTZerifE7aYZtUCLzlVhFH/c487kwF5llMCgY638LUl31rUdNzZeRZwTU1YprG82
	CCUztoJL3AF2/oDK4tOVfHa59pzwvP4IS+X4XnwbJDgHHG8u/9YADiPGUQv+APloTXFRlqoIebT
	VquqKoEiaJ41ieZGDsOQj8H1S+GJAs+8S0zGBptBMvVGfsvV5A5BI/YABnkJo6A4yX6iaUg5/L+
	RHpbrM9flPBWGhInlSOWpskZvsxCYUtUebYAJHuF08E4owxGo7ub4LZc8OTqMrYBgB0nz2WQ+u+
	S1Vx3KY+V3Sp77IVC3/i++utpGYA8WfT+vQ3EOMENhry5JXabHtYy8mTB4ycDb3ViddajDIV+Ti
	+G4dBFSyj0WjyHifxFVBs0Aa3bZzPeXk7AHxbgkqK33xgItQQligDghHxLBZ1NUXY6MIaPaaOVZ
	ydB3Ivon9GrW8yNwDvyZWGS3RMQX1n5ejo+q2Rilsc5kXcRQzt0xfFuafi2TuH3XNpbiWY8hOwV
	370onEEHnakUcycjrcFzT9Nr/3MTZFPz0BjCjVcYRAMVSO97bEmlGW++7gGejms+QhtbmBZzUei
	JISk8k23mT1gZi3wANdsApehogfc1/DvnVzCog==
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr1434115166b.28.1795534170279;
        Tue, 24 Nov 2026 07:29:30 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm540425166b.2.2026.11.24.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:29:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Tue, 24 Nov 2026 15:29:16 +0000
Message-Id: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAEytBWsC/13NTQ6DIBCG4asY1qVhRqDaVe/RdIGASuNPA9bUG
 O9etGliXH5hnpeZBOudDeSazMTb0QXXd3HwU0J0rbrKUmfiJshQArCM1qppnFETHZq2pSUKll5
 4fLGMRPPytnSfrXd//HZ4F0+rhzWyXtQuDL2ftg9HWO/+7fzQHoEyqiADIzgC1+ZWtco1Z923Z
 G2PuNMgjxqjLrgxgqFWwPGo051GftRp1LIQIK0oUeZ6r5dl+QIOYVJOOAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795534168; l=1775;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gCYQs/30s75gOvGg0mt5Y5EZUj0bRBXdi1OgnGxyCjM=;
 b=DOTlVjHNhTZyfIOMSm753f9p4pgPiVLI9TU5wLjeUxJcXQiyhzmLx4wXDRguUIG/4/lsho8Vk
 eKeoshsCGzWAEoXQQjXjTC347ci9toIjPkHmwaRpgSZE1oVxF7dvecJ
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
Changes in v4:
- Use MSM_GPIO_PIN_FUNCTION() for egpio (Bartosz)
- Link to v3: https://patch.msgid.link/20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com

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

