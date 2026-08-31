Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6A331ECE;
	Mon, 31 Aug 2026 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173489; cv=none; b=bBjZWjgLfYXqYoFAQgdNNiLv495feKRGMxx/qRCTxT2m2Gpdnd5A8Si2GJPY+UKE8vgsVMext8g05hmyDopSB7XZTBGcithjVM2PpzNbzbv5zfRSGJsJZcgK2y9BEeVwreqvpFagGO1+T81MiJvAwa+4CiGBY8V/hHtqRNL9BnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173489; c=relaxed/simple;
	bh=WTBV3lZfesFr+/+MoaLF8nrDRClqyunhdsFM1S4oVl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRt9F69qzzAFe0ilW2nf0+0I+yxo6nBe6lV303yo6vFknh7MBO83OIMp3zDG3kVrrZWJiffKOU7t7IkolA/myj1YU0Mdt7dASfzW1J6GZCC1cRWx6XOYIekrshAygj3mWOMRK00/CC+HejKOcVk89CirZJsUywEsY1Fash4gmT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw/66AtA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw/66AtA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F2B1F000E9;
	Mon, 31 Aug 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173487;
	bh=P2wodg4yqW9L09DaFdI07T+E+TZQoKw1npPSdl0WwuE=;
	h=From:To:Cc:Subject:Date;
	b=iw/66AtAm7DJXf94+6xosmvmRsk+2solF2kRwFWfk1/qjNnIItRhbJgMqYQAdyvCl
	 iT0mhiEhfY/99h/43HIESd5Cems9sxaR5crX5x5dl3Kujv/1mYusiSDh9wlHmB/lm9
	 9r0hU9YMwLGAaKPFpFkeS1ZLybkWqPnTLCJB021/3AizlxCGwVx+JRgKvF3+XDYhns
	 d8LI/yoPURNpa+w37fuZOb4CW4E329qvyDPAsdbBzC9igwsRKE6U+CyggiAD2K7vit
	 qZutlT+4aDzNJ/zq0Pnpbe14k79WGeM39VmCzxAs/AUVlA/RwPcKJHLP9ykk8Kv6wQ
	 se6d1unRe+lPQ==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v1 0/3] pinctrl: mpfs-mssio: three fixes
Date: Mon, 31 Aug 2026 11:50:56 +0100
Message-ID: <20260831105056.756259-5-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=conor.dooley@microchip.com; h=from:subject; bh=dAFqel1fVFzTMCYz0l0IMh6g2tT025oTNwx7nOHDtAk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlTYyaEVjwKiF3OGFXNrD81Mer163W7C06rv9W9MME9+ cOeGxIXOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR8EKGf1oX33y6Yl7lt+xk VuOTGhvr6z33n/xpnfdEfesXpvcpC1Yy/I++zqlu1hBXU5ec6GE0X21az+eG6ju9Ny6es+btsVd cxQUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Three fixes for issues I encountered, one of which is clearly world
ending if not resolved while the other two should go to stable because
they'll cause the wrong bank voltage setting to be applied or reported
in debugfs.

I discovered these myself while working on a new board that needed novel
pinctrl configuration. I think that few customers have probably been
impacted by incorrect bank voltage setting because it requires trying to
set a bank voltage that differs from what the FPGA configuration set, and
not only are the configurations currently in upstream and Microchip's
vendor devicetrees a match for the FPGA settings, I think customers are
using the FPGA configuration tool instead of pinctrl to configure IO
since that's how it has had to be done for the last several years.
pic64gx is where I spotted it since the config tool can't be used there,
so the impact is limited to users of that SoC that want to have non-default
bank voltages.

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linusw@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com

Conor Dooley (3):
  pinctrl: mpfs-mssio: fix whitespace in debugfs output
  pinctrl: mpfs-mssio: fix width of unused bank voltage setting
  pinctrl: mpfs-mssio: use correct regmap function to set bank voltage

 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.53.0

