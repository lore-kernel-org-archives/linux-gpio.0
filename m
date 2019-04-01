From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Mon, 1 Apr 2019 15:22:56 +0300
Message-ID: <20190401122256.GF9224@smile.fi.intel.com>
References: <20171121120422.GR22431@lahna.fi.intel.com>
 <CAD8Lp444FNHZh6fLUfhfp1i_UBpMbS5QuvJ4FuZn7PKH1Ucy=A@mail.gmail.com>
 <20190327172940.GR3622@lahna.fi.intel.com>
 <20190328091729.GV9224@smile.fi.intel.com>
 <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
 <CAB4CAwfH237-EUgfyR8-KWKo0HJOf=QkxiNjkBRg+gBpbKiM7g@mail.gmail.com>
 <20190328123444.GX3622@lahna.fi.intel.com>
 <CAB4CAwcQTH5BiDDbzfFXTDDuYQ_fuDd_1tKkecf6vwygGQmn5w@mail.gmail.com>
 <20190401074953.GQ3622@lahna.fi.intel.com>
 <CAB4CAweW_3p4i_8ntscJyU9n55HwdLt3pxyT3Gf6SUSbZAJ8qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAB4CAweW_3p4i_8ntscJyU9n55HwdLt3pxyT3Gf6SUSbZAJ8qA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 01, 2019 at 06:41:57PM +0800, Chris Chiu wrote:
> On Mon, Apr 1, 2019 at 3:49 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Fri, Mar 29, 2019 at 04:38:20PM +0800, Chris Chiu wrote:

> > Sure I can but it probably does not happen until end of the week because
> > I'm currently busy with something else.
> 
> Thanks for your attention. I don't want to distract you so I'll try to
> refine the
> patch. It would be a great help if you can help review and give comments.
> 
> Don't know whether if the following patch still get the wrong idea about
> your thought.  It saves the hostsw_own when GPIO requested, check
> if the value differs in resume() and restore if necessary. Please kindly
> correct me if any. Thanks

Thanks for the patch.
My comments below.

> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> b/drivers/pinctrl/intel/pinctrl-intel.c
> index 8cda7b535b02..d1cfa5adef9b 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -77,6 +77,7 @@ struct intel_pad_context {
>         u32 padcfg0;
>         u32 padcfg1;
>         u32 padcfg2;

> +       u32 hostown;

This is wrong. We have one register per entire (*) group of pins to keep host
ownership. Basically it's a mask.

*) if it's <= 32, otherwise there are more registers. But in any case it's 1
bit per pin, and not 32 bits.

>         for (i = 0; i < pctrl->soc->npins; i++)

Thus, the actual actions should mimic what we do for interrupt mask.

-- 
With Best Regards,
Andy Shevchenko
