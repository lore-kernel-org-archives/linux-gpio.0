From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] [v2] pinctrl: qcom: add get_direction function
Date: Mon, 13 Feb 2017 12:50:47 -0800
Message-ID: <34a3143d-585d-7786-1b55-650b3bdfe006@codeaurora.org>
References: <1486769959-22930-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:35042 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752444AbdBMUut (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2017 15:50:49 -0500
In-Reply-To: <1486769959-22930-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 02/10/2017 03:39 PM, Timur Tabi wrote:
> The get_direction callback function allows gpiolib to know the current
> direction (input vs output) for a given GPIO.
>
> This is particularly useful on ACPI systems, where the GPIOs are
> configured only by firmware (typically UEFI), so the only way to
> know the initial values to query the hardware directly.  Without
> this function, gpiolib thinks that all GPIOs are configured for
> input.
>
> Signed-off-by: Timur Tabi <timur@codeaurora.org>

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

