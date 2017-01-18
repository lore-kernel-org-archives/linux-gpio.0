From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 1/5] gpio: davinci: Remove gpio2regs function to
 accommodate multi instances
Date: Thu, 19 Jan 2017 00:17:40 +0100
Message-ID: <CACRpkdYfGNJqz7H2iyvL=WYpV78LaG7c+-kAgBUAnG0BvJDD3w@mail.gmail.com>
References: <1484669955-5349-1-git-send-email-j-keerthy@ti.com> <1484669955-5349-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484669955-5349-2-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 17, 2017 at 5:19 PM, Keerthy <j-keerthy@ti.com> wrote:

> gpio2regs is written making an assumption that driver supports only
> one instance of gpio controller. Removing this and adding a generic
> array so as to support multiple instances of gpio controllers.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>
> Changes in v2:
>
>   * Added a comment to explain divide by 2 logic for register sets.

Patch applied.

Yours,
Linus Walleij
