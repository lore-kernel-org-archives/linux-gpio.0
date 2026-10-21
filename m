Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612415;
	b=Eeg4eIvdVOyJH5GW8Uy3SPBzhszqwu2/fNvla53T6Fv7paxtswG1PmK5xD23AXFzG78R
	 JToEG3K1OTDuruDkeq6Kj/tfq2lNWvf0jFNHKPIenWf0L6CdgQ+JVxm56AuDIzffOTqAu
	 WbUD7bQg7Rq8K91a1k0ujT52+JL6Wam+gz7OlwsOdhh2g+LUc91pXMU+La8V6nADvywk0
	 sodJjOneHx4r00/BG13EcZEsJxqfNSDHlMo09w1IK+flS3a9x21Y2LyoKwvSpCpXjU+iU
	 v2129hLmd5DD57/lVaJoBKFxNa5ys78kWaIWKsj+IAN77rUzT+DdPEqLTlkJLTkdIZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612415;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	b=rW4IXFvmAmCZ34vw8a9uSCwWnnMZx5YbvOp0ADWwYNY4cqF0KN83VRqu1Vk7EF2Dx7qK
	 l92UrWcWMOEkrYpoNk+SragxklKQUzP6bPEy9hNbws6CvVjmXih+6BGYDnITGBO317vHI
	 yyVoQQ1p9OWen88ZM0YCwt5DgcUxGNAc5oUFqAJRoxKO+wQebvbvZ5UQG7KEslhVd4ymk
	 vdC1xoj82Vpjg+ukEGAY6CNHVpip3s2Q4gBXJ5hCHNRIHIYS31t90aysO0ctVv2SYHJLs
	 MLSII+Ljz4fKEYfcpKbU/pm0iGFikc8dqGIkZnQLrAlb2b+QwFiKO+Upx/GLL+VuH0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhLuSc4U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0160A4ACD;
	Wed, 21 Oct 2026 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhLuSc4U
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612415;
	b=iyEp+i81hyWqzy28aOos2CvLpzq56vl3i45N4uFqFKu3g8FUJs5OI38UBqNmcdL2vSfS
	 QIkh0/hmy0uiQhCACjkLqW1vvAra6aLG5eIWDVTdz8hv0jR1LbZ5TNv1bdZv2p2g7J+x9
	 UBvernSdptOAw0WHkXIXXs4f0uPjYRbV3ymD13VbcDVE6Fskge4qZgV8di5nxqeCdkFma
	 K6FlQr5nQbiqaH1s/A1aP7EWlHed9Eh/AmyV8Ft5iKtqOzGhsxQd3P6o7MuMRyhO4sR52
	 q7ec8vITPewYnycYF6YNhBjYCM2UJhNHbGMgmh9Qcg8gIRLyxorAIzyDgBTY4wihAug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612415;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	b=i8MxbxIHq3vcZmwJ5a7AhSEObbQ56xOFv7VPSskov+M7uU1ldmP6tmfDn/8RMvGVr83y
	 8yqL2uT+3Li/1EZQfg7kwkyMevWNBGBGcIQFK+wxPdmMhL7bUcJcdKtiaBoPnxeXAWKJy
	 ydAbzKOkbWOFej2ULqRMk/xrs/1uD6EOAGaAZImtT4/Oxxv7YSZA8qJJnP+Mq8sZgi2wF
	 uqpQ0EydeeFlDFf+GVGtYH816lUb2/r3jqkdgLGLn0b77QNiWqVhQqQz625Lx6TDGl7n0
	 QASUsAJZeeZ7uHNhq0OsWAqOUJfvQRA11CSN05OhhH3oTMWMQnNg71c39rzbYSwOUbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AA2A1F000D4;
	Wed, 21 Oct 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612415;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bhLuSc4UEo3I92a7vSoSv14w74ZUpge2/fhF/uMi8aPQ1UKAirHeLvIsmTgBJuj16
	 YlC2it2g45/5n/ydbatY+CbENqoMh7U5sihAd0XbfD90Uxlja8FwG0ODCa1BhE70qw
	 PVSK7QsSrBo3e2JPxm35vAcv0I8Qxnx5A1twWjn1HgBjixySPL9hVg8U+CO+hMeWiG
	 mzv8tSe5gLpgZfkhgD2YrK7QryBxOgju462Ic7AO3ihJFsy0PKS5BXvn4LAvE2YiLI
	 /+ycUEPs110/wpzrN8B8SxJKYeStI0p42Jo60sd2Chc4lpjCsNaVa/pwTNj5eDfCmr
	 ihW+2QMo2vq1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6216E43464;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:35 +0800
Subject: [PATCH 15/18] riscv: dts: zhihe: add A210 module memory
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
Message-Id: <20261022-a210-init-v1-15-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=777;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=YcgMhPuDLQowVTt+MvNEeWTBEwtrbKzVnPLSZwTdXCU=;
 b=7FVapF06qGWWFbpf+pvIp7XV4KNu0FnbhwW/os88PUcpYDhxrgEmJkSZsfNWjDtcyyZNAO5Ar
 7UVdQqHS5UsAL544TFhau3wgzJoAHEBHkfNupO/IKz+REpLLwdie55N
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Add the A210 module memory node with a default 4 GiB range for boot
firmware to update with the detected capacity.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/zhihe/a210-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/zhihe/a210-som.dtsi b/arch/riscv/boot/dts/zhihe/a210-som.dtsi
new file mode 100644
index 000000000000..a77447e402d7
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-som.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include "a210.dtsi"
+
+/ {
+	/* The loader replaces this reference capacity after DDR training. */
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1 0x0>;
+	};
+};

-- 
2.55.0


