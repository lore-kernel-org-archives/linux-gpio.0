From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ssbi-gpio: constify gpio_chip structure
Date: Tue, 11 Jul 2017 14:42:49 -0700
Message-ID: <20170711214249.GD20973@minitux>
References: <20170711183950.GA26899@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:35314 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934030AbdGKVmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jul 2017 17:42:53 -0400
Received: by mail-pf0-f180.google.com with SMTP id c73so2341264pfk.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jul 2017 14:42:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170711183950.GA26899@embeddedgus>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue 11 Jul 11:39 PDT 2017, Gustavo A. R. Silva wrote:

[..]
> before:
>    text    data     bss     dec     hex filename
>   17061    6992       0   24053    5df5 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.o
> 
> after:
>    text    data     bss     dec     hex filename
>   16777    6904       0   23681    5c81 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.o
> 
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
