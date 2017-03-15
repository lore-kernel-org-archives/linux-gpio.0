From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] pc104: Mask PC/104 Kconfig options
Date: Wed, 15 Mar 2017 22:00:04 +0000
Message-ID: <73b3264d-9167-d871-d218-cbfb96cb5b45@kernel.org>
References: <cover.1484073324.git.vilhelm.gray@gmail.com>
 <CACRpkdaqeLktgqmd6qcdGmruxABS0fWQacPOTYf0V24cKyiSRA@mail.gmail.com>
 <20170301204652.GA31812@sophia>
 <61fd7559-9001-ede7-f16d-2f74f8f9ef61@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <61fd7559-9001-ede7-f16d-2f74f8f9ef61-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On 05/03/17 12:48, Jonathan Cameron wrote:
> On 01/03/17 20:46, William Breathitt Gray wrote:
>> On Wed, Jan 11, 2017 at 04:26:19PM +0100, Linus Walleij wrote:
>>> On Tue, Jan 10, 2017 at 7:50 PM, William Breathitt Gray
>>> <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>>> PC/104 form factor devices serve a specific niche of embedded system
>>>> users. Since PC/104 devices and hardware are typically used by just a
>>>> subset of Linux users, it would be appropriate to filter PC/104 related
>>>> Kconfig options for those uninterested.
>>>>
>>>> This patchset introduces the PC104 Kconfig option, and uses it to mask
>>>> PC/104 specific device drivers and options, so that only those users
>>>> interested in PC/104 related Kconfig options are exposed to them.
>>>
>>> Tell me when/if the PC104 option is merged and I can merge the GPIO
>>> patch.
>>>
>>> Yours,
>>> Linus Walleij
>>
>> Jonathan and Linus,
>>
>> Now that the PC104 option is merged for 4.11, it should be all right to
>> merge in the GPIO and IIO patches without worry of warnings. Please
>> merge the relevant patch to your respective tree after you pull in the
>> PC104 option.
> If it looks like I've forgotten this, feel free to poke me again!
> 
> At least replying to you should get it back into my recent threads
> in my email client ;)
> 
Done,. Applied to the togreg branch of iio.git and pushed out as
testing for the autobuilders to play with it.

Thanks,

Jonathan
> Jonathan
>>
>> Thank you,
>>
>> William Breathitt Gray
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
