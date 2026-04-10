Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36C395DBF
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805121; cv=none; b=ajgvTUPwhHsQy46z+/2BAyEyB86nkKpJ+Rwyxd3ru8oFe03AGADvNMRR6A86su0RNN4wNdVZ3Wfcw+fzXo4Z0sZvFHL25GkcfSMVQUZqNjoqtskaASWXGZWrzy7uh7/AeAjq4o22vOgdsXmik7Gnk4QOivfs7JtU/lm+vCRCF9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805121; c=relaxed/simple;
	bh=jV39ZSHLBML5f12g+fRpfeDbiAQBOpBwV8H1P6mSnD4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UG9Q7DhO+HOuBaaeTnxqrM4qYHoTxJRVWRO59O1JAZ1rY/xBhtEbmPrqvCiLyDCKEfHxrEUkmD5aLvAgJcONmlpByXX0ulmkMj3gRIeSbTL1UBYJgmewp/yR/LWjBMOM+97IHcjFAUXhY6ymQxo5pUX19y16amKxyPVi7pm/g28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYo7RxKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYo7RxKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5883DC2BCAF
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775805121;
	bh=jV39ZSHLBML5f12g+fRpfeDbiAQBOpBwV8H1P6mSnD4=;
	h=From:Date:Subject:To:Cc:From;
	b=jYo7RxKzLh19VCBHeOJlhHZUWXP7px2OfTifjdWtSvrOfuljM6TX2e6ktYO94eVpS
	 bJJiYe0yimd5nTupL7y0Ok4ZcEfVDYXOMCJgMJ1Txq08rUSuWV55pkED+iY9rodsHw
	 ytrr1A2TzyawwNDoyBOjnJSWh+mGvKSn7omeplTyfJkaeJEB4jTYXrSx3yAq9mJcGm
	 FbJDOOZ9vFe3oRnu5R7N212wBu1misZIO5Z1lX7ofnBObMRbfroPiPUryqxqgXK+ho
	 BUHz7GW6NbHMDprK51l9e/H1SFxuNp8Vk3wcJDnXhrUaTk1Ao5bnwED/VaM0w9LIYR
	 VfIj4XnFuP9QA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a46ebe2beso18036877b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 00:12:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YyK5UX4k7Xa8S1jPmf4d/vYjY8mjXTanvVErIfXQNT9aHvNZOik
	DHtr4/IqdVr1jTecTR6KNB9QPvCHNiN/OXNcOC5lJAHLPQsc5r0qZhXuIzXbYW999wHcf4VDmWo
	LAOjGL7lAkWfEcWziKnRnX19f2aKcQ2g=
X-Received: by 2002:a05:690c:397:b0:79a:b1e1:49cd with SMTP id
 00721157ae682-7af7108b51cmr19612547b3.33.1775805120632; Fri, 10 Apr 2026
 00:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Apr 2026 09:11:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLnTaQMzLR32LFCx4u1Eft+S+fpaKuMdGqX9sBY5v-X+Yw@mail.gmail.com>
X-Gm-Features: AQROBzCl_eLMVXFisH59TZV1ceV-rMMc158ayBreE8RJ-DWLtIeSFu8Jh7P_Myk
Message-ID: <CAD++jLnTaQMzLR32LFCx4u1Eft+S+fpaKuMdGqX9sBY5v-X+Yw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v7.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

some late pin control fixes. I'm not happy to have bugs so late in
the kernel cycle, but they are all driver specifics so I guess it's
how it is.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 7aaa8047eafd0bd628065b15757d9b48c5f9c07d:

  Linux 7.0-rc6 (2026-03-29 15:40:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.0-4

for you to fetch changes up to db5b8cecbdf479ad13156af750377e5b43853fab:

  pinctrl: mcp23s08: Disable all pin interrupts during probe
(2026-04-07 11:29:57 +0200)

----------------------------------------------------------------
Pin control fixes for the v7.0 series:

- Three fixes for the Intel pin control driver fixing the feature
  set for the new silicon.

- One fix for an IRQ storm in the MCP23S08 pin controller/GPIO
  expander.

----------------------------------------------------------------
Andy Shevchenko (3):
      pinctrl: intel: Improve capability support
      pinctrl: intel: Fix the revision for new features (1kOhm PD, HW debouncer)
      pinctrl: intel: Enable 3-bit PAD_OWN feature

Francesco Lavra (1):
      pinctrl: mcp23s08: Disable all pin interrupts during probe

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v7.0-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into fixes

 drivers/pinctrl/intel/pinctrl-intel.c | 36 +++++++++++++++++++++++++----------
 drivers/pinctrl/intel/pinctrl-intel.h |  1 +
 drivers/pinctrl/pinctrl-mcp23s08.c    |  9 +++++++++
 3 files changed, 36 insertions(+), 10 deletions(-)
