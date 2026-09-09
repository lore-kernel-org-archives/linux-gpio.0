Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D4546EC9F
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941324; cv=none; b=l19DpaFi/YXeSj/MB9G/CRX/OfCe5GOEL8irrOy7zlNBATZcYRgpxVdJf/8axmnnJe5Lrxy0zfnHx9c6P8zPDDIzEerYRc4Z6EFZa80ClU4M3LeEnZujmVFDz4jenSgQFzX7QZOW7LA+9sYiGz6T9LDxwNjiD+PVt8fEjCjndC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941324; c=relaxed/simple;
	bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EW2m476DjnI2jCD9GjQz/tCVB6UGQrT9b6g+qajTrEzavKOu67hvwby2Due/4u3K2Bo0vFg5NIOT6Fab63SKXgRuJpeyt3PooFDknb0y9dog5R9b1x0bs8DawhZB/OZCDMS6lbMaX95x5ZsOHW347DCK45JK27T8g6EMj2Ev7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqeAGu3l; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqeAGu3l"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso68611075e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941321; x=1789546121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
        b=EqeAGu3lDZ5wIt1qBPKH2nmJSryWB+DBCIRKnhhHjUMd6lMA7PmjY19q2YLwgOB7zl
         yqgEcj4uHp9WA/IFnMM1fo37UIFy3rAAjhZFrNCbOD6i/bCQyLPt+yVd26Qswc4yKznl
         MZ6iLO3i06u5WUeTLScq/SuwmWsUL7Y5RwaOJZQdgyBNyEnpHJ8z22FFq+YaenMMJqrF
         TT8Zkw+uEPf2nvJ/LkaRiBQn54LyMe70coN8EtOoROd32BWTVULHh6hL1FhzKEsn2mCm
         rz12aS8q6LXFx3LoCc6jUyC4N3FReBKyd9zLRvNa0s9M9yPA/6pg4OMY+NWeSLGg0rF2
         kypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941321; x=1789546121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
        b=f9KOLZGHHWkYnWbitRi2Nt6sDJzreh/sbPCk7/fGzUmDbc+uF4VEfgCCIBr3SEBRCB
         N93nykRQuTfeYgHmHAJDOeCc4NZo1XCVQfg5oCNUrJn50/pJYe4f75BD3cN+9LG3/jKV
         K8XTvYAIcq9rPspLoHVl5WMeuEfmLSmV8gyPleyTsdhtikFRWHHplD+FGHBOuzzZVdgM
         z02jj3pca5QaflxZM8Br414ravaJ9ZDwYE3iWHPEGDNs+w1ktZJ61TuTcNqdgNmU4Md+
         6vTObyiRiQ9nMW1e9DemnByroYUN+xyCram3IWs6b6Z8+e3v6PAER58iTz18KBIGziCR
         +0Dw==
X-Forwarded-Encrypted: i=1; AKwUvBz5BynEwoK5I8OP3Z57q6cFstt5wJjNKWiMXtAUH+mTU+S/WJT/YHAPMVhjhUr2QL3J6RpCzWIBsm4p@vger.kernel.org
X-Gm-Message-State: AFuF++momlRCHuHoEh7zsSZp0ladhFd5X2ZkFEVwmAJkgd64TRf0Vyr+
	1GSVVE89WwvbZCFmee3Ix+ToK1gfX51Z1BIu2snNQMV7PtVI265Vhd8P
X-Gm-Gg: AYBFou1w/ZcfEd+/MzjIw2IwrkutLhnApO7rOo43E38izAV+5B+5XJZomsix1UEzRwi
	EraCDKFEW/XgsUSvhrUczSQEP/12pbzH63X4IYjqc3j6IfPndBAE0G3a5uHBdmnuANVvB8hrx0L
	cwOSC1vVUEi/rUpEcQMWPmX26I68jbm7C8XcXruWg/aolBfg0D4uNCsxAMCfLF+zyimLQ3ppYMG
	n+hDSDnBqZ1HW8slEl+Y/0Lh6RoUMtX+/xfSLKRkhZfZHUiHEBiT5sDRTMVGFxBBndN9yZGpplV
	L6HHmjcJEnjPuwhVn0lqN0hg3ZrUfukT6I+tU7aK4raVIe8Dqeur6pn3PNVrX03b1CWtjGlO1O+
	4mdxkxdtUt7iHblU8NokZYi/rR10CVfU4HUrU8RiK2lIKMe3hE7kMN+2A8e5kX2P0+l4LKcNyC0
	V7XtuSYrO/bHpR090xv5VyCONu/2pRfY9mR8+IaoeDqNmEsEQFnkM1hMDoYDZRxLoFhMNqAuWt3
	UjK
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr303543295e9.26.1788941320634;
        Wed, 09 Sep 2026 01:08:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm607453595e9.5.2026.09.09.01.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:08:40 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: haibo.chen@nxp.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  9 Sep 2026 10:08:39 +0200
Message-ID: <20260909080839.2297374-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909064415.pel5dilh7nrkxz6u@shlinux89>
References: <20260903075940.2089367-4-mehmet.fide@gmail.com> <20260909064415.pel5dilh7nrkxz6u@shlinux89>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Haibo,

On Wed, Sep 09, 2026 at 02:44:15PM +0800, Bough Chen wrote:
> dir_unreadable is now set from a second source (PINCTRL_BACKEND with no
> direction register, in addition to GPIO_GENERIC_UNREADABLE_REG_DIR);
> worth a line in the commit message.

Will do in v6, together with your Reviewed-by on 1/3 and 3/3. Thanks
for checking the i.MX7ULP/i.MX8ULP side as well.

Mehmet
