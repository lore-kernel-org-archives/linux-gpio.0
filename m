Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795711920;
	b=3eSRqeOavCi1d3eJnKTD/Hsos43LUYwQCK05WM4SrPqYqundfRVNL/ZHeT7i/A/SjD9v
	 tWC/l/xLkZvV53fnAYGXk7XaR/NQ+cB/uKqRqWB/tAqS7WgNHVqcSMMBQzAw8GS3IQWDc
	 SbJ3wlXA9PYGtY/zktAJoh2uOqOfnqgmRja8TBIJLWUsMQSB2U+xKhOF0bJ8nIt00Yxpi
	 OhIjqDsMPwDdj2yn4z5W5v5DVupM3CwYoV1cGOcVPMdNmMVJIPwmYt+XFS4nzwAhhXUuf
	 JfYwHZFQ207zg+aVw+jiMS0YJJN+GSk4Ky2DXjUnFk2yLKbBohTCQrGIyPbdwcIflhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711920;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=IZI1G18EIyQNE1DDoE2KMGLxXsH8mObvQd17Sxs0cX0=;
	b=OvcPuDm2CGxHQAsYFB9nRaFSS8Eh/bVcINu9ooSaL/eyqBbv0MJV8QOSGXNz5w+0Hw/x
	 VP3tRrP0R+JHqwevb7ce6SOs44nRCKqGdzsBfxU3+AN6dmd6M+z0xU6DOPsa7O5iVH9sW
	 IjzHjClp8T6rslixbY4TUfOvpu/dGam0wCtC0dMLBVodiGPxs66Pml1oy1/ZtgatY0OIq
	 QgBRK+33JroD9Gl8d0GVOr/0Sqb1zG/80uK40ssGxPMj3WSRrzyTWbdqWkDATrNjw7nxQ
	 00mJ0YcutXamMb74Rkd/46cDDdzTT6tDbXFzo2LFwNCfT5+z8YFj+eBtna5p1GJ+bFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0VjNnw3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A134606A327;
	Thu, 26 Nov 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0VjNnw3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795711920;
	b=imJYJJOd5rgMXAkKw+0RpHyZ0ChyzmMByvxEdqxKd6AYW8fNSj2Xpwf8sxLK56d9KuTk
	 c5+dp4AqNe+DRtXWnavHzFLgwAiipwEP4RHZ4Vge44tFHAL5JiCBWxFGSxbW3cJEGRheR
	 PnqxVMFQRfZmLwS3bQAffswj/q0KX5YxxqBFettwEBALG8/EUBzoOSO569PbapMF7UnxZ
	 Yg6n+cYrFVhHkk8X0R5rLacev9nPPQwpeTBMOpdDL7EwOc4F6FKuup6s0A32k0IeuBgtR
	 oR9g4Rjyc3jIOUhEjD6MH9B8/TejNbV/x7EOh4p9GYrWr6K9kqZVFzk6o5ysVi1pbuw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795711920;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=IZI1G18EIyQNE1DDoE2KMGLxXsH8mObvQd17Sxs0cX0=;
	b=VSOL7LWRxy2t/wF7C32owMPLzVdzOlmD2MOzWY6r2ClvXCigj1u5byrgMX97rmo7pAys
	 T03lxkV3O+xinP1NTRwmpswpZslNz2lfYRCYlEFW021pjVjPHG1Ub3VNyQBllOODi8HnJ
	 1DvaY+riyo5HlhdC6kcALWWxVBvP7zvGXAfzHJpvq0+YP2ooof5kDyZx0zlkey2X+EJpL
	 QRKs0XJsNCKmOf1GsUVNDqabVEh8JPy7bzHV5PiUHIQm81ZSKWOWUvHxW1U+xWjQB/2qg
	 EzQUe6eQcpUuSVf4ZnbmLEEOlX5NPYp8H+9N+/4TYpUeuWirQMniBcFlr6hnEl0dWxQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4AD41F000D2;
	Thu, 26 Nov 2026 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711920;
	bh=IZI1G18EIyQNE1DDoE2KMGLxXsH8mObvQd17Sxs0cX0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=V0VjNnw3nu/kCF6Jwn2gAfDXJooY+aXXBzXzMXpcAZY4XQUCuFYZqAjOyL7eTBPtW
	 VYvLI5FJMeSqW7S+8UcRKnUoKg9S+ZpwBP4g/1LhxOP2mwbNhesiDounNLHIQDqHrY
	 tOgWKLVV8YPszd1+a6+lyA48qlfk01CBoEWalObWTxL00dK3TT4Rg2ZGudS80pI1FK
	 1vdg5O55Apf9TQwp7qHK39jaL33e7Jzb9hnMHh6k2enK1HuPHSiT4J9VZRy2VQmWxy
	 hgYD+V3blkla1W+V6CfGjdoY6I2b7UVuaFW44AY1FnA1FE0Pyv+RCvS6LKe3VuKxcc
	 JaT+THfYHVZ5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 442C84D725;
	Thu, 26 Nov 2026 16:51:58 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v5 0/2] pinctrl: qcom: Add the Molokai TLMM
Date: Thu, 26 Nov 2026 22:21:56 +0530
Message-Id: <20261126-molokai-tlmm-v5-0-ada44435bdd3@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ7CIBCG4asY1mJmgP7oynsYF0CnFrViSm00p
 ncXdNPU6PJL5nnnyQJ1jgLbLJ6so8EF5y9xZMsFs42+HIi7Km4mQOSImPPWn/1JO96f25YbDUQ
 Kc8pQskiuHdXu/s7t9p8dbuZItk+NdNG40Pvu8f43YLr7kR6QA5dGq1IBgLBm+9CN9yvrW5bSg
 /iHRcRKrOvSllVJBudYTrCAGZYRU1ZbWZAsAL+wmmI5wyphqnIira0tYIrHcXwB9Go7n3EBAAA
 =
X-Change-ID: 20261116-molokai-tlmm-ba0ee416e513
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795711916; l=3620;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=yvh6oQ30SWrOi/tTSyISUv5yU+UrT1z3j4lkCL44K4s=;
 b=TUnSqaGa5j4NPRi6MI79uQZ7pZdZMt243F7WrEDymEul+tILdlNAbxi1kI2uU7gjxEs8uJ5Hd
 AXAX3ea10smDNpwNh4e4LS+TMmp7XgWzdu0R4Q4h2R38rWqKQuLx5Fk
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

Molokai (SM8845) is a Qualcomm SoC derived from Kaanapali (SM8850), found
for example in the Motorola Signature. Its TLMM has the Kaanapali register
layout, but 205 GPIOs instead of 217, the Kaanapali pin functions on only
29 pins and a GPIO to PDC wakeup map with no entry in common. With the
Kaanapali tables a wake-capable GPIO interrupt is routed to the wrong PDC
input and never fires, so this adds a binding and a driver of its own.

The SoC and board devicetree that use it are sent separately in "Add
support for the Qualcomm Molokai (SM8845) and the Motorola Signature".

Tested on the Motorola Signature: the UFS reset, the keys and the GPIO
interrupts that go through the PDC (touchscreen, amplifiers) work.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v5:
- Binding commit message: Molokai does have SDC2, muxed on GPIOs; it
  only lacks the dedicated SDC2 pads of Kaanapali (Bartosz).
- Driver: add gp_mn on GPIO127 (Bartosz, Konrad).
- Driver: add the gp_pdm_mira, gp_pdm_mirb, rffe and grfc functions, and
  qup2_se5_l6, qup1_se5_l2_mirb and qup1_se5_l3_mirb for the second QUP
  mux setting of GPIO17, GPIO202 and GPIO203 (Konrad). The three RFFE
  buses share one rffe function, as Konrad suggested. The gp_mn,
  gp_pdm, rffe and grfc muxes are not in the downstream tables, they
  come from Konrad's review.
- Binding: add the new functions to the function enum. Krzysztof's
  Reviewed-by is kept, as the schema only gains enum entries.
- Driver: drop the comment above the pin group table (Konrad).
- Driver commit message and cover: 29 pins (not 35) now have the
  Kaanapali functions, as GPIO138-143 gained rffe and grfc.
- Link to v4: https://patch.msgid.link/20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com

Changes in v4:
- Rebase on next-20261120 instead of the pinctrl for-next branch, no
  code change (Bartosz).
- Driver commit message: say that 35 pins share the Kaanapali functions
  instead of "different on every pin" (Bartosz).
- Link to v3: https://patch.msgid.link/20261120-molokai-tlmm-v3-0-e5fc37e37011@yahoo.com

Changes in v3:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter (Krzysztof).
- Rewrap the GPIO to PDC wakeup map so that no entry is split across
  lines, no change in content.
- Pick up the Reviewed-by of Krzysztof.
- Link to v2: https://patch.msgid.link/20261116-molokai-tlmm-v2-0-429f8c8d8eb1@yahoo.com

Changes in v2:
- Binding: indent the example state node consistently.
- Driver: mark egpio as a GPIO function (MSM_GPIO_PIN_FUNCTION) so GPIO
  requests on pins muxed to egpio are not rejected.
- Kept the default 3-bit interrupt target field: on Molokai INTR_CFG[11]
  reads 0 out of reset and the target resets to 0x7.
- Link to v1: https://patch.msgid.link/20261116-molokai-tlmm-v1-0-3ba4840002cb@yahoo.com

---
Venkat Yadlapati (2):
      dt-bindings: pinctrl: qcom: Add Molokai TLMM
      pinctrl: qcom: Add Molokai TLMM driver

 .../bindings/pinctrl/qcom,molokai-tlmm.yaml        |  129 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-molokai.c             | 1727 ++++++++++++++++++++
 4 files changed, 1867 insertions(+)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261116-molokai-tlmm-ba0ee416e513

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


