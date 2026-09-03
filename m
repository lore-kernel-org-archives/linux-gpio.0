Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8B6385D61
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422384; cv=none; b=EIxYK/q1vFSMoBRA/B84ExOhykdLiViVCX7DoJ8c5S6VwkZxGlCMcYajwPlN8/7Q6CAvU70ODLHNjbrMrcqjzBpacft5idqumSL55oCRMboFXoM5pJCDj0pZq2yB2dRygl5ppFgh5rAYhzwhs15NRQ1ol1WU6+gb/8UlnKeNg38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422384; c=relaxed/simple;
	bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goRw/g7Qz/B5w3Knfg5wOAyp51NNxXcaoSqFZKzbTy15eHcpnbdO69mOxuCl8bI2e1nblS84AXwmg+6xK9EOm9kf1ix/+jf+Xayjcox2q49FoHVTkg9RWUxXHPwmeN25ps+UmyuddojhelnOtAFH9urw8TPPuj6W/fcXmH4gUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljfD+dpd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljfD+dpd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-484415c8bf2so1502291f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422381; x=1789027181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
        b=ljfD+dpd3qCxyz8FOWdlENVs6jjhBpYfHOrwrtNKZE7/MQUJQJRhA/enQx/2lOnl59
         VCkpwXyHKu7mQ/g72hGYy8vgMoeyBciwUvwZV5aPIfzhcgNtW06h17+ruHxt8cWgl729
         x7Mpu0tsOX+fXL5qewvTjH90EmmesrsaOQ5FBze4svybFfVO99GifGdsL5zzDkMRhmMG
         eNxHDGDPsbhCRW7Krn68DKxqpIET0zeCd37tta2gUBzjGGh9TFIc/LdBxBM1mOBX5nik
         YXNaAAtXg7xQ9/boMo/wC3fpO2s6Xi7lz2q3fw2JO1XUEjlNbPABYbnT9slfnSFcFMyH
         1A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422381; x=1789027181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
        b=U7jzWI/ssgh+iPcZ60cAzZPbkaJkW19z8suFALhNDCzc4TQx9uxf7iVuub9DJ/SDIm
         FSNvSXEyPz71u55PfiszaIwxk6JaWaIuDpKD9o7PgFycoD/n+7obxB3Q/LNbCYmFFXy4
         f+vxWQy0dDZMnhpuXYMbCHe9pwvUZjklsmaBb3+VnNy7RNayi2nAtySLV0YJZwAzIsBb
         6h2OzBvMe1SiuMQnflgBzDZOIqdfl5FcGEQvMmUnRc8wr25LB2X+/kd+eJIBxI+oiZzZ
         g0Od2xp7cPHliwJ/cRZExgNfAeH8t1zf7ua/4ZaGf1rMf77wZjZ6i84d/zci2hdinL6B
         6jJw==
X-Forwarded-Encrypted: i=1; AKwUvBxbe6QlaooV5cSt0JoOVoqey3IU4g2z7S1MMf5NelZsOW2L4B1Ox9mAfvlrEsjq1sLBdeUMCcqS6L1l@vger.kernel.org
X-Gm-Message-State: AFuF++ktPJc2vf1lzzw/XbYvP3XtbP4yvPRJla9Hwk83tEV50hbDUeTp
	eCgTpsLlNZ9OOCpklMa0WqzxrXYXtTj9sOjsRKAm/vZmMBU/27qqYM7T
X-Gm-Gg: AYBFou2WtYgHEV6phlVKJpg+hNNVqd2K4DqIYiq/jAXIzYh8U1usg49d9JFCyrYwfvr
	52UhE9qAt/c6CFkzfyYsg3XwV/cxIy6LE+qJB5N3D5leKUc9I3mITokw2qiKf0C1z1rSVD0d0vX
	FidJdtdK+cYhx6rRcMtFQwmOgcE1IQEEca6QL/lkhy5bEW6RrwkJCeJxhxtuhCcTivyXaLv2rfW
	TCam/39fIX7mypOkQox6do017qyEoapxgyYSW0mdZJubqyysvldFbAiL8W09S7I5Ri/7UupiO+y
	Jxa7McTzS8/gXs2NmjdaCNF819LlLH/GZYjNbSFPgQZ489KYNVlun8vtp++zU0wE68Q2KKM6E/7
	xfcUHYpWXf4PrdUmZ4azxGLqGumx2r4LsaAw7h4WEp6PLprBlSl8U37f9OomVs6jerjxv2qHAZy
	RUc2NtvzdTd8Ufbv9E6AKcDc2TGTe7uT7+shhChy/e7bSfXmA+zxvo/i4uN9R6lkYWdQ==
X-Received: by 2002:a5d:5d8a:0:b0:484:41cb:d5f0 with SMTP id ffacd0b85a97d-48488f103d7mr17847999f8f.17.1788422380714;
        Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:59:36 +0200
Message-ID: <20260903075936.2089280-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075021.7AF3F1F000E9@smtp.kernel.org>
References: <20260903073143.2068494-4-mehmet.fide@gmail.com> <20260903075021.7AF3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Are we correctly parsing the packed pin configuration value here?

Yes: gpiochip_generic_get_config() hands back what
pinctrl_gpio_get_config() returns, the bare argument, so config is 0 or
1 here. The problem is the get_config() documentation in patch 2, which
says "packed" where the implementation says "argument"; a driver written
to that text would indeed break this check. Patch 2 gets the wording
fixed in v5, this patch stays as it is.

Mehmet
