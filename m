Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254990;
	b=XHPUTFfghc+bxK0Yrc/ozgBF/ZO/iGzz6f6M9ERzMJuJH9xQ+NRCeDw8LyLIb3ObvN9m
	 /ojpCRZPF4RIDFxN1ZXJsLldCIDZOKlEXkOsxNdOL8Wj4gR8hJ82SyRUmXXzh5ClnZixI
	 4oypa7Ozq/52T+LOwrSzyIlg8XYPq+0iw2+2jtJART3shkb8Ppo2KUhs5M1p8aIKyQJ0T
	 nc5Pj8/LcZVqNJqYNToB7CFmM/UUFNZ5dFnJ0I2edqaQYvuYi7DnpK5jwJJfGrZrOd7Fh
	 zOi/ioKKpVITaCgtLmiDdheIUigHjFpDskIXnWXEqCdV7NJmblGO3ekZcuXj0mlD/xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254990;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=+qYgKgKkNrRami9gJNBATfSBpbaF04VJZNS+/MMoX8c=;
	b=3C/mrO4BA1jVldD6LQEc5nVY56Rpehp51dbvRK3sn53+V+OJNHsvqhZPAj2tHI7n8Xyv
	 r6sMVhfGXwNrgfHqUAzgKMS6ODcmKqnF7G7UQEWWSldXosPlEu3tgoJdQXhr+fsJVkEJw
	 Ye/r8Q9YIWxKMheoWxF37z9ugWsKISMLBLwpnl26kF6ZebZAZfSM/QIAUr5FXCahsHnp9
	 Zt7aa+RynC7jJRnXRgIUOCtzu2SfWGqjVj5zYJrmA6jMxxS49+RMB1QKo0sIsEnbA9uTc
	 k4UoQyEVDsMeEXQm4Z4X5o4jCZk7WULNXHdjVWBhBoabLnnT55PKAi0ncHIVbAEdQ3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+9pLdYG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D210D606A326;
	Mon,  9 Nov 2026 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+9pLdYG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794254989;
	b=jt/zc6MvdiEpcS53ati9Btcd2vN7CgaIKkRUez3PZppe0W4UDV9F0wZitezliwR70dPv
	 4ojJbtX0fy8n5UIEL3QOVR1q78eRs7DHNN3sv72FeFk5C/xCexFmYo5A+2CtR9uKvW/zk
	 +PQCWcsbv7w43fBT80KC745ugcGhDzKODthyhE6tTukKAUFAy1Q/VsQsXmoi7fpWyKY/R
	 adV53Nu2/ZvS+nV+os/RJfHwWzw1XJrBKLD694ZnIedC5rM47mixeKeq1NZ3oIx4vHv2m
	 cp+irFN678fojJudFFm5F4IG+sBbHQGvMEMbwqn10cRar3Ds3V7Eg2bwb2VTeRapNIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794254989;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=+qYgKgKkNrRami9gJNBATfSBpbaF04VJZNS+/MMoX8c=;
	b=BzEfqEq3Myc1AKCY6eDqNU/no6qi63CdJ8/FfhgfeuyLU0O9Ed3XboXmJAb3t1s0AOKv
	 bujtPW3A4XUe0noP/DfQBBnTMYtD5wJ0D0n6Sa0W2joPA5rupvrj9oaAGM7Y98vEm9MGZ
	 mMZemMalXeGqY665jrno03IdrhSY5OGKfKBZy3v4HbvMm3318Kx+EnSACfx6GH5vxG6V3
	 e/2rO5pWov8oGVvzwvVFSIK83clMSjLxl4tLcAy9YiSeP40hJkn3wmdnQg8pUdj+BUzbj
	 ZCn5RxGt4x03z27Om9061xQk29mOsAHHP9y8DE1gHm2oxhb32JP81de2CgZgCxpUxXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BC331F008A1;
	Mon,  9 Nov 2026 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254989;
	bh=+qYgKgKkNrRami9gJNBATfSBpbaF04VJZNS+/MMoX8c=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=X+9pLdYGEVKqNU7CQwWm6ej4fKMVhAyaMrLyuP8Zd2LY3oVztMA7h3BVmlRzRhEEb
	 TRouOadiC6CKzCwuvqvI/uuhLHqcZDzoUW2yMgPMLC9OKovR57nvr2L4LKhs7p4htq
	 vXpsLLUOCqsykRdKJDgDP72S+h3LkbxvmBlU/GOG1XhnsdroNBlBRiBQGG9CYzTW40
	 b6abNN0yeD2zHAGzpGEeRD3ROf9jXKE0krfa9JtBeZ07Suk4C87t5WOW41CDLYa/1p
	 uYxk56/yEYp7Z9S1+4C7aNpWLSGKcktnBu7r0hIGxLIL6iE3yJEU/nk0KND6kzKD++
	 subbOqwnuEGGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9CCDA48638;
	Mon,  9 Nov 2026 20:09:48 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v2 0/2] gpio: Add the Siflower SF19A2890 GPIO controller
Date: Mon, 09 Nov 2026 15:09:30 -0500
Message-Id: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAHoo8moC/12OQQ6CMBBFr2K6tqYdCxZX3sOwKDDAqAFsS6Mh3
 N2CGhOXb/L/fzMxh5bQseNmYhYDOeq7CLDdsLI1XYOcqsgMBKRSCuCulpkBnQneDNTzAmSSAiZ
 Qa81iabBY02MdPOdvdmNxwdIvK5+ExfsYTf4Xa8n53j7XN4Jcrl+j+jcGyQVXCap0Xyp9AH3ye
 DPmuqswsHye5xcPo6kw1AAAAA==
X-Change-ID: 20261102-sf19a2890-gpio-b21562e52f88
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, 
 linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>, 
 Qingfang Deng <qingfang.deng@siflower.com.cn>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794254987; l=2936;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=YNNuUIhjyiZTY0/u39z7F4DHkB1CR2mjqFrrVwxsTQw=;
 b=aDWYDVEqbwGQOOzgeVDJcyo7dMkWGrTYnRUqmnnPNtCDyslKc9bZGlOK0oXMYMpUkLscHESvz
 BkExt1y9aMJDu1qc+SzG0x1KhQeDIPeY/2ng/JusVy51kaqWLIHGlKZ
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

This series adds a binding and a driver for the GPIO controller of the
Siflower SoCs, starting with the SF19A2890, a MIPS SoC for home routers.
Each line has a register block of its own, and each group of 16 lines an
interrupt.

The binding is Chuanhong Guo's and the driver Qingfang Deng's, both from
Chuanhong's SF19A2890 branch [1], with my changes noted in each. The
same controller is in Siflower's SF21 RISC-V SoCs; the binding has only
the SF19A2890's compatible, the one I can test.

The SoC support itself (MACH_SIFLOWER_MIPS) goes through the MIPS tree;
until then the driver builds with COMPILE_TEST.

Tested on a GL.iNet GL-SFT1200: gpio-keys sees both buttons on both
edges (the reset button on GPIO 27 as KEY_RESTART, the mode slide switch
on GPIO 1 as BTN_0, 1 and 0 per slide); /sys/kernel/debug/gpio lists the
49 lines; the GSW150 switch comes out of reset through GPIO 0 and the
SPI NAND uses GPIO 8 as its chip select.

[1] https://github.com/981213/linux/commits/siflower-7.1

---
Changes in v2:
- Write my notes on Chuanhong's and Qingfang's patches as lists, with
  Co-developed-by on the driver (Bartosz).
- Get priv with gpiochip_get_data(), drop the two else branches, and add
  a blank line after the header comment (Bartosz).
- Get the reset with devm_reset_control_get_exclusive_deasserted(), as a
  local, not in priv (Philipp), and drop the OF_GPIO dependency.
- Name only the SF19A2890 in the Kconfig help and the binding's commit
  message, since the other SoCs need compatibles of their own (Conor).
- Drop the ngpios property, which the compatible implies: the driver
  takes the number of lines from its match data, and the binding takes
  exactly four interrupts (Conor).
- Order the binding's properties and its required list (Conor).
- Add a MAINTAINERS entry for the driver and its binding.
- Use GPL-2.0-or-later, not the deprecated GPL-2.0+ SPDX identifier.
- Use readl() and writel() directly, without wrapper functions (Linus).
- No comma after the match table's sentinel, as Uwe asked of the
  clock driver.
- Drop the unused linux/pinctrl/consumer.h include.
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev

---
Chuanhong Guo (1):
      dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller

Qingfang Deng (1):
      gpio: Add Siflower GPIO controller driver

 .../bindings/gpio/siflower,sf19a2890-gpio.yaml     |  76 +++++
 MAINTAINERS                                        |   7 +
 drivers/gpio/Kconfig                               |  12 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-siflower.c                       | 310 +++++++++++++++++++++
 5 files changed, 406 insertions(+)
---
base-commit: d66b6b86d5a6278ca930112c634d03725beb7d9a
change-id: 20261102-sf19a2890-gpio-b21562e52f88

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


