From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] clk: let of_clk_get_parent_name() fail for invalid clock-indices
Date: Mon, 30 Nov 2015 17:48:55 +0900
Message-ID: <CAK7LNASwK_B7L7wpgTBEdoOOeFrHFD603q_Wfap-v+C3FWpFWg@mail.gmail.com>
References: <1448873164-22415-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448873164-22415-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

2015-11-30 17:46 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Currently, of_clk_get_parent_name() returns a wrong parent clock name
> when "clock-indices" property exists and the target index is not
> found in the property.  In this case, NULL should be returned.
>
> For example,
>
>         oscillator {
>                 compatible = "myclocktype";
>                 #clock-cells = <1>;
>                 clock-indices = <1>, <3>;
>                 clock-output-names = "clka", "clkb";
>         };
>
>         consumer {
>                 compatible = "myclockconsumer";
>                 clocks = <&oscillator 0>, <&oscillator 1>;
>         };
>
> Currently, of_clk_get_parent_name(consumer_np, 0) returns "clka"
> (and of_clk_get_parent_name(consumer_np, 1) also returns "clka",
> this is correct).   Because the "clock-indices" in the clock parent
> does not contain <0>, of_clk_get_parent_name(consumer_np, 0) should
> return NULL.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>



I've sent v2 to linux-gpio@vger.kernel.org by mistake.

My intention was to send it linux-clk@vger.kernel.org.


Sorry, Linus Walleij.




-- 
Best Regards
Masahiro Yamada
