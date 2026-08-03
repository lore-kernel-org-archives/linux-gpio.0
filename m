Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5B2848AA
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766237; cv=none; b=hBQHoCueVjqFqW/chIlr62olBcKYJeyNcOgK5A6ZGN6BK1x8VEC0r4ytDh2ygNIWbRIKMRvihol5fAI8VlwyzBLtZFTGCi6Jnlzxi0p7l7WgUyM6+0HdHiMVU9GyL4dJXMs8yJ6RwmCVRSdnha9CQHqR26flCvUsHhvCxGLHJmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766237; c=relaxed/simple;
	bh=sdMR4rgm4Xdc/V+61aJ3s1zJ7hKIgo4zj5F2xCNrIVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rfzF9Qa2AjQpyjx2hVmWHGSSUmXGAYGUKMTjLt5h/rY/QSi8PlHKhqVvveVlslsIzktf+jyvmPdo9s45WbYHRpSAt3AJg9+MTaiiQ/iVHv7Sg0cG0/KltAKvHdqJBwlKrBMNUhYhzBDBHZud8PURo93nopYXjTeFQ011ApUz8qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lfo3nPvg; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lfo3nPvg"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-456395f4e7bso2396106fac.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 07:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785766234; x=1786371034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dkd3Vdy/c11kzXWk975o6VbE77tcIPNyghUoE1Wo9PI=;
        b=Lfo3nPvgDZPKtD22WP9KelDZOfdvvbqo+yDg8K3s+LBsfuLgM7IJ4Fibt3LfKC/XVI
         I4bZSEPaGSxcoNmW/CSTpSyAEtt/FFvTMIFM2AV36MYjy2aHzbqhuzlKJhwdsBoc6Xr8
         XL7prGty9KlKykrAgUSqeU60KmH6SlRjC6QGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766234; x=1786371034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dkd3Vdy/c11kzXWk975o6VbE77tcIPNyghUoE1Wo9PI=;
        b=ox8QsWxPycQNoSiGVVjFa0VRz99EsArTtmOrE69aeXEswONtih+xZCO7RR4apouCih
         tSg4s8qz/66r584xXxQv6ZKNKIKDaOlFCa9Xn6sMtTaX1nPNNee4KIIhA8RnMTOfaDva
         p3+ihjoSQJADEBo21r/QDkfX5taE4p2LoCBGtgAMLr0H0Rl6Hl1aUC+qapLgppthycFn
         9aubfbulw8M+BL6qxe2TBtyTUigMEoy1Ztq8iluvkX7gl/epXbFuHGb/4R1vsZCr72c3
         msEd8hFGfL4HPeY11lDeLa8aktFnGPoge2Y0wNXf15x7tXLNFekY62aZU4DchGAge3qa
         bwuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqM6C1gsIJDtq9J5iWCt9Oqd9nHHgLZJ5LxIYmOW/1RL3VSGzbs9dxXzQUywNQcmwIirlSiuefC95r@vger.kernel.org
X-Gm-Message-State: AOJu0YzLxee72zTPYItIJrsL6B+DmRR0f/YmIWpyuiIWrelIaU4M8syP
	QG5HL+AZYfeck18cqA07URZJB6QOZ1x75LtcsC0ENwXW6wEjoCS//rqMfrHiASp/5A==
X-Gm-Gg: AR+sD12yjBL+OicPqPVqOjv2Bn1lb2M/oLrRuOrZEXwF42roGWNHXNPf9JahIx9hDe2
	YIS1yuE9EezFULvR9+MKTs0MImqG8wvzql1Gz5DCIy16LEm3XQj+XEDed98ep0Mbhk8s3KVmb7D
	vsRRGJfvIi2lmaU/uOkFv8Qqmjj5gP6CrwkPMMoyToQ71EzhKcAo9rIWs0EOb71a2qPZfqZZuzX
	YETK4gkH/Ijlovfx9glOef38Q25NYPsoqozpsfJEDFF6yspk1/ZC3HBrZ1hjVIzHRKeBg1BAa5n
	e4S3TCg1TrHMHhtjnoMhzxgDcklgeW5IXix1jlu8hrKCfeSuda9NV78vB+dDL90FbIMBd7LELa3
	RvbHpxy7T7R/4M+cH9GjulTNqluu7K9NQyoUnWiBocNw/nk/RWA9uB08lN7fJCiajXkE+mmItKR
	0zzMD6W4pJvxW04Gfr3fB/jqUpt8cVoerlOA45vjLlqyryn3fSDSM/1rE=
X-Received: by 2002:a05:6820:c3d5:b0:6a3:7895:7f30 with SMTP id 006d021491bc7-6ae4358f82cmr10811016eaf.29.1785766234232;
        Mon, 03 Aug 2026 07:10:34 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c9162sm6526695eaf.11.2026.08.03.07.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:10:33 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Jonas Karlman <jonas@kwiboo.se>,
	Simon Glass <sjg@chromium.org>,
	Fabio Estevam <festevam@nabladev.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: rockchip: Two fixes for latent driver bugs
Date: Mon,  3 Aug 2026 08:10:22 -0600
Message-ID: <20260803141028.710706-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains two small fixes for pre-existing issues in the
Rockchip pinctrl driver, found by the sashiko AI review of my RV1106
series.

The first makes the SoC-data calculation safe when the probe runs
more than once due to a probe deferral: the pin count currently
accumulates across runs, shifting every bank's pin base. The second
aligns the RV1103B drive-type override in the get path with the set
path, which restricts it to bank 2.

The first fix is tested on a Luckfox Pico Mini B by forcing the
probe to defer once: without the fix the second probe doubles the
pin count and no GPIO bank comes up, while with it the values are
recalculated identically and all banks work. The second is a
behavioural no-op until drive-strength decoding is added to the get
path, so it is verified by inspection against the set path.


Simon Glass (2):
  pinctrl: rockchip: Reset the pin count when recalculating SoC data
  pinctrl: rockchip: Restrict the RV1103B 2-bit drive type to bank 2

 drivers/pinctrl/pinctrl-rockchip.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

---
base-commit: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
branch: rkpinfix

-- 
2.43.0

