From: Krzysztof Adamski <k@japko.eu>
Subject: Re: Re: [PATCH v3 1/5] clk: sunxi: Add apb0 gates for H3
Date: Wed, 10 Feb 2016 08:17:14 +0100
Message-ID: <20160210071713.GA19622@box2.japko.eu>
References: <1454542430-16572-1-git-send-email-k@japko.eu>
 <1454542430-16572-2-git-send-email-k@japko.eu>
 <20160204154752.4df7808be3364a98c496c030@free.fr>
 <20160205111152.GA31506@lukather>
 <20160205115837.GD12071@box2.japko.eu>
 <20160209171040.GR31506@lukather>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDIL57GUWIARBGGI5O2QKGQELMXEW2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160209171040.GR31506@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, inus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 09, 2016 at 06:10:40PM +0100, Maxime Ripard wrote:
>> >>It seems that the other compatible strings are there for historical
>> >>reasons. Why do you need a new one with such a specific name?
>> >>
>> >>It would have been more sensible to add a generic compatible string as
>> >>"allwinner,apb-gates", letting the removal of the other strings for a
>> >>later patch...
>> >
>> >Yeah, it's a good idea, and it's probably time that we move to that.
>> >
>> >However, I'd like to keep per-soc and per-clocks compatibles in the
>> >DT, in case we need to protect a clock in the future. That doesn't
>> >prevent to have two compatibles thoughe, the specific and the generic.
>> >
>>
>> So now I'm not sure what you mean. You suggest that I should keep using
>> specific (sun8i_h3_apb0) or change to generic (apb-gates) in my patch?
>
>Both.
>
>To have something like that:
>
>compatible = "allwinner,sun8i-h3-apb0-gates-clk", "allwinner,sun4i-a10-gates-clk";
>
>sun4i-a10-gates-clk being the generic compatible that we would use,
>and we can always match against the h3 specific compatible if we need
>to have a different behaviour.

This seems like a good idea to me but since this is new thing anyways 
(other sunxi SoCs don't do this right now) shouldn't we introduce other
more generic name for generic clock (like "allwinner,apb-gates" 
mentioned earlier, or maybe "allwinner,simple-apb-gates")?

Also, wouldn't this be cleaner if I use only specific compatible string 
right now and provide separate patch that adds generic compatible string 
to all current SoCs at once? The downside of this is that it's easier to 
get merge conflicts unless I wait for applying this patchset.

Best regards,
Krzysztof Adamski
