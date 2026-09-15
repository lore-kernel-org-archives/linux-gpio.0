Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F4239B970;
	Tue, 15 Sep 2026 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464076; cv=none; b=cA+RRiEBfxVEI0b9ZhbKhkjC5zUTPyxMtq8Zn29Mi8LroTgbH4PHxPEY4Z1DOq0TdYnoTudhdCjj280f7tTMNFB3uGNhdz6b/q4U+5jvJOaz+Kdbi+oAaoMgSyIwRURp4Vuw5BTijkyjyG3NelJORO/isemsHYLkO15zVx34Bqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464076; c=relaxed/simple;
	bh=nsN6n3CMvjdLjDlBNJm9wffviwkjmTgZgA7vg2wbqnM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VjMVBb3uBg64R+5Jz8TbAheRTTK6Cg6k+OpLrF0yPxOC74kjlQbhsHFNegrH4fr58sT9PqvwdCqZqFeyBsR0ZDxdiWRL1IyEKb9J+/e9y3jS3N42aD6eX78RGMSGpzCssgWRK6Wd8cMkHt9Lvp/HDyT2sE399jSHhOJZZVfmilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id CB00513F89C;
	Tue, 15 Sep 2026 11:21:01 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 0/2] Support ON Semi CAT9532
Date: Tue, 15 Sep 2026 11:20:44 +0200
Message-Id: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this small series add support for the CAT9532 LED dimmer from On
Semiconductor. Altought marketed as an LED dimmer it is a bit limited
in this regard as it only has 2 PWM for 16 pins. As explained in the
datasheet it can also be used as an open-drain GPIO controller, and
that's how it is used on the hardware I have at hand. This chip
doesn't really map to what the gpio-regmap driver expect so it is
implemented as it own driver. This approch also allow to later add
support for the LED dimmer if desired.

Alban Bedel (2):
  dt-bindings: gpio: Add CAT9532 GPIO
  gpio: Support ON Semi CAT9532

 .../bindings/gpio/onnn,cat9532.yaml           |  52 ++++++
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-cat9532.c                   | 173 ++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml
 create mode 100644 drivers/gpio/gpio-cat9532.c

-- 
2.39.5

