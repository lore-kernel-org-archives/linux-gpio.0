From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] gpio: msm: Remove empty msm_gpio_{request,free}()
Date: Wed, 01 Jul 2015 10:40:25 -0700
Message-ID: <55942609.6020804@codeaurora.org>
References: <1435753639-13627-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1435753639-13627-1-git-send-email-geert+renesas@glider.be>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On 07/01/2015 05:27 AM, Geert Uytterhoeven wrote:
> gpio_chip.request() and gpio_chip.free() are optional, and can just be
> left unimplemented.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested due to lack of hardware.

Actually we should just delete this driver now that we have an msm8660
pinctrl implementation.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
