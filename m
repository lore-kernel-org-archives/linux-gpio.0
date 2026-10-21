Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612408;
	b=rTANfjsvx8qsD0mFoWXA4aZa5RD7qd18kbMN3CgrHi6FkHBHgWSedQ/Wk8N7DyirkReg
	 OsR3m7bcbvGGu62/QjJDQI9GUs3ma0P8VmHJgH/ucfsCBPMjUPnLKF7modUM9y71rRZfR
	 X8fV7QvUSyry4scTiBrNngjBp0+owb2MuHUfkdX0o1/nAnLSLg0HxS9VrtAZUYQGIFdTZ
	 dfD3oodNzAFkYY6IaNk9g8zAc1xtJZabgoq7xH5Gp1oJfmR+Ca+4I08BDT+OC9OBsVwup
	 RmYa4M3qoi8BbPA7fxG3XMFwHdwaceCun3sly0bXLrA2O+u57CZuBRZS10WAzk7/1zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612408;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=RsU/Miju2jeqymvYcNJXTnmmqKzjTj43vuEKKcaUunA=;
	b=AmuqIQF40QmPjv9EK53NFkpdntvmvi9iXqguzqo+LEbPVVYBvTZJ+SKvjifts6Hkp9vC
	 zRjsXVzwtB/xNnssQE+QH5yF5ZitXuxQB0rq3TDofxO1SIERvfkEZBm59DQQoefdCIrPg
	 lLcrgaCLsDy+xHGwlyDU6+OkKLeNf3oLdjHTx4eIsYOdsqxd6/Pj2mbwNdJvb52pnZ3p/
	 SdDdttDdqqYsQ4chohMIg5qFHE/VRv/nY57ZA+0HFasTbxm0bp3xUaxwcp8kyKVrWCKvt
	 pGQ6+oCSHtnOrm4dgeWktOAvGZ+cvUDiFebe8HSfKzJ2A69ECGkO7RouaStNq0fomJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnlCBH3b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC6D606A337;
	Wed, 21 Oct 2026 19:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnlCBH3b
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612408;
	b=wPsfWM1mkuVo/i2ilRpytef5gUISS0jFdNQTuC215gXJOuIhQhR0GSEuKh+0Kh5GqBeE
	 1cJcmiiRN/IlymIrFceJllc6IexMTPNvAejAxsLrDHzsxf5Ukmta/DmzeLk9ClgVLIH/R
	 p7pdSS2Vy3AVs43zqRpH/JDRkIisJ3ZX0OfBMYVMMAaesPqPG4RVnx+J0B7JD12FLkM4W
	 yA63Pk5gAtsNjPMfqt/ir7OiJhc8RqYdvZCJFf5m84VAKN2sJ9dano751mxnrZd8Bn6GK
	 DHs6h6ZfjCFGTAhsEf0kGGB8Vf5vv2sMQ9hTOVee/RMx9JW0I1X9N9RiYvAaX/EHOcw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612408;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=RsU/Miju2jeqymvYcNJXTnmmqKzjTj43vuEKKcaUunA=;
	b=vw9GdsQlPddD3NbjBRGSwmAqGc40N7aVknn8W0FAKNtYC9RxTmo+03nwCXi5mrg6eujk
	 7+nEmqWAe7Ycg4dxysWpf0kCWOSY3QOsMdFi27TtpSSxLawocWGV8fAezW9MJO1OMfoNR
	 +4pXPzJW2Q8C9T+NSOUEGwtWlfqy2qGzB9tomqndmSpDSO022uOXrv2De9t5/7IDDz0mN
	 Clr6imu9TS19msBEHVO5NE0Fmij/VfzOSG/WFk9PB/5YaGB0EK1kEWcLnS5RknK93hUJ2
	 gmIaFr0M90qwlxNw5wwPbmKupVi+dMZ57bPrj49IxHQru5aX70jkcdhD9eZHl/GKVJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D78A1F000C2;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612408;
	bh=RsU/Miju2jeqymvYcNJXTnmmqKzjTj43vuEKKcaUunA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bnlCBH3bNTfL2w/5DKcbZS/2oAbxh6Wf8W0IFvfHLN7KsRM23UQbyCZRwuYADigVi
	 48vlh5TQqwlYDyjy4wTDXBignuk+5QnIcygUh0AnUkS96k1kJHFidLcWzPV3njsYy6
	 SaZKk05YLFYZTjfECpDJFX9tCzVXK3gKJCCg5dRjceH674ssyRKZpb9Ei7D5TguLWB
	 0G+2aqhDVdgJw6FdEnbtj6yRL1kkDYrarZSYncrCsgGLJKAKmWLSQMF4WYL2s5GI4F
	 efccX17QCjV/ee8QhfoCjIO4TuekWF/OuARuTF2VTnTOhhKN+7uPAxrOeO3V94Jlwh
	 P/HreXwXXDl/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DF21B4342E;
	Wed, 21 Oct 2026 19:53:25 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:21 +0800
Subject: [PATCH 01/18] dt-bindings: vendor-prefixes: add Zhihe
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
Message-Id: <20261022-a210-init-v1-1-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=842;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=78H4CNA6muw7rwfV33m2sQ0QfyIqTcYL4B8JahPXMn4=;
 b=t+8nmRY5jqUnjhsyJuU5bc0XAjgdW0Nc/aLBwFxClNEhBrv3hKm41Bh0UldozVyP7v1NVjg6W
 TYA3io+Zy/zDPwEFWFtpNEnG2PU5Aar5s1XUownQN7JDOebw2WOo9KY
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the vendor prefix for Zhihe Computing.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..21142578837b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1973,6 +1973,8 @@ patternProperties:
     description: Zealz
   "^zeitec,.*":
     description: ZEITEC Semiconductor Co., LTD.
+  "^zhihe,.*":
+    description: Zhihe Computing Limited
   "^zidoo,.*":
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":

-- 
2.55.0


