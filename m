From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: Rework strap register write logic for
 the AST2500
Date: Thu, 31 Aug 2017 13:40:26 +0200
Message-ID: <CACRpkdYb=kADkSQ2sWiDhQBDbqzUhU1F36jLk5W+hPs6cU6pWg@mail.gmail.com>
References: <20170823134125.2339-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36395 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751439AbdHaLk1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 07:40:27 -0400
Received: by mail-oi0-f48.google.com with SMTP id t75so3202268oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 04:40:27 -0700 (PDT)
In-Reply-To: <20170823134125.2339-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yong Li <sdliyong@gmail.com>

On Wed, Aug 23, 2017 at 3:41 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Yong Li found that writes to the AST2500 strapping register were not
> properly supported by the Aspeed pinctrl core and provided a patch to
> rectify the problem. Several revisions of the patch were posted and
> ultimately v4 should have been applied, however some unfortunate
> liberal application of tags on my part lead to confusion between v3[1]
> and v4[2].
>
> Generate the diff between v3 and v4 to apply as a fixup patch.
>
> [1] http://patchwork.ozlabs.org/patch/801662/
> [2] http://patchwork.ozlabs.org/patch/802946/
>
> Cc: Yong Li <sdliyong@gmail.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
