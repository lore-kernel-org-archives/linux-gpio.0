Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822198;
	b=Yh76aU3v0LfaH1C7Z5Z4q+C7l+b9MkTlHHYyb8f/cW8PxzTX8uG2cd2SZZN6eV2/m3zb
	 yFh63B2B4GE6fIxetueQJsLBNtFURQRTOVfjoH63ibV7QZexCNQSEDw+1lQRu4Qd2KeMY
	 sPE7Qgh42WxpzjabSsw3+alXSKYTgWRXI66bF886CpNP5ouHQkVM3r4iFA+Ui8wbXZmsE
	 TMPkmLXRwfeRe0MdxnFCcJs/TTC97nSKiSl6tSV1VRT4S6Hj1c2bTMkTMB0rCxcGeSam9
	 t21gip8OKC8Pf/MLJOnjaUfMBsCl1ErQsyJbou71SZwn3gEz3eSYMYIKypsVlMwLuLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zR7X7uE7v/00IVsZHFoE++N3oXIHliCA4DwI/o747n8=;
	b=tqheSobdBBmIGzCJXs51PLVkF5gzB0VJGIeuRBtOWJ0s1bm9Syll2x3mnOjKcmMCDNhK
	 lW3iSInOQnRC4AhJvwl/f1uCij411/DV3t0qVSNC5LnJqZMRY4ytAaeQ82NogdE4biCMC
	 jurnUcHZMEMpKGTCYEmi7m4prCduzL0mAY3lSwHIe/W0tie+SimY0DL1OjFTluIlF6Tdh
	 hSI5fTez8Pq0qm1OFc3IidEBTNh2oemPgxM0BZi2p2KqMtVyhdSVLE+WeZvLHm9GBEVOF
	 U8HKuznQN5HxgAqzbeGVxKdWzrl3DvVFmOQdleZCfLn3ME+VHg4+206Ag6+CPBg+aNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=EJyYJZ3F;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7209D609CACD
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 19:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7209D609CACD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=EJyYJZ3F
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3550c917fd3so1627460eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1793822196; x=1794426996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zR7X7uE7v/00IVsZHFoE++N3oXIHliCA4DwI/o747n8=;
        b=EJyYJZ3F9bdEpJPsWZ1wOgAovQVI8RhP6tOVyDAbvbsEE7x+2DxJELYyLCbGXVsL9+
         fwezr07zwokQMgCBVmHdQIB008dsErvaHtRXGzLBKNlFsRV/29If/S5taAQeohdCORYO
         epvtV+A0sNnWIBK2qALa1ySzZgX1RPfQyAdwSelGlO7KxQzu1X23+8iFYmUJZhVaR03b
         bdp27EQnquqqdb25C4hHt/IRMkogBJOzu4gYQ2BlAuhfFzHf5ZjzFAUeBxGznIMGpbbs
         fzbXhaMIZ/PGcGOV0ULoeVWUePBfHM8cdTSSpMZI/mLqEaPFWRBlITAXV4Wqw1jLL+n5
         DiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822196; x=1794426996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zR7X7uE7v/00IVsZHFoE++N3oXIHliCA4DwI/o747n8=;
        b=K3PNcFbK8hoz36PrzsUh1iIYVjXLlzCldCpuxT4CbaDkXwLGvjDdEdzxCZEieY+QuS
         JsjkPrq9R4uBxJxbZ7KKgTzxWKH6bhunwILdHgyzUj34yKT0b2ny9bCUCj701wT7HigX
         2SwXpDi67DTdqD5sIWd7oyJLl0+Ry1F1D/3/F4xximmIGhksil5ngpopfkBAES4b9+Fm
         yHudESMcbNuJs8TMPXOwQNw+mNrAgMKbTq9XUY+Wk4hFpwfTis7SAVrUQwqyBToeCNnI
         7itb6FzaGcA18qOcpFUBWKlW3uTdWILywtiWorn4FHUDMAPs2CDwlYi9Ccx/vkL1/Vgm
         5rtQ==
X-Forwarded-Encrypted: i=1; AKwUvByUB2lM4hqOwkoC9Bhvc/BnYF6S5oBI2bPN9aLtlpLoX9PQoKhwKxSlZ6sc6P/3UqT3WZhCd7MvOn9d@vger.kernel.org
X-Gm-Message-State: APuU4Z8VbIgM9xPQr22KH32QFin1QWTuwqc2x2gUn99A5yGiRYUxtfU0
	5itnfvh8Q9gj2iOLhz4WjNZYVglYR0KEiZvAdE4GNc0yBuRerauJE/mGfzV9jyiQFg==
X-Gm-Gg: AYBFou3HWNJsmCt7AqGonkhRVHMZomiFfaWvI0KgsRh4zLLK1vfF1JpziBj5BYh57zk
	HbnkKlfcKTJxQlXAk26Gaxb6yWOfjZqFVwIAVkDqncjGHDoDE2CkBp7Yn0JCUqq+v1vV/Z0U19W
	v7Vs+Oo3Jm6PoDcrIhxg4Veh6QDvVQuMkKj1XaZxhNrAaNmQTK6XPxYFRs5hD/zYXVR23OSE9lb
	xOwMJyWH4Gd2yVgcbYJHb0YUhnBaJdyz8mZXmEBMnVoZgJvtF6zskQ340Cf0KsCYwZ/889BmJ1l
	bOTReadVcNQNfgFnFQjH/DokYM71UJXW83Td4oxyQ8Vh62yXjQ4sYStT8/ffrOkvAnky0LD/Y2x
	kv7ktblsSETcJKv9KYu4dqjVt4wcbMWo9xiQgimckceUWY+sGpmqgJVVrxLP/9LObuU5AUPGf5s
	HhYlwun5qCucjHkH2Hf1TW1K2gJEt6Sk/t8Rp4jmGwUul5QH+T2jAmmN+T3gVwndI6iYa8yT5bg
	mQma82Warb4JA/mFiHyIaf4ihu6uUVMP1MHAUaUyxW4x4cqsFDY526+cjCGrBLGRQ2HiYVRD/b1
	T0wi3TWyB7UL/AmE2TyMVaWS0vF7+iPAXxnjJw==
X-Received: by 2002:a05:7301:152e:b0:366:83dd:4713 with SMTP id 5a478bee46e88-36a4249ba39mr22383337eec.30.1793822196328;
        Wed, 04 Nov 2026 11:56:36 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm8941712eec.15.2026.11.04.11.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:56:35 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] gpio: virtio: bound the line names block by its configured size
Date: Thu,  5 Nov 2026 04:56:31 +0900
Message-ID: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
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

virtio_gpio_get_names() walks the line names that the device returns in
a block of gpio_names_size bytes, which the driver ends with a NUL, and
checks each name only after stepping past it. If the block holds fewer
than ngpio names, the walk reaches the end of the block after the last
name, and the next iteration starts strlen() at the byte after the
allocation. With a block that holds one name for four lines, KASAN
reports:

  BUG: KASAN: slab-out-of-bounds in strlen+0x57/0x70
  Read of size 1 at addr ffff8880026687c0 by task swapper/0/1
  Call Trace:
   strlen+0x57/0x70
   virtio_gpio_probe+0xcb4/0xfc0
   virtio_dev_probe+0xa7a/0xc50
  Allocated by task 1:
   devm_kmalloc+0x6e/0x280
   virtio_gpio_probe+0xc06/0xfc0
  The buggy address is located 0 bytes to the right of
   allocated 64-byte region [ffff888002668780, ffff8880026687c0)

Check that a name starts inside the block before reading it.

This patch is assisted by Claude Opus 5.5.

Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 drivers/gpio/gpio-virtio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8aa..32326d91f33d6 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -520,13 +520,13 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
 	gpio_names[gpio_names_size - 1] = '\0';
 
 	for (i = 0, str = gpio_names; i < ngpio; i++) {
-		names[i] = str;
-		str += strlen(str) + 1; /* zero-length strings are allowed */
-
-		if (str > gpio_names + gpio_names_size) {
+		if (str >= gpio_names + gpio_names_size) {
 			dev_err(dev, "gpio_names block is too short (%d)\n", i);
 			return NULL;
 		}
+
+		names[i] = str;
+		str += strlen(str) + 1; /* zero-length strings are allowed */
 	}
 
 	return names;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

