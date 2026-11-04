Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776904;
	b=rDd5ApUw7VFTibV/OpmzgpmTDf93tASiVVFjXBpec5FYNm6HXARqRYNDw+CgqRnoFaeE
	 ZGsqWsjwxFs5m+77CxPfIyFaVJYizJ/sCEfeBdoIJ3UjnOjO/tBHDJuM8gP9aveViIp5Z
	 6ZsJ1cxe69SxgoUAHptHEDLe93IIaWi7VLeMm2XpAJLVoP/PNCtXuXRr2XD1x/sxDw7h7
	 818EIVYupJ48sH6oTvMaiQ1aZN/3/JpeD8N8xLFcRKETm0dfTQbB9aDSlGrojLOBDc8G+
	 hrp1mvu3P6oWnNDfDS0vKY7AtwkOyMIAOWkYXAMbtOjrOHYl8PaiP/Hi/6S0NvOuZiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776904;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=sYyyCvdGWzSBMzhDq9F4EbE13TeUfX1Bh9RjX9apN4E=;
	b=XwSJneD0ruAWlmxSa8TGouJ+698KN/v4rE/JZHXiq/jUysHJGjl4/ZdLrEJ5s1rU+pyk
	 iZcxEmNqaxFIKNJn2FQ7L7NNo867lgSKjR9isghRtosN56K1al1nwQCsw1/007UFmnqkp
	 ZGMBn5/+eTQhyVQXoFTOa8nYPBBDOp4HwhG/ZGAvnMwKNJE+WtkmGowp8+KcDyzSnWI4M
	 aKHiix8uYztze9F+WGxVPhxQ8RajJcnYP3iHzA31c3PvBsVQsnJc2qmI+5FJXtFtZzwAH
	 3jxUaJNf2JH785O5Ohh/kolccKyPHgHG3OMOzPG6n8wT8vsYoZi7owIiZN7Yy/ZfyRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6TGChMD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44454606A328;
	Wed,  4 Nov 2026 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6TGChMD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776903;
	b=20EjLBtFVqEWrw77tdPrf1DpFyOL3LJQkTmXuZCiSllkvm+1yoEU/3+XPhY6m2TCx/yd
	 OJKQgEXDttfwXQqoahQmnN8pFDJ1mhG74QtwntymiUGag3GS3EQTrnQf6CtofjlcDdneV
	 OMDPs1ysxj7cmFicDlJ2WlEyIlDqqcOdRwdoLREttlTQDNwQ/Dj4R/y+RlT+T93zJPzjA
	 ucMT8NJImyrPrHk8Gy38IPJEGrjPkKRWtm/EtHSq02kZ/2GLE6M18M+0yVfPzOixnLknS
	 f2uhhAM+/9UQP+ZjDci2//TgV58LCZGtWiyCbHKA5jIp34zG4kyAnxu3xffHSJrEpGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776903;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sYyyCvdGWzSBMzhDq9F4EbE13TeUfX1Bh9RjX9apN4E=;
	b=MnPjfStI3G8AMnUMrzvmH99k455xoU9XHYyvFXfa4kM2oUGjxcXnAhbwsy6ceya5JI5h
	 q+UCILIzhVxkdQ721cZcejRp4/FkEtmlFRaqhZFMjmqIv3kAC9qoUII7igwNo0P/Zpn3l
	 zfzlTt4P5YjmPv/yNIpoGVLIg8cwA5/jQS/yA0vJwaQOdz+iETXjr+8j0Ny0vhfm701HZ
	 apon6NvEid4u7X3qhnbI7/8r1u4wqctM8CRhYF8LDhw5ZE2khjiI8hMkQ5UUpUGb/uHkH
	 UvVwhZGb0TAMx8oAaMZlIGFvkZQ117nIamEpB37LzIFU1d3aWJBNwkq2P7G7LTFd8ng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 674061F00919;
	Wed,  4 Nov 2026 07:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776903;
	bh=sYyyCvdGWzSBMzhDq9F4EbE13TeUfX1Bh9RjX9apN4E=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=n6TGChMDp6a+8iii7AwEG/TwPB5m8xCSnPWMEoop/2T8IBAA6e5mJ+9SRoA1zIH+x
	 tXlRUcEfwexu1rbWGTjOybpE/6UUOqQHmIFf+DquYkABD4OGl+lIibQcJJfNHj84eH
	 midObY3lIoo5LD7T2e+V+OHZwBHy30Nu4JxXxrWVGpjNFPTWzeuP9PBtZCVmzsxNdx
	 FOcSyeZD7KhsDHyonWpvjyuU0jv3PduwwIqLFUOTsG+KMLVtBa5G6mA3CR9sKjiUeE
	 OIemyTCVZSmM1z8rBt7etxA+V0MehQDY00i+QZpB0uM7ZavZAiXs86yzelnRUGlVKV
	 k4xIBV4aZE0pQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F153846CED;
	Wed,  4 Nov 2026 07:21:42 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH 0/2] gpio: Add the Siflower SF19A2890 GPIO controller
Date: Wed, 04 Nov 2026 02:21:36 -0500
Message-Id: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAADd6moC/y2NSwqEQAwFryJZ29AJKK1XGVz4SWtcqNPRYUC8u
 +1nWVCv3g7KQVihTHYI/BOVeYqAaQLtUE89G+kiA1nKES0Z9VjU5Apr+kVm0xBmOXFG3jmIoyW
 wl/8d/FQP69aM3K5X5TUCf7f4tL7acZxdaPaahwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776902; l=1928;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=DORYErdHGchoiOCLr4jUC4YJ5kRuJgSmscAj0YZ7YTQ=;
 b=ut+omEVSXoOq04YQqveTnUO8PT5gudYW27P/e3DiiOtE1V4TB1TvYNHNBFsF627trY8fLg/3k
 z9cSVusBs72Dhwcq0McAo7x3l1hNc9dc9njUDXYHr0ZqgCkba3E1K2P
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

The MAINTAINERS entry that covers these files comes with the MIPS series
"MIPS: Add support for the Siflower SF19A2890"; this series applies on
its own. That entry is also why checkpatch's question about updating
MAINTAINERS for the new files is left unanswered here.

Tested on a GL.iNet GL-SFT1200: gpio-keys sees both buttons on both
edges (the reset button on GPIO 27 as KEY_RESTART, the mode slide switch
on GPIO 1 as BTN_0, 1 and 0 per slide); /sys/kernel/debug/gpio lists the
49 lines; the GSW150 switch comes out of reset through GPIO 0 and the
SPI NAND uses GPIO 8 as its chip select.

[1] https://github.com/981213/linux/commits/siflower-7.1

---
Chuanhong Guo (1):
      dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller

Qingfang Deng (1):
      gpio: Add Siflower GPIO controller driver

 .../bindings/gpio/siflower,sf19a2890-gpio.yaml     |  84 ++++++
 drivers/gpio/Kconfig                               |  11 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-siflower.c                       | 325 +++++++++++++++++++++
 4 files changed, 421 insertions(+)
---
base-commit: d66b6b86d5a6278ca930112c634d03725beb7d9a
change-id: 20261102-sf19a2890-gpio-b21562e52f88

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


