Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747704;
	b=fV2pGimMbwpYmE2a2MOZMTEiXw31pmR2SsBnD3isaTQ7cV4zMzOb2ZKCkT9sYKQSX0k2
	 wHzpCNmI5t389eJCapvFtL0BR1+DDFYw+FKItb7H/kPIHwgxkGLtMsBZewAZh2JkdnKaO
	 fgXwS0od1CwJq7az8FnoW9uomfL4xR2J1Q5l5XWltjSFP1Nb6qezRHLFVg5BnZsuP5NB9
	 RlU2RYp4lJ7zYqG6YueAKdZBzf7/XwlYPAx57NqdHhEqJLEygc3U0+T6Y35NJVJWa2vKq
	 /TIvHoevwR9FN0sZVgMZuuH5dQ8Rh5Dzok053NYHsv32TbIuwalyHJGkkvmAEZcuq0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747704;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=GfI8kygol7g+sLfIq66a33G/wEZGaMYNlYrxFqU69cM=;
	b=2FZT7bvSY0nqi18QKzDtW0b8rLlF9eaAhCAT/GJsC5X+9iFDrv7KXNm3ERNLn74GzIr6
	 sPhug2g6T5ibanh5pqZK4BU6L6qo4n7bh0aQcrA3fJ8xfU3cdcrZ69j7dWZrqdgyKWbBT
	 LAEGfwDkjjKu/tpKy/1xCe7mjaeglG4LVL7XCCCe5r5LjmjnZQhs9ubsr9yZt0XfViqT5
	 D1DBf2RmzqYDPZo1wogb9YylAOIuH3M/nTBLG3dNQW+CMJj3wwqYtj5txD018sGLSWoGr
	 LcCRBo0BS9o4jKaG8pVJxUHaNyXBEDDRdlB4ONEj6wTJpT6AeX6Zm0fVGjJUMdb2Qsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34ED606A31E;
	Fri, 27 Nov 2026 02:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id D226C82D;
	Fri, 27 Nov 2026 08:18:19 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH v4 0/2] Add Qualcomm Netrani TLMM support
Date: Fri, 27 Nov 2026 10:47:27 +0800
Message-Id: <20261127-netrani-tlmm-v4-20261127-v4-0-a77415255784@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z3M0QpAQBCF4VfRXJtiCXkVuWB3MGJpd0nJu1uUy
 6/T+U+wZJgslMEJhna2vGiPNAxADo3uCVl5g4hEFsciR03ONJrRTfOMe4r/UCRKJDkplckC/H0
 11PHxpqv6s93akaR7enBdNykLyKN8AAAA
X-Change-ID: 20261127-netrani-tlmm-v4-20261127-83d237edd6c8
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=u5vVk2JtGptJnAhZzEG3NtvcHIG2BE5593LoiQRI4pY=;
 b=kA0DAAgBXR04m3a6YmMByyZiAGsI70bIYg3qnGhbB5Kh0Eui2VVHsU0rMmVX2Zn0cEiP0td6c
 YkBzwQAAQgAORYhBFIKUnbOOdxR01TQUV0dOJt2umJjBQJrCO9GGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDAsMgAKCRBdHTibdrpiYyUzC/9sMVOzaDkzMwds5kANwxtntVQMB1Yqh+fyMXP2wqx
 v287dw60SWKJKYQTFXjmsGUdzdEbRkF0axR77aksLdXPSA/Q5LCzTp7b4339WJ7ZqhlbD2FnHkP
 a88rD4rkfR9Nod0L660q6viSi7b+RZopbLxiX5B5+9lk1F6JUk+1RUJdVLkaQHoOhGU92DBLBNg
 rrUfM9npvyzfokxaD6ePEHd4jvRo3XdzVzCpHkJY49y6vLUsGMUdzmYIJ1VB4HwWA9YTAtxQ/aJ
 LTT2dVb7lY2zLSLE4gzT/Fd8lqML6tKnHtMvy7/tktojfIh8sLyESbQrXWpTc5d9m10KdjGFaMz
 wkW2BmjXV+sKE4vJ1tZaXhJ/kR1aWFOZZqke+jLTSAs4oxV/mcCWs58stG9FgU3xckpr+0p+J2N
 ZZTSJjRm339QIEL59SML3JVSPo3z1WRoMLQw3vlqpgcy27OxUqDH3jI2cOvxHeD1aFrAIOfexZB
 ybQ/Hy6bikmLUox5vD9WOM=
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the devicetree binding and pinctrl driver for the Qualcomm Netrani
(SM7435) TLMM controller. The controller provides 142 GPIOs, pin
configuration, eGPIO, dedicated SDC/UFS pins and a PDC wakeup mapping.

Changes in v4:
- Rebuild from the submitted v2 logical-function model.
- Add GP_MN on GPIO18 slot 2.
- Use pinctrl@f100000 and relative UFS/SDC register offsets.
- Wrap the dedicated-pin enum and document the driver scope.

Link to v3:
https://lore.kernel.org/all/20261127-netrani-tlmm-v3-v3-0-3bf3f0bbe5df@krgm.moe/

Link to v2:
https://lore.kernel.org/all/20261126-netrani-tlmm-v1-v2-0-3426fca870c1@krgm.moe/

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
SignKirigami (2):
      dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
      pinctrl: qcom: Add Netrani TLMM support

 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        |  138 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-netrani.c             | 1333 ++++++++++++++++++++
 4 files changed, 1482 insertions(+)
---
base-commit: fd2d5e9417a86d015a4c7b9759d2d3d6182fcd7b
change-id: 20261127-netrani-tlmm-v4-20261127-83d237edd6c8

Best regards,
--  
SignKirigami <prcups@krgm.moe>

