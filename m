Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324556;
	b=txc8TYG20njGoayuf3LmRJZi0O8DmRqp7dnPGvjfqsRTkgYgO6VH5fkc4adX6nVHm1Ti
	 GGIQygiDvA2MTaERZT7XRfMOGiA8rz1iF0S9MROb/FKKLkQKlctaLt8mhKO7I/6aroanJ
	 KCWvEcKsiUX9CEAJWFNRjCDi9dkO+0zioJFr1I04hyCNnNsPP/MDsgnzt8aXqVwDqYY1m
	 6p4EAKwWrK1UiNDXzT5aEZAlFWma5aLPFP9MlH/wDu0CnTSjw+lsU0fd6nsVgXj5dQJMC
	 0MT+28Pg0yDSBML8w+QZus2aLPXigzQeE4RP8Lzjdsl67/JTYiyfHec9TuUzvNv7p1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=ojmfQEgabq7LjYhH/0e/WnDqt5DoTFwwRvbtK/l+cuQ=;
	b=Y9J1gp5lpNRtJP+jfc/fb6+fN5NDA27BbO1k6J++B681DRzxYxuXUuPUz1M03rw1uHc0
	 SgqE8tw/4dDQCy9SDm8igICi1h+++S/XK4e3MqAUo9y2qMXW9mhnD8lDljpfWyhWTnfdP
	 fSm86dbrYJ42S7b0tpPdMMvcW4IFpZZuHuRrHKp8SlYVShimeOzN+pTvSrwqZjzceHXcf
	 5MnnZnoEwsXF8lkLE2xJbFuSJKWBtdVUbfg2uyIqxhbHTr0MvlH+ZBfG7SNoDU2mOD0Bb
	 Zi9VGDNUGdxnvoKuBfm6Tuy7ZJzbiEMHy47Tqo8vMVMUEBT0/dxonkN2RvQ2/UOpQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=f+weS3Bw;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7447606A31C;
	Tue, 10 Nov 2026 15:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7447606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=f+weS3Bw
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jP9YQ44Xpz5BNRx;
	Tue, 10 Nov 2026 23:29:14 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794324554;
	bh=fufO+gX6QS4vo+PTSpCfSfgRsHaMCX+Zwe2EReJIm4s=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=f+weS3BwTi7EjVvJzjg8og72BGqTcVFu7uNqdJzjcOUTWkYio/x8UlMx0bPNxTNSK
	 Bp8H74HZsqovweks1CR6c31vfZE+nKPypz4/eqlhn2aohJx3yPbV2w7oQhxnXpR84z
	 88a84ehoSoS3XrAKGrvkJcgoiq25M+fERztdLH9oSncqyuqN1QOgJHk5b0tqNISvti
	 li4NzX8Tc6FcZQYT/XNq9gm+MprVGsobGEhRNqKw4FPH9OAfVMY/+B6OQFc+ET2gV3
	 YIuJohuOnrt8GsYkLROprdJPNI6gv+j7PpUTVYiLCoF08cHRngXKIHNGY3B46/yXVD
	 p6to1nXbsm58w==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 6AAFT4wR023884;
	Tue, 10 Nov 2026 23:29:04 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 23:29:07 +0800 (CST)
X-Zmail-TransId: 2af96af338431b4-1c7dd
X-Mailer: Zmail v1.0
Message-ID: <20261110232907733D52XsR40GxjBszev8WXDA@zte.com.cn>
In-Reply-To: <20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn>
References: 20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn
Date: Tue, 10 Nov 2026 23:29:07 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <linusw@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <andrew@codeconstruct.com.au>,
        <wbg@kernel.org>, <opendmb@gmail.com>, <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIHYyIDQvNF0gZ3BpbzogbGluZS1tdXg6IGZpeCB1bnNpZ25lZCB0cnVuY2F0aW9uIG9mIHByb3BlcnR5IGNvdW50IGVycm9y?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AAFT4wR023884
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Nov 2026 23:29:14 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF3384A.001/4jP9YQ44Xpz5BNRx

From: Shao Mingyin <shao.mingyin@zte.com.cn>

device_property_count_u32() returns an int and reports errors with a
negative errno (e.g. -EINVAL when the "gpio-line-mux-states" property is
missing).  Storing that into an unsigned int turns -EINVAL into a huge
value, so the "if (!ngpio)" guard never triggers and struct_size() then
computes a huge size.  The allocation fails with -ENOMEM, hiding the
real error; struct_size() saturates on overflow, so this is not an
undersized allocation on 32-bit builds either.

Use a signed int for the count, propagate the property-array error, and
reject a zero count.

Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
v2:
  - keep the declarations in reverse christmas tree order; merge
    "int ngpio, ret" (Jonas Jelonek)
  - propagate the property-array errno when ngpio < 0, and map only a
    zero count to -EINVAL (Jonas Jelonek)
v1: https://lore.kernel.org/all/20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn/

 drivers/gpio/gpio-line-mux.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
index b4452d956bf0271d25598de2117c0db73805aba6..00b69632c4401300d11bbc296306df114d18c08f 100644
--- a/drivers/gpio/gpio-line-mux.c
+++ b/drivers/gpio/gpio-line-mux.c
@@ -48,11 +48,12 @@ static int gpio_lmux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct gpio_lmux *glm;
-	unsigned int ngpio;
 	size_t size;
-	int ret;
+	int ngpio, ret;
 
 	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
+	if (ngpio < 0)
+		return ngpio;
 	if (!ngpio)
 		return -EINVAL;
 
-- 
2.27.0
