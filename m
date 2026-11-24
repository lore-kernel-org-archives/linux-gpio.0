Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541361;
	b=WjLCghvt7W1JRkUiiz/uG+NLvppaxEHQSw5V7013ex9LmYKE03M3HMPbaO3iMnFH4Cg7
	 A8cAArF5lD274EiIk9AOKBCrFolUBaaxDefxeM6PWbSBRWyEnIjtEA3j7wYLIu5OTZLMH
	 ytobPAloqTAbuRiX/LNsHskr0g6OyN62vato5ghayL2oIE6HHrTO03ucjxneaId1vd52x
	 bqOwtt6OG3ZEGDmBpyfwytsab5ekL/l9ki3bCA42GbjrLk44Y3nc7nFzUJ38zq9GKfWxs
	 m+6kzy9oZ7JTkXzShtXBOQNO9GKo7PDwABi2mUKpJizRC2iNRkYyhQPu+Y77zSQMN6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541361;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sluaE+zjyo+Ofk+lfLqfvLWgLU/EpzFxI184omUErDs=;
	b=00+SUKDnmdvuA+H11GmqoEXrIiwdeeTWl0MVaPZzAKx2yBWFfd2POKlHPLPij7uFMdvA
	 q+XZKsDA3qxCoTFDiCc6ROdvSrzb9pfazFRn8HhGdGMaE564C2XGEYTY/H15OpgiRBzNv
	 0lbGSD06G29ICixctd/lSVua/+6O2KTqGaD1Z/xebQuwcxyvvlqMHrtNpSmy1M3UDGX6T
	 oKFN+Ub+cx+vab715lUAY96UBeWqrRexv52mKIs5E2+gAc32g+a6T5M9LzMNMh9f80DOW
	 US+V7x/NoEzz9nB2DiZTu6eYUSpuhhDB6emBj6SUKnLqRwO4glYlcvY0FVMJFLd0Arw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhmRJ12y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2198606A31E;
	Tue, 24 Nov 2026 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhmRJ12y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517D91F000C6;
	Tue, 24 Nov 2026 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541361;
	bh=sluaE+zjyo+Ofk+lfLqfvLWgLU/EpzFxI184omUErDs=;
	h=From:To:Cc:Subject:Date;
	b=NhmRJ12yD4CmnLynW2JmtK3arGuYNIiI3+khwmK9mWK+HmdB6Djj9cpVuYyP7vKHq
	 8kzllFaP4d0pWp251fNKTAadiCyDkdBjpsqRdV3qkmJ/GFziy+yH3XdwvrhejcCpQm
	 5gexl5BrrwoCdb30nwVn4i3Z1+LwoCbgoUT19x4j2IgW/fZWLf86tjYfJ6+Azeqx0o
	 zRM2VxokU4aJrVTg4fekhJsU+IKQ/3RgLxFD2N1VFE9Z+InWltZI8RMYnuRVCI+cT7
	 85RhXpaueJUNYMSZJwVBZCCzIw1A/44flBQqQucMMVJ/vKWxLGNlSmR17JyG8l9yxI
	 DKfVttW2huA2Q==
From: Geert Uytterhoeven <geert@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.5
Date: Tue, 24 Nov 2026 18:29:17 +0100
Message-ID: <cover.1795540869.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.5-tag1

for you to fetch changes up to b2a4ca3e3d4af9a3a1e02acdc934b3702ff8ffde:

  pinctrl: renesas: rza1: Put fwnode after parsing gpio-ranges (2026-11-16 09:39:17 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.5

  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Jiale Yao (1):
      pinctrl: renesas: rzn1: Free maps on DT map failure

Xiangwu Lai (1):
      pinctrl: renesas: rza1: Put fwnode after parsing gpio-ranges

 drivers/pinctrl/renesas/pinctrl-rza1.c | 1 +
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
