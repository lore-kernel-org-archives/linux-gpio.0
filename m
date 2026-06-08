Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419AF2C11F9;
	Mon,  8 Jun 2026 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909299; cv=none; b=rLnKQ7VDfLQg47UIlcBFcl2lOFiGsQMm5kbfCulfgA0YCSNetcIc+X3YcTv/QoIUNrORyHPEMRNLJcfe1keovpMiodgVbSc9VLod4wLZVzt3sgnK8Yf9Tq1ju9YLESY0uZ1bfHj9g5/V8dOqnIvMJMuBbeWcq5Bm7YgbD310Iok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909299; c=relaxed/simple;
	bh=45opUBklqFinzsdfEAoutBxgb+Sn9HZsSJHlC9WaMfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQnXA3C5CfhRPZfBIODWVgSr0/qXUlqwmXCvxDDjMc6lOEN6o1PYkqM8Sm1/t4Dxs4xvSrhgJPzi8Q7P7axtPHJhosBgq1BJS2QTyiStQjIAYfMA6Pcbg4fPNg9bpbqTX3SpRGe9edIoDmafcO2+yQ1MmDLGJqePYzl3IL/vHYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189851F00893;
	Mon,  8 Jun 2026 09:01:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.2 (take three)
Date: Mon,  8 Jun 2026 11:01:31 +0200
Message-ID: <cover.1780909189.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 80538a53978bb9788080caea6e5ee3393dfb6a72:

  pinctrl: renesas: rzg2l: Use tab instead of spaces (2026-05-28 15:07:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.2-tag3

for you to fetch changes up to 14270179806b876fecefcbf35905e512b56a5867:

  pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update (2026-06-05 11:44:54 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.2 (take three)

  - Fix locking on RZ/G3L.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
