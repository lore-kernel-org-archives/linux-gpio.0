From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: mvebu: Add PWM fan support
Date: Thu, 23 Mar 2017 10:57:26 +0100
Message-ID: <20170323105726.2200c806@gmail.com>
References: <20170318154305.28348-1-ralph.sennhauser@gmail.com>
        <CACRpkdbdnkWpDHeAwWQ-dmJL4DB-vsW17Po7-7bzKMPCb_KaMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pwm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbdnkWpDHeAwWQ-dmJL4DB-vsW17Po7-7bzKMPCb_KaMA@mail.gmail.com>
Sender: linux-pwm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Imre Kaloz <kaloz@openwrt.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, 23 Mar 2017 10:23:47 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Sat, Mar 18, 2017 at 4:43 PM, Ralph Sennhauser
> <ralph.sennhauser@gmail.com> wrote:
> 
> > This patch series was originally submitted by Andrew Lunn but got
> > stalled. I picked up the series and addressed what was discussed
> > for the earlier submission with some helpful input from Andrew.
> > Hopefully this time support for the PWM fan as found on Linksys
> > WRT1900AC (Mamba) will make it in.  
> 
> All looks good to me, I'm waiting for an ACK from the PWM
> maintainer.
> 
> Yours,
> Linus Walleij

Hi Linus,

There are still several open issues brought up by the PWM maintainer
after posting v2 which need to be addressed first (not done in 5
minutes). There will be a v3 for sure and maybe a v4 if necessary. v3
is currently under verification.

Thanks for applying the additional cleanup patch.

Thanks
Ralph
