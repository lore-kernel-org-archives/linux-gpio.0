Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792612414;
	b=eAAu6SbW0gEoGtabAgHd9smQm0ldRgGxnGmz9PNEmEkVG/WkzHkDR7XommCUld3FNY0l
	 TW/oF9rKuBq8JStCGD6iXh8dseP7CsmCseHdnL895KkWW0TNNdOWH/Qae4qxsufTwXTXm
	 6mvac/yIeViDw3xVED68Q4F6gqSiuac3CpFZd50cymdkDIuMZVc3nxbpQ5Bt4/p3TAi8w
	 54Q8pqhx6WFRoSvFsuj1ek+GCxwchTMUcSnVyzBqc+FTYsa08VbeB4GS94g9QORKPAqSX
	 nSZX3NfUjqTCc8E51O82qOTMjOLQouIeVoGW0rqFMaXrdwb2fhoG7aoU9kdzq7uC8tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612414;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b+JiLH1GI+1IZm1hw0N4xC6q910doPI+bHiafqo2L5s=;
	b=15EFUB3hZXHZ9YHXSTtFoGD8lQ9zfM4PiMKtz2K40T5oMrvsb0pbN3H3FbLJqAJAHN99
	 9ELfwopmeFepfEJ0qP8KR6GaLbUyO/mAFl/CAQrekGoyWbzJnlSvGrz38cG9+WF8oAz+e
	 4xfVBE4hkdaW5Qw2wp5+G2fout2JPqFUhHoTFuNKRHP1ERp2qqyI+cGUKxNeL1NtE1tV0
	 fEo3+NgRi1C3IGLd4HJsI4MNI6JYCCl9+r9sNTtP3YO8icqYp5I4PVSe4nrkA1vxnoBf2
	 1u7wL9P5EQirVpWilxzv8W19Kg39ZkpYTwM2C/mCxRvJRBUWW0FrW7q5U5R2zOwGDKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtC3B0KS;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241AC60A3826;
	Wed, 21 Oct 2026 19:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtC3B0KS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612414;
	b=d9tgErYCrfrLKiw1UtqBbiUpnD5kB1c8Gd5Ld0LBob0w8RN9njxW1KgFzy/gLpn94aiK
	 Jk4NKLpvMv9yaF4kQbJuENnuQY+/jFt1bck3HLXDet6MNV5pXGSDOMzt38aSpLiJAvCB0
	 U87FujgaZnOViUbZRCdTbfYwgEoWxprMZiUNDJ0RDHUisIIL1GLnPPLTJknfeYeZRCgnA
	 NKHudTavYUBA0N6KKlnCq7VuBxQoeoLPipxlad4X00yFLJ1384WvQdFXpAHkhOKw9XDM4
	 i2F8wOd5ulSxNlsWJ3bNtxUSSTSMBPRrrDLwBcKqqW1//coL8qh5rmwKQOMFHffrE5Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612414;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b+JiLH1GI+1IZm1hw0N4xC6q910doPI+bHiafqo2L5s=;
	b=soMQgzBzNFMRaR1lfcU9fo4ONB7Vaa5vOkSeac6Yd4RqofWuCs3xHaB9kIyzV/LbMc/H
	 RJX67A57Ao6EvrmvGiAJ/2ShwGZKUSb6OGAlC6F/+JDLd9m11aOvP9ucuBbht2Vciq0yV
	 rKhLYc+o2oFg3XMeENmpWBx4PkEBpSWwm4okPwRl9sueucsA4Kk5ypmo7EHAhZ0nqP9M1
	 FJEdqPLqxUdz8CMIiyWu5jguSnK/WkzJQnx6FiHtjDy46E5uf6ikUT1n/6azXEw5KaUCH
	 +dlwWXWxkyD8v/7V75zpZkG+lbzDLiMPnAiJLAYFPgTwV6ykj4uIjdQN1Q4yjKnEnfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3137D1F01574;
	Wed, 21 Oct 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612414;
	bh=b+JiLH1GI+1IZm1hw0N4xC6q910doPI+bHiafqo2L5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QtC3B0KSn3bPkP6Dav3ifF8VUCiQklbFvA9H5byCS7hIkkhUQyJkYLlLh7VBdbelW
	 lcu7cwclC0fYjN1eNZg2eKbwKS9DSoP7CTL4IWbXIEpO8j2BZhpBbFkdZZWkZhTQ6I
	 D4neQbd3yjofp7gDQ0PH+OAidXx03YBQyYoH5gxIYapvSr+2pLQOZcAuOzz6upCuIc
	 G5b0iZpY8uBBpUdTagcQDeWPID9Vc6iUkR5umEKdswnbjqurp5Z+doiTFG30xaCTVD
	 p7V1hGVQhqaWJcxx4ieHu4vAxZ79zsqsLa1m2bSHuAEWD0QNaEYH4WNKkA1FeWERNr
	 BFhJQq5uSCggQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A13E43468;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:36 +0800
Subject: [PATCH 16/18] riscv: dts: zhihe: add Melon Pi V1 and V2
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
Message-Id: <20261022-a210-init-v1-16-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=3373;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=d7EQ/ktNo91zzKNFOZe9hjNhsdudvjM2D+e3uwJCWhM=;
 b=oVD0qw8r10190p6klC89dQf262fZpx98MsZZcYGgbrQzTu/FkSzcf0OaLgBMMnCg7PaKELHL8
 LomIEnurCukDKe419PE11+euyzvZkqE+Vpn9G+AmN4pioudra1vlMcj
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Add Melon Pi V1 and V2 with the UART4 console on GPIO2_0 and GPIO2_1.
Use serial aliases to preserve physical UART numbering.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/Makefile                       |  1 +
 arch/riscv/boot/dts/zhihe/Makefile                 |  2 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi | 55 ++++++++++++++++++++++
 arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts      |  9 ++++
 arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts      |  9 ++++
 5 files changed, 76 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c..445edde8f107 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -12,3 +12,4 @@ subdir-y += spacemit
 subdir-y += starfive
 subdir-y += tenstorrent
 subdir-y += thead
+subdir-y += zhihe
diff --git a/arch/riscv/boot/dts/zhihe/Makefile b/arch/riscv/boot/dts/zhihe/Makefile
new file mode 100644
index 000000000000..553102091d4f
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ZHIHE) += a210-melonpi-v1.dtb a210-melonpi-v2.dtb
diff --git a/arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi b/arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi
new file mode 100644
index 000000000000..7a6e6af0aa1f
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include "a210-som.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+};
+
+&peri2_padctrl {
+	status = "okay";
+
+	uart4_pins: uart4-0 {
+		rx-pins {
+			bias-disable;
+			drive-strength = <1>;
+			function = "uart4";
+			input-enable;
+			input-schmitt-enable;
+			pins = "GPIO2_1";
+			slew-rate = <0>;
+		};
+
+		tx-pins {
+			bias-disable;
+			drive-strength = <3>;
+			function = "uart4";
+			input-disable;
+			input-schmitt-disable;
+			pins = "GPIO2_0";
+			slew-rate = <0>;
+		};
+	};
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts b/arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts
new file mode 100644
index 000000000000..a88e9b949c4a
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "a210-melonpi-common.dtsi"
+
+/ {
+	compatible = "zhihe,a210-melonpi-v1", "zhihe,a210-som", "zhihe,a210";
+	model = "Melon Pi V1";
+};
diff --git a/arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts b/arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts
new file mode 100644
index 000000000000..71752471c5fb
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "a210-melonpi-common.dtsi"
+
+/ {
+	compatible = "zhihe,a210-melonpi-v2", "zhihe,a210-som", "zhihe,a210";
+	model = "Melon Pi V2";
+};

-- 
2.55.0


