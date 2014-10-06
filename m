From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [RFC PATCH] gpio: add GPIO hogging mechanism
Date: Mon, 6 Oct 2014 10:37:36 -0500
Message-ID: <20141006153736.GB973@ti.com>
References: <CACRpkdb47TFJX=7kEM-D3+HB1JvBe1y+D10ohTqa5D=brp1dfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb47TFJX=7kEM-D3+HB1JvBe1y+D10ohTqa5D=brp1dfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Linus,

Sorry about the resend, but i just realized i should have copied you
directly on the follow-up.

Please let me know what you think.
I do have a modified version of Boris' first patch addressing your original 
comments which I am planning to submit if you it is still a valid idea.

Regards,
Benoit Parrot

Linus Walleij <linus.walleij <at> linaro.org> writes:

> 
> On Wed, Jan 8, 2014 at 11:18 AM, boris brezillon
> <b.brezillon <at> overkiz.com> wrote:
> 
> > Anyway, do you want me to rework the gpio hog as described below ?
> 
> If you feel you have time, drive and a proper usecase for testing it,
> sure. I just want it to be driven my someone who *really* needs
> that feature.

As Felipe mentioned we do have several evm with IO-expander controlling 
various mux. This feature would be very nice to have as we now have to 
insert the board related gpio setting code in the pdata-quirks which 
works temporarily but we are looking for an upstreamable solution.

I am leaning toward taking Boris patch set and reworking them given the 
comments you already had, unless you have a better ideas in mind.

Regards,
Benoit Parrot

> 
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" 
in
> the body of a message to majordomo <at> vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 




