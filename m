Return-Path: <SRS0=+g2X=WD=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FB1C433FF
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Aug 2019 12:39:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BCA621E6A
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Aug 2019 12:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RAnrNzwG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbfHGMjD (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 7 Aug 2019 08:39:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38870 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbfHGMjD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 08:39:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id h28so63866304lfj.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TF8WdIG/GBC2B0M9b1jzvI8C7ifY+jxxqdmdf35RJnQ=;
        b=RAnrNzwG8H2/CmrBRYmjmwFER746NivQ+c3H6MAgOQTtgbdbE+plXLUg/Pb2VX8N8y
         /3CSu6PD4n6Ow9WZorSa0EeqxxcUrrNYU2UVYRceVVXN2eSKtTEUc0ymFz1UPy+pX06p
         sBOiBJOu07e0ijHIKNaReZOvn1hFP5ekYGjpt1XG3RFm7eH1Q+0H2mqNabivvavJXPq9
         brvGtWglmmR8k+toTssfm/YbGEdkIoIsz6Ez8MZhSWd+8+20OGUUJciV91ZTyVkdraBI
         0DtUooopmsUeGyVsj2TIEuzVTOPKomWIGT+2qCBFUUpZ1vtA7mVCIGJ8h+WGZkf9i9nG
         eozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TF8WdIG/GBC2B0M9b1jzvI8C7ifY+jxxqdmdf35RJnQ=;
        b=WPKNHSGmQ8FGDZMoi86E7wjtBS4Se8bTtwGVn862HcI42bT3d5wwvNkePXqsoT881h
         06+eNEYab5KFCX6xhcF1VwpdkZURkVf+JgliozEbFlE2HCMVmNPluspfXPmO1+AUz574
         YoKEsTl6StbubZ4hHSs17GOymA5mmLB+1w+hWIrNqFsa0uvl1plpEWN0o0FJrKmd6CfY
         WzfITXYXREAmFTlyueBSNY6cend5GoT//L42yQ1YFdwVT/P6U41V5Gttw2YA9jHVq5cp
         IkZOEwVMPd+b55hfThM8ZNBPbgEL988oK1YtikyI8yMJWqDmTsDbZkyJFlA0lwgbBEVH
         nSGw==
X-Gm-Message-State: APjAAAUjvm2FQXNF2BvdOkdr8XyTp4c9vU01l9s66uGyUp8LDh2jr3SY
        3t1yxPfdKStcVyZn9tk7uqryGAwjgg9XCV3aK2ycwQ==
X-Google-Smtp-Source: APXvYqzj2koP6TS5ONHRZFw3kwuCVAqOEziE1cUAfaaag6Bc/wbf6kDZ6QI8ReWDq+/VrKEp+xB3gGAoMEXRhZU/e/Q=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr5973751lfp.61.1565181542001;
 Wed, 07 Aug 2019 05:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190807021254.49092-1-hui.song_1@nxp.com>
In-Reply-To: <20190807021254.49092-1-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Aug 2019 14:38:50 +0200
Message-ID: <CACRpkdY5V9HGMciOq90RJzrMoc_gbyWKJ96sw2HOB5UMzGn1GA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mpc8xxx: Add new platforms GPIO DT node description
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 7, 2019 at 4:22 AM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> Update the NXP GPIO node dt-binding file for QorIQ and
> Layerscape platforms, and add one more example with
> ls1028a GPIO node.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

Patch applied!

Thanks,
Linus Walleij
