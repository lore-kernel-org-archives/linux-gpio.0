From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] clk: let of_clk_get_parent_name() fail for invalid clock-indices
Date: Tue, 1 Dec 2015 11:48:03 +0900
Message-ID: <CAK7LNAT5Q+MVj8KvT_WMwtAFhFN5Q6yXk6vY9oNpoBtEBs-C6Q@mail.gmail.com>
References: <1448873164-22415-1-git-send-email-yamada.masahiro@socionext.com>
	<20151201005802.GE17532@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:25576 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751837AbbLACs0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 30 Nov 2015 21:48:26 -0500
In-Reply-To: <20151201005802.GE17532@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,


2015-12-01 9:58 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 11/30, Masahiro Yamada wrote:
>> Currently, of_clk_get_parent_name() returns a wrong parent clock name
>> when "clock-indices" property exists and the target index is not
>> found in the property.  In this case, NULL should be returned.
>>
>> For example,
>>
>>         oscillator {
>>                 compatible = "myclocktype";
>>                 #clock-cells = <1>;
>>                 clock-indices = <1>, <3>;
>>                 clock-output-names = "clka", "clkb";
>>         };
>>
>>         consumer {
>>                 compatible = "myclockconsumer";
>>                 clocks = <&oscillator 0>, <&oscillator 1>;
>>         };
>>
>> Currently, of_clk_get_parent_name(consumer_np, 0) returns "clka"
>> (and of_clk_get_parent_name(consumer_np, 1) also returns "clka",
>> this is correct).   Because the "clock-indices" in the clock parent
>> does not contain <0>, of_clk_get_parent_name(consumer_np, 0) should
>> return NULL.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Here's the proposed alternative, if you agree I will merge it
> with the above commit text and attribution to you.
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index a66efc9d8bfc..f54583a9835a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3079,6 +3079,9 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>                 }
>                 count++;
>         }
> +       /* We went off the end of 'clock-indices' without finding it */
> +       if (!vp && count)
> +               return NULL;
>
>         if (of_property_read_string_index(clkspec.np, "clock-output-names",
>                                           index,
>

No, again.
The existence of "clock-indices" should be checked
in order to omit the zero-length "clock-indices".


OK, let me guess the next alternative from you.


> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3079,6 +3079,9 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>                 }
>                 count++;
>         }
> +       /* We went off the end of 'clock-indices' without finding it */
> +       if (prop && !vp)
> +               return NULL;
>
>         if (of_property_read_string_index(clkspec.np, "clock-output-names",
>                                           index,
>

This works, but clumsy things are:

[1] If the "clock-indices" is missing, we can know it
     before looping around the of_property_for_each_u32().
     Checking the "prop" after the loop seems odd.

[2] "prop" and "vp" seem to be temporary storage that we should not
     know what they exactly are, like the auxiliary pointer in
list_for_each_safe().


Why do you insist on of_property_for_each_u32()?
It no longer fits in here.


-- 
Best Regards
Masahiro Yamada
