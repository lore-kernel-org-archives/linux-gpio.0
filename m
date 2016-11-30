From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [RFC] pinctrl: imx: use radix trees for groups and functions
Date: Wed, 30 Nov 2016 15:09:52 +0100
Message-ID: <20161130140952.cjl3fxab2lejrh5m@t450s.lan>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <CAOMZO5D7z2w2xXWHYp7Qzz8evT-6xM=mL4pswzG-G2M_R0DvqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:35881 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757200AbcK3OJ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 09:09:59 -0500
Received: by mail-wm0-f44.google.com with SMTP id g23so270854292wme.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 06:09:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAOMZO5D7z2w2xXWHYp7Qzz8evT-6xM=mL4pswzG-G2M_R0DvqA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Peng Fan <van.freenix@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Hi Fabio, All,

On Wed, Nov 30, 2016 at 11:19:53AM -0200, Fabio Estevam wrote:
> Hi Gary,
> 
> On Thu, Nov 24, 2016 at 9:38 PM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
> > This change is inspired from the pinctrl-single architecture.
> >
> > The problem with current implementation is that it isn't possible
> > to add/remove functions and/or groups dynamically. The radix tree
> > offers an easy way to do so. The intent is to offer a follow-up
> > patch later that will enable the use of pinctrl nodes in dt-overlays.
> 
> Maybe you could re-post it including the follow-up patch that allows
> the usage  of pinctrl nodes in dt-overlays?
> 
> This way we can have a better picture of the final result.

Sure. But before doing so I'd like to share my findings after adding the
of_notifier:

1- Needs to remove the const qualifier of info, otherwise each member is
read-only and can't be updated. Hope everybody is ok with that, but I
don't see any other option to be able to increase the number of
functions/groups.

2- The way to get groups from a function (get_function_groups) makes it
hard to modify the number of groups of a specific function. Indeed it
would require re-alloc'ing the char**. Instead, it'd be best to make a
function for each group like it is done in pinctrl-single.
In this case, the function name would be the same as its single group
name. Then it is easy to add functions.

This approach looks good, IMO, when a device tree is using the "new
iomux scheme" since there's no real function. For the "legacy" scheme it
can be confusing since there are functions in the device tree (each
iomux sub-node). Is the legacy iomux scheme here to stay or is there a
plan to modify every device tree to comply to the new layout?

The other solution I came up with was that each overlay must have its
own function and cannot expand an existing function. This is an
unnecessary limitation in my opinion but I wanted to discuss it here
before submitting any of the two solutions.

My testing was done adding a dt-overlay pinctrl node, currently I'm not
sure how to cleanly remove a pinctrl function/group. It is not supported
in any of the pinctrl for now, but maybe it'd be a good time to think of
it.

Let me know if you have any question.

Regards,
Gary
