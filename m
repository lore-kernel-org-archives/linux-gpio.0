From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH v3 1/5] clk: sunxi: Add apb0 gates for H3
Date: Fri, 5 Feb 2016 12:58:37 +0100
Message-ID: <20160205115837.GD12071@box2.japko.eu>
References: <1454542430-16572-1-git-send-email-k@japko.eu>
 <1454542430-16572-2-git-send-email-k@japko.eu>
 <20160204154752.4df7808be3364a98c496c030@free.fr>
 <20160205111152.GA31506@lukather>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDIL57GUWIARB6M42K2QKGQERKVSFPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160205111152.GA31506@lukather>
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

On Fri, Feb 05, 2016 at 12:11:52PM +0100, Maxime Ripard wrote:
>Hi,
>
>On Thu, Feb 04, 2016 at 03:47:52PM +0100, Jean-Francois Moine wrote:
>> On Thu,  4 Feb 2016 00:33:46 +0100
>> Krzysztof Adamski <k@japko.eu> wrote:
>>
>> > This patch adds support for APB0 in H3. It seems to be compatible with
>> > earlier SOCs. apb0 gates controls R_ block peripherals (R_PIO, R_IR,
>> > etc).
>> >
>> > Signed-off-by: Krzysztof Adamski <k@japko.eu>
>> > ---
>> >  Documentation/devicetree/bindings/clock/sunxi.txt | 1 +
>> >  drivers/clk/sunxi/clk-simple-gates.c              | 2 ++
>> >  2 files changed, 3 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
>> > index e59f57b..751c8b9f0 100644
>> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt
>> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
>> > @@ -45,6 +45,7 @@ Required properties:
>> >  	"allwinner,sun6i-a31-apb0-gates-clk" - for the APB0 gates on A31
>> >  	"allwinner,sun7i-a20-apb0-gates-clk" - for the APB0 gates on A20
>> >  	"allwinner,sun8i-a23-apb0-gates-clk" - for the APB0 gates on A23
>> > +	"allwinner,sun8i-h3-apb0-gates-clk" - for the APB0 gates on H3
>> >  	"allwinner,sun9i-a80-apb0-gates-clk" - for the APB0 gates on A80
>> >  	"allwinner,sun4i-a10-apb1-clk" - for the APB1 clock
>> >  	"allwinner,sun9i-a80-apb1-clk" - for the APB1 bus clock on A80
>> > diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-simple-gates.c
>> > index f4da52b..6753c87 100644
>> > --- a/drivers/clk/sunxi/clk-simple-gates.c
>> > +++ b/drivers/clk/sunxi/clk-simple-gates.c
>> > @@ -130,6 +130,8 @@ CLK_OF_DECLARE(sun8i_a23_apb2, "allwinner,sun8i-a23-apb2-gates-clk",
>> >  	       sunxi_simple_gates_init);
>> >  CLK_OF_DECLARE(sun8i_a33_ahb1, "allwinner,sun8i-a33-ahb1-gates-clk",
>> >  	       sunxi_simple_gates_init);
>> > +CLK_OF_DECLARE(sun8i_h3_apb0, "allwinner,sun8i-h3-apb0-gates-clk",
>> > +	       sunxi_simple_gates_init);
>> >  CLK_OF_DECLARE(sun9i_a80_ahb0, "allwinner,sun9i-a80-ahb0-gates-clk",
>> >  	       sunxi_simple_gates_init);
>> >  CLK_OF_DECLARE(sun9i_a80_ahb1, "allwinner,sun9i-a80-ahb1-gates-clk",
>>
>> It seems that the other compatible strings are there for historical
>> reasons. Why do you need a new one with such a specific name?
>>
>> It would have been more sensible to add a generic compatible string as
>> "allwinner,apb-gates", letting the removal of the other strings for a
>> later patch...
>
>Yeah, it's a good idea, and it's probably time that we move to that.
>
>However, I'd like to keep per-soc and per-clocks compatibles in the
>DT, in case we need to protect a clock in the future. That doesn't
>prevent to have two compatibles thoughe, the specific and the generic.
>

So now I'm not sure what you mean. You suggest that I should keep using 
specific (sun8i_h3_apb0) or change to generic (apb-gates) in my patch? 
