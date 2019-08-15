Return-Path: <SRS0=dqG7=WL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E19C433FF
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Aug 2019 08:11:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A4232064A
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Aug 2019 08:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lhpl/4CE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730003AbfHOILA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Aug 2019 04:11:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:47071 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfHOILA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 04:11:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id f9so1480815ljc.13
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 01:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ebZA4/36rTxk/8zZnnGDTrAggtxlqN1B3xHCFNWBeg=;
        b=Lhpl/4CEOGdOAaUNVwfrFhEAvqDwbWuwmeCdhVlfhEZ4/EggH2nWpO8VyBdh8S3QLQ
         OXSjlscVTA0qX+4UtPYPdHZjLezQc1CMoaTTVEu/eEyI/1PY5ti4rNjbAsJDxz0U6m7Y
         rjkKnJ6lf4g2Q3tSWZxq3+ho22XDefURjkSV/EoglAd+kIXMVbqLGLj5VifjQ7udmyD/
         3lGQdWxU4oagagD4Sia2hN4cadPANHBfSlqe61KnNKLr97BDHpR9kBE1zDPYM2593NWe
         9/gq0LzoU/SBXdrT+TCXSCGU756D2pyjwdjOPkwqWBlcqHAAOQK1KCn8eunhI1124UQJ
         XUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ebZA4/36rTxk/8zZnnGDTrAggtxlqN1B3xHCFNWBeg=;
        b=SiAkPORRhNLVZKdHcvQguOA08sJU5kwFweSAnMJyyi1cAzomcKc5iE/RHEuVOR81DC
         ligyUN5MXzcO1TimfihbGsxbF+EJrJ1TgplX4oLdDhH1pjDctHO8QAjDi40xhYhuMQTx
         dMW0QO/5clqv13pQsNu75kZGNIQ8nLW4Cj+MD75IbcDVQqm3AEI1WyQFPB68+UuLmpA9
         jdOwt5keaTsAKrSoN7N9ZnjlO95GvZsbqKOuZkS72Jd6De1RMWkflM9dVKuF5z7tIfIu
         LuGbaZrBVIsdir5XSwsyWK2fAg0JhtJWduR7+9fBhEczXfAqaVx9UDW5FaK8Wqr3NWq7
         fxkw==
X-Gm-Message-State: APjAAAWCWgK977qeM/1PIGN17xN2hoadb3oQqTFet+bDOyCTy2C6Fvjm
        36zFpg3dUMKxxU9VYWQYEhjMed/XgARJz1/epD7o8Q==
X-Google-Smtp-Source: APXvYqw6nViHWAm98n06wtqmOkZygSxdicck4ta/i4U+OsaEfdC8l5tbW8rAx23zMzUJLlAWup0/GRhMtmPLdCvoD50=
X-Received: by 2002:a2e:9f0f:: with SMTP id u15mr2017156ljk.54.1565856658315;
 Thu, 15 Aug 2019 01:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
 <CACRpkdar5jE116CcywYxLR9JKWunRusJjNw7f3C0SFK4-4+dNQ@mail.gmail.com>
 <CACRpkdbEw5eCKb=nTCK4wuMsPEadEQdGx62cGRhk7F78p5X2CA@mail.gmail.com> <20190814143457.664b04c8@windsurf.home>
In-Reply-To: <20190814143457.664b04c8@windsurf.home>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:10:46 +0200
Message-ID: <CACRpkdY-AtaS67u4s58PifFtP5C7xp4P15J+hW_Dba=Gb4rhSQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] CP115 pinctrl support
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 2:35 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Wed, 14 Aug 2019 10:12:36 +0200
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > On Wed, Aug 7, 2019 at 2:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Mon, Aug 5, 2019 at 12:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >
> > > > This is the second batch of changes (out of three) to support the brand
> > > > new Marvell CN9130 SoCs which are made of one AP807 and one CP115.
> > > >
> > > > We add a new compatible (and the relevant support in the pinctrl
> > > > driver) before the addition in batch 3/3 of CN9130 SoCs DT using it.
> > >
> > > Waiting for review from the Mvebu maintainers.
> > >
> > > If it takes too long just nudge me, it looks good to me.
> >
> > So if the other MVEBU maintainers don't really look much at MVEBU
> > patches anymore while Miquel is working a lot on the platform,
> > what about listing Miquel as maintainer under the SoC entry, hm?
>
> Miquel sent his series on August 5, i.e 9 days ago. We're in August, in
> the middle of the summer vacations for many people. While it is nice to
> see subsystem maintainers who want to get code merged in a timely
> fashion, I think it is probably wise to give it some more time for
> review in this period of the year.

OK then maybe I am a bit impatient.

Yours,
Linus Walleij
