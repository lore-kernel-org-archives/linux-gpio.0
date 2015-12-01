From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: let of_clk_get_parent_name() fail for invalid
 clock-indices
Date: Tue, 1 Dec 2015 00:40:48 -0800
Message-ID: <20151201084048.GC26865@codeaurora.org>
References: <1448873164-22415-1-git-send-email-yamada.masahiro@socionext.com>
 <20151201005802.GE17532@codeaurora.org>
 <CAK7LNAT5Q+MVj8KvT_WMwtAFhFN5Q6yXk6vY9oNpoBtEBs-C6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55887 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753697AbbLAIku (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 03:40:50 -0500
Content-Disposition: inline
In-Reply-To: <CAK7LNAT5Q+MVj8KvT_WMwtAFhFN5Q6yXk6vY9oNpoBtEBs-C6Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 12/01, Masahiro Yamada wrote:
> 2015-12-01 9:58 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> > Here's the proposed alternative, if you agree I will merge it
> > with the above commit text and attribution to you.
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index a66efc9d8bfc..f54583a9835a 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -3079,6 +3079,9 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
> >                 }
> >                 count++;
> >         }
> > +       /* We went off the end of 'clock-indices' without finding it */
> > +       if (!vp && count)
> > +               return NULL;
> >
> >         if (of_property_read_string_index(clkspec.np, "clock-output-names",
> >                                           index,
> >
> 
> No, again.
> The existence of "clock-indices" should be checked
> in order to omit the zero-length "clock-indices".
> 

Ah I missed that one. All these corner cases for broken DTs. Too
bad we don't have that DT validator.

> 
> OK, let me guess the next alternative from you.
> 
> 
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -3079,6 +3079,9 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
> >                 }
> >                 count++;
> >         }
> > +       /* We went off the end of 'clock-indices' without finding it */
> > +       if (prop && !vp)
> > +               return NULL;
> >
> >         if (of_property_read_string_index(clkspec.np, "clock-output-names",
> >                                           index,
> >

Cool, we can go faster now.

> 
> This works, but clumsy things are:
> 
> [1] If the "clock-indices" is missing, we can know it
>      before looping around the of_property_for_each_u32().
>      Checking the "prop" after the loop seems odd.

The of_property_for_each_u32 macro will do pretty much the same
work that you've done in your patch. So we're not going to go
around the loop at all in this case, we're just going to get the
property like you've done, and then of_prop_next_u32() is going
to return NULL and we'll never enter the loop.

Checking the property again is sort of odd, but we do similar
sorts of checks at the end of loops in other places in the
kernel, so it isn't out of the ordinary.

> 
> [2] "prop" and "vp" seem to be temporary storage that we should not
>      know what they exactly are, like the auxiliary pointer in
> list_for_each_safe().

True. In those cases, we check for list emptiness before
iterating over it with the list helper macros. So it sounds like
we should do that here as well.

> 
> 
> Why do you insist on of_property_for_each_u32()?
> It no longer fits in here.
> 

Sure. The other problem is be32_to_cpup() usage. I'd rather that
we use the style of looping that of_property_for_each_u32 does.
It doesn't make any assumptions about how the data is in memory.
Instead we call the iterator function and it gets the next value.

So here's another try, that open codes the macro so we can add
our count inside and check for a boolean property without
duplication.

----8<----

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a66efc9d8bfc..a2112cdab191 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3059,6 +3059,7 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 	u32 pv;
 	int rc;
 	int count;
+	int len;
 	struct clk *clk;
 
 	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
@@ -3067,18 +3068,24 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 		return NULL;
 
 	index = clkspec.args_count ? clkspec.args[0] : 0;
-	count = 0;
+	len = 0;
 
-	/* if there is an indices property, use it to transfer the index
+	/*
+	 * if there is an indices property, use it to transfer the index
 	 * specified into an array offset for the clock-output-names property.
 	 */
-	of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
+	prop = of_find_property(clkspec.np, "clock-indices", &len);
+	for (vp = of_prop_next_u32(prop, NULL, &pv), count = 0;
+	     vp;
+	     vp = of_prop_next_u32(prop, vp, &pv), count++) {
 		if (index == pv) {
 			index = count;
 			break;
 		}
-		count++;
 	}
+	/* We went off the end of 'clock-indices' without finding it */
+	if (prop && count == len / sizeof(u32))
+		return NULL;
 
 	if (of_property_read_string_index(clkspec.np, "clock-output-names",
 					  index,
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
