Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606718;
	b=TEKPQAv1haG7iEYtOYawX9VDlhi8F0aEs6xL+nrCZimMJYJGO+3eH35wV1GZlWJSMwHo
	 94J3JvSrFZUrk1By3FZIQkFuBQA45X/xNMlRjxwzdtnaw/nV8VZ+0T5VKTPGdQPivYSo0
	 yDKhqvRB+6fislPchoDtyTjbJnJkjqGckWJvkN2/zRjrGHfSzmVQFeFlb3FVDBxnJXvbk
	 i6PlhD1ldSS96EXpklYYUPRvfsu4rp8aBC1WQYWqmuSfw5VO1AcZfNtrLagAKRbzIHXRU
	 yAp5UgAXBdJkXdENqyTE2j+0T2hFErxC4CJLuCwLzkIj+RaXBrv0L06aQ1HeVja2FXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606718;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=a+FoSJK19GndXtAvkhoYAiWjPx5q6h27H22yvjuinKo=;
	b=Fz5EiZPJLjIjaX01r0EOka+O4R0Di63pnY93Fs68Ustn/OzMrbKHUfR4GbJKW0bbjgkk
	 /sk0KnnI6ztDGHLUR4wHwiIcFzNdF33Eaa2rp/FRDnrv2gj1icQsjAfrESwKY1TefGzgD
	 CPSgcBSGUt1KthydxG2kG8NOv2xrF1wlSG8q+jKvXA/sFS7yTTLBd2gqNff9u6uQd+NW2
	 c3yFQ9T57QamHd7289yi2YVTCtBv0TUt0XOb5K1sYIvkEQQ5hALLmKwCIxPs8gilaVyxm
	 6b3QwhKqz8osHqSf0DP4Q3wtQi+tvdJTO1S2n6pt7pE0Ve91dj6IllC7AtjCbdJW4Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=rUghJ8Iv;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE77606A31E;
	Wed, 25 Nov 2026 11:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=rUghJ8Iv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=a+FoSJK19GndXtAvkhoYAiWjPx5q6h27H22yvjuinKo=; t=1795606718; x=1796816318; 
	b=rUghJ8Iv0WP3kMvmIMofoLuBvxJSffF8soRm4IKPoimloNVhUoQhkclAv/lqvCe+7u6inXjXja1
	HOqunQadGQhzYd6SUs2fwI1nOoUnyBiP0jzjuz2u3GvivB9nkeElV6oAvudm4wd2Zx1pJbgTPNEmF
	iLIgeVHPxpU85w9AcJ6xhBLPsXy/kzhnRwySlDWpk/mS4HPfEj/wYxbQACZSj9oZTmesLjr/qyhX5
	hTocJABcjsExo40CHkrlzF2V+8DyGBvyDD1iQCeoOtP4Wm9j/Zs3EboW5DC83k1oHKRIgdUyaNWsc
	kKZ7Jf/liRqRvuo8xTXAdVHWdd22cV0PpVbA==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/2] drm/bridge: tc358762: fix reset handling
Date: Wed, 25 Nov 2026 12:37:19 +0100
Message-Id: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHIBmsC/22NTQ6CMBQGr0Le2hpafkRX3sOwgParPI2taSvRE
 O4u4NblJJOZiSICI9Ipmyhg5MjeLaB2Gemhc1cINguTylUtpSpF0oUIiEgCdYOj7LWsi4YW/xl
 g+b21Lu2P46u/Qac1sBoDx+TDZ5uNcvX+dUcpctFVRh0syr4yON/xcJ3Bnp311M7z/AVszK1Pt
 wAAAA==
X-Change-ID: 20261124-tc3-reset-e68e91bc1638
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@nabladev.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=T/U8AWB5sWFUy24znwFaGmRRqn6YQ5i1SBCRspg3Uwg=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBsh2xt0uJ0Nbol28KORb220eRtAVNw95ZKHXG
 lTs9SAfjG2JAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawbIdgAKCRCEYUX6QCjc
 8cgmD/9XjTW7cSXqGjxjebT+/XtC176aOB54MXB4lacfSigdFRHzVANP8xRO/+GLlWnkTR94vmp
 FyLDm1AYkXvNhl6UMyMBwBxzYGY8A5C3jwJO0TCgZnooQo09Owoig8euWqSsGJxgvM+yqJRJL0F
 EF7jJq6rxfygBjuUSg3EOAzAEHj+TnPSn+1UpyeP8+vjDSjBeoyig6YEcOlBVaredU7MIKAl7bn
 nTEhA5FhnczNLIojnRetORVAdxR14YNEq3cyAZFYZfmpccxOG/XVoBZ+A7Fo5gXviWdFNL9e3fg
 CwxmUnkr60rpS5rQs4uO3DoiU/cnOXj+TiXyJ9/IPcpn8Xj9koFxygJHIdtQvY8ntzi2cLjhyDI
 hI/NCOBl6LAkM2MMtaWCsGZDsLr64cQ6yP7to79VGLIaLnZvXrk75caUpp1KrgNrC9Sc4f5l25Y
 2QPewneq6RW2a8yIWgOIefjTFzyb/WsNvTUIOhMNYF0QBh8VaI0Ghs7eVctFd5VSl+qB0wkp/Ww
 lrTxDLcAqCgbDk+6/fqM+yqMyJdhyiAcPMFlGGYXLfD6RmwhNCxCLdZr6qApPYUrHi9fDfycwOH
 n67/Nv/yvIN1dR2kXAahbQLRGQsUzTbP68W0ac96w8WRQbdfiQuSFb4wrYor+iwgw27r3t7NTwa
 7s3zRCKSJ8egXlQ==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

The bridge driver desserts reset after disable and asserts that 
upon enbale. That requires users to workaround that by declaring
the reset gpio wrongfully active high.

Fix polarity in the one device tree actually declaring
a reset line. That patch has to go in after the bridge fix.

The issue came to sight during experiments with reset lines on the
Epson Moverio BT-200. There are two of these chips with a shared reset
line, so also prepare for future conversion to use a reset controller.

To avoid having GPIO maintainers spammed with a bunch of patches for
BT200 support, do that fix separately and now, so it can go in more
fast-track way.

The devicetree change is only compile tested and is more
a cleanup, not an urgent fix.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- do not use raw gpios but use the quirk framework fixing also initial
  state
- Link to v1: https://patch.msgid.link/20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info

---
Andreas Kemnade (2):
      gpio: tc358762: fix reset gpio handling
      ARM: dts: st: stm32mp15xx-dhsom: fix bridge reset polarity

 .../boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi  | 2 +-
 drivers/gpio/gpiolib-of.c                                          | 7 +++++++
 drivers/gpu/drm/bridge/tc358762.c                                  | 6 +++---
 3 files changed, 11 insertions(+), 4 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261124-tc3-reset-e68e91bc1638

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

