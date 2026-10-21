Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612413;
	b=uS9VSOYqC+ibsMmyvavNe6mzYgJsgn8jL418Cl4ShV0EZbhA9g/lKKNi3CGnJ2KFjkCV
	 OMJyFB957R/Bg1WioO0xIrIHJiuexGimvmk7N9W/SZpg7KqSfuENNdj8FGBewik2gf8oZ
	 CVANQnCgzAoOk+w2HYNbRmzNTuNYCE89KtygDwtZyAECNwKu+UiQ77sqkOvWIo6dcK4bz
	 lRirJm4xQpt7EmCs7maJdcFI/64Jt8qxzeyPg/+SxVlUL7Ko49bZE/Nm2iSHhikduYZnw
	 VAlTEni3ZeiouLjqDU5ouU/e25ZoFQ/1v+gw2Yf2z07l4wDX/UlUJkwljQV6mgD/9zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612413;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0vkUTGj7ykL7XElJOAN2G/XIumpVE8CGAihKJjHC6lc=;
	b=CmiIuOiH/dqHGf02mXBx7rXCvVAfTga5HI+j2S3HuqASYdjDg3NfY80XQTXLuN9/Gttd
	 3eXVP+fVWZSRcxz0FcHVJ01vmGNQnZAQ7T9YWIJBmXzL7QzlJYyPNYO0KddHlbIqlmYSQ
	 TzpPVrK0bTS25k9DI5a/pwqHIKKgVKHIEsvQNI0SVy0/l84JcJgsFxkXs+oI79Fx77PoA
	 qQT0NdZFVJtjoBt7UwlCI7RVJhWQ+8DKpXece/gT5M7a/zT9e+4R5JIlFv+Z36YIiKFC0
	 zgFrw792b5TGpGmaKYlQROOzyWLwO21Uxk1+D01zEfKDZlLL6pb9eNnnl/So+c0IK8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXDP70QL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D91560A2634;
	Wed, 21 Oct 2026 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXDP70QL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612413;
	b=mH0zlaght/GTiw18+aNKzYOvmZvUYi8z6xMim57Fgaw+yHiyvd2BaU1tqLVfkVJHj/5C
	 rq028ua4wjdlhuEm+a5D/AtDNoZFB8/O4GIwdfTZELfSI/MtIZSzTYURl19Ug/q4XeNVt
	 vWCFat6lN96cS/QW1Nw/7xGEgeTCRZ50WF1jZoaCDPHzas1IsYu4swXgbeomlGluRPUrf
	 Tj8aMbMQ3wgThiMKpoKtcIL9EMiGR+3Xyfx9pTTlkhh3ub1XqMIj4UlHPkVcf7wyV14ZU
	 CxwYlsUBIyo74KrLFTNLHtKFJOoK3rTZcxNQbxFm1x5vgjMrRzUs/g0zY1Qe0b642SQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612413;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0vkUTGj7ykL7XElJOAN2G/XIumpVE8CGAihKJjHC6lc=;
	b=bJGrlUgH63XUe2LCRsnrBcPqBPNZjuwBG1JOVKWdkF2CywgIWPeF0XTHCKrLok7X7E+m
	 7g5GQBoRXqgtjUmv048w2WegVNAS14RmYllq3tqTN0WUnIjP1pav6RjNJv8+qsNXc5l7E
	 acfv4qilgIE/ixBXfYjRGS5PMCM/ikC5zG11jrS7q7huSvLLEr9l+lnqzVLe4q2pvoVWl
	 XXorp6DA9D2CMKq7ked+mEMQ5H9PsMnMe4klZe2htaEiYvLKQrF725RcBdlXAOFXDAn/t
	 1mklmZFis0mZDzgLa5qbMZI/ZAjbGPFhdRRPQ3NE7Ct8sYR3d60e9ZPTZeeNRFuMKzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CC471F01577;
	Wed, 21 Oct 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612413;
	bh=0vkUTGj7ykL7XElJOAN2G/XIumpVE8CGAihKJjHC6lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KXDP70QLm/eT7Uj/zet7JSLsgYZ9WzeYhpqYVkhd/sKiZWoWq23/RdpnqdTk4vr1h
	 l5e+n5K5U3h5nCaN/Wu4f6X8b5ioHjrEMIWrxbffYCa3xvNXm0Wz5iNq4TKwzMqMof
	 vd8SAsHkm/xkRVm0MVxH7G+y2WloD7OOQOPSpz5fhbUwGT6Ma7DnEyrnb309YNdFgi
	 oWV3eCFo9cF5y4VfvS/qJokJ/Gz3H0LoO1riAX1vFL40ZM4pq4VbBE/lK+07HQeeWx
	 bqn3XMmUtUScdXbLTUzEIMa+yMpyurbLOZddFuGQzZ90qBg6gOb+lw00yZz8aGD77g
	 87RdBUXvaDnkg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7BBD943470;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:38 +0800
Subject: [PATCH 18/18] MAINTAINERS: add Zhihe A210
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
Message-Id: <20261022-a210-init-v1-18-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=1169;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=V6Z8Ev0gcQ0r2yYs+mWTjEjLznl2g2dwdtHJ63ANCKs=;
 b=Di15BnB3X6xsFswYVjWNhBkyYaNeNMuez9huqeW+b4XDKwnUSTspd8HoIu5BpCglT0b/YU6U4
 ZSBAXy9IWawBK0XdUTZlacSXjqQQPeKd/61Hz25Zh6gEFreOUZghqV3
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Add Zhiguo Zhu and Han Gao as A210 maintainers.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..97cf956fd632 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30115,6 +30115,22 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	arch/x86/kernel/cpu/zhaoxin.c
 
+ZHIHE A210 SOC SUPPORT
+M:	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+M:	Han Gao <gaohan@iscas.ac.cn>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/zhihe,a210-*.yaml
+F:	Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
+F:	Documentation/devicetree/bindings/reset/zhihe,a210-reset.yaml
+F:	Documentation/devicetree/bindings/riscv/zhihe.yaml
+F:	arch/riscv/boot/dts/zhihe/
+F:	drivers/clk/zhihe/
+F:	drivers/pinctrl/pinctrl-a210.c
+F:	drivers/reset/reset-a210.c
+F:	include/dt-bindings/clock/zhihe,a210-*.h
+F:	include/dt-bindings/reset/zhihe,a210-resets.h
+
 ZONED BLOCK DEVICE (BLOCK LAYER)
 M:	Damien Le Moal <dlemoal@kernel.org>
 L:	linux-block@vger.kernel.org

-- 
2.55.0


