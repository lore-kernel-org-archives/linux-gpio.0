Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764598;
	b=0yuvPIFhvkHc7O9Eh+E4NZOs9U4bFAc2Lw6POBSKLPDEInmr011XJ0WmztPBfbNfkiFw
	 a6GY4EDFMrxV4wHnZLtbXfsRfCygrOqkduelDR7fEb2Ujb+TRUPG3S3XkG53/rLomK1sw
	 R/t3nlJu/iDR7UTxrg0Kk75InJCKJFiWYpzViJKnnJVOohgAL9jgAAyHmCbThZ1C6JeED
	 MtfQGDqCTDp5LHWhgRmTdt7tbPl3Qgk1FAttru2XtvNneK1ihpEX5/XqTKHw+A+taP3hm
	 xJUVTeIX25NDUi6nAiwMafkp4qhF0BPaPDgu2s8IgnXaGY0mtitCuAJTNZ41dGhJbVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
	b=vbKvZxVmSPtmWg++XliO/MmcH2CLIMpOdBAz8tJmqd7JrfOyxIPnOCauML7FSxe+OXvg
	 BMvtldUUQK/BeMghrHmOk040qRWlnUXkWMuGB5eqY/qFzO31q/Sku4lKA0UAF91PPbBwD
	 avj2gAlacJhzXf/Bf8A9G+pIhFjDnSfsGEUyW7buEUrX6DxcCnokNJCWGw+vqh6TirdO0
	 /qj8ljVRPu8nYahjuTAHQmcfktvh7QpAmCWxD/xTCE9eeVPbQ5zNTBykZaelBA5oG+GZz
	 xQ2zWJfGJIGPVCtINceE4QbsT/QasKLv2XCB3ONfriv8c091qEhAg/Bovv8ib6FN+nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9vPGd20;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F30606A32C
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 17:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F30606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9vPGd20
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso1628395eec.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764597; x=1795369397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
        b=j9vPGd20QA4d1srp3DoZpoHFs2xzS/ViN3RJrX/XK6MGZwKAO+CMxanOpdescGz1Za
         uwzbsVA+H5Lh0x16eM49DuYJp/q66ePhUzxJievnH8PEodeslp9lPe8F78hpjPQSJoPH
         Mjv6OVIzPf2TKxeGcR58vtCzvtB14AIsi1/GYSssX1IWSRfWICjtDZjGIlMaKji1flkO
         4ySJsYSQa9F+i/WvDeNyp4+4vqcwhVE/f3ia58jEDAuSIJ0+Pod0jcJ62K7XKTz5Qril
         Dg1tOxu6DdHKahZersMMAGxydwGy87vTS8Xz4D/hptOR5j2JwfEd3OVD20LwnvAX3yAf
         vZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764597; x=1795369397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
        b=v+IF/RlKAcn9MS4AHSk5AYHV+iiqQwFawgj3kJO+Aw2FEGGpvDA6I6lWyRaKC5BxrJ
         Wmk1Xat/KGq57DAGjZEV6z9aUJb2aS/mRZMMovrw3NFo89L5CD8gLwDQueEubtkxuHXA
         TcMireRHBv4TL7y3uxpBnIaooi5yr8+3kqVGNcuuCBnPQ5CpzmMk4pGqWc2egMcqWRC1
         RWmU6dz5LjwOwfn4wnstgjWvhIS6cjM+8QhEFZbzx7L1Ft2AOtI0C2p/Idcd4V5k2uag
         gR8FL7A1+2tv4LfIjiQjQDiIfuRx4NhPaj2FKyKZve8WvY1bvC2/wvBaEoMtRjNSWlsA
         r0LQ==
X-Forwarded-Encrypted: i=1; AL+hErE5xBm/mJRCNMxdBaSGIOE7fObhStuQuOIsQln0x01eDu6V9kciDaEbtdIsoD6MHZP2G+/2Fl3mU01R@vger.kernel.org
X-Gm-Message-State: APuU4Z9zHtYFKsU75k+dv+iGcVqSsFYBKP8LwX32hut+Vs2WoZxMP2WL
	sfLhhiv6N0+dd7YsIg62V40br8EddawlCwLlCortoHXxEpg3xj/9YHNT
X-Gm-Gg: AYBFou2idJ225z8BXnJGdienQrW3GySSPXNCmylFLXs2IlbKwxQyiXoivwkd1/tGS77
	bgEZWbBSDXtM3N3J60v7YjH+gV5XqkgT7fA90DYWXZ7UDfuFZFxh9fPWljRPhwInq2t02Yg3nI+
	GEMYf9iW9akNdk125w9oflKvJDE6YSpMp9Z9ikra4/vJcp34nmHLs+r9FcjjhBjVIlxUE8qK7zy
	eLhhh8x6AlHNWDQu9djxYVWIZYxyB3c1vmvQjxTsbZKQBqoK1sMc181CEH31Zc6/h5yPzBM+r9n
	8sBEQstAn4YwCZ/6A9YE/kVMj1/cglHmU3BN6Q4m8LcZYTIwKjiS2Fibs3O7+AIjuZrNdoKR8xw
	kp97g+TjvnB40njwqVsVwB3+No3sxK1NFREZ+toJ1RaEupERW64w/N0uziOz1Pxb3GWJ9BijLKi
	QEOrE0DZMTlOfVaYOC+RejFbX4GC7dTh+WUbYm6ciz1tXDADrRrjXjnEbgAWS79bRbVm7ln+xKg
	vjZt8tx4XepqFjmujRZb+eTl2BuLgNpaaH77gOZnVVVcVfQp9+ERtcR/Tf0pPiftVcOWFyPAS6I
	pmhiR6oVvJr9s82Xm2KrtgSr1r0km8XU3FiB7l8xZQiPPy14CtROYc+rURzoLP+YQuOyopZcN+H
	bIJrGPH5/vNR9Jm3iCTO3hBevpey09/6Xfy2GZaH79f3uIobV/sTMPQ2rUGcVA+ZljtBA2Uxado
	ShIYj0dMt0u/CThVy9zDbLHSrLdw==
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr9335361eec.11.1794764596860;
        Sun, 15 Nov 2026 09:43:16 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:16 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 15 Nov 2026 23:12:36 +0530
Message-Id: <20261115174237.48908-2-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115174237.48908-1-surajsonawane0215@gmail.com>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
function ext_mclk1_c, matching SC8280XP, but the binding enum does
not allow it.

Add ext_mclk1_c to the function list.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bc7b8dda8..5f7870fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -64,7 +64,7 @@ $defs:
                 qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
                 dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
                 i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
+                dmic3_data, i2s2_data, ext_mclk1_c ]
         description:
           Specify the alternative function to be configured for the specified
           pins.
-- 
2.34.1

