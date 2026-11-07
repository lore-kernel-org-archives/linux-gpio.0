Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011253;
	b=m1/16hqsArIC3BaQkTRJSLgxFIHLHP7fEg24iXWg8ukZSuclscaEGmal+gzIdB2L0h0F
	 aHquIBIckrwRBl0BF3XEhmciqdSBeKxwdAqSJNAZw8/fuKZX7QztSdc0dJ33RnzxFnRRh
	 +5awnaN2ENm95L/mj+P8JFu0R/I+T+FhaSLVBW0ZgX+S5BeC3+YiILULIPGqyep2t7Vwj
	 9vWO4Hnqmb73EU4YhrC5i9WbP8ia6XiUTNB9U+oBmlIqrt5QbGm7OOx3TlLiLgZr9DYZK
	 kRp1NQG1ToTXI8tIefzuPs6FHgr8haz331m2/dffJAoxn9tTysI7FU9sYKZZcBfPUfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011253;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
	b=0BW1pEuE1pO8qwpTqifEeKG1rhMI515Cte0nMDyqD8LElKAeGYfCIj14b+/lA9O4TKJn
	 ZmpuFec1YV1ylpcaYlZSeV2H+Dof2wNLyD0es6afIBY6naWPaYEEq6AMT7tk9qZ9At2Cu
	 u17/87GOE1L830XYOCN0Uipri/oYOsaPQbWvrVj68tN5M0wdBpEEyENl0GYAcE7OXAQx0
	 E9ufOtVrmh0Chibt4U8VSJTEJMN4qTwn6MV3JmSHS564P+G/O9kCyt6KolkZbQgrF7rv2
	 abB9AtTsDyMDgyztveZqTN/XORa1+dkF8NQoAgx3QjQ1wY+M/aKnzH54Duhix9mEopQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IQji41Si;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iAZyA60D;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C41606A33E
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 00:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C41606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IQji41Si;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iAZyA60D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
	b=IQji41Siit5vHuB3mLK9NXIdkpkD39NFpZsdmhkXW/CJNCAiKfHTh7ngEXMe5B5qS7tk0H
	lv87vMMCw2cFSleYMsHqychQeEZn85BVnQwvBv7lhMV5N3MRFw9ScXIrtWu5jRP40TM8z6
	jGUBrozsV4qoJa2Mi3kWv2ZQgB4LTPs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-jkxrs2IsPQGBvo7b1CXgPw-1; Fri, 06 Nov 2026 19:27:28 -0500
X-MC-Unique: jkxrs2IsPQGBvo7b1CXgPw-1
X-Mimecast-MFC-AGG-ID: jkxrs2IsPQGBvo7b1CXgPw_1794011248
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f568dee56so245803485a.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 16:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011248; x=1794616048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
        b=iAZyA60DK/Qecza9zHZiAqOgmYghvn8183sJlv1qvYndQOo2E8gfgIEIGykBqFJbSu
         PkpZQGHimxnN3sTYSB2f07zoaB9CwQO/Q/HgmC3QALeeggpxAbmuhsbuYO08KeMI0gZt
         4j7k3sWLc5rYIYthk3wF2/HxcxPWSdLU0z+/O5rF0VegEQ0VNOGfFp12TSquRIsjEdQU
         bppwPooOoC5CBAlCBjL7ATpIv1QswP5ym+7EIbEURb+33ROqbcCH/mZemeuHnga/oT0h
         0XeYnlBZwly4/mZ8txISkPrDqmFbDr9Riw7i7r49u4wIqT4oZt31VY32+VgjuWg5Kmby
         kq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011248; x=1794616048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
        b=2dW9KafGTvXlg+v/0AE4gCYXMYgY63BpvAM+PyDO794+kvt70zdASlI2iJg5DQDlx/
         kWdL/u4jzvGsBj3bC108n4MNXsh7RZIrQdexyA3pErKaM/YmLPFbra1SHMwSh2qnw9fB
         WhtwhSpu9WUAOSqdKNRpeFsPMB/IFrtqh2H6XpZJJ9rUncO1AwEefMRVcdgpQGLQpz5l
         rbtIXDs47lmMHDoldXdo1LB8GnjHHq/SW0xHlE3TD1o0TC+mfP1B8+bo4nhZSV4Xo/Qj
         AA2vtrt5Fve8qMlkTwQczNlKdJ6GBmDaoxOsykOySl3ehojLxl8nTdUMkYbuXcQQAqH/
         gfJg==
X-Forwarded-Encrypted: i=1; AKwUvBwBN0vzx10MLKr+u7add7iAmsacKx08nGUlIixhEpA5kpT6XpNzQwiN+fiICkXWd1wx1y5XhcAnMjy3@vger.kernel.org
X-Gm-Message-State: APuU4Z/qxs4z1P2k8+wbOsefaVLh4hQX2hAWc0I8N5001kTwxRC/WnlW
	C6s9EHmS+kueHE8ILmSAzIoSg8/C0L1CCNoS4yQF5b0pLS+FYketk73+X+RnQy+WaTlVvZiRTpb
	F8bF6Y8/pFCbCmyZYqyeL7KkQfb23WdTTeDerRsdtThCYk4C6jErZCOVMRLzue4c=
X-Gm-Gg: AYBFou1bShf7LXH7MpH408a5BAwJMoAnGMNaPrurvQeDCTq7Ud6FvCB4MAB3yJablJF
	uqYOY3L/8b0V/lomOgWr+WZ9iUBt7onouk4HEwsbltUD+cnoPdxlHY+L4IQgjbhymkLrWJ9MtMV
	dcxtbeBScrCs+89/SU7/vHjsybmSsymBwEIatJE89xDTZpO7fcDTP0vxHwD5loNOoDkDyBkpCmv
	mLmYYF+NXwviFZbN0Lw8KQqh4VSLCOI5fLU30shLMFIoNZ1cYw82DDoSOBvTqyXtU2JcgQzSgP5
	Np7qmC/eajJIKzJ7RfkTI2NN3hk0iuzpPJXV0GfH0oH30lNZB5ltpymuufaf89NST/0hEPseOB5
	9srnEB8ozBFVR1F/MVHOtzAvMSVN+LKO/eH1DUeHquduK1j4dxDwaj1ig6S4+66uN+bP9o6N/3h
	JdcIi+t2i6+F6Yy2SM
X-Received: by 2002:a05:620a:8006:b0:93e:d5c1:da49 with SMTP id af79cd13be357-945f3638186mr601943985a.82.1794011247609;
        Fri, 06 Nov 2026 16:27:27 -0800 (PST)
X-Received: by 2002:a05:620a:8006:b0:93e:d5c1:da49 with SMTP id af79cd13be357-945f3638186mr601940585a.82.1794011247091;
        Fri, 06 Nov 2026 16:27:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm254122985a.8.2026.11.06.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:27:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:27:12 -0500
Subject: [PATCH 1/2] pinctrl: ingenic: convert to
 subsys_platform_driver_probe()
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
Message-Id: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
To: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=877; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=qS7kwaZ5wh6601gIdwcEGb6zbpvJGdxwP4MG7PQygYA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFWTp3nPdUTrPJvBSdKhO/ZnvHFMFpqiUzJGS9Tv4Z
 dmbtWlfO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhI7UtGhkm+j/8kuD6sSome
 09n+9tHBlVbb5tQlz9FQ3iKUMe/so4UM/yumeln0B6hXrmC0vWC46/dB0fglDgpu5z+GtnCeW6c
 awwoA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d8ee489897ae..bdadb343c7cc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4698,9 +4698,5 @@ static struct platform_driver ingenic_pinctrl_driver = {
 	},
 };
 
-static int __init ingenic_pinctrl_drv_register(void)
-{
-	return platform_driver_probe(&ingenic_pinctrl_driver,
-				     ingenic_pinctrl_probe);
-}
-subsys_initcall(ingenic_pinctrl_drv_register);
+subsys_platform_driver_probe(ingenic_pinctrl_driver,
+			     ingenic_pinctrl_probe);

-- 
2.56.0

