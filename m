Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596C6390601
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461960; cv=none; b=QjGfMY9xR7YFc25gJCp3EKEQt2A9+kkLzAbaLBYy7yzq4riYMIbReDUgXTAUFU0szX3Y2bjb5xcfbrLMYZd0MQ0fhri/t2bZCTbLqkI4FY+8Tm4eIhoVczaDmrDgxuZDBs4F74naMG/uZC7/pcGcTagHypbkiZEVza6wmwG+tEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461960; c=relaxed/simple;
	bh=aEtTHnYMZuAopQUte3vps0EVXNe15OkCS9m+VeMpp4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FAwuHoIxtgF6pIScKIaHeJnGvI28IBbgWP3qEAFds7qqWcu+izO62q8Q8szeZq4tTiSFiMJ0kjzBiH7bw500ykk/ezpFm+0+8QWens7QdPXtNI3Y0+YNx8FB065CfQrHbfFTVuz/imhDc2TSYL4isUALaOOFXos5wRRNF6hy36k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2Ze27xa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2Ze27xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786461957; x=1817997957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aEtTHnYMZuAopQUte3vps0EVXNe15OkCS9m+VeMpp4Y=;
  b=d2Ze27xaZX4w9S4sfbm+XodX1KTS7nJVSau0d+9O2qJuDV5Px++wl2gU
   /tuvmmzc/4U2cag9ycjFwN5MbKOJS2QejHy4B4CywNjhNw8QpynsgOmM5
   s7a44uPnk9knvcgQvOETeNHoV/1mB5TcqqloDXyxIU/VrlPaNvj/xOihj
   DhvoSo6jNjT04Crj8RpIpyyl3W8tKOgOct+lC6ml/zCYNE67YaQBRhjF2
   ZL0VQfZILxTJwCvVEGJr9QfziNA5PxntMee6Pu5ztUdOu6KE7JGjsZ9Hw
   vK79IYvFtT8uUXs6V6LSLiJx/Tgg32KvwGkPOj8pzOkm6nhb2/OdYNj23
   g==;
X-CSE-ConnectionGUID: vrG4Q6AATAyGIyCdM1CR0w==
X-CSE-MsgGUID: 7kpQ97n3TmK8jwqWFtEdtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74530938"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="74530938"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:25:55 -0700
X-CSE-ConnectionGUID: Ju4tzuFjQj+m5fmsVnBM2Q==
X-CSE-MsgGUID: HBBHqSHiTgur6OhBoALYng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="260752359"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:25:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1B6D2121BF2;
	Tue, 11 Aug 2026 18:25:52 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wtoMS-00000001fE3-0zSb;
	Tue, 11 Aug 2026 18:25:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [RESEND PATCH 1/1] gpio: ljca: Remove Wentong's e-mail address
Date: Tue, 11 Aug 2026 18:25:52 +0300
Message-ID: <20260811152552.396791-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wentong's e-mail address no longer works, remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..4919f707d33e 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -484,7 +484,7 @@ static struct auxiliary_driver ljca_gpio_driver = {
 };
 module_auxiliary_driver(ljca_gpio_driver);
 
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-GPIO driver");
-- 
2.47.3

