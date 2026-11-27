Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783955;
	b=G0SuQVOXYU4DlEf4efiCdzYKaP7Phzc8Aln47A4s3kXwP3h9VT7tASizb6VVCUd8IXqV
	 0ODvE4xRXVJWfniS9fZjMkKBn/DjsDhz7+8LbwxMyrE+GebGYOOtu6TMgy+qkOr6H+nFa
	 eZmQ/He+cH3z7n5vXkBnjy5S7+EANLpWkLYlzr2GtFG10UDliXXWLgZosgNVBWz6hpvqn
	 35QJznBHnmiYrkjB6S7/5QjRHxRKUoDLstjEjFxl6hlFXDzIUtCJE0RV66Rw0dNOCXq3o
	 t3T+/7PHeSkDuHWNRnldacBOnfpSO1qfxQcddczu51dr2LYfjorV18XsCqnfd04f/sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783955;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PG18Lu/jBLcAhzP7RES/rcnEfIki8FVwtayDLRvjJPg=;
	b=Ht5tqKCmUeaR2tEYZxfuZ55QUy/hLHEl50//PgocpYw8qKHUDTNSdmGXOMUcWUe1XfYd
	 vR6j72MkzViVUw4+jmIbPrVCz1bbb8vsqTggwxjDrPpOFDURAI6f1UkN0lj0UwMk5lBFw
	 IV3ixvTjFDg7EbS70vGho7rGnot8Dda8Hc9mVv8EEl/TCevErYT68yo9U4LhGFBR+FFl7
	 KyUfroSw/By7JOPqiYeB0KBb/7lgPjSQQK97Pl0gwvyDXLsJu8KdbjC3KLlatFFgSnGMO
	 9kzESs1nTloMvxCFU5nEUluHVK9pcTBBwWWzE06krwX67Z2JYRpXa3ptNOC7AyrqnPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCDE606A335;
	Fri, 27 Nov 2026 12:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCDE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from yuno-laptop.local (unknown [103.47.186.116])
	by krgm.moe (Postfix) with ESMTPSA id 53D6782D;
	Fri, 27 Nov 2026 18:22:24 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH v5 0/2] Add Qualcomm Netrani TLMM support
Date: Fri, 27 Nov 2026 20:51:55 +0800
Message-Id: <20261127-netrani-tlmm-v5-v5-0-f60f7b45c3dd@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWTtJxSjoVYwLwWk7RtEAJU0Md
 xfb5Vv8f4Inx+ShL05wFNnzbjOasgDznuyLkOdsEA/RVpWQaCm4yTKGddswNqhlp2bVmlrVEnJ
 1OHry93ccxr/9Ry9kwr2BlC6U1XVzcwAAAA==
X-Change-ID: 20261127-netrani-tlmm-v5-b798d86c3837
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=HwAU4KaMS3rzF+SX8da1ceH2N/P1sKtIDxDSbDmixpw=;
 b=owEBCQL2/ZANAwAIAUNLJdlxtMKiAcsmYgBrCX0ADiEcRxGwjAlEFjDSgZRGw9hX99AlznUr+
 SmJtHiDO5SJAc8EAAEIADkWIQQKI/ZJLAWGn9r1JLZDSyXZcbTCogUCawl9ABsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQQ0sl2XG0wqIS+QwA3WNOrpWuuucAbP8eDesuu2LMZqA+JIM
 XV4bhGANwomQJL27+9qRW8P5GyVVsBUqgCaz3XyHt8oWgJsqV3qQpqNBnV9uFsbv/JYflCDv0UZ
 Yx43yVcmHk/NvRHHxSt3PfW1BDZmN8HYypKtxlKs2kR7BWaCTeDB4L/i1zICY0yH1zn0vzVnG4f
 KrZzPEnqqyXnTQ+4BKInTjCyK8yW7ShqG9J8wzbw9LI5NGTArlcI/Gt88AoFvih0OLjvXCW5oCV
 b4kJknLuh38ZWqFoh1RkMyfIsr4t24U9AYpTH0gN6MGJ6QiIFbWrUxwnZAMczWWhUIRsrmLc7fy
 8a9KoNRVvAQ3iAnX7fQ2r6el3P69Im7Q5A+QpOPZ4KjRWShReDF97lbu6SVJVWqbadzki+7bxQi
 hy6isg2cipgjVPUaklx3BqfxrQHmaqGoKZl28lSymgK4s4PmaStaY0eBB5VA9wl24Bw90MI1HA6
 0qWn1klZIpV3w/5WAUFozy+vqWKT+oq
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=0A23F6492C05869FDAF524B6434B25D971B4C2A2

Add the devicetree binding and pinctrl driver for the Qualcomm Netrani
(SM7435) TLMM controller. The controller provides 142 GPIOs, pin
configuration, eGPIO, dedicated SDC/UFS pins and a PDC wakeup mapping.

Changes in v5:
- Move GP_MN on GPIO18 from selector 2 to selector 4.
- Add GP_PDM_MIRA on GPIO14 (selector 4) and GPIO15/17 (selector 3).
- Add GP_PDM_MIRB on GPIO59/60 (selector 2) and GPIO61 (selector 1).
- Add RFFE0_CLK/DATA through RFFE4_CLK/DATA on GPIO76-85 at selector 1.
- Add GRFC0-GRFC9 on GPIO76-85 at selector 2, plus GRFC12 on GPIO86,
  GRFC0_MIRA on GPIO87 and GRFC10/11 on GPIO90/91 at selector 1.
- Rebase onto the latest brgl/pinctrl-qcom/for-next branch.

Link to v4:
https://lore.kernel.org/all/20261127-netrani-tlmm-v4-20261127-v4-0-a77415255784@krgm.moe/

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
SignKirigami (2):
      dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
      pinctrl: qcom: Add Netrani TLMM support

 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        |  144 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-netrani.c             | 1489 ++++++++++++++++++++
 4 files changed, 1644 insertions(+)
---
base-commit: 55d571be69fa9b1ecf8b417fdf768c4eb8b28d23
change-id: 20261127-netrani-tlmm-v5-b798d86c3837

Best regards,
--  
SignKirigami <prcups@krgm.moe>

