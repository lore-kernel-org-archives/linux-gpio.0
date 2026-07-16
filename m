Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C613B27F3;
	Thu, 16 Jul 2026 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196264; cv=none; b=G4n01DlV3DqueTyBDZwjEdchU7JgUjt7RO7zKvqyPw0hjJLdTlQLTsJFWnNOL7w+2+Pbxz0qYdf+884Pimpykp9Urw+fry5RxEK6XsucFCeGNQzRQqUtuVJ6jtT+jysjv3lOzjYoMzWkr8zHrqTRuJYDZ7gHhKKxvY0PiGZG58s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196264; c=relaxed/simple;
	bh=hw/xArj1qdBIsAZQa9xHD1Rpp4hGIV6uLDvgSBN5sfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6DTSRjNpf/s6tqA4Ebc4BfrDqoTsN3JJZeDipJkKedZMk7Z8f+xRup6N89yDU1eopComXlPt5V8s70A7+5v9an97C7hzQgbteJMuR+hA1Hcvmh+CTefCGrpy+OiXAT1rjKXIknuBNVJfzxGaXu4k3CxHkBe7oRUfm4MMysJRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA501F00A3A;
	Thu, 16 Jul 2026 10:04:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.3
Date: Thu, 16 Jul 2026 12:04:19 +0200
Message-ID: <cover.1784195346.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.3-tag1

for you to fetch changes up to 5a653cedec948423fc8a0180c90b8d05c2239d9d:

  pinctrl: renesas: rza2: Embed pins in the priv struct (2026-06-30 12:03:56 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.3

  - Embed pins in the priv struct on RZ/A2.

Thanks for pulling!

----------------------------------------------------------------
Rosen Penev (1):
      pinctrl: renesas: rza2: Embed pins in the priv struct

 drivers/pinctrl/renesas/pinctrl-rza2.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
