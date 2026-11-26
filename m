Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683487;
	b=tCbw8EXIIElOwoqOIP+bBE8LAyrMzxFg91kqQtlDVJcggMnxbyPdSXxrdhSgrJr8jxKB
	 M9I6hG/6iiHoeiEIUuOZe/NhpALdGPfrCiUeTUBogH5+z3/vcCn7cM24gnIZWtAvxYb+x
	 kI8nEexRp/AITJj6uiPbaIpNKIIGJhbRah1HZaus+Xn0Rjmy21jLdc9CQN921vBTOZT3o
	 rauNbQS5jcBgxprjSSWg77drkARdClxICHMbk+V7rq2TyqfIm20FHa4hKa22dp/nJ25I6
	 V/pB6A3k82+zOE5t4uzPRxUSDyI6bF21ZjTQzhkXIxW6oI+ztqXcZR2Tyi5B8UAjOlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683487;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BgUK9oaFdyXin1lgzf8qRszxIDm3APhe/vomNphtJXc=;
	b=glfH8o9ynWI7fSivcUpEb4bBWRgSFl3Que6wnpPT7IoBEt8i+23AA/VT+lam4ws6T332
	 vsuu+kZtwcU3Cb79Ztb4GE7kpIPxWgI88bsdL6KVxyUyCbjOCHbvbNVWpS0S66zAwFBXa
	 STbG0HOxN4kU40lG8si3Le0LcVXRAst8mC127+VVJv8r8ILdRmoYaw8zM+v+ftHlfvqrE
	 rraxLjNtS8bQTB2cRzjSefmqphitc/UxMCvgbNtWNaaOGzB1V49zAaMI5KwCtaAopk3G3
	 IUTpkQncIHMVxfzHeJtGGKiMa5Jbkrs4xBuiLnz4wTfPmLRcofXNiIR3FEsPRNooPkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1101606A32D;
	Thu, 26 Nov 2026 08:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1101606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id BFC8482E;
	Thu, 26 Nov 2026 14:28:01 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH v2 0/2] Add Qualcomm Netrani TLMM support
Date: Thu, 26 Nov 2026 16:53:36 +0800
Message-Id: <20261126-netrani-tlmm-v1-v2-0-3426fca870c1@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBREr0L+2hpaUIsr72FYFPiFr7aYtjYa0
 rtbcG0ym5fMvFnAoyP0cC4WcBjJ02wziF0B/aTsiIyGzCBKceRc1MxicMoSCw9jWORMDHV1kqj
 1UDWQV0+Hmt6b8dr+2L+6G/Zh1ayNiXyY3We7jHzt/bfnlKzUstZKHHgnm8vdjWZvZoQ2pfQF7
 ESReb8AAAA=
X-Change-ID: 20261124-netrani-tlmm-v1-2d4378effd39
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=H2v0GLisVhuxZKqFC60HupVKyrx7zpAFbm4Bg+dcurU=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrB/Ru/xudg5U+A3lNDTKew4qHRGbpVW8xclJcA
 xLr0LZoox2JAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawf0bhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmMP6Av/Wpu7G20wfDvEPyPWUrDo9nkktXjFeLP
 irkKBAoH4QHJgj7FipYQ00leEb2uKgroB2617g9lsEpM1+4htdq+4HO6Ha8QYbLZRCwRyQWZxGS
 DVlxA81a5WylRMLF6V75Qoewu7L/EjqsNFBN1JL4CEQcz/MF3sFnlyDdNbQ97mWzjlP/D56nllv
 dBh5fzB39UuS+f8lwcxwSrBBuVHJ1eoRLZu8DJrSvOb9yWv0MDCVSREf2Sxwo8ml660RfkrDG9A
 KckhPWmknNnZQ1xcpQREgnifQP9uR7rLX6SwQES51DdGuFsN2sbWPgE1vsxhTl1KevUlu4bad5K
 1sICBFN8dN+2au0jdMkWXlcUcPR9wbMONfx9bvENhGYrw8XOYlran6p3CYPBvqhBr4XMM1oX9wK
 VAPdW3lEWWmwAPYWfWIqm94jhWnK7Mhfx/lQXXEEV0KmUQfOHnguIckLPZrxWDHCAUNSb0259+t
 FKZPnq7TSfeOeBZYTMrSszxi4aajoB7
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the pinctrl binding and TLMM driver for Qualcomm Netrani
(SM7435). The driver reuses the existing Qualcomm pinctrl infrastructure.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
Changes in v2:
- Constrain the pins array and GPIO count limits correctly.
- Inherit common pincontroller properties with unevaluatedProperties.
- Consolidate QUPV3, CCI, ATest, QDSS, phase-flag, PRNG and UIM function names.
- Fix the UART example to use the function supported by GPIO22 and GPIO23.
- Register eGPIO as a GPIO-compatible pinfunction.
- Link to v1: https://patch.msgid.link/20261124-netrani-tlmm-v1-v1-0-0f84fa251b89@krgm.moe

---
SignKirigami (2):
      dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
      pinctrl: qcom: Add Netrani TLMM support

 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        |  130 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-netrani.c             | 1328 ++++++++++++++++++++
 4 files changed, 1469 insertions(+)
---
base-commit: fd2d5e9417a86d015a4c7b9759d2d3d6182fcd7b
change-id: 20261124-netrani-tlmm-v1-2d4378effd39

Best regards,
--  
SignKirigami <prcups@krgm.moe>

