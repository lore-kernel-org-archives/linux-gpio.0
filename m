Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612415;
	b=caMGoIKlH2M8wpGCOp7Ng7guljwqtGDyvV1t1sNI/LnPoQ1VKco7l2byp/w+rz/JLKWQ
	 CnL6lqC2xc39kuS2XDGHBsmS64+tCRVyWXg17LNaM9ZP4IWeQe9rF8XEOvbwUR0P8fjF7
	 MraIg/2IAaVQvVFpsyWaRa2q6Mnj4gCVEZyXynlK2KLq0MLsswf0noOP47cT/JqzE5pvE
	 +S8+Ug6Qvt/MJAjNL2/UgQHYoszf7OaCIeU6MsvTnhng6PkovwW8oWOVpFnW1QmI7j0vN
	 PReA74n0iPTOCSkocJ6jTA/nIzJ2HvRL3Fg9JPwzka7DvFbYpi8y0i7FdTIHaF2PAHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612415;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vkSzT571CkM4UxEFjc4hQdNlId998FiFtupg13HTmvU=;
	b=bWcMNtvcJMlXGz/T7TkH7pe26LyjBPXHQ5UlvkvEpYrlkw/2zMG30K2tDDsetCqPY/Qf
	 fbXHyt2yMmahg84B8vsTbo4jDgHE2hZOCHBNcqxIJzAnFP0vLaCbh5nSb/yxPK1pT/enP
	 frX7b8yKDcu8OMmLMuBVgWo/7/fncj41JZtQO9r634M8n5Ob9NgR/BJFBNKoI6Av2+ka9
	 ah3xlyNZBO4DUC/3YDyDluS9+SUfa84XaMA84Ema2hO/1OZdV8hgTdmlowWSxTInTdCgy
	 Mx1sOyu0E3Vl+viD+UgQ+wJaX7/TzT2KLORfl1bywNWqEmtlpYGQeMOPNkq5gXCi8oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fdvghn2N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3285F60A4AD0;
	Wed, 21 Oct 2026 19:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fdvghn2N
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612414;
	b=GiY52ufscE7qDVyggZzwB9kgSdMTYF+lSBC0G8TXMB4unjxpkydf8AQBKdN5cqe0EK/+
	 88M4dKGjNow1ilDq4ci7ckY3ahjcEFRcOyyiIbh+PNPmD5BhZGKU+z7BHXIwpf2Tl82ss
	 I+Er6uHG3xcws6dMEURbeNnXEWzhp+W2/u6tgYRH7oydTVnqNY4fNtC6J1pZKg9zgDHDO
	 eyncgvVVeXvZ0PFAeU/w2KtWBCMBrH3wX8EtBIafbZAvRch6Ed4wkh61RQujAYOhT3KB6
	 7qEde4+L89UR9h4mUcxqT3MNbMhByPuSKUd+E/JvhWn+aN5mqOUkyBK460DF0DcrVug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612414;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vkSzT571CkM4UxEFjc4hQdNlId998FiFtupg13HTmvU=;
	b=VxxWuaAZwIMcN9dKnJzXoISROGDxQnWgsqRpzR8iJaq/ToU861hkOTtUXkrCXbwXe0hh
	 3XApOV1y1eYkNQbqLwrv99v9+TQtle34k5SLFAF9c4xtzUl6jFTfpSlVGto44dSi2YODy
	 oZdDe5FI1GOOz+qinmFAWENhRFWxLxmIPv13UrmE10FYvbFMDvufAvuN6DPQVNUQikHQ+
	 eM2EjhsCnt2y6O16LmUmiyl/anVuzQJOsiQv7Vh4ZhdiHgRj7xbNHZpxqw0ytrmWMjqy+
	 7wa8cH3irTad7ZiCGwIbyMInL5i7XmJwVWAJH0YP/6/v33X3MHBEzjHUPBZEmPByvdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65E371F000C8;
	Wed, 21 Oct 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612414;
	bh=vkSzT571CkM4UxEFjc4hQdNlId998FiFtupg13HTmvU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Fdvghn2NqxXXBa72xVHiBnop5foi5H645c15BaMMjdeak0eTlCAYE9OHyIefUJlYD
	 WLU2ydG4zvA1js48lQMinu/KHhd36XR/Os4wrx6RhRfL3ithsf2izP820MK1paLAVv
	 UuJl3r+XHJJOz4T8bLabnM/i2Rp86QYKww7nlLjPdcWaHUDdqgVrxAQ8iEm36yxnNC
	 gT9B2gk2O35CvK+RJZ8F2gnIbtSn9QjrpvV4bbtN9skImVVIivKz4ADD4EBqmK3vl6
	 TV4h6OhL6ZxM1zOj9xiLpWZ8dnOIyP9PoO7r7YvX4gKscl5UYPS9ajVpGRYAGPenZb
	 DJcD6nBc7rSig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7334C4346C;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:37 +0800
Subject: [PATCH 17/18] riscv: defconfig: enable A210 support
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
Message-Id: <20261022-a210-init-v1-17-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=1130;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=dnd96ga447dSomCEFGKgHYHO1dgeChmNdmNaEUIrQdc=;
 b=4oI+L0gaFzDPLPpdDhyxx3Mn6LIC9zoATjnBz6K1sg/1+RbNn1u3FS1JPzIuujkKpmHF9PBPd
 QgUh9R+ImaCBrNIwb3pBWor/y7MvG78CUjod+4dHnHByEJTEUiZxHoS
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Enable A210 platform drivers and reserve ten 8250 UART ports.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..b9b3bca12089 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_TENSTORRENT=y
 CONFIG_ARCH_THEAD=y
+CONFIG_ARCH_ZHIHE=y
 CONFIG_ARCH_ULTRARISC=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y
@@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=10
+CONFIG_SERIAL_8250_RUNTIME_UARTS=10
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
@@ -167,6 +170,7 @@ CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL_A210=y
 CONFIG_PINCTRL_TH1520=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y

-- 
2.55.0


