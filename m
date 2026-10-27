Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098255;
	b=unXriwXuOHAOEPqVFCPL8EMJ20qz7BylyIlbl9tOJPSD+B0UJSN725MjytL7ardEMWEI
	 UlSY0sxoHBw60IIkkL83mMR33MFzMFG617gGIATW+6XjsYNiXtI3NdL6Uy2+wPH7nNyqM
	 Ww/4FGL7vTGMkGYOkr7D7fUezPR2RQxOm/vbF6xmG0rQS3HvbbXeNBhAjc6J/erMegGPw
	 xDebf58pS7xsyU9zCVgmp2cTMjdhh5DWaXPpEdj9up2TYTMmr/cnaoW6qd4HAslLkqSHb
	 Be3jlmwpW6digfJKC3rpO/iaHsU7B4XTDQyt5XbqhEJiDBQdYe8TwP8clNPk/TifwUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
	b=kMXOUeb6bMxWyssFwgdX6W3NBySu7IqK1xDRYCeg5vjYHBMIpkHrwjJ7eu130xBrOHU5
	 TR7r0wO0OsLxr4lpc59KZHc6eIM8FEbXf+M9HhlLtKuKPON+3zYVds4Axfw3kitDjUCec
	 XLYS9VpomztYQqY6Tcse3tneWQwOHtgJmFWYLCjNKn/wWvYQ7j4NIxsfXU1lq4NWOxBQb
	 kxyQVbDxD6ZenkKd/k3HOa9MD+/nCyzE2bfxDd3ZBaVq1YfTitP+dJu26wwJJjZmGEAoz
	 GVpkthgWdSQRq9q1KsVojpm48VwGbprquryk77SdOENMKlyBipCOS79bb4zM7MvIssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Bhd4BbK2;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD717606B7A9
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD717606B7A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Bhd4BbK2
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e04773687so1310559f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098253; x=1793703053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
        b=Bhd4BbK2b9R2y7WiC3mCg4ICLaF0VpfovWzv5ch69CRux8xOhhqfERO0SISZ/4Lclr
         kJHwZhDvWYHJTtAQ2OaPJ83FXKcrwLmU+awxmWpyGZxPO9t1ifUpMH5CO8Yi9+2JdYTX
         6szs07bH9J0Eer2HUBAFOrx+6aqgNMarH1KT5o7b7IjQal2uB+XVrYpYUlJZl+6aLwo1
         PP+etqK9D9hyN8NdW74Qg7s1pF5J1QFuSOH8pEFHSlY4EFHxowsrlT55o0LfZbW90MTa
         SGIovh1pvg+SMu2NXNF3cuCVK6Lxqx82yUIbhtky1FXFntTA0eoYPzw6nwCuRgHNZtSR
         V7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098253; x=1793703053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
        b=HANJl5DTqc+rvtecvZmF/Z0qGBzBWBkT2l0eIqbnuYPnSFxCZXvY7r4JxnSRvw/JED
         mqpaMp1QBhMaXhYG3MWPE+DToAfBOElOuLxRM7J7S+dSSf09Q6eV+z+Gw4ouTZun2j8D
         tvZSqHmw0brpAggTePQ7QHZHJYwIHrY5W3n2udXHmxIHhNA3MJjDKOvNvcHyfTHg45/8
         N9PWq4wTYYfo22cqUUtSQ4N+duX0BISeGDEMEZJT5h4LLAdc3b1mU3rbF6R4WrdfkGJC
         /HhAwQcRRNyczzm1qA48CuFS5OivO5Jwke9mNb1cO+emIIwETUrMA3ks9Y2Wx81o/oPA
         /ADw==
X-Forwarded-Encrypted: i=1; AKwUvBxlGGPXQDcdh8YaF/hN+yNTkZEdcu5JCair/1BoMcTU+2AAVDLUMYlGOjZEFwkCXYk2x4dCn/GkCdf7@vger.kernel.org
X-Gm-Message-State: AFq9FYIvId9HTxF5AaHB5f9eQIA00RrmmqdwwEY6AenOOeJ64JExze2+
	z27c2CiAjL8C33U5BCCDiquajyOxa5mraS8nDpIyusTndYe94uJvBg5KwxXE24pEZAk=
X-Gm-Gg: AYBFou02uVptKabCfzySU1NC1zgNyN4GcDFehU4uWr3FG2a60A8izOrNnMKOtzIH8eA
	WoZzgEO6Wn3h/GPHoxesK9F03CAX+3g3Vv7UnWSzK3z1MtS5yDAY+O1g4YKlqaG6WwEVJ9qwXNH
	jcYla0lcIGxot3qIsI1c31xK+LJ8oIvmYUliNZYeIG6Q91HNfqbpNh5clVZfH7nxseYvQXEtjqE
	h4/prL9WGxKAAAZoyoRacYtP0eTdE5YCIk3Br+iJ+ZPxDpsCEa3UTTA6iavfqddbu07dMPosH8s
	vyBpzKpRhlaECcMkaDxVYpXWT46t5tatcAPOwrXRcpF60k6PNbSbtL0XujCp5tYqFCRp9yBcdcW
	xcLfdPSYVWBkcLUKk41cC/B2mlaGSpMxDvhQ/dNYP5ZSQ7gKTRuZ/+6o2Sgu1x6pNMp48g2VXlu
	Fer5mA6NEpKByvBxv9VqiXVER3qX21CA1q1BbUjnMvFkO1PpS3TpWRTgc024vqkP10kfuCJ9twx
	ftN/iz1mpjyXJUel7NyCIywz68reKLjuI3CUKl0gBVYFgFnzYIdjBQR71mlw0LlZ5EADYfjpBY6
	65xWl3OuCKPpJBBalehax/Ge5w078FDFKLigQB4JtPcG6bXOfZSG4jbIOQGm5vde
X-Received: by 2002:adf:e003:0:10b0:48e:370f:5aa8 with SMTP id ffacd0b85a97d-48e3eb2bcbbmr13271784f8f.2.1793098253028;
        Tue, 27 Oct 2026 03:50:53 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecd8c05sm28466124f8f.49.2026.10.27.03.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:52 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 20/23] gpio: max77620: Unify style of platform_device_id array
Date: Tue, 27 Oct 2026 11:48:57 +0100
Message-ID:  <634c0412c9d369179afae9a32b1c879813a8eac3.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=PwZq6cSexLoeh84nIBT27WIhYIRtJCbiT1iCV8GXeTE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHYfiE1/fm0dv123hRuSJEpZJd9swyYusDzH JadLd/A7kSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCB2AAKCRCPgPtYfRL+ TtRYB/wK9s8cgLN7UO/tLGIQ0DRnQgBx7MKgIGU8wlGupz9xOZspihJutU36MtPgU5abd6tUXmO vveYdPtbS9kBX0Z41cl7oxnuW5vRZkOr/q03nhi3FoPRbPKRklmjxinE/VBXGYylqDWSBRurill KD+0DlRrdbOVWwTvTwxejEeLe5697AXJFGIZ0kWBX63IX5cP9i5jpSK20SYGGqhtC10Ij95VDW0 H37Lk3o67zcLbHztVp4r1pD/G7UxrEiNYzOvyN6UZmkluE/OnJr+sPqvXbz5bgHZKGqNhirbmpg 6vNwxanliBGElAU3kXRhhwsKmPvzb10zPOvR/PGY5Xe/PmrU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the platform_device_id array to conform to the most used
and generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the single offender accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max77620.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 2bf3b55a61b5..99ac7ffb650b 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -365,8 +365,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77620_gpio_devtype[] = {
-	{ .name = "max77620-gpio", },
-	{ .name = "max20024-gpio", },
+	{ .name = "max77620-gpio" },
+	{ .name = "max20024-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
-- 
2.56.0.rc1

