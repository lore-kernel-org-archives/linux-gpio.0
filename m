From: Lars Persson <lars.persson@axis.com>
Subject: Re: [PATCH 02/17] pinctrl: artpec6: constify pinconf_ops,
 pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 14:31:14 +0200
Message-ID: <41b88970-c34a-efb0-e2ce-c26ac918390e@axis.com>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
 <1502359589-15970-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bes.se.axis.com ([195.60.68.10]:41900 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752091AbdHJMb0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Aug 2017 08:31:26 -0400
In-Reply-To: <1502359589-15970-3-git-send-email-Julia.Lawall@lip6.fr>
Content-Language: sv
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Jesper Nilsson <jespern@axis.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org



On 08/10/2017 12:06 PM, Julia Lawall wrote:
> This pinctrl_ops structure is only stored in the const pctlops
> field of a pinctrl_desc structure. Make the pinctrl_ops structure
> const as well.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>   drivers/pinctrl/pinctrl-artpec6.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  

Hi,

Acked-by: Lars Persson <lars.persson@axis.com>

BR,
  Lars
