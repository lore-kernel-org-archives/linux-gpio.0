Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940189;
	b=ApneJTzGUyIzC9R/H4HQGgI80FQTl1S7QXjH1oBlJoYFVUqGLwYx21CCiYaDr9RXYGlE
	 PIQ9bOPQ64wDuv3xwA78O6VSBs5opiilP2fD2tC1r2H9PcAx4yPQfhstK1TI5wd0frFhG
	 9Fsy1Io9lOUTGN8/SS7c3qu1Y8tujkTWEC28VmUzk0vNrUvDfrDa/nr6qkuEy5odcKnXA
	 mjjCQdLxIhjHr8RBLa9drZDK+UqQQMmtll1KfNIhAc7YnvabNKr+96YpbvqtBAfD28Gpr
	 09Q2tDM1ujgGv5U9mkUoa+GdzqXbqZAHauPAR8kwBXVHWHhECshSv66RFhlPrZGWItw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940189;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=DGF9mgsLDsSd7of9d9dsME3GdKnQV7Bs9cf+ZPFVMgc=;
	b=h7CMZhspM9HURWXPSMvynYUaKjwp48ml6jsQr6C15LAucJOpXaW3m/cDUgbJEkwL8DaL
	 TvjDA5ElKyCsJsS2Aeh37N5qfmgfWRUagvjty3H+YWAdHXihSO/Pl3WE1W9LVzm75X5ov
	 xfN8/NWTqyw3M9exq1Hs+7TRxngw+QJ5vCT7thVDml+uWaxqAbz7qa0C/MMIl8KkYiY6D
	 MoF32tBPjQz4Yqoa0ST7RTeoZwD6UYVa4QHi6oPsCuAF/Lixl4R/0DA83D55rLHSLbZZl
	 vpUEtxkyL6RezW+UV9CEnlVqmFy9eErsKDbx6Rv257HYao0sqY99SDLivdKCnOir34Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SbG5CApc;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pB4apsIX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.53
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B7A606A336;
	Tue, 17 Nov 2026 18:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B7A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SbG5CApc;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pB4apsIX
ARC-Seal: i=1; a=rsa-sha256; t=1794940173; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=J+fSDoqJm+Wn3TgFlKFfoOwjpKDicEH0tfODNAXTogRFF9kbH0DqUhnk4ayYFqmiO4
    zgWW3e9hGbt//nZn8o+KWt4GrSoV9xY9TA94NpQ4AJK1JpPQTEOQN+i/sfa3RD0wpDOY
    v1sXf1/tJy9KixnyUEO4l5fbubGjS0x9wuB5E+/sLi8o8zV2LQqYtPVPxZbioqtQMPCF
    xWiUyn8GwccXTxFSDW49fBo9Kj02MGbgKBMUXcCCbA13kCyuEDvN6iGKymEbU0IkuUFx
    FwFCPceOSJZ7LJzrGEf916xacpiDLtME9DTWKZJE1BDOFM83FIIW5xE/3ZqfiPsgkoE+
    qf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=DGF9mgsLDsSd7of9d9dsME3GdKnQV7Bs9cf+ZPFVMgc=;
    b=sdyD6WoFS2e9heti153urUy/vvW6XHxLMUfBelieZKFrgBsqzDzf4nJAj4tycQOn+O
    vQNjhgSDo9ZMbd2bx25ELL4h3U7LYiUFpakLBoiVMjHOQoxdeXbGE9AutLLgKvY5U+pG
    hiEyb29subcj7KcAU99j3onWuTdx3q5HvUNF27f2WGbQ5S675oltjIKBKc/4PWPNkiyP
    qKuHXfVCo0Rh8/QZVZqrHzUBOhAnAqvkfOTxo6Lg5c4+JmCZ+DoYi/pyicS/BgRuy25l
    XbcDeoMK4g8WJtKc6nmzsak9FGMlje1JX6mPoA3esKMJUGR8Wq2wLWVea9wdac6SUcvJ
    +oUg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=DGF9mgsLDsSd7of9d9dsME3GdKnQV7Bs9cf+ZPFVMgc=;
    b=SbG5CApcP0G684/mzlk5prJjfR7EwLGkrByGk2zBbRiPBPXiE0gtyBZhGiS8YnyO9a
    xKaP8Ci1t1eYPKDyL5EFI4v7uB4RJiXYunTVdEwJw3aNyAcwdfF1c7n+SH421MvbMh0g
    YS6ZHf2qaJX7xnQ6Wy6pgW7LhIuQTNi91KpbJXgveljju7/eaC2uWQD0geY60e53mkS8
    27h5AedFlPKwzgrplj5AIlbX25eGc2yMOA5kwqZVgRkS9W/3yGVrBsJRFeeNxEHzAZiP
    JCfy8ZBgcJD6XhTr8+lWns8bqpSKQySvI/fgwmktA9JPErNRfGJDm7V/g1lJPLNzs0kW
    a7WA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=DGF9mgsLDsSd7of9d9dsME3GdKnQV7Bs9cf+ZPFVMgc=;
    b=pB4apsIXOTL0SqkGglfevbwWBCGVT+UWvpH1xTUTSvYkDlOc+Yq2zOaGyXEgYwzgzb
    ifZRs5p4SKipOiyltmBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AHITWYbN
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 19:29:32 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 0/7] pinctrl: ingenic: Add X2600 support
Date: Tue, 17 Nov 2026 19:29:21 +0100
Message-ID: <cover.1794940166.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
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
Content-Type: text/plain; charset="us-ascii"

PATCH V2 2026-11-17 19:29:26:
This series adds pinctrl and GPIO support for the Lumissil X2600 SoC.
It extends the devicetree bindings, supports the X2600 GPIO register
layout with 0x1000 bank spacing and per-port shadow registers, and adds
pin groups and mux functions.

The series also fixes hardware dual-edge GPIO interrupt handling on
X1600 and X2000 in a separate patch, following review feedback.
X2600 Port E uses different pull enable/selection semantics and has
an additional Schmitt trigger control bit; these are handled separately.

Hardware testing reported by the author:
  X1600: GPIO button press/release and dual-edge register readback
  X2000: GPIO button press/release and dual-edge register readback
  X2600: GPIO button press/release and dual-edge register readback
  JZ4780 (CI20): regression testing

Changes since v1:
  - Reorder the X1600 and X1830 IDs using Paul Cercueil's change.
  - Isolate hardware dual-edge corrections from X2600 support.
  - Correct GPIO mux function associations and remove empty lcd-none.
  - Adjust UART mux selectors and SLCD pins following review feedback.
  - Extend X2600 pull capability masks to documented GPIO pin ranges.
  - Handle X2600 Port E pull enable/selection and Schmitt controls.
  - Remove redundant X2600 IRQ flag-clear special case.
  - Add JZ4780/CI20 regression test coverage.

Thanks to Paul Cercueil for the SoC ID reordering proposal and review,
and to Hunter Laux for reviewing the pinmux definitions and identifying
several incorrect pin assignments. Thanks also to the Sashiko bot for
additional automated review findings.

This series is based on the pinctrl-ingenic driver after Brian Masney's
subsys_platform_driver_probe() conversion, which has already been accepted upstream.

The author used ChatGPT to assist with source review, patch organization
and commit-message wording. Development and hardware testing was performed
by the author.

PATCH V1 2026-11-13 09:13:47:

This series adds pinctrl and GPIO support for the Lumissil X2600
SoC.

It introduces the devicetree bindings, adapts the register access
and GPIO interrupt handling to the X2600 hardware, and adds the
pin groups and mux functions.

The changes also correct hardware dual-edge GPIO interrupt
configuration on X1600 and X2000.

The updated driver has been tested on X1600, X2000, and X2600
hardware including GPIO dual-edge interrupt handling by a
gpio-button.

The code has been tested by ChatGPT which also helped to formulate
the messages.

H. Nikolaus Schaller (6):
  pinctrl: ingenic: Fix hardware dual-edge interrupts on X1600
  dt-bindings: pinctrl: ingenic: Add X2600 support
  pinctrl: ingenic: Add X2600 register and GPIO IRQ support
  pinctrl: ingenic: Add X2600 pin groups and functions
  pinctrl: ingenic: Handle X2600 Port E Schmitt trigger
  pinctrl: ingenic: Handle X2600 Port E pull configuration

Paul Cercueil (1):
  pinctrl: ingenic: Swap ID_X1600 and ID_X1830

 .../bindings/pinctrl/ingenic,pinctrl.yaml     |  10 +-
 drivers/pinctrl/pinctrl-ingenic.c             | 643 +++++++++++++++++-
 2 files changed, 628 insertions(+), 25 deletions(-)

-- 
2.56.0

