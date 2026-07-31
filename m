Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812B7423A79;
	Fri, 31 Jul 2026 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521447; cv=none; b=uBvOzhK9mPBk9ih9i6rfZKqebfZ8gOwe+turQ3MSWt6bpvT/u+/qrjjmy+4kG1mBEonn7RIcrcaS2CTwqeFEdUo1fuJ0Syzstc2xJQv5knKfQ2aIMlsUYahDB9XSBBsrbSJOWuJRqf35jvxJoA7C9/2mjiEr/fZbZQmc6IqGaPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521447; c=relaxed/simple;
	bh=IpgEGrH3jJ2w6lBXnKD8/UL0W1WewzjwonRrOQYkU3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BTPnSF7ReTJEbvU0DkuSNV3JK1MShcVZ1bvPEh8Q+4MhTulN1t2PMUuQu3WHaOvboLYB64c5Bid5ryXyST9i4PG3bveAaA+oke0y6zcTXPb72nzY2Ex8PrdI2U+Th+iMYG8IBcsvDXA/5dKHxiot4hrZPkF6OMzkqFMh6sudZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqZb6TW/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqZb6TW/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E834C2BCB9;
	Fri, 31 Jul 2026 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785521446;
	bh=IpgEGrH3jJ2w6lBXnKD8/UL0W1WewzjwonRrOQYkU3A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XqZb6TW/TpWtwnv/QpbjZqVlej9RagDkpAdEqqHq/2CEeyfsGJBzlevfmSDL6XX1i
	 1p/gkrMLdg3/b+kP5CxLyxAWJ76qflQtEIa0/KaaA7wUBumfEJ+apxFJXfhBHKOMkP
	 Ih+Zv9AG6GbwSxpFCNkfhPxEJC7uPKsiTPdzeCcEQrviTzEXrlbfzLdPknAcA+tva7
	 BPPkpovQ/sMeWxzYkju0GC7USbVpCNlx0P7Gr0+iuhsSUhf8gcCFA5Fj20UlLIF3iT
	 Kyl4icmcwrUIB0ZUa3o/esx7UC0knNr0afm7sC8N7qEKDj59VZfDz8DfbaWdav4cdT
	 8T+HG/2eBH6Yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726C5C55173;
	Fri, 31 Jul 2026 18:10:46 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH 0/3] Pinctrl support for SM8475
Date: Fri, 31 Jul 2026 14:08:22 -0400
Message-Id: <20260731-sm8475-tlmm-v1-0-3007a8e4aa62@proton.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNL3eJcCxNzU92SnNxcXbNEUyNj06QUA4u0NCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgAColWebwAAAA==
X-Change-ID: 20260729-sm8475-tlmm-6a5235bd08ff
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785521444; l=1219;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=IpgEGrH3jJ2w6lBXnKD8/UL0W1WewzjwonRrOQYkU3A=;
 b=umfFbq7v0GTECdE97OY6n0+nQWDrsSF9TDcNOlP2exuEpzwd5onBpKtGpW81gN+Y714LFaxDI
 Knzl+JY4X0HDMKiYbA2hXqmcbc97e5TLR7lSQ9JdjDwxn7KUItfIoTd
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

This series adds proper pinctrl support for SM8475.
On downstream, when comparing both waipio (SM8450) and cape (SM8475)
pinctrl drivers, differences regarding PLL clock groups exist.
Match these differences upstream as well.
Some headers present in pinctrl-sm8450 were commonized, so that code
duplication is reduced to some extent.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Esteban Urrutia (3):
      pinctrl: qcom: Commonize pinctrl-sm8450 headers
      dt-bindings: pinctrl: qcom,sm8450-tlmm: Add compatible for SM8475
      pinctrl: qcom: Add SM8475 pinctrl driver

 .../bindings/pinctrl/qcom,sm8450-tlmm.yaml         |    4 +-
 drivers/pinctrl/qcom/Kconfig.msm                   |    9 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8450.c              |  233 +---
 drivers/pinctrl/qcom/pinctrl-sm8450.h              |  246 ++++
 drivers/pinctrl/qcom/pinctrl-sm8475.c              | 1462 ++++++++++++++++++++
 6 files changed, 1722 insertions(+), 233 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260729-sm8475-tlmm-6a5235bd08ff

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


