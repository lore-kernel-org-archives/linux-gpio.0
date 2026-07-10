Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4C63F7892;
	Fri, 10 Jul 2026 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683425; cv=none; b=jJA9ND1F+U3BwcjcYJjl29aHUXucekJXMjztExWAuRCXpoGT0LZkjupar4UmhIQ9u/8vnpQ+sih8m4p62QOItH5PoPNqQ4L3IWp4V3+PZSP5CdjRuWPrjVlSbtLyDaeONiDbxV2LGhVSuJnSFC17Nwj9S9t85VDSb4wvZ1e9luY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683425; c=relaxed/simple;
	bh=eGxCYoI+XcfE3OCH6uZe9UJmHRIwXQu1FxldtqcBP/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5exlT8Efs8f4uVq5/VGGnvH4GF8WOhl2ICN+ZzfSgxpOlgOerHMEk8KIiphm87NUfPqZ2vroQpNMwEMUlGuKhfYUAqiQeiJtL9d+NHtSCHa/S+Lx7DFMfbS0P6oPnLDv4e3Gv393+pYnxWgfZP85ZZLYeodR6ZVkN51TFXlSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3246B1F00A3D;
	Fri, 10 Jul 2026 11:36:41 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Fri, 10 Jul 2026 14:36:32 +0300
Message-ID: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
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
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source
  arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  18 ++
 .../boot/dts/renesas/rzg3s-smarc-switches.h   |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 254 +++++++++++++-----
 4 files changed, 204 insertions(+), 74 deletions(-)

-- 
2.43.0

