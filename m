Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41A3F3292;
	Fri,  4 Sep 2026 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526477; cv=none; b=n2KGqO5HwxbhRPrt41Tb7z3LpWWKZ68kbTekja/GaE1pTdHC3yw3J8mSmMCczoJt4A7oVkebP8a/rxIGO65A9anH4LUGeCXi588iZDcsEJZ9rQxGFeg2PYnPCUYBSzGIvMqmRmAfcGldfD9yo05I57reNzLwwPYdXTVE+OZkolg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526477; c=relaxed/simple;
	bh=amU/XQJZN+D0Ox4AkV9JsD4AfkO4H+n6T5+xkDtXfAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BrVr1nADhyQLls+jVpeXaEqiWh14pwHV1pDwTms3sw8TkSgm7cDDgYgpazU/uIgqFgpKkn7+rjkFVF9Ia6lpHrK89KMqJ12ZQy5EKoyHJV5RU6q8Oj/1bmPt5c/QoF1TKfsVzxYjkeQkOaRRNsFigfUs9h6aViJZg5GMPmEDswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A35F1F00A3D;
	Fri,  4 Sep 2026 12:54:32 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v7 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Fri,  4 Sep 2026 15:54:20 +0300
Message-ID: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev>
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

Thank you,
Claudiu

Changes in v7:
- dropped invalid voltage domains (2.5V) for SDHI and QSPI
- collected tags

Changes in v6:
- collected tags
- dropped the wildcard approach for the available power sources array
  and described each individual voltage domain to avoid invalid
  configuration

Changes in v5:
- collected tags
- addressed the improvements review comments
- added patch "pinctrl: renesas: rzg2l: Unify the power source handling";
  as a result, patch "  pinctrl: renesas: rzg2l: Add RZ/G3S support for
  selecting the I3C power source" was changed
- dropped device tree patch since it was already applied

Changes in v4:
- dropped patch 1 from v3 as it was already applied

Changes in v3:
- collected tags
- added a fixes patch (patch 1/6)
- dropped already applied patches

Changes in v2:
- collected tags
- dropped patches for configuring I3C standby

Claudiu Beznea (5):
  pinctrl: renesas: rzg2l: Generalize the power source code
  pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
  pinctrl: renesas: rzg2l: Unify the power source handling
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 342 ++++++++++++------
 2 files changed, 236 insertions(+), 108 deletions(-)

-- 
2.43.0

