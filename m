Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E4841685A;
	Thu, 13 Aug 2026 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616383; cv=none; b=Nax4U7ef7ScesTraGNdHLflMFqiCc7PMfrNFmeew6D7B0lhNDkMC6HbBblxa5ow9Pkaj2oXvc77f84uTNnZHEHei1GdUuAcP4A8N12o+iMArY4vCt9HHEFL+ZvMsplp6VrWrlrmdhg6cO3PW+80rV9GX13ZrMBEG/FNVc6K7KBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616383; c=relaxed/simple;
	bh=SJDE1Y6wyBQ85Y66UA/dDM+xt1Anlk6x3sBOuqBhgZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H5850D0P+6l0ippFavwS+3Oqi8s+JHJn/8l59ZnylllmUENUak88YEn7sUzj9Ez1z9ObQR21KvhfwYAK1SMINmPjoPlMp3rWQi8bmdBjeDPeK+40WnQJqVi+Adg4GxI76+KTH/n0QC0rniZg9tC0goQS0+MK/jrSX8IUg0QGENM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiSsLd2y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiSsLd2y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C91DC19425;
	Thu, 13 Aug 2026 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786616382;
	bh=SJDE1Y6wyBQ85Y66UA/dDM+xt1Anlk6x3sBOuqBhgZU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EiSsLd2yA+kZfYusxLpQSuXVZQgSnq1Qs6w4wzJYMDqnMQ4PaFxgJyAvNiNr4W7yI
	 5oPQYyWqzOZvcBYb9yhRj1I3LsvLObqAe2qPatd12EcnKD2v9q9DueJGruqsp1EhnH
	 NPX4tEUbJ0Ui5M1YbET5+67CDbbjsQUI8IUbzdF8bGZ5e67b4CDRyE3EcZ5mcH0hZP
	 jGS48rHI1ZrxOtJMN4QzbOvsdWjzeDfOPYggCrLWc2rC9qBA+EDbZ5CGttZC6mrrEN
	 PDdbABDxYBhDEi/2UYKRw18pYl1GOX8cruaUUZrQGjEtyw1mV6ONCxsSoaSvDAPhWm
	 GKtwi7Mf+tB7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0899EC5CFEB;
	Thu, 13 Aug 2026 10:19:42 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v3 0/3] Ambarella CV75: pinctrl and PL061 GPIO
Date: Thu, 13 Aug 2026 18:19:35 +0800
Message-Id: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiafWoC/yXMQQ5AMBBA0avIrE1CJ0pcRSy0BmOBtDQScXfF8
 iU//wLPTthDnVzgOIiXdYmgNAE7dcvIKH00qEzprMoJbSgLDIQGq0LlWlNHWjHEfnM8yPm9mva
 3P8zMdn8HcN8PipT8HG0AAAA=
X-Change-ID: 20260813-cv75-v3-b-8521663a362e
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786616380; l=1753;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=SJDE1Y6wyBQ85Y66UA/dDM+xt1Anlk6x3sBOuqBhgZU=;
 b=7wMvdXyZV5AuuFfYWy35sAWu8p8pkJOi8yy9vOlUwmaSxl+eTcRezkGRSI91D4KoReHb5Hd/s
 Yk4w3TsxwQnCXpY+avWuyCTi1JdsMGpIFPBU8ryO9QYyUJgNPswJstu
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

This is part B of a 3-part CV75 v3 split:

  A: bindings + RCT/CCU clocks + SoC/EVK DT + MAINTAINERS
  B: pinctrl + PL061 GPIO variant  (this series)
  C: 8250_dw UART quirks

Depends on series A:
https://lore.kernel.org/r/20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com

Link to v2:
https://lore.kernel.org/r/20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com

Summary:
- CV75 pinctrl binding and driver
- Ambarella register-layout variant for gpio-pl061

Changes since v2 (B scope):
- reuse PL061 with Ambarella register-layout variant (Linus)
- model each GPIO bank as a separate DT/AMBA primecell node (Linus)
- complete function/groups enums in the pinctrl binding (Krzysztof)

Verified on CV75 with A+B+C.

Signed-off-by: Long Zhao <longzhao@ambarella.com>

---
Long Zhao (3):
      dt-bindings: pinctrl: add Ambarella CV75 pinctrl
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
change-id: 20260813-cv75-v3-b-8521663a362e

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


