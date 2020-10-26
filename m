Return-Path: <SRS0=vyY5=EB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CE2C56201
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Oct 2020 14:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FE6A21655
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Oct 2020 14:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Qf7qxzac"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1776205AbgJZOSv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:18:51 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:39292 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1780407AbgJZOSv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:18:51 -0400
Received: by mail-wm1-f53.google.com with SMTP id d3so12664828wma.4
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z+Ur3tsnJ+KtlVIulRUK2X+mhrHRJ7Kyj1OjwnScNJY=;
        b=Qf7qxzacM5hvP9R8srH4tT/f/UQA7msEy9Q2mhJ7bH2sSUpnk9C8lERQBVWH6ixJ34
         NItcsWgEl63+t7JNi47inAA8dMvl+vSMdzpTBZNJOKibU61KU6vaGXNHHOjObN1smpbQ
         ylqpvJp7b6vBi522IQQsQXxVBzyL83/w32Haw1k9HL8mrL8eXfspaGZ6zeVVDMBiLjMt
         +qNhuncc8IgoZunKQOsx9zGZ1hSmx8vweJH0omimOncB+nf39uMC6sQFywNo9WhSEyTM
         qm5gsnLpHiNz0m0cFojoC8g7FtRNzqSS0Ph16JMoEmXUDFm46t1T6kX6UrvxbbcoRQV3
         QfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z+Ur3tsnJ+KtlVIulRUK2X+mhrHRJ7Kyj1OjwnScNJY=;
        b=qP0sMahjvtbvMYEct4Vv2mQkBry/0B/qmmUyIemUe6Ow1YL1n8Cl4YOr1/ojdwbrVt
         DS296tX+OCSgh2ltCJfGCxnAj61A0o9yAKkOINjrZz0nEBm8KVeb2vFDrH2FxQNuxHBW
         q57bWXgA41G1ae+1Ycz30uBfxEXW9tnTLu5zwgqPyeU6lchIZXUdVIkv/SWoFKcJLFXp
         a0VXoUNo5rg67RmHuXYUOdP4uXNtQjugkBi/NuV9Eb4NkxvguqPZ3qD/y733+Vp8F3vH
         yjqhm+ZpS+3EwXkeMldR7k0X9g5Xt2GlANVVWR/3f7/POhtszGDJrUAXwNWD8mqpr/Hw
         snlA==
X-Gm-Message-State: AOAM530ChAquTNhkUDgggBNaNsgPMPVbvWTDegD9CvhLwvolBq6Hh8wL
        ObQdGd63Pu5FvfoEoeQpEnjLGhdeFyJVVQ==
X-Google-Smtp-Source: ABdhPJws0P1F8rgvW7RbcSNksmIk+bMZjjf3Ti8A7HbX9ywC9heO4KIxDuY9v6QbosaoTZS5YA9vsA==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr16132687wmc.8.1603721929378;
        Mon, 26 Oct 2020 07:18:49 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id e15sm21920841wro.13.2020.10.26.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:18:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/7] gpio: exar: refactor the driver
Date:   Mon, 26 Oct 2020 15:18:32 +0100
Message-Id: <20201026141839.28536-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I just wanted to convert the driver to using simpler IDA API but ended up
quickly converting it to using regmap. Unfortunately I don't have the HW
to test it so marking the patches that introduce functional change as RFT
and Cc'ing the original author.

Bartosz Golaszewski (7):
  gpio: exar: add a newline after the copyright notice
  gpio: exar: include idr.h
  gpio: exar: switch to a simpler IDA interface
  gpio: exar: use a helper variable for &pdev->dev
  gpio: exar: unduplicate address and offset computation
  gpio: exar: switch to using regmap
  gpio: exar: use devm action for freeing the IDA and drop remove()

 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-exar.c | 155 +++++++++++++++++++--------------------
 2 files changed, 77 insertions(+), 79 deletions(-)

-- 
2.29.1

