Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612410;
	b=cjCCIU2dh1XRBTJQul34Ow8LR5K79PtJB+Zerg8J7Q5WoFENSWiAcXHPjRPZFTcsCJ0D
	 7GlGXtPPp+s10olBNccZEj8wZVZE/pEXTl6MikEn974rKJvooOnrwK/PzG7qlZ+RjZe4P
	 uD2abhSWUTUr8oEgw6BgjSvrFCSvyRpJGIoCAcSbq+GgSRMikR3qJN4DZGgRX+LNvZimj
	 fZgaE6/Ngx1NoY4XWmasN2rfWRk9BT2SuGVi9IvEzZ6N5Ohw4TsEu+5TIp4bDCKCWMgCn
	 5EUHjshGlnuARBiDCKoCigluGlM8WGqo7JZeKZjimRUxx+tN/ZrpiS6x7uCj8rN9Dsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612410;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Wg/4rCc9Y69RwQr7t1OslmfPJs2UBZmRz8gauVCMqkE=;
	b=ME/oU6/9GQYcbho1A/vMQW4+VKJ4ZrtsQArStnGn/FfwNpP1+4Bt7CCEjG4tcu0KoePj
	 FqIQjG8C6gJ0Jr5xqD3gO5SSUB4G08/HSIx3edOoGsbxiloY0ugmLHysiV16AGD07ZpNG
	 1nUyoagcUXxWAe9EmE54srRnBBL3k/CldRLDfNSDxyFt/PEfHwsO3xubLf/YDc0qxqAuB
	 1x848POYCu0gVkCcYzzscuKeadf8QuzLIBLm6w0C8+va/NMuMV5SenNPEMRBekA7S1OHp
	 I9NtwO29vYz4VgE33lgCYP1Tw/lE8wRZoh5y7ezqrTu3kHLH7BG+o5FSbsG2wOnJdRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FGZi8Z/8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32806606A33D;
	Wed, 21 Oct 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGZi8Z/8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612409;
	b=Xrft7SAN7GeVq2XZSs0jhqovMjWCqVVTMaSoPAc1yCLLQiezu+gEmebEQuIUILvoT3OV
	 u0RMxrpTqcJ8Psz7DOLKKMvYShixzsL+jUhLzu1TbfKObO+cZ0IoCFymluJWdkBCxf4XQ
	 U9+QcF2KTW1q6odM+Ml2kyK4rkC2yOXfjxGlCokfFXX90+36pr1C5mWdxA3MIOVVUuI+f
	 Zfp2nRnGkKs9yegqCSvyL+ey7G2Tf8KhXf8hTvi07EJnUiu1gbUffsQP3KQ7COdokevCz
	 fXIY0tPxcZlGWLBphhJcpyFCxOgU8QIY4k+8q99HyGmgayBzUZrZQM9ZzLERwT/MTZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612409;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Wg/4rCc9Y69RwQr7t1OslmfPJs2UBZmRz8gauVCMqkE=;
	b=aN4lIABhGqQkvlVBPy/0jBxYffrqu4raHrDcYvXDY9uDSD2DkxNzvtZW6gi2w3mjlfh/
	 G+I6vbzZ6IKBowpGTKfbKs3cMQ3uc/q+px+NoNSNNkneISzNi78EOMEECJlG7qwuHwUmt
	 z5CjbvgHYLF1l587QoQsTivN+25iGcKcgFWyjvM+f5d5KQnHlfDzz9X7W+dwlP8gwxMNm
	 nL+/BD28g38JjKCfzO4YJTVvcJKL9HxydZKgN0VbAY7edvI2OfO64WwWisQSJD6ZK6ZhL
	 V/6JzP30HK59+FuLXLpirHdARlP87NW3AP6HxszU1oHDAnNYlbby/j8AkFCqMocxKfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D66B1F000C5;
	Wed, 21 Oct 2026 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612409;
	bh=Wg/4rCc9Y69RwQr7t1OslmfPJs2UBZmRz8gauVCMqkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FGZi8Z/8qStcK4FTj7AX1MZTTcibXZRES7jbDK53tJwRY3f2SvMQChhbR3DN51rBC
	 fmF9VXcVAs4CIO3pc9C+Hd2BpkmUAWs4D6NaWKpZRrtlRYg71h4x02trPP/nSWDJhv
	 z9HUnwC4NlOorN16CdCryU8/su5hImjLEvS/Bq6D1PMGch/2mLr3BCN3MPuRXkA3dt
	 epBhkCnRBbMBNtEJFm2JX05NrTYDvrSOy9xCVR9KgG7DpCZ41RR6ieYESd+SuTtKeK
	 iXFoI43xa1WgSt5FwbvVol4uUYLin2ziZ5AE8LPZc/4Jj8gUv8CU1nDVhVUTkSD5hg
	 N2hGa7Gp90Psw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 37E3843450;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:30 +0800
Subject: [PATCH 10/18] dt-bindings: interrupt-controller: add Zhihe A210
 PLIC
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
Message-Id: <20261022-a210-init-v1-10-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=961;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=MYmNcIdDPzIqU+lFcft+1pLSNPlzC5ZsJ4TFo0L1GrE=;
 b=JH/hvz1BV8NhHBfvKeZmb1NH7G6Ps7BCo3G43K5vi0/E0sdkdrtnQHEC3ydCp5x5lpMyPPUYZ
 e+aje14+RJdDZtMfLiyyLbyAfpm6DcmWIxCM1H8BeMaq+hrlcjbVR4+
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the A210 PLIC compatible with the thead,c900-plic fallback.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb691897..fd5b61db3f5f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -80,6 +80,7 @@ properties:
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
               - thead,th1520-plic
+              - zhihe,a210-plic
           - const: thead,c900-plic
       - items:
           - const: ultrarisc,dp1000-plic

-- 
2.55.0


