Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645564;
	b=ufiw7+pcKNdFd++4srQNPS8+ur7kPgNygqvQsA7bjDUJVrjUgA8EDA1+J3rYbNC/DX0Y
	 gjVB3bpQQL6covYYoNIOPfD0Q5FqAiDoIzNRxVyygIcevpm3UWYYRnVBhgt7vKG47I9sS
	 eK3DIn2+pwSaMhCvUkPogRD9JF80DcRLHeyFG9ECQ7OhJOWttEAoxZLPWfuMjR0vIVLpA
	 zIlxRYLn17WSqThIHyx60At73GEnvis0Xt54ZDDcKQN5VJB+MJVHKG6DAL1ZPEvS2A6QE
	 t0+2ZGaUDEnQmVl/HiOfQzpUKW4UFHLfnVU3yUM2NZjyOO8ObHMnlpuC3riTc9qkvvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
	b=KOucYR4XewsyueBLt71c/7odtYSrBVTb3yLnzzHYUIWIJ1XLG6c7O89VRrh79mEs0BlR
	 Jft/2SUfFwa7emCAol0x2HGO8Gj0Zn5/qNzEF2OPv0N8lTprlFH1pIfrFvlot6d9rH5A8
	 7kCFTwBr+8fcnkv60opWHYIymvzVmDu697Dzq3HKwbucZIjqITDjys99Y/4i0ZEtcYKDk
	 5A1w6g0VxymhGQWXtKnUttBpzZulCALGcK90BprYLSwF+k4rFMDJDcDnlaJPmcGIMseFh
	 HXT4w95qMKmO/0ZVBwSwe+CYVNKmiQfHuRU0qB/IFt6foVvbjliWhVpDLgRr9kHZojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYr8UlZQ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C1A606A330
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 22:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C1A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYr8UlZQ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6653039eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 14:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645563; x=1796250363; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
        b=WYr8UlZQqejsMUyRWfaFcmN8i6GPXdsjEbdVmmsQh0XcQbpE2IfUnuGMBAnov35+EW
         yAGEQtWVJBG0nHdmMno1WYKwWuw7WlPtazYMS58wpc8/aHCYTOS8SlNZ0xCNhGBKmWU8
         aE/JmvBXNQflHgDIwCrEJSFm4N3ykPSWjWch9MIxtAa1PtNnsNBUrS5b5F0X4xX5R5Lo
         a72uSwULhvstznQ4QKHnoP8LdbU80aWdkfQjF5O+uh5bsdPvpuZU5CR8alQbrHtc7dHy
         n/Ii5+XLTBO5qv2hZdOfTlRAfsTCvuulCQRvonZRQb4NxxFsUVGfzUzxEtFRN0FlkEaL
         T70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645563; x=1796250363;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
        b=ORZ/jaaSxOOHIjQfmiacYWJYK9cFRB4KTA5rKLgGB/ornjOdQ8NLUj8p50KrqfbQZW
         bE55QraZoozVg58S6UKD3uyB3hwyquThJ+9TmaJj15ZIMloqUHtlzkKSHNTE5WDc/WnI
         2MqaEmkUr3NmbRB8Ce/LnsGLfCO4QtTCNub7nKxzliEREYIxgNmzamUp/gNAkiAyAmog
         XZ+tt0B0nQfSwWZCY8L/1uAeNm8ANIDPt4Y34ymv6N3SWEIPYhHEWkLWKUlkf0QuquTL
         5Fe4+09plKJJ3wKUILQFZiQ5AZ4nfj977quupN1ip570Pics/MigASVpdi4LGrSfOSza
         /pJw==
X-Gm-Message-State: APuU4Z948dI+RiWDjqhtuewdIsn7blLhNP4+c/lvYlQ8g+jga/fE61IX
	S8emziXDzvmeRmo9hEipGSbN5pRsYMiJgfltohDt2ERps9F8NiO7cLOZw9BeDBdD/kwFkkbPu6U
	4nQ==
X-Received: from dldyq17-n2.prod.google.com ([2002:a05:701b:4551:20b0:1b5:58b9:e078])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a83:b0:184:992:c9ec
 with SMTP id a92af1059eb24-1b55693aaabmr25999920c88.38.1795645563065; Wed, 25
 Nov 2026 14:26:03 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:47 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222549.1447825-1-elkin@google.com>
Subject: [PATCH 0/2] pinctrl: tegra: fix Tegra186 AON bank index and add bank
 bounds checks
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Aaron Kling <webgeek1234@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  pinctrl: tegra186: Fix register bank for AON drive pin groups
  pinctrl: tegra: Add register bank bounds checks

 drivers/pinctrl/tegra/pinctrl-tegra.c    |   8 +-
 drivers/pinctrl/tegra/pinctrl-tegra186.c | 102 +++++++++++------------
 2 files changed, 58 insertions(+), 52 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

