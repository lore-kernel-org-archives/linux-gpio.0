From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: let of_clk_get_parent_name() fail for invalid
 clock-indices
Date: Mon, 30 Nov 2015 16:58:02 -0800
Message-ID: <20151201005802.GE17532@codeaurora.org>
References: <1448873164-22415-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34722 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbbLAA6E (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 19:58:04 -0500
Content-Disposition: inline
In-Reply-To: <1448873164-22415-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/30, Masahiro Yamada wrote:
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

Here's the proposed alternative, if you agree I will merge it
with the above commit text and attribution to you.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a66efc9d8bfc..f54583a9835a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3079,6 +3079,9 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 		}
 		count++;
 	}
+	/* We went off the end of 'clock-indices' without finding it */
+	if (!vp && count)
+		return NULL;
 
 	if (of_property_read_string_index(clkspec.np, "clock-output-names",
 					  index,

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
