From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Initialize pinctrl_dev.node
Date: Fri, 13 Jan 2017 16:32:13 +0100
Message-ID: <CACRpkdadZoDMmUbwM-AxAsrr5QsmA5en2Cj-xghvEsak+mq-eQ@mail.gmail.com>
References: <20170112160334.22943-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170112160334.22943-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2017 at 5:03 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The struct pinctrl_dev's node field is not properly set up, which means
> the .prev and .next fields will be NULL. That's not something that the
> linked list code can deal with, so extra care must be taken when using
> these fields. An example of this is introduced in commit 3429fb3cda34
> ("pinctrl: Fix panic when pinctrl devices with hogs are unregistered")
> where list_del() is made conditional on the pinctrl device being part
> of the pinctrl device list. This is to ensure that list_del() won't
> crash upon encountering a NULL pointer in .prev and/or .next.
>
> After initializing the list head there's no need to jump through these
> extra hoops and list_del() will work unconditionally. This is because
> the initialized list head points to itself and therefore the .prev and
> .next fields can be properly dereferenced.
>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Nice catch!

Sorry for my sloppy semantics...

Patch applied, had to rebase it with patch -p1 < foo.patch
so check the result on my devel branch or linux-next
soon-ish.

Yours,
Linus Walleij
