Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612407;
	b=FmNf7DNkOBIIQZHaW4Cj/l5k5KTcV2iemdxlrkxMWwdpcCwHgqfn2+3kjuJiR0G4s6Rm
	 cdF8+WHTNbYyB09xGKLYvcREJLkzuUUIUuk+9En46SRHdKlWqV/v2QY9GS81fGU/ga9K1
	 ZpcIyYldjiwGKkw7uEPBGcUk9J9Z5ZCNwJ1QEtKz33hf4DkaT4fUCTY1kWk/sXLVIXFB6
	 7dRrBe2FV/ZynqPjmEoyMs0iG/i8+NvMDSbt27ZMGot984d+NXU3Hfll1BcnbmMNtY2dF
	 rUk266VTWKHWuf7EMsXCj2OHW0Dg/mlBgauJInIPtfPUgIHPYLBl5tR6akyt0eXO+Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612407;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=eWlBKL2FrSB99yvUJcyvTb/4uFs8JHzUkIHSRVTAqmc=;
	b=CVxIOVZ9ceaevEqiu+5n8hHgqRKelQy8Q8KHPFrz5t72wrohDwRmv72yLJXYVNuC2WmB
	 KZN8kG8FUI6w/9aXy20MBUBXvwLX0Kvxk5Jb6O+HXvYB0I89x/UqTyxvs5p6BEw8j6kq9
	 kN6vSbgAeXb6FXB5ouXJVbW++QkgKpNM4e5kUYrHK+P3yGdbO0362olCQmKuDXVWQe5k8
	 5y5biJ1tzHSpcZq38FGLLFgY/2KGpMpJbLTekik6frwLepq/o+nbkBolqTtfvh1YhoQqn
	 9txsigZq0lenIHiiAr5EFi5YMraJ02VrLMxhtHfLgdbh0RVf/FRXBArd7XFITjh5eNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5jeaKhx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEEA606A31A;
	Wed, 21 Oct 2026 19:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5jeaKhx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612406;
	b=QctgzJfl+ziGG2DvJLU5ydyKSOHXBHGo+OqTJ9QaSTakmCWsGDACHzkQCGkv857Lx88I
	 Vx57cTKYcvrD79IuSuKs6Kuj4DD7tcpMwLfTABfCUjHOmYXpsBNeJFELzOsHCaC5BhW3N
	 xDaY6+WKDV10+BSHn+oORH97qkksTFmfGPLKB1of/1hon+YsaxAC2drsz5Y/y3xT0ZKup
	 Zsd1vjpN4/TYZe3A+X5D5qADCCCl87wbClNlpTvYKUqVX5YUDlsqp6T9tA1ME7wkbJIfF
	 3jIfcG6YgLYyDO/tzwTshHUHoQiqxUH24st5+uBmW2S7SWgZRNop6Qf+GmuvHy2JfAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612406;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eWlBKL2FrSB99yvUJcyvTb/4uFs8JHzUkIHSRVTAqmc=;
	b=ILwav5JxkmDolN7po4Ath2kaidpALMiPYWrF9h+N+Jo7Ui6fAM9LQ53GZhZ4QZUUM/b5
	 Q98Yf9d4VSHQvCtTzLM3bzzYLCE62YpD6JYtTIQYsTS95zjGUXN26tUUZuisNwTOwAyF6
	 Cgrdrh/mWbLKe6oFeXhV51nSWsXrPPtK7InIq7OrABDZ51pLzdvQMlehfACWqo9zfFsJa
	 c88SsBM1FiPlvsYSjfWJBsNIgKl9lxJHVlh3JwpX28Z/H9lY/x1kBCNiRBBOHKA1ufeaL
	 qS1PSFqWu2XxuEJVzXpMvvy5IsUzef/5NungIRD2egaccA3EVxuJXf1VPs1ja1hNp8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49FF81F000C1;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612406;
	bh=eWlBKL2FrSB99yvUJcyvTb/4uFs8JHzUkIHSRVTAqmc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=l5jeaKhxImUQi/nHVWIDMw2lXv+nT8uQm/LDXjdmds+pUH2RcA1pXMjjlWKuYKoYn
	 ZVJZNFzcO+mQ1xftd0P5WbCxU61d0VVhlB0ckI9XxUEwDA6PefS+7BkKFLY6XlmPlZ
	 ASZRBPetgAciG1cVxELMJckxMzu4EcVBTEAINW6lmp3Rl2v2GT/KCmhaKVD2y/1IPh
	 eZqjvkqEvihuMNX/pLrMkGQIhdafySgpeAHTu4xBObF80IMFF6b03jU3MkiQwDRwRu
	 OP1QnK1FeJOWOJDk8SZfQ2q/zvcWTkOjpw9leF7By9hU5bLu2WmFGzn/Wwx9REqcKn
	 9cKfl/Pl7ZQSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D0B55433E2;
	Wed, 21 Oct 2026 19:53:25 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 00/18] riscv: add initial support for Zhihe A210 and Melon
 Pi
Date: Thu, 22 Oct 2026 03:53:20 +0800
Message-Id: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpBw2uIhZVg7EoaRGJuLti+
 ZKff0EgzxSgTi7wdHDgxUWoNAE7GTeS4D4aUKJWElEYVFKw4030WWm7inReaAOxXz0NfH6vpv0
 d9m4mu70DuO8Hf3JP0m0AAAA=
X-Change-ID: 20261022-a210-init-d38cb9e6456a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=3651;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=fdqGEtqurgeviCoJo2v3fz4uafhyyCeIFrfPMJXL25M=;
 b=KF/xmGzB8PxIXqaSFn0Vm3oSvz4qj1fS28kB8b2HzP7/gqxzmDgUh7qKLPq222zC3FZqfkguz
 KszNuI96SoFAF3Izvh+DH9TENK9KRRBE4063hQgjuOSnEeNU8jtqWUv
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

This series adds initial support for the Zhihe A210 SoC and the Melon Pi
V1 and V2 boards.

The A210 features eight RISC-V cores in two clusters: four C908 cores
and four C920 cores.

This series provides UART, clock, reset and pinctrl support, together
with the required bindings and device trees.

It is based on Linux v7.3 and has been boot-tested on a Melon Pi V2
with all eight CPUs online.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Han Gao (6):
      dt-bindings: clock: add Zhihe A210 AON clock controller
      dt-bindings: timer: add Zhihe A210 CLINT
      riscv: dts: zhihe: add A210 module memory
      riscv: dts: zhihe: add Melon Pi V1 and V2
      riscv: defconfig: enable A210 support
      MAINTAINERS: add Zhihe A210

Zhiguo Zhu (12):
      dt-bindings: vendor-prefixes: add Zhihe
      riscv: add Zhihe A210 support
      dt-bindings: clock: add Zhihe A210 clock controllers
      clk: zhihe: add A210 support
      dt-bindings: reset: add Zhihe A210 reset controllers
      reset: zhihe: add A210 support
      dt-bindings: pinctrl: add Zhihe A210 pin controller
      pinctrl: zhihe: add A210 support
      dt-bindings: interrupt-controller: add Zhihe A210 PLIC
      dt-bindings: riscv: add Melon Pi V1 and V2
      riscv: dts: zhihe: add A210 core support
      riscv: dts: zhihe: add A210 UARTs

 .../bindings/clock/zhihe,a210-aon-clk.yaml         |   58 +
 .../devicetree/bindings/clock/zhihe,a210-clk.yaml  |  231 ++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../bindings/pinctrl/zhihe,a210-pinctrl.yaml       |  206 ++
 .../bindings/reset/zhihe,a210-reset.yaml           |   56 +
 Documentation/devicetree/bindings/riscv/zhihe.yaml |   27 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |   16 +
 arch/riscv/Kconfig.socs                            |   10 +
 arch/riscv/boot/dts/Makefile                       |    1 +
 arch/riscv/boot/dts/zhihe/Makefile                 |    2 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi |   55 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts      |    9 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts      |    9 +
 arch/riscv/boot/dts/zhihe/a210-som.dtsi            |   11 +
 arch/riscv/boot/dts/zhihe/a210.dtsi                |  645 ++++++
 arch/riscv/configs/defconfig                       |    4 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zhihe/Kconfig                          |   12 +
 drivers/clk/zhihe/Makefile                         |    2 +
 drivers/clk/zhihe/clk-a210-aon.c                   |   94 +
 drivers/clk/zhihe/clk-a210-ap.c                    | 2283 ++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |   14 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-a210.c                     | 1206 +++++++++++
 drivers/reset/Kconfig                              |   11 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-a210.c                         |  589 +++++
 include/dt-bindings/clock/zhihe,a210-aon-clk.h     |    9 +
 include/dt-bindings/clock/zhihe,a210-clk.h         |  649 ++++++
 include/dt-bindings/reset/zhihe,a210-resets.h      |  351 +++
 33 files changed, 6568 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261022-a210-init-d38cb9e6456a

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>


