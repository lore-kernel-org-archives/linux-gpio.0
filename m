Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCE4C83F10
	for <linux-gpio@archiver.kernel.org>; Sun, 27 Aug 2023 10:34:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjH0Kde (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 27 Aug 2023 06:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjH0KdQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Aug 2023 06:33:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7FED8
        for <linux-gpio@vger.kernel.org>; Sun, 27 Aug 2023 03:33:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CDC86148F
        for <linux-gpio@vger.kernel.org>; Sun, 27 Aug 2023 10:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92221C433C7;
        Sun, 27 Aug 2023 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693132392;
        bh=sANaBJsu9MUxCeR6mbhC5kK4bakw14h8fZPDowZ0meU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EdKYS1aqAbXFiwMK8pIiuhUolMTeJRjBG9Ol6nxWZEafNvirjc+JaCogW62ODu7z/
         UFtIp048CA9PEfVeyF4xkzCR4yQb8TIW7SSCmhCXwWzBE1Bl1HfbEoZAHTcDgmEtG7
         99EuMzJh0sehI2y0AkTwqMqEDKkmwQJbwnsAOh38zWoFAYqbYdGWzuqKgHihtCs3gI
         QeUZQPIDmuZxz/nHixiDwqvk/sJgbsJ/zrrcykWlokEgAaDlV2gYwjW6lts6+cemhO
         FYrgmnZLRk9npHpnJTeLDnH/Ojyqo7fE87+KGQIfWxdWhKTrATQ7FIw/3mVmW/NI0/
         ADdYIiUqc+kqg==
Date:   Sun, 27 Aug 2023 18:21:25 +0800
From:   Jisheng Zhang <jszhang@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: berlin: Drop superfluous ampersands
Message-ID: <ZOsjpRJYE0nGpmSx@xhacker>
References: <0ff17be9b31c9fcf03481c0665293b98ced741f7.1692871243.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ff17be9b31c9fcf03481c0665293b98ced741f7.1692871243.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 12:05:50PM +0200, Geert Uytterhoeven wrote:
> There is no need to use an ampersand to take the address of a function.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

Hi Linus Walleij,

If it's not too late, could you please merge it?

Thanks in advance

> ---
>  drivers/pinctrl/berlin/berlin.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
> index 1e427ea4d31bcbfc..9550cc8095c28720 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -96,10 +96,10 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
>  }
>  
>  static const struct pinctrl_ops berlin_pinctrl_ops = {
> -	.get_groups_count	= &berlin_pinctrl_get_group_count,
> -	.get_group_name		= &berlin_pinctrl_get_group_name,
> -	.dt_node_to_map		= &berlin_pinctrl_dt_node_to_map,
> -	.dt_free_map		= &pinctrl_utils_free_map,
> +	.get_groups_count	= berlin_pinctrl_get_group_count,
> +	.get_group_name		= berlin_pinctrl_get_group_name,
> +	.dt_node_to_map		= berlin_pinctrl_dt_node_to_map,
> +	.dt_free_map		= pinctrl_utils_free_map,
>  };
>  
>  static int berlin_pinmux_get_functions_count(struct pinctrl_dev *pctrl_dev)
> -- 
> 2.34.1
> 
