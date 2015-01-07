From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] gpio: dln2: fix issue when an IRQ is unmasked then enabled
Date: Wed, 7 Jan 2015 10:38:27 +0100
Message-ID: <CACRpkdZMPp3EY517F8_tViX3V1-zDPuFHEsXbPtwe+S9WW2Wmg@mail.gmail.com>
References: <1418745435-2851-1-git-send-email-octavian.purdila@intel.com>
	<1418745435-2851-2-git-send-email-octavian.purdila@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418745435-2851-2-git-send-email-octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Octavian Purdila <octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 16, 2014 at 4:57 PM, Octavian Purdila
<octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:

> As noticed during suspend/resume operations, the IRQ can be unmasked
> then disabled in suspend and eventually enabled in resume, but without
> being unmasked.
>
> The current implementation does not take into account interactions
> between mask/unmask and enable/disable interrupts, and thus in the
> above scenarios the IRQs remain unactive.
>
> To fix this we removed the enable/disable operations as they fallback
> to mask/unmask anyway.
>
> We also remove the pending bitmaks as it is already done in irq_data
> (i.e. IRQS_PENDING).
>
> Signed-off-by: Octavian Purdila <octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

This patch applied for fixes.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
