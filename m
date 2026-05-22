Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527CC3E4C75;
	Fri, 22 May 2026 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445384; cv=none; b=Qh/dZIVBTavtgaGS2EGKUyHB1TYcqFFassZjP8f8r3nBm5JIzFFhL4G+pLm4Fol51YGqKOlrEy5P4q48+nogNqITFniuifVL0MAWlYRO1bmeAYBIxKn0u4Gph86CZtBSclK4Bpe7imBxCLZkS/4IlNW9x7dnZQX6qybjtxz9tgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445384; c=relaxed/simple;
	bh=hQ4nHwUjHM85RPcNSRRGmDVhm3/wG0Lbj6f/ago/mNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tgXrF569lLDTa4SzPRmxLFp/TViCUtzJmzF0r1ugg+3I7Yc5hYTiKO43Z9kbqA/7tJkF/jeRljCtLEkHNyY9KCPpziy3xLzLLyplxMBd1f5+afQ+K5n7/b7wOtbMt3LbOYH+Iz0/YMyA/IbpFy9256WZGr681eK+vO8ea+5yTS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+QaA/NM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+QaA/NM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7871F000E9;
	Fri, 22 May 2026 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445380;
	bh=TdZatwqYlu5itvkQAc0Doke20CODQFz7FSicHvnYBBg=;
	h=From:To:Cc:Subject:Date;
	b=C+QaA/NMLeSS+Xg2un+An5g3h0IhL93/cgo0cU56hZC89Dk9IGKEvI3d/vFHIYwhQ
	 VOjSOmbbC6yBmq1zduHiql0VXi11bSYkqhecGANs+fC6/1UTYep+nDLi3ry00wkMIm
	 O5uZIJ7A9zJR/wJ9wv2LkEMRtq4LxkHCBtdeDeIrV5Z+ONV/PvH2UiAc6sRAB/Eyfs
	 /EvySWsJckIlZDlx60I1Lg+3Ymt3h+3GBI/+1AskYgNsYC5CayX8MXbJJDDJmZkoob
	 aT2BhrP6r9fUKrApjPjZ+rh73bG9ACdWpGeQaMYJj1+o63woX+AtpQ2Q1ldAoU0Apk
	 tzwyqb9QA2LbQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	wsa+renesas@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/9] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Fri, 22 May 2026 13:22:42 +0300
Message-ID: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
clean I3C support, cleanup patches for the pinctrl driver were also
included.

Series is based on next-20260521 + series at [1].

Thank you,
Claudiu

[1] https://lore.kernel.org/all20260515124008.2947838-1-claudiu.beznea@kernel.org

Claudiu Beznea (9):
  pinctrl: renesas: rzg2l: Generalize the power source code
  pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
  pinctrl: renesas: rzg2l: Keep member documentation aligned
  pinctrl: renesas: rzg2l: Use tab instead of spaces
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the I3C standby
    property
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    standby state
  arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   9 +-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  30 ++
 .../boot/dts/renesas/rzg3s-smarc-switches.h   |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 305 +++++++++++++-----
 4 files changed, 271 insertions(+), 77 deletions(-)

-- 
2.43.0

