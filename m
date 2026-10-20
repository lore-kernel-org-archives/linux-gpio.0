Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501225;
	b=aGXo91730EcGKaFpDdXXR5vs1VzE4YHZkXLK4w2Hs5VAtoASDi6qh0zqvQsS0Vg8xEw/
	 no9KrWokoF4jngrgokg+e9vTtThtpnagqBcWoXKnKuPWv6mlmHHZK823gbeX43hbWyBiv
	 DEO2d5uoluccr9QAwXjA7lFI1NFSZJ9oUG2JboMrnSGKpBXYPZBARPzvqm4IU6RwRGFBe
	 6DRVHig3XfgbikGNJJ9/EbF0aYKiaznABAfMRm0bUmJJaS+Zss8yB2VokZv4vKVukIGdg
	 /g+y8oRe4vnL9C1d4GI/3amW3rBkhqDCH77gi79g/LRYZwhrNGoV2tP9K1L6yG76xPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
	b=BnBnBZXZ20aHmA5bmrUgY+VyultylPIPWyom2XjUhC/IjeRppOhGFH7FqpvKvBt9pjLL
	 7OaxS2WvTwyP2ECN2vLRf8e1f9mCsLJDOdTu+gmQyEAf3bN2lJI9n+fGnMom4+4spx1ol
	 OX4Pgpqv9txHR3l3U4+VsYRhyD6MrwDAt/PcCXdDQFcdH8vnzNwD5AtKfETKzwfH5WOWJ
	 rNDyXmy9Yvd+oQLiCEAuY0lO1D7iUZh/1u+zwdVVZ8mXt8qkB3ENZC4SWuLCy0/ALZHl9
	 tHPZJQ82LRybIdwN0tXoGGUfps9sgTiJ4siGSx+VJzdtH6uFmzlBz/GuqTNRPzpf3QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0F7Hu65;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723360A3812
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5723360A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0F7Hu65
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so16745515e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501223; x=1793106023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
        b=E0F7Hu65seHwVdW+FHp3mVrOVZw/FQgWjo23wNhERvnPDPX5w0fuyS9y/+K/1or6AC
         53UmLLzuXH0GmfEXR0ypuB/t1gOwLzBNFXykNEDkIOlFHgYRlyo2RTqsVEFbUEkAqB7F
         CYjn96br5Iz8K+Wh5YFmSKXZRx+8iEZM7Ix/7zGuz4Sgiyt0Y7EJcYfXE4YF5xLNjbMQ
         zB0jun/WZ8oqFSMDS08LmBk8HmP1Ic8HNig6WgKSs4azQdbVwst7UOv9UzQuc4EenfN/
         2OdjzcTCiwtJBA7qncngxvdJ9kA65aWs+JxwYIH5btwWy8w7w4peSoTcfgnL/Lfb7Z/6
         X5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501223; x=1793106023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
        b=GLGQ60FSSHySzozopOVjdw7BmIsl/LeTn4O9zBgHGtY/cNLbd1UKSrDcrvVHwCjRwu
         tRq7vWUzNsldl9qPpJErSCAYh5vRQ/tkCva2OF8Q/mk6M5+ypD1I4oJB5S1IUyqkYS+d
         2zxqk2zbirghn4G1E71GfBQq7faQoldFeptLuy4UcZwMNxOeuD+YVOBb3bl+SEpKgFQO
         L1czmaX1XYsCbbFuGvjCUDIGtZi9uJ/JjWn5n9wm6dXrHiv8ZlUTebZEmM8zx1QvZvbL
         78GSEf/VSMh8VdxY4F4i67o4XWMtO8vIajf/E0A0ZkDnHqq5IECsCE9Oo0s9SqgNqouy
         b3Sw==
X-Forwarded-Encrypted: i=1; AKwUvByVdLFMDlnr0kxbOQUB5AkZJLaaYhEL//nt48ax1mEqPhtdjPJL+vpzQr4PHfBtaNlHTwXHSZg/OO8Y@vger.kernel.org
X-Gm-Message-State: AFq9FYLgXEaOGXf2+VttsXLRDBUnO9acTLuYg3nDXvFEdf+hd3YEJ3bt
	rFmTZMbc1S/A2/OY+qiM8jbkYqQUGIBHzfm1cJNuC7D4Cqtwas1o1S1l
X-Gm-Gg: AYBFou0x26hK3Pk828BDe+lfcnreEcsd7IkPh9fvrlPiYXW+GIiEbZkSxaN6pyC/v8b
	6JXhfg0Jw9aq4KF4pDT4PcifPTOeUE1op321U/UQRjoCVKFNkcTQn2I800U7gzaYON7Qv5LWeH8
	oddIOtOzuazsG9MpHnYaMF10rnJOUoJ/5DdToDZmX24jhyJ6fD80F/cok5bfmkYXzOpa4KTqGLb
	iRXngFZgL2qpWwD5Gf0HEUKU1K9URmjLVue47Ygoy7LHNVYRz8DEjagL2p8HuHbmfoTEmgwDZr9
	cRE+7MTyitdF94OqqCZ/rZH+otUquv6COjSk3obnTMVCi3y6h26PWASZJGpx/FV+pkXbzHXe089
	agMoqwPQzJJVdey2GpeMOkTAmAeQH+RPTEjau68Wm7GShPzpQejUiCrZZFCqLvJ8CKv8CRimTFc
	Pn6R+EvCWlrajG1M9sQMX8miR05zUJvuqCByJaviw1MRtzQw10PnCqUUEnMDwUAPi27EJ5nY9dG
	7DMwtVt15h/AUAGUoKWrUNGALLHjeSKnE319rnsP60yu8mNZRa0xR9fXwiC/xQfZoTaIq7OQw==
X-Received: by 2002:a05:600c:608e:b0:4a1:e08e:46b5 with SMTP id 5b1f17b1804b1-4a1e08e4871mr164567895e9.16.1792501222390;
        Tue, 20 Oct 2026 06:00:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:21 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:14 +0200
Subject: [PATCH v3 3/8] of: property: fw_devlink: Report unsupported
 supplier linking
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-3-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

OF supplier linking is deliberately disabled on OLPC and Intel CE4100
systems. The add_links operation currently returns zero on these systems,
so callers cannot distinguish unsupported linking from success.

Return -EOPNOTSUPP when supplier linking is unsupported. This allows OF
unit tests to skip link assertions on these systems without exposing the
private platform-support predicate.

The driver core ignores the add_links return value and marks the fwnode
as processed regardless, so its link creation and retry behavior remain
unchanged.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index aa65976739e1..99381c07848d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1708,7 +1708,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 	struct device_node *con_np = to_of_node(fwnode);
 
 	if (!of_is_fwnode_add_links_supported())
-		return 0;
+		return -EOPNOTSUPP;
 
 	if (!con_np)
 		return -EINVAL;

-- 
2.43.0

