From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: gpio regression in linux-next
Date: Mon, 17 Sep 2018 08:53:00 -0700
Message-ID: <CACRpkdbCwwNmhHHL8cY8zC9+Huyif+z44rpgcHrZF_9NG68xgg@mail.gmail.com>
References: <20180917124935.GA26204@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180917124935.GA26204@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 17, 2018 at 5:49 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:

> I hit a BUG while attempting to unload fusb302 driver module on my
> Intel CHT board (GPDWin). I bisected it to commit:
>
>         461c1a7d4733 ("gpiolib: override irq_enable/disable")

Sorry for not getting the fix out to next in time, and also thanks
for the Tested-by!

I pushed the fix to for-next now.

Yours,
Linus Walleij
