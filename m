From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Sat, 20 Jan 2018 17:02:40 +0100
Message-ID: <20180120160240.GA4548@archie.localdomain>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:65430 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754653AbeATQCn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jan 2018 11:02:43 -0500
Content-Disposition: inline
In-Reply-To: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org

Hi Bartosz,

On Fri, Jan 19, 2018 at 02:28:40PM +0100, Bartosz Golaszewski wrote:
> Hi,
> 
> I would like to release libgpiod v1.0 soon (preferably before FOSDEM
> 2018). The first version (v0.x series) was written in a matter of two
> weeks and the API was not well designed. Since v0.3 release I've been
> working on redesigning the public API to make it simplier and more
> useful.
> 
> I want to commit to a stable interface for the library starting from
> v1.0 but it would be great if I could get some reviews first - it's
> basically only about reviewing a single public header: include/gpiod.h
> in which all public symbols are documented. Any implementation details
> can always be changed later.
> 
> The most prominent changes since 0.3 include:
> - removal of custom error handling in favor of errnos
> - merge of two separate interfaces for event requests and regular line requests
> - redesign of the simple API
> - addition of a bunch of helpers for line requests
> - redesign of the iterator API
> - making the use of prefixes more consistent
> - renaming of symbols all over the place
> - and various minor tweaks
> 
> As far as usefulness goes - the user space tools that are included all
> use this API and it looks pretty clean.
> 
> The project is hosted at kernel.org:
> 
>     https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
> 
> and the code that needs review is on the master branch.
> 
> Thanks in advance to anyone who'll find the time to take a look.

Looks good to me, great work!

Only one question:

- GPIOD_LINE_BULK_MAX_LINES
Would increasing this in the future break the API in your opinion? And
if so, is 64 enough?


I also have a few minor patches in the works but they are only
implementation and build system related, not touching gpiod.h.

Best regards,
Clemens

> 
> Best regards,
> Bartosz Golaszewski
