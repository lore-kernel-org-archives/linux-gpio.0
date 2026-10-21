Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615620;
	b=VrKhi32/PhB8qvkTyCVGD4NV38vZPQpL9D2t9VSpXaEYixLSsTDBjwl5oOMSUyTGqovV
	 yox6pNnOYerKDDX7aRjpRxhC8gVYs4t4H+6WxIdiU8BWKKSdgHpIYdlXEXwTRjvV6ob5o
	 tVLc9NTN72iRlAELzoimcOoaLAcm3jkZ04HIpp5R2jNaBjsNGC+erz6gMHXLJ5NG2TgxF
	 quCzbuNT1cwevOZg1FJGhVP5uBZqvAl+6OzIJengX3ZJGemcVZxPnqLcJNEDSoyzfO6bV
	 KiWg3atdRS8ooDFxqF+IzgHYOOkNBTSywSY/jfxRCOSKcTn/+Skn4XpG3vCjPWGNCnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KDhcVliABrVqXK+2OfwPl0g0ncmOG1BNGxHAQ6+T2Ws=;
	b=GpZaKo01xL8wNN4gbfm12WsCwZIY3mhtiyfDuoI3lSMbGU4eeAj1yOPl0bZ6DTYkZfau
	 wGxaN9AVe11eZJDswSuCMB3tkFIwf/9TC3gjsOIz1wO4lW3gVEx79+Gu0GdCOYCY7VXAA
	 Ya9MJ9ZvZxZts6nREk2yaVRTqf5CTxodzpMo1Xmobqmdn3GHK7HgcBj7yYET5QEf25BIK
	 pth3z4cgpftdPAy6xCDCz0WAVXilcJ1p0ZigavOQIQcIePHzsYcd4MYYKZl3yP9l8C+Xs
	 XlfTCu0iR33S+h7tL7uCsngfZxa4Eqh/jAt8w9XL8e8/et1fyj/w+TfcLe8u2sWEHtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B6Icq4dr;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E5606A322;
	Wed, 21 Oct 2026 20:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85E5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B6Icq4dr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792615620; x=1824151620;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bKL6fqZboZFOCWIvAEfzUiDYTPPFroQd5G+d9H7Ww90=;
  b=B6Icq4drQOLL96k14Km8C2B70oD5HY1jWq96ZSNA4rQb+SP4tdP2qk5n
   DzO9BNTdcNtWGfvgTVFdZ86RWG+CybcLNcbDkNvqLGIyqB38GIAPni8Ig
   QnKN9RoYpbY1WGW54mq0v4J7V1O8MDuLHq1ynlzHExI72Wrlo0tTrnf9a
   X5TUk9mUjYxAR1x2Mm+3y9grsnUhcoixEfyyHXO8esVvS8K7rSnkb/0tU
   CaAIkrsIJxv2KubhdSk9PLi+n5Ri8FOAo7CaY5TEFI3sG8Dr1vGns5g4K
   dXSrwfVs580d4Q6M9GU2hxwbeBo/lKcdopyNqbOvYfvmcWMIpsK9V7eUm
   A==;
X-CSE-ConnectionGUID: VzWALAGTRaCSUSsFVupCDg==
X-CSE-MsgGUID: +HV+qz2oR3+3pyAwyPtYcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1243670"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1243670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:46:58 -0700
X-CSE-ConnectionGUID: zcGPaQjUTMa5/y5desuVXA==
X-CSE-MsgGUID: x3fMAadpQ92f0fgSY2da7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3534466"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2026 13:46:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4D4A399; Wed, 21 Oct 2026 22:46:55 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Samuel Moelius <sam.moelius@trailofbits.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 0/3] gpio: Introduce helper to dispose IRQ mappings
Date: Wed, 21 Oct 2026 22:44:42 +0200
Message-ID: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have noticed that a few drivers use almost the same code to dispose IRQ
mappings. This series to deduplicate the efforts. I only converted a couple
of the users (there are potentially more) in order to stay in the same
subsystem.

Andy Shevchenko (3):
  gpiolib: Introduce devm_gpiochip_dispose_irq_mappings()
  gpio: mockup: Replace custom devm_gpiochip_dispose_irq_mappings()
  gpio: sim: Replace custom devm_gpiochip_dispose_irq_mappings()

 drivers/gpio/gpio-mockup.c    | 15 +--------------
 drivers/gpio/gpio-sim.c       | 17 ++++-------------
 drivers/gpio/gpiolib-devres.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h   |  4 ++++
 4 files changed, 42 insertions(+), 27 deletions(-)

-- 
2.50.1

