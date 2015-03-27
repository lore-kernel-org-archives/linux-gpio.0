From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: pinconf-generic: scan also referenced
 phandle node
Date: Fri, 27 Mar 2015 09:52:10 +0100
Message-ID: <CACRpkdYFY6Lavx6hu9gUO0KHL6yQv_N6FpqpDRtuRznfqPmthQ@mail.gmail.com>
References: <a7b25eb6f4fd888e9ac600959cf4216ffa11921e.1426796262.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34295 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752624AbbC0IwL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2015 04:52:11 -0400
Received: by oigz129 with SMTP id z129so25856262oig.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2015 01:52:10 -0700 (PDT)
In-Reply-To: <a7b25eb6f4fd888e9ac600959cf4216ffa11921e.1426796262.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 19, 2015 at 9:17 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Make pinconf_generic_dt_node_to_map() also scan the dt pin configuration node
> directly referenced by phandle, not only its child nodes.
>
> The "parent scan" feature needs a few other changes:
>
>    * Move the pinconf_generic_dt_node_to_map() error handling code to a common
>      place, under the 'exit' label.
>
>    * Move the pins/groups strings count earlier in
>      pinconf_generic_dt_subnode_to_map(), to allow us to bail out early when
>      these properties are missing or wrong
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

phandle? Is's the parent node right?

Patch applied anyway, the code looks exactly like what I wanted.

Yours,
Linus Walleij
