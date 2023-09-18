Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A45C46CA1
	for <linux-gpio@archiver.kernel.org>; Mon, 18 Sep 2023 09:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbjIRJQ2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240956AbjIRJQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Sep 2023 05:16:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3EA115;
        Mon, 18 Sep 2023 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695028560; x=1726564560;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HODBa9dvinX682mpZpv2Ai5XBCfJ9WWcaCt3+KCr9MA=;
  b=IP/9MHh1rjBlQRZIaHpSyD/hlfzkk7ULJGQwmPiYj4M3beR1z78F0KqW
   YqgAOTpSqqcFofsnwCC3/PLYaBjzJo486zaleoPcWZsSapDmJSWorelMQ
   C5NXnZmeGUNgbR42yuZqxTj5ufroE7Y4wP37/nrBjQRhsq1mviFCv6CUH
   5aNCViR4RtvFEKymtldl4Y2DOpKFdcO1tUIWvQMonDnsrcQc9HrnklfyX
   /2QLioDZ58evPyxyNlfJhnzRGcLZLsinzd1hukJ7dF7kV44n7hGeJtqSz
   YJC+d5BlIN2ICYKQjbwyoJ7s8x8pg4qWZcZSpZj+iP3jdpw+M8VxX6C6n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382350896"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="382350896"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 02:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695455798"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="695455798"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 18 Sep 2023 02:15:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 584F118E; Mon, 18 Sep 2023 12:15:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: cdev: Annotate struct linereq with __counted_by()
Date:   Mon, 18 Sep 2023 12:15:53 +0300
Message-Id: <20230918091553.1103567-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family                                         functions).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index a5bbbd44531f..e23f06f58234 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -572,7 +572,7 @@ struct linereq {
 	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
 	atomic_t seqno;
 	struct mutex config_mutex;
-	struct line lines[];
+	struct line lines[] __counted_by(num_lines);
 };
 
 #define GPIO_V2_LINE_BIAS_FLAGS \
-- 
2.40.0.1.gaa8946217a0b

