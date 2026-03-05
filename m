Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232E825A2C9;
	Thu,  5 Mar 2026 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727097; cv=none; b=d2Rm87UVOyUEyuLSeyMgLHe6EFpONN5dF4/qk7Dj7a0DmYalrpfgrR2zrqLDSRuhqmNkaYPM1RiyL4OLlSN48aXIc2xwei2qd2+KXhr6KlVdZdJ9yrZ28gG61r6n6EHfr50R5TJDxfsscIFYdumR+rmKAF6T/C7VdxrAv/1oWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727097; c=relaxed/simple;
	bh=LqiYoF5xPYo1DrgBTEGPVpdtUHHSzA+R0l1jRRXz5ko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lb4peatqpeFpuwWK3QUi6X409emi+Cl/XF19Tjqztf2yqsfTpIHuH0A0D+9ppeBj0mO8r8UTBCimCushpeiwfNgyWtH5Rk7yake0mta+0ZDK+z1R48gBs4948MxgRHiUyqA+yeoYjwYSU7xbqbjzZT/E5NHhopRYn4saVjcus5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=F0pxdO6k; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="F0pxdO6k"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6B05826EC9;
	Thu,  5 Mar 2026 17:11:33 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BH12ADYICrmt; Thu,  5 Mar 2026 17:11:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1772727092; bh=LqiYoF5xPYo1DrgBTEGPVpdtUHHSzA+R0l1jRRXz5ko=;
	h=From:To:Cc:Subject:Date;
	b=F0pxdO6kCq4Xnrztlan6KZyozsJAsbJA0LBWgMUQEx+rss90nrS6pcQ1mMgRwFjiX
	 16o3fGHQ5vbCjEJQzmayeIIfu4AhJkDTrpz9qUDZ1b6OTQtLtVdFT1Moh1xsr4ewtN
	 keo2lyvtGX4AROwNDGmXsop2RJ75yif/KuvX3un1YR4qxO8eAywlVcTtgclR+Y/99w
	 yApohFgnV19MlWHn8L/AmaPFVeyTUO7y4hDJm5073oEXjOflwVXqyvjeEOyooGrZOK
	 PXIMn2evlgqUSOrxu/hoXEPgq633OJDwt7A281mzQzr4+R74RiyCOR2UVsko45kBcb
	 wpIed7WhDo+tA==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH 0/2] support for RTL9607C GPIO Controller
Date: Thu,  5 Mar 2026 21:11:04 +0500
Message-ID: <20260305161106.15999-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the GPIO controller found in
RTL9607C SoC family of MIPS CPUs.

The GPIO controller on this SoC has a reversed port order, the same as in
RTL930x but without CPU affinity settings.

Rustam Adilov (2):
  dt-bindings: gpio: realtek-otto: add rtl9607 compatible
  gpio: realtek-otto: add rtl9607 support

 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml | 1 +
 drivers/gpio/gpio-realtek-otto.c                              | 4 ++++
 2 files changed, 5 insertions(+)

-- 
2.53.0

