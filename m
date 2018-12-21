From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: mark PM functions as __maybe_unused
Date: Fri, 21 Dec 2018 11:07:40 +0100
Message-ID: <CACRpkdYOU1-8Cj9zfYQ7i_gGhM-NrYcQOiZbJC=rdZKxPs_q+w@mail.gmail.com>
References: <20181210205955.3254660-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210205955.3254660-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Timur Tabi <timur@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Evan Green <evgreen@chromium.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 10, 2018 at 9:59 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Without CONFIG_PM_SLEEP, we get annoyting warnings about unused functions:
>
> drivers/pinctrl/qcom/pinctrl-msm.c:1082:12: error: 'msm_pinctrl_resume' defined but not used [-Werror=unused-function]
>  static int msm_pinctrl_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:1075:12: error: 'msm_pinctrl_suspend' defined but not used [-Werror=unused-function]
>  static int msm_pinctrl_suspend(struct device *dev)
>
> Mark them as __maybe_unused to shut up the warning and silently drop
> the functions without having to add ugly #ifdefs.
>
> Fixes: 977d057ad346 ("pinctrl: msm: Add sleep pinctrl state transitions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied w/ACKs and fixing a typo.

Yours,
Linus Walleij
