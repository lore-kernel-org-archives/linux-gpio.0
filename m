Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEC32F12D4
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796543; cv=none; b=sVWhUkBQiivJPQeo4y/tB2HsB8Vh3DFPr0ibypu6V5vv5QUCy1Jb/3z1x9eTPkYrWT5b1x2GSP7lz4nJFcK9VV9DskjKihqB01JHQ77Gbd+gmBVzaecv14jpqohn3JUrBmpPz1L7Jc3HyoSnIJNwSqvsR4b6/rj2xYmtZ9rDpSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796543; c=relaxed/simple;
	bh=jYNn+G01JlNL/vgPsv4db/lf+col01cZCQWvE8/LnP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JEmeNJ9wCVHQwFqAA1NknchXeHj+xNQ2knoADTJovMMvvrdNoPt2ZihI8Rb5ovr/zv7o69vIHOwBInjFRoAvs6J8QyDLWxYCBEIAaStXA7I6QEk7Lcc4/bXpQzUjx/Bg9cJl0jKclCLWHpvkfIm4iUuzQDaxVW/WNxNvmpUYw3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZ7/C+N5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZ7/C+N5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8453427d3f4so4305024b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796542; x=1786401342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d3dHIF0QQLyouCUGWyUt+N8YORs2xkeKRM7Upu6EJ8Y=;
        b=bZ7/C+N539onrqLxfDH/OhkJdWUhcwtpy0mXndsYQVx0fWlZA205oJJfDMKVoxLhft
         y8DzC3EZNh4yKK9/phWSP/9eHdOxMup1HmGPk9n1fg9sSKm97jni3lQgBKStEU9ALE5M
         wSkyXlZSGnbj57ZccJgbZEjGgf+Wxfle5ZuQHgpliuuG5E+qqeYFVtx0B54zx2Acf033
         DQj/rDKwCHGsIfbUhUYM/ls7VvwDnudaMh7YCadMCljVGPC7vm+mUgremHlOz+GuelMp
         zAcNYalT74u1Zm7rcoapham9Ppu9DCYl6vMROtHiLO5nQ+HcUXx5W9em0sbisUr7X/9E
         ORrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796542; x=1786401342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3dHIF0QQLyouCUGWyUt+N8YORs2xkeKRM7Upu6EJ8Y=;
        b=RqcwLIBoUmXPspzZvK0kIeg83D5LQCKy2E9IDhcQj0DkXFbsNX+MDM9YP0gyqKgZcG
         +FlLGUqVQeZRZge7HCgSILp5Fng5vKLmll2xxqPIwrRFzopYZHWwUYqjPSahCWHyfZdq
         g483FPQxvBqcp4Vt56nkukF9JhreY+IQN7EjrTFoTzCYx+CZsFFElxqlFpcLAt/Gdo89
         HVwPnhpnEoXKE1k3re/v3vXtsTkTiMQoCcpSbUj/rNDZWoi5e07QGCLDZ0UzIqwz8WGL
         QgfZtm8IRr7FnflS1Ox1+yu09WaqKdNU25ALQzHSl92ZtktqEt2LqwybkgbEJIUfLYji
         ebZw==
X-Gm-Message-State: AOJu0YxyzNAu5iFiU2rqpoChE6oH+fI05+htNrDRXo50V+3E9a29HiHw
	7knGA7jLhxtLFLV61s98NMNnQnfgBvQnq79iT/SWk7Eado2Vj8GzxoEfe+CNQA==
X-Gm-Gg: AR+sD13uscBrvErQVTgBo3Exqgfiw67tiprG5UJFKoVO5TB2p0S1MC9IWEQMdmI1ucW
	MAdTTlxn9rp2fDyqJ7/fHsMBNy7kpq3bn0OUXpPhzyXdxUZ38fa1xLPePDGu7HSCngd3a1NeHXf
	4cm3uAFsFzAgK/IbynPFWoiUb75SR2gBfsWinvQwAyxyIR7kRyBKSW20c0qT1XTzHotfyh2X30X
	wNlPo+NNU4yfiia8RP0ILqxRkhLAmxQ2ZLgT0z1teHk8J+8SXDnTNSO3ZrIhR+uk7no+Rq7ul0Y
	8+Rl8U0PB9WP51ZYl6gwxak57I7wc8+Qsy88bP6L7dGPqmMkq9Bi396W7uoOhtXwgtCLbzsx22m
	41xi/EyliornQBYEKzrxH+noKwPLxITxvRMV9oV7ySWhGrIlLkrQxanfrcLqi0rBWD91MYx6sxH
	ZmtZDJQrh0gn/1DN1hp0FZw+Ghwl83N2AktqiA7B2nOusuFwVbaBKfhaDw5/8AXfTUKKBB0CxLB
	pRUZ6hDmpQUNlhdX2bzgBDvCS2xvvva64+0pALYTkyPBtXkhu+v1uiA6+OqveTFMNpA8DqXcduJ
	T/ThXMqnk36exupQt+8pUFdAm2mCHg08yL9N9A==
X-Received: by 2002:a05:6a00:410f:b0:847:8971:87de with SMTP id d2e1a72fcca58-84ee483fecemr10593375b3a.28.1785796542058;
        Mon, 03 Aug 2026 15:35:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 0/8] gpio: move ppc4xx driver to drivers/gpio and modernize
Date: Mon,  3 Aug 2026 15:35:31 -0700
Message-ID: <20260803223539.86303-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the ppc4xx GPIO driver from arch/powerpc to
drivers/gpio, converts it to be a proper platform driver using
generic MMIO helpers, drops architecture-specific accessors, and
prepares it for module build and COMPILE_TEST.

v2: use guard(), reorganize a bit for clarity.

Rosen Penev (8):
  gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
  gpio: ppc44x: update all 4xx to 44x
  gpio: ppc44x: Use module platform driver helper for GPIO
  gpio: ppc44x: Use platform resource helper for GPIO MMIO
  gpio: ppc44x: Convert GPIO to generic MMIO
  gpio: ppc44x: drop PPC-specific IO helpers
  gpio: ppc44x: fix undefined behavior in GPIO_MASK2 macro
  gpio: ppc44x: use dev_name() for chip label

 arch/powerpc/configs/44x/warp_defconfig |   2 +-
 arch/powerpc/configs/ppc44x_defconfig   |   2 +-
 arch/powerpc/platforms/44x/Kconfig      |   7 -
 arch/powerpc/platforms/44x/Makefile     |   2 +-
 arch/powerpc/platforms/44x/gpio.c       | 211 ------------------------
 drivers/gpio/Kconfig                    |   7 +
 drivers/gpio/Makefile                   |   1 +
 drivers/gpio/gpio-ppc44x.c              | 208 +++++++++++++++++++++++
 8 files changed, 219 insertions(+), 221 deletions(-)
 delete mode 100644 arch/powerpc/platforms/44x/gpio.c
 create mode 100644 drivers/gpio/gpio-ppc44x.c

-- 
2.55.0

