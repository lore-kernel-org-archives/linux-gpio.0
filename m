Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449800;
	b=VhqXXdzVZQYChuLAgg3kFCGxYvJrZscEhjVXEUIj6iIpxTuOTHavlrLGB/8VGTaC11dQ
	 uN+ZuDCn6zupYMCVXSVm8fxymRj013UAVwrtkxGkdERHWfnWBsyc0N2ntXAQcvVoxdq4R
	 McSdDyflfjfxfIokjTl0EsE3IBa9gqd9yz/0gFWJ+AG4Ru+dvYVWW4q7ocnWMRy3629Ex
	 eAm+Sb/JgbzaUYhTra5qc6PeVzut+Au9HnYx1BWqSuU1Cf9IH1Dt4lJDVALC7/I0iNIK/
	 jBu8P7UxaB4veZd0aoHkdAppXCRKZPbWO26Ki8jUmUOLQdrxdHhRgX2pSdERALFlSFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449800;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Z2+DMk+CdL2KNNlqQt30fdWXobrMWDKRNra/MGXy9C0=;
	b=RLsJNZHJtdlAPVlxrDt+gn5l1T+8sKDD0Y0iKwft+wKPcJxLhFbmOIgcCWfYO8e/yoTg
	 dsE1/fGDzUIlULEDrPnSgSXFXBrMAnUEud91efJJaXLJHSpxZD+u9Wpbb/Whc/0+BtX0t
	 KQ/23WMzogu+HFRbb/+irJWcRk5iacu2VUmUx8iVI+ITkwS1fvgiirQDYJYXWA1KxlQa0
	 a2Ijr0i2Z3WXWVJ2k+nqjqaWpSl6K9HXqeYvlebFykkf1F6sesP/B4S66OfiS1+/vP5i/
	 ytAbrSxTHiwPHc5Fg/QvkjmYFiDEQbJbZsC6RmwxIpMT6d9JIewyxfvBsjIWLB4OpUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5vvAieE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB95606A31A;
	Mon, 23 Nov 2026 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5vvAieE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795449799;
	b=oeREc8bL3leZqojjx63FZ873+Yp0Do75UNCK/ZMN0NDP7OsaGJHEkQv1mxD/hg//I5Pd
	 3FOjyCLx3KxBIm1fl+CeuwVdQzohIx8j/IluJUuET3x0hVCbkDvMpvs62SumPG1qEp1k7
	 FItadl54xb7hfDK83f4C49QhhUyhteb5dFdEnegHJyBJibA0tHEXXH3Y0y7IVy2ZypD1u
	 WvsxuFnpCwtq2Jq2gIWb/nIcpL7wgtJon9hHYgfHIenxH9uozsO5wOA1pD9iVtCY9vTJy
	 izeK88B/iJ2gNLP6t4KCle3SohC/jBOwQoSNHwljkWaZxROnxlStkiZi8KJ1iJU8NxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795449799;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Z2+DMk+CdL2KNNlqQt30fdWXobrMWDKRNra/MGXy9C0=;
	b=e/8ss+TgDyqe8u4SfgqmbCR76PEkQSGV80a8BegimdE0MmVkT3VKJlq4wDFhNUHbmjlX
	 7pkUoG/bz5MvJLBeMwUpCgBNlxIio8YBpOu61nj1YzanQqOuUBd7hTac05gmB3p2l9BBa
	 g3BJ0JG8PTFVRUQQsJ2fp5dDOQKdV6In5oOta9t9JF2dj658kVKvO5EriMUszdg7s5GdJ
	 iC/CJKoWblmLL3nYSC0mm8lnluhM0r7ZSFyVYY7g9Mu5hPngi3RX/qGGfJFjKZbIAGw0R
	 bdhpTegY5zQJixCbnsitWI7KsIA7NwxNVKS/rEhswaObIGNo1Mi7DyB3TcMnqS0ZdTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E1121F000D0;
	Mon, 23 Nov 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449799;
	bh=Z2+DMk+CdL2KNNlqQt30fdWXobrMWDKRNra/MGXy9C0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Y5vvAieE34+D7fT7ke1Q7wWUcWFgZeVH3O/mHr2+cuZErmyTBhLuECaDGuPvsO+Fq
	 8JBleE2RilfAUOxPhuVhUI4QFBx3V77DV6cvGy0TiVPXjLsyC1KPIvVs7Upq3OAJOe
	 4vhNf9lGUG43YTihb3Ld1RLgurKYg2oBlVfqrE7kGpKEqqmg6GSyvgWdz9PJHFMaSH
	 3pt7fcKU89bRvwePPFY8seUKWpp9M7vwS7XSrZ5GsQegrGouKFvzdNftX47UQXgs6E
	 3Q3wYwLtyQMJ0Qz+CkNVNVe0tJTmVSp2q4XgZ2Bwloa8/qvJLuCCkYEG/ZQPMHt0Kc
	 3dktVcikzCEBw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ACF0B4C544;
	Mon, 23 Nov 2026 16:03:12 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v4 0/2] pinctrl: qcom: Add the Molokai TLMM
Date: Mon, 23 Nov 2026 21:33:11 +0530
Message-Id: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBCG4auYrq3ptOVHV97DuGjLIFVKDUUiI
 dzdghsl0eWXzPPOSAK2FgM5bEbSYm+D9U0ccrshplLNBakt4iac8RQAUup87W/K0q52jmrFECW
 kmIAgkdxbLO1zyZ3O7x0e+oqmmxvzRWVD59th+dfDfPcj3QNlVGglc8kY40YfB1V5vzPekTnd8
 3+YRyz5vsxNXuSoYY3FB+ZshUXEmJRGZCgyBl94mqYXOU5CPDQBAAA=
X-Change-ID: 20261116-molokai-tlmm-ba0ee416e513
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795449791; l=2623;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=YghJL2tppXpXW7QuBO70OW5/eT9OsVH5AX0MYd/LT58=;
 b=jdib9YqWUdYP9CmFeEeboeYd4KM6eVAAJj3XnGw3kUbMuhFa8nDtYZnRJMb/8MnMhgJYdrSEQ
 XIyb8UkC5EiCplPTbxqKr5rmDxxyzFPb7EvL/eayW4eTYVysviml4Rj
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

Molokai (SM8845) is a Qualcomm SoC derived from Kaanapali (SM8850), found
for example in the Motorola Signature. Its TLMM has the Kaanapali register
layout, but 205 GPIOs instead of 217, the Kaanapali pin functions on only
35 pins and a GPIO to PDC wakeup map with no entry in common. With the
Kaanapali tables a wake-capable GPIO interrupt is routed to the wrong PDC
input and never fires, so this adds a binding and a driver of its own.

The SoC and board devicetree that use it are sent separately in "Add
support for the Qualcomm Molokai (SM8845) and the Motorola Signature".

Tested on the Motorola Signature: the UFS reset, the keys and the GPIO
interrupts that go through the PDC (touchscreen, amplifiers) work.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
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

 .../bindings/pinctrl/qcom,molokai-tlmm.yaml        |  128 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-molokai.c             | 1681 ++++++++++++++++++++
 4 files changed, 1820 insertions(+)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261116-molokai-tlmm-ba0ee416e513

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


