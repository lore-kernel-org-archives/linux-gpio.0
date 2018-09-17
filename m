From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: gpio regression in linux-next
Date: Mon, 17 Sep 2018 16:23:51 +0300
Message-ID: <20180917132351.GG19329@kuha.fi.intel.com>
References: <20180917124935.GA26204@kuha.fi.intel.com>
 <9571ebce-d19a-c52f-3273-48dc75168341@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9571ebce-d19a-c52f-3273-48dc75168341@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 17, 2018 at 02:58:58PM +0200, Hans Verkuil wrote:
> On 09/17/2018 02:49 PM, Heikki Krogerus wrote:
> > Hi,
> > 
> > I hit a BUG while attempting to unload fusb302 driver module on my
> > Intel CHT board (GPDWin). I bisected it to commit:
> > 
> >         461c1a7d4733 ("gpiolib: override irq_enable/disable")
> 
> Does your linux-next have this patch:
> 
> https://patchwork.ozlabs.org/patch/969684/

Nope, it wasn't there yet. It wasn't yet in Linus fixes nor for-next
branches either.

> If not, please try again with that patch. If it has, then please let me
> know and I'll try to take a look.

That patch worked! The issue is gone after applying it. FWIW:

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


Thanks,

-- 
heikki
