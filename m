Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125E38A70D;
	Sat, 28 Mar 2026 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699906; cv=none; b=hmQUKTXkKFuUiRRp7+3sgCcPe1qoEGGpwspqCjIMb5FysFe1dMNjTPu5skWzrwkt7pSz/mYOdQ0ZxuPb/MeeBAiTvZSUERm3zU/7b35I8voYfx3nbgrzwUVHi6fryko/GBeY6yPSRPWTl0B/Eo2FT2MP0Fgr9D0vI/j5RG/cj6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699906; c=relaxed/simple;
	bh=04Yp3IzGSrrJIWfUtJjG76bXIauH8JMYVfcV4c2A2r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGQtMcF/3qGSklCJqEIMrjYxBMs3fQfsyWwMIQPRZA2P0pymML3VHqVLT+NpldUsO9OxpNu31yM6k4moWxby15d49PyfQFgpaEzDncZ39XBpw3d9xXje0kQvUHf8uyT1WuTdATLORfwJgyr5T2LgxH1hyCIy5ghoNmYX9qPLuMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC3CC4CEF7;
	Sat, 28 Mar 2026 12:11:45 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.1
Date: Sat, 28 Mar 2026 13:11:42 +0100
Message-ID: <cover.1774606726.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit fb22bb9701d48c4b0e81fe204c2f96a37a520568:

  pinctrl: renesas: rza1: Normalize return value of gpio_get() (2026-03-10 10:33:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.1-tag1

for you to fetch changes up to 3f92867ce3ee2a274ebb7e7d5de7f6ee85da21f6:

  pinctrl: renesas: rzg2l: Drop superfluous blank line (2026-03-26 20:05:36 +0100)

Thanks for pulling!

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.1

  - Add pin configuration support for RZ/T2H and RZ/N2H,
  - Fix save/restore of registers for ports with variable pincfg per pin
    on RZ/G3E, RZ/V2H(P), RZ/V2N, and RZ/Five,
  - Drop a superfluous blank line.

----------------------------------------------------------------
Biju Das (1):
      pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} registers

Geert Uytterhoeven (1):
      pinctrl: renesas: rzg2l: Drop superfluous blank line

Lad Prabhakar (2):
      dt-bindings: pinctrl: renesas,r9a09g077: Document pin configuration properties
      pinctrl: renesas: rzt2h: Add pin configuration support

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         |  17 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |   8 +-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            | 258 +++++++++++++++++++++
 3 files changed, 282 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
