Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CC368D66;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164481; cv=none; b=pCgc9ln9x32uL+W+asygtptV3Z26pM6lfWV9XE3I8E4h79aid6HynEF0fncGx0ni7wXPQiBwkzp6NYC7ZCXjyeejPbVVgPvfEedoxdc3U73oSMJ/N7/EaVX2FEJjHQ+r1FHkjzB7G2xgwl6c1nLGiW4Xil1Y+RH4M2hPQpdudQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164481; c=relaxed/simple;
	bh=1uthSd7P8y9Oi8VLveA0Sb1tQ9DUs9/arzzCInD1jhE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oahK6yKyw1NeqydP/p4D/+bzkJxNBWl67FDQO+jsNEEDs88iwbrGPuAuKlSEDj2EzpqhLjc3qM572QkIys6kETpK8SUYLUU1aNY6IvPF7bA5qv59W7f+thh0l09Z1bTez7O9es5sopGRTV3C1N7LU7GV4emdY6ooIafAgXIxi2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxDtzTp7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxDtzTp7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CC04C2BCB0;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781164481;
	bh=1uthSd7P8y9Oi8VLveA0Sb1tQ9DUs9/arzzCInD1jhE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JxDtzTp7spFH1L1fbgGppE1oNse4pekP+J3kEts9FlBFMe0dH6gpcJOQxXE7skh+A
	 PIStedid0q/NaW7ZRuXAROVOVTEc4PLvpApnjMfTTcbzbmWzQJLFL90YpxZa1NC4iU
	 /Mga0CKQzMKjftpHjscG9pZ23n9oIrAOFZsUljICuU89f5S9WSmLFey/HXXZsqwFWz
	 iY7jnZ/gm9LkEmT+aAln1RAGD1mIaENYZPGGjuvTb2pxTttTLp9mtB48JnvhqhUU+3
	 5yQ4JBXe5nmhLTREQsGDGStPfhe+TmiRnoQBXXRcXMNM3AWL6NlnHXgeJemPJqE4eJ
	 PIHgk1kSqJuQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34444CD98D2;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
Date: Thu, 11 Jun 2026 07:54:32 +0000
Message-Id: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhpKmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMD3fSCzHzdknzdzKJC3aRUE3NL8xSjRCPjNCWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AGyHvH9iAAAA
X-Change-ID: 20260520-gpio-to-irq-be4797d2a23f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781164479; l=854;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=1uthSd7P8y9Oi8VLveA0Sb1tQ9DUs9/arzzCInD1jhE=;
 b=O2aJsO0189X2Plisl9JKDVw2g1wop4vl4VFW7vG/5bm5/wT28vxWm+u1n5eBG3/Auq/FeOjBW
 +w8IlUp0RAuCLvt5u4/zoQm689DXFrd+NhcCLNEm11fxJAq2bfhM/yg
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Some users need to obtain an IRQ directly from a GPIO descriptor through gpiod_to_irq().
Add the required DT binding and implementation to support this use case.
Since this introduces a new DT property, the property is kept optional to
maintain compatibility with existing SoCs and DTS files.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio irq property
      pinctrl: meson: amlogic-a4: support gpiod_to_irq

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  5 ++
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 54 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
---
base-commit: 4ca496f6285e16d91751e5c84c6010e03285528c
change-id: 20260520-gpio-to-irq-be4797d2a23f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


