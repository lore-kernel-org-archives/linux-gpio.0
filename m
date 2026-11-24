Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517322;
	b=oXP6dJ0zL8ztabW9yveqtqZuF3JOF5n+dHx7LjFliRhgvl9XDsfsBFjcorqNAttclvqh
	 ud+6A+153T+B+4HCMR2FWJlDUfomKqLv8KBKkmKhRJxD3+RMPU3WOfKwAnLwTYylClHMi
	 8NRnuBq7k8Wr8h7+CBK0Fyj9bLEAhXitLMIjfb6IVmnagkwfKKEZo6dGkw/n39cNefAcn
	 fStETYjmBGkRkcGaRM49Y28pkSOc43LqFLBDbK6u8Rtow+imitBdKx+1eYVBkXNZKlriL
	 JQYQU7H/d5ypG8/j7mvH5dYRILjBJoHT7oYGzgUfKPzywUuEHRJ9DjI0GAOXMPbmcsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517322;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dBPYl2zKFPExgfERojWEsnAyw4KQJ0MAZ8Jw147Kztc=;
	b=4AM5r9RCn+iE9ssRmJdeTgVdUDHISNgUZNHsWEuge/94SienmeTR7n2xZmJ7HJoXYiGb
	 uFyn3yx5fWlF9V21L1pJduL1gUEEP6pnLRmgH90BiznhZ+Ew4bKHs1JqXqvkwQ5NLX2HG
	 OBVy8ZdXNKgAX3tE3644C0NZ2zs1A+f5bCYFbUN3GPZ+ZLFegKaSt9Xxs7L0s0HjV4AcV
	 N6GKiurxOvSTTlxilG8YtqaoC4zxFr28PVEroi9+yORzIvM4/tR2xQ9BF+H+61kFHmuqj
	 5VWusGFxdXLFv8hifBtybE0yOvFcshRf/jwaVT7WCQbb/5OeAgzOrWRc1Cetf6hZ7yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174B8606A31E;
	Tue, 24 Nov 2026 10:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 02BF7859;
	Tue, 24 Nov 2026 16:18:36 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH 0/2] Add Qualcomm Netrani TLMM support
Date: Tue, 24 Nov 2026 18:47:43 +0800
Message-Id: <20261124-netrani-tlmm-v1-v1-0-0f84fa251b89@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ7CIBBA4as0s3YS+Um1XsV0gTDomBYNUGJCu
 Ltol9/ivQqJIlOCy1AhUuHEr9AhDgPYhwl3QnbdII9yFEJqDJSjCYx5WVcsAqXT6nQm752aoFf
 vSJ4//+N13p2225Ns/m2gtS+9soLocwAAAA==
X-Change-ID: 20261124-netrani-tlmm-v1-2d4378effd39
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=785; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=K+4yaM6/9jj2EL1rcybpLLJYrSpUft7ynGKrj9PL3Lw=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBWth1joFZzlxat2R7n2fvTI0jY+YaCW8HB5qD
 mx3EgRMFN+JAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawVrYRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmMabwv9F6jNhWVy5FgtUchaSf5jBaDgBdl9oLs
 Kn4Gz4PrUS/uAwgUk507YJpaAsNTcsokWq6imizTppYrJ1bRZZFuskHYx/ZiWph5tBaXyiaCWXJ
 QHsTZmLGL+cjHPVon0H6h3k34CoVF+yOhDislwIVq70gtWaq5qYbi8/2kuTNAduJ+eRB8rVRIHo
 2UZgmZ36GtoHg0u3xi4U4LUF3HvXFYd55XrdP8M6sPVB1sWJQkWZcgBbjcFg9GIl7ulSnpeycaY
 Unx7/0E8cQq4ZweW9bW7x4iR6vZOJi8/Jn5hy0UeymctwZKVuq7RXBjAoRgJO5lKz/0NjJDHpWx
 auzOzKiy16WQX/wcd7yZCs4jiHtTj32suYUzZQct4wDqM2EFSYNFaA8uxSsMA9oPpf75qlpoYye
 YZeaKGbBv7usUVHRs5ncx96dysqI8mI7H9eLVUQzUSyCJBUEkJZac8yDfwhv5ajUkdWytToLPJi
 VNzaLyrjDhAyJTIsIjSFvwVvChHNL4K
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the pinctrl binding and TLMM driver for Qualcomm Netrani
(SM7435). The driver reuses the existing Qualcomm pinctrl infrastructure.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
SignKirigami (2):
      dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
      pinctrl: qcom: Add Netrani TLMM support

 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        |  190 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-netrani.c             | 2087 ++++++++++++++++++++
 4 files changed, 2288 insertions(+)
---
base-commit: fd2d5e9417a86d015a4c7b9759d2d3d6182fcd7b
change-id: 20261124-netrani-tlmm-v1-2d4378effd39

Best regards,
--  
SignKirigami <prcups@krgm.moe>

