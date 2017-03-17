From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: Re: [PATCH 6/6] gpio: mvebu: let the compiler inline
Date: Fri, 17 Mar 2017 10:08:01 +0100
Message-ID: <20170317100801.7300da57@gmail.com>
References: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
 <20170316063402.8667-7-ralph.sennhauser@gmail.com>
 <CACRpkdaPMc8pe7cPuggr-ch8c7e7exXuempYFWv02yvD6wuP+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34338 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750967AbdCQJJE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Mar 2017 05:09:04 -0400
In-Reply-To: <CACRpkdaPMc8pe7cPuggr-ch8c7e7exXuempYFWv02yvD6wuP+A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>

On Thu, 16 Mar 2017 16:44:58 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Thu, Mar 16, 2017 at 7:34 AM, Ralph Sennhauser
> <ralph.sennhauser@gmail.com> wrote:
> 
> > A modern compiler should know better when to inline, so drop the
> > inline keywords.
> >
> > Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>  
> 
> A bit hesitant about this but whatever, patch applied.
> 
> Yours,
> Linus Walleij

Hi Linus,

I thought this might be accepted or not so I just gave it a try. :)

Looks like linux-next is on hiatus though ...

Thanks
Ralph
