Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1964949E0;
	Fri,  4 Sep 2026 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526512; cv=none; b=SRVejlQ2Xwiv+pjDbCScu074nA6zXk85OEU7sokjSBK9ghI/QMKf1bustBohbtkRBHc8rSZsKF/asB8kX2L1e0QOvjwKWc4jsCFGbNKjc87o2nv3ulj4rDTlNtWTCWFtKXT/6Vkr9KwHlXw0RSaM8Dqlu22rwJuB3cDwpptgJKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526512; c=relaxed/simple;
	bh=HAsslAULdDb8Ba96cVtVypmzvw9RPOMnBvl+X9X+L1k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uAXycL3gDYQoTFur4oSgVYANhwz2KF6tJY7tgXqfcYfCbqAJOpwL0qlwzDZD1TSksJIKTLeX6pvh17uEHENbZOYdxz7xNdnSI6vBOqp/VJdKavEhOJKR9UIKQkgHIv7yQTawps/Dfpjb+kUmpD5u5ysoqG2FhCjpPs8Z8O2rz0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mh0qjwkw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mh0qjwkw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46676C2BCC7;
	Fri,  4 Sep 2026 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788526512;
	bh=HAsslAULdDb8Ba96cVtVypmzvw9RPOMnBvl+X9X+L1k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Mh0qjwkwwC8zdthFEp4Eq3OL5Xl3QwOBA8hPTdEJxXx30bEV6Ls7Ttd/dD2AOgCkf
	 umkm+M1Xz8eRdqWK+lR3ZmTxvr0t5P11McxNWXTVPcC+n9L25hrLtTJXZCXZzgrrTe
	 mjLRKPY+6O1NdSQsQIcpTtsMy/oovm/FTG465xdnGrSzgN7h5Ijs/HsK3IFV7T2THm
	 PizReOmsr+jtAAc8wflnUFkiB7gc3VTr7jYImY4IsGU24I7vvPlr8k+dQFgcjtAB0D
	 09TDW/AISaNI6C+ag5/FeMsPyU/R62obXyVppAnksG9XMwpjmfnPKIXXbNYfVJIF16
	 UWbX1Z9pR4wRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1366AC624D3;
	Fri,  4 Sep 2026 12:55:12 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Subject: [PATCH v4 0/2] Add pinctrl support for MSM8952
Date: Fri, 04 Sep 2026 15:55:07 +0300
Message-Id: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQqDMBCG4atI1k3JjD+JXfUepQujiQ7UKIlIi
 3j3Rjct2C7fD+aZhQXjyQR2SRbmzUyBBhcjOyWs7irXGk5NbIYCC6Gg4H3oVZkjH8nVk39wXaN
 uMpWVWACLV6M3lp67eLvH7ihMg3/tD2bY1v/WDFzwSqJEXTcISl77ityDHLn2PPiWbeCMXwiKI
 4IR0Ra10lKnstQ/kfSDlCI7ImlEAEQOubU2h/SArOv6Bj1iGKk9AQAA
X-Change-ID: 20260816-msm8952-pinctrl-bc2bd4849261
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Muzaffer Kadir <muzafferkadir@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788526510; l=1688;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=HAsslAULdDb8Ba96cVtVypmzvw9RPOMnBvl+X9X+L1k=;
 b=YbTucvoOYRPXCnRqBAlaMo3c66QxauVdKq3k/PJEQrQJmUrC+rfszaXPIwO71EqGqioXABWaz
 rSGij4Pq1sHD3MYucxRFvx39OmHpS4joSoDB6P6qqal9F8b5dRKLuf9
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
has some differences in some of the pins and their functions.
This driver tested on General Mobile GM 5 Plus.

Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
Changes in v4:
- Revert back accidentally changed dt-bindings gpio regex.
- Link to v3: https://lore.kernel.org/r/20260904-msm8952-pinctrl-v3-0-110515fff513@mainlining.org

Changes in v3:
- Added missing functions and removed unnecessary functions
  with Konrad Dybcio's suggestions.
- Because of the changes on functions, I changed dt-bindings too.
  Dropped Krzysztof's Reviewed-By attribute because of the changes.
- Rebased and Tested on linux-next, next-20260902 tag.
- Link to v2: https://lore.kernel.org/r/20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org

Changes in v2:
- Reworded dt-bindings commit as Krzysztof suggested.
- Added depends and default to kconfig entry of pinctrl
- Link to v1: https://lore.kernel.org/r/20260816-msm8952-pinctrl-v1-0-a7272bcd2187@mainlining.org

---
Muzaffer Kadir (2):
      dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

 .../bindings/pinctrl/qcom,msm8952-pinctrl.yaml     |  146 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8952.c             | 1194 ++++++++++++++++++++
 4 files changed, 1349 insertions(+)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260816-msm8952-pinctrl-bc2bd4849261

Best regards,
-- 
Muzaffer Kadir <muzafferkadir@mainlining.org>


