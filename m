Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98344D0CD8
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545224; cv=none; b=gC6KiC/LfPEMgQL4Qir7D2g68Oty0nzK/gYlFItyMpLsOnKbSi5oODswju9dwdneZsUIUe5K8e3dcIwmbdNBDYYx5YUpqMWxHAdd1zo+FrV8dNzlMPJebTbEQctgF78r2FTlplOCCovDJbMYDjTF/kXL8h0kUxO6XxXhFHtkUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545224; c=relaxed/simple;
	bh=7bW9zHBHf9MLFVFOP+2e6zwC7NkeCL7ilHfr8HYHFYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ktANWjhPgyr8AYNwtB51M7XRe6IrG8mt+zfifUsTVksjxWuz2Rr0E7bTJkwMizZtLYeVOArp9n+9/q+wdIMJiRJLbh1Fslzl1J/umf6yOPYyCe74RvHUGM9aH9uNUHxBzpGU8CPLO1N9CaIwZvnNv71lgft2L/vt3nTCQnfpTao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBTUl2GU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBTUl2GU"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2841869a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545216; x=1792150016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xgJccrdau/8PmrM1/GKc8Z9lcJB5q1sjmJXVtgvUf4=;
        b=KBTUl2GUaI42fkrGguPvb5VHUTy4y3ithQ8NlNPHN/LZj3ieKpIcg7iuHX5+wyXq8+
         DcQJMdrczwNH3oyRsFeVziKW9B8qxXtxQkIK5xdt032AlaEhjgg5qTmXixqcrPKftCsG
         bmIlwfv2fD+7iqrwgapDlIRITC+8wXno7EPgL1DFln7dcYPtXURV2EaTkZrbv//WEtEw
         7A1uaB0QS0ol593t+ZkcPYBrcg88wH+2WL74G+H7DEuOecEbXjuEAeLbJc5z87Qu6UpU
         AXhzCoZEnE0STVZ588E64ebTYwnIrtXsAxGoUgTlSXT7pcokhcEsXCdiTuutLdio4TIk
         YF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545216; x=1792150016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xgJccrdau/8PmrM1/GKc8Z9lcJB5q1sjmJXVtgvUf4=;
        b=nTnSKzbTOU1MuXGnqTk1AFbl89vi//rs8UOBdT4bjsv+Pfckx764FbMgUWNKNFFxpt
         q0Fi0/LSdj7oReTpbHoYlAc6d1tX4LfP3Dp1ACv/1Armv4mhtH2IGVbcSIUY/HZ1pAe9
         4W8BJ/I0bCpxmbBLwuC+Uft5Zi9imbXYLpsSAwqrEI/Ez9ZdqkCtV+5TiiKRq2IuJPV5
         0xLdT7vxSOssewfZVtHrH0alJLKONQ0Bbftau1RiJiUv8KSrb7fZvsPX25uKy3/b+H02
         N311D5zmXM35pesnS+SbRf7LMgxO9hQ/Q/xEVYt4OQ8W+J0gxu6QyO9UheskoTlxljYN
         92Nw==
X-Forwarded-Encrypted: i=1; AKwUvBz8cK5WYWyP0dLNzBbqRxIeLt0/ISTvNJYDAqk7RUOi5QkqMXVR8fMEv6Xkxqo94FmFqXpu1BuaPoww@vger.kernel.org
X-Gm-Message-State: AFq9FYJcSJq5i8lhEZhLlPK3aTaGmEUxe2mcvojtv+ScSVw7yb45qMNo
	//t5iPPkn9L7dRjALWciht6a22FhuotSle2C5Ul8tvca+prdeQdpSxf2
X-Gm-Gg: AYBFou2SyPB3rVl1V5XEzYnEY3uupPn8UwV8NEMM6WR/q/tUJFNsrbSk/f9cCbi9ot3
	NTscny59sAc1/PV8wAKNSj7HTPbIJkyOwV4nHghUTWlQN4soBfNE3wYkMhIhmTpnNKZ/yBy1B4x
	Hxegb2dsxU31hkBrrp7hn0Xc+95/23t5TuK+hV1UdLCFFRj4hTommVsj24afdocpVwC4LxTT1H+
	tjBimJn6TpA+F9AqwXO27AYGJu+Fo/+m/A/dN8dxKnu4gr9DF5HVLKKnz1Ns9d41ob0q62UL7Wr
	u7s+QbgmEHpjX9nGZJINO1ymuptUAYxMvipJNOidlBfDUUR0mxs/s1aQtR7LJwqZXCSQZydW7Pp
	zRxDyqgIv/Byu7fs+8qK+x4Q6XXrLDrcoZ0UJ2HVHh3F2n7u7J8w1xOjrOqtT+69YbO24DSAran
	RQDilAWxPzTZTN28PyVoEEYI30/60+voseAdU/z++NbN1yAWmqz6LYxq4wC9WaPSr+9QoRpqKoS
	+5MS/n1h5PdUps2rssMJKarLEWrxc2LKOYOz5noFcQgklV6sB6xY3KDSDjo01Q9VagIxVopSGgG
	fntjutOoZhfOFA==
X-Received: by 2002:a17:90b:3c08:b0:3a4:d338:4156 with SMTP id 98e67ed59e1d1-3ab3ae6ae4amr1264452a91.52.1791545215931;
        Fri, 09 Oct 2026 04:26:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371e2833sm3181148a91.17.2026.10.09.04.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:26:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>
Cc: Darian Biastoch <d.biastoch@gmail.com>,
	Andreas Kaessens <akaessens@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
Date: Fri,  9 Oct 2026 18:26:34 +0700
Message-ID: <20261009112634.33436-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but mcp23s08_probe_one() currently ignores them.

Check the return value and propagate errors from the reset GPIO lookup.

Fixes: 4e73bfa3ee37 ("pinctrl: mcp23s08: Add optional reset GPIO")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index cc668f84bf8b..fab6d19a559e 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -613,6 +613,8 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.owner = THIS_MODULE;
 
 	mcp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(mcp->reset_gpio))
+		return dev_err_probe(dev, ret, "failed to get reset GPIO\n");
 
 	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
-- 
2.43.0

