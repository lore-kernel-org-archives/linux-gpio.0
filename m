Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322676;
	b=HgqXTF7qO9R49/gNpvHnsXE3VvOcYyovrU7NJNPb2H2w5On9HVB+BXAkfej/rbjkBr5w
	 2qZ2Yl5wtcCvS3g2eS+BN4XEBkgNvbX3uxIeXzZxRXECib0uuOLkGlUvzzAOsXGMb1XM7
	 BNKTFfIJYjWMZdxgM2eLAYf8+otMaGcbZjbcuFk5FQfgzdBoAqXdKjPwcQY6SFbjBfixI
	 m7rACsSOKUmkcXQE0VuXzvRMbZtOV28J5wrN84M81Ia3b6O8thBpxsY9E8YO18myhHu+b
	 1vRCbwrozsyHb7TbXqmllOPPwEpA03NdJuWYFs8qWGOB0Mxsads/csp6XS5nwnFTq9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=7kd2hyoeBX9xf/X8LLEHLJQCEf7R6Q0R4GUKb7jsYbI=;
	b=mQE39QZ7dK47wH6S8723NW42kSHhoqHHpHEJIlLA5OXE8Q3q+RhvgfdLnJGyuuv08CtP
	 F3Rrd/3X7E9pXlgkaxcx0QcDibDsKXzLJdwj1wH5b6GVlFB3FxSRewhXRZhTMtO06+Rw2
	 nw8yFY69HJGNWwsWtj9NbNX/X3SdOlbYfOpS7zjhJpgVLWBQcEga1q+0Hq4kSw2qokrs6
	 ZpyN0ksBLoSMhTQ3NQQ3RXXzvmwC6nE+IeLjGb6sx/mnIBDT1vOk9LmgrUWpPFqQ1JPpB
	 u2qvUV5SlByxRiD+Z5SguU91MAvns3uoQx7x+NTX17BiMLr24CEIWfJyAX/ELkYjqVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=WH7DBRBx;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD40606A331;
	Tue, 10 Nov 2026 14:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD40606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=WH7DBRBx
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jP8s13Lzcz57HS5;
	Tue, 10 Nov 2026 22:57:41 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794322661;
	bh=ZVT8VBF9GmkjP9xQ1T631scZCe9Y/OD7BRz9Pr3x3Nw=;
	h=Date:From:To:Cc:Subject;
	b=WH7DBRBxLsPuuorxjry15PTghunFt9oYK6BxDvZAoaLYMhHkO525IFnCbOx6UaoJc
	 OsDBQmRowfXCY5d6lo9PtLDUOP7T2wF/NNFId9W5HbkK2co+l4oHdQxkiiIBtn5/vw
	 PY/pMT9ElKNxHY7SUS/5MNgIq3odZnMaz3RutmmfdBNsv4ZFGii+bEQEvKYkBY95ha
	 UxllHOzsXyMaI/jjFeS+Xh14lgJychZtizf6YrC8VHrU2D0RXeJMJkO7b1QANe/gsC
	 qsgckGy/Q7izzKaylu/CROaWwtVDG1/IvGwA0dZULQEhJqDaIG8ifyVgRcIGYKvvxh
	 Gen/8hIYTV1Ag==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6AAEvcuI005942;
	Tue, 10 Nov 2026 22:57:38 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 22:57:42 +0800 (CST)
X-Zmail-TransId: 2afc6af330e68ce-fbf17
X-Mailer: Zmail v1.0
Message-ID: <20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn>
Date: Tue, 10 Nov 2026 22:57:42 +0800 (CST)
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
To: <linusw@kernel.org>, <brgl@kernel.org>, <jelonek.jonas@gmail.com>,
        <linux-gpio@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBncGlvOiBsaW5lLW11eDogZml4IHVuc2lnbmVkIHRydW5jYXRpb24gb2YgcHJvcGVydHkgY291bnQgZXJyb3I=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AAEvcuI005942
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Nov 2026 22:57:41 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF330E5.000/4jP8s13Lzcz57HS5

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
This patch supersedes 5/5 of the v1 series; 1/5 has been withdrawn and
2/5-4/5 are unchanged.

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
