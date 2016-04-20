From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 0/4] gpio: tegra: Cleanups and support fro debounce
Date: Wed, 20 Apr 2016 19:00:54 +0530
Message-ID: <1461159058-1439-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nat-hk.nvidia.com ([203.18.50.4]:59132 "EHLO
	hkmmgate101.nvidia.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932369AbcDTNmk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 09:42:40 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, swarren@wwwdotorg.org, gnurou@gmail.com, thierry.reding@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>

Add support for the debounce as Tegra210 support debounce in HW.
Also do the clenaups to remove all global variables.

Laxman Dewangan (4):
  gpio: tegra: Don't open code of_device_get_match_data()
  gpio: tegra: Make of_device_id compatible data to constant
  gpio: tegra: Get rid of all file scoped global variables
  gpio: tegra: Add support for gpio debounce

 drivers/gpio/gpio-tegra.c | 407 +++++++++++++++++++++++++++++-----------------
 1 file changed, 261 insertions(+), 146 deletions(-)

-- 
2.1.4

