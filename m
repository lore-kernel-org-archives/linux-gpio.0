Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316422356D9
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453679; cv=none; b=lxlfTHUzgh0c4MOwKMBkNJ62yy41c+rVXw9FSqOmBEPRRIdBAfIVa6CZVlb0UdBjBtxWtw90XWeS6ULRlGHJe1iJpOP6vbjRJPRIBSM1vNwR4HfzMM51Hwc1Ts/yhzFYFBQWncWZdIhqZIv1BS5yqbf+BePblnS8/C3eparR5/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453679; c=relaxed/simple;
	bh=nJASGU30yM9SJL3k7NkiTOgXbxRBE6ZubzOd10HVThg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JiJwUj3j1Ce0fgzob2Ao22To/+9+ccp4hOoEaZ9Bq4O9zzA5Ma1eB0ZHCxtOoWSj0/bTbmc/bvon0xdHDUp4kUrz7Tzvh1mNqBoqM1/egTbZ/0aIvJTSMimsLTugBwjD7c7UJqeETFwKsLqu5/H9YDZwnt3VGmA5Ncn52HzKots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MShtvHBR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MShtvHBR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4924593f45dso7178475e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 23:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782453676; x=1783058476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7an2fmeWoSt4aYCbX1dw+r82LEZCzn2Vdtis7o9HzQA=;
        b=MShtvHBR1Cmv5vXcGi1KJLgtPQW6WSJUyAMwcb8B1kkAferekIJ00fDz7lT2lmalH2
         GvcLcftigB7WF/h00FVJNCgDcPSnG52jjy1+Jgp+ka1mBUutn6sJb2+peEYtWUiE+N6M
         XAzqsKCiOyw/m2BuRpB/HY6F35fkyVcoVBBr5aF1bb/d69lYaVmAmue4XhOn156+sPQq
         2+60vnG9I7vAEC+qUvHR9nyrLhXz/GNhhjtr7KM+lwAlCF9ew96TKDr+Dw6bey6Oo3Am
         AnZty/gCCm1s9eAYg+vUIRoIO7IeD+mCzV+PEWV9RG/YZF95+9En32d4NPm8IujwpLb6
         sJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782453676; x=1783058476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7an2fmeWoSt4aYCbX1dw+r82LEZCzn2Vdtis7o9HzQA=;
        b=X5xMPrCzOcXjcS2tphIV3mMBDVwgLfudOUXjRnCkTwgmFQ3ZSYiqbXZU05f5dzjANc
         2I+dHTjpr9GooRrRh7jEuaRJ1dqgBDz/+cl3TpjaJtk4flSTECUqDiqdtThzC2T7brT7
         f1dgaii0b3ZC0SXH+LOdQFI1DVdDy0nZHY99Hj6D+s7eP+kZ4QfGde4oVg2JrCnWrO3U
         eKNvF+HlevTtxkjvdOpQy2QtfrZNdpClEilq1RrdAlRFjFvASnfRNwrU7EjrgHf+tsra
         1KXBSPTUO6rdLXi6vldfUmi62xhb5Zo2NHQ7bz43vgvgycqo85qS97/hBu8tr8Q52q8C
         8fSg==
X-Gm-Message-State: AOJu0YyMZ2VUa1NZJ2B6M/HzWtkmNRCVDGRJCVyXxLCa8zmVgAPusgwI
	Qswl+0MkfWb6Z3hvWMKEuVBxblEtdnIbTZvxJruQg1Us8XtSx8AyqhE1BTp9hg==
X-Gm-Gg: AfdE7cm+ylb5TudjKiKL9msNktHUIvCV6KzJaSu7zwLf6wtJV8SttxD9md0IsRKW+Y2
	741KYMWj9qJj46UB/MObFxBNZNGtL/t6wO5mhRTpKgkyCxh99VzOYprrEJjdoin3tUJN0ze92d6
	iMVW9hdrpCexn8S8BaajJBKnBVV40fA9TPvmo3QU9gvJIn3tlNdU7HB0UjczZBzRJKdvoMYlHKG
	/OLptKVGZI8lEDHo6LIZKm2izl7iLmF4zrZZouNWNUfByM/4/G6faUZWMTWABoa7ZVEa0uB60Rm
	gFXnzLg3bOogl67PoeYkCrxJnOL0bpBohdAG8H4AFgZh9ZHX/CWU/rDkBYlg7aZdEOVSRK5N7uK
	RzeqCRhYMH9xX59fEcrCG40ERRRuyqiv2UgkcbXuZguvcKgrVf6tB/qCZ1Yg7BJQSsxxsbgwvI7
	q5DyGrOC8E7Otf5vQk7ECKVKnvyRnl81rj/QSulnsXdkUv4YW1/QoxNtB0fgM=
X-Received: by 2002:a05:600c:46c3:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-49266881aefmr72308975e9.18.1782453676270;
        Thu, 25 Jun 2026 23:01:16 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f0db007b3sm2767936f8f.2.2026.06.25.23.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:01:15 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] gpio: mt7621: address Sashiko complains and other cleanups
Date: Fri, 26 Jun 2026 08:01:08 +0200
Message-ID: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patchset covers some sashiko complains reported at some point when IRQ 
mapping was being fixed for this driver [0].

I have included 'Fixes' tag and CC to stable for patches 13 since patch 4 is
just a cleanup for naming.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

[0]: https://sashiko.dev/#/patchset/20260609031118.2275735-1-sergio.paracuellos%40gmail.com

Changes in v2:
- Add Fixes and Cc tags on patches 1-3 as requested by Bartosz

Sergio Paracuellos (4):
  gpio: mt7621: avoid corruption of shared interrupt trigger state
  gpio: mt7621: more robust management of IRQ domain teardown
  gpio: mt7621: be sure IRQ domain is created before exposing GPIO chips
  gpio: mt7621: unify naming style in driver code

 drivers/gpio/gpio-mt7621.c | 63 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

-- 
2.43.0

