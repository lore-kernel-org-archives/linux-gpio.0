Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709994;
	b=TbXaFISB/isLOWuqk2ZrIbnqmynCQ85urCIl+BwEM/keALSkg4PjA4MbEwjuRly2xDL0
	 oDCidpyX/9uCATIJoxPIDUwhen4ecjOxv4iZnTkw5q1fEfDXrLg6uy9jeOODLPUc+/G+2
	 n7lv8GYvbtxXEaoSO83CfORSJVWMSjmgEIjaYG+aFQhgpo/tlhmzpF3LJXCiqAt+pkKuj
	 ppwp26svEXmYKFEsfobnUqhYcve2FjDC+1FIHw118ZFDPIvzG15PsMKi40/VRseHPbAmg
	 VmkO2YmCXJXFemxIdz+spdKIFkKrPnlP1yDZPzncbWZv6jZ5yUrHKbOdL6wto4mYL5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709994;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=u8DcG5trqoOFrEsTub6wl986H7TT+KgeRiiZN3CVNiM=;
	b=iZxBAAHjMnKkFOblpWTXjt9inpdEJRHE4C2/mdykIdDF7OpVPae88lP3Vtv9+chOb3Cx
	 MS8RQKPG1ylOTt4nelacLDYTWtMdpjTuZqrmalQw47aPvLiX227YHupDtgDmSTICFkEy0
	 +tUnQ8NEjfjRcc1uE59C5u6nTyAKqXNnSt3jKh23PpS3sknwDXsGQ5OfgdcP5ZIVjkiri
	 WdczlrGN8Zoe4uEDTDaSSlBBosI5bMnAt1NyPyPZJEj1EHqqgsLJ7hX59CqbWlVoePHDm
	 vGMCnRptbsnlzzV124xpGSQZFikFaaPkTaR+d1S45tCXCltef01XHrMnYd5AsUyo+5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1D2606A31C;
	Thu, 26 Nov 2026 16:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from yuno-laptop.local (unknown [103.47.186.116])
	by krgm.moe (Postfix) with ESMTPSA id 20C6E82E;
	Thu, 26 Nov 2026 21:49:48 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add Netrani TLMM support
Date: Fri, 27 Nov 2026 00:19:26 +0800
Message-Id: <20261127-netrani-tlmm-v3-v3-0-3bf3f0bbe5df@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrE1CK4SriEXLYISStkQi7q5Yv
 sX/FziyTA6q6AJLBzteTYCMI2hHZQZC7oJBJCJPU1GgIW+VYfTzsuAhUUldJiqnotMZhGqz1PP
 5Hevmt9v1RK1/N3DfD+7UkRVzAAAA
X-Change-ID: 20261127-netrani-tlmm-v3-a3b90a6e7db4
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, SignKirigami <prcups@krgm.moe>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=uuepb73Q4TUDnoK3QYwqPYiU5YZoRXG0qxAoTAtXNuA=;
 b=owEBCQL2/ZANAwAIAUNLJdlxtMKiAcsmYgBrCFwfER4wgMgWf9LYOJwVv5SZp0+qD7VPgwiSf
 6qZUe+ynFiJAc8EAAEIADkWIQQKI/ZJLAWGn9r1JLZDSyXZcbTCogUCawhcHxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQQ0sl2XG0wqIkZgwAu2tVhRnYnIbPkwLMrLf2pH3768Dww19
 uSYfoWDwMJNuew3X93B/dwrEnJKrBaVoRBZLUnFe7Ac7GuZp49oSj2iuGp79zDamzSAUo9BNV0Y
 ADcTZzyR4JlDaVT014JNYKZAuZNd5KnR8GdAqtMGe3MWYWkIH4A3HpFdIByxuphTU5GMdguYd3p
 WaFcuuEXT0wcybk7qFn6pOW03sxu9ik4oz0TCTSUtGzUCALTPQPNAkfGBS461ObJT8+pVJXN+ez
 CTAoMV0mTKQdQx9w/VAX6CTIYce4Olu2x0GQkxLL3u72CBmGlAhsR50lr0WOArf8c4cL9o1KNqj
 0mH/qs+mGhleB0V+yl3HjTxy6WICdMJ7aKcn98Dhui6tRFqK7W34pUpjuh/nqwYcVUS6IsVmcJt
 0fuOP3L/DGcXbd3Mz1vHjaWiw6HmRPYY++EeTcRmX54JKIsEy6dzKbEIj+OfEJQKEymn1mzzkIl
 LzCUNBBoGYi6hFCEGVtW+IIhRXzuE5R
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=0A23F6492C05869FDAF524B6434B25D971B4C2A2

Add devicetree bindings and a pinctrl driver for the Qualcomm Netrani
(SM7435) TLMM block. The controller provides 142 GPIOs, dedicated UFS
reset and SD card groups, eGPIO selection for GPIO114-140, and a PDC
wakeup mapping.

Changes in v3:
- Add gp_mn on GPIO18 slot 2 to the binding and driver.

v2:
https://lore.kernel.org/all/20261126-netrani-tlmm-v1-v2-0-3426fca870c1@krgm.moe/

---
SignKirigami (2):
      dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
      pinctrl: qcom: Add Netrani TLMM support

 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        |  190 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-netrani.c             | 2093 ++++++++++++++++++++
 4 files changed, 2294 insertions(+)
---
base-commit: 55d571be69fa9b1ecf8b417fdf768c4eb8b28d23
change-id: 20261127-netrani-tlmm-v3-a3b90a6e7db4

Best regards,
--  
SignKirigami <prcups@krgm.moe>

