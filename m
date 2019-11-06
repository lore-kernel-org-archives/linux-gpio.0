Return-Path: <SRS0=BWJe=Y6=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F54FC6195
	for <linux-gpio@archiver.kernel.org>; Wed,  6 Nov 2019 23:20:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77108217F5
	for <linux-gpio@archiver.kernel.org>; Wed,  6 Nov 2019 23:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFuIjXL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732711AbfKFXUc (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 6 Nov 2019 18:20:32 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38682 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732705AbfKFXUc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 18:20:32 -0500
Received: by mail-pg1-f196.google.com with SMTP id 15so193894pgh.5
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 15:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S/FkLVLx7Z7P9m8YOxrkIitpZ4MJXVjnSA7j/dk1qCg=;
        b=PFuIjXL7wVtHrIWP5IlncfBZ1f+fBV1jKksLyr3bxNYKk1EamODXO9IZWpPIkbR5vH
         sGI2/P8kNziDA8mJbegQqfX8K91RRHM3dEZkLqVQCXRL+6svzfzl49RWTyOz9mjKHG7A
         p97c/5VSoVp/6nhya1IZk4TOCvEnU+WU0TSRBTlPxQaE/qt2wotD6htgwYou0uoMwwAh
         sMApnnZnorYSYsg//PKD9wNOSMd1Pcbd+AtiyPlS18wrHQwiC6PCoxl1MdhUNqbeYSK/
         +JFUElAgQCT2Eel481/E9zsNgc6Rd1sB5ypLarKsyCta7Qt1xu/dKZpgjpMSeBkAqxT1
         hMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S/FkLVLx7Z7P9m8YOxrkIitpZ4MJXVjnSA7j/dk1qCg=;
        b=IFZvAcwBDGDgOJi9TBdRMwLYp08L+2NHJgNay7laGg4nOm5tUh/VWb10prz+HMFyDn
         e0htyd7SQqcqRr+3POuZ4xWsQ/RxR7jnLuynd4IBvM3Vbjc/aFGA6jQyFZ7TZu/3Y/fm
         p44aOEJYGw9Db3RgzO/XRWBYILcqxpBccTraARaxIHlnH/K1QrrCOlr1z5h0y/1YGqA+
         W7e4kbX/vtfzibLT9xMnxQ/xbIVQnaSZwPsG4JfONIIMRpO+k7IiLSoDoZc909+QqFjn
         u90fpnDXGsP7IN4NNoOkO9N2mcjlcK1mmb5j5WKQetov1lXi7PTPyBlofGiwGpLp+vuF
         7ZuQ==
X-Gm-Message-State: APjAAAWrlhO8q07aUGH6lybIZnCT8PuShYcniUYn9MU+/4Ag4tUS1AQ4
        eKDSkBWK2/7iGnQAkGiBTrg=
X-Google-Smtp-Source: APXvYqzzn28tFMYR+XyGnwa/GLk55NeAIu1uXzqNu//jAw5A3evXrW5v72fqiO52VhrTbub0m6bLwQ==
X-Received: by 2002:a62:7697:: with SMTP id r145mr6398660pfc.261.1573082431870;
        Wed, 06 Nov 2019 15:20:31 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id j24sm65404pff.71.2019.11.06.15.20.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 15:20:31 -0800 (PST)
Date:   Thu, 7 Nov 2019 07:20:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191106232026.GA3552@sol>
References: <20191105020429.18942-1-warthog618@gmail.com>
 <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
 <CAMpxmJW6R0gv5VG95ayx2wGSdPG1hUnuKqxtBEeWg+MHkcWX3Q@mail.gmail.com>
 <20191106064842.GB3478@sol>
 <CAMpxmJVORDjTWJ+j6LUERhKnW8DS_0GopcSuTVNOnda44u=3kg@mail.gmail.com>
 <20191106165804.GA12770@sol>
 <CAMpxmJVmZdW0yqj_gu3__E__si8vQZ4=a1Te5fK2AjGmysdufg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVmZdW0yqj_gu3__E__si8vQZ4=a1Te5fK2AjGmysdufg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 06, 2019 at 06:06:12PM +0100, Bartosz Golaszewski wrote:
> 
> This is not something that we need to merge the kernel changes, it
> won't hit a libgpiod release until v5.5 is tagged anyway. Unless I'm
> missing something, v6 is still fine to be merged upstream, right? Do
> we agree on requiring the full config in SET_CONFIG?
> 

I agree that the user needs to pass the full config to SET_CONFIG
and therefore that v6 is still good to merge.

The corresponding libgpiod work will be ongoing for a while.

Cheers,
Kent.
