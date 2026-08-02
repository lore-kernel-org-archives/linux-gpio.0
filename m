Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7007B357CE6;
	Sun,  2 Aug 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785656050; cv=none; b=B/JokVoDVXsDJEy0NVWY45HyQL+KHjNbjHg4yiMvwCl8PQZ8/YhEc+WIFRS5K/PbSBzGUm/lNG2bDbYXaSYQ6NVTJ2/ks+f+XBco/36RMaxMd/K04NDCiDhI63oawqET8Z7xRoR7BOJ+ibcDQ/H0jO2SZp68wCuPHx2NXW7x2cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785656050; c=relaxed/simple;
	bh=4ZUggOIXV7HyuwAJr8C1xnQDFvBL6VwcHMlJnp43JO8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sGSXrFsbGVI+bWW8AMS1Sw49IXONWsqv6rUbDCz+rtrrPp5+hBEuNW+S0VlDXrZanuf3xVDP9lfh3vtc3bVH+UCAdKnCkruz60ZQgXuKAB4IZTZhrCMtpWu1BGbY3fm3+qDAoZOKIM6r8sav0SKxzTJ3oyO9QY1DzV9gqldb3iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiCuxM2y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiCuxM2y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E269AC19425;
	Sun,  2 Aug 2026 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785656049;
	bh=4ZUggOIXV7HyuwAJr8C1xnQDFvBL6VwcHMlJnp43JO8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YiCuxM2yf1IgsDrjVocUKI8+X0+rBNUW5vtXlq462DpPvBWiRmprKM/kDPym6dDgl
	 7mb1mr5WljEm2K9Cw2KNZ1kN1aAWtWNd68+1QNr+4LeogNAyxJ2DhenyxvrxzVAaB8
	 +rvpUkEu/Ruv2bXBUJibxbU+nwQQzgMelhBpSZo4XPYvZ9JhqQF7L90Zynami6esLK
	 x2TAlP9uahFOGYoZ2dAHU/vxSUfRf4zjf9JaqBo7lKuMsQTV+66doDa7k30Z2R10TO
	 hMsP0Ao53N71ZY1j9a1gs1lua9hsnp6RYNniwlSO6a8DABVoib3enOZii3qpnsM7Ye
	 hB3AzkHt9CfNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCFBC55171;
	Sun,  2 Aug 2026 07:34:09 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v2 0/4] Pinctrl support for SM8475
Date: Sun, 02 Aug 2026 03:30:53 -0400
Message-Id: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WN0Q6CIBhGX8X919EQFKir3qN5gfqbtBAH5GqOd
 w+tmy7Pdr7zrRDQGwxwLlbwuJhg3JSBHQroRj3dkJg+MzDKBJXsRIJVlaxJfFhLhK4Zr9ueqmG
 AvJg9Dua1167Nl8OzvWMXt8RmjCZE59/73VJu3q/My7/yUhJKOKVSK6y0FuwyexfddLQITUrpA
 2v0Zrq4AAAA
X-Change-ID: 20260729-sm8475-tlmm-6a5235bd08ff
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785656048; l=1445;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=4ZUggOIXV7HyuwAJr8C1xnQDFvBL6VwcHMlJnp43JO8=;
 b=9NwFykxeyiwB/Y7GSu2pVTif+zyQRrHKJF341TFNTng+5Qrxbd5lRu0cV39gBzVxIE/JpMO2W
 fEMBRtMIpbbA9jt/4kHKdcTFqVS/9KJfkiTbp8D/wvHq7DgD9Uairjn
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
Changes in v2:
- Remove duplicate gpio81 reference (Sashiko)
- Link to v1: https://patch.msgid.link/20260731-sm8475-tlmm-v1-0-3007a8e4aa62@proton.me

---
Esteban Urrutia (4):
      pinctrl: qcom: sm8450: Remove duplicate reference to gpio81
      pinctrl: qcom: Commonize pinctrl-sm8450 headers
      dt-bindings: pinctrl: qcom,sm8450-tlmm: Add compatible for SM8475
      pinctrl: qcom: Add SM8475 pinctrl driver

 .../bindings/pinctrl/qcom,sm8450-tlmm.yaml         |    4 +-
 drivers/pinctrl/qcom/Kconfig.msm                   |    9 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8450.c              |  235 +---
 drivers/pinctrl/qcom/pinctrl-sm8450.h              |  246 ++++
 drivers/pinctrl/qcom/pinctrl-sm8475.c              | 1462 ++++++++++++++++++++
 6 files changed, 1723 insertions(+), 234 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260729-sm8475-tlmm-6a5235bd08ff

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


