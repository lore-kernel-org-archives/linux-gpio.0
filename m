Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAAE3BCD0E;
	Wed, 15 Jul 2026 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784143466; cv=none; b=etpyp+KlOMKK6lMkwJhOPYnajiXe3uCeQ5NHE3Yu13wgxByLTDiIdwEkoMgmojuFiB/HLijFRwKSMoAgOyhas4E/lS5kVpI39AzYbDy3/CNvzmxx6ZYOXnoBTFDMvhShDkB8OtC0eX/mO7SZ34gCWwkFWIVUc/YIOKxXoOcJupQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784143466; c=relaxed/simple;
	bh=O3PqiRrLAAlqGiM6GPj5N3SybnK8se7NDyC/uHtLI0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8EagJojbgKK+TbqsXuAh9XYecFO7Baz2q5ViXh1moOAoesNK1TEGh7ICEj5qIaVbu7iuxzspDDaQZl0N+UwJ8pEw/GmGASEtmEVgSYXnrWm5xvzKWcomHUKy/+dQaArqTJhDx8UXkb3b+aQ65aGCMnSdoBHHQjfehtj4rEpVfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEq2FmCp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEq2FmCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784143463; x=1815679463;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O3PqiRrLAAlqGiM6GPj5N3SybnK8se7NDyC/uHtLI0s=;
  b=VEq2FmCpJCMm1/aN4DJfJ8uCCyBbpYsi1eP3a/PEtS5Bo54xf6AR3VkP
   PXl4A0tYVJl1tqm5dsWljnjGL0+6h1h8622F6I8JexzIclCiKEjJyXVqk
   T0aWhiun8RTmcXNAuioXq4syraxol9LAY3dbPIKr+J5nigvfiWBIDI0Ox
   vFxtlS4Xu/UfD6CFr+Mop/OO/p8yQVB3Ny9YbmrMflYJIjtvqmv1pjqbm
   2PkidU73EgFKSJrMWB74C2pAi0thV26tRLwaSAAEAeqKnpYPDB92IiuXg
   OQIK1brfe3lnGTK8AOIgiM13qviyEGaL18jLhhEsKbtCmxXnyn7PtaPbX
   A==;
X-CSE-ConnectionGUID: oFN4ZTiVQEm8GAZmtb4Q8w==
X-CSE-MsgGUID: 1Bwo7oRHSciUfb1bdeDoqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="72329493"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="72329493"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 12:24:21 -0700
X-CSE-ConnectionGUID: 0wjoHxMcTbCG4QAEd4HwXQ==
X-CSE-MsgGUID: z5xf3/SXTAqJ0/HrazFJTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="255157601"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 15 Jul 2026 12:24:20 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F38CB95; Wed, 15 Jul 2026 21:24:18 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Date: Wed, 15 Jul 2026 21:23:30 +0200
Message-ID: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

As of today must go via MFD tree where last user of this API was
converted by the commit 62acd2babc1d ("mfd: si476x: Modernize GPIO handling")

 include/linux/gpio/legacy.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/gpio/legacy.h b/include/linux/gpio/legacy.h
index d4273162ed13..1a6e46bc85a0 100644
--- a/include/linux/gpio/legacy.h
+++ b/include/linux/gpio/legacy.h
@@ -63,10 +63,6 @@ static inline int gpio_get_value_cansleep(unsigned gpio)
 {
 	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
 }
-static inline void gpio_set_value_cansleep(unsigned gpio, int value)
-{
-	gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
-}
 
 static inline int gpio_get_value(unsigned gpio)
 {
@@ -140,12 +136,6 @@ static inline int gpio_get_value_cansleep(unsigned gpio)
 	return 0;
 }
 
-static inline void gpio_set_value_cansleep(unsigned gpio, int value)
-{
-	/* GPIO can never have been requested or set as output */
-	WARN_ON(1);
-}
-
 static inline int gpio_to_irq(unsigned gpio)
 {
 	/* GPIO can never have been requested or set as input */
-- 
2.50.1

