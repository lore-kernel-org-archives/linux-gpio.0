From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: sunxi: Don't leak memory in case krealloc() failes
Date: Mon, 10 Oct 2016 10:36:33 +0200
Message-ID: <CACRpkda3LPnU3Q+2SdKBbTzWzjLTZ9gpdDotEe=go3qjc4fVKQ@mail.gmail.com>
References: <1475237653-15164-1-git-send-email-jthumshirn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475237653-15164-1-git-send-email-jthumshirn@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 30, 2016 at 2:14 PM, Johannes Thumshirn <jthumshirn@suse.de> wrote:

> If krealloc() fails there's no way of freeing the memory previously allocated
> for pctl->functions as it is overwritten by krealloc()'s return value. Fix
> this by assigning the return value to a temporary variable first so we can do
> error handling (which we didn't do at all before).
>
> Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>

Patch applied.

Yours,
Linus Walleij
