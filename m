Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88838357D17;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786688766; cv=none; b=B5W5EDhM485C+An12mXJounLPnG+SgDesnrn+SYcnMCp/6lNaInt67wQnHtkcr38yUzL7zQccxQ50Dy8ltAhwroHfVjxy0xfNlj5RFZuKB549YIYGembmm1RCuc+uy7d/qGwKC8od9OVp92ODOIgwXws3W79I18AyKddBy51mBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786688766; c=relaxed/simple;
	bh=ksEsRtK1EuKSLayoctPBxaWWqqFtM9SYIX6VyZQVJqg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b9jBC0xHQZNeoqr9rAB/cY4lr8+XbwOPXfwNNK4HVWl0iwwh5sV00EdS7yVuxLWipdreREovG/fkPmBn2WbhMi/hR9kAlSpHS09C1QXwuqg3tEnxF6ziRCjIb9FYYZ8fYctdX2SHXKPxvtOcf38mhnWCyXo0eXvNppwriQ09xoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMNMA79M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMNMA79M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B390C2BCB3;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786688766;
	bh=ksEsRtK1EuKSLayoctPBxaWWqqFtM9SYIX6VyZQVJqg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tMNMA79MlmMdJ1hE1pSjFEWOaLyieppms3BqcaVNaj/Su5PX47ab3w+UoIxawcBDX
	 d/WLt7YA8c5r0EjeFaHF3r/HcThX/bJuh3ZUJELZ8nhaP56jf5cs2vcgXOfy7/MTmV
	 sLBVklijoeHLksDcQ2Bwge3hhf0KwlCwkt5YR//e5PFL0n3iv4N7cxL5zEDdnjSJqM
	 mvM6p6uMafyeu/sXEgH8SO4dfstZnkVyPZ/z5U8T7bFVy6wyEjIXmg7SRPI2pKcXvC
	 JpOeOttbrw6Zfq4N25wLr2WAWl026hCaz28wJfoP/aX1ASYyrodxywleT0dMYzZaeY
	 V394VM2fFpDYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA049C5B572;
	Fri, 14 Aug 2026 06:26:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v4 0/4] Ambarella CV75: pinctrl and PL061 GPIO
Date: Fri, 14 Aug 2026 14:25:40 +0800
Message-Id: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOS0fmoC/yXMQQ5AMBBA0avIrE1SUjSuIhaMKWOBtDQScXfF8
 iU//wLPTthDnVzgOIiXdYnQaQI0dcvIKEM05Covlck0UqgKDBp7tDxoRYUhU1qI/ebYyvm9mva
 3P/qZaX8HcN8PrZkruG0AAAA=
X-Change-ID: 20260814-cv75-v4-b-fed40c58c86f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786688763; l=1967;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=ksEsRtK1EuKSLayoctPBxaWWqqFtM9SYIX6VyZQVJqg=;
 b=lNb4uc4U78G3ALpbbxIU5sLX9QzDdu2+7huKuU4+wK7iDdIDUSBZB97DtGKOe3WYD3EhfRV20
 4W9sLQBYqj6BJY80ElTpLdj4hIR3K3HEy+BygtSx5JxhOqwNCl+p8gd
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

This is part B of a 3-part CV75 split:

  A: bindings + RCT/CCU clocks + SoC/EVK DT + MAINTAINERS
  B: pinctrl + PL061 GPIO variant  (this series)
  C: 8250_dw UART quirks

Depends on series A:
https://lore.kernel.org/r/20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com

Link to v3:
https://lore.kernel.org/r/20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com

Link to v2:
https://lore.kernel.org/r/20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com

Summary:
- CV75 pinctrl binding and driver
- Ambarella register-layout variant for gpio-pl061
  (DT binding and driver in separate patches) 

Changes since v3:
- Split pl061 DT binding and driver into separate patches (Bartosz)

Changes since v2 (B scope):
- reuse PL061 instead of a duplicated GPIO implementation (Linus)
- complete function/groups enums in the binding (Krzysztof)

Verified on CV75 with A+B+C.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (4):
      dt-bindings: pinctrl: add Ambarella CV75 pinctrl
      dt-bindings: gpio: pl061: add Ambarella CV75 variant
      gpio: pl061: add Ambarella CV75 register layout variant
      pinctrl: ambarella: add CV75 pin controller

 .../devicetree/bindings/gpio/pl061-gpio.yaml       |  35 +-
 .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 240 ++++++
 drivers/gpio/gpio-pl061.c                          | 280 +++++--
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   2 +
 drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 ++++++++++++++
 drivers/pinctrl/pinctrl-ambarella.c                | 839 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
 8 files changed, 1949 insertions(+), 71 deletions(-)
---
base-commit: 18bf29fba8d0bdd0db5a0497ecf06f404bc740d1
change-id: 20260814-cv75-v4-b-fed40c58c86f

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


