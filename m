Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612412;
	b=AD3kOotGAQ2LbjKJaME3S1M8M8bkeG0JTuHsRiIzi0Aw8zVq4ml10FqY+9DKdddIWG1Q
	 sVW8s+24OYB20Ttblv9u05STmBxOzeDFRGUculqXcYzJGI6Hh+NQ90s/NaZatFn7ri1k+
	 Xjig4UiGrQzC5vuSjvgrW0YrqzB3ngK8A/IYdlUNLmA3vUz3+yM2ubomF8C0q1cf2iF8p
	 LWUMTP+TG3kcOqwOski9AsKNJDrshvJeuMwvTZkl59yg9FiFmbjqkxwxlM4JUPHJXyo7p
	 dvjNps4IN72FiwxsJVlz+zjewTS68lmCufdIQ4l7PrIS/2Wtfq8xD6R9Q1K2k0uMYpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612412;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D/80EfwAtXJCC0tZxo33X7RmKZW37FWB78bJeXvz28M=;
	b=Xhl9rB/u5BvINRi4/ZDHkNbhuHWfvAMQOwm4y/mn+qrk4zZZxStSaws5RflXwxBkqWEJ
	 il+IzxE/CmzRySOF5ASEeeXFhhiu1ZEwlLy5l3myhKnBbnbOti4vyjM5yXnEre+tLsTjC
	 GctEQ8smvJil1gKlM7kJWNZeIcIUOpMW+r5pFeeJFdQH0DGwZNZidSnUbvVe5AHo4EVWq
	 UDPhJvLHbHKmOtUIIBzqz+GtQE0HoOWOweSkRH11nC+a55JOPo7XXiNErNvv7vWCtQNCM
	 N84jJlzJl2zXQbrXR/9yRWxYhzs7a7oLMhdkDar33RIZ5yp85dVHWMl1tO6k73IAxBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lBgUBJ1O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45371606A332;
	Wed, 21 Oct 2026 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lBgUBJ1O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612412;
	b=EVabbBV/3jD29F/5fVcY+4C1sN4J9E0j+B9XBnlwIT54ybXUYKMqOBWxNERTulo91unF
	 dIYj1ycdSk8h3UlkeJ+8F/0VWFfmgnbgwTP18Eszz5DvaMDcHYvkNIwcl+chPa+MWPtT8
	 QX4TpO6QE10j8K7mOH85w43l6J4HKg7OIVcMlbDB3C4V5lTgeICtlxsW5lwJtHqAm86fP
	 DvvrjxWFDCzANuLY9MCGSCIaw7uG3w+KhNqvCJC1a9Wicho8TKMj+l+MrixfIkHKCQhPD
	 8HWX8OrFmOEhuuWnK3MrFJX/9RydncJfBQQAz4LnurLi5PKYrDiIUp20SGMMoNZU2eg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612412;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D/80EfwAtXJCC0tZxo33X7RmKZW37FWB78bJeXvz28M=;
	b=OKWAEdPl+XMmQZV/AhcAoOZAYXnyYztgxGPevmsN8kWmG2y83utsGtNzG+lun2IsJWnS
	 UgBuHoDvxi1Cb4nF9DTp8fSOVPR2yF34SKvXPAomHnnG42DI911dCmIPaH9gBrYQ3eRQv
	 DBLd5MWgyHTDm8XdimSWJXzTeY0GLcWM3TgCFvwKvltGU4gNSqU1Jw03tYe+3Ow/Kq9Wh
	 KuUygZ2QommoBUSDIyo4YYYQecP+y035UGsbBbt7c9e0kOC0ok7+4/GVCVtBf52cQyaGV
	 73aY0gmB/79jc+hK4cq/TfGys4/83o49GSXH+HAH1yITQpv+ESfNvzxg0NcRgcZUiBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E50841F000C9;
	Wed, 21 Oct 2026 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612412;
	bh=D/80EfwAtXJCC0tZxo33X7RmKZW37FWB78bJeXvz28M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lBgUBJ1Om5BFLXCNy6pHcnOTkfXYYjSOq/Yz4UXahghrDiWtFOTIhRz+u4tS4U/4U
	 LDp/RPQvsApZSnKNZ0fmfMbHqyFxxBamb/lzQN1EeJMqcIy0Bsq/sqMdRCHcFEYdq5
	 nE5RuSGVOvm4Pqq1wjrjuhP1LbDoqUkAiOwoQA8mI1x13flrx2c1tFdfq+Y8y2OYmV
	 tv96erDN+/y0fpOwiDTdkGcQhb0GaGYJfh6bvla8TP2A8Gn/5YVd67udyn+2UlR93T
	 1OE60l2N6rfkEKt8qGPV0TeSHq83I9IbSfqHVeGWs3pAaHGS4mUK/Lv/1AhrvZHEwV
	 8lL9TaeifnYhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 48E8D43458;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:32 +0800
Subject: [PATCH 12/18] dt-bindings: timer: add Zhihe A210 CLINT
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
Message-Id: <20261022-a210-init-v1-12-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=807;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=mOLkOh4/jpI+bhz73rcyph1kni8iu4RhyVF0Wak3gq4=;
 b=fRB4QCQ8y96T2eRxcwXJPHQq3F5ruy2w9JTeNEJZoPgG+ScucVtmRIxv8vKLYs7Ip7YdtZ2Yz
 BMVCuJ0xnJzDBWajZ3gI4APPkyE8EDUD4X5NkG8wNfyfcsFjAoUWJa5
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Add the A210 CLINT compatible with the thead,c900-clint fallback.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..805262bb6cd3 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -56,6 +56,7 @@ properties:
               - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
+              - zhihe,a210-clint
           - const: thead,c900-clint
       - items:
           - const: sifive,clint0

-- 
2.55.0


