Return-Path: <SRS0=puWS=ZT=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0217C432C3
	for <linux-gpio@archiver.kernel.org>; Wed, 27 Nov 2019 18:43:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 982B9207DD
	for <linux-gpio@archiver.kernel.org>; Wed, 27 Nov 2019 18:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574880202;
	bh=gmFE4t6cKUmwpn+kz/HoOEzx7IrAq5xkHTpv6f8+GWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=0IJwTwv9rkQD4SUJqzBr7ndzK3DB7dh23GG8HO6bpee93F+W199uEORTl/BkKp4yZ
	 8geCTegTzkYpN7rBdw5y+j2bJRWntfrcWWgis77/qRa4ErgnHfAaR3p3HHOrbKcUaw
	 xiaw5AgibiYFSVTRJk5kdVBAhTGzvQdPjj6YP0h8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfK0SnW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 27 Nov 2019 13:43:22 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37119 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK0SnV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 13:43:21 -0500
Received: by mail-lf1-f67.google.com with SMTP id b20so17997866lfp.4
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 10:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cbp4DRGdKYx7atlFA7GlUWnZYZVPUU8tNJviwLPMwP8=;
        b=HM5iTj817tbd8cgI9ROFiU+5J5YRbcS7MYRE/ldgJRbpHkbNqHSUly1N+3IW3ABvaP
         0AnDO9ZClvsfdopZ7slk2K/U954EKFibZ0xJNi38LaKsXU7ctKWaPktwa9Oe4vB6CzGj
         MlL/2ANydkNTMbGaraqikAd4dKM9Y6DcDCxkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbp4DRGdKYx7atlFA7GlUWnZYZVPUU8tNJviwLPMwP8=;
        b=bzOOLr2Icz+dusFfgA9ftNuSA6/oSYzW3bWqMQSBCXKWERrG5lCvYyV1Ly8tYOaTzi
         4stchR/8UxtHL935t+tVGKvhst+Gm+KHgYNiLa//2ilnsdatQELiHNDZj140Z7NIFsSv
         fTM5v9kVoyW3k5GT5YAvVN8lNG95HhUXkIAfhAabCnQqbxLsxys6G/jUey9sidjseNrU
         5FnXIoS0PP0UmSxjFK7ZvbbeliMdE8RTJJe1x96DXy7e/Ww6yix0pgFOHXe9E2BMwNbf
         MEBcE2GjjnAYWHDBMb7Oarbh3mG53ybWqE1gzlHzLJHaun+EeT5soyQhuOpszs+3A4HK
         3pfw==
X-Gm-Message-State: APjAAAXLu8yVbrvPcpblCyZxJQ6hNO4QbyaWQypCRBUmqMpLzQ+xjgmQ
        gTfDJ1EsGwGwV9WAzsclh1Kwu9ErMbc=
X-Google-Smtp-Source: APXvYqxItJO8Pmw1Kr62SfWthzBkA2wu0aCsupkpDLxMcNHJDb57qALGeVDpC8aMfBfO/4RcoHVeWQ==
X-Received: by 2002:ac2:569b:: with SMTP id 27mr6861672lfr.168.1574880198734;
        Wed, 27 Nov 2019 10:43:18 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id g21sm7439239ljh.2.2019.11.27.10.43.17
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2019 10:43:17 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id a13so2434358ljm.10
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 10:43:17 -0800 (PST)
X-Received: by 2002:a2e:2c19:: with SMTP id s25mr31789522ljs.26.1574880197221;
 Wed, 27 Nov 2019 10:43:17 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdZYR=5-vf29vYN-gZWRNta3axWNxMTve+hoK_ugkUhcnA@mail.gmail.com>
In-Reply-To: <CACRpkdZYR=5-vf29vYN-gZWRNta3axWNxMTve+hoK_ugkUhcnA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 27 Nov 2019 10:43:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgTCNr1e9g7U6irHxhdHqB3PZJ9hL1SZmPK32NNtuEcZQ@mail.gmail.com>
Message-ID: <CAHk-=wgTCNr1e9g7U6irHxhdHqB3PZJ9hL1SZmPK32NNtuEcZQ@mail.gmail.com>
Subject: Re: [GIT PULL] Bulk pin control changes for v5.5
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 26, 2019 at 7:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Rahul Tanwar :
>       pinctrl: Add pinmux & GPIO controller driver for a new SoC

Hmm. This results in

  WARNING: modpost: missing MODULE_LICENSE() in
drivers/pinctrl/pinctrl-equilibrium.o

I've pulled it, but can you please fix it up?

               Linus
