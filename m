From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [RFC v1 2/9] gpio: introduce GPIO_DAVINCI kconfig option
Date: Fri, 29 Nov 2013 10:48:46 -0500
Message-ID: <5298B75E.3080104@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com> <1385494815-15740-3-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385494815-15740-3-git-send-email-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, nsekhar@ti.com, prabhakar.csengg@gmail.com, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com
List-Id: linux-gpio@vger.kernel.org

On Tuesday 26 November 2013 02:40 PM, Grygorii Strashko wrote:
> The compatible to Davinci GPIO HW block is used by other TI SoCs, like
> Keystone, where GPIO support is declared as optional.
> 
> Hence, introduce GPIO_DAVINCI Kconfig option which will allow to enable
> Davinci GPIO driver for Keystone SoCs when needed. At same time, kept
> Davinci GPIO driver enabled for Davinci SoCs by default.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
Already acked
