Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCD3A6B6F;
	Sun, 16 Aug 2026 13:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786888117; cv=none; b=DQ65RdIGT1kHiWRkaemWiPTPeyobvg269lI9P8waqPrsoXMK8dZX7prnPxfiaD1MKw3FNgk+hhCCK+hQeROW0Od0mM1Qud1efpgo2W1IE0dDHDfMtXMf97NsfqbtVv5UBKNMrljhqFCrFRnwIkM0a73W69YQGiMstd56oLD4UKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786888117; c=relaxed/simple;
	bh=hax40JvGfGceqZVis9K771ku6lFmRrEHVKGcqZpvT1A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=obmDDlrtd2mSmeVFdO//L/s72Ba1FMgDxQbAYJ43AGofFtFSkTgVLwiMwmGgCGK03nruW1Z649DSxIfMassOF9UK05q4wH3IhbcFyi9g+9Ze38uZGCfIy6ElIBIivRj4KDVVzoY2YwQJaaLchyJzeBqyVF4OUkO2wDkY144TPIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COuMN8D7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COuMN8D7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5A02C2BCC7;
	Sun, 16 Aug 2026 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786888116;
	bh=hax40JvGfGceqZVis9K771ku6lFmRrEHVKGcqZpvT1A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=COuMN8D7P2V2oP5qx1yZyy2NViWuVqD8SGQVACelfYYg6cSLBNdTEA0P+NeRBIQ3q
	 oTIbgafz0pCbjxYGDnV8rD907ImoVDVeRHmu5NwR4RFAHddEgeiOKU50xl28/qwG78
	 KMLcMq2S4paD/tnPZW6X/Q6/D3COfpeHtzsehfHALDKzHZ+cPPy5EUXn89aK+iM1Sy
	 YpHqd6ungs2ZnrltqM5TWTSn6T+uGOYHzOSHGcpATpXPAiIIv8taDBlB3qPhH0Tqqf
	 h2l5gwgTX+U/YNHq8fAxIQzsNqj/teNfYIjwxHty8RrkdpZmPl01o/BuW6f5NXbE7M
	 HgA/pZ5blmRxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756C4C5DF70;
	Sun, 16 Aug 2026 13:48:36 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Subject: [PATCH 0/2] Add pinctrl support for MSM8952
Date: Sun, 16 Aug 2026 16:48:29 +0300
Message-Id: <20260816-msm8952-pinctrl-v1-0-a7272bcd2187@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBNyKNGuEi3KphpIE40IorsnL
 d/i/wcyJaYMnXgg0cWZj1CgKgFuG8NKkudiwBp1bZSWPntjW5SRgzvTLieH09yYxqJWUKqYaOH
 7P/bD+34H7QynYQAAAA==
X-Change-ID: 20260816-msm8952-pinctrl-bc2bd4849261
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Muzaffer Kadir <muzafferkadir@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786888114; l=1113;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=hax40JvGfGceqZVis9K771ku6lFmRrEHVKGcqZpvT1A=;
 b=pJT5qLFodtWLVsO4kFHp1fpYn+TFtUyNvVdZjf+mnvMIgbHe3aEZvmw8E5TS3+5cdocOkTSwj
 g5eeSJAHj4ADjVlZOCDlmPp/KAUkjJCr5kRv7OQy6QmjzlpMFsfyN3l
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
has some differences in some of the pins and their functions.
This driver was tested on General Mobile GM 5 Plus
(shamrock) using my own kernel fork [1].
I'm holding off on sending the GCC (Global Clock
Controller) driver and initial device tree until I've resolved some
outstanding bugs in the GCC driver.

[1] https://github.com/kadir1243/linux

Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
Muzaffer Kadir (2):
      dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

 .../bindings/pinctrl/qcom,msm8952-pinctrl.yaml     |  155 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |    6 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8952.c             | 1248 ++++++++++++++++++++
 4 files changed, 1410 insertions(+)
---
base-commit: 22eb4b80c0ab1aac513cca427a16de8986f3301e
change-id: 20260816-msm8952-pinctrl-bc2bd4849261

Best regards,
-- 
Muzaffer Kadir <muzafferkadir@mainlining.org>


