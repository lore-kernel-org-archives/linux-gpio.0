From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Re: [PATCH v2 3/5] pinctrl: sunxi: Add H3 R_PIO
 controller support
Date: Mon, 15 Feb 2016 10:17:23 +0100
Message-ID: <CACRpkdbfNeh7_=3ReQtJc7OxkkQEn+BUhZ0O0SKnFsRD=WZiUQ@mail.gmail.com>
References: <1454448113-18810-1-git-send-email-k@japko.eu>
	<1454448113-18810-4-git-send-email-k@japko.eu>
	<CACRpkdZkSzcb0fmghkvsfRHpsU-SsSGPP6YvstAW7387HS0xJw@mail.gmail.com>
	<20160215080816.GA6426@box2.japko.eu>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARBI5PQ23AKGQEVKGLUYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160215080816.GA6426-xLeyfSbClftGit24Ens98Q@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Krzysztof Adamski <k@japko.eu>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2016 at 9:08 AM, Krzysztof Adamski <k@japko.eu> wrote:
> On Thu, Feb 11, 2016 at 02:21:15PM +0100, Linus Walleij wrote:
>>
>> On Tue, Feb 2, 2016 at 10:21 PM, Krzysztof Adamski <k@japko.eu> wrote:
>>
>>> H3 has additional PIO controller similar to what we can find on A23.
>>> It's a 12 pin port, described in H3 Datasheet rev 1.1, pages 345-350.
>>>
>>> Signed-off-by: Krzysztof Adamski <k@japko.eu>
>>
>>
>> Patch applied with Maxime's ACK.
>
>
> Hi Linus,
>
> You took v2 which does not add documentation for
> allwinner,sun8i-h3-r-pinctrl compatible that is added in this patch.  This
> was fixed in v3. Should I prepare a patch for you that only adds this to the
> documentation or you can handle this by taking v3/v4 instead of this patch?

Ooops please send a fixup patch, I don't like to rebase the
tree if possible. Sorry for the mess and thanks for your help.

Yours,
Linus Walleij
