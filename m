From: Timo Teras <timo.teras@iki.fi>
Subject: Re: [PATCH] gpio: mcp23s08: support setting pullups from device
 tree data
Date: Tue, 15 Dec 2015 11:23:15 +0200
Message-ID: <20151215112315.4e0f274b@vostro>
References: <1449229573-25759-1-git-send-email-timo.teras@iki.fi>
	<5332318.fo424NgDVM@ws-stein>
	<20151207092259.665dbeea@vostro>
	<1922527.uScxQGmYqz@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36363 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933436AbbLOJXW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 04:23:22 -0500
Received: by mail-lf0-f45.google.com with SMTP id d137so1965400lfe.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2015 01:23:21 -0800 (PST)
In-Reply-To: <1922527.uScxQGmYqz@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: linux-gpio@vger.kernel.org

On Tue, 15 Dec 2015 09:09:04 +0100
Alexander Stein <alexander.stein@systec-electronic.com> wrote:

> On Monday 07 December 2015 09:22:59, Timo Teras wrote:
> > On Mon, 07 Dec 2015 07:53:08 +0100
> > Alexander Stein <alexander.stein@systec-electronic.com> wrote:
> >   
> > The other side is: Why would my gpio-keys input mapping
> > specification need know to what kind of GPIO input it is connected
> > to? What if I switch the GPIO expander - or the hardware schema?  I
> > need to edit 10 different places rather than one - places that are
> > about the high-level functionality, not the hardware. Normally the
> > pullup settings are hardware layout dependant, so GPIO
> > configuration would be the logical place.  
> 
> gpio-keys need to know this when selecting active low or active high.
> You usually need the corresponding pull up/down for this to work.

To me it looks active_low is just software invert. My understanding is
that pullups are practically always fixed configuration depending on how
the connection is physically wired. The only exception being that you
have development board where the physical wiring is subject to change.

> > One generally wants to configure pullups correctly for all GPIOs
> > regardless of if they are connected or not; or if the relevant
> > high-level gpio driver is loaded or not. And this should be done as
> > early as possible - even before the driver for that specific GPIO
> > pin functionality is loaded.  
> 
> This is also a valid point.
> 
> > Perphaps others have more arguments for the per-pin configuration?  
> 
> I get the impression both ways would be needed... which is kinda
> error-prone.

But yeah. If there's valid use cases for pullups to be changed, it
would justify both ways. But if needing to choose, I would prefer
specifying pullup register data in one place. Thus I chose that way
for the patch.

Perhaps this patch could be considered applied as-is then? Or is there
wishes to unify the OF property name?

Thanks,
Timo

