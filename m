From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [RFC PATCH] drivers: pinctrl: add driver for
 Allwinner A64 SoC
Date: Tue, 29 Mar 2016 00:19:29 +0800
Message-ID: <CAGb2v64sv7CuuTC8fZV0spmiC=MYM3iqABr-EOC9oheXQ10C3Q@mail.gmail.com>
References: <1451582246-32373-1-git-send-email-andre.przywara@arm.com> <CABHD4K-nD9EvbgOPA2WH0q66csqVv18tmeTOBe87ACr4nuQM0A@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKFT4W3QKGQEAIGKU5Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CABHD4K-nD9EvbgOPA2WH0q66csqVv18tmeTOBe87ACr4nuQM0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Amit Tomer <amittomer25-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 29, 2016 at 12:15 AM, Amit Tomer <amittomer25-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello ,
>
>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>> +                 SUNXI_FUNCTION(0x2, "mic"),           /* DATA */
>> +                 SUNXI_FUNCTION_IRQ(0x6, 11)),         /* EINT11 */
>> +};
>> +
>
> Sorry to intervene here but is there any specific reason for not
> covering Bank from PL0 - PL12(as it is mentioned in Datasheet) ?


The PL bank is a separate controller (R_PIO), and would be covered by
a separate driver.
See the other sunxi drivers.

ChenYu
