From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/4] bitops: Introduce assign_bit()
Date: Tue, 22 Aug 2017 11:27:31 +0200
Message-ID: <20170822092731.k6zpoezpee5sal6w@hirez.programming.kicks-ass.net>
References: <cover.1503319573.git.lukas@wunner.de>
 <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
 <1503332323.2571.5.camel@wdc.com>
 <20170822083050.GA12241@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:50800 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932205AbdHVJ2D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2017 05:28:03 -0400
Content-Disposition: inline
In-Reply-To: <20170822083050.GA12241@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Bart Van Assche <Bart.VanAssche@wdc.com>, Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.com>, Ingo Molnar <mingo@redhat.com>, Theodore Ts'o <tytso@mit.edu>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Denys Vlasenko <dvlasenk@redhat.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "agk@redhat.com" <agk@redhat.com>, "phil@raspberrypi.org" <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "m.duckeck@kunbus.de" <m.duckeck@kunbus.de>, "snitzer@redhat.com" <snitzer@redhat.com>, linux-kernel@vger.kernel.org

On Tue, Aug 22, 2017 at 10:30:50AM +0200, Lukas Wunner wrote:
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index a83c822c35c2..097af36887c0 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -226,6 +226,30 @@ static inline unsigned long __ffs64(u64 word)
>  	return __ffs((unsigned long)word);
>  }
>  
> +/**
> + * assign_bit - Assign value to a bit in memory
> + * @value: the value to assign
> + * @nr: the bit to set
> + * @addr: the address to start counting from
> + */
> +static __always_inline void assign_bit(bool value, long nr,
> +				       volatile unsigned long *addr)
> +{
> +	if (value)
> +		set_bit(nr, addr);
> +	else
> +		clear_bit(nr, addr);
> +}
> +
> +static __always_inline void __assign_bit(bool value, long nr,
> +					 volatile unsigned long *addr)
> +{
> +	if (value)
> +		__set_bit(nr, addr);
> +	else
> +		__clear_bit(nr, addr);
> +}
> +

I dislike the argument order, in C you naturally write: dst = src. So I
would have expected:

	assign_bit(nr, addr, val);

but we have quite a few of these backwards functions in the kernel (like
most of the atomic_t family) and I didn't check to see if the existing
bitops are part of that 'tradition'.
