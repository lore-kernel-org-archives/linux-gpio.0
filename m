From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH v2 2/5] dts: sun8i-h3: Add APB0 related
 clocks and resets
Date: Wed, 3 Feb 2016 23:21:17 +0100
Message-ID: <20160203222117.GA12071@box2.japko.eu>
References: <1454448113-18810-1-git-send-email-k@japko.eu>
 <1454448113-18810-3-git-send-email-k@japko.eu>
 <20160203123534.GG4652@lukather>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDIL57GUWIARBZH2ZG2QKGQEP4Y53KA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160203123534.GG4652@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 03, 2016 at 01:35:34PM +0100, Maxime Ripard wrote:
>Hi,
>
>On Tue, Feb 02, 2016 at 10:21:50PM +0100, Krzysztof Adamski wrote:
>> APB0 is bearly mentioned in H3 User Manual and it is only setup in the
>> Allwinners kernel dump for CIR. I have verified experimentally that the
>> gate for R_PIO exists and works, though. There are probably other gates
>> there but I don't know their order right now and I don't have access to
>> their peripherals on my board to test them.
>>
>> Signed-off-by: Krzysztof Adamski <k@japko.eu>
>> ---
>>  arch/arm/boot/dts/sun8i-h3.dtsi | 32 ++++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
>> index 1524130e..ce35e93 100644
>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> @@ -276,6 +276,32 @@
>>  			clocks = <&osc24M>, <&pll6 1>, <&pll5>;
>>  			clock-output-names = "mbus";
>>  		};
>> +
>> +		ahb0: ahb0_clk {
>> +			compatible = "fixed-factor-clock";
>> +			#clock-cells = <0>;
>> +			clock-div = <1>;
>> +			clock-mult = <1>;
>> +			clocks = <&osc24M>, <&osc32k>;
>> +			clock-output-names = "ahb0";
>> +		};
>
>I'm not sure what you mean there. The fixed factor clocks only take a
>single parent, and you provided two.

True, I that's actually some stupid leftover. As mentioned in the commit 
message I didn't really know how the clock tree looks like here so I 
wanted to just pretend it's connectet to osc24M. After some experiments 
I think that 0x01f0140c register does not exist on H3 and I was finally 
(hopefully) able to understand how this clock is set up in Allwinner's 
code. So I changed the clock to factors clock with possible osc32k and 
osc24M parrents. Will send it in v3.
