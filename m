Return-Path: <SRS0=CKN9=X6=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017EAC4740A
	for <linux-gpio@archiver.kernel.org>; Sat,  5 Oct 2019 16:36:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C32C7222C8
	for <linux-gpio@archiver.kernel.org>; Sat,  5 Oct 2019 16:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpEtxSVE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfJEQf6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 5 Oct 2019 12:35:58 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32941 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729035AbfJEQf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 12:35:58 -0400
Received: by mail-lf1-f68.google.com with SMTP id y127so6563949lfc.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pn6mxtcEEEc3owMIwbkt2TQL3Wmbd6NRz2v8eZ+RVTk=;
        b=rpEtxSVEvEX2HhDQUFGyl3RdGfgjIagn3D9aobXi/wZtjscUnA1mkJD0kM3fiNupTG
         AfnKtyqJeYJ2uOTaQs6ySZeaNTCqFfo0/LKAfsZG6XIHVgRQWHGjbI4X+8tR86xbgh58
         UxZZo2Z8FOTYmp7b39uIYNs66Brkx9UEIKIyeGX7lge6cL6kKDMj9FaHEFKuhUJoIrou
         aEWJ35sYx+gYXF4Ss9Yohhnn31dOWy2cV94C52WosfyCgY4tR3/6M6q+HpHrqtJkL9IN
         V7orx4r/DU5hbKtRoeY/W3lxfG/Iy2raEXipla9KnUlwGY2BgV32P1ctLRpxvIGgWLm1
         qLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pn6mxtcEEEc3owMIwbkt2TQL3Wmbd6NRz2v8eZ+RVTk=;
        b=Rb7Ubm+XuPC+LkrJU784/Hon3O7Bdmb6ubsKnYvkB9vSUm7LBllvcEaeseqJBWCRB0
         RUqi1y8+jIRWOblfnMeZ/ame92ADI62UXPt0SFQutsVWQy9AmgzswwpvxnFosgxc8RJf
         bg4ZPhckfmhvXnpqA9LVc4FWeEcoAmObc5+JI6rN48gAoFkkSjzxwv2FBqaQJopBPS76
         yhbBQgGkvo6u+fMhgEcItv/xnkKU5D5dWt37IP8iArwP3/fjrXRx3VDr00vfXmY9tcML
         cGj6thSQN3Rr6QpJRKNAfGrEhNtmX33RrZ/AQ4N3pTX/UVPx5KR/E22mqTOgyqclar9T
         dNJg==
X-Gm-Message-State: APjAAAXF+Y07lTJ8SmW85iBD+Ny+EyFQLNrl4rJp9dD1Bq5fLdq23e5w
        obs6SJUY5V944eHrH1PgSdmXfRGTjqtJeT4m4JX8gQ==
X-Google-Smtp-Source: APXvYqy99lBsuY63SZm1Hovkzqrn5mNe5uNYRXbJEe6kopZaSTzsWTlUs5zAiyKhJwvIMM8Ytt5JplveuThrYIBo6hg=
X-Received: by 2002:a05:6512:25b:: with SMTP id b27mr12485234lfo.60.1570293354605;
 Sat, 05 Oct 2019 09:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz> <20191003000310.17099-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191003000310.17099-2-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 18:35:43 +0200
Message-ID: <CACRpkdbQapKs5f7=7U-=jRYN_CYQ4Rtrwrk_1nLwZJHD26bw2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: iproc: allow for error from platform_get_irq()
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Li Jin <li.jin@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 3, 2019 at 2:03 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> platform_get_irq() can return an error code. Allow for this when getting
> the irq.
>
> Fixes: 6f265e5d4da7 ("pinctrl: bcm-iproc: Pass irqchip when adding gpiochip")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Patch applied for fixes.

Yours,
Linus Walleij
