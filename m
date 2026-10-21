Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612125;
	b=A9UQ0FUnkZ7Z64Tk/tz/jdx+ePS4mrPduySASe5BBs9p2k/MjBjwIRDlocsEHrPBIvmg
	 BZXFYi62Jg2tbnzaosDwWgZucVKDSpCYnkDZZkO8TpoQ9fcrCQm/XtvtgStJZ4Z+irGaT
	 ZsRsS6S/X0ErFeZ4KXoRTq1ax/+HC1teEp5xsnfhiTur8Jd97q7+rbRpHROscvxs+wjf7
	 bUQtczLJiDAGSDGWE0eb/ia84xa48WT1j/9wizU19IalU0SCdXNfttLbsRnjM/TIA31ER
	 WvNhztoP7qPHXiO60zCu7gfsAR1NC4vNvjN7X9eN8qo3GgDSYdQB0Vn7CJXmn9PuQmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612125;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=Wg/4rCc9Y69RwQr7t1OslmfPJs2UBZmRz8gauVCMqkE=;
	b=c/7uWWRNARoQOCxJpaEVOKboYr7ZMWGZUvNJxrExnMpq3ro0mqRTDNOeqLvRzZdlgZ0T
	 ii0u4qIe13ooR4z0eoQgmXLRlaPkygSitEUz9LWWy7WSuYO4XbJM1m/QxkUWPgFn6U9NT
	 4+8+qklrJh1aBRFL/DkberzKByZlxv/khcco24HLGwIPzyVdXFq+rvyshXl2UgRU5nFBR
	 hRoM8s0GeTP5zGX2zlADjA+qh047+NhZ3hEyHbFFTo+YGxapkPCSevDDNpTX0ZqM0YdnI
	 2VX+AOXFkup5SxI9AGNjyJNOKRMnVsXeJOLg5xIjoO9qRtSCVaM2QhDvmSMX7/Xvk+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC464606A31F;
	Wed, 21 Oct 2026 19:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC464606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.48])
	by APP-03 (Coremail) with SMTP id rQCowAB3gT_6Ftlqxu5hCw--.4480S12;
	Thu, 22 Oct 2026 03:48:22 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Oct 2026 03:48:18 +0800
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
Message-Id: <20261022-a210-init-v1-10-09fb4d99da65@iscas.ac.cn>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
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
X-CM-TRANSID:rQCowAB3gT_6Ftlqxu5hCw--.4480S12
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWDGFWkuF1fKr4xGryrXrb_yoWDXrg_u3
	WfAa15Crs5JrySgrs0yws7Krn3X347Aw4Duwn8KF1kJasYvr4Y9as5G34UAw4UWw45ur13
	XFZ3JrW093ZrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9AFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
	C0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
	6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
	8vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5
	JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	YxBIdaVFxhVjvjDU0xZFpf9x0pRJ3kZUUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBgIHDGrYxtWX2gAAsj

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

