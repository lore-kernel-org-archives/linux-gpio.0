Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216C33F8BE
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 01:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770087; cv=none; b=QFBdHaoLyqVaQLWI3Un0AGPMMvSl+gNbqSMJL4J6aeYx8eOOZMNY/cvfUFLKZR1P6uD+J1eDeV+4DwIZcUmAjYLUlBRXkRwbyqBmcyqop54/tOK/hWGzxSzaDQdBdFJGNVTOeI4Rg3mdiCffD44pHM2ZhHkFqwMSEihGYOM9lsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770087; c=relaxed/simple;
	bh=Vv44zoZjSwsy57vVHtTQCTd9X5ufs796pWyfNK+I8iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rel4JOP42c3CNY895mdPUCbD4a5x1tkMJd9t8MLoV7rJg5yYM6Rs1tT3Mn2XzcIzfFQRDwG5LWwXC+Pz7Y5WX791DrIwaNzfTfSBt9+BC8xivWL6Y0B8ZXA21qeq0vVYSAkMcI33Xg4g5OGHTFzUlw5p4KS6vz2pD4zuzIujaZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJwuBwvG; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJwuBwvG"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-154e9d2d979so926988c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 18:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791770086; x=1792374886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQpTLhFBOP9kFD8lNbHZGg4fyvNfgM4FjUkj5Z4R+aI=;
        b=DJwuBwvGXrLt8txeBIJ4tk6qrpnMjqyyZrjBKQ73u1RQV8KU4fg++WSNFW2ovB0xc7
         NX0q3yf9LbkdqHKrCst0kqNHymahCkyJCxuRVBYmMxlinf8rSCV46uXa5hp2AF67MKCF
         yAQbzJ/hPGXKw08Erbt90JYSKYEf3Gk3EgWN7Uhyqa3aRs59DxcKuADm2XNjqZse5pZs
         PqF7cm585nP03pzjUG2p/Z7KPckQubbwp1FaUZaBffU6sy/Vj/vuhwtCMJRVsVIxUtFu
         kHIYd390kJsDZRLxFSimu5/N6j+yZhF0hK8SqwPXZEzy1rb1FCB3V757R285MkQg2tcr
         WNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791770086; x=1792374886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQpTLhFBOP9kFD8lNbHZGg4fyvNfgM4FjUkj5Z4R+aI=;
        b=F3sR28GEOUoBwKEv9KI0IDUzsQhlH/Zhxnwtu5GSGrFPd8FeHzKvBB7ByeVO3QLy8Y
         IoHbEJlSyXKMYmSKmlzSvCeSGramXGkKOJAt41mixjPVARJTSd8RtTAra2x0HDuxEUZh
         Tk5N/sCIxzxb+1boShK4149+wUuXZXzlKuKZXR06snR1UpYPbDdZJVeVBdqTvDTgINly
         d3+hCnhwpdkxNN3K8QL8ZjLWocqEfaPxyvgEePBr+qDJW3t7XL6fDwzs4FdV0V/asE+u
         fbkpyeAXuEuj9y05HRedgRRepTNqI4XfTFnpQINoy0pxZdKyOhNnJQ5rF37A1BFMKqhJ
         oEqA==
X-Forwarded-Encrypted: i=1; AKwUvBwq7fbSKCea9tdbJGLEQ4K6Db7xP3LJR7ez6QQNRcf3sZ7lQKzs+WIyXEg8ogJNFU9/C5p8LAX5ZbgF@vger.kernel.org
X-Gm-Message-State: AFq9FYI+2X9pjv+O1mhmuQM6DOYiahBw2yw8vQ8WprDPWD5yOzYB5Qsg
	mu5Yc59qAdtU09vc7ghtAh+Xt2JiRhxXf0a/MNLfNaYXF0Hj3WAnjgCl
X-Gm-Gg: AYBFou1I7FljEZ+QSRkMwW09W+AcFReXVeakkxJ/SfytAmaExP7RRASonpEIE7C8eSw
	WiQe+rx/CPRoK4a9syUYStW5UiUSMkn86ZVKVGfogIf9g+HKywOap+FDfJ8WSJMGc4bENOXtl5C
	Hw4cCQbfNTYVMuA4UFMjesJd7G9XRNQbKIgaP/b7Wg6To1KwLHfmiH2Ea0QXJv6VaABIR4o6re6
	XMHdMPnMVhiWo0MWTcDx4Y1Eq1/fzSNhEbiXQ6v+Ng1LVpoamIj/naQl3Fm5L70VC7jW0nROeFu
	6uqfOd1OvOCmcpEVh+8UTcwuIUnX6OhxsfYk7gdJ9+YwJpP8/3sV5JSSAAf+ZzMG3ZpahVV2lNy
	Yd3UoyAD7NFj9F9YOWgUajWqKNHJjhDmwvkQt4UVH7C82XkPMAcosvcUDcB6PpMtiPRfyQ+e+mr
	6uyALzU4EbUQI5ZU/ov1r15G72mdHjuYkKXrqVtiSH3mU2r1tof3nAAtefQPCd8F2eW5VInSdVk
	2+HFPFjKMWiUAaZ48j9XwODQU+g4kB4b9YcCUIKAFJL51UiSclbciUVQT9Wnqw3NCVIphLFJc7A
	BOyFZm2ZH6t5QQ==
X-Received: by 2002:a05:7022:b048:20b0:158:b944:b15 with SMTP id a92af1059eb24-16a5ec48b20mr11870984c88.22.1791770085560;
        Sun, 11 Oct 2026 18:54:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm24908130c88.21.2026.10.11.18.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 18:54:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>
Cc: Darian Biastoch <d.biastoch@gmail.com>,
	Andreas Kaessens <akaessens@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
Date: Mon, 12 Oct 2026 08:54:33 +0700
Message-ID: <20261012015433.6155-1-phucduc.bui@gmail.com>
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

Changes in v2:
 -return ERR_PTR(-EPROBE_DEFER) instead of uninitialized ret variable

 drivers/pinctrl/pinctrl-mcp23s08.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index cc668f84bf8b..259ac02134c6 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -613,6 +613,9 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.owner = THIS_MODULE;
 
 	mcp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(mcp->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(mcp->reset_gpio),
+				     "failed to get reset GPIO\n");
 
 	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
-- 
2.43.0

