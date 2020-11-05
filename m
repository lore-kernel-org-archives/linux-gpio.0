Return-Path: <SRS0=WQsA=EL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB08AC4742C
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Nov 2020 07:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54E5520936
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Nov 2020 07:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intenta.de header.i=@intenta.de header.b="aF2xsR50"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbgKEHcy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 5 Nov 2020 02:32:54 -0500
Received: from mail.intenta.de ([178.249.25.132]:37722 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728478AbgKEHcy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 02:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=GhdOLm/i3scwSEyia6UQZKpucWwY7z9L9aVpjj/QGy0=;
        b=aF2xsR50560KE/a/HtabwkLFAA30jyZzy6UGVs95LOteWVaWJ9YgnY/R6BgBB3TmuCx4oZvrE9tWxdf7wpSFgJU6B/vLdMQdkrowTvLa9J9X5g0gGdRsDaT8n3UIGfmPvpltnjHSp5GR+qzDhlvHBCCc7+z1uKe8S9a8hf2Dc5rLAQANFFtvmD/k5txlsaJabPw6uofesZOdMGnaaIikJpfCrNN0ESCUrv53Jfv/7Sd3DWk1syTBA/e3/rVESG09sgZYFFIpLGM2nHtciIzoPK/Uj78BSr+aplIBQYI7kbKHtalgkcDktvJIqKjdJlAYpkypvCX94zzCLGS7INWDLg==;
Date:   Thu, 5 Nov 2020 08:32:48 +0100
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Kent Gibson <warthog618@gmail.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] libgpiod v2.0 API discussion
Message-ID: <20201105073248.GA13434@laureti-dev>
References: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
 <20201105030913.GA11741@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201105030913.GA11741@sol>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 04:09:13AM +0100, Kent Gibson wrote:
> Wrt "fast as possible", what are you optimising for - minimal latency or
> maximal throughput?  For minimal latency you want to read just the next
> event.  For maximal throughput you want to minimise the number of
> ioctls/syscalls and so dump the kernel event fifo into a userspace
> buffer.

I believe that the target actually is both as you suggest later.

> The library should allow the user to select what they are optimising
> for, so you may want to consider two event_read() flavours, one that gets
> just the next event and another that fills a buffer.  The single form may
> just call the buffer form with n=1, or it may be able to be slightly
> optimised as it could avoid buffer range checks.
> Both should accept the line request fd, rather than the line or line bulk
> that they currently do.
> And in both cases the user should provide the space for the event(s) to
> be written to.

The C-API does allow this in the released version. It provides
gpiod_line_event_read with a user-supplied buffer for single-event reads
and it provides gpiod_line_event_read_multiple with a user-supplied
array for minimizing the syscall count. Bindings such as C++ also expose
these (even though the C++ one performs the allocation).

Of course keeping these properties would be good for the reasons you
detailed.

> > For config: I believe an opaque request config structure will require
> > a lot of getter/setter boiler plate code for not much profit.
> > 
> 
> The profit being a guarantee of ABI stability and backward compatibility,
> while still being free to completely rework the implementation
> internally?

I think you can gain this profit without opaqueness.  A user can only
use those aspects of a config that did exist a the time the code is
developed. For that reason, there can be multiple versions of a
configuration type and the consumer can use whatever type they happend
to see when the code was compiled. The current configuration type can be
typedefd to a standard name and only needs to be API compatible with
previous config types (i.e. only add new fields with default
initializers). In C++, one can leverage function overloads to implement
that. In C, you can use symbol versioning or do poor-mans-symbol-
versioning by #defineing the consuming function names to versioned ones.

The only downside of this seems to be that libgpiod would have to keep
the old types and overloads for all eternity.

When doing this, it is important that consumers do not pass around
pointers to a config to code compiled with a different libgpiod as these
types may be different and have a different storage layout. For the
config, this seems fairly unlikely.

Helmut
