Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF81C433FE
	for <linux-gpio@archiver.kernel.org>; Sat, 18 Sep 2021 08:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D817561244
	for <linux-gpio@archiver.kernel.org>; Sat, 18 Sep 2021 08:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237838AbhIRIeh (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 18 Sep 2021 04:34:37 -0400
Received: from www.zeus03.de ([194.117.254.33]:45230 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237824AbhIRIeg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Sep 2021 04:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=xcgHZW1fn8JNYZk7NWnhJxUbZkD
        WeQrcJqzkNGP8+rQ=; b=Iox+zPqPtcQMBCrsiEYb1ESMfJnMu3bx7Dcp0D5+MI+
        kBBQn/TIDvJlcQSpYeewu4m23iy1imYXxbDSYfw8dgx7d5+65v7jGd+2VR5g80Y/
        oau9IrG1DXHieqzWo7Gb1N2ovYY7J7i/ffYywzKNmWMw9jBCnkaPFPxyog49HLXM
        =
Received: (qmail 1828668 invoked from network); 18 Sep 2021 10:33:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Sep 2021 10:33:11 +0200
X-UD-Smtp-Session: l3s3148p1@D5rH5UDMbrEgAwDPXyF2APs7JXaA4etD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/1] gpio: add simple logic analyzer using polling
Date:   Sat, 18 Sep 2021 10:33:06 +0200
Message-Id: <20210918083307.3195-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bravery continues with the next update of the in-kernel logic
analyzer based on GPIO polling with local irqs disabled. It has been
been tested locally and remotely. It provided satisfactory results.
Besides the driver, there is also a script which isolates a CPU to
achieve the best possible result. I am aware of the latency limitations.
However, the intention is for debugging only, not mass production.
Especially for remote debugging and to get a first impression, this has
already been useful. Documentation is within the patch, to get a better
idea what this is all about.

Changes since v1:

* addressed Andy's review comments (thanks!)
  * mutex gets destroyed on remove
  * make use of the snprintf return value
  * improved errno
  * script: use only progname instead of $0
  * script: refactor 'shift' usage in command line handling
  * spelling fixes
* script: fixed a bug when using '--instance'
* short success message after proper initialization

I had a look at Andy's other suggestion, too, but decided against them.
Either I liked the current style better or they can be added later when
we actually need them.

I've used the analyzer in a few more scenarios and was happy with the
outcome. Looking forward to other tests and comments. From my side this
looks good to go.

Happy hacking,

   Wolfram


Wolfram Sang (1):
  gpio: add sloppy logic analyzer using polling

 .../dev-tools/gpio-sloppy-logic-analyzer.rst  |  71 ++++
 Documentation/dev-tools/index.rst             |   1 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c     | 341 ++++++++++++++++++
 tools/gpio/gpio-sloppy-logic-analyzer         | 221 ++++++++++++
 6 files changed, 652 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer

-- 
2.30.2

