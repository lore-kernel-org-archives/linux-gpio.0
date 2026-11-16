Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864245;
	b=lSpAxtbhaFUOMRTFi3ed8xC+zoPVvqzOC05Wvm6e4L7PJEaMXLeyaMKGnl3uUa2w2m7T
	 wi1iyTZrMlOgDRECuJnklycgZc8jUYRuT7wdkZ7f3WAn3RiHwBV+fgJeU4eYOW9ebGZWl
	 Yh156Ym1vJuRNk1aicv6rzG2vboftGixOaDK7K28VaeNPa5Tra5THX9vvoca9sx8dG3DW
	 UfYCBdSsZrSURkfXPslDIeGIJ1wloUp910+sO8RSJMGg0Z5qtqlDk1hfk1HzsPOknW4bC
	 nOGEv9OM3/69i0xVYe5QjKMJHTI32dTRmtYNf4rYgjw/618EoXMS+SSsJ4dWYYuJcNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
	b=RAkeRLY7AHDEPW24cGcwWc8F56i94tjodcqXzPl73suWANYRnVidnNV7rUGKNvvlaHs5
	 Jz6pNDZR3iVXl02iIFznuDJtefRw0BbSC22MueADqGZ4DxK9Lrq+KnsPXZ9RE5r0gt4b9
	 sKdn2p3h/guRTo4vGHe9KQtiWwqcYn/0e104zpK2n8oU4s2NgXmvmyH50Z1oYRl/Eu2SD
	 Bm4AQVjtCw+2XxYMq1YDRGr/Uom5SUiyrDcCEsoFllG7gaBsdEYDgvhEZdU8xK9r2WIaf
	 p5Xdv/B0N7RRfdjLXWZlzXKCzBXjUdjjSXj1BsE0p5wxEMeh9h1jCn7fHAy+vBHOXLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FrVzVN/7";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABDB606A336
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 21:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ABDB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FrVzVN/7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso16105545e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 13:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864244; x=1795469044; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
        b=FrVzVN/7M8VJOf7RTuhHp8/yRHlOH+DRPTKtOhVt6u/fag+es6Esis6pYgs8iyLlvX
         Bj919y9GSQ3QC/2irvSwLiP9evSGkV8f/Q2ZT5ZaCPq6cvFC94YMDMTzE+1y+oc9xM+3
         ACmHgTLgInBx71qLZTLRe34YZUmhkGF9m0uktlQx3fIBG+Pr6AlPQ0vliGMG8svdkafT
         7gSjrkg0OI3JDU7Ob70hj9KnVK74R49PXhnNYiIv2mqivf8Bjn9iH3i/f5TOyL+9tMT5
         DN7TXmHLJa4bgPfpWmLU8UFWkD0Qj4ZrNo/pZdAsaqQXxgWltVY3AEcWs88TlOddR+Tg
         atZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864244; x=1795469044;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
        b=vg5gtIJECaRHFZuBmXPBej1SFNgQFYu9VeE7d9dOtVteJ5ednLjrz219u54X6eNhgQ
         pDRcYThIX50Y5N6A1NYLMsEHaVQGravWF0SArAOkPZo3Mr2HGRmC/zmYcNrtwcorVM00
         WbRSkN5J0p4kA8JpPYqPUhmw9uNhZTAIOuCjpddJtyX37ckl6V97VnzpYwNDfxX9OP1D
         Gbgx/XXJ9l2LS7W4f1je4P499DVmXawO4eJZNrdP7TqrWVpTYeHyhIUGEHWyH9eKVv3C
         0mQHUE8XdBlXcteBob8OFzYQEB+KKMq4PD79TgxZYxmLtdsWFsImfj1hKZR3AMbkhnLQ
         woTQ==
X-Forwarded-Encrypted: i=1; AL+hErGAHv92HTeGQgA6F4iciRD/ubljKpKZLilVlvauIEpqTvs4vzqMVLXdHI1Ga3ZjxrSH3Y+F4nDoa9sI@vger.kernel.org
X-Gm-Message-State: APuU4Z+DRs+ayK05+OiCw+433nLonMOmFEPYIDE6Y8NnBA0LKra5nO4H
	PslENTzoBsUOjyf9GAQpDm5OWGbbEEjQj9hc8OEUrd9D8dkL68dEzZbn
X-Gm-Gg: AYBFou0HqKgVFhBAdcLu5OZsVwcojzOP92u5Yq7QU6KBOUkO9aT0WjGFsaKPw4rrx76
	dvPDcbevxULGuM+GNg7mcKlAAis5hEkifsC41zna5vtJ1kf7MDW2tHnFC/6PM5eEw+dYo/EHt4C
	gXPDcBT8+qQ3xw8dNO9guN9MmbpsSOhLYOJMtwRxZFuknHWJznx1zFC2kMGy0Ga8dtbV+8rLmr1
	Xhf6woKPIPz36dnly45hNbY03mHeLQuBCsnENe3L3qcSQ6ltAJAcgLsHRSPBDl1hqfHxkyw6T1d
	TgGPQzBUlHKYLOIwxosbVAd3D0vwbeOQ6gabqDgXpLmF/RWGXrQe4fCjfhqCG6RBRS4cWmL2hVZ
	PwcgoE6auGSqQ9WM+LA3BqCGl6yeycvXL8R0pBXp7QBf/yp5PdRMc6Q78r6t6n1ORmYW82L4irv
	lB+n9/aaKRgmZgD4SVEY23E99Yo9o9g8GAs1ugTLgdsLGJKSw6UgP/IZVwA1hACJh9KBR7lmU42
	n0V4vCim2E1lfewXEKRGIlnhYQDkZY/byodSQDk9yEW0Qu9Mx4cTH7/iqBiWGso3WtmpfLicQh1
	/Mtx3CPEmCJ6BDDXmMNf51qrc5mBfUaheT0JLX65
X-Received: by 2002:a05:600c:3551:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb55abdc18mr258614455e9.33.1794864243814;
        Mon, 16 Nov 2026 13:24:03 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7839c5c3sm16520325e9.12.2026.11.16.13.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:03 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Mon, 16 Nov 2026 21:23:57 +0000
Message-Id: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAG10+2oC/12NwQ6CMBBEf4Xs2ZpuBUVP/ofhUNsF1rRgWiQSw
 r9bMF48vszMmxkiBaYIl2yGQCNH7rsEapeBaXXXkGCbGJRUR0RZilY7x1ZPYnDei1oV8nDKU0I
 S0uYZqOb35rtVX46v+4PMsErWRstx6MO0HY649n7u8597RCGFxhJtkSvMjb02XrPbm95DtSzLB
 6nbTti8AAAA
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864241; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=xrLm+TfVvJoEp6IAVQCzFe0JVQwue5fgBOr1usvJ8nI=;
 b=7vzILpl8qrChpgALa3GHPPZN0zVDnay00lup4/uriiZw4XmAw75/hxuRsKAUVN+Q6+CVi4jHQ
 3dxYYOry4UtB0I+DDwkGBFfhcdaDos1AwtoUo4281yfyuVXiNDXDLWU
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
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1825 ++++++++++++++++++++
 4 files changed, 1982 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

