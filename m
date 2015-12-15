From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] gpio: generic: clamp values from bgpio_get_set()
Date: Tue, 15 Dec 2015 09:00:13 -0800
Message-ID: <20151215170013.GB18302@kroah.com>
References: <1449869778-6974-1-git-send-email-linus.walleij@linaro.org>
 <CAOMZO5DVNm9JK080RQ+OnhtBVyt+VYc5PmdYDUzRnJDBZ+3CEg@mail.gmail.com>
 <CACRpkdb2nv99RN1PGwQx7LxSd1_jn0A5MAB7YGTY5TWm_s7z5A@mail.gmail.com>
 <CAOMZO5D22UWVOr3J-LgwB41w8XJcvyraeKgfvgUpCr1Uv8kL6A@mail.gmail.com>
 <CACRpkdZoz8vM1Jiyn7y39d14ezO4F5PLGXT2S5F8CKbWjAZrAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51531 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbbLORAP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 12:00:15 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZoz8vM1Jiyn7y39d14ezO4F5PLGXT2S5F8CKbWjAZrAw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, linux-stable@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Tue, Dec 15, 2015 at 09:37:53AM +0100, Linus Walleij wrote:
> On Fri, Dec 11, 2015 at 11:23 PM, Fabio Estevam <festevam@gmail.com> wrote:
> > On Fri, Dec 11, 2015 at 8:10 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> >>>> Fixes: b19e7f51a55f "gpio: gpio-generic: add flag to read out output value from reg_set"
> >>>
> >>> This commit appeared in 4.2, so it would be nice to add a stable tag:
> >>>
> >>> Cc: <stable@vger.kernel.org> # 4.2+
> >>
> >> IIUC Fixes: has exactly this effect: it will be applied to any kernel where
> >> that commit is present. The beauty of git commit hashes.
> >
> > Not sure if this has the same effect as it is not mentioned at
> > Documentation/stable_kernel_rules.txt
> 
> I have surely noticed it having that effect in practice, maybe it is time
> to send a patch to that document.

No, please don't.  I do pick up _some_ patches that have "Fixes:" tags
in them, if they look relevant, and I'm bored at the moment.  Otherwise,
if you want something in a stable release, put the needed
"stable@vger.kernel.org" tag in it, that way you know it will go there
as I know to look for that.

thanks,

greg k-h
