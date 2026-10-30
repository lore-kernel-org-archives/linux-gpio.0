Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399853;
	b=gSwKLo5KZBUO3CxpSl6/TMX0ctgvjdxfiyf3/fv5RoueU0ArYc0MAT3PsmeNrLOVG8OQ
	 KNROpnIygI+8V6RH1zeJMLygimg60xUocb+/fI68tMJT9QGkWic6oYRMKU2N21sihGBXo
	 Dpx0fuXAYZIqQxYCr+zVpfuqK/a2a0JrIyI1ciDMlqC0jg75tQnZwDfWDE+Zlfs9K2WOq
	 4PEV34GyI3v0oGw125Ketb4KjXfH+jjiSQJ3yqsRt37UO6D58zoKp5OFOwgF2Mdr73VA4
	 BodWXQ/aeMXZNJ9K2W895/r4h7O9u9+zwfJnPsBvoe1YKv9jnqU9+ToTJn3ldrJeWmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=smxd6atDvW+XcNIEKcY809Fe9dqPoq4HuHxsaG6+qd0=;
	b=ptdY2Do9nuisAJW2O7bRZ0brVqwPQuJezeoISL6n/lVoRgfVYJOzfkgJ0he8KqOIzcnC
	 7sYONP+1qKWZGFPzpkdKJzZmS0g+5JoHYPq6Nsh0M459q/nPkgQE9FZmdkBapmuyDHpIX
	 bvHZOEPEptWxKiL9VTwYyNMzxHexLFilM9Atl71YT7oegMqS+zfdMdaoq+Hcu3ypUaD9K
	 NpqknLDi+MtgSKzaeo3F7bQtMQJtgoZOVUu9K6/5lRbCbsMMl3Mk93rdds7FCLdVm8hHQ
	 hjZLC0toMwXDWn/1dDXrztp/Ou4jI7vVH4I9/xfHwWFqWx0Yigb6Vg5DGM0oqBLpWNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2I9t4hp;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4040660A263E
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4040660A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2I9t4hp
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so9994705e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399847; x=1794004647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smxd6atDvW+XcNIEKcY809Fe9dqPoq4HuHxsaG6+qd0=;
        b=M2I9t4hplWMbO8tPuee3YyWYgEo3wyjcr0/4BG4YKzu3NCWdVKYAMmKMUvw6UbDvx8
         BcX4QsuLLNI3QShg+6TAx6QfEBf68vsNfxrxlN8naod6hf6myRsr0HkCry0hYrdWCcus
         L64wCfLUnofWYSxXo2tF9h41gd2jGhtnHCcBjBz2pmOic55Yq+F+E3fJFGdlUWdZDvrt
         NdJEUlNXC79r72UKiAgOBXdnjy7b/kw1mYOjqhjZ7J7DbLKb3GW+cm14TLJfWP5er6Km
         7tPZrlHXLlrek2xUExAq6V6GQVUhH0faZ0GJK/JU8xJwzv0Fg0PINfnJnb6sHm94jy1q
         eZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399847; x=1794004647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=smxd6atDvW+XcNIEKcY809Fe9dqPoq4HuHxsaG6+qd0=;
        b=JWsr35p9W9NPXC8Uwx0mYTKfNkEiq/RFCMOfX4UJIzzaClzzfgXhEMaXL7TXb+T6OJ
         1vYSuoMBOfOeNYL6S/1Vr8e6buF2FmEDnnbXMd4MSNHxbpkdZvxADaoFDBiPYXvwaPIG
         e5oKWlMaS0d30/Zg24blugp0MuRwYHQgrkWU9X37HTybo+lB1dCv0UAs9C1k9V4KMbVC
         u+l6gqT5eAMWrehJHtkwiOFTVHMxVnuIX+dmeEu3VzfKS37Sv+JwRlDYqdjz8JHla9Bw
         KDaWqXZC3/ZY+bpnjAqFQmZJaHM8tQCF22AroxDCuyPs5Z/Sc8Zjr3dT362qqxdei/sQ
         XdEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5HQz9kwgV8pgPVU6hp5JPWNPcLZOoEp0kE4OSUuWQPJrIY6VLB53ioAomBQn86qESWe7H+ipxmvF3@vger.kernel.org
X-Gm-Message-State: AFq9FYKC5nM2Ve1G6d1xrOudxeDnkIaqHWFUJ0O8yGPqdCmrVrwiPYV3
	fvAhATjwTrxWj/VOyDNFaSf8p9M96xs+mRdIWJua3VpDhUOKgD979dIX
X-Gm-Gg: AYBFou3hS4EL0Rq97z9OMJ8JyAPegEKDvy+Q97UtVqR1wzWfnBOHCEoUyE8TofR1b/M
	1YMZkI6yi73QWqhFsbNSUu6FKo1hhBjT4JxOD7qNLzE5s9BYVNwnXchHF/HBt2PRVWI1lNQaTaV
	k8XYB7Mqcb6JdWmBQovKCtP3hcu71HPU11k3bYxlMW4bNCMvY3OwU9DKsltyl64/RRO+JMInA73
	0S7JkyexEiOom7aYGaMg90xVykAoFufXIqedKqh68H95TE1Br6GOELRlCWvEhTZv8suUTV1q+kp
	AsKb3c/UWt+xTiIIL3Si/Ayua8M6+81zROMiFdbuniJd2so8KMwuBWP2SvBeSQL5pe9WTUDnl6c
	i2r1qYdaes/IrZCfmu0yNJp/jFIlW1h0JVogx+dDNFA/w84uI8zrx5DyQngBUarxt9SpHZBAuxh
	LP6vFr4oy5c2fxAsyaqvOWIeANCifA5IUTnLyanBSI03UrAXdFsWH7x5zuGc6aUgoqyN86n/HCf
	nOUZDBU6X3DHj3TzpfmDROtPUaGVxatshPXw0yQ8nlqJKbQ2tfHGv5XDUMfcxoYZZjwMGfUWPO8
	AIq9GRQjbz38AVydDsoAobYmSJU72ws3vLihbleIffGYTDNdK9s=
X-Received: by 2002:a05:600c:8b0a:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ac17191009mr83697245e9.11.1793399846753;
        Fri, 30 Oct 2026 15:37:26 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:26 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 14/15] HID: ft260: i2c: fix i2c_reset sysfs store return value
Date: Sat, 31 Oct 2026 00:36:36 +0200
Message-ID: <20261030223637.86907-15-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
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

A sysfs store must return the number of bytes it consumed. kernfs
hands that value straight to write(2). i2c_reset_store() returns
whatever ft260_i2c_reset() returns, which is the length of the
feature report it sent, 2, not 0. The "return count" below it never
runs, so every write to i2c_reset returns 2 whatever its size.

A write of two bytes is right by coincidence, because the report is
two bytes long. A caller that leaves out the newline, as C and Python
code usually does, writes one byte and gets 2 back, which is more
than it asked for:

  echo -n 1 > i2c_reset   1 byte, write() returns 2, bash ignores it
  printf 1  > i2c_reset   1 byte, dash reports an I/O error
  echo 1    > i2c_reset   2 bytes, correct by coincidence

Return 0 from ft260_i2c_reset() on success. The value is discarded by
its other callers, ft260_hid_output_report_check_status(),
ft260_i2c_probe() and ft260_i2c_abort(), whose own four callers
discard it as well.

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index f7d01d9e07f7..cd1117c170e1 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -551,7 +551,7 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	}
 
 	ft260_dbg("done\n");
-	return ret;
+	return 0;
 }
 
 static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
-- 
2.43.0

