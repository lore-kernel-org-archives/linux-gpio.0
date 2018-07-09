From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: Document pin_config_group_get() return codes
 like pin_config_get()
Date: Mon, 9 Jul 2018 13:09:47 +0200
Message-ID: <CACRpkdZo4fBkP8ooWna5_5Bwg4Q9qG8O5p-NwKS7XbrGNXE6dw@mail.gmail.com>
References: <20180702225939.109169-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702225939.109169-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 3, 2018 at 1:00 AM Douglas Anderson <dianders@chromium.org> wrote:

> The pinconf_generic_dump_one() function makes the assumption that
> pin_config_group_get() should return -EINVAL and -ENOTSUPP just like
> pin_config_get() does.  Document that so it's more obvious.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Patch applied!

Yours,
Linus Walleij
