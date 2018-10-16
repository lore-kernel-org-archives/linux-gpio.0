From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: Remove unused 'irqchip' argument to gpiochip_set_cascaded_irqchip()
Date: Tue, 16 Oct 2018 09:29:59 +0200
Message-ID: <CACRpkdYmzRHcF=Bap=zjMoFRuEobqBibChQVCNiD0XrE+Kc_nw@mail.gmail.com>
References: <20181008163216.97436-1-swboyd@chromium.org> <20181008163216.97436-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008163216.97436-4-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, evgreen@chromium.org, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 8, 2018 at 6:32 PM Stephen Boyd <swboyd@chromium.org> wrote:

> This argument hasn't ever been used since it was introduced in commit
> 1425052097b5 ("gpio: add IRQ chip helpers in gpiolib"). Let's drop it to
> reduce reading confusion.
>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Patch applied. Good catch.

Yours,
Linus Walleij
