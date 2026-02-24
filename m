Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7439E17E;
	Tue, 24 Feb 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940397; cv=none; b=MrxntnQq6Vc92vjpff7w2jwulMc6LG8IXfv9rdtQRvIWtQQRm2pJ8hcNq2k0ZiimAqb6ljDdzLVuUrxFgN3shSjgZIhvqVGAUuuObreFGQrxD/rGThU1BkYJEKgkQThh98YZ4yaiZxPhnd76IL1kQ7W1uFqCTsIqBi9jafI8834=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940397; c=relaxed/simple;
	bh=LpFHGyQag5O2QTjUwJn/bYo4uWp6ZlRKHBwOpWPMXis=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ol8TnW2XU4iji95J7P2HkkGatS47m8m2Ze36KvbHQb3ufAiBOd2azBZHfKPANiXiBl8ahKGP/a062S+nfWetghn0dJ5ooIadZZxPhoFgfETZs0oyz/61PNSWzwMN5YKzdUzESY7biZoikIvygWPXe/jhGCTne702skR3YpVeRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lvx3PzsL; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lvx3PzsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771940396; x=1803476396;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LpFHGyQag5O2QTjUwJn/bYo4uWp6ZlRKHBwOpWPMXis=;
  b=lvx3PzsLsIu9L1v3bDtcTl2KL1eUmRsExlWqv0W6nUwGrpy/FQaH0f25
   1+Qsfp6fmTSWQOkWHi8Zx//AetgPA4aJ1AUaXKGDVEXTLPRxnY4H33XDt
   nqgJQmbQUXatl4Ot6XJj94KzvjB/p/ntvspOkaH8BDYhQXir/EZkOzWN3
   HIog+03oTzD9BsrHxk6DIbdPuEodD3zkmbXAd2gPUNrW2mle3/UVzl53U
   Ynb+3/OIcICDRw+HEGnlBQfQ4tCa86K3sNFCg3jk/0OErqLs7Ci2MVtuM
   bDwOPonpJE600PztjhzVFa6g3xIjIfAatItARfWETf1W4AfStCSvnjAlm
   w==;
X-CSE-ConnectionGUID: 1FlpOl2WSoSIXpPLSoXJig==
X-CSE-MsgGUID: mhKNk+TlTwWcpTSUgmy+wg==
X-IronPort-AV: E=Sophos;i="6.21,308,1763449200"; 
   d="scan'208";a="53771063"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 06:39:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Feb 2026 06:39:35 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Feb 2026 06:39:33 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linusw@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 0/2] pinctrl property checks
Date: Tue, 24 Feb 2026 13:39:03 +0000
Message-ID: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=LpFHGyQag5O2QTjUwJn/bYo4uWp6ZlRKHBwOpWPMXis=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDJlzV/7Y+Kutjc33qgDD2WX68yx0VhTKbLg1nS/lidOxcFPN wOn3O0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARJ1mGvzIFgTvXal8NFItIkTtXJx vi/klmtkZYdXSiEs+ZQA/WCYwMHw+Zz199rqz22CXm7KlhTjcerC75MeElQ8O9qk1ebAfKeQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hey Linus,

Here's a !rfc version of these property checks. Nothing has changed here
outside of a rebase on v7.0-rc1.

Resending because I managed to lose the CC list on all but the cover.

Cheers,
Conor.

CC: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  pinctrl: pinconf-generic: perform basic checks on pincfg properties
  dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting
    properties

 .../bindings/pinctrl/pincfg-node.yaml         | 105 ++++++++++++++++--
 drivers/pinctrl/pinconf-generic.c             |  41 ++++++-
 2 files changed, 138 insertions(+), 8 deletions(-)

-- 
2.51.0

