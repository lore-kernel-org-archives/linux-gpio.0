Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696D831F9A9;
	Wed, 11 Mar 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239893; cv=none; b=bS56Ph4YDWqdnmGbV17cvy4husWnLDPU7g7N9ptckQdSnH2BGkbh3sSB1+A1Pixkgsc4Z2OsfoXwCK1O2CrbW9Snn5JAGq+tRwoiFACXX4qxS9TJzyilcik0OmZTwHGGYIoRzfQAyqKehC0jCYQREO7yR7b8IYQGhrenvxjAYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239893; c=relaxed/simple;
	bh=sF4w8VwjlNPcVjdAIoEuag3HF+WY4mwy+hibhNG3SWM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nSwnv1gbZxQ2vL3veFV5V2dLh+CRAVN8JmKKqf+5YhDmGZIwI+eVXrop2zP8CsuycpfDc20hLYwLlIwPYUe765ckk89cKfgBuVVYzFOEn9uXTETyi0O8n+5xz9rUOqRGSo2EeRXETU2bf+3GZJaVgY0b7TEHSAS5Xba2LBhTMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 1381EDF9223;
	Wed, 11 Mar 2026 15:31:40 +0100 (CET)
Received: from albans-vm.. (unknown [213.61.141.186])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id E8DF82003DC;
	Wed, 11 Mar 2026 15:31:25 +0100 (CET)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 0/4] gpio: kempld: Support get/set multiple and interrupts
Date: Wed, 11 Mar 2026 15:31:16 +0100
Message-Id: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series update the kempld driver to support current versions of the PLD,
add the get/set multiple ops and implement the interrupt controller.

Alban Bedel (4):
  gpio: kempld: Simplify the bit level register accesses
  gpio: kempld: Add support for PLD version >= 2.8
  gpio: kempld: Add support for get/set multiple
  gpio: kempld: Implement the interrupt controller

 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-kempld.c | 289 +++++++++++++++++++++++++++++++++++--
 include/linux/mfd/kempld.h |   1 +
 3 files changed, 278 insertions(+), 13 deletions(-)

-- 
2.39.5

