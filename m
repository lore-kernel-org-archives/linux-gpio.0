From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 3/3] pinctrl: sunxi: Make
 sunxi_pconf_group_set use sunxi_pconf_reg helper
Date: Fri, 11 Nov 2016 16:45:49 +0800
Message-ID: <CAGb2v64=FrhdGyT1UybqRfLHXRb--LwFn31G7VdndBbhDGV4-w@mail.gmail.com>
References: <20161111024455.16883-1-wens@csie.org> <20161111024455.16883-4-wens@csie.org>
 <20161111083852.yacy33g6pag6ucon@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVUKS3AQKGQEZ32WHRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161111083852.yacy33g6pag6ucon@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 11, 2016 at 4:38 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, Nov 11, 2016 at 10:44:55AM +0800, Chen-Yu Tsai wrote:
>> The sunxi_pconf_reg helper introduced in the last patch gives us the
>> chance to rework sunxi_pconf_group_set to have it match the structure
>> of sunxi_pconf_(group_)get and make it easier to understand.
>>
>> For each config to set, it:
>>
>>     1. checks if the parameter is supported.
>>     2. checks if the argument is within limits.
>>     3. converts argument to the register value.
>>     4. writes to the register with spinlock held.
>>
>> As a result the function now blocks unsupported config parameters,
>> instead of silently ignoring them.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>
> But I think the config variable removal should be part of patch 2, as
> discussed there.

OK. I think that makes sense. Re-reading my patches, I can't figure out,
which patch I meant for it to go in. :(

I'll send out a v3.

ChenYu
