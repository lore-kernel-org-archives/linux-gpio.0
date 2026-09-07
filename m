Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F6E511231;
	Mon,  7 Sep 2026 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797127; cv=none; b=ti4N3WY7v7nWrl0dYsdFncnsrrOm8OIZt0zUgMsKb7D3HApRJxoKeg5FBpUuXkXe9OYbPyBoCIwQVYs5EUXIDnQr2dENCpsu201PQyFMw50IFqIk9Oot+Z+vgGIflV/yh/dUweEsSI9hc5QUZ6vcf+KTHR/To2AJ3+3ccQ/LV2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797127; c=relaxed/simple;
	bh=w8EZ05k0q853OfA8iwP87wk48lOVG5pSeQC1y/3ymSg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fyFiE6p4yB/BgVMe+U/srlZAX7d7WltHK/qPzQEXQkaFxH2HonIEYDeHKk7A9rQFMwuLkJ94lDSitoLE8d+Z8IuOoQomViZaY+C4RnWrEK+IgeS/UsDBkedf/F87as1OwHJ8SC6MO/Oxsarb1pSU5bq11rwnlCeUSovWp7ng7K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0XmPrJz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0XmPrJz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B33EDC2BCC7;
	Mon,  7 Sep 2026 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788797126;
	bh=w8EZ05k0q853OfA8iwP87wk48lOVG5pSeQC1y/3ymSg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q0XmPrJz2D55pN8Yf07Dd+0Shs7NFo+ah/2FZXnaq1fXz2mzuXJ4V2CKddAcGM0i1
	 1eZsmY+F8NtsMG7cuH4ooCI+q+6wFwYEDDgiPAAEWnkQAlNN/VSMEFLvrfUzPiaOnh
	 4qqhlSjDIsdDwMT2mIdc6/HSAlct8Hs+VxPrxB4wKEYHJm2XeKXD5zU9xorYL7Asu2
	 K79KYjYv7SSscXqyQ8sEmVOk1AsYD3gZUqkA/ot6Z1Oct8mGFNdNIpzE5++Ht+4Ttk
	 lvvM9e965dlEdpq6l/56cqxJE2F3mPamQvFt7H1bxUlE456fQNZ7NV4c19bCo4ltJH
	 8dpK0PIU2BvEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F5FC79FA0;
	Mon,  7 Sep 2026 16:05:26 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Subject: [PATCH v5 0/2] Add pinctrl support for MSM8952
Date: Mon, 07 Sep 2026 19:05:23 +0300
Message-Id: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XPwYrDIBCA4VcpnuvijBq1p75H2UNMNB1oTNESd
 gl59zW97EK69PgPzDfMwkrIFAo7HRaWw0yFplRDHw+su7ZpCJz62gwFNsJCw8cyWqeR3yl1j3z
 jvkPfK6scNsDq1j2HSF9P8fJZ+0rlMeXv54EZtun/1gxc8NagQd/1CNacx5bSjRKl4WPKA9vAG
 f8gKPYIVsRH9NYbL43zLxH5izih9oisCIDQoGOMGuRLRL1BVEUaA8ro0IN0+3fWdf0BR6gs1YI
 BAAA=
X-Change-ID: 20260816-msm8952-pinctrl-bc2bd4849261
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Muzaffer Kadir <muzafferkadir@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788797124; l=2000;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=w8EZ05k0q853OfA8iwP87wk48lOVG5pSeQC1y/3ymSg=;
 b=pA6RhdN/1ibvbeFEwNkdgITnMcWvxfF7Dp8JxNN0tH/UXSnBHDkzfYlSVPB7N86uv4p1bduMq
 63EpZ75pVhADjc58yTB1hOERpFWjP5pxBZXRtebFmk3RlYel1oKU79S
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
Changes in v5:
- Add mpm map as Konrad Dybcio provided.
- Change "GPL v2" to "GPL" as Konrad Dybcio suggested.
- Add missing pin mappings for qdss_tracedata_b and
  atest_combodac_to_gpio_native functions.
- Link to v4: https://lore.kernel.org/r/20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org

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
 drivers/pinctrl/qcom/pinctrl-msm8952.c             | 1257 ++++++++++++++++++++
 4 files changed, 1412 insertions(+)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260816-msm8952-pinctrl-bc2bd4849261

Best regards,
-- 
Muzaffer Kadir <muzafferkadir@mainlining.org>


