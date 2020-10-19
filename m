Return-Path: <SRS0=rtYV=D2=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C626AC433E7
	for <linux-gpio@archiver.kernel.org>; Mon, 19 Oct 2020 12:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31472222B8
	for <linux-gpio@archiver.kernel.org>; Mon, 19 Oct 2020 12:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intenta.de header.i=@intenta.de header.b="mzOcfcLd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgJSMiG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 19 Oct 2020 08:38:06 -0400
Received: from mail.intenta.de ([178.249.25.132]:39499 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgJSMiG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 08:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=jQ1uA9v400Zv0tNCmKjVMseRd4EDmMfKfpomzdTQ300=;
        b=mzOcfcLd6w5FLQubaXYfNXfEPg+S6Y6F10Gze4QEJlCrUmD6YoeUqq1Hu/CCIg78OIQoC8X5TNym7bw00WtaWOdmOYt7/fDO7qp7DzfXi78gunj+Q2A+/F5qQxWxYs9SezvXV0HrXbsioRG13cmxSbXVd47r8HsqTVuZSJ9nf0nmxZW+Hc2ibfNoWtOmo6s+N/FOsSBgkzKapFW2OfR0vVjZ5iMos/xZXuNfZaWGU/zhV26Rt4EZc8OpYKOTvIPE8cxjaj3PqLq/7PaYjjF6dHGwSY9d8+xZmWayIdGj+td10t48GNjJxyQDbrTXonxg+cbH++okEVN3i+Ml9ngV6w==;
Date:   Mon, 19 Oct 2020 14:38:01 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent
 chip reference to a weak_ptr
Message-ID: <20201019123801.GA5116@laureti-dev>
References: <20201016090949.24456-1-brgl@bgdev.pl>
 <20201016102937.GA22245@laureti-dev>
 <CAMRc=Md1RxGiv+v27dZOSsGX4v1OEc=E-EJvd-4_8tMjgFicoA@mail.gmail.com>
 <CAMRc=MfjBai0PECzvXjLN9w_sP-ZE4QBxGL0-puow2zDKJd+Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfjBai0PECzvXjLN9w_sP-ZE4QBxGL0-puow2zDKJd+Uw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 02:17:49PM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 16, 2020 at 3:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Fri, Oct 16, 2020 at 12:29 PM Helmut Grohne <helmut.grohne@intenta.de> wrote:
> > >
> >
> > [snip]
> >
> > > > +chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
> > > > +     : _m_chip(chip_ptr)
> > > > +{
> > > > +
> > > > +}
> > > > +
> > >
> > > I think what happens here is that you upgrade a weak_ptr to a
> > > shared_ptr. Wouldn't it be more natural to request a
> > >
> > >     ::std::shared_ptr<::gpiod_chip> &&
> > >
> > > here and thus make the ownership-taking more explicit? It would be done
> > > on the caller-side and thus be more transparent. Stuffing weak_ptrs
> > > should continue to work.
> > >
> >
> > Sure, sounds good.
> >
> 
> After a second look - I'm not sure if this is actually better. By
> taking weak_ptr reference as argument we benefit from implicit
> conversion to shared_ptr via shared_ptr's constructor taking weak_ptr
> as argument. What you propose would require us to always instantiate a
> shared_ptr in the argument list when calling the chip's constructor
> and makes code uglier in the end IMO.

On a second look, the use of an rvalue reference is suboptimal indeed.
The idea behind my change was this: Since chip stores a shared_ptr, it
can as well consume one. Instead of what I proposed, it should simply
take it by value (not rvalue):

    ::std::shared_ptr<::gpiod_chip>

An existing shared_ptr can be moved into the constructor and then moved
into the member variable. Doing so allows passing a shared_ptr around
without touching reference counts (which are prone to cache line
bouncing). When passing it by value, the implicit conversion from
weak_ptr should work again. Thus the caller would increase the reference
count and the chip would merely gain ownership of the shared_ptr and
move it around.

For reference, see Scott Myers' Effective Modern C++ "Item 41: Consider
pass by value for copyable parameters that are cheap to move and always
copied."

So yeah, it doesn't work the way I wrote initially, because I added the
rvalue reference.

Helmut
