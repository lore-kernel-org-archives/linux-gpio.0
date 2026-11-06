Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793993787;
	b=kyCXEzATLGfhDIGo6LNC8jzXgadIP//xRyE2M3lQoCcD3G1SHrGhzX5+jgShEep9oRgy
	 G1I/nSYqRM/pQlAI0+3TuAkg+oL6pZ+IPO3vcarE8bQt1APCmlXkh61Tur5hSNPHGcrXQ
	 jGM+Op5cKziafEhXFXgBApeDL7r65FRAQOmzWsta7wQ++bUddvukNGJccwMO5bvTW7Eh2
	 4FMFQvzagTej35oAp5TEhxTpFvAUR9ZWkQZm9RYnfvX1vb2xk0M4QT5XWm3l07rtW3TKv
	 vyUfiaVrPIHNK73XvUcDADvMjkTFd6zyH6N9zoyD64rojJSLXuSxlxjFfgp2PjSkznA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993787;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=uILwUN7ocyhtvpLVjK3RPrXU79y5KIHNgrzUoSObyGQ=;
	b=BQKlPlllZqguquKJNdxFt7UhvlX8f+MBVjcL09GHNa3QxuYAz3EXHRQ+kno9htwH0wzt
	 Hait0IT5ItztgIysu3uxm/4U529RL2ZtgikhunAogaHNKWJq98MbayRrjOyyz/S14qDaI
	 Ywe3dn6zQ+VSV6ykgR9w4VV8me+Ah2uPEHqJEy7tQs6dPrV6W44HW47BIQsxCthN+Zi1n
	 RNcK2PxAbtHPZZSdhovUcqcQ0pC6I6hGAyIKKOA1dhwxtfEMPYDDC0+fQyEzIazGb2t6K
	 FjJypkIbvNKGFBdOe+K7bLPLhGkAP2ewb5xskjWQa1lE2SlV4M3z/x+Cc66tXsnPDjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtYsSB5o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A6606A326;
	Fri,  6 Nov 2026 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtYsSB5o
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793993787;
	b=QiL/bB+YDzHllaK4Bf0wUpfY1NrB1bK29LnaEvKWOUMhimxdlOD2IuDdjXOxoVm7ttn6
	 ne9WBcq3kiNrmML5dTeirQ7VsAzA4NAe8wT2ntOgGWetqjVNg4JdjkyfjzBUIGhngTorL
	 bckRMXIVnPFDpGkQWGOkJNOM2+yYuhTtfDuiT5Fk6ejKfed3jBWRzeDS2K+PqhXOePqiz
	 H4ZL+vyrtqzREEN03x6IEObhAiy4tDxXRX5Ug94zjIooXXFecTqCKjwIa2TC0vOSGZ/io
	 6Eai/9WhdbvVuTxcfFGnzboPKcZfsVHQMIOVh6g13t6UGzRmLFEs91vR+YEN3XHjJQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793993787;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=uILwUN7ocyhtvpLVjK3RPrXU79y5KIHNgrzUoSObyGQ=;
	b=AJveb82Kbgj0P6y0bQ9qINwGRqTBn8vDqb0iayPHaT9+wuOSoz+lYwX+K2AiyahyR16A
	 y2MBMVH6xarUqfK+OekWTro0NbSCU5jAch0PqyelkQNtzGdP9OG4RhETzThDkui7B1D7D
	 gwKxAFvM4ZERkaoaI/ps/G/eurlIqBT15jVByLMcL7XrRtz3vePlr8njB2FiC1R5lh0Fm
	 vPwvaBIqa2oSfL5BtTNWt2DeOyVX/sg+dtV8Di8GzZxJ8THYu0rmR0HO4JSbFn26dVg4F
	 7/tqgm0eDJs9XMM9Bp3VY7DWfuWpqSQTtxr4IUMKTl0YqIvR492clU/gWP2Rb+YdK3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B8D31F008A1;
	Fri,  6 Nov 2026 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793993787;
	bh=uILwUN7ocyhtvpLVjK3RPrXU79y5KIHNgrzUoSObyGQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=HtYsSB5oWaj7dwejWH6J8dMwCdJCOyGWsNlmGGx+WfgMYf4vJkjjT1+ro+gxn2RTu
	 N9tBc2EszbM2RaH/YpNR/hD/QKYg6/K88JZPYGMOlvFD+tGxtLriry4R0siGizb4t/
	 XriHRNlprepwITtrahXKwU3EP3u+fxcFuf/r9kfzBtTSBA66hp2WaDr6031WCMSkAm
	 9rlNemUl/yBVOeDxS2dYxlmKYaImy6T8Ua6EHI7kNRG8gG+UE29DCG3osL4zdscXOy
	 idU6JEh+E7K235RIWsOZbOM9k4tBVsXeleE1AQtUIFk9blhhjCd9GifZ0DY9kBSE7t
	 BBRW6s1k5BIhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C58B44784D;
	Fri,  6 Nov 2026 19:36:25 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 0/3] pinctrl: add Zhihe A210 pin controller support
Date: Sat, 07 Nov 2026 03:36:06 +0800
Message-Id: <20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXpVELjKmJBTRmRkhaRNO6uW
 L7F/xECeaYAdRbB08mBV5eAeQZm6txIgodkUFKViLISnUIpNnZm94tQhZYV6sLaUkNKNk+Wr2/
 XtL/D0c9k9vcB9/0ASGCkjXAAAAA=
X-Change-ID: 20261107-a210-pinctrl-23807183ff68
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793993783; l=1226;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=lI0jPaIXPZUKAJwf6sStoxzn6nqviOYKQAzrRSANV4Q=;
 b=Yn+bD4PSpOp1/GW1CAi4yUtLp/rW1nacSB/RPLf7sk18TzrvqNG7Uohp3yHDbRkLFgavbYT44
 eG8QIW5zlkjArpcNvk2zkv3F86hcN/n6+UzAFAuYfjZBpz8hdyDS4n0
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

This adds the binding and driver for the Zhihe A210 pin controllers
(AON, PERI1 and PERI2).

As Conor suggested, the patches are split out of the A210 SoC series
[1] and are unchanged from its v3, except that Han Gao is added as a
maintainer of the binding and as a copyright holder of the driver. The
vendor prefix patch is included so the series applies on its own.
ARCH_ZHIHE comes with [1].

[1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Zhiguo Zhu (3):
      dt-bindings: vendor-prefixes: add Zhihe
      dt-bindings: pinctrl: add Zhihe A210 pin controller
      pinctrl: zhihe: add A210 support

 .../bindings/pinctrl/zhihe,a210-pinctrl.yaml       | 147 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-zhihe-a210.c               | 997 +++++++++++++++++++++
 5 files changed, 1160 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-a210-pinctrl-23807183ff68

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>


