Return-Path: <SRS0=WxQe=DB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF89DC4363D
	for <linux-gpio@archiver.kernel.org>; Thu, 24 Sep 2020 13:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75576238E3
	for <linux-gpio@archiver.kernel.org>; Thu, 24 Sep 2020 13:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5Sgm2ZR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbgIXNkb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 24 Sep 2020 09:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbgIXNka (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 09:40:30 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E4BC0613CE;
        Thu, 24 Sep 2020 06:40:30 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y6so1684200plt.9;
        Thu, 24 Sep 2020 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cGJ/OdtZht+9heWoI2epD1dIdA+gcxLBdCbKRQuv3zI=;
        b=d5Sgm2ZR1hnM76gGIOud2fuXPBUPd68NCmYXPCjIrec51wvWiCTYtuxSawzakRYRI6
         yxtPKuh/79mhucoh5rcviIifiCNBK/TGT8/0DVv3Dkv+c31sq65SY8ZuYgmuEVNLWD1y
         6453nNl32aQ1GY8PJtwdfr/xuRpY5POSO88zVTEUjKGN7/uczSIsLmTdPVyoh8YNmbsL
         C7wK5CNsVD4XOkQycag1rT2KFugOz2LHQopMT40bcwGPuypybsVDTBtL0wpXGeG2rqKI
         zRmuLRfj0HtIM1RS6i/X2SaH2is4BmjdtM2jKsku9Cu2OxRINCkOuvCs31nJlmVdNoDD
         mGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cGJ/OdtZht+9heWoI2epD1dIdA+gcxLBdCbKRQuv3zI=;
        b=rIQwnn6J/92rYcuBuGjQnA+1n9HMCJtDYMaZdi/3m0WE9rs3PayB6vVbAMO7b4f9GE
         YIG8JqGboegoT3TWNmGqzC1RyphlkB4hRTAfneTOXi8rhkd1BUU0O4YDREeoDZPce0Tm
         zEtiHYPwx1xwaHDiA4tapl5YXgH8tgF4mTNKOie6eptpu2jXNvtkE8F/F1Beao3Nshd/
         vGM1UyDyptImKMdkdAP623PrQnIGU7z9ADYu8KL3vIpMVGmBBrLWm9qnr562WuXVDW+d
         tDEt2VAurPdUmVEXRYQA/olavrPZg7CPHJBbkCdr8IxwRPuH/F5wJBdYAy7m1CEsKbwA
         z40Q==
X-Gm-Message-State: AOAM530qCnUupNhTArKYxF1JG3Z8JamiC9OFXBpdX97fDX46SB7jm4tb
        4IBekmdUrj1gcbD7hqghnSnIPlJl3ZFyWA==
X-Google-Smtp-Source: ABdhPJzCAhxrDicWNkVJXJeqpArxbDBDnaDbYHSOe++t5wawxWIMmm7Z/o5M3Kt8tbdxDFOUHpzx/A==
X-Received: by 2002:a17:902:aa95:b029:d2:19f4:ff56 with SMTP id d21-20020a170902aa95b02900d219f4ff56mr4694395plr.78.1600954830270;
        Thu, 24 Sep 2020 06:40:30 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id u71sm3046759pfc.43.2020.09.24.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 06:40:29 -0700 (PDT)
Date:   Thu, 24 Sep 2020 21:40:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200924134024.GA239773@sol>
References: <20200905133549.24606-1-warthog618@gmail.com>
 <20200905133549.24606-8-warthog618@gmail.com>
 <CAHp75Vdm=61wibz70ScvayXk_D77rZw_pG7wPkLXkbkzagRPNA@mail.gmail.com>
 <20200920111204.GB793608@sol>
 <CAMpxmJW1g-Z4XR1BvOvxjweqMYA6dvS9A=ooLKyjdxU1n9-3HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJW1g-Z4XR1BvOvxjweqMYA6dvS9A=ooLKyjdxU1n9-3HA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 03:36:24PM +0200, Bartosz Golaszewski wrote:
> On Sun, Sep 20, 2020 at 1:12 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > >
> > > Can we use static_assert() at the top of the file? Presumably after
> > > inclusion block.
> > >
> >
> > Good idea - will do.
> 
> Thanks Andy for bringing this to my attention, the amount of kernel
> interfaces I still don't know after all these years still amazes me.
> 

And don't forget it was originally Andy's idea to use the BUILD_BUG_ON()
as well ;-).

Cheers,
Kent.
