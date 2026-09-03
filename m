Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF7137F30E
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422383; cv=none; b=SjvtCBWopXTOiav6GhHqHywidKEiKMgGQSEuHcf1IEPkBgtKWcGLWe28/mwpAtPuvYYx8nHEO4qK0uxIu4LIlB7nyebNPVrnC3LpufNjmkMbAACb4B6zJOpEyCbk3G3AQ91447+5Wf0duJUgZLqHRYLYtzecq8ZjeXvLkj9iJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422383; c=relaxed/simple;
	bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evwpASF3BEHN29siqQFRENS2XNz8L5cPf9ToB3DllQcA0JUNLFGeTgw0+imlgE8JjXzCLOXGd7gZwZpyi2MFXe/ILU/eFlcrNYKj/RTry6NdHZasHpdlHC81l7SJ0gip8XAYNcQY4oEqiJAvtqdi+cDIQnyLyarNBJiv82t6mZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsBuX0gr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsBuX0gr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482e067e908so1768333f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422380; x=1789027180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
        b=HsBuX0grnkXPgoq0sC5ucMO8GR3gzi864esVYlyAfAch+ejmOqANLUveI9sM+t7sv0
         JU5gbgggI3X5wpTxHrApZNS7VsQ/ISwLBgcXAdb9nt+qMM16UbEnc6xNQh2dYvNnlN2G
         SzETfkI39nyYtH8gS+d90ZDgDLN6IhvLW7T7eQV7I7uT9KenDqU0aDb9PnnykXxmrjBU
         lkkONnUxkl/Sjr6tAJ55eto0kZHprHUcD2dUATYd2O0Og5+y7BndjXxFdQXgez8QMTrs
         PDfKQrDsZDZJKEKVgq84J+j4cnH7hm1Y32r9aKDOnOLKk842jHEjomPhivpVkKggWaXx
         biDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422380; x=1789027180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
        b=k1ZM7+Pya4ZP/3Mqk9g7/AaElip1bk6LyvS06qJjolWxgMuXO9M/lgw56noEXaw6XK
         9ubpY1Khx2Gl/mFvMhCRaKj9T7z89zk5I7AVL8nylK+gCH/5C28iejvdybZN9mN+giUJ
         DxGnOWANYIft3UP/9wRY9VDgqzBnvjMKyBGZYDSvwCscA3ux3fMogjuVl1+8z2A007Dr
         iq5g6QTKs7aftnKadpuBTUR/Cmz49wGDVMH+i6JLkRXmJi53xsbD1/LgiHg0FUZum933
         1D2DsFiR2pS6wuvZTO3B88mXC0Txq0es5RrFxWtaXoTRqQiFZ8Nl3Fq2UGLi1JAyD8aI
         2MyQ==
X-Forwarded-Encrypted: i=1; AKwUvByV4xL2gZp3Jy3+0AoMMLeNvjQ0giRPrTDYkbcmI9UK4riJH8pkBcjUPOK4wDtTd0D9pctb+PlGwoEo@vger.kernel.org
X-Gm-Message-State: AFuF++mS7zAVoMoNoVcSitxGy8BschCnfXO+8dSU7rkrpiAROUuab/jo
	zJv7exhcx/cKZ5KMHIB+TCoq1Cs/mmsMtUPmhIQtTat9Er9O8P7iS/XI
X-Gm-Gg: AYBFou0pCVeBVIFz1XpFJA6gnsfPkzMK1ecYAyjgXNyceni8Ob5fSBhxyVNysVYdv6o
	9CA8To5fXlKYlhxd3g+ALmaLDbxyOktSiv80PwBSJwvwwHjUIcnms+GGgKnaSRXpRgKjMT/kLbJ
	0WlKoeDCmccY/AgGG14fLJe9vfkR7oTe81DyJNjvR7RvbYQzjNhdcNVaU4Iy2vJEQHkwuf7BCAs
	h78SWEGSnQ0Po29A61Pefwz8bQRDgEShZqL1oSgXgMc7HdiDAS9/+LR54MMBODfzWisuwQ2qWlq
	S7C1X1cOvfiU380Bj2brk5xrxAeSXpz7dA6+mn2gacgZb6UeiW/D+rziWnKZgBtPqySJNnz+Bet
	cxJlcE2toFJrHOjzkpaB0cldHBeIOtbIVHc2QjnJOSzNBzTYmRYBvEA7FLLodGq8pkVW4+rYzNV
	48P0Yh0ZqNqQTJwp+EYEidDEU1et9BSkSulHNueOIt+BXMebB+as1YysMze0G8yHpfBA==
X-Received: by 2002:adf:e196:0:b0:484:3311:3703 with SMTP id ffacd0b85a97d-48488f222d6mr21633674f8f.26.1788422379658;
        Thu, 03 Sep 2026 00:59:39 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:39 -0700 (PDT)
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
Subject: Re: [PATCH v4 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:59:35 +0200
Message-ID: <20260903075936.2089280-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903074509.F36471F000E9@smtp.kernel.org>
References: <20260903073143.2068494-3-mehmet.fide@gmail.com> <20260903074509.F36471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Does pinctrl_gpio_get_config() actually return a packed answer?
>
> Looking at drivers/pinctrl/core.c, pinctrl_gpio_get_config() intentionally
> strips the parameter and returns only the unpacked argument:

It does not, you are right, and the documentation I wrote is wrong: the
packed parameter goes in and the bare argument comes out, exactly what
pinctrl_gpio_get_config() does, and what gpio-mmio relies on in patch 3.
The code is fine, the kernel-doc in driver.h and gpiolib.c and the
driver.rst paragraph are not. v5 fixes the three texts; no code change.

Mehmet
