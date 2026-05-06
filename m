Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D628F3F2100;
	Wed,  6 May 2026 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061490; cv=none; b=bIN0ZoJLgeFedKsJqWOTxHBgRrT5AIpk5v6+sctH+GRktlMF9byZQg6kcC0OBoUphZroKOobsl0EDGXd2LZW/olGPpSk7y3Tuzz+fmcwu21PXDMOsZXkpBSdqzES0GxZxXUgf6orz4P2KZt8xUQlpzcUSzygy1+Bq7EaMhVHAz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061490; c=relaxed/simple;
	bh=QSMJQ+qo2d/9QKlnpqj/XC1VAZOrvcslyFb4rShhWfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4CEbyYFMGRBhvrnBWFwLJ9arp8Km8cC2KDbaryv+BMlDN85D3JtvrAT4t1vTX4QNqqXLudKWWNRbJl7DXn+0j22cKprXi4gdcs9OBPAubynbIm2l6O+Dqx6NuzgCtVQ2jKKudZAjYWz5OQiuCMMXtUPEzxduDXKhPUnvpmFUYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8+4eyhu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8+4eyhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E674C2BCB8;
	Wed,  6 May 2026 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061488;
	bh=QSMJQ+qo2d/9QKlnpqj/XC1VAZOrvcslyFb4rShhWfo=;
	h=From:To:Cc:Subject:Date:From;
	b=C8+4eyhuvovWq6mc3xqieYOq9rP+hCzGwn0H8Mgh8B99uy5MH/ax2hBokSkgCW+o8
	 eZxZhQD+cT9cai+VpeUww1hPBCUpEZVkRuYSydROOzI4Vx/xV8AgFbIJkccIhgn0rA
	 xvL/tze8Kyir8FhZkIL/f6fNrXTCV5NFPys661tKV4/DgfL2tUU5r4LFQI9NKO+LKI
	 7wzDFYi+zpnGN6HbZY9hleThnNyzfIiYtWZOOzJt0HCxyI3Gm87asYiyxoP2Tmgi/w
	 EWWO6n8bPPgHHedIOY1I51zTeEcVIjacf1e3lTTM2Pmib/meTXzaavoIXuWrfMx3BV
	 /n0WSNKVDuHfQ==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
Date: Wed,  6 May 2026 10:57:38 +0100
Message-ID: <20260506-energize-dramatize-051909e54256@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2283; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vL3K36qzSz+jxyjtup88by9kUgRXxlFkjxJK/EVWVx4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSa1vbz+/sXPt4+nML0KOv1ojrcO6+r3P90V5QT0t 6yYUGSf31HKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJFIkzMvROTS2ZUvNc5UWB tbVo2LmGHn1pBv59Cu/togLu1llMP83IMLn4/NKwN1POf7dcvL3xMEO1W1EBp9dX6SIzP7VuduF FnAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

Whipped this up last week, at to a first glance it appears to work,
although the spacemit platform I've used to implement this has very
limited in-tree use of pinctrl so it is hard to be sure.

What I don't love though is how similar the functions
pinctrl_generic_pins_function_dt_node_to_map() and
pinctrl_generic_pinmux_dt_node_to_map() are - essentially identical
other than which function they in turn call.

Basically, I wanna know if you think that that is acceptable, or if
you'd rather see something that's totally generic between the two
and figures out which foo_dt_subnode_to_map() function to call*,
or convert pinctrl_generic_pins_function_dt_node_to_map() and
pinctrl_generic_pinmux_dt_node_to_map() to wrappers that pass a function
pointer of the appropriate foo_dt_subnode_to_map() to a shared node
parsing function, or some third option that I have not considered.

If you try to apply this, it's on top of Frank's mux series. It's also
here if any of the spacemit-ters want to look at what I did to their
driver:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=spacemit-pinctrl

None of the patches have real commit messages due to this being RFC :)

Cheers,
Conor.

* pinmux/pins + functions/groups + functions I think are the only
  really valid combinations here, so it wouldn't be too difficult to
  arrange that logic.

CC: Linus Walleij <linusw@kernel.org>
CC: Yixun Lan <dlan@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Troy Mitchell <troy.mitchell@linux.spacemit.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev

Conor Dooley (4):
  pinctrl: generic: change signature of pinctrl_generic_to_map() to pass
    void data
  pinctrl: add new generic groups/function creation function for pinmux
  pinctrl: spacemit: delete check_power()
  pinctrl: spacemit: move over to generic pinmux dt_node_to_map
    implementation

 drivers/pinctrl/pinconf.h             |  20 +++-
 drivers/pinctrl/pinctrl-generic.c     | 139 +++++++++++++++++++++++++-
 drivers/pinctrl/spacemit/pinctrl-k1.c |  70 +++----------
 3 files changed, 164 insertions(+), 65 deletions(-)

-- 
2.53.0

