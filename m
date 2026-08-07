Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54523B05BC
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786129512; cv=none; b=lf4eFZYP68K9RkT3KSq65zs1GFDlWd4YwuF/rMIf2XG+6lRrMV7pxt7JdhMvhT2CPPcxF30zqPx8uwnSNEymkKDTobyMJ2iZP08yKOTZljOtIx1rN7YvSDPwl5XEqZcyZQRdnY6CTALIIkIfv7dkzYTj8MBwvOPSyr4uZ5g21nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786129512; c=relaxed/simple;
	bh=zcLV0ucYHgZYhyo03se1WLqkzlHyV/JjAFz1NeXASAM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ff6g5LAE2OP8kEPWxg9Xo7Ai1F0pqE9LIaLLx78E0WDxFaGiYcXWlYq7onUndjOfI/rwYPWMxXet+fqci046yGZ8nWDZXGrUf7aX8kixHZ+Hm+5M3RE+yLnWC5oP0NCDfAABF2dLXfYEbuJkUab3NmQZo6x8SUjeIg5cQ1VlyhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBYkGnpF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBYkGnpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DB31F00A3D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786129511;
	bh=rC/aqKQBkKA7+IfHLwCx8M7WPhwIjcxwdTypUO7mvzk=;
	h=From:Date:Subject:To:Cc;
	b=IBYkGnpF5cUKbMnN9uI3PkmoYdtCqC2LZALBOaqhfA2/93Uzuc+Cb1/Xc1u9d2QjD
	 Sxj4I2o6Jd8UxgoswHPc47YHG5/kLt2GR/PVSEg+J2NGJkch3Rw3CuA2w5Au+eGhIa
	 kL/NnuD13V7fcKVSqPigGC/JtNtanI9M5udu8e9TYeM3z7KXUOkSHkBVb5mQPE/gQM
	 g90w274vxiBm/mpvf0YPBKNmA+IYRYQYSLgFoKt1UOrDDbI0QbfDYZ8/2JQlnHI2F3
	 j9iXuwR7fCHsFdBHd208oI+DgWMYXt0ivMNARB0lB10D8Ta1HCXvF8mptECzch06zP
	 BIZlGYZYQO33g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c86945164so32609371fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 12:05:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RorLMZjvmr2J6DJhO7ti9pdViD4wm/7/NLA6/mZZ/ebpc0A3id0l1DxQhxoH2UEMYJBtMmhidX2ZPS5@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtr/ahnKpqavSflzgUk6dNUEpXVtYKvVjawn3xTgGbLu0V03s
	zfyk1kU70yXKnqBOqekWGnaQJTUExTuOaB0Eb36kp1SwBbJy0ZT3DMqGvHZzylgzMBGPQKKYIY0
	HPDI5ewmAW07lHelXtTzUl+mkJzPS2Bc=
X-Received: by 2002:a05:651c:43db:20b0:39b:9fc:eb4e with SMTP id
 38308e7fff4ca-39fe5772fe0mr1997441fa.17.1786129510114; Fri, 07 Aug 2026
 12:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 21:04:58 +0200
X-Gmail-Original-Message-ID: <CAD++jL=uF6tB3VawdPjdPTLFD5ca+2PqPYyYE6PQTPiqe_B=Mw@mail.gmail.com>
X-Gm-Features: AUfX_mxEqOP0w4YJ5Bo6Y_rTbv2BXtUoDnxpo1KDc39czv5Aw1fDuVD_bE4XAbo
Message-ID: <CAD++jL=uF6tB3VawdPjdPTLFD5ca+2PqPYyYE6PQTPiqe_B=Mw@mail.gmail.com>
Subject: [GIT PULL] late pin control fixes for v7.2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

some late pin control fixes. All about Qualcomm IPQ (networking,
routers etc) SoCs.

Details in the signed tag.

Please pull it in!

Yours,
Linus Wallej

The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:

  Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.2-3

for you to fetch changes up to 696ff859f5f93a7cedab2a2afa20bd1635918fcf:

  Merge tag 'pinctrl-qcom-fixes-for-v7.2-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes
(2026-08-03 09:54:28 +0200)

----------------------------------------------------------------
Pin control fixes for v7.2:

Qualcomm fixes: some incorrectly defined groups in IPQ9650,
two pins needing to be marked as GPIO in IPQ806X.

----------------------------------------------------------------
Hans Ulli Kroll (2):
      pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
      pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function

Linus Walleij (1):
      Merge tag 'pinctrl-qcom-fixes-for-v7.2-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes

Taceddin Sancak (1):
      pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins

 drivers/pinctrl/qcom/pinctrl-ipq8064.c | 8 ++++----
 drivers/pinctrl/qcom/pinctrl-ipq9650.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-msm.h     | 5 +++++
 3 files changed, 11 insertions(+), 6 deletions(-)
