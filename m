From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] GPIO fix for v4.19
Date: Fri, 12 Oct 2018 13:12:07 +0200
Message-ID: <20181012111207.GE6536@kroah.com>
References: <CACRpkdb-KP_m6+2oB9r-WbR9K3juC+EMjgktv7v-PS_OACie=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb-KP_m6+2oB9r-WbR9K3juC+EMjgktv7v-PS_OACie=w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 12, 2018 at 10:34:55AM +0200, Linus Walleij wrote:
> Hi Greg,
> 
> here is a last minute GPIO fix for the v4.19 series.
> 
> This fixes GPIO IRQchip parent assignment on a lot
> of GPIO drivers.
> 
> Please pull it in!
> 
> Yours,
> Linus Walleij
> 
> The following changes since commit 0238df646e6224016a45505d2c111a24669ebe21:
> 
>   Linux 4.19-rc7 (2018-10-07 17:26:02 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
> tags/gpio-v4.19-4

Now merged, thanks.

greg k-h
