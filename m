Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792872058;
	b=Ehhghv9piXL5A4tzII1H/yRNPkYyM88N5Voh0nrWWx9Y/VhNrNoCwN6fmtmKQ9Xj006e
	 ww4bO0CYGkh1XTORlfkegSuYzzGl5oXNYkICkZu2T8M4l8/ASVhMsixop2tuyK4uF7/Nb
	 yN/0qkfKbWoq/HnqvmnudXOGQPWlblA/tNhq6C/Z5s8dsp1cGHk+sNmCU5TQKMKGH8U8a
	 X5fLDwu6jqbiAQWhWu5RLrfvTYVdiUEIlsq3j6Bh6u0MsNEbtAza91bhTu8odoD3Wseuc
	 VdCDpVfgLG8a4ivLxaL5EK83dgHTW1KvlLoUDtKLFjN3fionWYxPNeQVvIZ2ZxajJrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792872058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tn8JnJWmK0GHnNl80RNMyzPZfHanshocAXz+pQsArU=;
	b=zONaYiBqSM5woVlw/vur6aYBxWZQsVVtBqQt/+XgpynOr29R3obA8jYPN0fYTUSgyqSV
	 1H6G16y4irv38eHLL0O4UXNz82K3fPgsQW0N2VHpl0OV7bFuQ4NT554HJ49ZCnWzDSimG
	 MG2LmcUU+LQQy5+NTHYPMfMdCtuMP2rEsa8i63i5IWzhneqOUJxvI92PCPcLaEgpIbO7z
	 2wkOZvsXVZk4siQnzhQBS3D/7A+uPQjk6XbUw4kKXd7ycXz66Ata9ONKzDsM3VDmWFSdm
	 +8LoHIM8YqGpiTbJKMJig/ykg7II88V4LmUWwUHjD8EWIwEMYiOqN8yQXxrCTnqVF+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X5GhfQJC;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82274606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 20:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82274606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X5GhfQJC
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843cf077f10so2088986a34.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 13:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792872057; x=1793476857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tn8JnJWmK0GHnNl80RNMyzPZfHanshocAXz+pQsArU=;
        b=X5GhfQJCmuzWACa4XS2cizqN54L+F61bxgu1u9qnMdgHDSdADz2JUUmirG6Kmhj9Vx
         k92n11FcOKizuPrRsxaIi4yyYIGC9OOf4aQJNBNJ3Px8G34SLAS0UTpjagbO3/mvJFbI
         Pu2YHuAKjURo8Yd6WV4p9vHzcPux4wPpAfibu8nkxg6vAi9LuAlWyNPlPGQ8hgjCnUFb
         WrYaVsbUfbKLKLvUsrL4hWxEne1zQJ1nxCBpwk71j1bykgWBBydMHQEBSabZ5AGFVKvO
         KRgzMqbMo17Yqq/3dgjJsC5lIh7xqppeJT30jEMJcpVpePNg595DMqm3yP147bm1BA7s
         /EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792872057; x=1793476857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tn8JnJWmK0GHnNl80RNMyzPZfHanshocAXz+pQsArU=;
        b=UULVsXmlvpH4opvYve0n0eIokCsz9g+yg1DCwkHifrW0o1C5yH07CEZF/pk571n8mO
         IkwH+hpwPwEX/MXe9N68lDrP1WHyLCxBhau5bJXqdpGuAxyVf+T5jDrgXHdJzYUTlr9K
         tBVWgejmQqdRvKVHINzP+XUL0+FF29rw8F9SUaDjZZhaCNctmueZuP8snKUbI2dS1w4c
         fq92MIH3P51OjBj8CMV0Mnmbh5EGlDOZwsbm6gDS1agEpt1CJYgu0e7W8Rua+sNReS7S
         kWNi9owCGumBGSztcDGKi/A4iCURsrCg3IfX6t7rghBn1kFcz+WYAU/Slhs9qkpqHolE
         e6mA==
X-Gm-Message-State: AFq9FYIYyGRNPe0sw2QB6gdW0H9Ez1NpeW4/XPLooU0A5xBIs/oXjcHO
	g6BnGttb6BJ2TQbWA7KTe0xfNh7k98aLuEO6l7rU91ZNLh8RJ+TyIxIwRXOu7A==
X-Gm-Gg: AYBFou1zdR1qrnFyEKxjMLPG2xB8l66P8BQakoTLH0hdCN5Zomk/0hnVWb3caJ+2icG
	OzjDzVvBMEAxt4mmLeb/I25ZRzgI8wCCO2Ja/0ZuPi4KCKZ+VD6dLNKQjEAexNuvQ9e5ojMQUWc
	kboo2dLDoqP8kIgms4D5e7+40CtPS1d3CxXkKblo7WQMPcNvMD7yri8Lm7zZtjaYHHNFzmJjMaW
	U0sWgkyna7bMq0JmsvqpPWz85cQVbzVAIjFS8e4AkxHTbbc7MPQK67NYml4D1PrxgfRyAiQaAhY
	tkx9Tdpruil5CPnlp+gibenmRoB53oGWR/sNatBFyFK3yogRGP37Uv0BUiELXii4ZGDWaJcKaEf
	yUi4NqQxD7MUbEq+ydSqnytJ9Dlav+sgffSpeG8EKG7g5m22dQygYjpeIAyqZkxVn7Iaul6ssB1
	ql1D9YEiallsMlt/z5dv8oo/k8o4mu2QH9eaf4rAgqyw5J+eU9NJ1VELRU5+IzHvIk4ATIuz5ZP
	1oOYCV/dvr3r4+h8NYQerFbipZJjpn5rHDWMsJOmkY70m78F0PcQcgqOicDXeXRU5K6Ffa3zf08
	fNvcZEJAoUEklR9l8Q==
X-Received: by 2002:a05:6808:6f87:b0:4b9:a829:f016 with SMTP id 5614622812f47-55c002b87c7mr1872146b6e.34.1792872057435;
        Sat, 24 Oct 2026 13:00:57 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c042da8c5sm1731361b6e.14.2026.10.24.13.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:00:57 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 12/14] bindings: python: advertise Python 3.15 support
Date: Sat, 24 Oct 2026 15:00:46 -0500
Message-ID: <20261024200048.25987-4-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024200048.25987-1-vfazio@gmail.com>
References: <20261024200048.25987-1-vfazio@gmail.com>
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

Add a trove classifier to advertise that the bindings have support for
Python 3.15.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/pyproject.toml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 7d1c777..32a4fe3 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -27,6 +27,7 @@ classifiers = [
   "Programming Language :: Python :: 3.12",
   "Programming Language :: Python :: 3.13",
   "Programming Language :: Python :: 3.14",
+  "Programming Language :: Python :: 3.15",
   "Programming Language :: Python :: Free Threading :: 3 - Stable",
 ]
 
-- 
2.43.0

