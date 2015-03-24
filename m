From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH] gpio: syscon: reduce message level when direction reg
 offset not in dt
Date: Tue, 24 Mar 2015 13:52:10 -0700
Message-ID: <5511CE7A.6040809@oracle.com>
References: <20150324161358.GA694@kahuna> <1427222562-2223-1-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:36534 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212AbbCXUwc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2015 16:52:32 -0400
In-Reply-To: <1427222562-2223-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: grygorii.strashko@linaro.org, linux@arm.linux.org.uk, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: m-karicheri2@ti.com, ssantosh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/24/2015 11:42 AM, grygorii.strashko@linaro.org wrote:
> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>
> Now GPIO syscon driver produces bunch of warnings during the
> boot of Kesytone 2 SoCs:
>   gpio-syscon soc:keystone_dsp_gpio@02620240: can't read the dir register offset!
>   gpio-syscon soc:keystone_dsp_gpio@2620244: can't read the dir register offset!
>
> This message unintentionally was added using dev_err(), but its
> actual log level is debug, because third cell of "ti,syscon-dev" is
> optional.
>
> Hence change it to dev_dbg() as it should be.
>
> This patch fixes commit:
>   5a3e3f8 ("gpio: syscon: retriave syscon node and regs offsets from dt")
>
> Reported-by: Russell King <linux@arm.linux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
> ---
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
