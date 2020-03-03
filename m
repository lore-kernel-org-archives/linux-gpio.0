Return-Path: <SRS0=mxQs=4U=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAC1C3F2D7
	for <linux-gpio@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9065320863
	for <linux-gpio@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583250651;
	bh=JkmjXkfmpFr8fwRmsjjmP5TuFZyy2up30ayz+lIaM4A=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=fAbRUOMbxnN3IbcmHoxBqtjf1LKvCia9zoYeU1osEC9BwtFq1YRHePntD84Jz7Xcv
	 Fva85HpEw82/MNk6AdSKTeVeed5pS3ycazPyUbwn9eSh0POLqI4bug10keLxA4CX9W
	 iA46NcqB6MjOj+a44eIceaGN1USJs2NqXwofjhms=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730248AbgCCPuv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:50:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:60046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730244AbgCCPuu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Mar 2020 10:50:50 -0500
Received: from mail.kernel.org (ip-109-40-2-133.web.vodafone.de [109.40.2.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA9E320828;
        Tue,  3 Mar 2020 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583250650;
        bh=JkmjXkfmpFr8fwRmsjjmP5TuFZyy2up30ayz+lIaM4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hntYcrzaB8veaIQrj/nRIdmwU+oxXnT/URQZf8cz50g18P61l0/jrJnPsOUj6YjPR
         iFsUYdboVJifDeR/2RYky7P0APfFc63fN0DFJX6tpeDcEh5yT47J6rBLl+OHervJJl
         YDQp2hE8lmlbA2Ho1HYd9PSJMax0bga6jRJgBw1c=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j99og-001ZOy-HA; Tue, 03 Mar 2020 16:50:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 5/9] docs: gpio: driver.rst: don't mark literal blocks twice
Date:   Tue,  3 Mar 2020 16:50:35 +0100
Message-Id: <9ee92407b467fd0b482a680bcce447f907df2278.1583250595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Two literal blocks there are marked with both "::" and

	.. code-block:: c

This causes Sphinx (2.4.1) to do the wrong thing, causing
lots of warnings:

    Documentation/driver-api/gpio/driver.rst:425: WARNING: Unexpected indentation.
    Documentation/driver-api/gpio/driver.rst:423: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:427: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:433: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:446: WARNING: Unexpected indentation.
    Documentation/driver-api/gpio/driver.rst:440: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:440: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:447: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/driver-api/gpio/driver.rst:449: WARNING: Definition list ends without a blank line; unexpected unindent.
    Documentation/driver-api/gpio/driver.rst:462: WARNING: Unexpected indentation.
    Documentation/driver-api/gpio/driver.rst:460: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:462: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:465: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:471: WARNING: Inline emphasis start-string without end-string.
    Documentation/driver-api/gpio/driver.rst:478: WARNING: Inline emphasis start-string without end-string.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/gpio/driver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 871922529332..9809f593c0ab 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -416,7 +416,7 @@ The preferred way to set up the helpers is to fill in the
 struct gpio_irq_chip inside struct gpio_chip before adding the gpio_chip.
 If you do this, the additional irq_chip will be set up by gpiolib at the
 same time as setting up the rest of the GPIO functionality. The following
-is a typical example of a cascaded interrupt handler using gpio_irq_chip::
+is a typical example of a cascaded interrupt handler using gpio_irq_chip:
 
 .. code-block:: c
 
@@ -453,7 +453,7 @@ is a typical example of a cascaded interrupt handler using gpio_irq_chip::
   return devm_gpiochip_add_data(dev, &g->gc, g);
 
 The helper support using hierarchical interrupt controllers as well.
-In this case the typical set-up will look like this::
+In this case the typical set-up will look like this:
 
 .. code-block:: c
 
-- 
2.24.1

