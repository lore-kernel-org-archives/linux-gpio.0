From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx1-core: add missing of_node_put
Date: Tue, 17 Nov 2015 15:02:20 +0100
Message-ID: <CACRpkdaR1Xi9CU4OY6joCugsAeO5g-sVq1Z3PRBJR1VK_W+ayQ@mail.gmail.com>
References: <20151115040422.GA15180@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36433 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753875AbbKQOCV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 09:02:21 -0500
Received: by obdgf3 with SMTP id gf3so6967102obd.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 06:02:21 -0800 (PST)
In-Reply-To: <20151115040422.GA15180@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Nov 15, 2015 at 5:04 AM, Vaishali Thakkar
<vthakkar1994@gmail.com> wrote:

> for_each_child_of_node performs an of_node_get on each iteration,
> so of_node_put is required on break out of the loop.
>
> This is done using Coccinelle. And semantic patch used for this is
> as follows:
>
> @@
> expression root,e;
> local idexpression child;
> @@
>
>  for_each_child_of_node(root, child) {
>    ... when != of_node_put(child)
>        when != e = child
> (
>    return child;
> |
> +  of_node_put(child);
> ?  return ...;
> )
>    ...
>  }
>
> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>

Patch applied for fixes, thanks!

Yours,
Linus Walleij
