Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5858C49361
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Jun 2021 06:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 998A1610A3
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Jun 2021 06:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhFPGaO (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Jun 2021 02:30:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:59992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231602AbhFPG3x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 02:29:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D7F4613FF;
        Wed, 16 Jun 2021 06:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623824868;
        bh=P9b/17nerTDPTIXPJkXJyS/I/WYHTO4HZeF+DMDiqe0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qlkl73VETjnK9Y14OjFogravgxPt+S43a3pl4oiONYopKgZ5EhQ1zxye0xkCoLh/e
         qkcdAxsJGrNcMmKVeaoIlWwEFLsvOJL1a79KAc/bVTT//QBH52K7QKYc8Pgl30AAuz
         1va8B9jmNEEvuIiOmBJz/jD7koXlRC/vELHb1WNRLX16u8iDF9xnIk9a7mvSf6EfpW
         FwYbREt+q8RL6NJSnd6OzS0a/Moc6lGCzDeUfldTmwhyCj2UP/B/AxXO4noe9F5EF/
         MKXbog9ALRnpsPZbBd8nCFrzFldf5gz+ONGPUOHAUS/8/YkiHl4VG1L38gZd7U930o
         ZxQ9ZiZW6yELg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltP1e-004kJC-IA; Wed, 16 Jun 2021 08:27:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/29] docs: driver-api: gpio: using-gpio.rst: avoid using ReST :doc:`foo` markup
Date:   Wed, 16 Jun 2021 08:27:29 +0200
Message-Id: <506a41353937c455c2e79b5960b0976edc8aa9e9.1623824363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623824363.git.mchehab+huawei@kernel.org>
References: <cover.1623824363.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/gpio/using-gpio.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/gpio/using-gpio.rst b/Documentation/driver-api/gpio/using-gpio.rst
index dda069444032..64c8d3f76c3a 100644
--- a/Documentation/driver-api/gpio/using-gpio.rst
+++ b/Documentation/driver-api/gpio/using-gpio.rst
@@ -9,13 +9,13 @@ with them.
 
 For examples of already existing generic drivers that will also be good
 examples for any other kernel drivers you want to author, refer to
-:doc:`drivers-on-gpio`
+Documentation/driver-api/gpio/drivers-on-gpio.rst
 
 For any kind of mass produced system you want to support, such as servers,
 laptops, phones, tablets, routers, and any consumer or office or business goods
 using appropriate kernel drivers is paramount. Submit your code for inclusion
 in the upstream Linux kernel when you feel it is mature enough and you will get
-help to refine it, see :doc:`../../process/submitting-patches`.
+help to refine it, see Documentation/process/submitting-patches.rst.
 
 In Linux GPIO lines also have a userspace ABI.
 
-- 
2.31.1

