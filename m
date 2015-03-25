From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/6] pinctrl: st: Supply a GPIO get_direction() call-back
Date: Wed, 25 Mar 2015 16:37:30 +0100
Message-ID: <CACRpkdb+VLeO5myAqSwRq_ppSxUpOBi3YdTORx6Tk=9GQu=Txw@mail.gmail.com>
References: <1426699279-9258-1-git-send-email-lee.jones@linaro.org>
	<1426699279-9258-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426699279-9258-5-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel@stlinux.com
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 18, 2015 at 6:21 PM, Lee Jones <lee.jones@linaro.org> wrote:

> ST's hardware differentiates between GPIO mode and Pinctrl alternate
> functions.  When a pin is in GPIO mode, there are dedicated registers
> to set and obtain direction status.  However, If a pin's alternate
> function is in use then the direction is set and status is derived
> from a bunch of syscon registers.  The issue is; until now there was
> a lack of parity between the two.
>
> For example:
>
> Catting the two following information sources could result in
> conflicting information (output has been snipped for simplicity):
>
>  $ cat /sys/kernel/debug/gpio
>   GPIOs 32-39, platform/961f080.pin-controller-sbc, PIO4:
>    gpio-33  (?                   ) out hi
>
>  $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
>   pin 33 (PIO4[1]):[OE:0,PU:0,OD:0]
>          [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:0]
>
> In this example GPIO-33 is a GPIO controlled LED, which is set for
> output, as you'd expect.  However, when the same information is
> drafted from Pinctrl, it clearly states that OE (Output Enable) is
> not set i.e. the pin is set for input.  This is because OE normally
> only represents alternate functions and has no bearing on how the
> pin operates when in Alt-0 (GPIO mode).
>
> This patch changes the current semantics and provides a parity link
> between the two subsystems.  The get_direction() call-back firstly
> determines which function a pin is operating in, then uses the
> appropriate helpers for that mode.
>
> Reported-by: Olivier Clergeaud <olivier.clergeaud@st.com>
> Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied.

Yours,
Linus Walleij
