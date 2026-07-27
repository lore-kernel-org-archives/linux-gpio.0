Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DF03ED3C4
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144354; cv=none; b=Gp/IBfWwrM6d9Cbr9umt4JlKGT1MprI+NFqaQzIn4Q9VfEu4qpuWhCHp89r+0+EBaMdKfAeJ4V7a91MTB7ELk/4dh1qc7EhHeqvgjI8MUDJ0NYoCLzyx7B10PeZGug8WZJBL22t+cJ/vq/Nj1ergXyM3p0vGh7NG/HWypYSa5x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144354; c=relaxed/simple;
	bh=zRhs2wPls6Su0L/HfZPe0QSjJXXNRbP7C2x4iqfkA8o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ITs56EwuIghEZ6pfkCi4CnnMrCs8FraZZKV/5Rjvs9ppbFAPZRcatsNWa/0oJqHcTGm6waiZ6df1Ya+rUF7HqOCiSMZkMlm9DdKIVdgTOL2+ih9omGkAKk2RTEyy1jossbJlwGqxvS0EKJOwAt+Zva305FHoJBQOyZp/FFpPXFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvrA45h0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvrA45h0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A89D1F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785144353;
	bh=vTnMsn/uShSkjlA0aqqk1sUPwnGOqXPPfKchamh7+w4=;
	h=From:Date:Subject:To:Cc;
	b=kvrA45h0vECZpeTdP/1xVT9er/ucDDix6J/cLGBqnpAk1DrznN5c9CnAN9OHPzA4C
	 DFiK46EjHugwXu8SAAlXFX+myPylxSgnL8hvQaAgNCOLYC2+VjElipiSeMB3/r/tEL
	 8YmoAVjFxMJ1dDjGcysinUkPrQ5qg7gFUArO3IwJcZKKQqijZKuxgy6AwJDNnnaqVb
	 /uuDU7/QQhU+PimLOYc0Wnl06IMCBrlKU/N7PUMoEFOoWZnjhHB+6QGgg6dXVoNBc7
	 s5cpc4tzmLZkFE6yG9cEdynOuNEbizMlemmtwu/Ttq+qcY2XChmpQxvDoqZ+KtnwcL
	 Uaadc1Fzh+nIA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c953950dfso21754341fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 02:25:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YwkqttLpv8wiEMuTtlpKSAQyUpoXWzTDtbIhJKSka9sahCAK3F2
	MIIlncCT6ex1aNvMr1/Q/axrzJNMgy8NucAjEgNaLET3jmgHGI+5Dl/g5lVkfeCOg8RWn8zWWyy
	74CH8ePwV91llekJhjg0p429K/raH/+8=
X-Received: by 2002:a2e:a592:0:b0:39b:b01:ab84 with SMTP id
 38308e7fff4ca-39f2877af80mr13422341fa.3.1785144351753; Mon, 27 Jul 2026
 02:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Jul 2026 11:25:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLnO-2JY9VzFJi46PczKG6ePdwbn1ZJy-z+pcW-8RREnKg@mail.gmail.com>
X-Gm-Features: AUfX_mx_B6B79JDEhIpLDqLHBZgEpg819X6TFMwbWLlhr9iRf2VnntSfP5CYbc4
Message-ID: <CAD++jLnO-2JY9VzFJi46PczKG6ePdwbn1ZJy-z+pcW-8RREnKg@mail.gmail.com>
Subject: [GIT PULL] Pin control fixes for v7.2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some v7.2 series pin control fixes. I should have sent some earlier,
mea culpa. I was on the (Swedish) west coast, it has the same tranquil
quality as the Pellinge archipelago, just not as big.

The most interesting commit is the S4 fix for AMD, which probably is helpful
to a whole bunch of important machines.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.2-2

for you to fetch changes up to dad6e107b3cd9d20514e7799b7ad8674f81e3f30:

  pinctrl: bm1880: add missing select GENERIC_PINCONF (2026-07-25
11:33:32 +0200)

----------------------------------------------------------------
Pin control fixes for the v7.2 series:

- Wakeup nits on the Qualcomm SC8280XP.

- Double-free issues on the device tree parsing error path.

- Fixup of the S4 sleep state handling on AMD pin control.

- Missing Kconfig select REGMAP_MMIO for the Microchip
  driver leading to compile stalls.

- Missing Kconfig select GENERIC_PINCONF for the Bitmain
  BM1880 leading to compile stalls.

----------------------------------------------------------------
Benjamin Boortz (2):
      pinctrl: microchip-sgpio: add missing select REGMAP_MMIO
      pinctrl: bm1880: add missing select GENERIC_PINCONF

Karl Mehltretter (1):
      pinctrl: devicetree: don't free uninitialized dev_name on error path

Konrad Dybcio (1):
      pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151

Linus Walleij (1):
      Merge tag 'pinctrl-qcom-fixes-for-v7.2-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes

Mario Limonciello (1):
      pinctrl-amd: Don't clear S4 wake bits at probe

Sneh Mankad (1):
      pinctrl: qcom: Unconditionally mark gpio as wakeup enable

 drivers/pinctrl/Kconfig                 |  2 ++
 drivers/pinctrl/devicetree.c            |  4 ++++
 drivers/pinctrl/pinctrl-amd.c           |  3 +--
 drivers/pinctrl/qcom/pinctrl-msm.c      |  8 ++++----
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 21 +++++++++++----------
 5 files changed, 22 insertions(+), 16 deletions(-)
