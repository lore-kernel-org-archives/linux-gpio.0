From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: number gpio ranges
 starting from 0
Date: Thu, 24 Jul 2014 21:19:18 +0800
Message-ID: <CAGb2v64mZjmB+ftQ7yM5LzhUyPVGtCXq6DOUQ-pumLb73_DYLQ@mail.gmail.com>
References: <1405358677-23657-1-git-send-email-wens@csie.org> <1405358677-23657-3-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB2UPYSPAKGQEEJTZBNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1405358677-23657-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hi Maxime,

On Tue, Jul 15, 2014 at 1:24 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> The pinctrl-sunxi driver originally used the pin number as the gpio
> range offset. This resulted in large, bogus gpio numbers for the
> new sun6i-a31-r pinctrl devices.
>
> This patch makes the driver number the gpios ranges starting from an
> offset of 0, by subtracting the pin_base number from the pin number.
> This also makes the system-wide gpio number match the pin number.
>
> Tested on sun8i with sysfs exported gpios.
>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>
> This patch also changes the GPIO bindings for R_PIO:
>
>     gpios = <&r_pio B N flag>;
>
> Where B originally was the pinbank label (L or M) counted from A,
> with this patch it becomes (L or M) counted from its pinbank base (L).
>
> Thus
>
>     gpios = <&r_pio 10 11 0>; /* PL11 */
>
> becomes
>
>     gpios = <&r_pio 0 11 0>; /* PL11 */
>
> IMO this is correct, as the binding shows the bank offset and pin offset
> within the bank for the GPIO controller. But I'm worried it might be a
> bit confusing.

I see you Acked this patch, but also in your reply to my cover letter,
you mentioned that you want absolute pin numbers matching the datasheets.
What about the GPIO DT bindings, as I explained above?

Just double checking. Thanks.

ChenYu
