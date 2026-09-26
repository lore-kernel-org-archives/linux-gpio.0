Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DEE40F73B;
	Sat, 26 Sep 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434337; cv=none; b=Rws4/blE2VquMpd+PPIg5nAllyG6KX7qs4/mPq5mwxdckAoxDMgdVzRhurNshjwrrUDgy4I9Se2oNFtQPmH7YTUvNiMsHvigcNO8RogLFcZmDQldq8xd8VPc9b36LWfp03aFy3kYtvXkLyBcZ3ZaAE51vd9GKTcI6aiDDoqrlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434337; c=relaxed/simple;
	bh=5abk7LyybJMxfmauaAYXDtYtWyg+bJ6GD6yviS5jHzI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ROXlLlFTiRoGCdjjnuD14M9zTr6EFMAbF6l4Olad3F3eR40xifE6uooM+y0e1h5AYMbKnNZBFpwa+lMYDqNwVDbEVirl8sipVPnHHMUoLmmcJ8nITvb9nPmcLETQCXU6gqAJP2mVK5hu6xbqBacge76NSE1jzl1/J8nFvVkmvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=LWxRlisf; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="LWxRlisf"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790434325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A9v+lq5mWAV72Yfuty4BldqMgAV25TnkmTFu7i2y98Q=;
	b=LWxRlisfozjEhIessbuyZAk7IaeAMUg+HKCT5qMWQvG1zpBKMqtED9r5oByf6asRZD8SE+
	gbfL1ThShjc3nKZ9Hax3VbKgf1d0prqblzjcFU6L/zhuC1aKBo0G9TGKavkXh5Y6Ps4FFT
	LSxt4WXpb+plKo2MG/8iz+kitjTUKhU=
Subject: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
Date: Sat, 26 Sep 2026 16:51:44 +0200
Message-Id: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwQqDMBBEf0X23JRsULE99T/EQ4ybukU0JGmoi
 P/eaO89Pph5MxsE8kwB7sUGnhIHXuYM6lKAGfX8JMFDZlBS1fKmKqGdm0g4nk30k4gNllJIUkr
 bEmvbGMhN58ny57S23Y/Du3+RiYfqSIwc4uLXczbhkfu/kFBIgVhhP2irrLUPs/bk88UlXAdK0
 O37/gVqM55VzQAAAA==
X-Change-ID: 20260925-apple-pinctrl-t8140-0e22af416f8c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

This patch series has fixes for probing the pinctrl_ap GPIO controller
on the MacBook Neo. The previous code would crash in the regmap_init on
this device, since reading the REG_GPIOx for certain pins causes an
SError.
To mitigate this, we adapt the gpio-reserved-ranges property to describe
pins which are unusable and whose REG_GPIOx should not be accessed.

Also add the new t8140 base compatible to the dt-bindings, signifying
the different behavior of the t8140 pinctrl_ap device, and make the
driver accept it since it now respects the gpio-reserved-ranges property.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260925-apple-pinctrl-t8140-v1-0-1151bdaf2fff@cyberchaos.dev

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Linus Walleij <linusw@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Yureka Lilian (2):
      dt-bindings: pinctrl: apple,pinctrl: Add t8140 compatible
      pinctrl: apple: Add t8140-pinctrl support

 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml  | 12 ++++++++++++
 drivers/pinctrl/pinctrl-apple-gpio.c                | 21 ++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)
---
base-commit: 63fcbd85bbb795805ce1014637de186c647fa59d
change-id: 20260925-apple-pinctrl-t8140-0e22af416f8c

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

