Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794949950;
	b=Jkz9g5hF0d9+R7Z9MXDAGzd18WxM9K0K4KA8w3rz/pk+MWQRXowIZK6DNkJucEweSGwi
	 nPaMhbywkanjP+A2uZglwBpTN1BKR5uf/Py0XFn5Cd0ajBaeW6imAwNuwxlAyq/zJuhbK
	 iYHuO6K3RKaAwC1LhqtyQuGTFiJjvXLb8WBr9zsrc7DYXHcyE6dwHHonn5aRBkUVzPSMW
	 n/DS1QruHV0jLwTiZzn3s5toXwPY8bUn4dFWl6ZjWjZhbFcV3Z2QM2ATbq3aFutWnX33b
	 cKMfUDjj9hShCTdbCEblinBDI1o9f6IOWR/vnuG1FGlSACnEwFnFaVj8/GNlker7JnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949950;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=d1K+mbLNZ3XlygCDIt+0jGc1s8u9UEZgC/x+nQI36Zc=;
	b=0OGuqai8/NYz+zQvgPpJh8AQUhjnBg6quEjAw+GSVgMgs1NQHKUrCIULr7v9TZnE6DO2
	 FI713Q3UMIN0ZeI0PIEOg1nBKNtOBdvutHNLqCrLo4gRuu7r+iyX/C3a+GaSP5EW3HY69
	 YhxbCJnIcKRfKmKVz6UJU9jtgpUNOdA239FFFvxTZ846GIQCmlzZPtaGUwh6oPZNs7wtm
	 H73d9cvTfFuvUhXE3grl11mKVh1AM21EIEb3hPr9DpHLaK5mR3peBxVWULNrv5qb0Vflq
	 r8uBtmszWp/QZh5jmWqP7+CjUTLxzu1Ed+zxblgnepBQOftL8Uo581SgBzBIhXQ0ZsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOHlvyh2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FD1606A31C;
	Tue, 17 Nov 2026 21:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOHlvyh2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794949949;
	b=S8cDcwBdPTTDYWOWCVFtu0VV+Bt/1rFoIEEWdrD/uuzU2UY55e7eHD/jOL9xaGbiBs7j
	 GZ2gJlsBdYnCzzfRPCjusZVKMxk58HyVf2mZdTfEYoGnkuv5a5lcXpl6tt5PpWbTwpkkC
	 TAwoMBZj4v12ohcjHo9dIxUTWLRPHkwQ7Qyo7y3sm/iN8i5CkdqO8Y51vEC+HKDfJA9Vk
	 AybdmCaSKIgGuTfPbcX7Qml4CpAjFhpDV2fzjudYPAPXVMzhRMpiQoGG1azIRIhvlLhjh
	 05dyTc7yDqqIKbmspK7vtBLMCwtkTLSfVaf4gY4yGDfyFgaY38HUO0kKLt+INzw7BXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794949949;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=d1K+mbLNZ3XlygCDIt+0jGc1s8u9UEZgC/x+nQI36Zc=;
	b=Nf8MD2FS3umZyUzdKt8K8iu1IMN+uhkYp/hBpYodfIWhd7B/8BKAV0bnhDrbDfS8fpLG
	 d32OkmPNKmmliz/WSED0Z2W10opA2cjuQ4qaasMkP+5ujGxXgYB0nT4nl3b8y+OnMnHsh
	 /iTstoI4Ey/3cAAHjT8sL+qxjSujfT2YFVP/PudlFjxcDj0CwCOg0iAEVjNcPJK12xXAN
	 otpUMpPTNh6CDhi/NaYotYgTibO9QdKteGy9VEVHcbz+qN1MvmYhIRy/2OJIOUanbPOsM
	 QTE1CgFEFBxnzdTwNfTokE0kC0qFHTwvdU4f0rorZgm6iUtQ3yyE8x1jQiyB/4BYP4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DF8E1F000C5;
	Tue, 17 Nov 2026 21:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794949949;
	bh=d1K+mbLNZ3XlygCDIt+0jGc1s8u9UEZgC/x+nQI36Zc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=cOHlvyh2oHA7xkEYKqaw+99eADjB1qW2S88ey3QupNnY6b/7IW1gLEkKO+rgYk+Dr
	 aiIGU4QG2vJaS/z1yw4bMtVIFxiccpkC1BGnpYAW9BhiPYeGCf96yb+D/oPzNBFUjm
	 U1aWwSGFLfhFii4pw2FaCKfTVimP0HYMbb2jtQM8QdTsuaIM0AJYg/nqCptNwfTDl5
	 lRQrXxtDyhkuqkGFWi8z1lO3dpKcv569AHybu04Wn6NcBZ+I3haqi13bJxluEhRFKz
	 B3qfMg8Dw+gbsBn01kYsqb0fYLXhUMzTtWEKkTHFMnK+ADUvASZVUCdsobtY/ehQcd
	 MaHCxjWSMvztA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A4D334AAF3;
	Tue, 17 Nov 2026 21:12:28 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Subject: [PATCH 0/2] pinctrl: mediatek: Add MT8163 support
Date: Tue, 17 Nov 2026 21:00:40 +0000
Message-Id: <20261117-mt8163-pinctrl-v1-0-2cfd12206b17@protonmail.ch>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3dwSC0MzY92CzLzkkqIc3SSDFAND0zQjYxOzJCWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgB9SlqVcgAAAA==
X-Change-ID: 20261117-mt8163-pinctrl-b0d015f2346b
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794949947; l=902;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=1RUSaNQaX406sgZc8R8mxzN7Q315rl1SptZhofKDiBA=;
 b=iXMhQXmjmJwcA72ZEb9q/p7LA5/PVRKlDSXyJRUfsA8uP1/qdR69WaGrMAPELn1Axas5Tdwri
 /VtuCOgZJ+WDk3PnzY6T9ITFfXzfbdpPKHKftPL4mwiXxG/1sxny5Nk
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Reply-To: bengris32@protonmail.ch

This series adds device tree bindings and a pinctrl driver for the
MediaTek MT8163 SoC.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
Ben Grisdale (2):
      dt-bindings: pinctrl: mediatek: Add MT8163
      pinctrl: mediatek: Add support for MT8163 pinctrl

 .../bindings/pinctrl/mediatek,mt8163-pinctrl.yaml  |  208 ++++
 drivers/pinctrl/mediatek/Kconfig                   |   12 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8163.c          |  478 +++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8163.h      | 1299 ++++++++++++++++++++
 .../dt-bindings/pinctrl/mediatek,mt8163-pinfunc.h  |  821 +++++++++++++
 6 files changed, 2819 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-mt8163-pinctrl-b0d015f2346b

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>


